Return-Path: <linux-usb+bounces-6051-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6219884E91D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 20:48:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 123E61F31494
	for <lists+linux-usb@lfdr.de>; Thu,  8 Feb 2024 19:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEA5381CD;
	Thu,  8 Feb 2024 19:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WmFpBefF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFB2364AA
	for <linux-usb@vger.kernel.org>; Thu,  8 Feb 2024 19:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707421723; cv=none; b=NL+XLiIQhloFLgPdby6KhghZm7eNleY7BHm1/v5r1HPjnjEjMiGKccKpiE7zQBakaKDtnl0AV0lpdYt6/tCcPOXpxkB5q6P7gAZ925BzNmS/384vtFCvfLR3kJNRKg03RYEVSFZP+vjNZ6bW4lw8u8P3A87Gcp/Y5mebw+S7lWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707421723; c=relaxed/simple;
	bh=QRHcsfNL5CodrBloEE4Fot31u6FMaHiMM28bKZysteY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdXdfwVJwL5xXZYPYRFcMn58RksK0tgZ9G9fGzugR9nhAXkXnKGd940e+xrdRFjTW9LPzOIL7SVhWk63hbvKDtQQw3gMw7xKmnMolDIxgMlzU6ti+O0GW4vjq+0cSJ0DTFWEYC0U1RUt2P/n/bjZj41Usaq+IpqU7vQq0C1R9mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WmFpBefF; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40f0218476aso102595e9.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Feb 2024 11:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707421720; x=1708026520; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0o3ZX+cYKVcvLxzGSXiG/iTbM06IS54gjI2VxBYvRQQ=;
        b=WmFpBefFfkZZ9ZjvABNEvdDOkxlO1c87CBrbzhYQnkbeQbfG7Lo8jusUCajauY2Mtz
         B/xgIgVce59JHg1b6MZA76IHWs5IgAviUlc3VfTdKoRm8s0q8y9xH0Hl9stg0lnMkPOz
         +vXSOkLblssh5RCkhAsuZGEWuJeXvARk5IwgndcavQjxyVKAO3zOQ/UyTmWBIflR4quT
         MLiCXRjVa2b4vOq3WzcjifG4oe9cdOi7g0acXQdQfsgbnGyDswV16nuP/Pqy7WrYDIPH
         llrPYqgzsw0MnbRR9g/zMozvQjHbmm7mohBTdMKPkr8SnZIW6he3gFd5CWC/fzot9dRx
         R5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707421720; x=1708026520;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0o3ZX+cYKVcvLxzGSXiG/iTbM06IS54gjI2VxBYvRQQ=;
        b=QDE06H1yedqFViS91J5gAEPrCmZYQBgIdO411DW83bFiEygWUu15sfpxBoSbUpw3Ss
         tGlpJ7Uezd3CsUudh1Z+B9OZBLvOykWX0L0X+/AETABwfY/VIX1/jbdcwcNLdjP5wOXn
         RzuTvTy4E0IuS7TqUFGA/dyzGaEve8deXKVn2OtGKqGPmUkUrkB4Psm4mu45IQy7YUaA
         LqE0O3XJ7d9CC9ChtSEXzGH9iMWpex3WjtDrC9jcCAZqo/m4rADy4rebhfXmzk1KqM5m
         yTERRIUl06jAYskKF9KSdGI1aRMFIpCYRyJqamt3hB/wQtyLXNEFzEG5qjF+5UQSRscf
         4mog==
X-Forwarded-Encrypted: i=1; AJvYcCU9RTtW/RkLglGL0uudIo2Ad/O6Na0j1eFkS7Bv/CFSBS1P5wwDRe5VR0i1RyCZuV8+WsxPzse6w6cp1WzoA3tLkDNQI6vOBwyE
X-Gm-Message-State: AOJu0YwcsZPpoUJNca9q0M0gJhOvYgMnFPtfIfvfxblj2LdskE8JOA/p
	bj6AkQ9sfxOEX/yzSZOIueWN+bbUpCzyU5Yf2FiRUkvV7VdCsPpX2Nhj2vOpSu1npEq3M5HQejT
	o941xC4heZgSQcSoO9d3Jl0cxN0pUNpz9b21D
X-Google-Smtp-Source: AGHT+IEXamVgx0wZWlhAd5Fj3QmrOnuWMtU8C9KH0ASLbQMIPjYokiSlmVY0iMyuos0B8k3rP6Ck4ssoLiC5dnkJmi8=
X-Received: by 2002:a05:600c:1e08:b0:410:2267:47c7 with SMTP id
 ay8-20020a05600c1e0800b00410226747c7mr25521wmb.3.1707421720329; Thu, 08 Feb
 2024 11:48:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125004456.575891-1-abhishekpandit@google.com> <20240124164443.v2.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
In-Reply-To: <20240124164443.v2.2.I3d909e3c9a200621e3034686f068a3307945fd87@changeid>
From: Jameson Thies <jthies@google.com>
Date: Thu, 8 Feb 2024 11:48:28 -0800
Message-ID: <CAMFSARfCPbbDviaVoZMvftp1PdXFHKv9ouzG==XnCP9Wrzuv-Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] usb: typec: ucsi: Update connector cap and status
To: Abhishek Pandit-Subedi <abhishekpandit@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, 
	pmalani@chromium.org, Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rajaram Regupathy <rajaram.regupathy@intel.com>, Saranya Gopal <saranya.gopal@intel.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Abhishek,

> +#define UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(_f_) \
> +       (UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV(_f_) << 8)

Can you replace this with a common HEADER_REV_AS_BCD macro that can be
used for both GET_CONNECTOR_CAPABILTY and GET_CABLE_PROPERTY?
Also, the USB PD major revision value in the message header is one less than the
revision (PD Spec section 6.2.1.1.5). So, we need to add 1 before shifting.

Thanks,
Jameson

