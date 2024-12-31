Return-Path: <linux-usb+bounces-18918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C52FA9FF052
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 16:48:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED5D23A2CDF
	for <lists+linux-usb@lfdr.de>; Tue, 31 Dec 2024 15:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2B41A8411;
	Tue, 31 Dec 2024 15:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkyYF/wU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3419E99A;
	Tue, 31 Dec 2024 15:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735660064; cv=none; b=hYQAB9WJx4HN5WZyIDH2JeZTtMSe+cm7IfClCVzNA5HOorGTnmcasDdeFdqyQhTw5F4QyVbs47nK9u0o1cv0Y/kCuumsiKDZ4KG0/1cPEvT3KFSFeeMrz6hR8VLphifA0XANfQXTbls7uxSVT91/JV823tPDG5B0vOqWhMydvzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735660064; c=relaxed/simple;
	bh=E0h94hSIPqOd34Ao1TmITdkRH3Hv++DK7SU5sO3tn84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KCFRBaGCc3YSZbUFL3yOr1W5x/p3AxV8MfxiwLxXO2YAiCWMlowr7SDJ5CJmkXMVlCfKhxqSO6erAF0HPm1twNjFpypyPAvipP2HYR14+pKxSQdktar+gmvJ8vqVnsd04NYoLbmw0yfoeEE0N4Vi2zSXdcTJjN9FSKTy/aks48M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkyYF/wU; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53e395932c6so1671962e87.2;
        Tue, 31 Dec 2024 07:47:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735660061; x=1736264861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgEW+UHxHwZOqasvpsQ09uLLCe7cyiXu2HdIVUfHgqI=;
        b=IkyYF/wUyjzw2hQrfwQ/NjLiS0jT1dke2k4SQbq5H18MrboPHJetJfCPByG+RRWc+s
         o3n+QT7nV/KURD8U6hE4NPRgsJ+KALbtpa7U/Kp53WWxP9hs/fuyWil6dLcbv35FeBo1
         5chacGPiwe9hfhrnGRsjmZyN1kynTkgNDMWx53UX119bbD2b21ibsHZYYQMXfAqlP8jB
         79gnvkE60mCcZB775d0JpqkIDmaRK8n3vpw6GS7tGkR024UcQru745kT/2DYJ9E6UKWW
         y+/0JCqWgVHII2I1rJb7T8x6eX4VYi89rSnZhvx7eaeSY77TcCLmeJad9IpbtgGtWCMa
         80Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735660061; x=1736264861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GgEW+UHxHwZOqasvpsQ09uLLCe7cyiXu2HdIVUfHgqI=;
        b=L4hodJ0K7POqmZ3yMUgcy2bXZOWovUgfwArzN47TdKNxixr4Rgy0lBDPShrkB8wYgH
         UbrM5pYdRhenbyBZ5OYPt6wQiQRj7Cni6q6uy42R05RUGhgAoCG83rISf/lkGoOkhYQY
         uEmloGnAzDMclw/89+UabNY1KfelPpCqlcnMI4A65HP9Xj1bXdbg7T6LY+g6hWt/iwXp
         +wZVUiIVERc80+5QkTJfGTDUo+0PnO3FC1IRjEheZceeaqPqTzCH+UCcU1LOUiyhSXos
         +HKzQ5C1XluS3QifiCM+n0MplOxJj9OBex8Anuuo0028Y2+BJzIu8agKEnOJ/KO8YEyT
         f/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCXCGrPiT9r3mW/N/Sb9s7Mc7osDXyqenWBUsGKWJm4kNv//T6qwms6kBExMUluxi45C9TzhRAso/VU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+a/b+C5Vg5Lo91KIphzlHkoOjmnmkuNAWW8k+JMKzF6wSypi0
	bJHrXZUwgC+K0lpFO4qu8v78w/jqW33g1/+dSxzxCMM7f1iquigQ
X-Gm-Gg: ASbGncv+bZHV1XRVhICdrWdR2Aco3nfNktoy18jQZTZIXUxg0fsJxU2jQzieLZ1e3HO
	87VmNAGYRGewslTBVAE0W5fsn9z4bj8nwFMg9+7pJn+B28LmUCYePNBoiaggDM8yeI0NyIeVbBr
	n78IdOFOJobYnm/hcxu0w/kCDhvxEvKX51YWH61mxdyDzTR4waO9o3MFKabCluWZ23gY6Jiufnc
	KmctjUV90NDHVH1sftWOwgfrJWc9Ltr4/2mBTVzv4lJDsGKN1ViR3SFj1NzBj+bpmSDa+or5MtH
	muZ3gisBRvSE46UDeBth08VjjEU=
X-Google-Smtp-Source: AGHT+IFpfM/9nUaXOZszjFmWamDhsTwLkqGAobeDjB1u64LciM9NxCt8rh10kZPPRFKxhSgt0M92ZA==
X-Received: by 2002:a05:6512:1042:b0:542:1137:6124 with SMTP id 2adb3069b0e04-5422952e2acmr5022832e87.5.1735660060907;
        Tue, 31 Dec 2024 07:47:40 -0800 (PST)
Received: from laptok.lan (89-64-31-140.dynamic.chello.pl. [89.64.31.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-542235ffe48sm3448869e87.73.2024.12.31.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Dec 2024 07:47:40 -0800 (PST)
From: =?UTF-8?q?Tomasz=20Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>
To: jikos@kernel.org,
	bentiss@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	oleg@makarenk.ooo,
	paul@spacefreak18.xyz,
	f.kardame@manjaro.org,
	jules.noirant@orange.fr
Subject: [PATCH 03/10] HID: pidff: Clamp PERIODIC effect period to device's logical range
Date: Tue, 31 Dec 2024 16:47:24 +0100
Message-ID: <20241231154731.1719919-4-tomasz.pakula.oficjalny@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
References: <20241231154731.1719919-1-tomasz.pakula.oficjalny@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This ensures the effect can actually be played on the connected force
feedback device. Adds clamping functions used instead of rescaling, as we
don't want to change the characteristics of the periodic effects.

Fixes edge cases found on Moza Racing and some other hardware where
the effects would not play if the period is outside the defined
logical range.

Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
---
 drivers/hid/usbhid/hid-pidff.c | 36 +++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/hid/usbhid/hid-pidff.c b/drivers/hid/usbhid/hid-pidff.c
index e78fd68edda3..76e934649ee8 100644
--- a/drivers/hid/usbhid/hid-pidff.c
+++ b/drivers/hid/usbhid/hid-pidff.c
@@ -205,6 +205,36 @@ static int pidff_rescale_signed(int i, struct hid_field *field)
 	    field->logical_minimum / -0x8000;
 }
 
+/*
+ * Clamp minimum value for the given field
+ */
+static int pidff_clamp_min(int i, struct hid_field *field)
+{
+	int ret =  i < field->logical_minimum ? field->logical_minimum : i;
+	pr_debug("clamped min value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp maximum value for the given field
+ */
+static int pidff_clamp_max(int i, struct hid_field *field)
+{
+	int ret = i > field->logical_maximum ? field->logical_maximum : i;
+	pr_debug("clamped max value from %d to %d\n", i, ret);
+	return ret;
+}
+
+/*
+ * Clamp value for the given field
+ */
+static int pidff_clamp(int i, struct hid_field *field)
+{
+	i = pidff_clamp_min(i, field);
+	i = pidff_clamp_max(i, field);
+	return i;
+}
+
 static void pidff_set(struct pidff_usage *usage, u16 value)
 {
 	usage->value[0] = pidff_rescale(value, 0xffff, usage->field);
@@ -357,7 +387,11 @@ static void pidff_set_periodic_report(struct pidff_device *pidff,
 	pidff_set_signed(&pidff->set_periodic[PID_OFFSET],
 			 effect->u.periodic.offset);
 	pidff_set(&pidff->set_periodic[PID_PHASE], effect->u.periodic.phase);
-	pidff->set_periodic[PID_PERIOD].value[0] = effect->u.periodic.period;
+
+	// Clamp period to ensure the device can play the effect
+	pidff->set_periodic[PID_PERIOD].value[0] =
+		pidff_clamp(effect->u.periodic.period,
+			pidff->set_periodic[PID_PERIOD].field);
 
 	hid_hw_request(pidff->hid, pidff->reports[PID_SET_PERIODIC],
 			HID_REQ_SET_REPORT);
-- 
2.47.1


