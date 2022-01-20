Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8F2495071
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 15:42:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242747AbiATOmY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 09:42:24 -0500
Received: from netrider.rowland.org ([192.131.102.5]:44139 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S232784AbiATOmX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 09:42:23 -0500
Received: (qmail 130619 invoked by uid 1000); 20 Jan 2022 09:42:22 -0500
Date:   Thu, 20 Jan 2022 09:42:22 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     linux-usb@vger.kernel.org, DocMAX <mail@vacharakis.de>
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <Yel0ztTJ8Fiim+h4@rowland.harvard.edu>
References: <40eecdd0-93bc-40c6-b8c0-f4ad4c6ffe59@t-8ch.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <40eecdd0-93bc-40c6-b8c0-f4ad4c6ffe59@t-8ch.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 20, 2022 at 08:28:30AM +0100, Thomas Weiﬂschuh wrote:
> Hi Alan,
> 
> I hava a IcyBox IB-3740-C31 [0], this device seems to be identical to the one
> here.

When you say "described here", do you mean "described earlier in this 
email thread"?  I ask because from the way you wrote that sentence, it 
looks like you mean that the device described in [0] seems to be 
identical to the one you have.

>  It has the same USB IDs and case design.
> It also has the serial number "4".
> The only difference it seems is the field bcdDevice which is "1.36" and the
> reported name is different (see the patch below).
> 
> So I adapted the patch slightly to also match that bcdDevice.
> I also changed the productName field but that does not seem to be used anyways.
> 
> Using the quirk flags "fgkm" as mentioned in [1] did not help.
> 
> FYI while there are many reports that UAS does not work with these devices,
> there also are a few that report it working. For example [2].

That's odd.  And I don't really want to change the kernel in a way that 
will cause those working devices to stop working with UAS.

> diff --git a/drivers/usb/storage/unusual_devs.h b/drivers/usb/storage/unusual_devs.h
> index 29191d33c0e3..53e8249644b2 100644
> --- a/drivers/usb/storage/unusual_devs.h
> +++ b/drivers/usb/storage/unusual_devs.h
> @@ -2301,6 +2301,19 @@ UNUSUAL_DEV(  0x2027, 0xa001, 0x0000, 0x9999,
>                 USB_SC_DEVICE, USB_PR_DEVICE, usb_stor_euscsi_init,
>                 US_FL_SCM_MULT_TARG ),
> 
> +UNUSUAL_DEV( 0x2109, 0x0715, 0x0000, 0x9999,
> +               "VIA Labs, Inc.",
> +               "VL817 SATA Adaptor",
> +               USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +               US_FL_IGNORE_UAS),

Does the new patch fix your problem?

Alan Stern

> This is the exact issue:
> 
> [ 3606.231973] scsi host14: uas_eh_device_reset_handler start
> [ 3606.232149] sd 14:0:0:0: [sdg] tag#2 uas_zap_pending 0 uas-tag 1 inflight: CMD
> [ 3606.232154] sd 14:0:0:0: [sdg] tag#2 CDB: Write(16) 8a 00 00 00 00 00 18 0c c9 80 00 00 00 80 00 00
> [ 3606.306257] usb 4-4.4: reset SuperSpeed Plus Gen 2x1 USB device number 11 using xhci_hcd
> [ 3606.328584] scsi host14: uas_eh_device_reset_handler success
> 
> For this patch:
> 
> Tested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> 
> Thomas
> 
> [0] https://icybox.de/en/product.php?id=155
> [1] https://lore.kernel.org/linux-usb/c4b4aa34-12d9-7000-6398-d94a7ebffdfc@suse.com/
> [2] https://spod.cx/blog/enabling_trim_support_via_VL817_usb_sata_adaptor.shtml
