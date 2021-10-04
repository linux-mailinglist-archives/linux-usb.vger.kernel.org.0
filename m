Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD7D9421A11
	for <lists+linux-usb@lfdr.de>; Tue,  5 Oct 2021 00:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235812AbhJDWdR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Oct 2021 18:33:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54788 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235700AbhJDWdR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Oct 2021 18:33:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2E07EF;
        Tue,  5 Oct 2021 00:31:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633386686;
        bh=ZZhRk665l+qG+o5QfqE67Ga5Nobafn7LHlC7WfEr1Gk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gdQdtlCzvjXWdZnDsDZJWKPjjWwPbwtjRs6AdmQxj5sLdjHmToKQX/nTK2LROUKmx
         1Uvhca3rv3Me54bQM+PYC7Seswnwf3kvT+i42ltaxMOcJZIB6G/GaTEMPgpIWrOwXj
         ZIYksxTOc4QIKhwv1hIApv+vzsWRTU4w4a4TLpS8=
Date:   Tue, 5 Oct 2021 01:31:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kernel@pengutronix.de,
        caleb.connolly@ideasonboard.com
Subject: Re: [PATCH 6/7] usb: gadget: uvc: ensure the vdev is unset
Message-ID: <YVuAuDgLMSzzgXPF@pendragon.ideasonboard.com>
References: <20210930102717.15720-1-m.grzeschik@pengutronix.de>
 <20210930102717.15720-7-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210930102717.15720-7-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch.

On Thu, Sep 30, 2021 at 12:27:16PM +0200, Michael Grzeschik wrote:
> Since the uvc video device will be created on demand, we have to ensure
> that the struct is always unprepared. Otherwise the previous settings
> will colide with the new perparation.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/f_uvc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/gadget/function/f_uvc.c b/drivers/usb/gadget/function/f_uvc.c
> index 1e93ab5c0c88d..b3279ba357331 100644
> --- a/drivers/usb/gadget/function/f_uvc.c
> +++ b/drivers/usb/gadget/function/f_uvc.c
> @@ -417,6 +417,7 @@ uvc_register_video(struct uvc_device *uvc)
>  	int ret;
>  
>  	/* TODO reference counting. */
> +	memset(&uvc->vdev, 0, sizeof(struct video_device));

	memset(&uvc->vdev, 0, sizeof(uvc->video));

With this and the commit message changes pointed out by Paul,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	uvc->vdev.v4l2_dev = &uvc->v4l2_dev;
>  	uvc->vdev.v4l2_dev->dev = &cdev->gadget->dev;
>  	uvc->vdev.fops = &uvc_v4l2_fops;

-- 
Regards,

Laurent Pinchart
