Return-Path: <linux-usb+bounces-18632-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6AB9F61DC
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 10:35:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 868171894516
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 09:35:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684FE194A64;
	Wed, 18 Dec 2024 09:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M25KlC9U"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65161991A5
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734514430; cv=none; b=aaT5w9Tl9bxAuNYXHgH2+p4SYIPbVlQeEO3DpJ7fU6bot4LtIzB0DxuN5DLuKct09YN415FtY807GNvwRFoWW1i2W3Y1Ejx/bbmbLzDxbTebj0sNB9zf5GTws0CdYPbWkJQogrUJy5+SmutOLRMkOHjR00fC1He+OSRgbg5HxK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734514430; c=relaxed/simple;
	bh=gB1iWqzpAN3tpTJysrExgp4hGOonkKS+rAnj6u4z84A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6bZu5qw9A+SkyLTrvY7hEVJri0ib+PNJ0xbzpVIgnHWbC27FatuEd/KW4Z/lR4S7vj8qo6K7g6BHfxUbJEXgj2fEASzXTOv0mnT4lgDoI7st4FJzW78MG1eY9iAN2oWynjZQ947QgIycpi/rqzTG1nm6ICEuV+Bxk4MgGz64lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M25KlC9U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aa69077b93fso933742766b.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 01:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734514426; x=1735119226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7KtEz77JWBQIkMVGJ2sLvEyiEnerzUN26MbJDqnAvd8=;
        b=M25KlC9UwAqU3YVFhrEdYJVnY2vxxrd4kc8G7d9SXkcA9NCUd1WEP2WhSXVoiSDMQQ
         dw9XRM8Jz9AkMTthOzd0LQZ02+2LSCCKynl9tZ0uRyesJPqWyyfttbKlPV8RhVUdDsWQ
         +STVaTNSZPvDobJfBPLNyJM/OKFQ+NaEZv6iuKjyZqvKDljdiaOPJfrCjiHGG5/YqD3+
         Py7qO//NPI4V9XY58br+YhqJugRKogtV5nh81R+ticrynn0b0Z7NQ66Y2lUYXs9kuRWM
         QMBntSXEJ6dxOCmtHBYsl8DOFP2gk/K005WOMapRjhkDlh9p71bCGElo1SlFbQrd5GqW
         nbSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734514426; x=1735119226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KtEz77JWBQIkMVGJ2sLvEyiEnerzUN26MbJDqnAvd8=;
        b=BZr7fHUgNHhBfoEX91bLq9YXrWMVGbYmReLkmuyBO8TbO0bnmkpk+XMr7aZQQXoBom
         cT+rWyjNmvVV3JlaRH1wYUn6sigrx6TQLWbhTX2jfxu/6gYzTiwHiTWFOum/WWaGwfEM
         b/hh1hTTJGlngLPsoTN3FHFhtdnwZLlgkcW3qtowFgj08wIwwWmvkAUKumorcjB4GS+5
         0isO59vTZlo9Zi72tBLbBhF0NHpcQ0LRGCDXwLyuBLY5sAh5CKyPMw+onx61WyZL+F2O
         dG34GBTj24dMMmFdH1icVjUDnYmnOF2S6nUjr9OzcLJXNbEaZ/4XEONcc0VwqYBBW9vw
         udmg==
X-Forwarded-Encrypted: i=1; AJvYcCVRjW7yodFwITJfjEbtSRMLGZSD+UuHVC//GLZzTs86fUKGutEf0mL0tRE/2m1fZwT6vrmsqG2CPaY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFIyAiPv8MXe5Q0uAdTnQi62zFomYX9TP8ynDkSvOp4iQ5o8Gf
	yIMik6w7l8b4jGayzysdWFitz3OrQr0EdBk1ouDDvDAb6Xvo74O1qM88/CJxcZM=
X-Gm-Gg: ASbGnctOm+CACS9VwQcBUzyA4A/6CPI16RlhU1MW6+GY6Ls7w/FBkbj9PUh8YDUGJ0y
	pQCaRZB/wguN+eGs3M/416/5Edk7/YWsTFh/KGgCoSVtCl/3IBKZ34hQuirodrI5wdQJmRHvOlv
	QhQ1LjJ1V3iK6lrdXdG/vmgcSH/ouoEMqPVmUPvaROhu1dlwuZ+Ma24QUso1xID6BSP7IPFK6ai
	JvWq1oCQ8/6/diekdsIcoYfXV7Eiub1TrAW+u4LlMFlU7Qksl8BiFYwjvoNYg==
X-Google-Smtp-Source: AGHT+IHi6uZQ9xDNRIhHpOS6IYYREihc8U3QZtXG5KWhwQ0Q4UtrjFkSEHt7MuPO1TUAsje7nAFxUg==
X-Received: by 2002:a17:906:3bd3:b0:aab:f8e8:53ce with SMTP id a640c23a62f3a-aabf8e857d8mr114230466b.11.1734514426251;
        Wed, 18 Dec 2024 01:33:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9c3eb5e0sm515344766b.44.2024.12.18.01.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:33:45 -0800 (PST)
Date: Wed, 18 Dec 2024 12:33:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Miao.Zhu" <Miao.Zhu@synopsys.com>
Cc: gregkh@linuxfoundation.org, robh@kernel.org, xu.yang_2@nxp.com,
	andre.draszik@linaro.org, emanuele.ghidoli@toradex.com,
	heikki.krogerus@linux.intel.com, m.felsch@pengutronix.de,
	rdbabiera@google.com, u.kleine-koenig@baylibre.com,
	conor+dt@kernel.org, jun.li@nxp.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	Jianheng.Zhang@synopsys.com, James.Li1@synopsys.com,
	Martin.McKenny@synopsys.com
Subject: Re: [PATCH v4 1/2] usb: typec: tcpm: tcpci: Make the driver be
 compatible with the TCPCI spec [Rev 2.0 Ver 1.0, October 2017]
Message-ID: <b5e5cd33-2b59-4e93-8acd-379290917e42@stanley.mountain>
References: <20241218085933.2790127-1-miao@synopsys.com>
 <20241218085933.2790127-2-miao@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218085933.2790127-2-miao@synopsys.com>

The subject is too long.  You've sent v2, v3, and v4 today.  Please, wait
for a day between resends.

On Wed, Dec 18, 2024 at 09:59:32AM +0100, Miao.Zhu wrote:
>  static int tcpci_set_pd_rx(struct tcpc_dev *tcpc, bool enable)
> @@ -741,33 +748,86 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
>  		struct pd_message msg;
>  		unsigned int cnt, payload_cnt;
>  		u16 header;
> +		unsigned int frame_type;
> +		enum tcpm_transmit_type rx_type;
>  
>  		regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
>  		/*
>  		 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
>  		 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
>  		 * defined in table 4-36 as one greater than the number of
> -		 * bytes received. And that number includes the header. So:
> +		 * bytes received. And that number includes the header.
> +		 * In Section 4.4.14 of the TCPCI spec [Rev 2.0 Ver 1.0 October, 2017],
> +		 * the RECEIVE_BUFFER comprises of three sets of registers:
> +		 * READABLE_BYTE_COUNT, RX_BUF_FRAME_TYPE and RX_BUF_BYTE_x.
> +		 * These registers can only be accessed by reading at a common
> +		 * register address 0x30h.
>  		 */
> -		if (cnt > 3)
> -			payload_cnt = cnt - (1 + sizeof(msg.header));
> -		else
> -			payload_cnt = 0;
> +		if (tcpci->data->RX_BUF_BYTE_x_hidden) {
> +			u8 buf[TCPC_RECEIVE_BUFFER_MAX_LEN] = {0,};
> +			u8 pos = 0;
> +
> +			/* Read the count and frame type in RECEIVE_BUFFER */
> +			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, 2);
> +			/* READABLE_BYTE_COUNT */
> +			cnt = buf[0];
> +			/* RX_BUF_FRAME_TYPE */
> +			frame_type = buf[1];
> +
> +			/* Read the content of the USB PD message in RECEIVE_BUFFER */
> +			regmap_raw_read(tcpci->regmap, TCPC_RX_BYTE_CNT, buf, cnt + 1);
                                                                         ^^^
buffer overflow?

> +
> +			pos += 2;
> +			memcpy(&msg.header, &buf[pos], sizeof(msg.header));
> +
> +			if (cnt > 3) {
> +				pos += sizeof(msg.header);
> +				payload_cnt = cnt - (1 + sizeof(msg.header));
> +				if (WARN_ON(payload_cnt > sizeof(msg.payload)))
> +					payload_cnt = sizeof(msg.payload);
> +				memcpy(&msg.payload, &buf[pos], payload_cnt);

There is existing code later which does bounds checking on payload_cnt,
but it's too late.  We would have already overflowed buf[] and
msg.payload here.

> +			}
> +		} else {
> +			regmap_read(tcpci->regmap, TCPC_RX_BYTE_CNT, &cnt);
> +			/*
> +			 * 'cnt' corresponds to READABLE_BYTE_COUNT in section 4.4.14
> +			 * of the TCPCI spec [Rev 2.0 Ver 1.0 October 2017] and is
> +			 * defined in table 4-36 as one greater than the number of
> +			 * bytes received. And that number includes the header. So:
> +			 */
> +			if (cnt > 3)
> +				payload_cnt = cnt - (1 + sizeof(msg.header));
> +			else
> +				payload_cnt = 0;
>  
> -		tcpci_read16(tcpci, TCPC_RX_HDR, &header);
> -		msg.header = cpu_to_le16(header);
> +			regmap_read(tcpci->regmap, TCPC_RX_BUF_FRAME_TYPE, &frame_type);
>  
> -		if (WARN_ON(payload_cnt > sizeof(msg.payload)))
> -			payload_cnt = sizeof(msg.payload);

regards,
dan carpenter


