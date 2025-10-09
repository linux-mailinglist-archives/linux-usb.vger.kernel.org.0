Return-Path: <linux-usb+bounces-29062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24186BC70A0
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 03:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D8B03C25E3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 01:03:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03E7189F3B;
	Thu,  9 Oct 2025 01:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="23iLFegt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CCE142E83
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 01:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759971803; cv=none; b=KbTVAClK+nP6l9IQi0zOpFclaa4jKhID5QnOUur/J6NM7fAuBqy2CTH2YtaQ5oweGfBdj7tlEFf43E8iriz/z6YGJ6qq41aAQ6a5FBC2evhCdz4F0QkoLwLbJFi9JkALJflkprUVEYdwxhJd0SEUQfFolW/aEcw89SKhVQ30Ncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759971803; c=relaxed/simple;
	bh=tSONzkd/O/+rs+POwDj3o16Z3uPD6VSUJul2FCsIGzM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sahuib5VsJbB9XU+iju8MmY/SQ/Jo3vbqMg8ClkkK73zsRueW5z8k6H/RuS3OL6HTTxuLSOUYtDRC/SjL29nlbUvrzArc2rDJ1Ia26ackGoOznVeFzgsRvbzofdY64FkRPHVHF8fmg1sUtrAKaIKtU2p+v9xPipRd23czyhuERQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=23iLFegt; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3307af9b55eso746515a91.2
        for <linux-usb@vger.kernel.org>; Wed, 08 Oct 2025 18:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759971801; x=1760576601; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=g/4YIFu4sS9h/R2pTNo5KqxfeVEIXuxRpdzIrSZfq5Y=;
        b=23iLFegtmjncrs/yt3YWctcS4S6Fxu2d3wNSec/GEUgIKs2nNclPm/93Noi5a4cNNG
         BwNI4E0uqbE2Y6PflMFVZFrxzx0IIeh2n3eIZ9cPK7CTCaCVaoBA9imisaJN+sNkhQzj
         dkr2C0pSOTyGBmJrS5ZBcFWjRc9ZgoHP23znpM9lVIpFhWUYKu7ePrjL/CsioA6v0KsU
         8TsjavBec8yivNWlBh+VvH6HIfKxpHnwizo/iqVLdqXo1SCxrvla8Cb4YyIDpWs1e+Go
         UVZS43X0qFr74MRcudWmZUePCe5okhcGit0FDGhZlPO9bGigfFnZTVQ7JWu5EB22KdJ+
         XNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759971801; x=1760576601;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/4YIFu4sS9h/R2pTNo5KqxfeVEIXuxRpdzIrSZfq5Y=;
        b=VejiMkc9cl71UY7KWQCJYpIS1yapaKA/HKhF0aKjU1dc82wygKn92K2+/n/EYG2Gr9
         nFH7XvpvvgTBMjaghediF7itLWPy1X5tnCUNNHD9jUoIxuMVzJL7UpcDvu5Fs59ZpPib
         2auOA0j0FbFVAuwDqyDPK3ap+XzsRu/Y1uU/m5V7+ijcHJ68veGXSxIoqTfnnIIghbOr
         pK1rl0gcUSSf+iYN7zrZ5oGDWLgWH0IYwB0VAeLCF9sgl0Yl+W6ILbgEouv7jdmSEsaI
         SKCYTVeaWuZummOtV3cAdOP8FNjXP4HYFvmGIl7+2/8hO05rOVrVNMOB27psN1rqLPbQ
         2AVw==
X-Forwarded-Encrypted: i=1; AJvYcCX5iON4EStC2MSNzHb2mTddVV9iHt5edlW9yhCpIx3LuJnBj2iv4Xsy8D4rqNsCheu+6WDV6+GiH48=@vger.kernel.org
X-Gm-Message-State: AOJu0YytQBh9NG76hfisgZHR5lBBzfyad487Uf+pnPbhTlB3e40jsLVR
	fecllnVT02M0vaqhejpzJRELCADSKgYCPmyZG1T/htMrxM1B8d6vz1c975HSkvTwYleozChk5aV
	XdvRlDQ==
X-Google-Smtp-Source: AGHT+IHp9lhngu8Gcn0L1T1mTc3AnO+MfrO5+f6Ss5kpMxPs3s4Tw2S+ucM0AiCl634GfbIg65sr8/46cQg=
X-Received: from pjbbt21.prod.google.com ([2002:a17:90a:f015:b0:32e:a3c3:df27])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1e0a:b0:334:cb89:bde6
 with SMTP id 98e67ed59e1d1-33b51105dcemr6509867a91.4.1759971800738; Wed, 08
 Oct 2025 18:03:20 -0700 (PDT)
Date: Thu,  9 Oct 2025 01:03:07 +0000
In-Reply-To: <20251009010312.2203812-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251009010312.2203812-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.710.ga91ca5db03-goog
Message-ID: <20251009010312.2203812-3-jthies@google.com>
Subject: [PATCH v3 2/3] usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions
From: Jameson Thies <jthies@google.com>
To: akuchynski@chromium.org, abhishekpandit@chromium.org, krzk+dt@kernel.org, 
	robh@kernel.org, bleung@chromium.org, heikki.krogerus@linux.intel.com, 
	ukaszb@chromium.org, tzungbi@kernel.org
Cc: devicetree@vger.kernel.org, chrome-platform@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jameson Thies <jthies@google.com>
Content-Type: text/plain; charset="UTF-8"

Add support for cros_ec_ucsi to load based on "google,cros-ec-ucsi"
compatible devices and "GOOG0021" ACPI nodes.

Signed-off-by: Jameson Thies <jthies@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/cros_ec_ucsi.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/cros_ec_ucsi.c b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
index eed2a7d0ebc6..62b80ad85a68 100644
--- a/drivers/usb/typec/ucsi/cros_ec_ucsi.c
+++ b/drivers/usb/typec/ucsi/cros_ec_ucsi.c
@@ -5,11 +5,13 @@
  * Copyright 2024 Google LLC.
  */
 
+#include <linux/acpi.h>
 #include <linux/container_of.h>
 #include <linux/dev_printk.h>
 #include <linux/jiffies.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_data/cros_ec_commands.h>
 #include <linux/platform_data/cros_usbpd_notify.h>
 #include <linux/platform_data/cros_ec_proto.h>
@@ -235,7 +237,6 @@ static void cros_ucsi_destroy(struct cros_ucsi_data *udata)
 static int cros_ucsi_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct cros_ec_dev *ec_data = dev_get_drvdata(dev->parent);
 	struct cros_ucsi_data *udata;
 	int ret;
 
@@ -244,8 +245,11 @@ static int cros_ucsi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	udata->dev = dev;
+	if (is_acpi_device_node(dev->fwnode) || is_of_node(dev->fwnode))
+		udata->ec = dev_get_drvdata(dev->parent);
+	else
+		udata->ec = ((struct cros_ec_dev *)dev_get_drvdata(dev->parent))->ec_dev;
 
-	udata->ec = ec_data->ec_dev;
 	if (!udata->ec)
 		return dev_err_probe(dev, -ENODEV, "couldn't find parent EC device\n");
 
@@ -326,10 +330,24 @@ static const struct platform_device_id cros_ucsi_id[] = {
 };
 MODULE_DEVICE_TABLE(platform, cros_ucsi_id);
 
+static const struct acpi_device_id cros_ec_ucsi_acpi_device_ids[] = {
+	{ "GOOG0021", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, cros_ec_ucsi_acpi_device_ids);
+
+static const struct of_device_id cros_ucsi_of_match[] = {
+	{ .compatible = "google,cros-ec-ucsi", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cros_ucsi_of_match);
+
 static struct platform_driver cros_ucsi_driver = {
 	.driver = {
 		.name = KBUILD_MODNAME,
 		.pm = &cros_ucsi_pm_ops,
+		.acpi_match_table = cros_ec_ucsi_acpi_device_ids,
+		.of_match_table = cros_ucsi_of_match,
 	},
 	.id_table = cros_ucsi_id,
 	.probe = cros_ucsi_probe,
-- 
2.51.0.710.ga91ca5db03-goog


