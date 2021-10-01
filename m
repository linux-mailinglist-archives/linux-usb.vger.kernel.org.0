Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39EAF41E606
	for <lists+linux-usb@lfdr.de>; Fri,  1 Oct 2021 04:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230273AbhJACil (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Sep 2021 22:38:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230260AbhJACik (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Sep 2021 22:38:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77657C06176A
        for <linux-usb@vger.kernel.org>; Thu, 30 Sep 2021 19:36:57 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE6CAA16;
        Fri,  1 Oct 2021 04:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633055814;
        bh=LaN6cHaR/hMeaW2qnf1S8STIioiDqgr2cionnjUxF6g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oYrJlPqPY0+PJmhyKjv6Fa4XKQDFDPLFb6CUs2za2UTkdYZySPnfsidXnY2OsniGw
         iaqCtvB09avkYJzJywredHztentE9MeW9qb9BOY/jCrX42SzDDjywFY28Df1ZcWyVi
         nGr41hEvxNTrFvjYddu3DulEQ3DQ6s8JlQy3hBcA=
Date:   Fri, 1 Oct 2021 11:36:45 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 1/7] usb: gadget: uvc: consistently use define for
 headerlen
Message-ID: <20211001023645.GA3032473@pyrite.rasen.tech>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-2-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-2-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

On Thu, Sep 30, 2021 at 12:27:11PM +0200, Michael Grzeschik wrote:
> The uvc request headerlen of 2 was defined as UVCG_REQUEST_HEADER_LEN
> in commit e81e7f9a0eb9 ("usb: gadget: uvc: add scatter gather support").
> We missed to use it consistently. This patch fixes that.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

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
> +					    PAGE_SIZE) +
> +			       UVCG_REQUEST_HEADER_LEN,
>  			       GFP_KERNEL);
>  	}
>  
> -- 
> 2.30.2
> 
