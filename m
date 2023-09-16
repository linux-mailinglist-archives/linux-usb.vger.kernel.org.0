Return-Path: <linux-usb+bounces-239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4017A2FA7
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 13:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 276DF282359
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 11:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4100C134DC;
	Sat, 16 Sep 2023 11:16:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F23134D2
	for <linux-usb@vger.kernel.org>; Sat, 16 Sep 2023 11:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42FF0C433C7;
	Sat, 16 Sep 2023 11:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1694862980;
	bh=Ck0MGp846SdWYfCq1wqpfyNcsVskbRO6OEB50/EPvvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F+eS2p3SRydjKGflASuNj0cezrDHksdxNP9DwovjHPWRdzJ3lxcGHoSA1Dr3g7UUU
	 hKJOg3nPGW4Bhl4Zh9dzoP0zlJfSa4YAzU3GZZe7yiI3VjtNDsQVvq69DXo741QgFG
	 o120r0OQi9Q1B3Lj85+XvjW/b4LNODtO4HubYgpo=
Date: Sat, 16 Sep 2023 13:16:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Douglas Gilbert <dgilbert@interlog.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: device present in lsusb, disappears in lsusb -t
Message-ID: <2023091638-duration-barcode-73a3@gregkh>
References: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <70c563f1-847c-32a1-cf4d-6bf9802017ab@interlog.com>

On Fri, Sep 15, 2023 at 08:16:18PM -0400, Douglas Gilbert wrote:
> The device in question is this one:
>   Bus 005 Device 015: ID 0483:572b STMicroelectronics STEVAL-USBC2DP Type-C
> to DisplayPort adapter. It is a USB-C alternate mode device (so tbtadm does
> not
> report it).
> 
> That adapter is connected to a screen (and working) and to a USB-C port on
> a Lenovo TB3 dock [40AN] which in turn is connected to a Thinkpad X13 Gen3's
> USB-C port. The Thinkpad is running lk 6.6.0-rc1 with "lsusb (usbutils) 014".
> 
> The strange thing is that this device is nowhere to be found in the output
> of "lsusb -t". The lsusb manpage describes the '-t' option as: "Tells
> lsusb to dump the physical USB device hierarchy as a tree." So is 'physical'
> a weasel word in this context, or is there a bug in the '-t' option, or is
> there some other explanation?

A number of 'lsusb -t' issues were fixed in the 015 release of usbutils,
so maybe update?

that being said, the -t option is a totally different codepath in the
tool, and shows different things overall.  -t shows the drivers that are
bound to the different interfaces, which means that a single device will
show up multiple times in the -t option.

Here's the output of the two things on my local laptop, with just a few
USB devices in it:

$ lsusb
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 003: ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd. Goodix USB2.0 MISC
Bus 003 Device 006: ID 0bda:5634 Realtek Semiconductor Corp. Laptop Camera
Bus 003 Device 004: ID 8087:0032 Intel Corp. AX210 Bluetooth
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

$ lsusb -t
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
    |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
    |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
    |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
    |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
    |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M

and then if you give the -v option as well you see a bit more:

$ lsusb -tv
/:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/12p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub
    |__ Port 7: Dev 6, If 0, Class=Video, Driver=uvcvideo, 480M
        ID 0bda:5634 Realtek Semiconductor Corp.
    |__ Port 7: Dev 6, If 1, Class=Video, Driver=uvcvideo, 480M
        ID 0bda:5634 Realtek Semiconductor Corp.
    |__ Port 9: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 12M
        ID 27c6:609c Shenzhen Goodix Technology Co.,Ltd.
    |__ Port 10: Dev 4, If 0, Class=Wireless, Driver=btusb, 12M
        ID 8087:0032 Intel Corp. AX210 Bluetooth
    |__ Port 10: Dev 4, If 1, Class=Wireless, Driver=btusb, 12M
        ID 8087:0032 Intel Corp. AX210 Bluetooth
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 20000M/x2
    ID 1d6b:0003 Linux Foundation 3.0 root hub
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/1p, 480M
    ID 1d6b:0002 Linux Foundation 2.0 root hub


What are you seeing missing in your output?

thanks,

greg k-h

