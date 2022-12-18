Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB373650454
	for <lists+linux-usb@lfdr.de>; Sun, 18 Dec 2022 19:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231171AbiLRSay (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 18 Dec 2022 13:30:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbiLRSaF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 18 Dec 2022 13:30:05 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5938FBE13
        for <linux-usb@vger.kernel.org>; Sun, 18 Dec 2022 10:12:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 331DB9E5;
        Sun, 18 Dec 2022 19:12:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671387131;
        bh=u5FIdOCTgGPiLl+qI4z6NigqJdz7Mb+53qnOc+6XOMY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Gx7BW3ADFGw6204GeFTYrLcAHGH2Mf+yOXUsqjSLJM5A6mGPs5eYfJl8VLSnL5wp4
         GdD0JZAj9jGn7uaiaBJ4HLhQMDv9HIeacHqfnYWa2d/qydVM88kp5mowViveU7bMff
         Jmgoe+oAkgN6FzL2aiSzn72CR5RTFLZ2BfpwMEBw=
Date:   Sun, 18 Dec 2022 20:12:07 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        w36195@motorola.com, m.grzeschik@pengutronix.de,
        kieran.bingham@ideasonboard.com, torleiv@huddly.com
Subject: Re: [PATCH 0/6] UVC Gadget: Extend color matching support
Message-ID: <Y59X9+ndt7GxBvJx@pendragon.ideasonboard.com>
References: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221213083736.2284536-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

Thank you for the series.

On Tue, Dec 13, 2022 at 08:37:30AM +0000, Daniel Scally wrote:
> The current UVC gadget implementation hardcodes a single color matching
> descriptor and transmits it a single time following all the format and frame

I'm not sure I would use "transmits" in this context.  Descriptors are
for sure transmitted over the wire, but all in one go, not as individual
units (at least within a configuration descriptor).  Maybe "includes"
would be a better term ? This is nitpicking for the cover letter, but
the comment applies more importantly to commit messages and code for the
whole series.

> descriptors. This is inflexible, and additionally applies only to the _last_
> format in the array of descriptors.
> 
> This series extends the support such that the default descriptor can be amended
> and is transmitted once-per-format instead of once-only, it then adds the ability
> to create new color matching descriptors and associate them with particular formats.
> The default color matching descriptor is retained and used where the user does not
> link a new color matching descriptor to the format, so the default interaction
> with userspace is unchanged from the current implementation.

I wonder if we shouldn't drop the default descriptor. If userspace
doesn't specify one, then we really can't know what colorimetry data
applies to the frames. Instead of providing a default to the host, not
providing any colorimetry information would be better.

> Daniel Scally (6):
>   usb: gadget: usb: Remove "default" from color matching attributes
>   usb: gadget: uvc: Add struct for color matching in configs
>   usb: gadget: uvc: Copy color matching descriptor for each frame
>   usb: gadget: uvc: Remove the hardcoded default color matching
>   usb: gadget: uvc: Make color matching attributes read/write
>   usb: gadget: uvc: Allow creating new color matching descriptors
> 
>  .../ABI/testing/configfs-usb-gadget-uvc       |   6 +-
>  drivers/usb/gadget/function/f_uvc.c           |   9 -
>  drivers/usb/gadget/function/u_uvc.h           |   1 -
>  drivers/usb/gadget/function/uvc_configfs.c    | 247 +++++++++++++++---
>  drivers/usb/gadget/function/uvc_configfs.h    |   9 +
>  5 files changed, 228 insertions(+), 44 deletions(-)

-- 
Regards,

Laurent Pinchart
