Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7665C3978EC
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 19:18:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbhFARUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 13:20:13 -0400
Received: from mail.palosanto.com ([181.39.87.190]:35509 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231918AbhFARUN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 13:20:13 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id D483213C2426;
        Tue,  1 Jun 2021 12:18:27 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YTZmCDzkv_st; Tue,  1 Jun 2021 12:18:25 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.3.5])
        by palosanto.com (Postfix) with ESMTPSA id 65D5F13C2383;
        Tue,  1 Jun 2021 12:18:25 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622567905;
        bh=W7AuroPgPSNBlpKoeWs9ktvur8SnL+qcNR+ZMP2I8UQ=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=p1BQ19/yexf6Juuq2cPj8JzAuhREhjMvSmmnuvWiFQnO/g7Z2xBhHRdLtHo5SnCQZ
         wSKScm16JmMyb5EU6g9M04IFtz4AwS1FwLQ7L0KrsMMY4W9T8MmQq8CpcIJ5WKTv+C
         zMNKThjA/to6rilpJv5i3CicaKBWHfJARIOa15Ts=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
Date:   Tue, 1 Jun 2021 12:18:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 1/6/21 a las 10:40, Johan Hovold escribió:
> On Tue, Jun 01, 2021 at 09:51:56AM -0500, Alex Villacís Lasso wrote:
>
>> Here is the full result of the test I performed. First I installed the
>> distro kernel update, kernel-5.12.8-300.fc34.x86_64, then rebooted.
>> Anything with a date is the journalctl output. Everything else is
>> console input and output. I have pasted the relevant journalctl messages
>> immediately after the command or action that triggered them.
>> $ miniterm.py /dev/ttyUSB0 115200
>> Traceback (most recent call last):
>>     File "/usr/bin/miniterm.py", line 976, in <module>
>>       main()
>>     File "/usr/bin/miniterm.py", line 932, in main
>>       serial_instance.open()
>>     File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line
>> 288, in open
>>       self._update_rts_state()
>>     File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line
>> 627, in _update_rts_state
>>       fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
>> BrokenPipeError: [Errno 32] Broken pipe
>>
>> jun 01 09:23:43 karlalex-asus systemd[1665]: Started VTE child process
>> 3306 launched by gnome-terminal-server process 2856.
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 9600
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0303
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 115384
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0101
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0202
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
>> jun 01 09:23:55 karlalex-asus python3[3362]: detected unhandled Python
>> exception in '/usr/bin/miniterm.py'
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0300
>> jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
> Thanks a lot for this.
>
> Could you try applying the below patch, and with debugging enabled
>
> 	1. plug the device in
> 	2. start the terminal program
>
> and then send me the logs?
>
> This should show the current device settings which appear to have flow
> control enabled (which the driver fails to disable).
>
>> I note that the mere act of running stty -a on the device also triggers
>> the error.
> Yeah, you'll see this error on every open/close when the driver tries to
> assert/deassert RTS.
>
> Johan
>
>
>  From 736c4c099591317d55a20da627db3b148d8d71ca Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Tue, 1 Jun 2021 17:29:01 +0200
> Subject: [PATCH] USB: cp210x: add flow-control debugging
>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>   drivers/usb/serial/cp210x.c | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index ee595d1bea0a..92382798b574 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1159,6 +1159,12 @@ static void cp210x_set_flow_control(struct tty_struct *tty,
>   	ctl_hs = le32_to_cpu(flow_ctl.ulControlHandshake);
>   	flow_repl = le32_to_cpu(flow_ctl.ulFlowReplace);
>   
> +	dev_dbg(&port->dev, "%s - ctrl = 0x%02x, flow = 0x%02x\n", __func__,
> +			ctl_hs, flow_repl);
> +	dev_dbg(&port->dev, "%s - xon_limit = %u, xoff_limit = %u\n", __func__,
> +			le32_to_cpu(flow_ctl.ulXonLimit),
> +			le32_to_cpu(flow_ctl.ulXoffLimit));
> +
>   	ctl_hs &= ~CP210X_SERIAL_DSR_HANDSHAKE;
>   	ctl_hs &= ~CP210X_SERIAL_DCD_HANDSHAKE;
>   	ctl_hs &= ~CP210X_SERIAL_DSR_SENSITIVITY;

As before:

# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
# insmod ./cp210x.ko dyndbg==p

jun 01 12:09:51 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 01 12:09:51 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x


<device plugged in>

jun 01 12:11:38 karlalex-asus kernel: usb 1-9: new full-speed USB device 
number 7 using xhci_hcd
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: Product: CP2102N USB to 
UART Bridge Controller
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: Manufacturer: Silicon Labs
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 01 12:11:38 karlalex-asus kernel: cp210x 1-9:1.0: cp210x converter 
detected
jun 01 12:11:38 karlalex-asus kernel: usb 1-9: cp210x converter now 
attached to ttyUSB0
jun 01 12:11:38 karlalex-asus mtp-probe[11596]: checking bus 1, device 
7: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 01 12:11:38 karlalex-asus mtp-probe[11596]: bus: 1, device: 7 was 
not an MTP device
jun 01 12:11:38 karlalex-asus mtp-probe[11613]: checking bus 1, device 
7: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 01 12:11:38 karlalex-asus mtp-probe[11613]: bus: 1, device: 7 was 
not an MTP device
jun 01 12:11:40 karlalex-asus ModemManager[726]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9': not supported by any 
plugin


$ miniterm.py /dev/ttyUSB0 115200
Traceback (most recent call last):
   File "/usr/bin/miniterm.py", line 976, in <module>
     main()
   File "/usr/bin/miniterm.py", line 932, in main
     serial_instance.open()
   File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
288, in open
     self._update_rts_state()
   File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 
627, in _update_rts_state
     fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
BrokenPipeError: [Errno 32] Broken pipe

jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0101
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0202
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 12:12:13 karlalex-asus python3[11633]: detected unhandled Python 
exception in '/usr/bin/miniterm.py'
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 12:12:13 karlalex-asus abrt-server[11634]: Deleting problem 
directory Python3-2021-06-01-12:12:13-11633 (dup of 
Python3-2021-05-27-14:26:21-17653)
jun 01 12:12:13 karlalex-asus abrt-notification[11653]: [🡕] Process 
17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError 
exception

