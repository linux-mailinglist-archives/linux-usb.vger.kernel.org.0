Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017C639E444
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 18:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230220AbhFGQqv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 12:46:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60222 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230197AbhFGQqu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 12:46:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id F02498DB;
        Mon,  7 Jun 2021 18:44:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623084298;
        bh=kRzXEFlIY6blhsNhbZvE2ox54PoHMgMmZhk4M6TNpCA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LEAni0EDsvIIqx/TyozAvNrFOwSxYncnKwlr4+1gYXkz7H9t2/rH881LlV5Mx4IpJ
         7lUFc82/hGTS2PYZ1K8fyX4TlffZ867ullz8q4zV7SfjPewBPWPkiFd3Rs6kHiJANK
         5C2rbnnoRAfGCwu7bFDC6V1+7k6ZPFD4zssNkjmA=
Date:   Mon, 7 Jun 2021 19:44:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: usb: add entry for isp1760
Message-ID: <YL5M+xnwS1yGEVqk@pendragon.ideasonboard.com>
References: <20210607101538.74836-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210607101538.74836-1-rui.silva@linaro.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Rui,

On Mon, Jun 07, 2021 at 11:15:38AM +0100, Rui Miguel Silva wrote:
> Giving support for isp1763 made a little revival to this driver, add
> entry in the MAINTAINERS file with me as maintainer, and
> Laurent Pinchart as reviewer in a best effort style.
> 
> Signed-off-by: Rui Miguel Silva <rui.silva@linaro.org>
> ---
> v1[0] -> v2:
>     - move Laurent to reviewer instead of maintainer by his request
>       because of lack of bandwidth
> 
> [0]: https://lore.kernel.org/linux-usb/20210607083921.38441-1-rui.silva@linaro.org/T/#u
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 503fd21901f1..bd3bdb22a608 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18869,6 +18869,14 @@ S:	Maintained
>  F:	drivers/usb/host/isp116x*
>  F:	include/linux/usb/isp116x.h
>  
> +USB ISP1760 DRIVER
> +M:	Rui Miguel Silva <rui.silva@linaro.org>
> +R:	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>

Honestly, what's the value of listing me if all the e-mails will go to
/dev/null for the time being ? :-)

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
