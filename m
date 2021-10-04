Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677D2421A39
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:43:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236592AbhJDWo7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:44:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233501AbhJDWo6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:44:58 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45AD1C061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 15:43:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0A1025B;
        Tue,  5 Oct 2021 00:43:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633387388;
        bh=IiMdDXfMrKOUGMvnjxksKSa1ckEaQ6IW/lImC+4Fv8o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mdfsgnEUjikKNjGnNHM8ug+gZlB21hz++ENSCD/QSyEj/ryqCfp9WB33eIwhQYrP6
         k8rDzxqce3EAhivfzh0rogHCXlrJtFWTAjwlLMSvRu1uz36pu6c3C6+mCu4S93A9H2
         wFIGlF0vkuwISqdpiJPJQrJ3cx36rcZDuh0j2mPw=
Date:   Tue, 5 Oct 2021 01:43:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de
Subject: Re: [PATCH v2 0/7] usb: gadget: uvc: smaller fixes for stability
Message-ID: <YVuDa5iU/GQdWwCv@pendragon.ideasonboard.com>
References: <20211003202939.306-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211003202939.306-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Sun, Oct 03, 2021 at 10:29:32PM +0200, Michael Grzeschik wrote:
> This series improves the uvc video gadget overal stability and code
> quality. Including a fix for the configfs udc callbacks.

I've only noticed v2 after reviewing v1, sorry about that. I think all
comments still apply though.

> Michael Grzeschik (6):
>   usb: gadget: uvc: consistently use define for headerlen
>   usb: gadget: uvc: test if ep->desc is valid on ep_queue
>   usb: gadget: uvc: only schedule stream in streaming state
>   usb: gadget: uvc: only pump video data if necessary
>   usb: gadget: uvc: ensure the vdev is unset
>   usb: gadget: udc: ensure the gadget is still available
> 
> Michael Tretter (1):
>   usb: gadget: uvc: rename function to be more consistent
> 
>  drivers/usb/gadget/composite.c          |  4 ++--
>  drivers/usb/gadget/function/f_uvc.c     |  7 ++++---
>  drivers/usb/gadget/function/uvc_v4l2.c  |  3 ++-
>  drivers/usb/gadget/function/uvc_video.c | 23 ++++++++++++++++-------
>  drivers/usb/gadget/udc/core.c           |  3 +++
>  5 files changed, 27 insertions(+), 13 deletions(-)
> 

-- 
Regards,

Laurent Pinchart
