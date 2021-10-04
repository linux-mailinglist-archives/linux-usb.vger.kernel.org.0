Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E0F0421994
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234391AbhJDWKv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233722AbhJDWKu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:10:50 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 218F2C061745
        for <linux-usb@vger.kernel.org>; Mon,  4 Oct 2021 15:09:01 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87505EF;
        Tue,  5 Oct 2021 00:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633385336;
        bh=/ej9voueTbJz7Wl/siA2tQ5vUiN8SVLcd1Tm1bIXkbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L59Frx7NcRzAKkOaRhU1614Bf8oVW/Gq2xZJtcSee0ofu44sfKeQWWmqfDsXmJj1L
         nHw33/73NMY6KpymMhGa4Rr9vy+Poi8asSldxHSBCTrmXL+72k6xQaD658xDEVtYfg
         yQQCL0Sa9ECKKDMXFBCK9GA+xgZuoKxWo/goCEOo=
Date:   Tue, 5 Oct 2021 01:08:49 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 1/7] usb: gadget: uvc: consistently use define for
 headerlen
Message-ID: <YVt7cX44QM2qPyBA@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-2-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:11PM +0200, Michael Grzeschik wrote:
> The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
> in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
> We missed to use it consistently. This patch fixes that.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/uvc_video.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index b4a763e5f70e1..da93b46df464d 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -302,7 +302,9 @@ uvc_video_alloc_requests(struct uvc_video *video)
>  		list_add_tail(&video->ureq[i].req->list, &video->req_free);
>  		/* req_size/PAGE_SIZE + 1 for overruns and + 1 for header */
>  		sg_alloc_table(&video->ureq[i].sgt,
> -			       DIV_ROUND_UP(req_size - 2, PAGE_SIZE) + 2,
> +			       DIV_ROUND_UP(req_size - UVCG_REQUEST_HEADER_LEN,

This is correct, we remove the header size.

> +					    PAGE_SIZE) +
> +			       UVCG_REQUEST_HEADER_LEN,

But here we add two entries to the sgt, not two bytes (see the above
comment), so it's unrelated to the header size.

>  			       GFP_KERNEL);
>  	}
>  

-- 
Regards,

Laurent Pinchart
