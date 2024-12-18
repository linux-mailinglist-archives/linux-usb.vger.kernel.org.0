Return-Path: <linux-usb+bounces-18648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFEB9F6A6D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 16:52:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C661818880AE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 15:52:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C970A1F0E33;
	Wed, 18 Dec 2024 15:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="BsVe/Zc6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8545213D518
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 15:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734537117; cv=none; b=kRobik/QZW7dNtUANQNi75P1xzB4saJjBaAb7FNSKLDI0hMFCVbsTq1uoAVXN4Mczd40QibzVGcDfA9HA2PxPXPYJomdsi8klRVDO3FX62zdgTfYaK6h9SkvZp+ROPS+4rhhj4JiDIQcY/arQS4rji9hV0h7sGbIaq2viTbfVCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734537117; c=relaxed/simple;
	bh=01My02vUg66FtKUMzjhDA/6I+cAw7h1WXAjdi947LXU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V2lNpQT2zn4uZcpReAeyNdaE85sliG67JSRx17Sec7j8TGMnwSl3EinHZ8U2ufqdGz8POkqrGVGfg/lQU2tVOBmnTuzvyrF4w/fP5/q0fanVk9WsYgoAF0J+qFNEBDca1rQBvD4qHalD0oAX7qlwOxMdivvIQ4W5fO7VA5/ZhXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=BsVe/Zc6; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6dcf62a3768so17306436d6.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 07:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734537114; x=1735141914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4whGDZV+puG0fV38p1mWf5yb5JAddh1OIYmWwZJ4M54=;
        b=BsVe/Zc60hIRbBS1hAELDUeqvREO4V/G/Ki24hMmwQrkl/cWKht9Hlg3Q8wJG/vva5
         i3M3T6IpN/XApudzME1juTst1DJyVvPXtOYQ0cwwLcvY1QEv5mMdns1VgYywUCkvVtjL
         3XO8aoAzdiFL8OqC1grBGtIK8214pgPwyYwbQFz1FAhIObZUDM15I8C6IaxP+2OfyJeO
         ejURswdg8+P5AfKWD1PGBn6tuROezlkB5lBcWDNLjw7HmHq8ZJAzcnxXjiasdARCPXb0
         CNS1V8EHaVvdtobVzk/evtaRCPtSClZUb+mxdBYSTEYTaPSW2W2SdSvamTIu7ziU5v8S
         Do0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734537114; x=1735141914;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4whGDZV+puG0fV38p1mWf5yb5JAddh1OIYmWwZJ4M54=;
        b=dG+yhYR9nQ/StyDFlrG3MwhkJc4UC7mw4A3zqERUHEHUhw3VSs84sKgkBjOG0p41yb
         ID8hrWMbjnKQCycXNNTu30AKE+qfPdiclbhdMRfYwvUKSKJ4nVpW7z311ASRItdaKTkx
         PHc7PErDREllw0Cb1UuggoYqoe95AyocXb3fRKIIXnLKhTzDcep6OISqa6RiYe9iXzbZ
         /rb7Fq/wsQBPGKCiB/tsbLQaX57QE9ZGK1lSQmXRQwA9dDSVPu9ZORYkePUBMrXlmAJO
         b/JIVXWjDQN4TKpJkz0VK+5ldmYkA3eD4cgUBqM6QXLj7apvmfy0p1AeYXJC8TshIY85
         TMfw==
X-Forwarded-Encrypted: i=1; AJvYcCXV+NEshQyxgaci01j67zgkIricRnngKMKbdGwBoA2kCymydb8vNniZwxMNOQafvq1lDEXFA4rTBzg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk3hpRQfMTAA+dyW1Oc6qH3hcAKJFnrdqPOFP3yEq3Lw89fy33
	c63TeGSacrHQYIf4XJxD+5TzxSI3TFz/V3bORm2yw6oSu8R7bjWxYpExaPt9Lw==
X-Gm-Gg: ASbGncuR9YG53fAH20zyARCoFBKUkEF0Rrz2PXp2zLPnKL6FlQ4D/4NWWZJKNAKqZCL
	aIBwgGCAH2SYqYansiZTyco1j5G7B7ZLM2D/ULdB56TPeB5MhbSWCul3xdo8qkdhh/IGzviSC4w
	q6dKD4ac5rT7CcfltQQqB9TDVJDEqLGv/SgTpIbUxyrIGlAP5xbboaYNhNZlPT+ExTE1x9at0yv
	GFds1v8kphBKcrsJ0NL+Vr13UF2tlSFcEh+PV1KUhyo8wNlzcpnnhLA/CbCxW1LokvRDdAEYYo=
X-Google-Smtp-Source: AGHT+IEJk78hnxsyKnXbPQoanGIsRf0N5bA35Q8LGZ05dCUcZQlkeUQ7pZumcNCfZHjUcVagmkur0A==
X-Received: by 2002:a05:6214:1d0d:b0:6d8:b3a7:75a5 with SMTP id 6a1803df08f44-6dd092598b3mr55798746d6.42.1734537114549;
        Wed, 18 Dec 2024 07:51:54 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd26e5a9sm50785616d6.56.2024.12.18.07.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 07:51:53 -0800 (PST)
Date: Wed, 18 Dec 2024 10:51:49 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, quic_jjohnson@quicinc.com,
	kees@kernel.org, abdul.rahim@myyahoo.com,
	m.grzeschik@pengutronix.de, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com,
	dh10.jung@samsung.com, naushad@samsung.com, akash.m5@samsung.com,
	rc93.raju@samsung.com, taehyun.cho@samsung.com,
	hongpooh.kim@samsung.com, eomji.oh@samsung.com,
	shijie.cai@samsung.com, alim.akhtar@samsung.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: f_midi: Fixing wMaxPacketSize exceeded
 issue during MIDI bind retries
Message-ID: <eaa330e8-0510-445d-8aef-b39164169cb1@rowland.harvard.edu>
References: <CGME20241208152338epcas5p4fde427bb4467414417083221067ac7ab@epcas5p4.samsung.com>
 <20241208152322.1653-1-selvarasu.g@samsung.com>
 <2024121845-cactus-geology-8df3@gregkh>
 <9f16a8ac-1623-425e-a46e-41e4133218e5@samsung.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f16a8ac-1623-425e-a46e-41e4133218e5@samsung.com>

On Wed, Dec 18, 2024 at 03:51:50PM +0530, Selvarasu Ganesan wrote:
> The issue arises during the second time the "f_midi_bind" function is 
> called. The problem lies in the fact that the size of 
> "bulk_in_desc.wMaxPacketSize" is set to 1024 during the first call, 
> which exceeds the hardware capability of the dwc3 TX/RX FIFO 
> (ep->maxpacket_limit = 512).

Is this gadget supposed to be able to run at SuperSpeed?  I thought the 
dwc3 controller supported SuperSpeed operation.

The USB-3 spec requires that all SuperSpeed bulk endpoints must have a 
wMaxPacketSize of 1024 (see Table 9-24 on p.9-25 of the USB-3.1 
specification).

Alan Stern

