Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC8A24948D2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jan 2022 08:46:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239398AbiATHqf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jan 2022 02:46:35 -0500
Received: from wout3-smtp.messagingengine.com ([64.147.123.19]:43273 "EHLO
        wout3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234741AbiATHqe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jan 2022 02:46:34 -0500
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id D1B563202100;
        Thu, 20 Jan 2022 02:46:33 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Thu, 20 Jan 2022 02:46:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm2; bh=9YNJfrHYBe5axM
        kOk+81R/sEDZaSPFFbOw6BDS3HkjM=; b=wJ1jvDO0fn69zdN8AiciPS9f2tarRg
        H1eUvuetsi5S3vQr0GFNbYJmPpJZMNvwq8qJ8ScMlBTcHeQulT1Swhb+bvacnelM
        RHPwRfLG92CHwFDf2OFI1YM8ov16KSDx2jmigucFN6x5XVwl2kdiMDaoLltplc/V
        AHzkEmNSyndyIanQkdTATkGtX4fJhs9SVbeM1zhrR25VR4s1qwOvhxVF9ookyidx
        jFK6mKV6QuFHcdQKVcIN/wMH5qVQV1Lr3Bw+6wj5sLNHSvr5ZE68MwvklPPYNzAC
        FybdgsR5yb61D3czHtKM/isu6aH75TzBPz/aGSkcmfVHYKUd/M0IMu5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=9YNJfrHYBe5axMkOk+81R/sEDZaSPFFbOw6BDS3Hk
        jM=; b=dvPddkG74+5YkCymL/h5+yQRBjzSnqtxDfnQLGVLmwywPaCHJqwXturJr
        mD+SmD6VqXsscTNoANFTUkSzxSzUCKYsoKsK8pdVcvrL4pbCXxFF28/eA5PtYKED
        yfTbDJe6OAOE++zHMQSeSL1Xk1QXDZJ5W8LbWofGkx16pD0FeFgKzsOOD+PALWtJ
        OX5I8jcIy+d576DL6Zzv8IU7Z09/qn4usKQwweVumxNdk2/x0/HkRVz5Xv2XAhg1
        jWtXH2rotGroWGgmmOQmTexckA5TzBhRN6TwdK30hAldLx7JyznPEnLf04+1ogBy
        AWVHFh+YhD35bxspw+3OjQva5YhMw==
X-ME-Sender: <xms:WBPpYdRLzYdA_51K8nVTpbMDn3SAFrXfzAbIhvnglxjq4UvOOjSC9w>
    <xme:WBPpYWzd70vuHr4n7wfAzBpi-9208FvD_E-2f32MePt6NFV3PYO3Tvw3dqvI3Lqrb
    bdspcU3Ssy63w>
X-ME-Received: <xmr:WBPpYS2nAJVSmJgQ-yinrhfHbEFIobqlI8WXV4aw0yw3mAWkYFoPv3C-Ha8eI25Ub-9HmDL3v15FR3ecYDw4sLLScyFClCVx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudejgdduuddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepifhrvghg
    ucfmjfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheffte
    dtgfejkedtgfevgfffjeevjefhgffgjeeuieehgeeuleevuedvkeeijedvnecuffhomhgr
    ihhnpehitgihsghogidruggvpdhkvghrnhgvlhdrohhrghdpshhpohgurdgtgienucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhr
    ohgrhhdrtghomh
X-ME-Proxy: <xmx:WBPpYVAI2W-PSdk-anCY3P1_cI3XR2n1LijXMi0S4wWPDWZqckDEOA>
    <xmx:WBPpYWgu5OIVV6TT-BAhZbugKKSI894TMizmX90_C1nm3BTkT8INcQ>
    <xmx:WBPpYZrOnxXwoyefg1Djh9Dtxu2Jju9LZ81S4GfN2C05c30y8OtH1g>
    <xmx:WRPpYRVONZ1qxM8B1AD4c0uV-2jXMQqdOctxG4f9IrZ2VjNdKMZnOg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jan 2022 02:46:32 -0500 (EST)
Date:   Thu, 20 Jan 2022 08:46:28 +0100
From:   Greg KH <greg@kroah.com>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        DocMAX <mail@vacharakis.de>
Subject: Re: Issue with UAS and" VIA Labs, Inc. VL817 SATA Adaptor"
Message-ID: <YekTVKze8cl5ffC4@kroah.com>
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
> here. It has the same USB IDs and case design.
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
> 
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
> 
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

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/email-clients.txt in order to fix this.

- Your patch does not have a Signed-off-by: line.  Please read the
  kernel file, Documentation/SubmittingPatches and resend it after
  adding that line.  Note, the line needs to be in the body of the
  email, before the patch, not at the bottom of the patch or in the
  email signature.

- You did not write a descriptive Subject: for the patch, allowing Greg,
  and everyone else, to know what this patch is all about.  Please read
  the section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what a proper Subject: line should
  look like.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
