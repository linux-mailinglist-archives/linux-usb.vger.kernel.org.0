Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B18039D864
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 11:15:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230178AbhFGJQ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 05:16:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:53900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFGJQ6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 05:16:58 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7CE008DB;
        Mon,  7 Jun 2021 11:15:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623057306;
        bh=3yo0VhcwCRKHZK5GNvRotZSjAdh+ptopH7F4j/nx34U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WWUl3BoBVXbsc5K0pf2begcxW5Vmqz6LunBLdp9QCCiTB20Qd1ewJjzRdhClUV2+T
         U/dSrPl4BTGMhj7sx2fYofxBgDu0PEiSMCpUMi/BPhInmTHEVYWshsg3Vpt4pfEvbZ
         CW/d+cw/NWuiNTnHeyu8dU32VhscNKMdwlExDV5Q=
Date:   Mon, 7 Jun 2021 12:14:52 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: usb: add entry for isp1760
Message-ID: <YL3jjPOWFTUsNXYp@pendragon.ideasonboard.com>
References: <20210607083921.38441-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607083921.38441-1-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

Thank you for the patch.

On Mon, Jun 07, 2021 at 09:39:21AM +0100, Rui Miguel Silva wrote:
> Giving support for isp1763 made a little revival to this driver, add
> entry in the MAINTAINERS file with me and Laurent Pinchart as
> maintainers.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 503fd21901f1..254803fe599a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18869,6 +18869,14 @@ S:	Maintained
>  F:	drivers/usb/host/isp116x*
>  F:	include/linux/usb/isp116x.h
>  
> +USB ISP1760 DRIVER
> +M:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

I can try to review patches, but I can't commit to having bandwidth to
do so. I'm thus a bit reluctant to list myself as a maintainer here, as
I fear my contribution would mostly be to increase frustration caused by
unresponsive maintainers.

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
