Return-Path: <linux-usb+bounces-2059-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BE07D25E8
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 22:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 831052814DD
	for <lists+linux-usb@lfdr.de>; Sun, 22 Oct 2023 20:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C2C712B98;
	Sun, 22 Oct 2023 20:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDgkekMV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1151323C2;
	Sun, 22 Oct 2023 20:44:15 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F6FE9;
	Sun, 22 Oct 2023 13:44:13 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso21143335e9.3;
        Sun, 22 Oct 2023 13:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698007452; x=1698612252; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ubgw7EUHwh2i5TKOLdKPVsembpOTYUP/UvZXFU0rg78=;
        b=mDgkekMViIMHUVKEElk6WIEAcPnNNvN3lgdSnXe7igIQN30kPThBt2we2voqngV8DF
         fMTX7xTtPeM1jxT9eAJWIGCFS/9DjfaeRD0nvt8PqB5KmKPkJKpjnoXfZJ6tUPGuIEhI
         u4K1pCh4W3IU+YErDM1TFa9Ny+IZd8QbHJRATs+k99zDAEkOHnZTV4qetS02MoFJcI9W
         WD+Y2ZhcDIqFf7BLxIXuSfyokxE/9upBlpktRlW/MSnVAmi/oxvIpMgpyxGjAMLOGi40
         uiu6S8oDi7g6gp+SWVPEqKSIGae/sI6Iij1YvxcZ97XSyWg617nzL2rHxjVJ75GIhZMJ
         reuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698007452; x=1698612252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ubgw7EUHwh2i5TKOLdKPVsembpOTYUP/UvZXFU0rg78=;
        b=DVqQUdxzbFpmni4ejliis32a/6eX1sm8CaYir6633mcTzSIupE9+2pf+B9d7BhOhoz
         EzWqXYQqm7W+uE7D7hqn7HuX/BB8Jlf5QYsawXHQjsZEiYahgzxgX+hjRIzgnIAsqqQ9
         z/ovStXGrgpN+vbNLK+8b2FipVclmxpwXNB/yCCFlaLqqVp8o/TcSufUvLGsJOzniMD5
         8dYuk8u5zX1Pq5Ap5ZLPZUvTaKpv9bTCv1eq1q6hJAAXv0/2WJeduWnJX83Vk7CSMguh
         nqj+xZ7D6HYEOzN8ARLl4B2QZdYy/xrChYtReIocOiA1I9HrmCzSjTcQINUenFkBLX9O
         CQXg==
X-Gm-Message-State: AOJu0YzMyalFhdq5+VF5haw/taa1Sf8vukIlzKW8EyRTt2S9fGpoqC0p
	bQEWHcuc5KuoMkbr5kmllds=
X-Google-Smtp-Source: AGHT+IHZYO1YiVrh2DH1F+7+TsN/xjQg42iDfCcbvE3YbjU49pCuy7+y82CN88ZfctX3IIhkTcppsg==
X-Received: by 2002:a05:6000:b11:b0:32d:b6a2:8de2 with SMTP id dj17-20020a0560000b1100b0032db6a28de2mr5271520wrb.39.1698007452174;
        Sun, 22 Oct 2023 13:44:12 -0700 (PDT)
Received: from [192.168.2.1] (81-204-249-205.fixed.kpn.net. [81.204.249.205])
        by smtp.gmail.com with ESMTPSA id n18-20020a5d4852000000b0032db4e660d9sm6259104wrs.56.2023.10.22.13.44.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Oct 2023 13:44:11 -0700 (PDT)
Message-ID: <6ea02e5e-bc95-48b5-d6e3-15338ebd0a4d@gmail.com>
Date: Sun, 22 Oct 2023 22:44:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] dt-bindings: usb: rockchip,dwc3: fix reference to
 nonexistent file
To: Vegard Nossum <vegard.nossum@oracle.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>
References: <20231022185150.919293-1-vegard.nossum@oracle.com>
Content-Language: en-US
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <20231022185150.919293-1-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/22/23 20:51, Vegard Nossum wrote:
> This file was renamed but left a dangling reference. Fix it.
> 
> Fixes: 0f48b0ed356d ("dt-bindings: phy: rename phy-rockchip-inno-usb2.yaml")

> Cc: Johan Jonker <jbx6244@gmail.com>

[PATCH v1] dt-bindings: usb: rockchip,dwc3: update inno usb2 phy binding name
https://lore.kernel.org/linux-rockchip/f8747552-d23b-c4cd-cb17-5033fb7f8eb6@gmail.com/

Already Acked.

> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>
> ---
>  Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> index 291844c8f3e1..c983dfe0f629 100644
> --- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> +++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
> @@ -15,7 +15,7 @@ description:
>    Phy documentation is provided in the following places.
>  
>    USB2.0 PHY
> -  Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
> +  Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
>  
>    Type-C PHY
>    Documentation/devicetree/bindings/phy/phy-rockchip-typec.txt

