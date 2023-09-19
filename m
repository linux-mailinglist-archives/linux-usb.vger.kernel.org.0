Return-Path: <linux-usb+bounces-383-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9057A67BD
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 17:14:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA0F028187F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Sep 2023 15:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD9FB3B7B4;
	Tue, 19 Sep 2023 15:13:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C343B793
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 15:13:46 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id EB34CBE
	for <linux-usb@vger.kernel.org>; Tue, 19 Sep 2023 08:13:43 -0700 (PDT)
Received: (qmail 1192133 invoked by uid 1000); 19 Sep 2023 11:13:43 -0400
Date: Tue, 19 Sep 2023 11:13:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: burcheri.massimo+linux-usb@gmail.com
Cc: linux-usb <linux-usb@vger.kernel.org>
Subject: Re: JMicron JMS567 and UAS
Message-ID: <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue, Sep 19, 2023 at 03:34:21PM +0200, Massimo Burcheri wrote:
> Hi,
> 
> coming from https://lore.kernel.org/all/20200818041324.GA3173@Susan/
> 
> as I understand UAS was working for JMicron JMS567 in the past, then was
> disabled in the kernel, now using usb-storage.

How did you get that idea?  After looking through the email archives, I 
found this bug report from 2015:

	https://bugzilla.redhat.com/show_bug.cgi?id=1260207

> Why? The hardware should support UAS and does so on Windows. Before 5.4 it was
> working with UAS on Linux as well.

That bug report indicates that the device wasn't working properly with a 
4.1.4 kernel.  Of course, it's possible that the problem had more to do 
with the drive inside the enclosure than the enclosure itself.

> I purchased a 5-bay USB enclosure "ORICO DS500U3" but UAS is not working:
>   4-5               152d:0567 00 1IF  [USB 3.00,  5000 Mbps,   8mA] (JMicron
> External USB 3.0 20170331000C3)
> 
>     |__ Port 5: Dev 8, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> 
> Aug 28 18:47:09 [kernel] usb 4-5: new SuperSpeed USB device number 8 using xhci_hcd
> Aug 28 18:47:09 [kernel] usb 4-5: New USB device found, idVendor=152d, idProduct=0567, bcdDevice=52.03
> Aug 28 18:47:09 [kernel] usb 4-5: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> Aug 28 18:47:09 [kernel] usb 4-5: Product: External USB 3.0
> Aug 28 18:47:09 [kernel] usb 4-5: Manufacturer: JMicron
> Aug 28 18:47:09 [kernel] usb 4-5: SerialNumber: 20170220000C3
> Aug 28 18:47:09 [kernel] usb-storage 4-5:1.0: USB Mass Storage device detected
> Aug 28 18:47:09 [kernel] usb-storage 4-5:1.0: Quirks match for vid 152d pid 0567: 5000000
> Aug 28 18:47:09 [kernel] scsi host8: usb-storage 4-5:1.0
> Aug 28 18:47:09 [mtp-probe] checking bus 4, device 8: "/sys/devices/pci0000:00/0000:00:14.0/usb4/4-5"
> Aug 28 18:47:09 [mtp-probe] bus: 4, device: 8 was not an MTP device
> 
> With a mdraid raid0 and 5x1TB discs I get only about 72MiB/s to the raid0 which
> is really slow. UAS could do more.
> 
> Is there any chance UAS could get fixed for that device in the future? At least
> is seems to have worked someday with older kernels?

How do you know this?

Alan Stern

