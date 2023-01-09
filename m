Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8186623DA
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 12:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234386AbjAILJG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 06:09:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbjAILJF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 06:09:05 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FA3140C2
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 03:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673262544; x=1704798544;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XNiG2FSSA67TWgajHrtAypTlv3UC/a37MaqXKSkFFrw=;
  b=QEPDxnpO6Vb7oi0vvh1Eq3UCANMXwiHR5gABQ1kMeKZiaR9x3PiJqIMA
   EPXb55m4oPycAWaB1BuJmYL/AzXDawV/kmFGCGAr64FRHjQ/TVVi2qXDu
   Rj40hXtzk+V9TuNGyhf95WF7PNp3cbmljk20pUyUczOSPqsb0/S4J01AC
   aHOwEoiDGbuh9gZ1wWT/Tyepvr7zH4bSlyf2/x0mKA/HEGZo3KbG+Zccx
   VdZdY4ld+Jm80RzGjiLEODRyfSkva23fDeTEyZJJivgKkalY3G7ftEANo
   Aw33UkfSRAVcq6zIiem2edin7XrvinQLY2ZVBd9K9lErkCNQledExTNgT
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="302547987"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="302547987"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 03:08:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="798983442"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="798983442"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 09 Jan 2023 03:08:56 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 09 Jan 2023 13:08:55 +0200
Date:   Mon, 9 Jan 2023 13:08:55 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to proceed: usci_acpi: PPM init failed (-110)
Message-ID: <Y7v1x7xSKyqj3rf6@kuha.fi.intel.com>
References: <YSX5Gewqat7zbEXY@kuha.fi.intel.com>
 <20210825092138.jmhbjx2innikurw2@fastboi.localdomain>
 <YSdIb+f+/cbRyBs1@kuha.fi.intel.com>
 <20210826114105.amyjjhslqhiqdw6e@fastboi.localdomain>
 <178d8c7ca72400c2aa12679d4532611d@cavoj.net>
 <Ye5wFVwQTWawdPPK@kuha.fi.intel.com>
 <23e8104421efcf0937168e0ac5489367@cavoj.net>
 <Yjw9n5FXHMp8TpsM@kuha.fi.intel.com>
 <d2952e0a1356d88f899d26173cc14205@cavoj.net>
 <Y7KtTBTNYeeR7v/C@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7KtTBTNYeeR7v/C@kuha.fi.intel.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 02, 2023 at 12:09:19PM +0200, Heikki Krogerus wrote:
> Hi Sam,
> 
> Sorry to keep you waiting.
> 
> On Thu, Dec 22, 2022 at 09:18:27PM +0100, Samuel Čavoj wrote:
> > Hi Heikki,
> > 
> > I gave this a hard look and figured out the issue. Long story short, the
> > firmware is clearing the CCI on EC RAM after copying from EC RAM to
> > system memory. This happens both when notifications are delivered and
> > when a read operation is explicitly performed via _DSM(read). What the
> > driver currently does after receiving a notification is performing an
> > explicit read. However by this time the CCI in EC RAM has been cleared
> > by the AML and the information is lost.
> > 
> > Details:
> > 
> > 1. _DSM(read) of the UCSI device:
> > 
> > Copies all relevant fields of the mailbox data structure from EC RAM
> > to a SystemMemory OperationRegion. The last field to be copied is the
> > CCI:
> > 
> >     [...]
> >     CCI0 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI0))
> >     CCI1 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI1))
> >     CCI2 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI2))
> >     CCI3 = \_SB.PCI0.SBRG.EC0.ECRD (RefOf (\_SB.PCI0.SBRG.EC0.CCI3))
> >     [...]
> > 
> > However, for some reason, this is followed by another two operations,
> > which zero-out half of the CCI:
> > 
> >     [...]
> >     \_SB.PCI0.SBRG.EC0.ECWT (Zero, RefOf (\_SB.PCI0.SBRG.EC0.CCI0))
> >     \_SB.PCI0.SBRG.EC0.ECWT (Zero, RefOf (\_SB.PCI0.SBRG.EC0.CCI3))
> > 
> > I don't know why this is present. This does not cause the problem,
> > however, only leads to issues if two explicit reads are performed
> > consecutively. What does cause problems with the current driver
> > implementation is:
> > 
> > 2. The event handler (_Q79)
> > 
> > The _Q79 event handler on my machine is responsible for the UCSI
> > notifications. It performs a copy from EC RAM to system memory and
> > triggers the 0x80 notification on the UCSI device (called UBTC).
> > The final instructions of this handler are:
> > 
> >     [...]
> >     ^^^^UBTC.CCI0 = CCI0 /* \_SB_.PCI0.SBRG.EC0_.CCI0 */
> >     ^^^^UBTC.CCI1 = CCI1 /* \_SB_.PCI0.SBRG.EC0_.CCI1 */
> >     ^^^^UBTC.CCI2 = CCI2 /* \_SB_.PCI0.SBRG.EC0_.CCI2 */
> >     ^^^^UBTC.CCI3 = CCI3 /* \_SB_.PCI0.SBRG.EC0_.CCI3 */
> >     USGC = 0xF1
> >     CCI0 = Zero // These two lines are the culprit
> >     CCI3 = Zero
> >     Local1 = ((Timer - Local0) / 0x2710)
> >     Notify (UBTC, 0x80) // Status Change
> >     Release (ECMT)
> > 
> > 
> > A side note:
> > I figured this out by booting up a Windows installation and convincing
> > the local kernel debugger to dump ACPI trace information to a file. The file
> > contained an outrageous amount of information with inconsistent formatting
> > (missing commas and stuff) for which I wrote an extremely janky parser in
> > Python. This let me examine the exact steps performed by the Windows driver.
> > And the difference I noticed is that the Linux driver was issuing a
> > _DSM(read)
> > after every notification, reading the already-zeroed-out CCI.
> > 
> > Patching the AML to remove the zeroing-out instructions seemed to work as
> > well, but I suppose this is not a good general solution.
> > 
> > Following is a prototype-grade patch, in essence performing soft-reads most
> > of
> > the time (i.e. just reading from the OpRegion and not calling _DSM) and
> > explicit
> > reads when necessary. I am unfortunately not familiar with the spec and the
> > hardware in the wild and I understand that it is possible that some devices
> > on
> > the other hand do not synchronize the mailbox when notifying and it needs to
> > be
> > done explicitly. I suppose we'd need a parameter to configure this behaviour
> > in
> > that case with a quirk system. The patch works on my system. Some other
> > issues
> > surface later, but I think they are related to a particular cheap dongle I
> > have
> > because they don't seem to occur without it.
> > 
> > What do you think about this situation? Is the patch reasonable, or does it
> > need
> > a significant re-think?
> 
> This is great! Thank you so much for figuring this one out!
> 
> I think your patch looks totally reasonable, but let me test it with
> a couple of different systems that I have. I'll check the event
> handlers from the ACPI tables. If that is how Windows works in
> general, then this is what has to be done.

I did not manage to test all the boards that I was hoping to test, but
I think we could move forward with this. Can you format the patch
properly and send it to this mailing list?

thanks,

-- 
heikki
