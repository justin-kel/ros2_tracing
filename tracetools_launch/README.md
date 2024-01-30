# Overview

## Quickstart

Open 3 terminals and follow the following steps

In terminal 1 run:

    lttng-relayd

In terminal 2 run: 

    ros2 launch tracetools_launch network_live_image_processing.launch.py
    # This requires you to have built and sourced the compressed_image_tools and yolo_v5_ros packages. Links to them will be added in the future.

In terminal 3 run: 

    babeltrace2 net://localhost/host/$HOSTNAME/image-tracing-session



## Explanation
A demonstration to run live tracing on a local machine has been included in 

    ./launch/network_live_image_processing.launch.py

Note the function arguments in the launch file for the Trace launch action.

    return LaunchDescription([
        Trace(
            session_name='image-tracing-session',
            base_path='net://localhost', 
            live=True,
            timer_interval=1000000
        ),
        
You can edit the base_path based on on information from the following link: https://lttng.org/man/1/lttng-create/v2.13/#doc-opt--set-url

In the current example it streams trace data to network path, e.g:

    net://<insert_path_here>

however you can also specify to stream trace data to a file path, e.g:

    file://<insert_path_here>

The final path thagt babel trace points to will be based on the full file path that combines your base path and session name.

In this case when you run babeltrace2, the command will be:

    babeltrace2 net://localhost/host/$HOSTNAME/image-tracing-session
