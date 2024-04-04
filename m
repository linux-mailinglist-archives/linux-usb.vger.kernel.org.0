Return-Path: <linux-usb+bounces-8922-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5FC8987FB
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 14:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6CEE71C211AD
	for <lists+linux-usb@lfdr.de>; Thu,  4 Apr 2024 12:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0E797492;
	Thu,  4 Apr 2024 12:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PDLeRexL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F3C376E2
	for <linux-usb@vger.kernel.org>; Thu,  4 Apr 2024 12:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712234245; cv=none; b=ZZwG79PJdJAsxj0spvP90xFwetN0h2diS1+ixTzkRS7//iXKkLCRGN9NZ4ehBdhVosADSeoK34Vp8xJWTQGmZKOkCaa7vVNpUDBj75IbXJbkCZSbp+C7cJdHA0vw8mREflDKfTx0aQ43OCmPZOlOBUckOn99V4eCQBti7vpUpIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712234245; c=relaxed/simple;
	bh=CUxcuKgANrcZ2HOGF9dd7fxzE3pNCDVQpcR5PSLo51o=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=Fd6KoXvaRlO873scE45HgD8rLfTlz2eyMY7xhgXEWk+Cp7IYKnP95Ccuu5UeADxzhbYHU2jXAeqS/QmVW/azSINMb1xiaHn2pAQpSgMR91Je1c3XMhBvd8T2DNL7Mb7tLES90LpSYTdZbaj0YrE3sK2ihGDJZ0X+cKyqCxJOgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PDLeRexL; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a4715991c32so143374166b.1
        for <linux-usb@vger.kernel.org>; Thu, 04 Apr 2024 05:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1712234240; x=1712839040; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MAzVcsvooEghxXt7B4g+snAG6X7O0gFVG7to2PBHpSc=;
        b=PDLeRexLemVtCLHtl0o8+0OsTv5W0UZPTiVqnEsQN8MZQfNyf30X+vBWYomDQj292C
         rrGZcoAFIP38QXTKr7Vdqw4j6IFkapUVX5fY/8vNkDxqGj5XKNGA+rzJNOoXHOWtufik
         riuPfATqL9wkUCgKO8zvaN2i9n7c4UH5YytP8bPL+sYTBm86admc5TJhfqSLso71iqpe
         35sg03IDH/0GW5VMwUAiW8VMoWiz0bd5LjHqeVInzE5wreS3EPM/dgXVxOm86Wscis4N
         LY3a2xRR9RPJaQIh90Wn/VRdv6S+T2XJ5XCTRfZaWe60CZlWHJzClaGgW8I/adsjSSS3
         aHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712234240; x=1712839040;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MAzVcsvooEghxXt7B4g+snAG6X7O0gFVG7to2PBHpSc=;
        b=A7eIOJgD4m5gQceNaJkPVKznL97ys5y3K+lrCiWHeWTkPivdGW7gif5rcWFomiE0Cm
         HAwFmTRtddgfnQ5GhhgzY4xUrynSSZE9v0VfxqAN7N/D47nQxgaRCJahaCB/aD7XvOrP
         DcpbPKBjWg8doMYoNi+yM6yiPkWAHQfMuebLSk3FhOF6M5nxNsu+MNK19V2e5wWoWQEi
         yHL88D4IJNrb97cEXMVsjMyw+z5bHu106QoGL4OfBwcE8ktkaYWyAvhUU/ESTSrwPyhW
         YX8JUXl04nkDksghmzJkYPt/9J6la2dpWrgPpLai13iYCnrqTulewhgD9sd6ryi1Cfbi
         efmg==
X-Forwarded-Encrypted: i=1; AJvYcCW96iCLrO8CEN1y8a5a0dR4smT7Kz445mQ32CJg4CJ6yzDWF20cX+Aj6KxarREnWOnZrmQRhUQNXllMN7bjcYtdNZ+ddOvwNYuq
X-Gm-Message-State: AOJu0YxLYe91NJwE6TzmiKDzqi/t0tWXoSOa4JVHBf3FedGoJYrxmBmf
	H0Kj4iokspJjspBQVCeOOEM0Xe10zsMruiYqn3NILRdSxh2Sxcrkly4Brn26/zg=
X-Google-Smtp-Source: AGHT+IEBspPNVRi8BXITeVuqoYLQjpcXAbdjFKD2zXgiPUoHbd8zyMEWeZo29D1atJiMc8XolXuvag==
X-Received: by 2002:a17:906:bc96:b0:a4e:15f9:f167 with SMTP id lv22-20020a170906bc9600b00a4e15f9f167mr1504129ejb.11.1712234240443;
        Thu, 04 Apr 2024 05:37:20 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id b22-20020a170906d11600b00a46f95f5849sm8997106ejz.106.2024.04.04.05.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Apr 2024 05:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Apr 2024 14:37:19 +0200
Message-Id: <D0BCDQS6LNJM.3IOKUKU7G06SI@fairphone.com>
Cc: "Arnd Bergmann" <arnd@arndb.de>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Nathan Chancellor" <nathan@kernel.org>,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: typec: ptn36502: fix CONFIG_OF dependency
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Arnd Bergmann" <arnd@kernel.org>, "Heikki Krogerus"
 <heikki.krogerus@linux.intel.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Dmitry Baryshkov"
 <dmitry.baryshkov@linaro.org>
X-Mailer: aerc 0.15.2
References: <20240404123534.2708591-1-arnd@kernel.org>
In-Reply-To: <20240404123534.2708591-1-arnd@kernel.org>

On Thu Apr 4, 2024 at 2:35 PM CEST, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> When CONFIG_OF is disabled, TYPEC_MUX_PTN36502 causes a Kconfig warning:
>
> WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>   Depends on [n]: HAS_IOMEM [=3Dy] && DRM_BRIDGE [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - TYPEC_MUX_PTN36502 [=3Dy] && USB_SUPPORT [=3Dy] && TYPEC [=3Dy] && I2=
C [=3Dy] && (DRM [=3Dy] || DRM [=3Dy]=3Dn) && DRM_BRIDGE [=3Dy]
>
> It doesn't actually seem to be required here, so just avoid the warning
> with a narrower select statement and use the same condition that Nathan
> added for NB7VPQ904M.

Hi,

This has already been sent by Nathan, just hasn't been picked up yet I
guess.

https://lore.kernel.org/linux-patches/20240328-fix-ptn36502-drm_aux_bridge-=
select-v1-1-85552117e26e@kernel.org/

Regards
Luca

>
> Fixes: 9dc28ea21eb4 ("usb: typec: ptn36502: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/usb/typec/mux/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfi=
g
> index 4827e86fed6d..ce7db6ad3057 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -60,7 +60,7 @@ config TYPEC_MUX_PTN36502
>  	tristate "NXP PTN36502 Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=3Dn
> -	select DRM_AUX_BRIDGE if DRM_BRIDGE
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE && OF
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M if your system has a NXP PTN36502 Type-C redriver chip


