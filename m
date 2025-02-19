Return-Path: <linux-usb+bounces-20831-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC28A3C495
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 17:13:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E170F7A7667
	for <lists+linux-usb@lfdr.de>; Wed, 19 Feb 2025 16:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F2C21FF1C9;
	Wed, 19 Feb 2025 16:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="U7dkyGrk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062E51FDE01
	for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739981573; cv=none; b=tB0VedptLvPD/pz7HUKWQYh+DEY9aQTMM/1YI+6//ySveXjdS2UGFeQjkBkquRkL+Js+D4wHoztra3DBULuBIbWNh/5DkHrLqPsr5uKRGyH+JUhC+a7zl30n2yHMsMDuxJwZEpTd0EvfIAafz25BjEqUynmt8/K4up6Co85rA6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739981573; c=relaxed/simple;
	bh=axF2Pp59a3z4NWipdCDsQn5fYbe8VXVp+WNIBSWoobk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aeVLwm2AqfZGLY6eIe1d5NMWFpbbR5lpLXaBWn1q5/UTEaDLXVCpPjlcUPEvhJE0KyzqUabjZPIq5tCV5cvmx/4kKQos2BcgDmnzM9uT1c8uhg7aFoiLNAwN6wzgFTREIJq/2/soFH0vLGeqGafXuCj5V6CuBzo9cS9miHfl5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=U7dkyGrk; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5deb1266031so12254205a12.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Feb 2025 08:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739981570; x=1740586370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWZtx2jwJGHqxUnFIBqmFUKuSbo4cAmKHNmhP1PJ3qc=;
        b=U7dkyGrk+ttK0dBMzESf5NGFwMmAxjA8UJMS83+gUOGqgw77NA+Kcs76Tp0u8TrZx+
         MpvnW6norj9M/3wAF7r8jJPUjriTxpjBV4rL62kYzfUgGbwAwcU4peRZIjICqcbROaTT
         tlChDhdkpfh/TEg0SsYQws4ozNLCc64+onzzlyEC202M26DV1wt5eCVVnYBXGcoAzWmq
         3Pe5XbpBfwVJeElDM5C9BdJIDgEKCEAFruwVi1x3pYTd5qg1WJrmJs0rN/z1JpoB8NVC
         xndkNlTKzxz6oqeJB9G9MIzf0U0MF/diy4X3tJ06kI8NX1NWoJNR+WAWXgFCOX+6B66c
         D99Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739981570; x=1740586370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pWZtx2jwJGHqxUnFIBqmFUKuSbo4cAmKHNmhP1PJ3qc=;
        b=NsWf224uHAYHw/bKgxfpuvn2xnrftGbjOGGRiqdpCy467LCmYXOY1J21WWjWdNgXaN
         kB0oYAdBKrEKq5T8cHvBJqBgqEtXLjxnYWfef29ZNMplF1ajayAVVGccanFNf2XM87dz
         0Tgfj8YcdTglEfYhNkh1dFJkwX0pdHMHo3m3n4OzS/CVsd+Gcz7WGzwMQEvDEcHpDTAx
         oM8d8tIBwJLlJ6NHVVUfELZ65/9Za/pzUpxalDYgWiNbq/cre1WytUyT8KG/CHwO/eR/
         MauGN8CPBkcL2uVz+isQAtCm9J1RQjT2sDUTNdB5ax5eYJ+gwmJDmdmxd56HfJp+Xvm8
         5WGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyCF8NL/IlEYTSaWeQMwFhdztoR7GcoNPfLpmKE6tfN1P+rq1MwLZhv0/MsnfcUuhBCn0TqdD0Jvw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJhBmXZUnL4eOdazkbvOMDehNEPgDOFEs29gV+ItWCJ/28dXHr
	G4fWL4G9T2WKPyQEBKs6f85QCk+rCwyU/iuwfej/+AaTW4F73OjHQlA/rb3RYxI=
X-Gm-Gg: ASbGncsDXCkfNly748qMNJFETJFVxf4+InvHqHqQOZ0G989UT/xRh+yB2xgeAQ2bzkY
	xAIg8JhRhqRDIbE9NUhRTOiLnyKgvp9JfF5rtUwAwLu8Z4kO7T0blyJt+sXyEVpC9hzUGNKya3G
	7ukCnh5rQSkluBxNqg2b90djB4ovVfyVb2iQa8SWBxfVVurSxevvtj+ZZvGgxu/8ClJRwtML34X
	ZTY9fIyKt7mMwG3Yx3ds/Dqzl+hKFMrwP/VByw5wCkNPAJvMvHvjrdYqkZ41FmA9QCh2lM7Kib7
	/pCyqvewFtaXex6bl0MLo45ocKz/78iMw0QiaiPHyPUW
X-Google-Smtp-Source: AGHT+IEbhm7NcKnV5miBbyC3Mc4QXaqAGBiokThdnN9Unuo9244Ug/u1c1MM+nOw29agWhNsuqTOsA==
X-Received: by 2002:a05:6402:5111:b0:5de:4b81:d3ff with SMTP id 4fb4d7f45d1cf-5e0360bb387mr15073998a12.13.1739981570329;
        Wed, 19 Feb 2025 08:12:50 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e07f390626sm2548881a12.30.2025.02.19.08.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2025 08:12:48 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	biju.das.jz@bp.renesas.com,
	geert+renesas@glider.be,
	yoshihiro.shimoda.uh@renesas.com,
	laurent.pinchart@ideasonboard.com,
	phil.edworthy@renesas.com,
	balbi@ti.com,
	kuninori.morimoto.gx@renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	stable@vger.kernel.org
Subject: [PATCH RTF 3/3] usb: renesas_usbhs: Flush the notify_hotplug_work
Date: Wed, 19 Feb 2025 18:12:39 +0200
Message-ID: <20250219161239.1751756-4-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250219161239.1751756-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

When performing continuous unbind/bind operations on the USB drivers
available on the Renesas RZ/G2L SoC, a kernel crash with the message
"Unable to handle kernel NULL pointer dereference at virtual address"
may occur. This issue points to the usbhsc_notify_hotplug() function.

Flush the delayed work to avoid its execution when driver resources are
unavailable.

Fixes: bc57381e6347 ("usb: renesas_usbhs: use delayed_work instead of work_struct")
Cc: stable@vger.kernel.org
Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/renesas_usbhs/common.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index 6c7857b66a21..4b35ef216125 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -781,6 +781,8 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "usb remove\n");
 
+	flush_delayed_work(&priv->notify_hotplug_work);
+
 	/* power off */
 	if (!usbhs_get_dparam(priv, runtime_pwctrl))
 		usbhsc_power_ctrl(priv, 0);
-- 
2.43.0


