Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 204FB5B3790
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 14:23:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231359AbiIIMTL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 08:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231895AbiIIMSx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 08:18:53 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A6C5C13E4FB
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 05:15:52 -0700 (PDT)
Received: (qmail 486811 invoked by uid 1000); 9 Sep 2022 08:15:46 -0400
Date:   Fri, 9 Sep 2022 08:15:46 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Hongling Zeng <zenghongling@kylinos.cn>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, zhongling0719@126.com
Subject: Re: [PATCH v4 3/3] uas: ignore UAS for Thinkplus chips
Message-ID: <YxsucjOnUkb8NxKo@rowland.harvard.edu>
References: <1662720530-32313-1-git-send-email-zenghongling@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1662720530-32313-1-git-send-email-zenghongling@kylinos.cn>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 09, 2022 at 06:48:50PM +0800, Hongling Zeng wrote:
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
> Acked-by: Alan Stern <stern@rowland.harvard.edu>

I never sent you an Acked-by: for this patch.  In fact, I asked you 
questions about it which you haven't yet answered.

Specifically: How do Windows and Mac OSX work with this drive?

Alan Stern

> Signed-off-by: Hongling Zeng <zenghongling@kylinos.cn>
> ---
> Change for v1
>  - Change the email real name and the code worng place.
> 
> Change for v2
>  -Change spelling error.
> 
> Change for v3
>  -Add acked-by
> 
> Change for v4
>  -Fix version error
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
