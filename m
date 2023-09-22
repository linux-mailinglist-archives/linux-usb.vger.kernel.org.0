Return-Path: <linux-usb+bounces-512-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 833247AB32F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 15:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by am.mirrors.kernel.org (Postfix) with ESMTP id DB4561F22D54
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 13:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDE433D973;
	Fri, 22 Sep 2023 13:59:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E253200BE
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 13:59:33 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id EAC5792
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 06:59:30 -0700 (PDT)
Received: (qmail 1313416 invoked by uid 1000); 22 Sep 2023 09:59:30 -0400
Date: Fri, 22 Sep 2023 09:59:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: burcheri.massimo+linux-usb@gmail.com
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: JMicron JMS567 and UAS
Message-ID: <40f5fdcb-9de5-42a6-9898-a428c0116adf@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Fri, Sep 22, 2023 at 03:23:29PM +0200, Massimo Burcheri wrote:
> On Thu, 2023-09-21 at 10:23 -0400, Alan Stern wrote:
> 
> > > > > coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan/
> 
> > That email refers to vendor & product 357d:7788.  But your device, as 
> > shown in the earlier email message, is 152d:0567.  So it's puzzling why 
> > you referred back to this bug report, even though the devices do have 
> > similar names (JMicron J566 and J567).
> 
> Sorry for confusing.
> I wrote to Cyril Roelandt and he said that he noticed that old thread had a typo
> with JMS566 and he was actually using the same JMS567 at that time.
> 
> Though productIds are still different:
> 
> Old thread:
> [Tue Aug 18 05:14:19 2020] usb 2-2: New USB device found, idVendor=357d, idProduct=7788, bcdDevice= 1.14
> [Tue Aug 18 05:14:19 2020] usb 2-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> 
> My Log:
> Aug 27 19:00:47 [kernel] usb 4-5: New USB device found, idVendor=152d, idProduct=0567, bcdDevice=52.03
> Aug 27 19:00:47 [kernel] usb 4-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3

Okay.  Let's forget about the 357d:7788 device and focus on your 
152d:0567 device.  That will help reduce the confusion.

> > If you can, start by figuring out why your kernel isn't using the uas 
> > driver for the JMS567.  Is the driver itself blacklisted on your 
> > computer?
> 
> It's not blacklisted here afaik. This would be done in /etc/modprobe.d/*.conf
> and I have no entry about that device.
> 
> So you mean if not blacklisted by kernel and not locally blacklisted, uas is
> just not supported by that firmware? I'm going to check if I can just try other
> firmwares that were reported to support uas.
> 
> In the past I already got an enclosure supporting uas by just switching the
> firmware...that was:
> 
> Nov 23 10:25:27 [kernel] usb 4-6: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> Nov 23 10:25:27 [kernel] usb 4-6: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
> Nov 23 10:25:27 [kernel] usb 4-6: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> Nov 23 10:25:27 [kernel] usb 4-6: Product: USB3-SATA-UASP1(modForGentoo)
> Nov 23 10:25:27 [kernel] usb 4-6: Manufacturer: StoreJet Transcend

Maybe the problem isn't blacklisting at all; maybe your JMS567 device's 
firmware just doesn't support UAS.

I don't think you have posted the "lsusb -v" output for this device.  
What does it say?

Alan Stern

