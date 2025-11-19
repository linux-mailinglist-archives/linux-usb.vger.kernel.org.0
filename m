Return-Path: <linux-usb+bounces-30692-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B45C6ECE7
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 14:20:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AA4E44F08EB
	for <lists+linux-usb@lfdr.de>; Wed, 19 Nov 2025 13:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50D1364022;
	Wed, 19 Nov 2025 13:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mknxd1zX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848DF3624D7
	for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 13:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763557737; cv=none; b=FHNeNiJQKTORcpKL2a0gf8jE7suS0lXeOOPT5TZIYUb3A2PMigajYz5Uq78V4My2JEEHAWYi5boMY1HQDMQWft6UP5c6VJg7/+PT2xDe1pcKhWNxnPt/m1/YTlYB4ijNE7newMQv4QdoaplN4/nxhWXW11CIEq4U1Rk+J0KHAP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763557737; c=relaxed/simple;
	bh=XTwiB6LhyFx+sieSzalDt/J192URsyR2fEdTJu9dGks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S2f4FERMJhq+TwRQx/ZkGn5to4j2BXVG9FgZuL1nQh3W5XXvOIbSotjTzyJk0DVNq1VNiagLLlsliHLUsHqxnUpKXdv/cKDTZBkHzvFgAnUHbqiG1DlZYpGYFjfjRi4IqYa8SbNUHSXTf2iZGGuOkehc7vwhz6zRDAuPSOQYf9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mknxd1zX; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b852bb31d9so7509705b3a.0
        for <linux-usb@vger.kernel.org>; Wed, 19 Nov 2025 05:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763557735; x=1764162535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di0vNTQpYDEXqMaIfB6/Wre2BioWn4TojpcyJB9CfyE=;
        b=mknxd1zXAFxOEirgngwoyDdhs8T4vpgpthgMl/c31m8+0bpS4/yF9tSxJ0lnGqbwoY
         KyKS+rUpb1W726voJI06oeaslJQ7KP7SJPTBll5SkBAYtr1P9UUVtVZaK00ppVN2fy+T
         YQp6mE7OAv41fda5i4kuD3fSTmpAFoOx6f4Q/6jEEv7hlx4X4ecDIgNq/KN+/4QeiAk+
         o8W1c93aFRHagi+eWaD5puF19RCIK5rpBHCQntfVEreyxWgv/P/gsh5LYw0ZOsXN2RO1
         PPl9XHT0a3qkIGUU08oUbOzGujD+NiY6aESieKXUtY0a+Jc5DDVAh/GfFnkg5cRFnXiu
         Z0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763557735; x=1764162535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Di0vNTQpYDEXqMaIfB6/Wre2BioWn4TojpcyJB9CfyE=;
        b=DKRuVZC513vRxEkoyuXFJaYEDWOcwMPbm0fjgN+/Z7uWlWQy+dOWekE2f8Uq69hWzS
         nS33voHyNLknYeuaWreKfxDHWBodvJbPIPq7X9ZlYq/7Ujq8+qFjmpqTcpIPKn7NdUM8
         vwaMWgGhD+Upwd+nvwCs+3ylnXZhKkgKsgjHwTlzcY36r7OZLYSWiko7mQJR5q+1rwjQ
         98B+PBghUW4dKHswzx/6L8/T5/opc/H16vdZ6eYHsM8s2iro8Y+gQu3QKd5ZNBts5iaT
         X/KTOWugmIYoBM2+g5qcIt0HV/TeVwgrCDaDkKcJKwhRc9CIl506C0Lki1YZAnGWvyHl
         uRUw==
X-Gm-Message-State: AOJu0YxiYPAu6wGVx7Ro0f1v/GSI8lgNHygXGSnPy0ovJb+cvvEl3pbn
	DW+mfVbM9X/QRq/efofF1sHkgt9Wlvl44X6XnxlrnEVvYxcM9wQ9Rf/d
X-Gm-Gg: ASbGncu6gHH2dDKqtFOn845gDDpXQt+ZPdJVJyjGsfe9vWE9Pz0tGAi6gfRcyAp7f1D
	vkGKbPebYMtaYf9BMQyqN1YLSg6fx+sklqGch07DjU9NMzTd6jZhQAEtZmgNEsh0SEmSTFPdm1R
	dhmCeRPiU3biHrBr4DDWw2ssUHTFS24R+Dra7YwtMx7GCPCAeQ7b/Fw0/97Mr5sk/VRTUH1rjjA
	P68kWnRvJZk42r+2ymNcK9fil4nZJ/uHeCoCfM3F3shPNga715svN33tpV7PJu5xppwmXX5WcJO
	rpyxHKgjnZgHsZMc+9sKzAXRJlJamlXfZgb1b7EAZTrvrGc/IW9YsEc2IDTrsTdNnPydCvZ1qFA
	bE1m184rH6kzOhQg5jARr0Jz9voKoYf4cHBkzrHAnxcFahRLjsLa/98WFbPappEea4u5TwTm8Xr
	jAh6BDgoIRzxGEwuFLDo0A2FBkVJMaSrOVCQs=
X-Google-Smtp-Source: AGHT+IEcr17WE3EmqFRtCvdpvfPm3mz73HGDRmblKdp91/ZM37RE+aj+Beu6lNdIpLSl6HfUMZVBuQ==
X-Received: by 2002:a05:6a00:22c5:b0:781:d98e:ebda with SMTP id d2e1a72fcca58-7ba3c086817mr23166067b3a.30.1763557734608;
        Wed, 19 Nov 2025 05:08:54 -0800 (PST)
Received: from clint-ThinkPad-L14-Gen-2.. ([110.226.183.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b9250cd969sm19692422b3a.23.2025.11.19.05.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 05:08:54 -0800 (PST)
From: Clint George <clintbgeorge@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	david.hunter.linux@gmail.com,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	khalid@kernel.org,
	Clint George <clintbgeorge@gmail.com>
Subject: [PATCH 1/8] usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()
Date: Wed, 19 Nov 2025 18:38:33 +0530
Message-ID: <20251119130840.14309-2-clintbgeorge@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace BUG() with WARN_ON_ONCE() in dummy_validate_stream()
when stream_id exceeds max_streams. This allows the kernel to
continue running with a warning instead of crashing.

Signed-off-by: Clint George <clintbgeorge@gmail.com>
---

Testing:
- The function dummy_validate_stream() was tested using a test module
  that i created where i sent value of urb->stream_id greater than
  max_streams. When using BUG(), the kernel-space used to crash but
  after using WARN_ON_ONCE() the kernel-space does not crash and the
  module terminates gracefully
- Ensured that the module builds properly

 drivers/usb/gadget/udc/dummy_hcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/dummy_hcd.c b/drivers/usb/gadget/udc/dummy_hcd.c
index 1cefca660..41b7b6907 100644
--- a/drivers/usb/gadget/udc/dummy_hcd.c
+++ b/drivers/usb/gadget/udc/dummy_hcd.c
@@ -1254,7 +1254,7 @@ static int dummy_validate_stream(struct dummy_hcd *dum_hcd, struct urb *urb)
 	if (urb->stream_id > max_streams) {
 		dev_err(dummy_dev(dum_hcd), "Stream id %d is out of range.\n",
 				urb->stream_id);
-		BUG();
+		WARN_ON_ONCE(1);
 		return -EINVAL;
 	}
 	return 0;
-- 
2.43.0


