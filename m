Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6367965880C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 01:18:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbiL2ASh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 28 Dec 2022 19:18:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229822AbiL2ASf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 28 Dec 2022 19:18:35 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A9FFEE0D
        for <linux-usb@vger.kernel.org>; Wed, 28 Dec 2022 16:18:34 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CDDF109;
        Thu, 29 Dec 2022 01:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672273111;
        bh=PzWq4I2gfGPeeDlEzhLsB8W8hpAH05BoKPMjbObGZLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lgXZxbX17rEEtaP7yfFMJEcOOUZcVt/WncMni6sNkANNFI9CnTs03WKApgsBAdN62
         FUhBae820AAiIHq1tjydzfwfqJydcTheEU+csVI79yIiIL3a0xj6T/MfTwUOwr4nNi
         lPIM+gGzU3KMpYuu5OqaQl2lu+4K41uQVy7juLxo=
Date:   Thu, 29 Dec 2022 02:18:26 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 0/9] Add XU support to UVC Gadget
Message-ID: <Y6zc0sFxIGbOciwD@pendragon.ideasonboard.com>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221121092517.225242-1-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan,

On Mon, Nov 21, 2022 at 09:25:08AM +0000, Daniel Scally wrote:
> Hello all
> 
> This series adds support for the definition of extension units in configfs for
> the UVC Gadget. The XUs are modelled as config_items within a new "extensions"
> group under control, which seemed like an appropriate place to put them.
> 
> To allow the XU's to be inserted in the function graph, the bSourceID attribute
> for the default output terminal is made writeable - users will need to configure
> it with the bUnitID of the XU that they want to use as the OT's source. This does
> mean that the XUs can _only_ be placed immediately preceding the OT, but I think
> that that's fine for now.

Is this something that we'll be able to extend later in a
backward-compatible way ?

Please also note that, in general, nothing prevents a device from
exposing multiple XUs, as well as exposing XUs that are not linked in
the IT to OT pipeline. Is this also something we'll be able to support
if needed ?

> Series level changes:
> 
>   - Added patches 5-9 which additionally add the ability to create string
>   descriptors through configfs and link them to the extension units as well as
>   to override the default descriptors for the IAD and VC/VS interfaces
> 
> The XUs configured through this series have been tested via uvc-gadget, uvcvideo
> and uvcdynctrl.

Do you have an example script that shows how to create and link an XU
through configfs ? That would give an overview of the feature, useful
for review.

> Daniel Scally (9):
>   usb: gadget: uvc: Make bSourceID read/write
>   usb: gadget: uvc: Generalise helper functions for reuse
>   usb: gadget: uvc: Allow definition of XUs in configfs
>   usb: gadget: uvc: Copy XU descriptors during .bind()
>   usb: gadget: uvc: Support arbitrary string descriptors
>   usb: gadget: uvc: Allow linking XUs to string descriptors
>   usb: gadget: uvc: Attach custom string descriptors
>   usb: gadget: uvc: Allow linking function to string descs
>   usb: gadget: uvc: Use custom strings if available
> 
>  .../ABI/testing/configfs-usb-gadget-uvc       |   50 +-
>  drivers/usb/gadget/function/f_uvc.c           |  134 +-
>  drivers/usb/gadget/function/u_uvc.h           |   22 +
>  drivers/usb/gadget/function/uvc.h             |    1 +
>  drivers/usb/gadget/function/uvc_configfs.c    | 1087 ++++++++++++++++-
>  drivers/usb/gadget/function/uvc_configfs.h    |   60 +
>  6 files changed, 1283 insertions(+), 71 deletions(-)

-- 
Regards,

Laurent Pinchart
