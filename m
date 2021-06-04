Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8422039BF8A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jun 2021 20:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhFDS1P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Jun 2021 14:27:15 -0400
Received: from mail.palosanto.com ([181.39.87.190]:36998 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229791AbhFDS1P (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Jun 2021 14:27:15 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id 38C9A13C2A54;
        Fri,  4 Jun 2021 13:25:25 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id qUPWR2zyEQXg; Fri,  4 Jun 2021 13:25:18 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.2.15])
        by palosanto.com (Postfix) with ESMTPSA id F140113C25D3;
        Fri,  4 Jun 2021 13:25:17 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622831118;
        bh=GlMTHBuvFeaQuDZKMYYT+Zs4Ixqkz1PXc1p9Hou3lJU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ca3PbOyAR4Dod1np0GCLIH1NAV3mkPT8l6vshTDl80P4IIoMxJbY+g9L6V8hRz0Or
         lpTMfkcopl/bxnL0HRD6GHRTXhQVnJmEWdLnMRrArdkE1k7mW+c1bxvs31HZR1jgWs
         DgPFG6unv9Az6eGE8AUNYuzoRzc2T18TlKdltI6s=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, David Frey <dpfrey@gmail.com>,
        Pho Tran <pho.tran@silabs.com>,
        Tung Pham <tung.pham@silabs.com>, Hung.Nguyen@silabs.com
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
 <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
 <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <a3a37639-0cba-fb3e-96bf-b4c2dae544a7@palosanto.com>
Date:   Fri, 4 Jun 2021 13:25:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLpJzTmAnfsrE7UP@hovoldconsulting.com>
Content-Type: multipart/mixed;
 boundary="------------F4B29F672E3E62CCBEC42566"
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This is a multi-part message in MIME format.
--------------F4B29F672E3E62CCBEC42566
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

El 4/6/21 a las 10:42, Johan Hovold escribió:
> [ +CC: the Silabs team and David who reported the same issue ]
>
> Quick summary: Some CP2102N devices cannot use SET_MHS when ulXonLimit
> and ulXoffLimit are set to 128/128 even when auto-RTS is disabled.
> Leaving the default limits at 0/0 seems to work.
>
> Tung, Hung and Pho, do you have some idea of what might be going on
> here?
>
> The full thread is here:
>
> 	https://lore.kernel.org/r/465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com	
> On Wed, Jun 02, 2021 at 10:54:14AM -0500, Alex Villacís Lasso wrote:
>> El 2/6/21 a las 09:50, Johan Hovold escribió:
>>> This may be a little far-fetched but can you send me the logs (debugging
>>> again enabled) from when:
>>>
>>> 	1. plugging the device in
>>> 	2. stty -F /dev/ttyUSB0 ixon ixoff
>>> 	3. stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
>>> 	4. cat /dev/ttyUSB0	# + CTRL-C
>>>
>>> No need to run the terminal program.
>>>
>>> If you could also apply the below debugging patch (on top of the
>>> previous one) which will dump some device settings during probe before
>>> doing the above that would be great.
>>>
>>> Hopefully this will gives some more clues but otherwise I'll probably
>>> just leave the default IXOFF limits for CP2102N to fix the regression.
>>>   From 65b53f408b5d6b6408420ed9d1c827f80401796e Mon Sep 17 00:00:00 2001
>>> From: Johan Hovold <johan@kernel.org>
>>> Date: Wed, 2 Jun 2021 16:23:21 +0200
>>> Subject: [PATCH] USB: serial: cp210x: dump communication properties
>> Tests with *both* patches applied:
> Thanks again for running the new tests.
>
>> <device plugged in>
>> jun 02 10:44:29 karlalex-asus kernel: usb 1-9: New USB device found,
>> idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities
>> = 0x13f
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams =
>> 0x7f
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue
>> = 640
>> jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue
>> = 640
> This all matches the CP2102N I've got here and which can set RTS just
> fine also with the IXOFF limits set (unlike your device).
>
> Unless there's some other configuration setting causing it would seem
> your device firmware is just buggy (and bcdDevice was not updated when
> it was fixed, which seems unlikely).
>
>> $ stty -F /dev/ttyUSB0 ixon ixoff
>>
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 9600
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0303
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x01, flow = 0x43
> Here IXOFF is enabled.
>
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0300
>> jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
> And setting the IXOFF limits only when software flow control is enabled
> would not work either.
>   
>> $ stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
>>
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 9600
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x01, flow = 0x43
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0303
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x09, flow = 0x80
> Here hardware flow control is enabled.
>
>> jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00
> And then RTS can still be changed using the SET_FLOW command.
>
> I just ran a quick test here and and leaving the ixoff_limit at zero
> essentially breaks software flow control since XOFF will be sent when
> there are only 7 characters in the receive buffer.
>
> Since software flow control support was only recently added, we may have
> to accept that for CP2102N to fix the regression, but I'd really like to
> understand why your devices behave the way they do first and see if
> there's some other way to work around this.
>
> Hopefully Silabs can provide some insight.
>
> Also, could you try setting those limits to some other values and see if
> the SET_MHS (request 0x7) errors go away?
>
> Setting both to 513 is supposed to give us 192/64 according to the
> datasheet which would be good enough, for example. Seems to work as
> documented here (at least for XOFF).
>
> Johan


I am starting to suspect that the root cause is that the 0x07 command 
(CP210X_SET_MHS macro in the code) is invalid to send, if the device has 
been previously programmed with nonzero ulXonLimit/ulXoffLimit. When the 
patch programs both limits back to 0, the command succeeds.

I am attaching the patch I used, which is the combination of both debug 
patches, plus this change:

@@ -1195,11 +1201,14 @@
         else
                 flow_repl &= ~CP210X_SERIAL_AUTO_TRANSMIT;

-       flow_ctl.ulXonLimit = cpu_to_le32(128);
-       flow_ctl.ulXoffLimit = cpu_to_le32(128);
+       flow_ctl.ulXonLimit = (I_IXON(tty)) ? cpu_to_le32(128) : 
cpu_to_le32(0);
+       flow_ctl.ulXoffLimit = (I_IXOFF(tty)) ? cpu_to_le32(128) : 
cpu_to_le32(0);

With this patch, the miniterm.py program sort of keeps running and shows 
output. Not a perfect patch by any means, since some failures still happen:

# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control ; 
insmod ./cp210x.ko dyndbg==p

jun 04 13:03:52 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 04 13:03:52 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x

<device plugged in>

jun 04 13:04:44 karlalex-asus kernel: usb 1-9: new full-speed USB device 
number 8 using xhci_hcd
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: Product: CP2102N USB to 
UART Bridge Controller
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: Manufacturer: Silicon Labs
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 04 13:04:44 karlalex-asus kernel: cp210x 1-9:1.0: cp210x converter 
detected
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
= 0x13f
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
0x7f
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
= 640
jun 04 13:04:44 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
= 640
jun 04 13:04:44 karlalex-asus kernel: usb 1-9: cp210x converter now 
attached to ttyUSB0
jun 04 13:04:44 karlalex-asus mtp-probe[22237]: checking bus 1, device 
8: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 04 13:04:44 karlalex-asus mtp-probe[22237]: bus: 1, device: 8 was 
not an MTP device
jun 04 13:04:44 karlalex-asus mtp-probe[22254]: checking bus 1, device 
8: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 04 13:04:44 karlalex-asus mtp-probe[22254]: bus: 1, device: 8 was 
not an MTP device
jun 04 13:04:47 karlalex-asus ModemManager[724]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9': not supported by any 
plugin


$ miniterm.py /dev/ttyUSB0 115200
<program waits for input>

jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x00
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 0, xoff_limit = 0
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x00, flow = 0x01
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 0
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 115384
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x01
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 0
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x01, flow = 0x40
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 0, xoff_limit = 0
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0101
jun 04 13:05:12 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0202


<miniterm.py terminated via Ctrl-]>

jun 04 13:07:09 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300

--------------------------------------

# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control ; 
insmod ./cp210x.ko dyndbg==p

jun 04 13:08:33 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 04 13:08:33 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x

<device plugged in>

jun 04 13:09:30 karlalex-asus kernel: usb 1-9: new full-speed USB device 
number 9 using xhci_hcd
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: Product: CP2102N USB to 
UART Bridge Controller
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: Manufacturer: Silicon Labs
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 04 13:09:30 karlalex-asus kernel: cp210x 1-9:1.0: cp210x converter 
detected
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
= 0x13f
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
0x7f
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
= 640
jun 04 13:09:30 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
= 640
jun 04 13:09:30 karlalex-asus kernel: usb 1-9: cp210x converter now 
attached to ttyUSB0
jun 04 13:09:30 karlalex-asus mtp-probe[22662]: checking bus 1, device 
9: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 04 13:09:30 karlalex-asus mtp-probe[22662]: bus: 1, device: 9 was 
not an MTP device
jun 04 13:09:30 karlalex-asus mtp-probe[22679]: checking bus 1, device 
9: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 04 13:09:30 karlalex-asus mtp-probe[22679]: bus: 1, device: 9 was 
not an MTP device
jun 04 13:09:32 karlalex-asus ModemManager[724]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9': not supported by any 
plugin


$ stty -F /dev/ttyUSB0 -a
speed 9600 baud; rows 0; columns 0; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; 
eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt 
= ^R; werase = ^W; lnext = ^V; discard = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 hupcl -cstopb cread clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon 
-ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 
vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop 
-echoprt echoctl echoke -flusho -extproc

jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x00
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 0, xoff_limit = 0
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x00, flow = 0x01
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 0
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 04 13:10:47 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32


$ stty -F /dev/ttyUSB0 ixon ixoff

jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x01
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 0
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x00, flow = 0x01
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 0
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x01
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 0
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x01, flow = 0x43
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 128
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 04 13:12:31 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32


$ stty -F /dev/ttyUSB0 crtscts -ixon -ixoff

jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x01, flow = 0x43
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 128
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x00, flow = 0x03
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 128, xoff_limit = 128
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x00, flow = 0x03
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 128, xoff_limit = 128
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x09, flow = 0x80
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 0, xoff_limit = 0
jun 04 13:14:49 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00

$ cat /dev/ttyUSB0
<waits for input>

jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: ctrl = 0x08, flow = 0x00
jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - BEFORE: xon_limit = 0, xoff_limit = 0
jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: ctrl = 0x08, flow = 0x00
jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - AFTER: xon_limit = 0, xoff_limit = 0
jun 04 13:17:21 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x09, flow = 0x80


<Ctrl-C pressed>
jun 04 13:17:57 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00


--------------F4B29F672E3E62CCBEC42566
Content-Type: text/x-patch; charset=UTF-8;
 name="t1.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="t1.patch"

--- cp210x.c.orig-5.12.8	2021-06-01 12:04:24.807117676 -0500
+++ cp210x.c	2021-06-04 13:03:14.300539440 -0500
@@ -1159,6 +1159,12 @@
 	ctl_hs = le32_to_cpu(flow_ctl.ulControlHandshake);
 	flow_repl = le32_to_cpu(flow_ctl.ulFlowReplace);
 
+	dev_dbg(&port->dev, "%s - BEFORE: ctrl = 0x%02x, flow = 0x%02x\n", __func__,
+			ctl_hs, flow_repl);
+	dev_dbg(&port->dev, "%s - BEFORE: xon_limit = %u, xoff_limit = %u\n", __func__,
+			le32_to_cpu(flow_ctl.ulXonLimit),
+			le32_to_cpu(flow_ctl.ulXoffLimit));
+
 	ctl_hs &= ~CP210X_SERIAL_DSR_HANDSHAKE;
 	ctl_hs &= ~CP210X_SERIAL_DCD_HANDSHAKE;
 	ctl_hs &= ~CP210X_SERIAL_DSR_SENSITIVITY;
@@ -1195,11 +1201,14 @@
 	else
 		flow_repl &= ~CP210X_SERIAL_AUTO_TRANSMIT;
 
-	flow_ctl.ulXonLimit = cpu_to_le32(128);
-	flow_ctl.ulXoffLimit = cpu_to_le32(128);
+	flow_ctl.ulXonLimit = (I_IXON(tty)) ? cpu_to_le32(128) : cpu_to_le32(0);
+	flow_ctl.ulXoffLimit = (I_IXOFF(tty)) ? cpu_to_le32(128) : cpu_to_le32(0);
 
-	dev_dbg(&port->dev, "%s - ctrl = 0x%02x, flow = 0x%02x\n", __func__,
+	dev_dbg(&port->dev, "%s - AFTER: ctrl = 0x%02x, flow = 0x%02x\n", __func__,
 			ctl_hs, flow_repl);
+	dev_dbg(&port->dev, "%s - AFTER: xon_limit = %u, xoff_limit = %u\n", __func__,
+			le32_to_cpu(flow_ctl.ulXonLimit),
+			le32_to_cpu(flow_ctl.ulXoffLimit));
 
 	flow_ctl.ulControlHandshake = cpu_to_le32(ctl_hs);
 	flow_ctl.ulFlowReplace = cpu_to_le32(flow_repl);
@@ -1829,6 +1838,37 @@
 
 #endif
 
+static void cp210x_dump_props(struct usb_serial_port *port)
+{
+	struct usb_device *udev = port->serial->dev;
+	void *buf;
+	int ret;
+
+	buf = kzalloc(256, GFP_KERNEL);
+	if (!buf)
+		return;
+
+	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
+			CP210X_GET_PROPS, REQTYPE_INTERFACE_TO_HOST, 0,
+			cp210x_interface_num(port->serial), buf, 256,
+			USB_CTRL_GET_TIMEOUT);
+	if (ret < 52) {
+		dev_err(&port->dev, "failed to get props: %d\n", ret);
+		goto out;
+	}
+
+	dev_dbg(&port->dev, "wLength = %u\n", le16_to_cpup(buf));
+	dev_dbg(&port->dev, "ulMaxTxQueue = %u\n", le32_to_cpup(buf + 12));
+	dev_dbg(&port->dev, "ulMaxRxQueue = %u\n", le32_to_cpup(buf + 16));
+	dev_dbg(&port->dev, "ulProvSubType = %u\n", le32_to_cpup(buf + 24));
+	dev_dbg(&port->dev, "ulProvCapabilities = 0x%02x\n", le32_to_cpup(buf + 28));
+	dev_dbg(&port->dev, "ulSettableParams = 0x%02x\n", le32_to_cpup(buf + 32));
+	dev_dbg(&port->dev, "ulCurrentTx-Queue = %u\n", le32_to_cpup(buf + 44));
+	dev_dbg(&port->dev, "ulCurrentRx-Queue = %u\n", le32_to_cpup(buf + 48));
+out:
+	kfree(buf);
+}
+
 static int cp210x_port_probe(struct usb_serial_port *port)
 {
 	struct usb_serial *serial = port->serial;
@@ -1843,6 +1883,8 @@
 
 	usb_set_serial_port_data(port, port_priv);
 
+	cp210x_dump_props(port);
+
 	return 0;
 }
 

--------------F4B29F672E3E62CCBEC42566--
