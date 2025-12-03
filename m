Return-Path: <linux-usb+bounces-31123-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 759BEC9DD70
	for <lists+linux-usb@lfdr.de>; Wed, 03 Dec 2025 06:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18FB43A1CFE
	for <lists+linux-usb@lfdr.de>; Wed,  3 Dec 2025 05:59:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F100B289824;
	Wed,  3 Dec 2025 05:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EmrhFwSn"
X-Original-To: linux-usb@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FA2877CB;
	Wed,  3 Dec 2025 05:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764741571; cv=none; b=G/+Omzn+9SeHHWUzlCaeG2NqKtY3eXGjrZMDKdgRGy8T1B8DowSnJdxjtA06Ih75Vn36Ycixo6AyqYivmqL/3BMGVwQBO7jHIMPHSt2CFU4TV4SKBZSrK+wexLHT6uolzpPUsZyT7KUrmi4Q+GBy/SM6YILHWPQrX5iLxvv5bs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764741571; c=relaxed/simple;
	bh=LfyQogt3DTFM7ha1LnLUaFOYzUdqSi1CQDR8mI30/CQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eNy6aI2S6as/ml+zZ/U9bszMs+cjP4HJg98N6/WwtQWLdujH5Jf/XzOYe5CwgDCEbZHw3cOLJBm7M/RYfaPuXL8Umdac0D7K9Dm1eUAo/j1Q9VOX43///kjMv8+J/ZovVHykH8mSoPfGaNFrz2Z9PYqeiKWrywIoKi5XDNbVyCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EmrhFwSn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764741567;
	bh=LfyQogt3DTFM7ha1LnLUaFOYzUdqSi1CQDR8mI30/CQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EmrhFwSnfdP3y87GlznXzY59fm3cTbYDYYc8JRk1l0wBks5RrzzhaopOpyKtbiULx
	 uGok86swZtfkzzYDD7urbm8wa7S8EuFjnrK2gRKFhMKeSGSbGOnlrHVLgxnZ3uUBuX
	 n5JNjySLs1BgsMlDTTsHCacNtV2z3cDKwNpS0RrkbzIjUG7n4WXh5cMPjQtji8ZZXs
	 3dsNHsKDVqkc9N36jx0gS/zqLKR17iUOytRZUIhQ5Pgtt6touv/QrB57KgT3WdtZ1n
	 1gNVo8SQ5PZogZ/4Yi85dux94xE6rl0r0CA7w7pwD9cvohiSh2iIj1H9zgIJTuk1ca
	 HT+yyZxSr8VDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CDBE317E12D5;
	Wed,  3 Dec 2025 06:59:26 +0100 (CET)
Message-ID: <a709ada6-eb68-4609-ae8c-b3bb8bcf01ae@collabora.com>
Date: Wed, 3 Dec 2025 06:59:26 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] usb: mtk-xhci: add support remote wakeup of mt8189
To: Mingjin Ge <mingjin.ge@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251203013521.2038888-1-mingjin.ge@mediatek.com>
 <20251203013521.2038888-2-mingjin.ge@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251203013521.2038888-2-mingjin.ge@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 03/12/25 02:34, Mingjin Ge ha scritto:
> Add remote wakeup configuration for the mt8189 in xhci-mtk driver.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Signed-off-by: Mingjin Ge <mingjin.ge@mediatek.com>

This is not the first time that I say this - and probably not the last one.

Please, stop hiding hardware - the MT8189 SoC has their XHCI controllers behind
MTU3 controllers.

Please add the wakeup configuration controls to MTU3.

I didn't check the datasheet and going by memory here, so here's what to do:
  - If there is no standalone XHCI controller (all of them have a MTU3 parent)
    *do not* add the UWK here in XHCI-MTK, but add it in MTU3 only;
  - If there is at least one standalone XHCI controller (which has no MTU3 parent)
    add UWK *both* in XHCI-MTK *and* in MTU3.

Regards,
Angelo

> ---
>   drivers/usb/host/xhci-mtk.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
> index 8da05e9dfa28..134a46907db5 100644
> --- a/drivers/usb/host/xhci-mtk.c
> +++ b/drivers/usb/host/xhci-mtk.c
> @@ -96,6 +96,10 @@
>   #define WC0_IS_P	BIT(12)	/* polarity */
>   #define WC0_IS_EN	BIT(6)
>   
> +/* mt8189*/
> +#define PERI_WK_CTRL0_8189	0x0
> +#define WC0_IS_EN_P_89		BIT(18)
> +
>   /* mt8192 */
>   #define WC0_SSUSB0_CDEN		BIT(6)
>   #define WC0_IS_SPM_EN		BIT(1)
> @@ -140,6 +144,7 @@ enum ssusb_uwk_vers {
>   	SSUSB_UWK_V1_7,		/* mt8196 IP0 */
>   	SSUSB_UWK_V1_8,		/* mt8196 IP1 */
>   	SSUSB_UWK_V1_9,		/* mt8196 IP2 */
> +	SSUSB_UWK_V1_10,	/* mt8189 IP all */
>   };
>   
>   /*
> @@ -407,6 +412,11 @@ static void usb_wakeup_ip_sleep_set(struct xhci_hcd_mtk *mtk, bool enable)
>   		msk = WC1_IS_EN_P2_96;
>   		val = enable ? msk : 0;
>   		break;
> +	case SSUSB_UWK_V1_10:
> +		reg = mtk->uwk_reg_base + PERI_WK_CTRL0_8189;
> +		msk = WC0_IS_EN_P_89;
> +		val = enable ? msk : 0;
> +		break;
>   	case SSUSB_UWK_V2:
>   		reg = mtk->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
>   		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;


