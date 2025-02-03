Return-Path: <linux-usb+bounces-19968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EBA25246
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 07:16:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6FC9A162B52
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 06:16:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D75B61D86C3;
	Mon,  3 Feb 2025 06:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="rN9kJrvs";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="jC/enKkJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C883AD5A
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 06:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738563373; cv=none; b=MGhya5zjY9PbOJnB4svYNl2gU/p5N0MzUyz6f0nnF6BeN1Aah7pC/qiwOHMQqzWgrGJc2Z1PWfCrXpwuHZn1gfLSvdMuk3/L/+DHVRyyskYGFxkmsvcD1u+sl/a4d7bEL9vfavvS7VsVHaQwASHTb8cFQ56XdvlMuVYrEum5I9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738563373; c=relaxed/simple;
	bh=Hbp7zWspzCKuXVFl7HNIOCJxjMDVtE0jggLbem+g76I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u09z1XPY9PymPL+imKMcfvKf/PpwFViIefWYVYmDbw/jUzP6UGLB17IYHrxpPApAOWEe/O5owMQbu1YG+EhxkcO3frFxrNZSuveneIuvoFenAxzsLT8jD1jazzk9pDiSGqnU77QcfILFRcwqYJwyGIy7pw6ZAcjphDkzy8g8VEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=rN9kJrvs; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=jC/enKkJ; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738562894;
	bh=Hbp7zWspzCKuXVFl7HNIOCJxjMDVtE0jggLbem+g76I=;
	h=From:Date:Subject:To:Cc:From;
	b=rN9kJrvsjzyvuqmii49K4Kxylc5U0EvdeykVsjybXIxr3wUpW9f/tB0gJjDWh+7hH
	 iY8423dEYFJAKeAjdsQE3aC6Pn8Vjn8WGkMPGD6BUvEDuLwTCMVKmpwonYrsILdLk1
	 UWAPFKLSlhNcC3slBsczc4uoD6BOzPDDcvnBM1MYO1v2LrahewPJm5zF+vzvjq8B57
	 viogy+Un0qDWtPleSQYyoinxen308DB9lYim7/B88XS60JM7IzH1UPYsxtOJMASuXq
	 qfBcbzKLOasBWrz7BdNSS4FMLpZkTgrWLyfjT7LqtIJJU9jVZMYhDFbwFwvJim7ow8
	 mRTWng7NCY/xQ==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 36A8D35D
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:08:14 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=jC/enKkJ;
	dkim-atps=neutral
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 93389370
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 15:08:13 +0900 (JST)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2163a2a1ec2so143959655ad.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Feb 2025 22:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738562892; x=1739167692; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BPjlXqDXJYS9S67PicXD9qYY3rsZ4ZHn2gobV70W1h0=;
        b=jC/enKkJw6bvRw+EYbB+hAWtywRwIEWNzkIbTHwADIk2Ybj4C/BTbkDHuk/FiMyoGx
         PYYx9eOeW5HljLMm0rILNW1+38Xcug+bCH1/+6J7FqV7ueSVr1vt8g7NKyLBb68UtSTc
         Y2f93NcG2/HAleCzwWejRf/fBgI0dy9VZOpWab7x9TAXBzUfG3AqhZIa8JB3HMjBZbjr
         b7WmqpPkrizearIaeV26jzWia5lUOFLJyKDypfz3tN5v0dIJLwDig4Q4oaPT+sCbWQqO
         IER6MH5e5x9GrT3LwksZFggXFkbaVHlBO3s7uKxQUo6roT98dfZejJNj50fugsGMx6Ne
         RR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738562892; x=1739167692;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BPjlXqDXJYS9S67PicXD9qYY3rsZ4ZHn2gobV70W1h0=;
        b=ayTmwH3Z6U6eej51ECbwZxpNqr3vyVWtfFE4YEoBbgRn5itHRbwzBkcMd7+hUBQnBS
         Txe5+eYcJaed741WTqLceAzWFuPqkwsPZG+ZnQPyiAnESe3oL1UJ7CutrUc8NMD7S9g4
         Hlf0DuirnQ1XtAGkqBTpCVA/8h068cpNxq2XhY8wc7ppkm5XzLpKZekj7g3dIxWnolWN
         M+Sw2tfDDIOnNrX0o98mc2YL5Ho5GJ9ZD0iQjYhbgSi+PWw//UR/DZLKXrAsRfu4XVSa
         1ZmVPGlq7Acgl4D0+w95vlHdjrZUf509oJCpwWstFbdyhIC3W3Xa8Z80T9ErFFb1NSqJ
         nrWg==
X-Gm-Message-State: AOJu0YyRsLD7+/OLdjEAt9m7Orx/nJEm1o2OUs/qZSgCFMer4jId047C
	XCYPsfHSYgliFQvY2kSb8PUywXcJ7kjy3BV03JjwLD+HisRQ6BdeNbT2+fyV6Zd36ZL3a5JQl+Y
	npLPMq5pzeUPGfrTGhkCUA/DOkzzO2VlA5yLSCJjH6An0yo5NneHgDha5K4Y=
X-Gm-Gg: ASbGnctO9FrtV+6wvQeBub5hwmjvxx7LNEURRKm3OQ6KtRZQpCys/d4dWUgr/oTkPb5
	u2anWo3oRcrcDwmZwTcsQQHEMrTi02qV2/MGiyVaKW2zCrv04QRsmT2RJCq7Js8zOn02TnlidEC
	vl6J7uWnZdAYQGUmFJF3fxxo7Nx7OkUm6IwQY33T/Py/G7buRKnk7GYmXQi7VYNUW2GZlBeJ2Ra
	eHTxceugl0d0tclYcohRGGknNvNoYE/xF8PUCFrOOLOaictUoySBde72LbBRGxbBr9yv7foUdf2
	4R2u++gQbe06tF/PdsdJvtLqoDrvmK2IC0pIsjTFo2KZYw4syWEbUxZcrM8V7pnw
X-Received: by 2002:a17:902:d48b:b0:215:385e:921c with SMTP id d9443c01a7336-21dd7e39d0emr303715965ad.51.1738562892619;
        Sun, 02 Feb 2025 22:08:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+cPnrgkleSm2QJ1Sq9fDzZ07THWFl6Q867OpAQ96/sH7m45eEsTed+5MmfPxFcIW11kQeiQ==
X-Received: by 2002:a17:902:d48b:b0:215:385e:921c with SMTP id d9443c01a7336-21dd7e39d0emr303715775ad.51.1738562892362;
        Sun, 02 Feb 2025 22:08:12 -0800 (PST)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ecad9sm68004605ad.157.2025.02.02.22.08.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:08:11 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:08:08 +0900
Subject: [PATCH] usb: usb251xb: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb1-v1-1-f6bba254215d@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAEddoGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3ZTUtNSi+NLiJENdI1MTA3ODFEOL5GRLJaCGgqLUtMwKsGHRsbW
 1APBPlLZcAAAA
X-Change-ID: 20250203-defer_usb1-254070d18cc9
To: Richard Leitner <richard.leitner@linux.dev>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1027;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=Hbp7zWspzCKuXVFl7HNIOCJxjMDVtE0jggLbem+g76I=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoF1JKapt3VwTIEkuJSNxQ3fPo0exlV2DocZJd
 0hMxwZ35MyJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BdSQAKCRDyimB/1oxx
 B7z/EACkTE80fFyeSSrkflh58Bt0JuZOQv8YmJ/YdL5A0799C2sbRoH2hNV7W2rBbhFIrVO/cIq
 qXZilkdOgUYTHHpvd79QYGtW7mAbQqD8WovTeCT9IyDoWW/yB+zalRf2JjsLdWtNYkPFvBF7BRq
 u0s7jpWGhDxLJ1xJy3BGjTawb3i+VNbMLm71ikNN/SQNneXKwFM+fwHh/FRj6AV+D/P7HYIB87I
 K6hCS+sVtpSOaX09/QYN4+EQxct6R8Ly7peE+oqyelExX/MQVYg/emyXjvLGPDn9mnNkSPk5bXo
 c7KJOKOwxuiEylbDWLXPHRBm2cXFB1PvitRsHap3sRwQNVpYnrKheYr7S7JGi7PivVy3qjOTH6p
 Ll6lYQ7K7d7z87IAI5v9udqYH2fPO+0pmeHQ4xD2uCrFxLBKZtGduVy/TN7mzQNSicLVMHgxL76
 KPHxnZ0YIkHItTm1+Oxurd+v2RL/gMZS517K3UJAcpPWdlA9KGqKGouFk5saoPGZofCFed6gg1X
 kWMeD6J1zUPDTW/TPiRPQQi+ktvcUbZAUcKNyvg7c1bvyAyx3vSdchX8/pgPuhACnh+oHcD7MqE
 T4+YMveTOO2uwEVy1K+vRcGWVsC9IBfIsTnRQ49gmmvP5e2LNgzwCsMbuvrlbYiEtJZrWTF2LVV
 ZWXUylVaPlEZzAw==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot:
[    0.757677] usb251xb 1-002c: failed to get ofdata: -517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/usb/misc/usb251xb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index e24cdb667307802b9eee856e20744ebf694395e8..ed7c99621fc9af57c988b2298a576248b329ba3d 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -637,8 +637,7 @@ static int usb251xb_probe(struct usb251xb *hub)
 	if (np && usb_data) {
 		err = usb251xb_get_ofdata(hub, usb_data);
 		if (err) {
-			dev_err(dev, "failed to get ofdata: %d\n", err);
-			return err;
+			return dev_err_probe(dev, err, "failed to get ofdata: %d\n", err);
 		}
 	}
 

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb1-254070d18cc9

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>



