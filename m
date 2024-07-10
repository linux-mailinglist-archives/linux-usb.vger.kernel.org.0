Return-Path: <linux-usb+bounces-12094-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2659492CBF3
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 09:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A82581F23230
	for <lists+linux-usb@lfdr.de>; Wed, 10 Jul 2024 07:31:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2165782D9A;
	Wed, 10 Jul 2024 07:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="noHTNuBh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A88482CD
	for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720596674; cv=none; b=iWQX1b3CWe8SFS9eR+ghZ87m6D6sYiFMBfnfWoIAqHjRCxDg1YjoaOl2saNPqAUasVpZdSGvk/eMHDOK9NMbKxvBbw6wlkw1QpUNbkadWHcnN9I1EPOE+7WMCWNLTAA/A2i4WVdcCHhP9hMT/W8fOJR2rmPTLYFqvWLajl3PBvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720596674; c=relaxed/simple;
	bh=Nox0WDYkPvAoxUCnliq+o9vOQ6rG1/i+jlOyvW0SQhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GYS/1Fju0XIz53AWFp6FHONDVd31MX87ZWwDCjsv8m40kMWJoiwJxuC32tBToulqNkXablWCyhZvKbOIqRx2dSTbuDnk5ygQTXmDLWmw85JaUo0GGbiYHlnFopqDBcqacK9YRyppqJbBIfX1eAovERRWGGOu8YPc60Rn6YnIQrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=noHTNuBh; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58e76294858so880457a12.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Jul 2024 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720596669; x=1721201469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zeoMyAYH/0AY49p/6wUMg/daMN8t7+U6lzuDcGnmvQs=;
        b=noHTNuBhZYscKk8js6mcaEnj7gmOiXjJ18Lb4F2Qx1nnYfMbbfCQo7y82lOn5xK4EB
         VwEZgSkKDi4a3JL7eazlvPr5mZNwylpMtIJCHWK1YrczKQa6TuwQrXJTG3DTYgQiO5K7
         ENMgHmSTIuf1TTbbnL3gz+E7kDR9XQz2qo/OrApzjUZ9cEoidYD8BHR5ZOhtRZ9KO1Yp
         E2yMMAP0vQPp9mf2TuILZ1S4h0g5/j7PCKavmiybgREsBXFhTOXmZyOSRUroKDirRUcW
         ro5itu4CCcAMDvIF29DbeJXwEIY44RPuUf6OMxoQmwQ0rs35Og9W3kaLlOBdKCkzvdxr
         dZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720596669; x=1721201469;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeoMyAYH/0AY49p/6wUMg/daMN8t7+U6lzuDcGnmvQs=;
        b=M1QEWeglNvaqzFPX1kxQFnq5P2u1egYIwI1fcodA7Q5HxIyK4IlFv/Ogp49wnh+aJo
         NZi51gLUSlUHPVhoSsOFovisEqCm2phHmCGsmSEuvEjMafmqVjlOESSwbRcox8VUfvUI
         wd4xcQdVPAaKB7VypyHPFJXsKLBMxgw7gKMU6YVhRiw8VO9Qq8GDrnjGKV8kzhealUd8
         0BPo5hfnHPMTbrICItEx1lwChMHlxA4Ewrb66Jwln+GSLdwKP7RU8wslZwiqmSCF8Ruz
         z8k06ZoBDS9c/pm0cLOfgqgo8RIENWF9xjJdWQaWhAPByml0SdQSH9gB4nItxe9G2Xzf
         foTw==
X-Forwarded-Encrypted: i=1; AJvYcCUnQkrPgRAvnUQI4Vg4NnnYDqZOeQUfHuYQViGZPma4n7roOdSMEFWnzZIqM3u9N1CqiU1yX0IY/zDba0psjFiCsS3cYdBcE7yj
X-Gm-Message-State: AOJu0YzBn+f/8ZdA8j436jdvgjRhNpbMLKsCpvmBkX+9vUU+gWx3QRCw
	X32ZmpXuUbNK4BwlDrs/BslbkyvixPGiE/McwUJ3Y9toXIqD9WoNepxZnWdcAMI=
X-Google-Smtp-Source: AGHT+IGa902OsSSWrLryMzBb4Z7dwfffKSYSGip8Pq0Sc3sPP9BE70P5Tpa4HHUD4DT0BlnE0QzRkA==
X-Received: by 2002:a17:907:76cf:b0:a72:5967:b34 with SMTP id a640c23a62f3a-a780d267c19mr335101166b.22.1720596668917;
        Wed, 10 Jul 2024 00:31:08 -0700 (PDT)
Received: from localhost (p50915eb1.dip0.t-ipconnect.de. [80.145.94.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a86f62bsm136608866b.199.2024.07.10.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 00:31:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-usb@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] usb: typec: Drop explicit initialization of struct i2c_device_id::driver_data to 0
Date: Wed, 10 Jul 2024 09:30:50 +0200
Message-ID: <20240710073050.192806-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3664; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=Nox0WDYkPvAoxUCnliq+o9vOQ6rG1/i+jlOyvW0SQhY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBmjjiqsnamzmn5YFRYQqcfNOpdF/BBUPTls9NUy atWrP1ZZCqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZo44qgAKCRCPgPtYfRL+ TgEhB/9bSs3HH4og760D8KT4qcx9cUaeTq1lr+ED5dBa3Srz6KszoCao9p41K7im4QEuSChDhQ3 JYUxrUiffdhn3MfS4pMefm0J1IGFNdoz9TyO7m2JhrMlfb2+ZYrJpCd0JXbV7dTM6Etw35qNIdN DDVRdrqcOwtDOQkCz3dw1Gl/KbgAFi0ezox0uYpbFH8+bl0YBjG2ROci8tYwMz1ohr8+rv3HgdE 1DLDGdgLE6ehl5VtUjyke40VVZaQ8N3iHJkY6eITBj0VggOa2GgeMADKjSXLlNnpmNoV2D06fP1 4j+wIg4ZsZGImMXi7mHAVfib4ZmRdNtdUNMC40tYm+MBEwoF
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

These driver don't use the driver_data member of struct i2c_device_id,
so don't explicitly initialize this member.

This prepares putting driver_data in an anonymous union which requires
either no initialization or named designators. But it's also a nice
cleanup on its own.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/usb/typec/anx7411.c               | 2 +-
 drivers/usb/typec/tcpm/fusb302.c          | 4 ++--
 drivers/usb/typec/tcpm/tcpci.c            | 2 +-
 drivers/usb/typec/tcpm/tcpci_maxim_core.c | 2 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c         | 2 +-
 drivers/usb/typec/ucsi/ucsi_stm32g0.c     | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/anx7411.c b/drivers/usb/typec/anx7411.c
index b12a07edc71b..5a5bf3532ad7 100644
--- a/drivers/usb/typec/anx7411.c
+++ b/drivers/usb/typec/anx7411.c
@@ -1566,7 +1566,7 @@ static void anx7411_i2c_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id anx7411_id[] = {
-	{"anx7411", 0},
+	{ "anx7411" },
 	{}
 };
 
diff --git a/drivers/usb/typec/tcpm/fusb302.c b/drivers/usb/typec/tcpm/fusb302.c
index ef18a448b740..e2fe479e16ad 100644
--- a/drivers/usb/typec/tcpm/fusb302.c
+++ b/drivers/usb/typec/tcpm/fusb302.c
@@ -1820,8 +1820,8 @@ static const struct of_device_id fusb302_dt_match[] __maybe_unused = {
 MODULE_DEVICE_TABLE(of, fusb302_dt_match);
 
 static const struct i2c_device_id fusb302_i2c_device_id[] = {
-	{"typec_fusb302", 0},
-	{},
+	{ "typec_fusb302" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, fusb302_i2c_device_id);
 
diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index 8a18d561b063..b862fdf3fe1d 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -947,7 +947,7 @@ static void tcpci_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id tcpci_id[] = {
-	{ "tcpci", 0 },
+	{ "tcpci" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tcpci_id);
diff --git a/drivers/usb/typec/tcpm/tcpci_maxim_core.c b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
index eec3bcec119c..760e2f92b958 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim_core.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim_core.c
@@ -538,7 +538,7 @@ static void max_tcpci_remove(struct i2c_client *client)
 }
 
 static const struct i2c_device_id max_tcpci_id[] = {
-	{ "maxtcpc", 0 },
+	{ "maxtcpc" },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, max_tcpci_id);
diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index ba4db2310a05..b3ec799fc873 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1501,7 +1501,7 @@ static const struct of_device_id ucsi_ccg_of_match_table[] = {
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
 
 static const struct i2c_device_id ucsi_ccg_device_id[] = {
-	{"ccgx-ucsi", 0},
+	{ "ccgx-ucsi" },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
diff --git a/drivers/usb/typec/ucsi/ucsi_stm32g0.c b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
index d948c3f579e1..ddbec2b78c8e 100644
--- a/drivers/usb/typec/ucsi/ucsi_stm32g0.c
+++ b/drivers/usb/typec/ucsi/ucsi_stm32g0.c
@@ -739,8 +739,8 @@ static const struct of_device_id __maybe_unused ucsi_stm32g0_typec_of_match[] =
 MODULE_DEVICE_TABLE(of, ucsi_stm32g0_typec_of_match);
 
 static const struct i2c_device_id ucsi_stm32g0_typec_i2c_devid[] = {
-	{"stm32g0-typec", 0},
-	{},
+	{ "stm32g0-typec" },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, ucsi_stm32g0_typec_i2c_devid);
 

base-commit: 82d01fe6ee52086035b201cfa1410a3b04384257
-- 
2.43.0


