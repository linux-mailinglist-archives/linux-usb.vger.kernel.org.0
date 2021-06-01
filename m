Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357D43975D1
	for <lists+linux-usb@lfdr.de>; Tue,  1 Jun 2021 16:52:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234258AbhFAOxn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Jun 2021 10:53:43 -0400
Received: from mail.palosanto.com ([181.39.87.190]:58368 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234043AbhFAOxm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Jun 2021 10:53:42 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id A773913C21C1;
        Tue,  1 Jun 2021 09:51:57 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id O4aXFLkuj01M; Tue,  1 Jun 2021 09:51:54 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.3.5])
        by palosanto.com (Postfix) with ESMTPSA id 5724413C1FEB;
        Tue,  1 Jun 2021 09:51:54 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622559114;
        bh=f/OapsWHR4GGdM/AHnQUz+l64D7Ahp/tvjyLcjc2TX8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MM889w82YygxbmlcN7NI+O36XfOdTRZ1nkytzHKsWLrAaZbe1h+A8mILmD2E+cW44
         9AwA2A3r3wkbYGmn8Loe49GdDUu07TMqRSvQ52iKyHona8x9i1fkZHdYDKTJSFkavu
         4bHROwviINbCIb0q7FrFqvk0EOOZIb0meA2NYa8M=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
Date:   Tue, 1 Jun 2021 09:51:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 1/6/21 a las 02:50, Johan Hovold escribió:
> On Mon, May 31, 2021 at 12:38:19PM -0500, Alex Villacís Lasso wrote:
>> (Sorry if this is a double-post. Previous message appears to have
>> dissapeared or been rejected in transit. )
>>
>> This is a report of the bug report at
>> https://bugzilla.redhat.com/show_bug.cgi?id=1965527. I was asked to post
>> the bisection results by Hans de Goede. Here is the bug information for
>> reference:
>>
>> 1. Please describe the problem:
>>
>> For my development work, I use several ESP32 boards from Espressif. On
>> Fedora, these modules are plugged as USB serial devices, managed via
>> the cp210x module, and show under /dev/ttyUSB0 .
>>
>> On Fedora 34, up until kernel-5.11.21-300.fc34.x86_64, this setup
>> worked correctly.
>>
>> Under recently-released kernels kernel-5.12.5-300.fc34.x86_64 and
>> kernel-5.12.6-300.fc34.x86_64, this setup is now broken. When I plug
>> the board, the module loads as usual and shows up under /dev/ttyUSB0.
>> However, *any* attempt to read or write to the port fails. For
>> example, using miniterm.py from python3-pyserial-3.4-10.fc34.noarch:
>>
>> Traceback (most recent call last):
>>     File "/usr/bin/miniterm.py", line 976, in <module>
>>       main()
>>     File "/usr/bin/miniterm.py", line 932, in main
>>       serial_instance.open()
>>     File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 288, in open
>>       self._update_rts_state()
>>     File "/usr/lib/python3.9/site-packages/serial/serialposix.py", line 627, in _update_rts_state
>>       fcntl.ioctl(self.fd, TIOCMBIS, TIOCM_RTS_str)
>> BrokenPipeError: [Errno 32] Broken pipe
>>
>> At the same time, the following appears in the system logs:
>>
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: new full-speed USB device number 6 using xhci_hcd
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device found, idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: Product: CP2102N USB to UART Bridge Controller
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: Manufacturer: Silicon Labs
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: SerialNumber: 18c0ecf00d0aea119fe0ae442473482f
>> may 27 16:04:55 karlalex-asus mtp-probe[3272]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
>> may 27 16:04:55 karlalex-asus mtp-probe[3272]: bus: 1, device: 6 was not an MTP device
>> may 27 16:04:55 karlalex-asus kernel: usbcore: registered new interface driver cp210x
>> may 27 16:04:55 karlalex-asus kernel: usbserial: USB Serial support registered for cp210x
>> may 27 16:04:55 karlalex-asus kernel: cp210x 1-10:1.0: cp210x converter detected
>> may 27 16:04:55 karlalex-asus kernel: usb 1-10: cp210x converter now attached to ttyUSB0
>> may 27 16:04:55 karlalex-asus mtp-probe[3287]: checking bus 1, device 6: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
>> may 27 16:04:55 karlalex-asus mtp-probe[3287]: bus: 1, device: 6 was not an MTP device
>> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
>> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
>> may 27 16:04:56 karlalex-asus python3[3292]: detected unhandled Python exception in '/usr/bin/miniterm.py'
>> may 27 16:04:56 karlalex-asus kernel: cp210x ttyUSB0: failed set request 0x7 status: -32
>> may 27 16:04:56 karlalex-asus abrt-server[3293]: Deleting problem directory Python3-2021-05-27-16:04:56-3292 (dup of Python3-2021-05-27-14:26:21-17653)
>> may 27 16:04:56 karlalex-asus abrt-notification[3312]: [🡕] Process 17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError exception
>>
>> The messages with "failed set request..." are abnormal.
>>
>> Worked around by downgrading the kernel to any 5.11.x version. Tested
>> with kernel-5.11.21-300.fc34.x86_64 and kernel-5.11.12-300.fc34.x86_64
>> Module cp210x from kernel 5.11 works without errors with ESP32 when
>> compiled under 5.12.x after applying commit
>> c5d1448fa353242635fa3e1fed6ab4558e0e7d9a (USB: serial: make remove
>> callback return void) on top of it. This allows bisection without
>> rebooting.
>>
>>
>> Bisection points me to this:
>>
>> f61309d9c96a308465bec9d2e5206da265b075a0 is the first bad commit
>> commit f61309d9c96a308465bec9d2e5206da265b075a0
>> Author: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>
>> Date:   Mon Jan 18 12:13:27 2021 +0100
>>
>>       USB: serial: cp210x: set IXOFF thresholds
>>       
>>       At least CP2102 requires the XON/XOFF limits to be initialised in order
>>       for software input flow control (IXOFF) to work. Specifically, XOFF is
>>       never sent if the XOFF limit is left at its default value of zero.
>>       
>>       Set the limits so that input is throttled when the FIFO free level drops
>>       below 128 bytes and restarted when the FIFO fill level drops below 128
>>       bytes.
>>       
>>       Note that the threshold values have been chosen so that they can be used
>>       also with CP2105 which has the smallest FIFO of the currently supported
>>       device types (288 byte for the SCI port). If needed the limits can be
>>       made device specific later.
>>       
>>       Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org  <mailto:gregkh@linuxfoundation.org>>
>>       Signed-off-by: Johan Hovold <johan@kernel.org  <mailto:johan@kernel.org>>
>> If I manually revert commit f61309d9c96a308465bec9d2e5206da265b075a0
>> from cp210x.c from 5.12.7, it works correctly. Further proof that this
>> commit introduced the bug.
> Thanks for the detailed report.
>
> I got another report of this issue off-list a few days ago, but I
> haven't got any replies to my follow-up questions from that reporter
> yet.
>
> I can't seem to reproduce the issue here and the other reporter only
> saw this for some CP2102N which seems to suggest that there's some
> interaction with the device configuration at play here too.
>
> The symptoms appear to be consistent with the device still having
> hardware flow control enabled while the driver thinks it is disabled.
> The IXON/IXOFF limits are set in the same request and this might explain
> why things get out of sync, for example, if 128/128 limits are rejected
> by your device in its current configuration. But that's still to be
> determined.
>
> First, can you enable dynamic debugging in the driver through debugfs:
>
>          echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
>
> or when loading the module:
>
>          modprobe cp210x dyndbg==p
>
> and send me the logs from when connecting the device and running you
> terminal program.
>
> After the terminal program fails, try just to issue a
>
> 	cat /dev/ttyUSB0
>
> press control-C and then include the logs for that too.
>
> For completeness, also include the output of
>
> 	stty -F /dev/ttyUSB0 -a
>
> after re-connecting the device and before and after running the terminal
> program.
>
> Johan

Here is the full result of the test I performed. First I installed the 
distro kernel update, kernel-5.12.8-300.fc34.x86_64, then rebooted. 
Anything with a date is the journalctl output. Everything else is 
console input and output. I have pasted the relevant journalctl messages 
immediately after the command or action that triggered them.

# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
# modprobe cp210x dyndbg==p

jun 01 09:22:54 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 01 09:22:54 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x

<device plugged in>

jun 01 09:23:14 karlalex-asus kernel: usb 1-10: new full-speed USB 
device number 5 using xhci_hcd
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: Product: CP2102N USB to 
UART Bridge Controller
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: Manufacturer: Silicon Labs
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 01 09:23:14 karlalex-asus kernel: cp210x 1-10:1.0: cp210x converter 
detected
jun 01 09:23:14 karlalex-asus kernel: usb 1-10: cp210x converter now 
attached to ttyUSB0
jun 01 09:23:14 karlalex-asus mtp-probe[3280]: checking bus 1, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
jun 01 09:23:14 karlalex-asus mtp-probe[3280]: bus: 1, device: 5 was not 
an MTP device
jun 01 09:23:14 karlalex-asus mtp-probe[3297]: checking bus 1, device 5: 
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
jun 01 09:23:14 karlalex-asus mtp-probe[3297]: bus: 1, device: 5 was not 
an MTP device
jun 01 09:23:16 karlalex-asus ModemManager[726]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10': not supported by any 
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

jun 01 09:23:43 karlalex-asus systemd[1665]: Started VTE child process 
3306 launched by gnome-terminal-server process 2856.
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0101
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0202
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:23:55 karlalex-asus python3[3362]: detected unhandled Python 
exception in '/usr/bin/miniterm.py'
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 09:23:55 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:23:55 karlalex-asus abrt-server[3363]: Deleting problem 
directory Python3-2021-06-01-09:23:55-3362 (dup of 
Python3-2021-05-27-14:26:21-17653)
jun 01 09:23:55 karlalex-asus abrt-notification[3382]: [🡕] Process 
17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError 
exception

$ cat /dev/ttyUSB0
<cat immediately exits, could not press Ctrl-C>
$

jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 09:28:53 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32


# rmmod cp210x
<unplug device>
# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
# modprobe cp210x dyndbg==p

jun 01 09:33:09 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 01 09:33:09 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x


<device plugged in>

jun 01 09:34:37 karlalex-asus kernel: usb 1-10: new full-speed USB 
device number 6 using xhci_hcd
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: Product: CP2102N USB to 
UART Bridge Controller
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: Manufacturer: Silicon Labs
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 01 09:34:37 karlalex-asus kernel: cp210x 1-10:1.0: cp210x converter 
detected
jun 01 09:34:37 karlalex-asus kernel: usb 1-10: cp210x converter now 
attached to ttyUSB0
jun 01 09:34:37 karlalex-asus mtp-probe[3722]: checking bus 1, device 6: 
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
jun 01 09:34:37 karlalex-asus mtp-probe[3722]: bus: 1, device: 6 was not 
an MTP device
jun 01 09:34:37 karlalex-asus mtp-probe[3739]: checking bus 1, device 6: 
"/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10"
jun 01 09:34:37 karlalex-asus mtp-probe[3739]: bus: 1, device: 6 was not 
an MTP device
jun 01 09:34:39 karlalex-asus ModemManager[726]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-10': not supported by any 
plugin


$ stty -F /dev/ttyUSB0 -a
speed 9600 baud; rows 0; columns 0; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; 
eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt 
= ^R; werase = ^W; lnext = ^V; discard = ^O;
min = 1; time = 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon 
-ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 
vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop 
-echoprt echoctl echoke -flusho -extproc

jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 09:35:28 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32


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

jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0101
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0202
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:37:25 karlalex-asus python3[3814]: detected unhandled Python 
exception in '/usr/bin/miniterm.py'
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 09:37:25 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:37:25 karlalex-asus abrt-server[3815]: Deleting problem 
directory Python3-2021-06-01-09:37:25-3814 (dup of 
Python3-2021-05-27-14:26:21-17653)
jun 01 09:37:25 karlalex-asus abrt-notification[3835]: [🡕] Process 
17653 (miniterm.py) of user 1000 encountered an uncaught BrokenPipeError 
exception


$ stty -F /dev/ttyUSB0 -a
speed 115200 baud; rows 0; columns 0; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; 
eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt 
= ^R; werase = ^W; lnext = ^V; discard = ^O;
min = 0; time = 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr -icrnl 
-ixon -ixoff -iuclc -ixany -imaxbel -iutf8
-opost -olcuc -ocrnl -onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 
bs0 vt0 ff0
-isig -icanon -iexten -echo -echoe -echok -echonl -noflsh -xcase -tostop 
-echoprt -echoctl -echoke -flusho -extproc

jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 01 09:38:18 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32

I note that the mere act of running stty -a on the device also triggers 
the error.

