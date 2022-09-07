Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0CE75B0B41
	for <lists+linux-usb@lfdr.de>; Wed,  7 Sep 2022 19:14:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbiIGROG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Sep 2022 13:14:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiIGRN5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Sep 2022 13:13:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 22EE3A50D6
        for <linux-usb@vger.kernel.org>; Wed,  7 Sep 2022 10:13:46 -0700 (PDT)
Received: (qmail 427043 invoked by uid 1000); 7 Sep 2022 13:13:45 -0400
Date:   Wed, 7 Sep 2022 13:13:45 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hongling Zeng <zenghongling@kylinos.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, zhongling0719@126.com
Subject: Re: [PATCH v2 3/3] uas: ignore UAS for Thinkplus chips
Message-ID: <YxjRSW5XTwqrTzJF@rowland.harvard.edu>
References: <1662519268-18488-1-git-send-email-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662519268-18488-1-git-send-email-zenghongling@kylinos.cn>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 07, 2022 at 10:54:28AM +0800, Hongling Zeng wrote:
> The UAS mode of Thinkplus is reported to fail to work on
> several platforms with the following error message:
> 
> [   39.702439] xhci_hcd 0000:0c:00.3: ERROR Transfer event for disabled
>                endpoint or incorrect stream ring
> [   39.702442] xhci_hcd 0000:0c:00.3: @000000026c61f810 00000000 00000000
>                1b000000 05038000
> 
> Falling back to USB mass storage can solve this problem, so ignore UAS
> function of this chip.
> 
> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Change for v1
>  - Change the email real name and the code worng place.
> 
> Change for v2
>  -Change spelling error.

Resubmitting the patch with a few minor changes won't help it get 
accepted.  First you have to answer the questions I asked.

In particular: The error messages you list above are very different from 
the errors in your first two patches.  Those were like:

[  592.518442][ 2] sd 8:0:0:0: [sda] tag#17 uas_eh_abort_handler 0 uas-tag 18
                   inflight: CMD
[  592.527575][ 2] sd 8:0:0:0: [sda] tag#17 CDB: Write(10) 2a 00 03 6f 88 00 00
                   04 00 00

You can see how different they are from the messages above.  This means 
that they are caused by a different kind of bug -- and that means this 
problem probably requires a different kind of fix from the other two.

You need to investigate and get a better idea of what's going wrong with 
the Thinkplus before you propose a fix.

Alan Stern

> ---
>  drivers/usb/storage/unusual_uas.h | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 8a18d58..156e89c 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -198,6 +198,13 @@ UNUSUAL_DEV(0x154b, 0xf00d, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_ATA_1X),
>  
> +/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
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
