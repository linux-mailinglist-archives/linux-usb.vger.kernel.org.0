Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 05C015A79AB
	for <lists+linux-usb@lfdr.de>; Wed, 31 Aug 2022 11:01:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231313AbiHaJBM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 Aug 2022 05:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231264AbiHaJBL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 Aug 2022 05:01:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A88B8A4E
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 02:01:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 17ADFB81DBA
        for <linux-usb@vger.kernel.org>; Wed, 31 Aug 2022 09:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 664CBC433D6;
        Wed, 31 Aug 2022 09:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1661936467;
        bh=Trs/xz6P6IsrLAPi8QQVwIKm/b8IBR7HnV+6ZWnxNFs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WbbS90H4IxKPSAX5roxcgKz+AABmB7ncSJkPLLaWcM9FFmR1dJo+I1I4s/R/YuNqj
         hpzuG2uQmRISB1wV2WMsVjJu8uImmIK6PNBeCkiQvIzHvZiizaJGFLE6RURbTpO1rA
         au61bdXdXbyG9cKe/2x42kpPm7CWQ+TfHH+D1Mqs=
Date:   Wed, 31 Aug 2022 11:01:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zenghongling <zhongling0719@126.com>
Cc:     stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v3] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <Yw8jUPFfYjwP+9jb@kroah.com>
References: <1661935657-24710-1-git-send-email-zhongling0719@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1661935657-24710-1-git-send-email-zhongling0719@126.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 31, 2022 at 04:47:37PM +0800, zenghongling wrote:
> The UAS mode of Thinkplus and Hiksemi is reported to fail to work on
> several platforms with the following error message:
> 
> [   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
>                endpoint or incorrect stream ring
> [   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
>                1b000000 05038000
> 
> And when running iozone will disconnect from the USB controller, then after
> re-connecting the device will be offlined and not working at all.
> 
> Signed-off-by: zenghongling <zhongling0719@126.com>
> ---
>  drivers/usb/storage/unusual_uas.h | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index cdff7dc..ddcdf1a 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -62,6 +62,12 @@ UNUSUAL_DEV(0x059f, 0x1061, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_IGNORE_UAS),
>  
> +UNUSUAL_DEV(0x090c, 0x2000, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /*
>   * Apricorn USB3 dongle sometimes returns "USBSUSBSUSBS" in response to SCSI
>   * commands in UAS mode.  Observed with the 1.28 firmware; are there others?
> @@ -142,6 +148,12 @@ UNUSUAL_DEV(0x0bc2, 0xab2a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
>  
> +UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
> +		"Hiksemi",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> @@ -184,6 +196,12 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
>  
> +UNUSUAL_DEV(0x17ef, 0x3899, 0x0000, 0x9999,
> +		"Thinkplus",
> +		"External HDD",
> +		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> +		US_FL_IGNORE_UAS),
> +
>  /* Reported-by: Hans de Goede <hdegoede@redhat.com> */
>  UNUSUAL_DEV(0x2109, 0x0711, 0x0000, 0x9999,
>  		"VIA",
> -- 
> 2.1.0
> 

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

- You did not specify a description of why the patch is needed, or
  possibly, any description at all, in the email body.  Please read the
  section entitled "The canonical patch format" in the kernel file,
  Documentation/SubmittingPatches for what is needed in order to
  properly describe the change.

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/SubmittingPatches for what needs to be done
  here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
