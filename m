Return-Path: <linux-usb+bounces-563-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D757AD750
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 13:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 36AB22814FB
	for <lists+linux-usb@lfdr.de>; Mon, 25 Sep 2023 11:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A113E19BD0;
	Mon, 25 Sep 2023 11:58:14 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487B3107A7
	for <linux-usb@vger.kernel.org>; Mon, 25 Sep 2023 11:58:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D001AC433C9;
	Mon, 25 Sep 2023 11:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695643093;
	bh=fnrScfrKmcUIyzu4ZV2T/hRDgwvbstyPfcJB+K3Mt+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2+C6At+KWCOneZdF9ndelbxD6lIlwEqLD5B4GkLJVvPLAugbJF8PLgU/BjUeBdo5
	 cgcVcJLgJrZ1DRyBNc4dy5vsGnQ4z381cE68hRpDY1CFhHHGl81GpaRPzqjnmiQ4rU
	 OiLAys6htFg9zDX3e/XxSGLwRwakQQbhf14KxSVafObTTeKY6yjLw15m8UvpsJNZGA
	 slYjF1U0+VbCdXV8JqrjgI/daRFJFKbQ1s3+uHG5Zv8saXDZzbbnIzNeNmpD8e6dkV
	 TeTyhnrONUryeHgjgFn3fJ7Rh8SCcCyV9TjK4KlpCPcbiQAp2KB5y8FeeNECF2jvkS
	 xyJspr24HZCXw==
Date: Mon, 25 Sep 2023 19:58:03 +0800
From: Peter Chen <peter.chen@kernel.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: pawell@cadence.com, pavel@denx.de, rogerq@kernel.org,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] usb: cdns3: Modify the return value of
 cdns_set_active () to void when CONFIG_PM_SLEEP is disabled
Message-ID: <20230925115803.GD2070044@nchen-desktop>
References: <20230920144045.2165758-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230920144045.2165758-1-xiaolei.wang@windriver.com>

On 23-09-20 22:40:45, Xiaolei Wang wrote:
> The return type of cdns_set_active () is inconsistent
> depending on whether CONFIG_PM_SLEEP is enabled, so the
> return value is modified to void type.
> 
> Reported-by: Pavel Machek <pavel@denx.de>
> Closes: https://lore.kernel.org/all/ZP7lIKUzD68XA91j@duo.ucw.cz/
> Fixes: 2319b9c87fe2 ("usb: cdns3: Put the cdns set active part outside the spin lock")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
> Reviewed-by: Pavel Machek <pavel@denx.de>
> Reviewed-by: Roger Quadros <rogerq@kernel.org>
> ---
> 
> Changes in v3:
> - Add Cc: stable@vger.kernel.org
> 
> ---

Above "---" doesn't need.

Peter

>  drivers/usb/cdns3/core.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/cdns3/core.h b/drivers/usb/cdns3/core.h
> index 4a4dbc2c1561..81a9c9d6be08 100644
> --- a/drivers/usb/cdns3/core.h
> +++ b/drivers/usb/cdns3/core.h
> @@ -131,8 +131,7 @@ void cdns_set_active(struct cdns *cdns, u8 set_active);
>  #else /* CONFIG_PM_SLEEP */
>  static inline int cdns_resume(struct cdns *cdns)
>  { return 0; }
> -static inline int cdns_set_active(struct cdns *cdns, u8 set_active)
> -{ return 0; }
> +static inline void cdns_set_active(struct cdns *cdns, u8 set_active) { }
>  static inline int cdns_suspend(struct cdns *cdns)
>  { return 0; }
>  #endif /* CONFIG_PM_SLEEP */
> -- 
> 2.25.1
> 

-- 

Thanks,
Peter Chen

