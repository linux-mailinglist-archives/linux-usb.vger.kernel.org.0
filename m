Return-Path: <linux-usb+bounces-37611-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MR1EoodC2o2DgUAu9opvQ
	(envelope-from <linux-usb+bounces-37611-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:09:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A68F56E612
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 16:09:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C6B83308AA36
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 13:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02D7B48A2A0;
	Mon, 18 May 2026 13:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mtEAnYxe"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23EF40C5AE
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 13:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112548; cv=none; b=R7TZxYg+9orZQthVNgRURcGIwnSmTfjVSaJAq+NucDnrIPVMAWy7zPykW6GqltuFTTILg5C7sBG/qKf0HqFbxupU/sgiy3t9XR+Mz6hQ4fvdFZN5PkoGamjC4suQmBvu43GiUNIvFEIAUkn+AY3r2lqcQUjf5krwiDaT/co9OXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112548; c=relaxed/simple;
	bh=xCDdm+hzTibPgPFU4xPsdg+XyBp5jlBC3sn9I1JVi5E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GUJQj+jZDRYoW1ENcYbhcYe5kJp/uZ9jZP/EV0drytGK7/Hl02nH2G6U4jQZfki/SgObovhihGZMAuLg/+LauyR9Lfn7+ZRN5tY0Pn8qhuD/g5bBQgBTRdJrSGaXgiwdhyAaMKCo+u6juM9xHzqFhXJoInkR9iV9LL95uVVMUOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mtEAnYxe; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b150559bso18176275e9.1
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 06:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779112544; x=1779717344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/rK+EvCFkyeWnuc5tJ2vCdGBhRuta6MvhU9BB0hPPpY=;
        b=mtEAnYxeDHzRtUHMmdbxvQHajvTscT8ePWj9mXg/Xo1WQDKl+YU9KBASce5htgmUf3
         EekvvXYVn+5Gn2W09W/w9wEyV1r/kz5mR8i7kyuuygpdAuxTshleywoOi/c2l4g0O4AU
         w0ZdzEXiOHNHv4wUWLl2lfXBJYdkoqQkRIjI7ftLSlTtc85SPTxWGw2/pPbJg9Hbt1eD
         zX5OwRT0UlVmi6T12TO8ML5UtNVb7543BpkpKAmUmCXKoo3NIDwKwc8T983r/h1uve8q
         kDxyZx5eSLhWud+2B+v6sHj3Pqpo8rS30dhYPct5cCH+EnSfnX77L/uu8qaKyJyDpENp
         JaNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112544; x=1779717344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rK+EvCFkyeWnuc5tJ2vCdGBhRuta6MvhU9BB0hPPpY=;
        b=J0kfeeyf25a0BZpD4qATKNi3k8kJPH2X28qD+nZzHmmbUvqDFj3s4Wszmysx+DJSh0
         ZpZ7iz92y9t0fGLY7WD3xCFuvGF+5NHBU4M7mtntXzAqaCd+t7lE36AHPp1z5v1qPoDN
         M7nhYJ6kH67CcaeKMuFLoGzEJqDMVC/sfbfJ+uq4UO7alg83CCji4zeQOyOXq/NuS7xr
         v2QMcrS8phSvMMCdGSdqe9ay9TKHzxv1TtAAWuv6hQuwjADZM6rV0w/k3wJMOZtypkH3
         TqENJIvBY9jUbKvM++LFzAEIGUTSU3u6vtSF/v9YtcF0mCrRIJSRNQCOjRGAok3RYG8a
         wjdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8m51OUlEjQbh8RCarjFQf6iQ5zYh7wD+yTCDjzu27GmCB+BbaJ/mbrGjwgD1UtwqNvIB0FIZvBuJc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe21bxaTVxtpFw+bFyXkW8vTK+IlNdAh8M5gB6Q2T7NP7VPqkv
	WxQqDJE+tEKLDfpDVA/xTY2JFKeRqKw5QlWH9X+Bz4fJaIjmHUA31HCBUcwNEGHqhv4=
X-Gm-Gg: Acq92OEgPzryC1kUxJDnaILMeo+NMXZnqj0NfxMHeQl8nGLHZQkPoiC3dxyi3Rk1KLs
	VnoL71xq8q0Ht1rK8KvivgtaSjCMHz6QAPmoUSGOO7NVTHvIoZPsyecGpgOzYAF1dB7QdNOrOQ7
	paPe48HphswUgH1Y805ZDRFHV4GP/4NX1iByaHbczLKEQnKTAoHbFuUGAm9qOLzxOCofMm2oQYL
	qPR5aU/kYLmk2zT7m2867SEIgURJQ/T06r0s6+Trm/9QFV4P147RFp/DMPDFuTrZOpXPC3wm/Fd
	YgbsT8gdUuDB0yxmEqQxw8ntdvOmUHfRFvi6ljto4NiZ6RoR+0hx0zFNy+kcM+INxZcgbtHUJJe
	g9nSSzGTjY6AMPrZqWSyVHqdqM6kW6Tk00RCXiaQ25TinfploUCauwPiscK1p+v9AkX9hkZfNBO
	Tc4JDKjuu1mpiV8VFhR1oce0vMSyTIDieYLFzT7fqs3E8o7Kwxjxwj8LCCgSrs6pPkiYWVI74Pq
	nysD7CSUadPrg==
X-Received: by 2002:a05:600c:8b47:b0:48f:dfe3:dae3 with SMTP id 5b1f17b1804b1-48fe63223edmr251332305e9.17.1779112544031;
        Mon, 18 May 2026 06:55:44 -0700 (PDT)
Received: from localhost (p200300f65f47db04e77777300859e43d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:e777:7730:859:e43d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48fe53804aesm243271115e9.15.2026.05.18.06.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:55:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] usb: misc: Use named initializers for struct i2c_device_id
Date: Mon, 18 May 2026 15:55:36 +0200
Message-ID: <20260518135536.781168-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3131; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=xCDdm+hzTibPgPFU4xPsdg+XyBp5jlBC3sn9I1JVi5E=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqCxpYAAfqh04rwchaxegSoOb2KXEwwQWJ6W1OA D/KLdO8HfuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCagsaWAAKCRCPgPtYfRL+ TqF/B/9Rhp2CR+neUDnVJapQesz7GowVF4IhaDMaVI7um7t2Rio3dQ+q7WKcSjtEUC14TqRAFCA Mxp2Dpc7D/2sZZ/tzR7jI2LExfLtZHbblWJfomdpj5WKVndd39p9EreDN8dKLuUnTfURzpR+gpv LX+y8cRJfh7Oxt6909okOnaGpWaWSzYN1EwGaxzDVTiokNJoYu7RIy73BiGYvGsHU0vAw7AI1Vt amOfeZTb5ChogTQiOWbkKD0hQdEqfAaf8Uw777MFk5AUacSN8H4u2KcfnD37QRKJgKSMj/voNNQ DZtUaZ2ea3FuIgd20ihLw784zzbDLmlhj5ymh7DQ2URLJ1UR
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	TAGGED_FROM(0.00)[bounces-37611-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,baylibre.com:email,baylibre.com:mid,baylibre.com:dkim]
X-Rspamd-Queue-Id: 4A68F56E612
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

While touching all these arrays, unify usage of whitespace in the list
terminator.

This patch doesn't modify the compiled arrays, only their representation
in source form benefits. The former was confirmed with x86 and arm64
builds.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
Hello,

this patch is part of a bigger quest to use named initializers for
mainly struct i2c_device_id::driver_data to be able to modify
i2c_device_id. See e.g.
https://lore.kernel.org/all/20260518111203.639603-2-u.kleine-koenig@baylibre.com/
for the details.

This patch here isn't critical for this quest, as no driver makes use of
.driver_data, so apart from the better readability this is only about
consistency with other subsystems.

Best regards
Uwe

 drivers/usb/misc/usb251xb.c | 18 +++++++++---------
 drivers/usb/misc/usb3503.c  |  2 +-
 drivers/usb/misc/usb4604.c  |  2 +-
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
index 7c0778631bea..fb0693742f01 100644
--- a/drivers/usb/misc/usb251xb.c
+++ b/drivers/usb/misc/usb251xb.c
@@ -746,15 +746,15 @@ static int usb251xb_i2c_resume(struct device *dev)
 static DEFINE_SIMPLE_DEV_PM_OPS(usb251xb_i2c_pm_ops, usb251xb_i2c_suspend, usb251xb_i2c_resume);
 
 static const struct i2c_device_id usb251xb_id[] = {
-	{ "usb2422" },
-	{ "usb2512b" },
-	{ "usb2512bi" },
-	{ "usb2513b" },
-	{ "usb2513bi" },
-	{ "usb2514b" },
-	{ "usb2514bi" },
-	{ "usb2517" },
-	{ "usb2517i" },
+	{ .name = "usb2422" },
+	{ .name = "usb2512b" },
+	{ .name = "usb2512bi" },
+	{ .name = "usb2513b" },
+	{ .name = "usb2513bi" },
+	{ .name = "usb2514b" },
+	{ .name = "usb2514bi" },
+	{ .name = "usb2517" },
+	{ .name = "usb2517i" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, usb251xb_id);
diff --git a/drivers/usb/misc/usb3503.c b/drivers/usb/misc/usb3503.c
index 322e59381b78..759770a13260 100644
--- a/drivers/usb/misc/usb3503.c
+++ b/drivers/usb/misc/usb3503.c
@@ -390,7 +390,7 @@ static SIMPLE_DEV_PM_OPS(usb3503_platform_pm_ops, usb3503_platform_suspend,
 		usb3503_platform_resume);
 
 static const struct i2c_device_id usb3503_id[] = {
-	{ USB3503_I2C_NAME },
+	{ .name = USB3503_I2C_NAME },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, usb3503_id);
diff --git a/drivers/usb/misc/usb4604.c b/drivers/usb/misc/usb4604.c
index c9a2fb3518ae..2ae9656715e0 100644
--- a/drivers/usb/misc/usb4604.c
+++ b/drivers/usb/misc/usb4604.c
@@ -135,7 +135,7 @@ static SIMPLE_DEV_PM_OPS(usb4604_i2c_pm_ops, usb4604_i2c_suspend,
 		usb4604_i2c_resume);
 
 static const struct i2c_device_id usb4604_id[] = {
-	{ "usb4604" },
+	{ .name = "usb4604" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, usb4604_id);

base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.47.3


