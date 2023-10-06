Return-Path: <linux-usb+bounces-1173-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A817BB05A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 04:49:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3EFE282133
	for <lists+linux-usb@lfdr.de>; Fri,  6 Oct 2023 02:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59B9D1854;
	Fri,  6 Oct 2023 02:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C3F17C5
	for <linux-usb@vger.kernel.org>; Fri,  6 Oct 2023 02:49:22 +0000 (UTC)
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20160D6
	for <linux-usb@vger.kernel.org>; Thu,  5 Oct 2023 19:49:21 -0700 (PDT)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id 4D04676535;
	Fri,  6 Oct 2023 02:49:20 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id 3788C4670E;
	Fri,  6 Oct 2023 02:49:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -0.199
X-Spam-Level:
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id CKl-eijkwYvB; Fri,  6 Oct 2023 02:49:18 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id A77F94670D;
	Fri,  6 Oct 2023 02:49:17 +0000 (UTC)
Message-ID: <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
Date: Thu, 5 Oct 2023 22:49:10 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: dgilbert@interlog.com
Subject: Re: device present in lsusb, disappears in lsusb -t
To: Greg KH <gregkh@linuxfoundation.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <2023091638-duration-barcode-73a3@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2023-09-16 07:16, Greg KH wrote:
> On Fri, Sep 15, 2023 at 08:16:18PM -0400, Douglas Gilbert wrote:
>> The device in question is this one:
>>    Bus 005 Device 015: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C
>> to DisplayPort adapter. It is a USB-C alternate mode device (so tbtadm does
>> not
>> report it).
>>
>> That adapter is connected to a screen (and working) and to a USB-C port on
>> a Lenovo TB3 dock [40AN] which in turn is connected to a Thinkpad X13 Gen3's
>> USB-C port. The Thinkpad is running lk 6.6.0-rc1 with "lsusb (usbutils) 014".
>>
>> The strange thing is that this device is nowhere to be found in the output
>> of "lsusb -t". The lsusb manpage describes the '-t' option as: "Tells
>> lsusb to dump the physical USB device hierarchy as a tree." So is 'physical'
>> a weasel word in this context, or is there a bug in the '-t' option, or is
>> there some other explanation?
> 
> A number of 'lsusb -t' issues were fixed in the 015 release of usbutils,
> so maybe update?
> 
> that being said, the -t option is a totally different codepath in the
> tool, and shows different things overall.  -t shows the drivers that are
> bound to the different interfaces, which means that a single device will
> show up multiple times in the -t option.
> 
> Here's the output of the two things on my local laptop, with just a few
> USB devices in it:
> 
> $ lsusb
> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 003 Device 003: ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd. Goodix USB2.0 MISC
> Bus 003 Device 006: ID 0bda:5634 Realtek Semiconductor Corp. Laptop Camera
> Bus 003 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
> Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>      |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
>      |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
>      |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
>      |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
>      |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
> 
> and then if you give the -v option as well you see a bit more:
> 
> $ lsusb -tv
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
>      |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
>          ID 0bda:5634 Realtek Semiconductor Corp.
>      |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
>          ID 0bda:5634 Realtek Semiconductor Corp.
>      |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
>          ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd.
>      |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
>          ID 8087:0032 Intel Corp. AX210 Bluetooth
>      |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
>          ID 8087:0032 Intel Corp. AX210 Bluetooth
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
>      ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
>      ID 1d6b:0002 Linux Foundation 2.0 root hub
> 
> 
> What are you seeing missing in your output?

lsusb-t.c says:

   Copyright (c) 2009 Greg Kroah-Hartman <gregkh@suse.de>

When I tried to contact the author by email off-list with a fair
amount of data (e.g. a copy of /sys from my machine), he claimed
that such an approach was "rude" in the sense that it should have
been sent to this list. Personally I prefer to fix bugs via a
direct email exchange, without the peanut gallery. After all, many
of the bugs found fall into the "brown paper bag" variety.
Plus I felt a bit uncomfortable about publishing the full
contents of /sys from my laptop.

Oh well, each to their own.

Here is a bit more information on this subject:

$ ls /sys/bus/usb/devices
1-0:1.0  3-7:1.1      5-2.1.1.2      5-2.5        6-2.3.4
2-0:1.0  3-7:1.2      5-2.1.1.2:1.0  5-2.5:1.0    6-2.3.4:1.0
3-0:1.0  4-0:1.0      5-2.1.1.2:1.1  6-0:1.0      usb1
3-3      5-0:1.0      5-2.1.1.2:1.2  6-2          usb2
3-3:1.0  5-1          5-2.1.1.2:1.3  6-2.1        usb3
3-4      5-2          5-2.3          6-2:1.0      usb4
3-4:1.0  5-2.1        5-2.3:1.0      6-2.1:1.0    usb5
3-4:1.1  5-2:1.0      5-2.3.4        6-2.1.2      usb6
3-4:1.2  5-2.1.1      5-2.3.4:1.0    6-2.1.2:1.0
3-7      5-2.1:1.0    5-2.3.4.3      6-2.3
3-7:1.0  5-2.1.1:1.0  5-2.3.4.3:2.0  6-2.3:1.0

And the missing device is 5-1 and looks like this:
$ cd /sys/bus/usb/devices/5-1
$ ls_name_value
authorized : 1
avoid_reset_quirk : 0
bcdDevice : 0200
bConfigurationValue : 1
bDeviceClass : 11
bDeviceProtocol : 00
bDeviceSubClass : 00
bmAttributes : c0
bMaxPacketSize0 : 64
bMaxPower : 0mA
bNumConfigurations : 1
bNumInterfaces :  0
busnum : 5
configuration :
descriptors : <contains non-ASCII chars>
dev : 189:526
devnum : 15
devpath : 1
devspec : (null)
idProduct : 572b
idVendor : 0483
ltm_capable : no
manufacturer : STMicroelectronics
maxchild : 0
product : STEVAL-USBC2DP Type-C to DisplayPort adapter
quirks : 0x0
removable : unknown
remove :
rx_lanes : 1
serial : 00000000002B
speed : 12
tx_lanes : 1
uevent : MAJOR=189 MINOR=526 DEVNAME=bus/usb/005/015 DEVTYPE=usb_device 
DRIVER=usb PRODUCT=483/572b/200 TYPE=17/0/0 BUSNUM=005 DEVNUM=015
urbnum : 14
version :  2.01

That all looks correct.

The code in lsusb-t.c seems to assign a special meaning to "-1" devices
and there is only one of those: "5-1". And the device associated with
"5-1" is the one that does _not_ appear in the output of 'lsusb -t' but
does appear in the output of 'lsusb'.

Doug Gilbert



