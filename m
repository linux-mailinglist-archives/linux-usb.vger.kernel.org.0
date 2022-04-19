Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04191507B2D
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 22:47:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357722AbiDSUtx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 16:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357370AbiDSUtw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 16:49:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77A7E4130B
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 13:47:09 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-5-145-nat.elisa-mobile.fi [85.76.5.145])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5D6C25B;
        Tue, 19 Apr 2022 22:47:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650401228;
        bh=kxyeuU/HNjXQxStBnBX+opby6FrGUL5w2he1SOS4gBM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ayy1/iiZyKAFWonXHcgfLo0sS3QQ03JI5hzFoTIKJa2X/2Loddf8dRwdELbtIh3NY
         RcMbS9Eu7RtikoJrqTiHSHBpV7X8wpm0wfBsH43jZdq3Xmoe1ft1Mh0zdsdGZT8Yjt
         Z8R1nK56QcS6QmxUHjc1wBV1ismhtF97G5gRaHMY=
Date:   Tue, 19 Apr 2022 23:47:09 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        nicolas@ndufresne.ca, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 4/5] usb: gadget: uvc: call uvc uvcg_warn on completed
 status instead of uvcg_info
Message-ID: <Yl8fzQsqx/NQ0iuT@pendragon.ideasonboard.com>
References: <20220402233914.3625405-1-m.grzeschik@pengutronix.de>
 <20220402233914.3625405-5-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220402233914.3625405-5-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Sun, Apr 03, 2022 at 01:39:13AM +0200, Michael Grzeschik wrote:
> Likewise to the uvcvideo hostside driver, this patch is changing the
> usb_request message of an non zero completion handler call from dev_info
> to dev_warn.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/usb/gadget/function/uvc_video.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
> index b1075e23a61010..8b3116d48d2bd8 100644
> --- a/drivers/usb/gadget/function/uvc_video.c
> +++ b/drivers/usb/gadget/function/uvc_video.c
> @@ -258,7 +258,7 @@ uvc_video_complete(struct usb_ep *ep, struct usb_request *req)
>  		break;
>  
>  	default:
> -		uvcg_info(&video->uvc->func,
> +		uvcg_warn(&video->uvc->func,
>  			  "VS request completed with status %d.\n",
>  			  req->status);
>  		uvcg_queue_cancel(queue, 0);

-- 
Regards,

Laurent Pinchart
