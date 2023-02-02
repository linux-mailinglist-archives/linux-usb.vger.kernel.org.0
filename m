Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15FB26879F8
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 11:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232285AbjBBKS6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 05:18:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232606AbjBBKSm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 05:18:42 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB965719B9
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 02:18:41 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id A0575CE2954
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 10:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76C83C433EF;
        Thu,  2 Feb 2023 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675333117;
        bh=6DfhXuocOenCOlBQoEyCsnMp2kCXM5iUd2HNVhLH0/U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eAT8j9KbHY5K71gGGA63bCbxisgNGGNzJJLjFU4ytyHB2kpWiZUaHe9RsYHI2DPg+
         iM6EyYsGKVl+UKzYtv9JEfflDdCXd4RNy8jURmMCPik3bX0SqYvMUF7egahY7HkJsL
         V52WKB8Qsew3cZZiv+4GGS9KledTKckEG3mZL6Xo=
Date:   Thu, 2 Feb 2023 11:18:35 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH v3 0/7] UVC Gadget: Extend color matching support
Message-ID: <Y9uN+9zwS97kUilT@kroah.com>
References: <20230130142639.217885-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130142639.217885-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 30, 2023 at 02:26:32PM +0000, Daniel Scally wrote:
> The current UVC gadget implementation hardcodes a single color matching
> descriptor and includes it in the payload of USB descriptors a single time
> following all the format and frame descriptors. This is inflexible, and
> additionally applies only to the _last_ format in the array of descriptors.
> 
> This series extends the support such that the default descriptor can be amended
> and is included once-per-format instead of once-only, it then adds the ability
> to create new color matching descriptors and associate them with particular formats.
> The default color matching descriptor is retained and used where the user does not
> link a new color matching descriptor to the format, so the default interaction
> with userspace is unchanged from the current implementation.
> 
> Daniel Scally (7):
>   usb: gadget: usb: Remove "default" from color matching attributes
>   usb: uvc: Enumerate valid values for color matching
>   usb: gadget: uvc: Add struct for color matching in configs
>   usb: gadget: uvc: Copy color matching descriptor for each frame
>   usb: gadget: uvc: Remove the hardcoded default color matching
>   usb: gadget: uvc: Make color matching attributes read/write
>   usb: gadget: uvc: Allow creating new color matching descriptors
> 
>  .../ABI/testing/configfs-usb-gadget-uvc       |  19 +-
>  drivers/usb/gadget/function/f_uvc.c           |   9 -
>  drivers/usb/gadget/function/u_uvc.h           |   1 -
>  drivers/usb/gadget/function/uvc_configfs.c    | 282 ++++++++++++++++--
>  drivers/usb/gadget/function/uvc_configfs.h    |  22 +-
>  include/uapi/linux/usb/video.h                |  30 ++
>  6 files changed, 315 insertions(+), 48 deletions(-)
> 
> -- 
> 2.34.1
> 

This series does not apply against my tree at all, what was it made
against?

thanks,

greg k-h
