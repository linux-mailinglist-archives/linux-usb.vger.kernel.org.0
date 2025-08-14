Return-Path: <linux-usb+bounces-26883-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA43B26F3D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 20:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B8281B6657C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFF3C23956A;
	Thu, 14 Aug 2025 18:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JtFmhMsV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0535F23AB8B
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 18:45:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755197107; cv=none; b=sJelMZ5tzNRP409LcN2LQBLGORuvaeO44BF0iP87A+zCKKVuQtNe8NJtvz/xi3gmFnsXD4ow9WFgw2fZs3Z15TUlIqI2/REPZchoUTd/phx1lLFaY2gXFOVLz10UkLcW3tbhiAHzURFCm2dcEADlh26BUCivd67JJVfdTtsyKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755197107; c=relaxed/simple;
	bh=E3gkZiMJy3Qekd4+VwlRIk3WdC/Pz+bTehDrLOXH3ZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jFAuUdf2uDn2xnq151ae6JalapzdfnXT1LNKtghedjQbaZ2jLaqMhdEIn+v60tL4d966oT8oWeCHlF25Pflps8X1i5zaOEbDfihDqjusRzoUVgVwk9z0CIBlRBIS5rE/CcWKbE7ZTFr48ZAiyUnamrM36SCt4K2pPrKIfYBpe04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JtFmhMsV; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6188b733bbaso2423890a12.3
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 11:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1755197103; x=1755801903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GuaFAn8mD8lF/OW0DQcqSD5HNRrV4Il3w/RtqwKWzZ4=;
        b=JtFmhMsVn0wR42xfLk5wFPhpavl/Fqp1ZzbQqgJOtOx+PL9kwc33Izqekd+RyMsl4f
         +8/LK47jDfM5pJWgD6Rr7KJLekE64dmJ9HLRQ/dEPQo6NAufD1Y4tGrqnvl/UZbtK65R
         yB2e1bY/L35fVCJKH/A4Bef1N64KZusOCY3SU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755197103; x=1755801903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GuaFAn8mD8lF/OW0DQcqSD5HNRrV4Il3w/RtqwKWzZ4=;
        b=OjfBP26AC+434dCaeROTMLzv72yLO2uOYS93jHbpny3wlWf2EzDFvcRtCSMIiLPSdR
         gbGTE+HlIcm4z8kmd2bbjluAN4vi9tHpLaWMWIldL4Z7JEdPzrYN9WMxkhDqY+6evfqX
         l4Mv89ip0RRI8ZMDMOHAgrxtCun5HrJlJUAlLwycA3aTWQJ/lEtNKVOb8/KK9Ndbavb8
         CyyNAB+5PrF/vWDcBJL2b9S8NYcsAiaENrJKvRYy/q1Gm6vapac17ey3IHStnhX3k1bg
         6eqQ01LunP5mLIyL9QEKQbKu8Oq0uirAbAi04Vd7+GzVlWKn+xuIW3/vml+C3TbIcr0o
         p4Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWhxtwHwnXMpfi6C9Y2s3JUIaiMjwxoC+z6b+DTXqAE8pJVfrBv7z57kZS5My2sm6zk6g8DxAnW7vw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9hH7wycXFTNDzegvOMmjQh3AuWwSz7W4j+I2K+ZE4WkVfze/h
	XoVQHrUb8DtRXZnpwIBtf3MjBRK7j0JlidXaZdvRXmzVvX1huA6TyMQGFDAjqUiEgQ==
X-Gm-Gg: ASbGncteFkpslgnf1HJ1q2k4OwEbRN28LMFOCCz2aJO3nm0O8lVrUlFeXwFTh39Zfp/
	Oq7O/tAPg6CXRG4gf1VD7S4w8ock4UDfVaOv4XZHL6CPax//LGcXS8KJ2ANErNPqE0RJ+STQ2Mx
	HrQHJmfDPUoJKCs8t2jwobf9rH6cSUGuprcNXAExgGLJtv6S1lFP557M7dJDq1irjJCwp7ec/vg
	S7ddeNogGZOM5weC5rdm4v+QlDAt4CnHJJRno+SlKQJoxN1ByiFrYksxKeVY/86oNiTuIix8K/z
	7ePDNNjchmFEo0EDqLPCpMVyfdt5EsD/Ss0SR85wlq9OCN7yLpcnQGNm42UowEIV/g/fjkQo77G
	HJJqyrzi+CM92t7eUnaGiJDghlioM5PwPHcOMNK/hm0tJwOhDYVZihVppG9+Po2JKGH4B6JlC4M
	PYu/2uK6yum461pM5v6m686uU=
X-Google-Smtp-Source: AGHT+IEqCZJqh3teh+GhByw+v1VIC6n/AQos6jbLx57TxiI9cPnPVwtbFarEeGQNwPBfnwrymbSlRw==
X-Received: by 2002:a17:907:97d0:b0:af9:2bb9:ea36 with SMTP id a640c23a62f3a-afcb9395356mr407563366b.7.1755197103114;
        Thu, 14 Aug 2025 11:45:03 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (37.247.91.34.bc.googleusercontent.com. [34.91.247.37])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0f4sm2614772466b.106.2025.08.14.11.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 11:45:02 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v1 2/5] platform/chrome: cros_ec_typec: Set alt_mode_override flag
Date: Thu, 14 Aug 2025 18:44:52 +0000
Message-ID: <20250814184455.723170-3-akuchynski@chromium.org>
X-Mailer: git-send-email 2.51.0.rc1.163.g2494970778-goog
In-Reply-To: <20250814184455.723170-1-akuchynski@chromium.org>
References: <20250814184455.723170-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This flag specifies that the Embedded Controller (EC) must receive explicit
approval from the Application Processor (AP) before initiating Type-C
alternate modes or USB4 mode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index b712bcff6fb2..99f549263c37 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -491,6 +491,7 @@ static int cros_typec_init_ports(struct cros_typec_data *typec)
 
 		cap->driver_data = cros_port;
 		cap->ops = &cros_typec_usb_mode_ops;
+		cap->alt_mode_override = typec->ap_driven_altmode;
 
 		cros_port->port = typec_register_port(dev, cap);
 		if (IS_ERR(cros_port->port)) {
-- 
2.51.0.rc0.215.g125493bb4a-goog


