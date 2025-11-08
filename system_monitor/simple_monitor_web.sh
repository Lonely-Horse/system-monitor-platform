#!/bin/bash
echo "编译c程序...."
cd /home/user1/system_monitor/c_projects
gcc -o simple_monitor simple_monitor.c

C_PROJECTS="/home/user1/system_monitor/c_projects/simple_monitor"
OUTPUT_FILE="/home/user1/system_monitor/simple_status.html"

cat > $OUTPUT_FILE << 'HTML_HEAD'
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>系统监控面板</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
        }
        .container {
            max-width: 900px;
            margin: 0 auto;
            background: white;
            border-radius: 15px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .header {
            background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
            color: white;
            padding: 25px;
            text-align: center;
        }
        .header h1 {
            margin: 0;
            font-size: 2.2em;
            font-weight: 300;
        }
        .header h1::before {
            content: "🖥️ ";
        }
        .content {
            padding: 25px;
        }
        .monitor-output {
            background: #f8f9fa;
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 20px;
            font-family: 'Courier New', Consolas, monospace;
            font-size: 0.95em;
            line-height: 1.4;
            white-space: pre-wrap;
            word-break: break-all;
        }
        .footer {
            background: #f8f9fa;
            padding: 15px;
            text-align: center;
            border-top: 1px solid #e9ecef;
            color: #6c757d;
            font-style: italic;
        }
        .update-time {
            background: #e8f5e8;
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 15px;
            border-left: 4px solid #28a745;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>系统监控面板</h1>
        </div>
        <div class="content">
            <div class="update-time">
                <strong>📅 更新时间:</strong> 
HTML_HEAD

# 写入当前时间
echo "$(date)" >> $OUTPUT_FILE

cat >> $OUTPUT_FILE << 'HTML_CONTENT'
            </div>
            <div class="monitor-output">
HTML_CONTENT

# 写入C程序的输出
$C_PROJECTS >> $OUTPUT_FILE

cat >> $OUTPUT_FILE << 'HTML_TAIL'
            </div>
        </div>
        <div class="footer">
            由 C程序 + Shell脚本 自动生成 | 实时系统监控
        </div>
    </div>
</body>
</html>
HTML_TAIL

echo "✨ 美化版监控页面已生成: $OUTPUT_FILE"
