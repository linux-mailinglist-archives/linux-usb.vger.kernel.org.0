Return-Path: <linux-usb+bounces-8651-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 56688891492
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 08:49:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87F541C20C46
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 07:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1930A4207B;
	Fri, 29 Mar 2024 07:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="yhVDkBfO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037DB41208
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 07:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711698543; cv=none; b=iDp1pUXCffPosSCckI2w2IJb7IQ95v7BbXMD+07SRHruWjMM0d6Ahi8rSgLqIPsWeDla8TmEywgpBMh9VGjTpOmYXrApthxHPP3eklC2NKFMgGTUySc2SjsP15jlXRBIQKd30AJUZNXpr6dVvHeyN9GK18qPj0UItcghuwFjXZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711698543; c=relaxed/simple;
	bh=hrVGrm+XFzcuK5528pVjiKN/DLLIKcKujxE3vf+d5Bo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=B3c7ORRGBrye1I38rBj12djRCogwtx2NUDlOkcZErUzMja70mJXHO10wduinkPhL1bjvyutZ7bWf/9/vDTxrXnB68p9hcv4N+LyX51CZ5c+g5iXi2iR1JaJlIp6ZwHiI+k0Mu5ix7nLSyOP+b4VdZmP3RdBu3E2RmMzfO+x3w9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=yhVDkBfO; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a46cd9e7fcaso219964366b.1
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 00:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1711698540; x=1712303340; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jDMm438h1JKLyWl9ds51rqV5RaMaxu4XMZFZHSuHm0=;
        b=yhVDkBfOx1cPlxmlx3iYhcfP5WibIiGPhuahWMScmNahfFznveIjCfT/PPeNUjcknX
         7OYwzWt9g4AFR4QKm1Qq2+WQMJA5FGWhpUPQ36TsqhkfIFnxzmj210I/v1ls4mgw2d5I
         vBzup88YRtIH/7Zxec1JD+aGzEWNxcYp2cx+rYRGajULcTCszp+BqblrX0v4OoZ7QYwr
         AkJllkEK7HlP0ghEgVX2WJmViPWgwUp68tqYn22AyusPpD2WLjvx6Tn7WNQbSIy+JDhk
         hSndPweBNptg2v2go/qwQ1aBDadpaC8iNix3vXngQo3bVN4Bn07CywxSrs4hkFQtD4G+
         Hjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711698540; x=1712303340;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0jDMm438h1JKLyWl9ds51rqV5RaMaxu4XMZFZHSuHm0=;
        b=Chui+Snvi7SWBuqWsrCBlbO3jOKur2+R82ozKhp/GmVchTzt9Cu6g2MTW7F7cwCFib
         rjTnDeBgxsnXAQfNgVKOrT+FugFov33G5LaGszvxOZEz+OWZUKUrmYgjbrmKr28cr67k
         BxMyikerHG9s19IuMKf+e4ZGZr9WpFLHtMCWp2z1kHWp3z+HfvUq4Ld3QdMnJpIIPeNH
         Robq9NtHvDK48l1M0HFHCzz7Z3pgKFI8Rq0dMNTusmpNxdrAlBpJG+lI+sKaSdrMIa1Y
         je4kVlnwx3OOgZR3cl4igNAk/w/fOxNJXtPHcD+8lFZe0W5BzngJtp4CrHl5UeiKCB/W
         NPVA==
X-Forwarded-Encrypted: i=1; AJvYcCWGEgefjdLnaJt9pJFcmMI2Z98zjg0P8z7FexGEexiBAfftk8NWcwS4tHyxMNTFdSCuVw/gL5IH+wUyFM3nkdeSVpekQc5SIyJt
X-Gm-Message-State: AOJu0YyO+QZjsWog/ULrVIIDHH7dmRqOk2W5ma8FZSSGauBU7fLaDSaB
	FwDjndpDjdmOuBB1HyNQqXNUukkvImhgd1bzzywySIuemqPah01SleUqYM/7VlY=
X-Google-Smtp-Source: AGHT+IGr6uLJOKPOgi0GFuaum7P1KIsUToVk+xiSUxQLNvhkLwIbmAN2Qaoj5rZNEXI7yD+XPtaWsA==
X-Received: by 2002:a17:906:b104:b0:a4e:1154:fa46 with SMTP id u4-20020a170906b10400b00a4e1154fa46mr1050686ejy.70.1711698540231;
        Fri, 29 Mar 2024 00:49:00 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id ay12-20020a170906d28c00b00a46a9c38b16sm1620903ejb.138.2024.03.29.00.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 00:49:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Mar 2024 08:48:59 +0100
Message-Id: <D062HPKFGJOW.3TI8AILOBMGIW@fairphone.com>
Cc: <dmitry.baryshkov@linaro.org>, <linux-usb@vger.kernel.org>,
 <patches@lists.linux.dev>
Subject: Re: [PATCH] usb: typec: ptn36502: Only select DRM_AUX_BRIDGE with
 OF
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Nathan Chancellor" <nathan@kernel.org>,
 <heikki.krogerus@linux.intel.com>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.15.2
References: <20240328-fix-ptn36502-drm_aux_bridge-select-v1-1-85552117e26e@kernel.org>
In-Reply-To: <20240328-fix-ptn36502-drm_aux_bridge-select-v1-1-85552117e26e@kernel.org>

On Thu Mar 28, 2024 at 5:03 PM CET, Nathan Chancellor wrote:
> CONFIG_DRM_AUX_BRIDGE depends on CONFIG_OF but that dependency is not
> included when CONFIG_TYPEC_MUX_PTN36502 selects it, resulting in a
> Kconfig warning when CONFIG_OF is disabled:
>
>   WARNING: unmet direct dependencies detected for DRM_AUX_BRIDGE
>     Depends on [n]: HAS_IOMEM [=3Dy] && DRM_BRIDGE [=3Dy] && OF [=3Dn]
>     Selected by [m]:
>     - TYPEC_MUX_PTN36502 [=3Dm] && USB_SUPPORT [=3Dy] && TYPEC [=3Dm] && =
I2C [=3Dy] && (DRM [=3Dy] || DRM [=3Dy]=3Dn) && DRM_BRIDGE [=3Dy]
>
> Only select CONFIG_DRM_AUX_BRIDGE when CONFIG_DRM_BRIDGE and CONFIG_OF
> are enabled to clear up the warning. This results in no functional
> change because prior to the refactoring that introduces this warning,
> ptn36502_register_bridge() returned 0 when CONFIG_OF was disabled, which
> continues to occur with drm_aux_bridge_register() when
> CONFIG_DRM_AUX_BRIDGE is not enabled.

Oh, thanks! Seems I didn't see your patch for NB7VPQ904M so I made the
same mistake as there.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

>
> Fixes: 9dc28ea21eb4 ("usb: typec: ptn36502: switch to DRM_AUX_BRIDGE")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
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
>
> ---
> base-commit: ef83531c8e4a5f2fc9c602be7e2a300de1575ee4
> change-id: 20240328-fix-ptn36502-drm_aux_bridge-select-83ddfd8a5375
>
> Best regards,


