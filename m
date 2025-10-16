Return-Path: <linux-usb+bounces-29379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B58EBE4977
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 18:30:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4856C5E0EF2
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 16:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8ECC32AAB0;
	Thu, 16 Oct 2025 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aekr6iZz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDE9329C59
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 16:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760632206; cv=none; b=VKa7utIZRe9BkTwcCgYZmVdHqT72TH/NI8iyXVhgOV7WZm5rKhjB9DzxA5lR91d2t7pyY/9jaWh4o4ux8OpMpAoy0mOk7gh9YOOZ9Xi/yw27elxBtXe1YUZWxaZNbP/An8XJ6LAoalvnF3Zrd9n/7KmPv19Q4deH+hrbGNZUxms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760632206; c=relaxed/simple;
	bh=EDOCxm3GTbpxd9p/oeC8nAaBNgXM0bPq+Ky68KM3cEs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExRYXPOSMPo4cmyIXHBqXh2IuT/NanRMXvVoZH284sbD75kGfXw17Iiwdb0w03sYHAEeS6j487Z3L41WoGqHDmIzq4WezAf5VcHW7YdkFqcEdDWDNOkPyd2N0iZhW8vXRpcAXdQD2v+20QdrfRJLd8mw1J4K1keJoKkWNT8j9xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aekr6iZz; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-63c0eb94ac3so1353992a12.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 09:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760632203; x=1761237003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6oWGb53nI6EB8t6BqTwPqkeo/AZ7STUCl8C/pS1XPU=;
        b=aekr6iZzZIqC8/pWYnaDFRoWyMC9+63hXKfOXeX/HZfii64etJd0RgxcIEur/GoT1Q
         MYEsN6C9j9fioevt0jH9/apnjzGXZDyCFyRuJJ4QsWvDckhX4t1V63NjhZ6/IzTh0Xkj
         +8nTJazR+i/a4qxsJiNNQXoJ+2SJCZaqb/LWtIT/Dfdft7zZ5eaOq7lZPP+1cwtVHnbH
         rX8XDTm8x2mJlSEBfnpvL8X2VvqvlHuGbvhjtrNhCzk4xFdYyUe3o3A/+OjhkdypFr+M
         5XmxYyqPoYzqKJVFtQLWAAcc9sf6Yt7JVvBKXHfM4cMIbuY8qaZQ+wae+tqELqyHki6d
         C1/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760632203; x=1761237003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J6oWGb53nI6EB8t6BqTwPqkeo/AZ7STUCl8C/pS1XPU=;
        b=YUldFiULMq7jjkJSbmouBa3wu/1968snOvcvgWNd4DETOGIwpbk7oG7wSDd/wgfmKt
         lEumTInHWtgC6SUpTQirIp8Ysz8rntEVIScETPXw+lD/SWX3geT5ihshEGUH2E618JCd
         PxXF/gJ9Ex3tEvsGhsjDtth9vT4nxkpCZGCsOQTkPjcEe9/S8Xsr70yIRMHG/7/vwKnp
         ihDauR5Jf9kcrQXGbVcfCrcRkBxbqz6PmgRJUFS6vw8i3bZ6TSTvdEz427uaD8xxsyie
         uguTRAr21Ui6d/4umrYAm9i1ePcS788KAsUvJ7hzAf/mkR7R7FW+9H3J1uEr06raWD5o
         axzw==
X-Gm-Message-State: AOJu0Yx8++OzX6BjEnY8wN3rZcRHmFc/tYvVAHTkjS+Q9f73icAKoC/7
	4erRawJe1MKdyu16eLkFJwoinXue8qMHi6JMjxRNoHiFXNjME7n2ldY7ah3aVw==
X-Gm-Gg: ASbGncsm2w2e+0xfTCiPI4NOK8OfngZbHIc7/V1LRw/6bZNfzb2qCsVr/7kzySLlpOS
	7JXXB2xHVUcKqUTbiWO+KYk1t7wRSR6hBYt11WzRRLnpfjzRy2y6nYsJa5ONb6PzbhBkyyciQw2
	GcZHQhrzxReHWzeXd8SGwjEhupuV90rCW92ge7YCySXpeXRnUj6Z/b/Ifc6lGUaTu+4OPbeAefE
	Y+wIbdBRlgGjiKCtQ/7DhiP6W3PwukiEI6Q4zy0qt8ZG+sfhlkZiPoqprD39bBtKQBuoMG1zS1C
	BDuG8fIxMkHHjf8Cj4it3zMx9LpEeqgKspKM97voGlkmuppDSk8oFPjba1VftE7cN3yeuf7Ejtz
	SYgYm0HXmID0idda5rmKrZZRa8HMHv+aIVwAFOdfoRGy9sv4x/PdEhtG22kTFeUQTN2XjpVFsGd
	7JxKNA1SEOzkmTt+KC
X-Google-Smtp-Source: AGHT+IG7Y2xWlt9seBZAMG+a0nPlBM7h6lZZMqUyKqzBF3tGxwIhIFovulB8Mpu1lI1FHMqkU2XxHA==
X-Received: by 2002:a05:6402:2356:b0:63a:294:b018 with SMTP id 4fb4d7f45d1cf-63c1f650138mr533185a12.14.1760632202917;
        Thu, 16 Oct 2025 09:30:02 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63a5235e674sm16314027a12.2.2025.10.16.09.30.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 16 Oct 2025 09:30:02 -0700 (PDT)
Date: Thu, 16 Oct 2025 18:29:56 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] usb: xhci: Type check xhci_dbg_trace()
Message-ID: <20251016182956.0990936d.michal.pecio@gmail.com>
In-Reply-To: <20251016182813.3d10a8a3.michal.pecio@gmail.com>
References: <20251016182813.3d10a8a3.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

xhci_dbg_trace() is a printf-like function which can be type checked
at build time. Do it to catch potential format bugs in the driver.

I found no remaining warnings on x86-64 and ARM.

Signed-off-by: Michal Pecio <michal.pecio@gmail.com>
---
 drivers/usb/host/xhci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 485ea7fc0433..8facba10fc9c 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1788,6 +1788,7 @@ static inline bool xhci_link_chain_quirk(struct xhci_hcd *xhci, enum xhci_ring_t
 /* xHCI debugging */
 char *xhci_get_slot_state(struct xhci_hcd *xhci,
 		struct xhci_container_ctx *ctx);
+__printf(3, 4)
 void xhci_dbg_trace(struct xhci_hcd *xhci, void (*trace)(struct va_format *),
 			const char *fmt, ...);
 
-- 
2.48.1

