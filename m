Return-Path: <linux-usb+bounces-20978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AF6A42346
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 15:38:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B4C9F16CED1
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 14:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67BA424887A;
	Mon, 24 Feb 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="NIDdInz1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B52EB17C21C
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 14:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407322; cv=none; b=TkRSvuJzJuStjSjiole6qG+UOQY8/0GzbZ+M4tHhpXGoCB2SKDC0QG2VMwQpJynr1b6lacdcVlOp9nm3CX/f233C26Jp070K+WEWdP2pHFbkAw2tV88rL2Wyq3ZEb5vB1U89vMlrGLjgTC2QgYd1Q79Fjg1Y8SLmlSUZPEmLZ3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407322; c=relaxed/simple;
	bh=fi/ou784DQNSO56UkdVWMsq5LgKy3w3Myno9NribxME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PI3baF9gi2sm0Yk8haGqMAQqYgaJeH4pfis0vyl2ojEIdpnFi5X9wpLPb5Wf5taH7VxZtgMiIQPez2+tMwIqkNlaYUCw2YxW5+VAaqmf69cwvUA3mypUqGPV1HqSEXgD/CQZzOQKmERsAF4oHNoARwlApRESK4YCMBsuEPa5hAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=NIDdInz1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38f488f3161so2426812f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 06:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740407318; x=1741012118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=NIDdInz1gySZ1Peryoh6lvdI8W996Kezrv9/7HCTbwKmSstoUQr68X4wrRHBJJpJcs
         plB36mCAiTPd1Alt3WP0piTZ3J8JX10Fx7o6t13HyAfWrBBpZdTyMzy6C5ruHljTI/1U
         vo69mLrkkPbfexYJQ1BQd0CwkdpFZbj0Ds30e5AeBQwoZLjRg7uf5YWPi+TutGPjTR6D
         dt3PKthzCl4CLiC5UovTZjmJ8SYmFD7z/rIwu3dEf0f8heMmCC2H0uoONOMvzvECD6yk
         J2aJWTUXbK7Ysa9sCh0HyagbBuIjIcuQ+GBGKfaSdxmwEyZFMt1pw/3quFS7lvX+jXTM
         rPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407318; x=1741012118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+7myiS5YDjg48/Ag8fwVJzAPYwjPP2oihtGPggfyt3U=;
        b=uJdUyORaiQcEozxZzhFd5KQSZoKlg5Tuj17Iw1D3keaza2D68DkUItTlfxdhTTjPoj
         GCHSIKeky/ZBAckr1pPcrxcCfij2SmUFeKhj9C55sk1Nsa/5JF/+PtlySC+9rg+mC1A+
         X8LymJhGolKnf//B/uatvIZ/tu529bCtXzSUiZK6OFGkRVE/mVglP4JpvPLdmM76hwWO
         aAthPNoML4qfB6AQdhttRdRZDainp6G/IjikwtcPCHeRCPNsY8IVj3DPACuYN/nGNTkr
         tBNs46gqhLNZ0V+FLbUNacxz2N7OgetbMPiUayEaCICgZD/q66DfmHwlPqM2A1qoMdqX
         a3yA==
X-Forwarded-Encrypted: i=1; AJvYcCXGSvcv2iy1ObmM9EapL07sMksbjdzf6+3ZR7KZbgvtMpJa5Oo9JeukXxtYhCnhWf1Dwz6fQs671XI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUPWuYQTyZfVnwoANu90jt8WC9n5zyVJfxSZNy2tdESceIB0Hd
	FXiJr8Pwuvnc7JoG6o7yfCt9V6f0P/CBL1yNFIrZkmlutDPLNjuvrFanZolD8Xs=
X-Gm-Gg: ASbGncvwPa5OmBMApMtNb/U10W63Jmdh8E2QJhQahN4rZzhQd2mCt7DMiR9svX/nJzo
	NGJCKtrqja2gvJnmGu4klTVBppXrI0s66ay+nF/vgcjfhui2zpYx5LCjLQ72/RXwyscSKjDCrCJ
	ijphAMigYoSdELOmt/h5PhN2jV8moY3UUphzSbtWELZNPHonvDsbY4OvP8i52kI6yQ6xWt81U4K
	CcIzELChp3NPnYcdbjzduC20KmSMkdngKaGBSDaxfUpB9DLsvjJyWPyJllGcbtrlc8UpH87REwf
	MHH7ohXF2OGU72QIWJaoEfpn8IIxZ0ID0u3I79HY2bdD4YD/kR7tQukCimVuuxOBmbor4TOcrw=
	=
X-Google-Smtp-Source: AGHT+IFgTjY0B9Q+EBdWo53fKYf0MGWnVrcQoJfE4mJdhQbgBfmM6+4xRs286ajDlhlvB8MLPAk/3g==
X-Received: by 2002:a05:6000:4014:b0:38f:28a1:501e with SMTP id ffacd0b85a97d-38f70772b46mr10667747f8f.8.1740407317886;
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123? ([2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d9be9sm32217076f8f.79.2025.02.24.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:28:37 -0800 (PST)
Message-ID: <43d23c40-09bd-46ca-840f-4724a42946a6@baylibre.com>
Date: Mon, 24 Feb 2025 15:28:35 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] arm64: dts: mediatek: mt8395-genio-1200-evk: add
 support for TCPC port
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-usb@vger.kernel.org, Chris-qj chen <chris-qj.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Yow-Shin Liou <yow-shin.liou@mediatek.com>,
 Simon Sun <simon.sun@yunjingtech.com>
References: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20250224114934.3583191-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

On 24/02/2025 12:49, Macpaul Lin wrote:
> From: Fabien Parent<fparent@baylibre.com>
> 
> Enable USB Type-C support on MediaTek MT8395 Genio 1200 EVK by adding
> configuration for TCPC Port, USB-C connector, MUX IT5205 and related
> settings.
> 
> Configure dual role switch capability, set up PD (Power Delivery) profiles,
> and establish endpoints for SS (SuperSpeed) and HS (HighSpeed) USB.
> 
> Update pinctrl configurations for U3 P0 VBus default pins and set dr_mode
> to "otg" for OTG (On-The-Go) mode operation.
> 
> Add ITE IT5205 (TYPEC MUX) under I2C2 bus and configure its properties;
> also add references and configurations to 'typec-mux' node.

-- 
Regards,
Alexandre

