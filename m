Return-Path: <linux-usb+bounces-3789-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D47B5807675
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 18:22:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 66A65B20E93
	for <lists+linux-usb@lfdr.de>; Wed,  6 Dec 2023 17:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A29C675A7;
	Wed,  6 Dec 2023 17:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RQcgTGxd"
X-Original-To: linux-usb@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FBE5D3;
	Wed,  6 Dec 2023 09:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=IkWMgsAMR6Agcl+tIup9tcwkstloKvFzTgKc+Se18o4=; b=RQcgTGxd0fkHmW8w72vKz8PFbJ
	Y8X3TmD3AkQNwxBUQRTuLgNTcXu67FlGWsrpztbt3tmqEOI09bjeNMWwCOUNMmhDbdyNAOV+mFYev
	MRYUF3gDx11dxuZZKgzUrk4kN9zHsm4QWw8w0oDBVed+fiy1md2mX9tMARmCY6WsP6F78g+OppKpp
	G0WgTEgIZee7+3SAQp7mWpAJCLKTrPGMVPS1Qgv8U4r+4zhYXqd0mBaQostTAJWLiPcagtWrz5oOE
	9siZ7O4p8QCJScytyVupOY2jlJxTrFpyQeANQbKBccOPM5B8E8WxqrDWawa/CrA/l/WN26MZYxY3W
	aU33sHbA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rAvbU-00AsZq-0P;
	Wed, 06 Dec 2023 17:22:32 +0000
Message-ID: <2172ccea-0749-44fa-942e-195333dacb62@infradead.org>
Date: Wed, 6 Dec 2023 09:22:31 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: nb7vpq904m: add CONFIG_OF dependency
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Neil Armstrong
 <neil.armstrong@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231206123828.587065-1-arnd@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20231206123828.587065-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/6/23 04:38, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> DRM_AUX_BRIDGE depends on CONFIG_OF, so the same dependency is needed
> here to avoid a build failure:
> 
> WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && OF [=n]
>   Selected by [y]:
>   - TYPEC_MUX_NB7VPQ904M [=y] && USB_SUPPORT [=y] && TYPEC [=y] && I2C [=y] && (DRM [=y] || DRM [=y]=n) && DRM_BRIDGE [=y]
> x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_register':
> aux-bridge.c:(.text+0x13b): undefined reference to `auxiliary_device_init'
> x86_64-linux-ld: aux-bridge.c:(.text+0x14d): undefined reference to `__auxiliary_device_add'
> x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_init':
> aux-bridge.c:(.init.text+0x15): undefined reference to `__auxiliary_driver_register'
> x86_64-linux-ld: drivers/gpu/drm/bridge/aux-bridge.o: in function `drm_aux_bridge_drv_exit':
> aux-bridge.c:(.exit.text+0x9): undefined reference to `auxiliary_driver_unregister'
> 
> Fixes: c5d296bad640 ("usb: typec: nb7vpq904m: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/usb/typec/mux/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 5120942f309d..818624f59120 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -40,6 +40,7 @@ config TYPEC_MUX_NB7VPQ904M
>  	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=n
> +	depends on OF
>  	select DRM_AUX_BRIDGE if DRM_BRIDGE
>  	select REGMAP_I2C
>  	help

-- 
~Randy

