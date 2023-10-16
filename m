Return-Path: <linux-usb+bounces-1701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E99257CB320
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 21:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 261E51C2094A
	for <lists+linux-usb@lfdr.de>; Mon, 16 Oct 2023 19:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2EE339BA;
	Mon, 16 Oct 2023 19:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD8A30F92
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 19:05:42 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 20E13A2
	for <linux-usb@vger.kernel.org>; Mon, 16 Oct 2023 12:05:41 -0700 (PDT)
Received: (qmail 154127 invoked by uid 1000); 16 Oct 2023 15:05:40 -0400
Date: Mon, 16 Oct 2023 15:05:40 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: burcheri.massimo+linux-usb@gmail.com,
  linux-usb <linux-usb@vger.kernel.org>
Subject: Re: JMicron JMS567 and UAS
Message-ID: <fc10752f-5b63-4aed-805e-3e60e8e18e48@rowland.harvard.edu>
References: <5d8cad13445172d02a371f162ceaea1a68819819.camel@gmail.com>
 <a5b48a53-9dff-4a84-9a58-1c08f0e0781b@rowland.harvard.edu>
 <072417fd7806d86e930bccb882460dbbfaa5ca52.camel@gmail.com>
 <0919e02b-e395-438c-b4d6-314d7e108639@rowland.harvard.edu>
 <7f8396ae597a78969811011034a7e5f759a6564e.camel@gmail.com>
 <c3cd0de5-e8f3-4edb-bcaa-abf29ce5928b@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3cd0de5-e8f3-4edb-bcaa-abf29ce5928b@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 16, 2023 at 09:37:06AM +0200, Oliver Neukum wrote:
> 
> 
> On 22.09.23 15:23, Massimo Burcheri wrote:
> > It's not blacklisted here afaik. This would be done in /etc/modprobe.d/*.conf
> > and I have no entry about that device.
> > 
> > So you mean if not blacklisted by kernel and not locally blacklisted, uas is
> > just not supported by that firmware? I'm going to check if I can just try other
> > firmwares that were reported to support uas.
> > 
> > In the past I already got an enclosure supporting uas by just switching the
> > firmware...that was:
> > 
> > Nov 23 10:25:27 [kernel] usb 4-6: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> > Nov 23 10:25:27 [kernel] usb 4-6: New USB device found, idVendor=174c, idProduct=55aa, bcdDevice= 1.00
> > Nov 23 10:25:27 [kernel] usb 4-6: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> > Nov 23 10:25:27 [kernel] usb 4-6: Product: USB3-SATA-UASP1(modForGentoo)
> > Nov 23 10:25:27 [kernel] usb 4-6: Manufacturer: StoreJet Transcend
> 
> Hi,
> 
> sorry, this seems to have fallen through the cracks.
> I think we have some sort of confusion here. Could you first
> of all give us "lsusb -v" for your device?

Massimo did provide the "lsusb -v" listing here:

https://lore.kernel.org/linux-usb/1352baa835ecd1a6b7f49e0d08f440858a99189d.camel@gmail.com/

It showed that his device's current firmware does not support UAS.  So 
it won't work at very high speed without a firmware upgrade.

Alan Stern

