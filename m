Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 078246879F7
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:18:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232517AbjBBKS2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:18:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232475AbjBBKS1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:18:27 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C66B1C58B
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:18:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 04A98CE2954
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 10:18:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77BCC433D2;
        Thu,  2 Feb 2023 10:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675333101;
        bh=+++scxWVOzsQ4O8wRAr5uoF/2dTwN219UDNAHdsOZVE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GOJVLTrfEzOEzQgY6yQvpoUUCSfmvriMxcQX/y9wqEMLpnzz8HDRMZ4Ke4UminqNv
         tMn6C3Sbz4BN3deFDqowaLwdQ+GuPSOYB0C88TxWrywT9gayJFCdsnBV/sABavj6i3
         vv4pbZ+HRQjolqhHG+0NY2/B1+xDNMccEy8EV61I=
Date:   Thu, 2 Feb 2023 11:18:18 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com, mgr@pengutronix.de,
        torleiv@huddly.com
Subject: Re: [PATCH] usb: gadget: uvc: Make bmControls attr read/write
Message-ID: <Y9uN6q3Q6GiqTur8@kroah.com>
References: <20230131095738.429197-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230131095738.429197-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 31, 2023 at 09:57:38AM +0000, Daniel Scally wrote:
> For the Processing Unit and Camera Terminal descriptors defined in
> the UVC Gadget we currently hard-code values into their bmControls
> fields, which enumerates the controls the gadget is able to
> support. This isn't appropriate since only the userspace companion
> program to the kernel driver will know which controls are supported.
> Make the configfs attributes that point to those fields read/write
> so userspace can set them to appropriate values.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> 
> This patch depends on "usb: gadget: uvc: Generalise helper functions for reuse"
> from my recent series:
> 
> https://lore.kernel.org/linux-usb/20230130093443.25644-3-dan.scally@ideasonboard.com/T/#u

Odd, I think I have that in my tree, yet this fails to build with:

  CALL    scripts/checksyscalls.sh
  CC [M]  drivers/usb/gadget/function/uvc_configfs.o
drivers/usb/gadget/function/uvc_configfs.c: In function ‘uvcg_default_processing_bm_controls_store’:
drivers/usb/gadget/function/uvc_configfs.c:295:15: error: implicit declaration of function ‘__uvcg_iter_item_entries’ [-Werror=implicit-function-declaration]
  295 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
      |               ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/gadget/function/uvc_configfs.c:295:51: error: ‘__uvcg_count_item_entries’ undeclared (first use in this function)
  295 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/gadget/function/uvc_configfs.c:295:51: note: each undeclared identifier is reported only once for each function it appears in
drivers/usb/gadget/function/uvc_configfs.c:311:51: error: ‘__uvcg_fill_item_entries’ undeclared (first use in this function)
  311 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/gadget/function/uvc_configfs.c: In function ‘uvcg_default_camera_bm_controls_store’:
drivers/usb/gadget/function/uvc_configfs.c:465:51: error: ‘__uvcg_count_item_entries’ undeclared (first use in this function)
  465 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_count_item_entries, &n,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~~
drivers/usb/gadget/function/uvc_configfs.c:481:51: error: ‘__uvcg_fill_item_entries’ undeclared (first use in this function)
  481 |         ret = __uvcg_iter_item_entries(page, len, __uvcg_fill_item_entries, &tmp,
      |                                                   ^~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors

What did I do wrong?

thanks,

greg k-h
