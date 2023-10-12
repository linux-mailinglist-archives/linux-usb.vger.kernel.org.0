Return-Path: <linux-usb+bounces-1511-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A5A7C7072
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 16:38:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E166282991
	for <lists+linux-usb@lfdr.de>; Thu, 12 Oct 2023 14:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44CDF208D2;
	Thu, 12 Oct 2023 14:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84646883E
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 14:38:35 +0000 (UTC)
Received: from mp-relay-02.fibernetics.ca (mp-relay-02.fibernetics.ca [208.85.217.137])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD84DB8
	for <linux-usb@vger.kernel.org>; Thu, 12 Oct 2023 07:38:33 -0700 (PDT)
Received: from mailpool-fe-01.fibernetics.ca (mailpool-fe-01.fibernetics.ca [208.85.217.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mp-relay-02.fibernetics.ca (Postfix) with ESMTPS id E72097633E;
	Thu, 12 Oct 2023 14:38:32 +0000 (UTC)
Received: from localhost (mailpool-mx-02.fibernetics.ca [208.85.217.141])
	by mailpool-fe-01.fibernetics.ca (Postfix) with ESMTP id DB61347336;
	Thu, 12 Oct 2023 14:38:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at 
X-Spam-Score: -1.001
X-Spam-Level:
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mailpool-fe-01.fibernetics.ca ([208.85.217.144])
	by localhost (mail-mx-02.fibernetics.ca [208.85.217.141]) (amavisd-new, port 10024)
	with ESMTP id 0kFK74NYVdfb; Thu, 12 Oct 2023 14:38:32 +0000 (UTC)
Received: from [192.168.48.17] (host-104-157-209-188.dyn.295.ca [104.157.209.188])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dgilbert@interlog.com)
	by mail.ca.inter.net (Postfix) with ESMTPSA id CE41E47332;
	Thu, 12 Oct 2023 14:38:31 +0000 (UTC)
Message-ID: <723ee63c-1eb6-490d-9327-2856601573f7@interlog.com>
Date: Thu, 12 Oct 2023 10:38:31 -0400
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
 <2023091638-duration-barcode-73a3@gregkh>
 <11b1687f-3419-4037-845e-ef33d4e3871f@interlog.com>
 <2023101139-puma-fanfare-8a0e@gregkh>
 <299d927f-7044-4d48-b6cd-c05bdb0e7fcc@rowland.harvard.edu>
 <0c2a2a23-28dd-4c83-b7af-d5421501e411@interlog.com>
 <2023101203-marine-chatter-692e@gregkh>
Content-Language: en-CA
From: Douglas Gilbert <dgilbert@interlog.com>
In-Reply-To: <2023101203-marine-chatter-692e@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 2023-10-12 08:50, Greg KH wrote:
> On Wed, Oct 11, 2023 at 02:51:28PM -0400, Douglas Gilbert wrote:
>> On 2023-10-11 11:00, Alan Stern wrote:
>>> On Wed, Oct 11, 2023 at 11:30:39AM +0200, Greg KH wrote:
>>>> On Thu, Oct 05, 2023 at 10:49:10PM -0400, Douglas Gilbert wrote:
>>>>> The code in lsusb-t.c seems to assign a special meaning to "-1" devices
>>>>> and there is only one of those: "5-1". And the device associated with
>>>>> "5-1" is the one that does _not_ appear in the output of 'lsusb -t' but
>>>>> does appear in the output of 'lsusb'.
>>>>
>>>> The code patch of the '-t' option in lsusb is totally separate and apart
>>>> from the "normal" portion of lsusb, as you note, it is a separate .c
>>>> file as well.  -t uses the sysfs representation of the USB devices,
>>>> while the other code path uses the 'libusb' representation of the USB
>>>> devices.  And those seem to differ here (as they do for everyone.)
>>>>
>>>> So if someone wants to take the time to figure out which representation
>>>> is "more correct", that would be great.  I don't have the bandwidth to
>>>> do so for the next few weeks due to travel requirements on my end,
>>>> sorry.
>>>
>>> Doug, I've looked through the source code in lsusb-t.c (usbutils 015)
>>> and I didn't notice any place where it treats device names containing
>>> "-1" specially.  Can you point it out?
>>>
>>> Also, if I suggested some debugging additions to the source file, would
>>> you be able to build them and test the result?
>>
>> Hi Alan,
>> Attached is a patch that adds support for a '-S <sysroot>' option to lsusb from
>> usbutils found in GKH's github account. It only works when the '-t' option is
>> given to show USB devices in a tree like representation. Without the '-t' option
>> lsusb uses the enumeration services in libusb. The 'lsusb' invocation does find
>> the device at /tmp/sys/bus/usb/devices/5-1 which is a "product : STEVAL-USBC2DP
>> Type-C to DisplayPort adapter" made by ST Micro.
>>
>> Also attached is a pruned representation of /sys and /dev from my machine which
>> is a Thinkpad X13 G3 with a Lenovo TB3 dock [40AN] connected via USB-C. The
>> "missing" adapter is connected to that dock. However that indirect
>> connection
>> is probably _not_ significant since if I move that dongle to the other USB-C
>> receptacle on the X13G3 (it has two), the same seen/not_seen issue is
>> reproduced. And with the direct connect the adapter moves to
>> /sys/bus/usb/devices/3-5 . So that debunks my theory that the "1" in the "5-1"
>> is somehow significant.
>>
>> The attached files differ from those I sent to GKH in one important respect.
>> I sent Greg my _whole_ sysfs, around 55,000 nodes and that would have included
>> serial numbers of my machine, my storage devices, MAC addresses, etc. In
>> the tarball attached below only about 5000 nodes are present after some
>> pruning with my clone_pseudo_fs utility (in my github account).
> 
> I've pushed all of the remaining pending changes for usbutils to the
> repo, and added a few of my own that makes the 'lsusb -t' output a bit
> more sane (sorted order, proper digit field width, etc.)
> 
> Can you try the latest version in github (or on kernel.org, they are
> mirrors) and show the output there?

Removed the Lenovo dock [40AN] to lessen the clutter.


   ~/usbutils$ ./lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 003 Device 002: ID 06cb:00f9 Synaptics, Inc.
Bus 003 Device 003: ID 5986:1177 Acer, Inc Integrated Camera
Bus 003 Device 004: ID 046d:c52b Logitech, Inc. Unifying Receiver
Bus 003 Device 005: ID 8087:0033 Intel Corp.
Bus 003 Device 012: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C to 
DisplayPort adapter
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub

   ~/usbutils$ ./lsusb -tv
/:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/1p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
/:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/3p, 20000M/x2
     ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 003.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/12p, 480M
     ID 1d6b:0002 Linux Foundation 2.0 root hub
     |__ Port 003: Dev 002, If 0, Class=Vendor Specific Class, Driver=, 12M
         ID 06cb:00f9 Synaptics, Inc.
     |__ Port 004: Dev 003, If 0, Class=Video, Driver=uvcvideo, 480M
         ID 5986:1177 Acer, Inc
     |__ Port 004: Dev 003, If 1, Class=Video, Driver=uvcvideo, 480M
         ID 5986:1177 Acer, Inc
     |__ Port 004: Dev 003, If 2, Class=Application Specific Interface, Driver=, 
480M
         ID 5986:1177 Acer, Inc
     |__ Port 007: Dev 004, If 0, Class=Human Interface Device, Driver=usbhid, 12M
         ID 046d:c52b Logitech, Inc. Unifying Receiver
     |__ Port 007: Dev 004, If 1, Class=Human Interface Device, Driver=usbhid, 12M
         ID 046d:c52b Logitech, Inc. Unifying Receiver
     |__ Port 007: Dev 004, If 2, Class=Human Interface Device, Driver=usbhid, 12M
         ID 046d:c52b Logitech, Inc. Unifying Receiver
     |__ Port 010: Dev 005, If 0, Class=Wireless, Driver=btusb, 12M
         ID 8087:0033 Intel Corp.
     |__ Port 010: Dev 005, If 1, Class=Wireless, Driver=btusb, 12M
         ID 8087:0033 Intel Corp.
/:  Bus 004.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/4p, 10000M
     ID 1d6b:0003 Linux Foundation 3.0 root hub


So ID 0483:572b (ST Micro DP dongle) still missing in the 'lsusb -t' output.

Also noticed that the -d and -D options are ignored, without warning, when
the '-t' option is given. If that is a feature, perhaps the manpage should
state that.

Doug Gilbert


