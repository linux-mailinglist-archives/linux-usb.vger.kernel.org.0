Return-Path: <linux-usb+bounces-25461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7DAF8517
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 03:15:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E9674E555B
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 01:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D00B72628;
	Fri,  4 Jul 2025 01:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="UdYjbfnu"
X-Original-To: linux-usb@vger.kernel.org
Received: from sonic308-21.consmr.mail.sg3.yahoo.com (sonic308-21.consmr.mail.sg3.yahoo.com [106.10.241.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4029425776
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.241.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751591714; cv=none; b=mGlltLQq5lniKkaQ7AmWzRF9tUVXJJY/5ZMXRHpTJaitm4DK5UNeu5am8V9HH+lv4p7FyanvYxnFehlRHgLGX+MEMkrNXZw/wdoGHgz86P8Qyccgti5zEncCVVND3t4xN0w4AnwcY+l6k0CVN6OWIt1p50ZFccEpi/wpjJPETW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751591714; c=relaxed/simple;
	bh=yzGghOxhB0583+8ozZ+VDnbXqzZsTaGkG9HUdPHP+d4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=cN240KIRbLs8QpxD6YO9ASxbGPO13jFTfhjbJmP1aph3xZ8jRyT0hW9cfcW5AJh2IuWmjFPRBgoDfe3rvgvrjfsUeqWztgtn7DzkS1sFEpwssZdZH9treOWAcN8LY512aTOr4wlRS8v/6gkOQYPOw9cSPqSA6t+Jn+59wG21swc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=UdYjbfnu; arc=none smtp.client-ip=106.10.241.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751591709; bh=5EaQn1mqLXzxd0VU6TV21eh6I2qsxXBZOTsHhJbSFzI=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=UdYjbfnuUBmzzI+N+vNgA4hBlBgu4fC7cQ6VgGK3V2CUi0xHA1QlFeiGoED10twtnjDD8cySTOYnlZ4a8b84F6H4SbpymDW3awceV41Vfn7dwpJrOm4fgE5J7e/lLH91pHE73RkuKBw3eOpRnRS4/BQm0K4hGp2WxALJdTiIS2+XL8DFP/EOmVgh4U304iyZxEhCkVCg2MYrFuHbPSw1/5qApjjVCqAlS3NfvUXvpFrSmSa5Qw4AXoc5Mg1mFLHOyjcQZRY1USncH1rrwamxfAOTaWLokhbVbYxI6oqU2sawd5Kc0xD3JqCQo7nhzERoUK5PgZyYRSwsoQry5sd7Og==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751591709; bh=3fh2w8P+dhc9yMBHoKjbJCScJr8b1ywTRbeeHtJJwJe=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=IRWM7NQtjUJEgb9hg/0bBUJyDbNfgbQAKoySjRXHKcqtXoOoYt96TWPio1oczRLtZ4h5BnltlcB/P/CYDNntcMGCONZk8N3bFUzdKEsd0Sw7znpx6+7a3BIc1ScqKtrEuPFTpwqN2lycWlaMYgI16m0jl1o+TEHomW7TZzkkSikD18fGbLo37uE6oo6QCsThT7YnRDiJ4opYK24btGaMFP6KtLYRXv36DnsjxXHAvJ9HjJvNhIgnzNWmlAIh+Jze4o6tBcRMOnWQO6ar5cy+W7gRbHu5YYQmZXbE5fEgGfmKn2CctJs9LJMrsMn/bDh71BfN0tdIKGChfWdaeJvGjQ==
X-YMail-OSG: JRecbucVM1kO_WsrXFfN02qfoglyrWxeEBrrRObAYf4PUpB10MbvoLHHS9aom6c
 dxc4Zd8Nxqaj9Rmx422P0vtv4EIwTRD6VZ8zCM76zFQNzybV.uVvYo6JyKzxPGFNMI6J2_bhXdOo
 lShhwG8VVan8m8jhdglVoxMeUMhYCKJkQR5xRZRJNQnkYbzpRnY5NLJkmfgDCPhgf82XcVePLZHZ
 pzRoMKul4q0yb8XV0TM7pXqoJzAAd7zpAAvb09jojMCP1K544hR0CMsJo7JvaKVOpPPPLEQZCFk_
 bIyqC4c4hRGPJ_crK2dW2FHbRiS487VZbzAGmdqUUHerk_THK2wCvwhaQCSjKfEcjmfWjoGT.yRr
 2entM1Z2ANceA41p0EoHyYMn31GGahexToLdWrjfgK8FcSaSM14h4HLC2xGLxLxEP9zqGsuFxI8c
 9rHPp3WN.CFLdlTktIosW_qz7WbuHcyt3_Ab2xjwKIEW4oYT15a3CxEYnn4ffh_8oFI3IZksdWMG
 Qo70xHfat8HjkvjCMXTVCx8.2RRM.QrJRgGX7zfEY8lykInk09GUiEKtIK1vb5likHwINcG3vPSa
 pie_sNeb3zpkIYC4JeZyfNKImigCeC4S.EO2FHlDAycs0fcQSg8S0MDu4kvZxYz2iNIkGtHEnD83
 XTJkx.hT8pXiWYDdSnYkkFHGY9wLCQbP5tnDCyD_Swdb9TcXp9ApjpBeQp9Byr2QNGd..GFisrd8
 GuVhxwg1ZvNsZqodijUjPbEXqluMmE9PxRAkaqsBHo7j1PmSfrfjOGjlxSOGDN7.W5fRNgmIemKS
 7OWxlykR9hM3Y6JxjbE34OxJrzWh_HEPurA2Yk1Evjk5UZgF4PK_e8Ow2SOFVV4xc4kHAeBsBJ2t
 X7lGXoUdnLdsWb0sprsnYJTcBk1UMH3Z8OIt.dCt7zayovi0L34c.M8bi_uXV8hCJHpWULdlL.__
 VzZXzkImZI__JxQmhUEd9JF0uohcysyAime5WivV7KMZLqHi2h58NHvmXKw35KhBagAFT1Vxv9JB
 AMp9EcSoViHTupz286dctepLRBG90BlL6w0tKhCVthhQEHAb6aTirhT_fDP42wQ_ApMdlvIi5JUS
 QUk6KRUVFPprS5MK6Yyj5APh.cWDt8YEJPZJiuZX7Rhe60ptKpvIwp3O88zxuq2PVocevVa96euO
 4ucFudrRws.bkzrbLhRDO05Hcf717jVbxhCjWjihAe2JLT6Tjkf6J4E3EnhOHq7y_i.LboiR1AaH
 RLSTQBeFKrjpioBoYW.cECw7YVARawkHS8UTwZjrCJsJqf3xyqoe09U8XWJncbUuHX9MxnJ.CrNJ
 lKKIXmjxGtUVm6496xikzSlK5X5sp06B8lQ0QdLR051bOudsy8sY6ZY1o5Gkfd7e0WaaYw63xtp7
 UspLAqkvDn_4KAt0qMvPb7sH8zoX1HnJ37TrcLC2y0uGViFITrwJwn.jwts9YnNr42FBA198KCpk
 mf1sMctl0iXu7tp6Ne.GwyiMFPvi.NcdObivmh7TvXfEeXtydg4w.ZHg2ZlYPK2TYJXUgBizAFZc
 N4x2uQq1t7kneEEG2xclLSTC5HniiYIyjyTsuFmbO2wqIBDMNrVcabpoSCd2ESnd7MpbGWSQiZn9
 ntUeWExwqrk.sWk1Mb.qPLIsfFhhCXS9ArOiwCBuSlTje9KlxoGmTMBjqXwXbRS3IeY5QXt5qIuq
 _dG1PZMm.ZyTQaJNSEw.l9kE2_6ON2_Vc3rmiT8BiuHf.66pLuJT9f1bn2bX2Po6fGXpmmU2CWq4
 oe5MMvf2h3hzJr_Q7rQCgoBIkFMfWvKG36zmE9Hbdz.VJYHpjmlkzg8aIMHY4vs9CSvuvR_qGCuC
 Mz3jwYB0fQrYbN2MDDk.MxVBwYBuMZZoax6t6AwwaUlnWyRDUf2KoHn0qrb6LghAT4bzvxC7NcFN
 fxyoqVJf8fi3.FH2dY.C7nrg5LcB.uTKnKE6BLE6a3ZkBYhXZ.k15kR6N9tV26W6xwkjJAd4.NZr
 X.A7N.hG2YMc9Ocl0GIw13PNQWLaBoHp4LfXOMVDR3Ajjmw5WWM1_aVqcA2nFIDBfiuzM.H_bfuh
 MV_cmMu9EC.ZXgDYPTWVulaU1ZPtq3maf7pO_mrQheugMr7u7orrzsntgP1rVoLQBbgs5wNNii5u
 gRJsnudyEjnVB4EJFUdPXtrwRMlQWmh1sGn9KwU0WpkGyu4qlQt9U8zPI3kqXu.hOBy79.x8IBEE
 uMhofZ.eK3w3_jufckRCKgxE8Qem42zcr28K7qw0QLfoXOz_E6A3etQdvL63RAQ3u7OAslWoTDJk
 c3yDTdH8-
X-Sonic-MF: <sumanth.gavini@yahoo.com>
X-Sonic-ID: e9662cc1-4981-4682-9f44-5f578b568ef2
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.sg3.yahoo.com with HTTP; Fri, 4 Jul 2025 01:15:09 +0000
Received: by hermes--production-ne1-9495dc4d7-jrxzs (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID a2c63466e6f86b622e08ed8c074f7ec5;
          Fri, 04 Jul 2025 00:34:32 +0000 (UTC)
From: Sumanth Gavini <sumanth.gavini@yahoo.com>
To: gregkh@linuxfoundation.org,
	jkeeping@inmusicbrands.com,
	kgroeneveld@lenbrook.com,
	Chris.Wulff@biamp.com,
	quic_prashk@quicinc.com,
	linux-kernel@vger.kernel.org
Cc: Sumanth Gavini <sumanth.gavini@yahoo.com>,
	linux-usb@vger.kernel.org
Subject: [PATCH] usb: gadget: f_uac2: replace scnprintf() with sysfs_emit()
Date: Thu,  3 Jul 2025 19:34:22 -0500
Message-ID: <20250704003425.467299-1-sumanth.gavini@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250704003425.467299-1-sumanth.gavini.ref@yahoo.com>

Documentation/filesystems/sysfs.rst mentions that show() should only
use sysfs_emit() or sysfs_emit_at() when formating the value to be
returned to user space. So replace scnprintf() with sysfs_emit().

Signed-off-by: Sumanth Gavini <sumanth.gavini@yahoo.com>
---
 drivers/usb/gadget/function/f_uac2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/function/f_uac2.c
index 9b324821c93b..dd252ff2fb4e 100644
--- a/drivers/usb/gadget/function/f_uac2.c
+++ b/drivers/usb/gadget/function/f_uac2.c
@@ -2052,7 +2052,7 @@ static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
 	int result;							\
 									\
 	mutex_lock(&opts->lock);					\
-	result = scnprintf(page, sizeof(opts->name), "%s", opts->name);	\
+	result = sysfs_emit(page, "%s", opts->name);	                \
 	mutex_unlock(&opts->lock);					\
 									\
 	return result;							\
-- 
2.43.0


