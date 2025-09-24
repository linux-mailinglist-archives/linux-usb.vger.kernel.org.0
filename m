Return-Path: <linux-usb+bounces-28591-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CCFB990B9
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 11:10:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980D42E6B52
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 09:10:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F67B2D6626;
	Wed, 24 Sep 2025 09:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="T1Zr4meC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B975C2D592F
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 09:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758705047; cv=none; b=SyRH/AcEnI674Ww6Uh+6k2H61MkTf7VpK7HQvBGQObLAfCePvWaEBPPwE1eFQSggeIih5WGfy8U+y9tmRz7SijVKx8HyPoMKWOvbKOIya6eRSH0SD0cDsy9iva0E/w2SnwMhAJtDH/eqtYw6KIy5LABb49SFRdyDvCIxs6bnyC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758705047; c=relaxed/simple;
	bh=IDbvaU3Lm/9yddinO83XZDCblAQ+mOFRlIV4M9xf/o0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWeeUNgoIlYU8uPAhtkiG68O9r/e7irjRAweSjEz9O41bTYRidGuCiiDQ3vJ48tqms22j1hEpLb7pk4TCv8ZEliiJkKnIwQZx+Z2KVWoRCPvyctr2OVgJcrG/85JJhTqyoVPBNBoRyuH7PgLv03kW51caUYoIxXi/GXHPOal8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=T1Zr4meC; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso3574325f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 02:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1758705044; x=1759309844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Aa5ZKREGG6CwQzuOzEGbODKbeGIenSkztlFKN5OSwHQ=;
        b=T1Zr4meCmUIWtXCKwUnoEMSdksvvG7+gIkAB+z7eiRcRj1FtqKCRKsPiutimrC5f9O
         XI4TOWt2W35+uzpKDNbi4PSIIX2UTLnqvlkeYgNAajUBVbSgpk4+Yr8fGNpCyE9GfRCw
         UAhFq6idmeWAPzkt1XxGHFLclyp5vRg8s74RwNVScrba7Nh3RlJV1SUG0YcysL+fryMX
         L6IxaMZHW9/m0vH2sdoEHbkoAdOq8LsP9xL9gdu5si82kwrKbDtAkm5HsEKE28+m73Ox
         E4mkBANAHVCwHlmkRMy866Tp3Rvs97hrwaIbXMQ3yK9GBCNgje2+UV4liZxwV8BnAWVi
         /pSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758705044; x=1759309844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aa5ZKREGG6CwQzuOzEGbODKbeGIenSkztlFKN5OSwHQ=;
        b=Kxtf3dDNXAgAg0hqw8eDV/HTvq8Vaab94MKFyDc/OGRnTuTDtlCtZtUEBtPCVOSfMK
         zsap2vObwBF0Pj3CE5iCeN+dtNPEs3alHCcM5pZ/9VlQomsSJd2mCk8vGIR7eeWW6wAX
         tobNRWJmGQHFPxNjB3w8MQFF35JN6eH4Lx4xk7pmBj/JhHKQBvnY3jZNaxuXgLFDsyH3
         Dsi7ybRzXnNZpl7Jmoe+drGLteARdvmTPGUcU1op3DY3pLV1rXyNqrXpa+9E1Ac8XzTj
         1Zh3VzfRQUT8Imv4ChOWYcMV5MIGM0c9QMht3cHc1Z2K4n/xrIqSflYBVO0UCYAbJ5ws
         F8ZA==
X-Forwarded-Encrypted: i=1; AJvYcCWVjMCHZZUBiRwnu+NyD20gAHJFJrunZ6LzqqyK5D1xJM9kXDevu2bS5KgPY66P+IuAREHVhplQZFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3c7s4LUSbH4mGHVi6JTd5I6JOqfTi2VU4jTrQaJFtFJrLi+5
	K8epML8N5KP4KwOENsqIm+sY2RXzqHCCIkRWcC8iHqIogf/vS4ObnVJd0+Z/AjKHyjM=
X-Gm-Gg: ASbGncsdZp+4BXHJ3fPPgfOlL9+JeTAIH8uG12vz+n3XQigQtweXc3mMfTvZdZcZ3Xz
	aWB5sGip3jjdIoUCTfFXGPJErlXuwjVVc0K0cVMRUvtHER/u8J6cDoLx/a3hPGBXH5rWjzknwOs
	kt859SYFtImBud8ALuEmlq5QRiG7P9sPZO74F8isRfLvihWdMz3bt57JiZ7urw/OGHOmlAhztOl
	oEG92wqB9QckgoitrK6vlj+48tO51xDU7EAzUcbWtEk6FvuvU81yPKff6QyjOazkn3iV+J5VaDc
	L4i0f9XZlpOOO2InukfAKiGEYztyoZ87fE8fy3YbdMDu65Pyy1BKWyAUC2VgA9szB5npKGBPIWB
	BG8dTIbDbyQSB9aB/00JwiQDWsjt2b0wH3x6pdcq+t/E0ys2TOqLO
X-Google-Smtp-Source: AGHT+IHT5ieSdEF6kMAGMnbj819PLp8ZpjWuyT4jcx1ODntvKEwJ0BGe/A+E1aTr+SU1aX987uvojw==
X-Received: by 2002:a05:6000:3101:b0:3e7:4893:f9be with SMTP id ffacd0b85a97d-405c3c3e191mr4075455f8f.12.1758705043344;
        Wed, 24 Sep 2025 02:10:43 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3ee07408258sm27435671f8f.19.2025.09.24.02.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 02:10:42 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	stern@rowland.harvard.edu
Cc: claudiu.beznea@tuxon.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH] usb: core: Drop spaces after function names
Date: Wed, 24 Sep 2025 12:10:36 +0300
Message-ID: <20250924091036.1319161-1-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop spaces after function name to comply with the coding style.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/usb/core/hcd.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
index 9dd79769cad1..24feb0de1c00 100644
--- a/drivers/usb/core/hcd.c
+++ b/drivers/usb/core/hcd.c
@@ -2696,18 +2696,18 @@ static void hcd_release(struct kref *kref)
 	kfree(hcd);
 }
 
-struct usb_hcd *usb_get_hcd (struct usb_hcd *hcd)
+struct usb_hcd *usb_get_hcd(struct usb_hcd *hcd)
 {
 	if (hcd)
-		kref_get (&hcd->kref);
+		kref_get(&hcd->kref);
 	return hcd;
 }
 EXPORT_SYMBOL_GPL(usb_get_hcd);
 
-void usb_put_hcd (struct usb_hcd *hcd)
+void usb_put_hcd(struct usb_hcd *hcd)
 {
 	if (hcd)
-		kref_put (&hcd->kref, hcd_release);
+		kref_put(&hcd->kref, hcd_release);
 }
 EXPORT_SYMBOL_GPL(usb_put_hcd);
 
-- 
2.43.0


