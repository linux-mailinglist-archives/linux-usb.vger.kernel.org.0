Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E59F12E90E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2020 18:03:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728880AbgABRDY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jan 2020 12:03:24 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:45108 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728824AbgABRDY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Jan 2020 12:03:24 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AECC516;
        Thu,  2 Jan 2020 18:03:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1577984600;
        bh=Z5DB6kcL/dyxcOp4S6pQQ3Rv4v8IF2Vv8vSAIm+M1pI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zo1h+euU0czNKXEId8RNKVrUwLql/YFJLJfSi/U/SQCq9EuAi8/O/BoniJSK9wEx4
         atVYOYpM06bQQU8Tj0z/a1QmVqoGYqM5KdL79KpFjrDO+esQkMPk5vT9EWGoyTD89x
         kjFymnrBhl43Ay0rSMR/v1XT6PLM1OlFACuSIQuQ=
Date:   Thu, 2 Jan 2020 19:03:10 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Roger Whittaker <Roger.Whittaker@suse.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Takashi Iwai <tiwai@suse.de>, Johan Hovold <johan@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Takashi Iwai <tiwai@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Certain cameras no longer working with uvcvideo on recent
 (openSUSE) kernels
Message-ID: <20200102170310.GF4843@pendragon.ideasonboard.com>
References: <s5hr20ingu5.wl-tiwai@suse.de>
 <Pine.LNX.4.44L0.2001021003130.1546-100000@iolanthe.rowland.org>
 <20200102163807.GE4843@pendragon.ideasonboard.com>
 <20200102165738.GA26369@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200102165738.GA26369@suse.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Roger,

On Thu, Jan 02, 2020 at 04:57:42PM +0000, Roger Whittaker wrote:
> On Thu, Jan 02, 2020 at 06:38:07PM +0200, Laurent Pinchart wrote:
> 
> > Roger, would you be able to set the uvcvideo trace module parameter to
> > 0xffff before plugging the device, and provide the messages printed by
> > the driver to the kernel log both with and without the above commit ?
> 
> With 5.3.12-2-default, loading uvcvideo with
> 
> options uvcvideo trace=0xffff

Thank you.

> On plugging:
> 
> [   73.571566] usb 1-1.4.3.1: new high-speed USB device number 12 using xhci_hcd
> [   73.729180] usb 1-1.4.3.1: config 1 interface 2 altsetting 0 endpoint 0x82 has wMaxPacketSize 0, skipping
> [   73.729552] usb 1-1.4.3.1: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
> [   73.729558] usb 1-1.4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [   73.729561] usb 1-1.4.3.1: Product: IPEVO Point 2 View
> [   73.729564] usb 1-1.4.3.1: Manufacturer: IPEVO Inc.
> [   73.732670] hid-generic 0003:1778:0214.0009: hiddev98,hidraw8: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.1/input0
> [   73.781765] videodev: Linux video capture interface: v2.00
> [   73.807553] uvcvideo: Probing generic UVC device 1.4.3.1
> [   73.807693] uvcvideo: no class-specific streaming interface descriptors found.

It seems that Alan's patch causes more than the endpoint to be ignored.

> [   73.807728] uvcvideo: Found a Status endpoint (addr 81).
> [   73.807730] uvcvideo: Found UVC 1.00 device IPEVO Point 2 View (1778:0214)
> [   73.807759] uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 1: -32 (exp. 1).
> [   73.807832] uvcvideo: Control error 6
> [   73.807834] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.4.3.1 entity 1
> [   73.807835] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
> [   73.807876] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/6 to device 1.4.3.1 entity 1
> [   73.807877] uvcvideo: Adding mapping 'Focus (absolute)' to control 00000000-0000-0000-0000-000000000001/6.
> [   73.807918] uvcvideo: Failed to query (GET_INFO) UVC control 9 on unit 1: -32 (exp. 1).
> [   73.807996] uvcvideo: Control error 6
> [   73.807997] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/9 to device 1.4.3.1 entity 1
> [   73.807998] uvcvideo: Adding mapping 'Iris, Absolute' to control 00000000-0000-0000-0000-000000000001/9.
> [   73.808037] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/8 to device 1.4.3.1 entity 1
> [   73.808038] uvcvideo: Adding mapping 'Focus, Auto' to control 00000000-0000-0000-0000-000000000001/8.
> [   73.808079] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.4.3.1 entity 3
> [   73.808080] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> [   73.808119] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.4.3.1 entity 3
> [   73.808120] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> [   73.808159] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.4.3.1 entity 3
> [   73.808160] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> [   73.808205] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.4.3.1 entity 3
> [   73.808206] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> [   73.808255] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.4.3.1 entity 3
> [   73.808257] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
> [   73.808308] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.4.3.1 entity 3
> [   73.808309] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
> [   73.808349] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.4.3.1 entity 3
> [   73.808350] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
> [   73.808389] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.4.3.1 entity 3
> [   73.808390] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
> [   73.808431] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.4.3.1 entity 3
> [   73.808432] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
> [   73.808434] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1
> [   73.808437] uvcvideo: Found a valid video chain (1 -> 2).
> [   73.808438] uvcvideo: No streaming interface found for terminal 2.
> [   73.808442] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Extension 4 was not initialized!
> [   73.808444] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Processing 3 was not initialized!
> [   73.808446] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Camera 1 was not initialized!
> [   73.808542] input: IPEVO Point 2 View: IPEVO Point as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.4/1-1.4.3/1-1.4.3.1/1-1.4.3.1:1.1/input/input21
> [   73.808590] uvcvideo: UVC device initialized.
> [   73.808636] usbcore: registered new interface driver uvcvideo
> [   73.808637] USB Video Class driver (1.1.1)
> [   75.899721] uvcvideo: Suspending interface 1
> 
> 
> ------------------------------------------------------------------------
> 
> With 5.4.7-1.g43720a7-default (the kernel Takashi built with commit
> d482c7bb0541 reverted), loading uvcvideo with
> 
> options uvcvideo trace=0xffff
> 
> On plugging:
> 
> [  267.765563] usb 1-1.4.3.1: new high-speed USB device number 13 using xhci_hcd
> [  267.879567] usb 1-1.4.3.1: New USB device found, idVendor=1778, idProduct=0214, bcdDevice= 7.07
> [  267.879573] usb 1-1.4.3.1: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [  267.879577] usb 1-1.4.3.1: Product: IPEVO Point 2 View
> [  267.879580] usb 1-1.4.3.1: Manufacturer: IPEVO Inc.
> [  267.882718] hid-generic 0003:1778:0214.000A: hiddev98,hidraw7: USB HID v1.10 Device [IPEVO Inc. IPEVO Point 2 View] on usb-0000:00:14.0-1.4.3.1/input0
> [  267.883135] uvcvideo: Probing generic UVC device 1.4.3.1
> [  267.883260] uvcvideo: trying extra data from endpoint 0.
> [  267.883265] uvcvideo: Found format YUV 4:2:2 (YUYV).
> [  267.883268] uvcvideo: - 640x480 (30.0 fps)
> [  267.883277] uvcvideo: - 320x240 (30.0 fps)
> [  267.883278] uvcvideo: - 800x600 (24.0 fps)
> [  267.883280] uvcvideo: - 1024x768 (15.0 fps)
> [  267.883282] uvcvideo: - 1280x1024 (8.0 fps)
> [  267.883284] uvcvideo: - 1600x1200 (4.0 fps)
> [  267.883286] uvcvideo: - 640x480 (30.0 fps)
> [  267.883288] uvcvideo: Found format MJPEG.
> [  267.883290] uvcvideo: - 640x480 (45.0 fps)
> [  267.883292] uvcvideo: - 320x240 (45.0 fps)
> [  267.883293] uvcvideo: - 800x600 (45.0 fps)
> [  267.883295] uvcvideo: - 1024x768 (30.0 fps)
> [  267.883297] uvcvideo: - 1280x1024 (15.0 fps)
> [  267.883299] uvcvideo: - 1600x1200 (8.0 fps)
> [  267.883301] uvcvideo: - 640x480 (45.0 fps)
> [  267.883310] uvcvideo: Found a Status endpoint (addr 81).
> [  267.883314] uvcvideo: Found UVC 1.00 device IPEVO Point 2 View (1778:0214)
> [  267.883380] uvcvideo: Failed to query (GET_INFO) UVC control 2 on unit 1: -32 (exp. 1).
> [  267.883411] uvcvideo: Control error 6
> [  267.883416] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/2 to device 1.4.3.1 entity 1
> [  267.883419] uvcvideo: Adding mapping 'Exposure, Auto' to control 00000000-0000-0000-0000-000000000001/2.
> [  267.883468] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/6 to device 1.4.3.1 entity 1
> [  267.883471] uvcvideo: Adding mapping 'Focus (absolute)' to control 00000000-0000-0000-0000-000000000001/6.
> [  267.883512] uvcvideo: Failed to query (GET_INFO) UVC control 9 on unit 1: -32 (exp. 1).
> [  267.883588] uvcvideo: Control error 6
> [  267.883590] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/9 to device 1.4.3.1 entity 1
> [  267.883593] uvcvideo: Adding mapping 'Iris, Absolute' to control 00000000-0000-0000-0000-000000000001/9.
> [  267.883642] uvcvideo: Added control 00000000-0000-0000-0000-000000000001/8 to device 1.4.3.1 entity 1
> [  267.883645] uvcvideo: Adding mapping 'Focus, Auto' to control 00000000-0000-0000-0000-000000000001/8.
> [  267.883694] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/2 to device 1.4.3.1 entity 3
> [  267.883696] uvcvideo: Adding mapping 'Brightness' to control 00000000-0000-0000-0000-000000000101/2.
> [  267.883745] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/3 to device 1.4.3.1 entity 3
> [  267.883747] uvcvideo: Adding mapping 'Contrast' to control 00000000-0000-0000-0000-000000000101/3.
> [  267.883795] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/6 to device 1.4.3.1 entity 3
> [  267.883797] uvcvideo: Adding mapping 'Hue' to control 00000000-0000-0000-0000-000000000101/6.
> [  267.883846] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/7 to device 1.4.3.1 entity 3
> [  267.883848] uvcvideo: Adding mapping 'Saturation' to control 00000000-0000-0000-0000-000000000101/7.
> [  267.883895] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/8 to device 1.4.3.1 entity 3
> [  267.883898] uvcvideo: Adding mapping 'Sharpness' to control 00000000-0000-0000-0000-000000000101/8.
> [  267.883947] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/9 to device 1.4.3.1 entity 3
> [  267.883949] uvcvideo: Adding mapping 'Gamma' to control 00000000-0000-0000-0000-000000000101/9.
> [  267.883999] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/10 to device 1.4.3.1 entity 3
> [  267.884002] uvcvideo: Adding mapping 'White Balance Temperature' to control 00000000-0000-0000-0000-000000000101/10.
> [  267.884050] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/5 to device 1.4.3.1 entity 3
> [  267.884053] uvcvideo: Adding mapping 'Power Line Frequency' to control 00000000-0000-0000-0000-000000000101/5.
> [  267.884101] uvcvideo: Added control 00000000-0000-0000-0000-000000000101/11 to device 1.4.3.1 entity 3
> [  267.884104] uvcvideo: Adding mapping 'White Balance Temperature, Auto' to control 00000000-0000-0000-0000-000000000101/11.
> [  267.884108] uvcvideo: Scanning UVC chain: OT 2 <- XU 4 <- PU 3 <- IT 1
> [  267.884117] uvcvideo: Found a valid video chain (1 -> 2).
> [  267.885020] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Extension 4 was not initialized!
> [  267.885025] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Processing 3 was not initialized!
> [  267.885028] uvcvideo 1-1.4.3.1:1.1: Entity type for entity Camera 1 was not initialized!
> [  267.885188] input: IPEVO Point 2 View: IPEVO Point as /devices/pci0000:00/0000:00:14.0/usb1/1-1/1-1.4/1-1.4.3/1-1.4.3.1/1-1.4.3.1:1.1/input/input22
> [  267.885266] uvcvideo: UVC device initialized.
> [  267.919845] uvcvideo: uvc_v4l2_open
> [  267.919884] uvcvideo: uvc_v4l2_release
> [  270.387236] uvcvideo: Suspending interface 2
> [  270.387241] uvcvideo: Suspending interface 1

-- 
Regards,

Laurent Pinchart
