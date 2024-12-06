Return-Path: <linux-usb+bounces-18196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9BE69E6F08
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 14:13:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 558F218836D7
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 13:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA490202C3F;
	Fri,  6 Dec 2024 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m4LMBlNZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839FF1FF7D9
	for <linux-usb@vger.kernel.org>; Fri,  6 Dec 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733490566; cv=none; b=ldsKh0rIcqHk13VHVczL6d7J6vDW9+XuCTogoHLMfX6L1wrrM4om/8kNyj64VcWiFERXF+hhY0oEit4pP7emHiJJYbPCwZEm7MjaXFT06n8pKl15+lZksYF/0GAC5jgHeQdybcqnO8faEW06Y9H2Afy33u7gQg5xZvnqaklOjIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733490566; c=relaxed/simple;
	bh=Hk+8FdCJyJ2RtcsWXsbcyvBWzUyxa4peO3nujhwWwz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SFTLS6wiHaWbWYWaKRGVWps4RuTqrbIXd6J3ShoM5scARxoLX0/0hj53qQ4K/QAOR9zvNa5a0N2KR40rk8Z7MMrMq9EUM2ipmoI/bKn6QKNFkGW2w8xHnu7u6orwmg47xqXTIuCYJu6uG8Kc5Xww86jlheydiIueMgXMkW4G3Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m4LMBlNZ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-434a852bb6eso20083355e9.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Dec 2024 05:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733490563; x=1734095363; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/SGgSgGbGfS4qal8H23FKyEqnU45LmUqMyclprxKRY=;
        b=m4LMBlNZ/oEep3zcGJu0K5tRl1lx77q+YjT5h53ZZcw4Wyl44rACj6eL5bFj6NSGvf
         CDd/SOkRS3ahS9FDqfEdN5pBOeGmC/L3AkAfhdopoJSqvrgwTI5mqribBO/Ls3NQinM9
         Mfyx9u+id8ldl7wfMUTEVfGvG7j2SMvuyYcOugabNgzfqgCRQLknngBI2pz7FiJRJWKe
         hIxbRbz6zHNdoTzfMz2t8vBt/4W/0m2iV9qV6OtgK1OVaMUTCSV1TjZUjnm/3eaCKbkK
         h8LW3L5cenuZWGMFNI5H7Rst0eyJ4mvzzkFKmd6k7P8MQ7kVZZYUvynOp2CR/SEGya/+
         fsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733490563; x=1734095363;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/SGgSgGbGfS4qal8H23FKyEqnU45LmUqMyclprxKRY=;
        b=TQoHWzlnn+BAfQ4xuI9onWkVzNiQt/KIJckc49iaDEqpB79qlFJ25aDRC0HERm34Fp
         vHJpJDB0PGECpsBBX6qC/OD1B/hpNHQlBJQDeNIOSJ3jXt1nybr6Zv0KMgU6CBc/5Auk
         so8IrnvnIANLLWsMCXOz/Iti9WRsZdLEtjDZk0ZRoOgN4bHyGYGPBk/o3HMz3z0cpgII
         Jwa6Hcyy4g0U67kXb7UOBQsv1ty/MAoSFWAWmy6Od/NGsU/IW3T5jDlaf9dDVdDGOkFz
         ymGYconeOKYWfGFpHhoDkhaFIpl2Ok0iu/qMFF4+Pf0IH1qIlNSgs+eRV2Gu6TJ08I6E
         hNxA==
X-Forwarded-Encrypted: i=1; AJvYcCWMlz7RhrTRMqUlxcitKWCDcyElGDwjKi/d9CzIgpUK6Xc+usYIG9BZEON9QAqGZH6hmCsc3MgL29o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyioMo+nhwcgUEZAhPsXqT/W8bsVCDLYDKVuXijOIuAlJonoSk7
	GQASaXOwtwTyrszW0WlZrQWYR4n3abomb0kwLzYOWMzIwr3BSjpOWpSHh5LSgYA=
X-Gm-Gg: ASbGncstuosGAm4YXH78D7zsE5Attj3JLOfFMenGtPueBMsk5AJETL7n7uVORPLRNUN
	tEmv9Vb4lHOpG8dBl1pqutun1hXPrGPQiH6SENEEqEJP2vzq8Tuy7eQlbQc72VFv6RXaYpJ5rRT
	k5UIzmrrvp0RJ5qIKmJQB2Yew6FmG2AkKVIBy1MOtG3tj77kpXs8YSj3998A1WEA0tbO1DxyEyN
	Qwq3rvtiGg7zPO3OKcpCUiQNWQZ6SbPgQAe9A7iPiaTnKDmD4J29ks=
X-Google-Smtp-Source: AGHT+IEe8eUou/A//oG9K2iNOUpaAPFb7T+EAvrirPkHn2z8KIBCuyQ60MWJalATbJ02kxAAUHl+dg==
X-Received: by 2002:a05:600c:3b99:b0:431:52da:9d67 with SMTP id 5b1f17b1804b1-434ddeacf25mr27975715e9.3.1733490562877;
        Fri, 06 Dec 2024 05:09:22 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0da4a1sm57254375e9.19.2024.12.06.05.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 05:09:22 -0800 (PST)
Date: Fri, 6 Dec 2024 16:09:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Badhri Jagan Sridharan <badhri@google.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: typec: tcpm/tcpci_maxim: fix error code in
 max_contaminant_read_resistance_kohm()
Message-ID: <f1bf3768-419e-40dd-989c-f7f455d6c824@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If max_contaminant_read_adc_mv() fails, then return the error code.  Don't
return zero.

Fixes: 02b332a06397 ("usb: typec: maxim_contaminant: Implement check_contaminant callback")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/typec/tcpm/maxim_contaminant.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/maxim_contaminant.c b/drivers/usb/typec/tcpm/maxim_contaminant.c
index 22163d8f9eb0..0cdda06592fd 100644
--- a/drivers/usb/typec/tcpm/maxim_contaminant.c
+++ b/drivers/usb/typec/tcpm/maxim_contaminant.c
@@ -135,7 +135,7 @@ static int max_contaminant_read_resistance_kohm(struct max_tcpci_chip *chip,
 
 		mv = max_contaminant_read_adc_mv(chip, channel, sleep_msec, raw, true);
 		if (mv < 0)
-			return ret;
+			return mv;
 
 		/* OVP enable */
 		ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, CCOVPDIS, 0);
@@ -157,7 +157,7 @@ static int max_contaminant_read_resistance_kohm(struct max_tcpci_chip *chip,
 
 	mv = max_contaminant_read_adc_mv(chip, channel, sleep_msec, raw, true);
 	if (mv < 0)
-		return ret;
+		return mv;
 	/* Disable current source */
 	ret = regmap_update_bits(regmap, TCPC_VENDOR_CC_CTRL2, SBURPCTRL, 0);
 	if (ret < 0)
-- 
2.45.2


