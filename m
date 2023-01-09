Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC836662A81
	for <lists+linux-usb@lfdr.de>; Mon,  9 Jan 2023 16:49:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbjAIPtL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 Jan 2023 10:49:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237332AbjAIPsj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 Jan 2023 10:48:39 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3D241108E
        for <linux-usb@vger.kernel.org>; Mon,  9 Jan 2023 07:48:35 -0800 (PST)
Received: (qmail 638441 invoked by uid 1000); 9 Jan 2023 10:48:34 -0500
Date:   Mon, 9 Jan 2023 10:48:34 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Juhyung Park <qkrwngud825@gmail.com>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        gregkh@linuxfoundation.org, zenghongling@kylinos.cn,
        zhongling0719@126.com
Subject: Re: [PATCH] Revert "usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS"
Message-ID: <Y7w3UgeJHHcR7O6o@rowland.harvard.edu>
References: <20230109115550.71688-1-qkrwngud825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230109115550.71688-1-qkrwngud825@gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 09, 2023 at 08:55:50PM +0900, Juhyung Park wrote:
> This reverts commit e00b488e813f0f1ad9f778e771b7cd2fe2877023.
> 
> The commit e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> blacklists UAS for the entire RTL9210 enclosures. Realtek's VendorId is 0x0bda
> and RTL9210 enclosures reports 0x9210 for its ProductId.
> 
> The RTL9210 controller was advertised with UAS since its release back in 2019
> and was shipped with a lot of enclosure products with different firmware
> combinations.
> 
> If UAS blacklisting is really required said product (Hiksemi USB3-FW), it
> should be done without blacklisting the entire RTL9210 products.

We cannot simply revert a patch if it fixes a problem for some devices.  
The devices would then stop working and that would be a regression, 
which is not allowed.

It will be necessary to find some other way of solving this problem.  
For example, a small piece of test code which can safely determine 
whether the firmware can handle UAS.

Alan Stern

> Fixes: e00b488e813f ("usb-storage: Add Hiksemi USB3-FW to IGNORE_UAS")
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Hongling Zeng <zenghongling@kylinos.cn>
> Signed-off-by: Juhyung Park <qkrwngud825@gmail.com>
> ---
>  drivers/usb/storage/unusual_uas.h | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/drivers/usb/storage/unusual_uas.h b/drivers/usb/storage/unusual_uas.h
> index 251778d14e2d..c7b763d6d102 100644
> --- a/drivers/usb/storage/unusual_uas.h
> +++ b/drivers/usb/storage/unusual_uas.h
> @@ -83,13 +83,6 @@ UNUSUAL_DEV(0x0bc2, 0x331a, 0x0000, 0x9999,
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_NO_REPORT_LUNS),
>  
> -/* Reported-by: Hongling Zeng <zenghongling@kylinos.cn> */
> -UNUSUAL_DEV(0x0bda, 0x9210, 0x0000, 0x9999,
> -		"Hiksemi",
> -		"External HDD",
> -		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
> -		US_FL_IGNORE_UAS),
> -
>  /* Reported-by: Benjamin Tissoires <benjamin.tissoires@redhat.com> */
>  UNUSUAL_DEV(0x13fd, 0x3940, 0x0000, 0x9999,
>  		"Initio Corporation",
> -- 
> 2.39.0
> 
