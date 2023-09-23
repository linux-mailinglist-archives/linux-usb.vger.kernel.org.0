Return-Path: <linux-usb+bounces-533-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9758F7AC309
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 17:02:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 9CB721C2091B
	for <lists+linux-usb@lfdr.de>; Sat, 23 Sep 2023 15:02:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0C51D6AB;
	Sat, 23 Sep 2023 15:02:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC401D522
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 15:02:45 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 185611B9
	for <linux-usb@vger.kernel.org>; Sat, 23 Sep 2023 08:02:39 -0700 (PDT)
Received: (qmail 1349757 invoked by uid 1000); 23 Sep 2023 11:02:38 -0400
Date: Sat, 23 Sep 2023 11:02:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: burcheri.massimo+linux-usb@gmail.com
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: JMicron JMS567 and UAS
Message-ID: <f5f01c3d-04d7-4cbd-af03-7dcf6030e327@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
 <40f5fdcb-9de5-42a6-9898-a428c0116adf@rowland.harvard.edu>
 <1352baa835ecd1a6b7f49e0d08f440858a99189d.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1352baa835ecd1a6b7f49e0d08f440858a99189d.camel@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Sat, Sep 23, 2023 at 10:01:32AM +0200, Massimo Burcheri wrote:
> On Fri, 2023-09-22 at 09:59 -0400, Alan Stern wrote:
> > Maybe the problem isn't blacklisting at all; maybe your JMS567 device's 
> > firmware just doesn't support UAS.
> > 
> > I don't think you have posted the "lsusb -v" output for this device.  
> > What does it say?
> 
> Bus 004 Device 012: ID 152d:0567 JMicron Technology Corp. / JMicron USA Technology Corp. JMS567 SATA 6Gb/s bridge
> Device Descriptor:
>   bLength                18
>   bDescriptorType         1
>   bcdUSB               3.00
>   bDeviceClass            0 
>   bDeviceSubClass         0 
>   bDeviceProtocol         0 
>   bMaxPacketSize0         9
>   idVendor           0x152d JMicron Technology Corp. / JMicron USA Technology Corp.
>   idProduct          0x0567 JMS567 SATA 6Gb/s bridge
>   bcdDevice           52.03
>   iManufacturer           1 JMicron
>   iProduct                2 External USB 3.0
>   iSerial                 3 20170220000C3
>   bNumConfigurations      1
>   Configuration Descriptor:
>     bLength                 9
>     bDescriptorType         2
>     wTotalLength       0x002c
>     bNumInterfaces          1
>     bConfigurationValue     1
>     iConfiguration          0 
>     bmAttributes         0xc0
>       Self Powered
>     MaxPower                8mA
>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass         8 Mass Storage
>       bInterfaceSubClass      6 SCSI
>       bInterfaceProtocol     80 Bulk-Only

This is the Bulk-Only Transport interface (usb-storage).

>       iInterface              0 
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x02  EP 2 OUT
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0400  1x 1024 bytes
>         bInterval               0
>         bMaxBurst              15

And there's no UAS interface.  If one existed, this is where it would 
show up.

> Binary Object Store Descriptor:
>   bLength                 5
>   bDescriptorType        15
>   wTotalLength       0x0016
>   bNumDeviceCaps          2
>   USB 2.0 Extension Device Capability:
>     bLength                 7
>     bDescriptorType        16
>     bDevCapabilityType      2
>     bmAttributes   0x00000f0e
>       BESL Link Power Management (LPM) Supported
>     BESL value     3840 us 
>   SuperSpeed USB Device Capability:
>     bLength                10
>     bDescriptorType        16
>     bDevCapabilityType      3
>     bmAttributes         0x00
>     wSpeedsSupported   0x000e
>       Device can operate at Full Speed (12Mbps)
>       Device can operate at High Speed (480Mbps)
>       Device can operate at SuperSpeed (5Gbps)
>     bFunctionalitySupport   1
>       Lowest fully-functional device speed is Full Speed (12Mbps)
>     bU1DevExitLat          10 micro seconds
>     bU2DevExitLat          32 micro seconds
> Device Status:     0x000d
>   Self Powered
>   U1 Enabled
>   U2 Enabled

So that's very clear; the device's firmware does not support UAS.  You 
might be able to fix it with a firmware update.

Alan Stern

