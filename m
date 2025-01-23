Return-Path: <linux-usb+bounces-19679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 451B0A1A6F9
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:25:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119971889384
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1316212D6A;
	Thu, 23 Jan 2025 15:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b="Fi5Yfl8z"
X-Original-To: linux-usb@vger.kernel.org
Received: from iguana.tulip.relay.mailchannels.net (iguana.tulip.relay.mailchannels.net [23.83.218.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC3212B38;
	Thu, 23 Jan 2025 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.253
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645921; cv=pass; b=bRwYlsdoJf2I/XSRfynFLmNfdsyvHmbSWYxoosDL691+QeRov5rx9mf7wWaUlfufKQ4a7g4MezImeHlmYYOigtOVZOP5uPh2AVuvBZvjZYPbXALUI/CWYgl1IicLBFRNS3tU1O0rFiBTL6om3EggfpbpbQX63XVOnOKpJ777Wp0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645921; c=relaxed/simple;
	bh=t6jhVo4UU1h4RkaWPUHfDtf70GTcEiOcpBf304Zb5OM=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=odMTXuWWBlVWcY79xJZoFCBajDN1vh0NB3qBCEnaXG627Jieu+tyA1ZyLOJn0OMRvZ5vqA0inARUVdRbgaxW0JaiF6z9geaVG8KsWJiw/S5nOlghmFajay4Vw1QY0ZwtsQ4zzSo0cJffw+Od2AUxbKskN9zLHTwioFjI4C33jfk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com; spf=pass smtp.mailfrom=arinc9.com; dkim=pass (2048-bit key) header.d=arinc9.com header.i=@arinc9.com header.b=Fi5Yfl8z; arc=pass smtp.client-ip=23.83.218.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 02BB4323792;
	Thu, 23 Jan 2025 15:18:28 +0000 (UTC)
Received: from fr-int-smtpout3.hostinger.io (100-117-137-111.trex-nlb.outbound.svc.cluster.local [100.117.137.111])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id E4DE1321D84;
	Thu, 23 Jan 2025 15:18:25 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1737645507; a=rsa-sha256;
	cv=none;
	b=yhInf9CLeMHlPCfhD4X/OO7v0YGDa4Epy79rxZ4+WRISuT4pRHco7Rq4b0vfsWXLpppmh/
	SV30Zz0HjyATXAoSJGMudWgG1PiiTqvzLoOLMUBMDMFnyp56OZOsmJQSXesj7ouTXobYCD
	yriygL8SWSyobVyf5yFlYJpJY4RDRVdWUHkgHM4aj76/8pJOjC/GZ8MzQntjk9zUJ+pOPW
	rNMBKifqwH3KrBy/RRk33+iFhNy3k7UkCuHbgvr72DKrAde7buLaZm6wGtfbma0xmqloIr
	snmb0WQvbTT1CIkPcKH4M7L/VhGkptxtBb1CjT8gwNClgcVygQOfw32m0xXuOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1737645507;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=tqIj8kS7x1OxLx0Vv7IQnq0AS8Ks83tS2NCDsGUGzo0=;
	b=Xg+/duj3sr0bDld9bs2E8K17DRLx0jy6vUF1p15lVo6zktBcGFj+3/Wqf3QAjj3ETpvVii
	aAZytlFSpEgRhTYOMn2VlAqaFdEXcTRkWSA9kP4iC/Qm7b7ujN904ULj6MVsDqTQxr8mIt
	HG31ALOYKURgbod3bUaZmkDHR5gYptzKQJjlzxDBHg+zk+5G5964gR4bdXhnxGLZ3ecmQx
	PD1pAy2A4dzlXUq+d9vkw5B0wAvxcW6bndCcYbMAoEIJoDdrUTpayil0gS44W3/avXlQxr
	GdIuhy+ngrm1g11Q209IT29ZRKaN1eBUdWXtJJY0XdU5J4pNRZoj8FFskwlkSg==
ARC-Authentication-Results: i=1;
	rspamd-5b877fb8f-prz8m;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=chester.a.unal@arinc9.com
X-Sender-Id: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|chester.a.unal@arinc9.com
X-MailChannels-Auth-Id: hostingeremail
X-Abaft-Shelf: 3d8adb9d2dae49b9_1737645507332_3906925930
X-MC-Loop-Signature: 1737645507332:232160927
X-MC-Ingress-Time: 1737645507332
Received: from fr-int-smtpout3.hostinger.io (fr-int-smtpout3.hostinger.io
 [89.116.146.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.137.111 (trex/7.0.2);
	Thu, 23 Jan 2025 15:18:27 +0000
Message-ID: <82f2d730-7871-4ac3-a1a3-e51ed50bb764@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com;
	s=hostingermail-a; t=1737645503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tqIj8kS7x1OxLx0Vv7IQnq0AS8Ks83tS2NCDsGUGzo0=;
	b=Fi5Yfl8zaoT2SrablQ/Dw4lrs0kxMLsAEcp4wVET+HYHHYEPaG5xtESFpS494tOy+dISdq
	zompz+KWoFDA27JEtwkXQ9B3axbFU5qE51nhaUbmdV1IPrzg9yNL7LMWTmYeAzYZyCmfAQ
	dqdWlCTKEcdJb6fCCkQ1Jf3gF7GmUeNcNGSf0Mwa78LTLSvUdOolSUJ4J5cLUI2OVE7O97
	seHETEBOe4rRccUt3ButCKZrTIfPu+4XDZcnmZBBFjZfo+tW4OFWFL0HKQJMTmnyK73QFq
	Eg8rpHKyW+BtPTw/png9GTq5Zz6l0LI4H1wGoY4K21aM3AwtTka9fxDx6aTEZQ==
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: serial: option: add MeiG Smart SLM828
To: Johan Hovold <johan@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dwayne Du Preez <dwayne.dupreez@xpedite-tech.com>,
 Alexander Scholten <alexander.scholten@xpedite-tech.com>,
 Zenon van Deventer <zenon@xpedite-tech.com>
References: <20250123-for-johan-meig-slm828-v1-1-6456996e94a5@arinc9.com>
Content-Language: en-US
From: "Chester A. Unal" <chester.a.unal@arinc9.com>
In-Reply-To: <20250123-for-johan-meig-slm828-v1-1-6456996e94a5@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 23 Jan 2025 15:18:21 +0000 (UTC)
X-CM-Envelope: MS4xfBCOIepbQgN/R9f2s9LeTZf+Z+1pnyzwBEyldy+a79ziJfHh64kaQUOpYnRQdP5TFzT2FTI2TBVGDPPFbZBM3LAXF5Kq1XGT8lQ9EQyFP7sv9+1B5sLe 7kzuoSWLCqKnlqxosbtAYa7VQgai/ZaPz2kno/VvmgMvlpSz0uwNP2j3L7mg6LLb3j6qn3Wxddl7687XbrgIbOHnlYny+jPl5XejzO10rhW48ujS5j2X8XWz U48RqdVjLCUqIFceGRRZER1Hzz1wfJKErbtVP0S7k2kbgUSQNsp//6PgHq5tX3ZgPgHMGDeRyTEtetYEcSnLqpv+0QXlDxFytTf1IqlCoXk98C+Xda6gl73T ELFcA7fHER+6MGKQ6/Br/s2YwYY09EmJ58cOqnTw7HZb9XmOYgzK4i2dt1jRvE5XNIhWS0thBau4NMhB4QkT5F8PuTWoIA==
X-CM-Analysis: v=2.4 cv=BvTPwpX5 c=1 sm=1 tr=0 ts=67925dbf a=BbZViPxhz42NWKi5dJN8gw==:117 a=BbZViPxhz42NWKi5dJN8gw==:17 a=IkcTkHD0fZMA:10 a=MRyn8z1uXntXrCYCAB0A:9 a=QEXdDO2ut3YA:10
X-AuthUser: chester.a.unal@arinc9.com

On 23/01/2025 13:13, Chester A. Unal via B4 Relay wrote:
>   drivers/usb/serial/option.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 1e2ae0c6c41c79dd38f2c1d3a98e58ebf076050a..e25acac854cca38d2e0ace464be11337d3bbecee 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -621,7 +621,9 @@ static void option_instat_callback(struct urb *urb);
>   
>   /* MeiG Smart Technology products */
>   #define MEIGSMART_VENDOR_ID			0x2dee
> -/* MeiG Smart SRM815/SRM825L based on Qualcomm 315 */
> +/* MeiG Smart SLM828, SRM815, and SRM825L use the same product ID. SRM815 and
> + * SRM825L are based on Qualcomm 315.
> + */
>   #define MEIGSMART_PRODUCT_SRM825L		0x4d22
>   /* MeiG Smart SLM320 based on UNISOC UIS8910 */
>   #define MEIGSMART_PRODUCT_SLM320		0x4d41
> @@ -2405,10 +2407,12 @@ static const struct usb_device_id option_ids[] = {
>   	{ USB_DEVICE_AND_INTERFACE_INFO(UNISOC_VENDOR_ID, LUAT_PRODUCT_AIR720U, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SLM320, 0xff, 0, 0) },
>   	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SLM770A, 0xff, 0, 0) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0, 0) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x30) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x40) },
> -	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x60) },
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0, 0) },	/* MeiG Smart SRM815 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0x10, 0x02) },	/* MeiG Smart SLM828 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0x10, 0x03) },	/* MeiG Smart SLM828 */
> +	{ USB_DEVICE_AND_INTERFACE_INFO(MEIGSMART_VENDOR_ID, MEIGSMART_PRODUCT_SRM825L, 0xff, 0xff, 0x30) },	/* MeiG Smart SRM825L */

SRM815 has an interface with this specification as well. Perhaps, it would
be a good idea to change this comment to:

/* MeiG Smart SRM815 and SRM825L */

Chester A.

