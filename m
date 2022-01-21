Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 344C8496665
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jan 2022 21:39:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbiAUUjn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jan 2022 15:39:43 -0500
Received: from todd.t-8ch.de ([159.69.126.157]:32825 "EHLO todd.t-8ch.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229510AbiAUUjm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 21 Jan 2022 15:39:42 -0500
Date:   Fri, 21 Jan 2022 21:39:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
        s=mail; t=1642797578;
        bh=fAQKnlBkjPm7GFoXb3bZyicN6d0FbYpl8DSKXtfV9L8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dqg7tmS9kctFDm0jasiABwgea7l0N3TL+R69Y099wJ7rVSnpHzhzHFdJe0rL3V3iR
         UZZ3QRRnWxTxtY9CzjJG/y1Yyiit0jLB/LfWQuVHQX+SdZNQqSILHHvYSLaWXM1iAn
         KraSeqvd8c2SkKyFo3+ZfOUIDhq6TD9SR/6Baj7Y=
From:   Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-usb@vger.kernel.org, DocMAX <mail@vacharakis.de>
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <dec15b41-68cc-4d1c-aba7-c726407c0646@t-8ch.de>
References: <40eecdd0-93bc-40c6-b8c0-f4ad4c6ffe59@t-8ch.de>
 <Yel0ztTJ8Fiim+h4@rowland.harvard.edu>
 <d92b2a69-d464-43b7-a234-f3d685419ad0@t-8ch.de>
 <YemiORE5xD+O6CFA@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YemiORE5xD+O6CFA@rowland.harvard.edu>
Jabber-ID: thomas@t-8ch.de
X-Accept: text/plain, text/html;q=0.2, text/*;q=0.1
X-Accept-Language: en-us, en;q=0.8, de-de;q=0.7, de;q=0.6
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2022-01-20 12:56-0500, Alan Stern wrote:
> On Thu, Jan 20, 2022 at 06:39:51PM +0100, Thomas Weißschuh wrote:
> > Hi Alan,
> > 
> > On 2022-01-20 09:42-0500, Alan Stern wrote:
> > > On Thu, Jan 20, 2022 at 08:28:30AM +0100, Thomas Weißschuh wrote:
> > > > Hi Alan,
> > > > 
> > > > I hava a IcyBox IB-3740-C31 [0], this device seems to be identical to the one
> > > > here.
> > > 
> > > When you say "described here", do you mean "described earlier in this 
> > > email thread"?  I ask because from the way you wrote that sentence, it 
> > > looks like you mean that the device described in [0] seems to be 
> > > identical to the one you have.
> > 
> > I meant the one described in this thread. I have the one sold at [0], which
> > looks identical except for the logo to the one described in the thread.
> > >
> > > >  It has the same USB IDs and case design.
> > > > It also has the serial number "4".
> > > > The only difference it seems is the field bcdDevice which is "1.36" and the
> > > > reported name is different (see the patch below).
> > > > 
> > > > So I adapted the patch slightly to also match that bcdDevice.
> > > > I also changed the productName field but that does not seem to be used anyways.
> > > > 
> > > > Using the quirk flags "fgkm" as mentioned in [1] did not help.
> > > > 
> > > > FYI while there are many reports that UAS does not work with these devices,
> > > > there also are a few that report it working. For example [2].
> > > 
> > > That's odd.  And I don't really want to change the kernel in a way that 
> > > will cause those working devices to stop working with UAS.
> > 
> > This is why I brought it up. There are however many more reports online for
> > those devices where UAS does not work.
> 
> It's a bad situation.  It would be nice if we could figure out why some 
> of them work and others don't.  Also, do these same devices work with UAS 
> in Windows or Mac OSX?

The reports in both directions are all for Linux.
I don't have the setup to test it either, sorry.

> > > > diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> > > > index 29191d33c0e3..53e8249644b2 100644
> > > > --- a/drivers/usb/storage/unusual_devs.h
> > > > +++ b/drivers/usb/storage/unusual_devs.h
> > > > @@ -2301,6 +2301,19 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
> > > >                 USB_SC_DEVICE, USB_PR_DEVICE, usb_stor_euscsi_init,
> > > >                 US_FL_SCM_MULT_TARG ),
> > > > 
> > > > +UNUSUAL_DEV( 0x2109, 0x0715, 0x0000, 0x9999,
> > > > +               "VIA Labs, Inc.",
> > > > +               "VL817 SATA Adaptor",
> > > > +               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> > > > +               US_FL_IGNORE_UAS),
> > > 
> > > Does the new patch fix your problem?
> > 
> > Yes it does. As does disabling UAS via the usb-storage quirk parameter.
> 
> All right.  I will submit the revised patch after the current merge 
> window is over.

Thanks!

> Alan Stern
> 
> > > Alan Stern
> > > 
> > > > This is the exact issue:
> > > > 
> > > > [ 3606.231973] scsi host14: uas_eh_device_reset_handler start
> > > > [ 3606.232149] sd 14:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 1 inflight: CMD
> > > > [ 3606.232154] sd 14:0:0:0: [sdg] tag#2 CDB: Write(16) 8a 00 00 00 00 00 18 0c c9 80 00 00 00 80 00 00
> > > > [ 3606.306257] usb 4-4.4: reset SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
> > > > [ 3606.328584] scsi host14: uas_eh_device_reset_handler success
> > > > 
> > > > For this patch:
> > > > 
> > > > Tested-by: Thomas Weißschuh <linux@weissschuh.net>
> > > > 
> > > > Thomas
> > > > 
> > > > [0] https://icybox.de/en/product.php?id=155
> > > > [1] https://lore.kernel.org/linux-usb/c4b4aa34-12d9-7000-6398-d94a7ebffdfc@suse.com/
> > > > [2] https://spod.cx/blog/enabling_trim_support_via_VL817_usb_sata_adaptor.shtml
> > 
> > Thomas
