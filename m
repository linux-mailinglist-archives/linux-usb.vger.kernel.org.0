Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380E7398F4D
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jun 2021 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232301AbhFBP4D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Jun 2021 11:56:03 -0400
Received: from mail.palosanto.com ([181.39.87.190]:54716 "EHLO palosanto.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231891AbhFBP4D (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 2 Jun 2021 11:56:03 -0400
Received: from localhost (mail.palosanto.com [127.0.0.1])
        by palosanto.com (Postfix) with ESMTP id 3C60113C1D28;
        Wed,  2 Jun 2021 10:54:16 -0500 (-05)
X-Virus-Scanned: Debian amavisd-new at mail.palosanto.com
Received: from palosanto.com ([127.0.0.1])
        by localhost (mail.palosanto.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id MVgkfrB6Eeho; Wed,  2 Jun 2021 10:54:13 -0500 (-05)
Received: from [192.168.0.105] (unknown [191.99.3.5])
        by palosanto.com (Postfix) with ESMTPSA id 36B9713C18C5;
        Wed,  2 Jun 2021 10:54:13 -0500 (-05)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=palosanto.com;
        s=mail; t=1622649253;
        bh=NSJsciCYHLykb2d1yo0gTHKrCDSHlb5ijnfb2LKS76I=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=FDJEs3f3hvqzcBdVU1j5J2c4IxnxvFMKOMAVA/aGBHEoc3nibygFxu+kDydw0okfw
         QRVd7m5mlIYcDtl5bQ2b0rTU8HCZXset3JwDb31cTGo1j39XJRtRyIKs5wadbV4c9A
         ZnczKlIjuUhT6yb0rnW8x0jl0+u23GqayNHmOsj0=
Subject: Re: cp210x module broken in 5.12.5 and 5.12.6, works in 5.11.21 (with
 bisection)
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
References: <465ef3ac-4291-6392-e52b-26cc0c34dd7c@palosanto.com>
 <YLXmrmW9/fB1WbzR@hovoldconsulting.com>
 <2881bd97-f790-c4d6-aed6-de9ab8cd1a9e@palosanto.com>
 <YLZVAmYxFZ1Q/nrH@hovoldconsulting.com>
 <60705932-860a-701c-1019-16f9e16c39dd@palosanto.com>
 <YLeapcNbvExeGKuE@hovoldconsulting.com>
From:   =?UTF-8?Q?Alex_Villac=c3=ads_Lasso?= <a_villacis@palosanto.com>
Message-ID: <cb99a25e-5758-051c-afb6-29d8ef26ee0b@palosanto.com>
Date:   Wed, 2 Jun 2021 10:54:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YLeapcNbvExeGKuE@hovoldconsulting.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

El 2/6/21 a las 09:50, Johan Hovold escribió:
> On Tue, Jun 01, 2021 at 12:18:27PM -0500, Alex Villacís Lasso wrote:
>> El 1/6/21 a las 10:40, Johan Hovold escribió:
>>> Could you try applying the below patch, and with debugging enabled
>>>
>>> 	1. plug the device in
>>> 	2. start the terminal program
>>>
>>> and then send me the logs?
>>>
>>> This should show the current device settings which appear to have flow
>>> control enabled (which the driver fails to disable).
> Thanks again for the log.
>
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
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 9600
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
> So the default device settings are the same as for my device and
> hardware flow control is disabled.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0
> Defaults to zero here too.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
> Here IXON is enabled (default termios), but the IXOFF limits are also
> updated to 128/128.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0303
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
> And the next SET_MHS (modem handshaking) request fails (for RTS, as can
> be seen below).
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_change_speed - setting baud rate to 115384
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
> The requested settings appear to have taken effect.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
> And the limits have been updated.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_set_flow_control - ctrl = 0x01, flow = 0x40
> Here DTR and RTS are asserted, and flow control disabled.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0101
> DTR can still be changed.
>
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0:
>> cp210x_tiocmset_port - control = 0x0202
>> jun 01 12:12:13 karlalex-asus kernel: cp210x ttyUSB0: failed set request
>> 0x7 status: -32
> But RTS cannot be changed, just as if auto-RTS is enabled (even if it is
> not reported back).
>
> This may be a little far-fetched but can you send me the logs (debugging
> again enabled) from when:
>
> 	1. plugging the device in
> 	2. stty -F /dev/ttyUSB0 ixon ixoff
> 	3. stty -F /dev/ttyUSB0 crtscts -ixon -ixoff
> 	4. cat /dev/ttyUSB0	# + CTRL-C
>
> No need to run the terminal program.
>
> If you could also apply the below debugging patch (on top of the
> previous one) which will dump some device settings during probe before
> doing the above that would be great.
>
> Hopefully this will gives some more clues but otherwise I'll probably
> just leave the default IXOFF limits for CP2102N to fix the regression.
>
> Johan
>
>
>  From 65b53f408b5d6b6408420ed9d1c827f80401796e Mon Sep 17 00:00:00 2001
> From: Johan Hovold <johan@kernel.org>
> Date: Wed, 2 Jun 2021 16:23:21 +0200
> Subject: [PATCH] USB: serial: cp210x: dump communication properties
>
> ---
>   drivers/usb/serial/cp210x.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
>
> diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
> index 89da00de9739..f5c9e21538f8 100644
> --- a/drivers/usb/serial/cp210x.c
> +++ b/drivers/usb/serial/cp210x.c
> @@ -1843,6 +1843,37 @@ static void cp210x_gpio_remove(struct usb_serial *serial)
>   
>   #endif
>   
> +static void cp210x_dump_props(struct usb_serial_port *port)
> +{
> +	struct usb_device *udev = port->serial->dev;
> +	void *buf;
> +	int ret;
> +
> +	buf = kzalloc(256, GFP_KERNEL);
> +	if (!buf)
> +		return;
> +
> +	ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> +			CP210X_GET_PROPS, REQTYPE_INTERFACE_TO_HOST, 0,
> +			cp210x_interface_num(port->serial), buf, 256,
> +			USB_CTRL_GET_TIMEOUT);
> +	if (ret < 52) {
> +		dev_err(&port->dev, "failed to get props: %d\n", ret);
> +		goto out;
> +	}
> +
> +	dev_dbg(&port->dev, "wLength = %u\n", le16_to_cpup(buf));
> +	dev_dbg(&port->dev, "ulMaxTxQueue = %u\n", le32_to_cpup(buf + 12));
> +	dev_dbg(&port->dev, "ulMaxRxQueue = %u\n", le32_to_cpup(buf + 16));
> +	dev_dbg(&port->dev, "ulProvSubType = %u\n", le32_to_cpup(buf + 24));
> +	dev_dbg(&port->dev, "ulProvCapabilities = 0x%02x\n", le32_to_cpup(buf + 28));
> +	dev_dbg(&port->dev, "ulSettableParams = 0x%02x\n", le32_to_cpup(buf + 32));
> +	dev_dbg(&port->dev, "ulCurrentTx-Queue = %u\n", le32_to_cpup(buf + 44));
> +	dev_dbg(&port->dev, "ulCurrentRx-Queue = %u\n", le32_to_cpup(buf + 48));
> +out:
> +	kfree(buf);
> +}
> +
>   static int cp210x_port_probe(struct usb_serial_port *port)
>   {
>   	struct usb_serial *serial = port->serial;
> @@ -1857,6 +1888,8 @@ static int cp210x_port_probe(struct usb_serial_port *port)
>   
>   	usb_set_serial_port_data(port, port_priv);
>   
> +	cp210x_dump_props(port);
> +
>   	return 0;
>   }
>   

Tests with *both* patches applied:

# echo module cp210x +p > /sys/kernel/debug/dynamic_debug/control
# insmod ./cp210x.ko dyndbg==p

jun 02 10:42:38 karlalex-asus kernel: usbcore: registered new interface 
driver cp210x
jun 02 10:42:38 karlalex-asus kernel: usbserial: USB Serial support 
registered for cp210x


<device plugged in>

jun 02 10:44:28 karlalex-asus kernel: usb 1-9: new full-speed USB device 
number 5 using xhci_hcd
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: New USB device found, 
idVendor=10c4, idProduct=ea60, bcdDevice= 1.00
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: New USB device strings: 
Mfr=1, Product=2, SerialNumber=3
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: Product: CP2102N USB to 
UART Bridge Controller
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: Manufacturer: Silicon Labs
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: SerialNumber: 
283405bafee6e81182024fe64b629a73
jun 02 10:44:29 karlalex-asus kernel: cp210x 1-9:1.0: cp210x converter 
detected
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: wLength = 66
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxTxQueue = 640
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulMaxRxQueue = 640
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvSubType = 1
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulProvCapabilities 
= 0x13f
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulSettableParams = 
0x7f
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentTx-Queue 
= 640
jun 02 10:44:29 karlalex-asus kernel: cp210x ttyUSB0: ulCurrentRx-Queue 
= 640
jun 02 10:44:29 karlalex-asus kernel: usb 1-9: cp210x converter now 
attached to ttyUSB0
jun 02 10:44:29 karlalex-asus mtp-probe[10146]: checking bus 1, device 
5: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 02 10:44:29 karlalex-asus mtp-probe[10146]: bus: 1, device: 5 was 
not an MTP device
jun 02 10:44:29 karlalex-asus mtp-probe[10163]: checking bus 1, device 
5: "/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9"
jun 02 10:44:29 karlalex-asus mtp-probe[10163]: bus: 1, device: 5 was 
not an MTP device
jun 02 10:44:31 karlalex-asus ModemManager[725]: <info> [base-manager] 
couldn't check support for device 
'/sys/devices/pci0000:00/0000:00:14.0/usb1/1-9': not supported by any 
plugin


$ stty -F /dev/ttyUSB0 ixon ixoff

jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x00
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 0, xoff_limit = 0
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x01
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x01, flow = 0x43
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0300
jun 02 10:45:40 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32


$ stty -F /dev/ttyUSB0 crtscts -ixon -ixoff

jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x01, flow = 0x43
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - control = 0x0303
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: failed set request 
0x7 status: -32
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x00, flow = 0x03
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x09, flow = 0x80
jun 02 10:46:41 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00


$ cat /dev/ttyUSB0
<cat now waits for input>
jun 02 10:47:52 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_change_speed - setting baud rate to 9600
jun 02 10:47:52 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x08, flow = 0x00
jun 02 10:47:52 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - xon_limit = 128, xoff_limit = 128
jun 02 10:47:52 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_set_flow_control - ctrl = 0x08, flow = 0x00
jun 02 10:47:52 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x09, flow = 0x80


<Ctrl-C pressed, returned to shell prompt>
jun 02 10:48:59 karlalex-asus kernel: cp210x ttyUSB0: 
cp210x_tiocmset_port - ctrl = 0x08, flow = 0x00


