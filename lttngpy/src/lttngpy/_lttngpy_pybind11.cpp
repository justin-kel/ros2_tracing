// Copyright 2023 Apex.AI, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

#include "lttngpy/config.hpp"

#ifndef LTTNGPY_DISABLED
#  include <lttng/lttng.h>
#endif  // LTTNGPY_DISABLED
#include <pybind11/pybind11.h>
#include <pybind11/stl.h>

#ifndef LTTNGPY_DISABLED
#  include "lttngpy/channel.hpp"
#  include "lttngpy/event.hpp"
#  include "lttngpy/lttng.hpp"
#  include "lttngpy/session.hpp"
#endif  // LTTNGPY_DISABLED
#include "lttngpy/status.hpp"

namespace py = pybind11;

PYBIND11_MODULE(_lttngpy_pybind11, m) {
  /**
   * Some lttng-ctl functions and constants are directly exposed, others are wrapped (e.g., to make
   * the interface more Pythonic/use Python types) and the wrapper functions are exposed. The
   * exposed lttng-ctl functions and constants usually start with lttng_* or LTTNG_*, respectively.
   */
  m.doc() = "LTTng trace control bindings";

  // Status
  m.def(
    "is_available",
    &lttngpy::is_available,
    "Check if lttng-ctl is available. If False, then no other functions are available.");

#ifndef LTTNGPY_DISABLED
  // General
  m.attr("LTTNG_CTL_VERSION") = LTTNG_CTL_VERSION;

  // Session daemon
  m.def(
    "lttng_session_daemon_alive",
    &lttng_session_daemon_alive,
    "Check if a session daemon is alive.");
  m.def(
    "is_lttng_session_daemon_alive",
    &lttngpy::is_lttng_session_daemon_alive,
    "Check if a session daemon is alive.");

  // Session creation/destruction
  m.def(
    "lttng_create_session",
    &lttng_create_session,
    "Create session.",
    py::kw_only(),
    py::arg("session_name"),
    py::arg("url"));

  m.def(
      "lttng_create_session_live",
      &lttng_create_session_live,
      "Create a session exclusively used for live reading.",
      py::arg("session_name"),
      py::arg("url"),
      py::arg("timer_interval") = 1000000);

  m.def(
    "lttng_destroy_session",
    &lttng_destroy_session,
    "Destroy session.",
    py::kw_only(),
    py::arg("session_name"));
  m.def(
    "destroy_all_sessions",
    &lttngpy::destroy_all_sessions,
    "Destroy all sessions.");

  // Session control
  m.def(
    "lttng_start_tracing",
    &lttng_start_tracing,
    "Start tracing.",
    py::kw_only(),
    py::arg("session_name"));
  m.def(
    "lttng_stop_tracing",
    &lttng_stop_tracing,
    "Stop tracing.",
    py::kw_only(),
    py::arg("session_name"));

  // Session info
  m.def(
    "get_session_names",
    &lttngpy::get_session_names,
    "Get the currently-existing session names.");

  // Domain
  py::enum_<lttng_domain_type>(m, "lttng_domain_type")
  .value("LTTNG_DOMAIN_NONE", LTTNG_DOMAIN_NONE)
  .value("LTTNG_DOMAIN_KERNEL", LTTNG_DOMAIN_KERNEL)
  .value("LTTNG_DOMAIN_UST", LTTNG_DOMAIN_UST)
  .value("LTTNG_DOMAIN_JUL", LTTNG_DOMAIN_JUL)
  .value("LTTNG_DOMAIN_LOG4J", LTTNG_DOMAIN_LOG4J)
  .value("LTTNG_DOMAIN_PYTHON", LTTNG_DOMAIN_PYTHON)
  .export_values();
  py::enum_<lttng_buffer_type>(m, "lttng_buffer_type")
  .value("LTTNG_BUFFER_PER_PID", LTTNG_BUFFER_PER_PID)
  .value("LTTNG_BUFFER_PER_UID", LTTNG_BUFFER_PER_UID)
  .value("LTTNG_BUFFER_GLOBAL", LTTNG_BUFFER_GLOBAL)
  .export_values();

  // Channel
  m.def(
    "enable_channel",
    &lttngpy::enable_channel,
    "Enable channel.",
    py::kw_only(),
    py::arg("session_name"),
    py::arg("domain_type"),
    py::arg("buffer_type"),
    py::arg("channel_name"),
    py::arg("overwrite"),
    py::arg("subbuf_size"),
    py::arg("num_subbuf"),
    py::arg("switch_timer_interval"),
    py::arg("read_timer_interval"),
    py::arg("output"));

  // Event
  py::enum_<lttng_event_output>(m, "lttng_event_output")
  .value("LTTNG_EVENT_SPLICE", LTTNG_EVENT_SPLICE)
  .value("LTTNG_EVENT_MMAP", LTTNG_EVENT_MMAP)
  .export_values();
  m.def(
    "enable_events",
    &lttngpy::enable_events,
    "Enable event.",
    py::kw_only(),
    py::arg("session_name"),
    py::arg("domain_type"),
    py::arg("channel_name"),
    py::arg("events"));
  m.def(
    "get_tracepoints",
    &lttngpy::get_tracepoints,
    "Get tracepoints.",
    py::kw_only(),
    py::arg("domain_type"));
  m.def(
    "add_contexts",
    &lttngpy::add_contexts,
    "Add contexts.",
    py::kw_only(),
    py::arg("session_name"),
    py::arg("domain_type"),
    py::arg("channel_name"),
    py::arg("context_fields"));

  // Error
  m.def(
    "lttng_strerror",
    &lttng_strerror,
    "Get string representation of (negative) error code.",
    py::arg("code"));
  py::enum_<lttng_error_code>(m, "lttng_error_code")
  .value("LTTNG_OK", LTTNG_OK)
  .value("LTTNG_ERR_UNK", LTTNG_ERR_UNK)
  .value("LTTNG_ERR_UND", LTTNG_ERR_UND)
  .value("LTTNG_ERR_SESSION_STARTED", LTTNG_ERR_SESSION_STARTED)
  .value("LTTNG_ERR_UNKNOWN_DOMAIN", LTTNG_ERR_UNKNOWN_DOMAIN)
  .value("LTTNG_ERR_NOT_SUPPORTED", LTTNG_ERR_NOT_SUPPORTED)
  .value("LTTNG_ERR_NO_SESSION", LTTNG_ERR_NO_SESSION)
  .value("LTTNG_ERR_CREATE_DIR_FAIL", LTTNG_ERR_CREATE_DIR_FAIL)
  .value("LTTNG_ERR_SESSION_FAIL", LTTNG_ERR_SESSION_FAIL)
  .value("LTTNG_ERR_NO_SESSIOND", LTTNG_ERR_NO_SESSIOND)
  .value("LTTNG_ERR_SET_URL", LTTNG_ERR_SET_URL)
  .value("LTTNG_ERR_URL_EXIST", LTTNG_ERR_URL_EXIST)
  .value("LTTNG_ERR_BUFFER_NOT_SUPPORTED", LTTNG_ERR_BUFFER_NOT_SUPPORTED)
  .value("LTTNG_ERR_SESS_NOT_FOUND", LTTNG_ERR_SESS_NOT_FOUND)
  .value("LTTNG_ERR_BUFFER_TYPE_MISMATCH", LTTNG_ERR_BUFFER_TYPE_MISMATCH)
  .value("LTTNG_ERR_FATAL", LTTNG_ERR_FATAL)
  .value("LTTNG_ERR_NOMEM", LTTNG_ERR_NOMEM)
  .value("LTTNG_ERR_SELECT_SESS", LTTNG_ERR_SELECT_SESS)
  .value("LTTNG_ERR_EXIST_SESS", LTTNG_ERR_EXIST_SESS)
  .value("LTTNG_ERR_NO_EVENT", LTTNG_ERR_NO_EVENT)
  .value("LTTNG_ERR_CONNECT_FAIL", LTTNG_ERR_CONNECT_FAIL)
  .value("LTTNG_ERR_SNAPSHOT_OUTPUT_EXIST", LTTNG_ERR_SNAPSHOT_OUTPUT_EXIST)
  .value("LTTNG_ERR_EPERM", LTTNG_ERR_EPERM)
  .value("LTTNG_ERR_KERN_NA", LTTNG_ERR_KERN_NA)
  .value("LTTNG_ERR_KERN_VERSION", LTTNG_ERR_KERN_VERSION)
  .value("LTTNG_ERR_KERN_EVENT_EXIST", LTTNG_ERR_KERN_EVENT_EXIST)
  .value("LTTNG_ERR_KERN_SESS_FAIL", LTTNG_ERR_KERN_SESS_FAIL)
  .value("LTTNG_ERR_KERN_CHAN_EXIST", LTTNG_ERR_KERN_CHAN_EXIST)
  .value("LTTNG_ERR_KERN_CHAN_FAIL", LTTNG_ERR_KERN_CHAN_FAIL)
  .value("LTTNG_ERR_KERN_CHAN_NOT_FOUND", LTTNG_ERR_KERN_CHAN_NOT_FOUND)
  .value("LTTNG_ERR_KERN_CHAN_DISABLE_FAIL", LTTNG_ERR_KERN_CHAN_DISABLE_FAIL)
  .value("LTTNG_ERR_KERN_CHAN_ENABLE_FAIL", LTTNG_ERR_KERN_CHAN_ENABLE_FAIL)
  .value("LTTNG_ERR_KERN_CONTEXT_FAIL", LTTNG_ERR_KERN_CONTEXT_FAIL)
  .value("LTTNG_ERR_KERN_ENABLE_FAIL", LTTNG_ERR_KERN_ENABLE_FAIL)
  .value("LTTNG_ERR_KERN_DISABLE_FAIL", LTTNG_ERR_KERN_DISABLE_FAIL)
  .value("LTTNG_ERR_KERN_META_FAIL", LTTNG_ERR_KERN_META_FAIL)
  .value("LTTNG_ERR_KERN_START_FAIL", LTTNG_ERR_KERN_START_FAIL)
  .value("LTTNG_ERR_KERN_STOP_FAIL", LTTNG_ERR_KERN_STOP_FAIL)
  .value("LTTNG_ERR_KERN_CONSUMER_FAIL", LTTNG_ERR_KERN_CONSUMER_FAIL)
  .value("LTTNG_ERR_KERN_STREAM_FAIL", LTTNG_ERR_KERN_STREAM_FAIL)
  .value("LTTNG_ERR_START_SESSION_ONCE", LTTNG_ERR_START_SESSION_ONCE)
  .value("LTTNG_ERR_SNAPSHOT_FAIL", LTTNG_ERR_SNAPSHOT_FAIL)
  .value("LTTNG_ERR_NO_STREAM", LTTNG_ERR_NO_STREAM)
  .value("LTTNG_ERR_KERN_LIST_FAIL", LTTNG_ERR_KERN_LIST_FAIL)
  .value("LTTNG_ERR_UST_CALIBRATE_FAIL", LTTNG_ERR_UST_CALIBRATE_FAIL)
  .value("LTTNG_ERR_UST_EVENT_ENABLED", LTTNG_ERR_UST_EVENT_ENABLED)
  .value("LTTNG_ERR_UST_SESS_FAIL", LTTNG_ERR_UST_SESS_FAIL)
  .value("LTTNG_ERR_UST_CHAN_EXIST", LTTNG_ERR_UST_CHAN_EXIST)
  .value("LTTNG_ERR_UST_CHAN_FAIL", LTTNG_ERR_UST_CHAN_FAIL)
  .value("LTTNG_ERR_UST_CHAN_NOT_FOUND", LTTNG_ERR_UST_CHAN_NOT_FOUND)
  .value("LTTNG_ERR_UST_CHAN_DISABLE_FAIL", LTTNG_ERR_UST_CHAN_DISABLE_FAIL)
  .value("LTTNG_ERR_UST_CHAN_ENABLE_FAIL", LTTNG_ERR_UST_CHAN_ENABLE_FAIL)
  .value("LTTNG_ERR_CHAN_EXIST", LTTNG_ERR_CHAN_EXIST)
  .value("LTTNG_ERR_UST_ENABLE_FAIL", LTTNG_ERR_UST_ENABLE_FAIL)
  .value("LTTNG_ERR_UST_DISABLE_FAIL", LTTNG_ERR_UST_DISABLE_FAIL)
  .value("LTTNG_ERR_UST_META_FAIL", LTTNG_ERR_UST_META_FAIL)
  .value("LTTNG_ERR_UST_START_FAIL", LTTNG_ERR_UST_START_FAIL)
  .value("LTTNG_ERR_UST_STOP_FAIL", LTTNG_ERR_UST_STOP_FAIL)
  .value("LTTNG_ERR_UST_CONSUMER64_FAIL", LTTNG_ERR_UST_CONSUMER64_FAIL)
  .value("LTTNG_ERR_UST_CONSUMER32_FAIL", LTTNG_ERR_UST_CONSUMER32_FAIL)
  .value("LTTNG_ERR_UST_STREAM_FAIL", LTTNG_ERR_UST_STREAM_FAIL)
  .value("LTTNG_ERR_SNAPSHOT_NODATA", LTTNG_ERR_SNAPSHOT_NODATA)
  .value("LTTNG_ERR_NO_CHANNEL", LTTNG_ERR_NO_CHANNEL)
  .value("LTTNG_ERR_SESSION_INVALID_CHAR", LTTNG_ERR_SESSION_INVALID_CHAR)
  .value("LTTNG_ERR_UST_LIST_FAIL", LTTNG_ERR_UST_LIST_FAIL)
  .value("LTTNG_ERR_UST_EVENT_EXIST", LTTNG_ERR_UST_EVENT_EXIST)
  .value("LTTNG_ERR_UST_EVENT_NOT_FOUND", LTTNG_ERR_UST_EVENT_NOT_FOUND)
  .value("LTTNG_ERR_UST_CONTEXT_EXIST", LTTNG_ERR_UST_CONTEXT_EXIST)
  .value("LTTNG_ERR_UST_CONTEXT_INVAL", LTTNG_ERR_UST_CONTEXT_INVAL)
  .value("LTTNG_ERR_NEED_ROOT_SESSIOND", LTTNG_ERR_NEED_ROOT_SESSIOND)
  .value("LTTNG_ERR_TRACE_ALREADY_STARTED", LTTNG_ERR_TRACE_ALREADY_STARTED)
  .value("LTTNG_ERR_TRACE_ALREADY_STOPPED", LTTNG_ERR_TRACE_ALREADY_STOPPED)
  .value("LTTNG_ERR_KERN_EVENT_ENOSYS", LTTNG_ERR_KERN_EVENT_ENOSYS)
  .value("LTTNG_ERR_NEED_CHANNEL_NAME", LTTNG_ERR_NEED_CHANNEL_NAME)
  .value("LTTNG_ERR_NO_UST", LTTNG_ERR_NO_UST)
  .value("LTTNG_ERR_SAVE_FILE_EXIST", LTTNG_ERR_SAVE_FILE_EXIST)
  .value("LTTNG_ERR_SAVE_IO_FAIL", LTTNG_ERR_SAVE_IO_FAIL)
  .value("LTTNG_ERR_LOAD_INVALID_CONFIG", LTTNG_ERR_LOAD_INVALID_CONFIG)
  .value("LTTNG_ERR_LOAD_IO_FAIL", LTTNG_ERR_LOAD_IO_FAIL)
  .value("LTTNG_ERR_LOAD_SESSION_NOENT", LTTNG_ERR_LOAD_SESSION_NOENT)
  .value("LTTNG_ERR_MAX_SIZE_INVALID", LTTNG_ERR_MAX_SIZE_INVALID)
  .value("LTTNG_ERR_MI_OUTPUT_TYPE", LTTNG_ERR_MI_OUTPUT_TYPE)
  .value("LTTNG_ERR_MI_IO_FAIL", LTTNG_ERR_MI_IO_FAIL)
  .value("LTTNG_ERR_MI_NOT_IMPLEMENTED", LTTNG_ERR_MI_NOT_IMPLEMENTED)
  .value("LTTNG_ERR_INVALID", LTTNG_ERR_INVALID)
  .value("LTTNG_ERR_NO_USTCONSUMERD", LTTNG_ERR_NO_USTCONSUMERD)
  .value("LTTNG_ERR_NO_KERNCONSUMERD", LTTNG_ERR_NO_KERNCONSUMERD)
  .value("LTTNG_ERR_EVENT_EXIST_LOGLEVEL", LTTNG_ERR_EVENT_EXIST_LOGLEVEL)
  .value("LTTNG_ERR_URL_DATA_MISS", LTTNG_ERR_URL_DATA_MISS)
  .value("LTTNG_ERR_URL_CTRL_MISS", LTTNG_ERR_URL_CTRL_MISS)
  .value("LTTNG_ERR_ENABLE_CONSUMER_FAIL", LTTNG_ERR_ENABLE_CONSUMER_FAIL)
  .value("LTTNG_ERR_RELAYD_CONNECT_FAIL", LTTNG_ERR_RELAYD_CONNECT_FAIL)
  .value("LTTNG_ERR_RELAYD_VERSION_FAIL", LTTNG_ERR_RELAYD_VERSION_FAIL)
  .value("LTTNG_ERR_FILTER_INVAL", LTTNG_ERR_FILTER_INVAL)
  .value("LTTNG_ERR_FILTER_NOMEM", LTTNG_ERR_FILTER_NOMEM)
  .value("LTTNG_ERR_FILTER_EXIST", LTTNG_ERR_FILTER_EXIST)
  .value("LTTNG_ERR_NO_CONSUMER", LTTNG_ERR_NO_CONSUMER)
  .value("LTTNG_ERR_EXCLUSION_INVAL", LTTNG_ERR_EXCLUSION_INVAL)
  .value("LTTNG_ERR_EXCLUSION_NOMEM", LTTNG_ERR_EXCLUSION_NOMEM)
  .value("LTTNG_ERR_INVALID_EVENT_NAME", LTTNG_ERR_INVALID_EVENT_NAME)
  .value("LTTNG_ERR_INVALID_CHANNEL_NAME", LTTNG_ERR_INVALID_CHANNEL_NAME)
  .value("LTTNG_ERR_PROCESS_ATTR_EXISTS", LTTNG_ERR_PROCESS_ATTR_EXISTS)
  .value("LTTNG_ERR_PROCESS_ATTR_MISSING", LTTNG_ERR_PROCESS_ATTR_MISSING)
  .value("LTTNG_ERR_INVALID_CHANNEL_DOMAIN", LTTNG_ERR_INVALID_CHANNEL_DOMAIN)
  .value("LTTNG_ERR_OVERFLOW", LTTNG_ERR_OVERFLOW)
  .value("LTTNG_ERR_SESSION_NOT_STARTED", LTTNG_ERR_SESSION_NOT_STARTED)
  .value("LTTNG_ERR_LIVE_SESSION", LTTNG_ERR_LIVE_SESSION)
  .value("LTTNG_ERR_PER_PID_SESSION", LTTNG_ERR_PER_PID_SESSION)
  .value("LTTNG_ERR_KERN_CONTEXT_UNAVAILABLE", LTTNG_ERR_KERN_CONTEXT_UNAVAILABLE)
  .value("LTTNG_ERR_REGEN_STATEDUMP_FAIL", LTTNG_ERR_REGEN_STATEDUMP_FAIL)
  .value("LTTNG_ERR_REGEN_STATEDUMP_NOMEM", LTTNG_ERR_REGEN_STATEDUMP_NOMEM)
  .value("LTTNG_ERR_NOT_SNAPSHOT_SESSION", LTTNG_ERR_NOT_SNAPSHOT_SESSION)
  .value("LTTNG_ERR_INVALID_TRIGGER", LTTNG_ERR_INVALID_TRIGGER)
  .value("LTTNG_ERR_TRIGGER_EXISTS", LTTNG_ERR_TRIGGER_EXISTS)
  .value("LTTNG_ERR_TRIGGER_NOT_FOUND", LTTNG_ERR_TRIGGER_NOT_FOUND)
  .value("LTTNG_ERR_COMMAND_CANCELLED", LTTNG_ERR_COMMAND_CANCELLED)
  .value("LTTNG_ERR_ROTATION_PENDING", LTTNG_ERR_ROTATION_PENDING)
  .value("LTTNG_ERR_ROTATION_NOT_AVAILABLE", LTTNG_ERR_ROTATION_NOT_AVAILABLE)
  .value("LTTNG_ERR_ROTATION_SCHEDULE_SET", LTTNG_ERR_ROTATION_SCHEDULE_SET)
  .value("LTTNG_ERR_ROTATION_SCHEDULE_NOT_SET", LTTNG_ERR_ROTATION_SCHEDULE_NOT_SET)
  .value("LTTNG_ERR_ROTATION_MULTIPLE_AFTER_STOP", LTTNG_ERR_ROTATION_MULTIPLE_AFTER_STOP)
  .value("LTTNG_ERR_ROTATION_WRONG_VERSION", LTTNG_ERR_ROTATION_WRONG_VERSION)
  .value("LTTNG_ERR_NO_SESSION_OUTPUT", LTTNG_ERR_NO_SESSION_OUTPUT)
  .value("LTTNG_ERR_ROTATION_NOT_AVAILABLE_RELAY", LTTNG_ERR_ROTATION_NOT_AVAILABLE_RELAY)
  .value("LTTNG_ERR_AGENT_TRACING_DISABLED", LTTNG_ERR_AGENT_TRACING_DISABLED)
  .value("LTTNG_ERR_PROBE_LOCATION_INVAL", LTTNG_ERR_PROBE_LOCATION_INVAL)
  .value("LTTNG_ERR_ELF_PARSING", LTTNG_ERR_ELF_PARSING)
  .value("LTTNG_ERR_SDT_PROBE_SEMAPHORE", LTTNG_ERR_SDT_PROBE_SEMAPHORE)
  .value("LTTNG_ERR_ROTATION_FAIL_CONSUMER", LTTNG_ERR_ROTATION_FAIL_CONSUMER)
  .value("LTTNG_ERR_ROTATE_RENAME_FAIL_CONSUMER", LTTNG_ERR_ROTATE_RENAME_FAIL_CONSUMER)
  .value(
    "LTTNG_ERR_ROTATION_PENDING_LOCAL_FAIL_CONSUMER",
    LTTNG_ERR_ROTATION_PENDING_LOCAL_FAIL_CONSUMER)
  .value(
    "LTTNG_ERR_ROTATION_PENDING_RELAY_FAIL_CONSUMER",
    LTTNG_ERR_ROTATION_PENDING_RELAY_FAIL_CONSUMER)
  .value("LTTNG_ERR_MKDIR_FAIL_CONSUMER", LTTNG_ERR_MKDIR_FAIL_CONSUMER)
  .value("LTTNG_ERR_CHAN_NOT_FOUND", LTTNG_ERR_CHAN_NOT_FOUND)
  .value("LTTNG_ERR_SNAPSHOT_UNSUPPORTED", LTTNG_ERR_SNAPSHOT_UNSUPPORTED)
  .value("LTTNG_ERR_SESSION_NOT_EXIST", LTTNG_ERR_SESSION_NOT_EXIST)
  .value("LTTNG_ERR_CREATE_TRACE_CHUNK_FAIL_CONSUMER", LTTNG_ERR_CREATE_TRACE_CHUNK_FAIL_CONSUMER)
  .value("LTTNG_ERR_CLOSE_TRACE_CHUNK_FAIL_CONSUMER", LTTNG_ERR_CLOSE_TRACE_CHUNK_FAIL_CONSUMER)
  .value("LTTNG_ERR_TRACE_CHUNK_EXISTS_FAIL_CONSUMER", LTTNG_ERR_TRACE_CHUNK_EXISTS_FAIL_CONSUMER)
  .value("LTTNG_ERR_INVALID_PROTOCOL", LTTNG_ERR_INVALID_PROTOCOL)
  .value("LTTNG_ERR_FILE_CREATION_ERROR", LTTNG_ERR_FILE_CREATION_ERROR)
  .value("LTTNG_ERR_TIMER_STOP_ERROR", LTTNG_ERR_TIMER_STOP_ERROR)
  .value("LTTNG_ERR_ROTATION_NOT_AVAILABLE_KERNEL", LTTNG_ERR_ROTATION_NOT_AVAILABLE_KERNEL)
  .value("LTTNG_ERR_CLEAR_RELAY_DISALLOWED", LTTNG_ERR_CLEAR_RELAY_DISALLOWED)
  .value("LTTNG_ERR_CLEAR_NOT_AVAILABLE_RELAY", LTTNG_ERR_CLEAR_NOT_AVAILABLE_RELAY)
  .value("LTTNG_ERR_CLEAR_FAIL_CONSUMER", LTTNG_ERR_CLEAR_FAIL_CONSUMER)
  .value("LTTNG_ERR_ROTATION_AFTER_STOP_CLEAR", LTTNG_ERR_ROTATION_AFTER_STOP_CLEAR)
  .value("LTTNG_ERR_USER_NOT_FOUND", LTTNG_ERR_USER_NOT_FOUND)
  .value("LTTNG_ERR_GROUP_NOT_FOUND", LTTNG_ERR_GROUP_NOT_FOUND)
  .value("LTTNG_ERR_UNSUPPORTED_DOMAIN", LTTNG_ERR_UNSUPPORTED_DOMAIN)
  .value(
    "LTTNG_ERR_PROCESS_ATTR_TRACKER_INVALID_TRACKING_POLICY",
    LTTNG_ERR_PROCESS_ATTR_TRACKER_INVALID_TRACKING_POLICY)
  .value(
    "LTTNG_ERR_EVENT_NOTIFIER_GROUP_NOTIFICATION_FD",
    LTTNG_ERR_EVENT_NOTIFIER_GROUP_NOTIFICATION_FD)
  .value("LTTNG_ERR_INVALID_CAPTURE_EXPRESSION", LTTNG_ERR_INVALID_CAPTURE_EXPRESSION)
  .value("LTTNG_ERR_EVENT_NOTIFIER_REGISTRATION", LTTNG_ERR_EVENT_NOTIFIER_REGISTRATION)
  .value("LTTNG_ERR_EVENT_NOTIFIER_ERROR_ACCOUNTING", LTTNG_ERR_EVENT_NOTIFIER_ERROR_ACCOUNTING)
  .value(
    "LTTNG_ERR_EVENT_NOTIFIER_ERROR_ACCOUNTING_FULL",
    LTTNG_ERR_EVENT_NOTIFIER_ERROR_ACCOUNTING_FULL)
  .value("LTTNG_ERR_INVALID_ERROR_QUERY_TARGET", LTTNG_ERR_INVALID_ERROR_QUERY_TARGET)
  .value("LTTNG_ERR_BUFFER_FLUSH_FAILED", LTTNG_ERR_BUFFER_FLUSH_FAILED)
  .value("LTTNG_ERR_NR", LTTNG_ERR_NR)
  .value("LTTNG_ERR_PID_TRACKED", LTTNG_ERR_PID_TRACKED)
  .value("LTTNG_ERR_PID_NOT_TRACKED", LTTNG_ERR_PID_NOT_TRACKED)
  .export_values();
#endif  // LTTNGPY_DISABLED
}
