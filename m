Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D2C439E709
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 21:02:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230446AbhFGTEP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 15:04:15 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhFGTEP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 15:04:15 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 83AB58DB;
        Mon,  7 Jun 2021 21:02:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623092542;
        bh=FPUaeIy/hLQGC/l4aXT6+NvHttnEMIvZgY8+ovkgslM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U/PhsV7h+5ie63//MhL7o+/+zrZVnQ4KtxHy6uNmb76SD466f4au7bzUBjeKKs9NX
         XJpLVT3JcudPkDfEGdYjL0NNpIbJZsiVpalhCWLlZ6Vjg+hm/X+6TdUfwAnuBqJ/ai
         Dg92k70FSXUMk58/XZNRHKyK1BE/Oq3gZs7dzwUo=
Date:   Mon, 7 Jun 2021 22:02:08 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] MAINTAINERS: usb: add entry for isp1760
Message-ID: <YL5tMGFyTDU3ExUo@pendragon.ideasonboard.com>
References: <20210607170054.220975-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607170054.220975-1-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

Thank you for the patch.

On Mon, Jun 07, 2021 at 06:00:54PM +0100, Rui Miguel Silva wrote:
> Giving support for isp1763 made a little revival to this driver, add
> entry in the MAINTAINERS file with me as maintainer.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
> 
> v2[1] -> v3:                                                                                                                                                                  
>      - remove Laurent completely

Sorry for the misunderstanding.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> v1[0] -> v2:                                                                                                                                                                  
>      - move Laurent to reviewer instead of maintainer by his request                                                                                                           
>        because of lack of bandwidth
> 
> [0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva@linaro.org/T/#u
> [1]: https://lore.kernel.org/linux-usb/20210607101538.74836-1-rui.silva@linaro.org/
> 
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 503fd21901f1..28ebc6423cf1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18869,6 +18869,13 @@ S:	Maintained
>  F:	drivers/usb/host/isp116x*
>  F:	include/linux/usb/isp116x.h
>  
> +USB ISP1760 DRIVER
> +M:	Rui Miguel Silva <rui.silva@linaro.org>
> +L:	linux-usb@vger.kernel.org
> +S:	Maintained
> +F:	drivers/usb/isp1760/*
> +F:	Documentation/devicetree/bindings/usb/nxp,isp1760.yaml
> +
>  USB LAN78XX ETHERNET DRIVER
>  M:	Woojung Huh <woojung.huh@microchip.com>
>  M:	UNGLinuxDriver@microchip.com

-- 
Regards,

Laurent Pinchart
