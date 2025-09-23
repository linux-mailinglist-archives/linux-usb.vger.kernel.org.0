Return-Path: <linux-usb+bounces-28560-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AF5B972DB
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 20:16:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA50C19C6ABF
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 18:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61F3A30146B;
	Tue, 23 Sep 2025 18:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FEu2gaTL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8E13009F1
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 18:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758651393; cv=none; b=lif30hFKaNy6SFb+OHS50fNmGpo0qd7kt4zkPnG1+E7XxzVE404yxXtWOsdJx2Tts3lHmrji5jRlyFF5hGlYwM09t3+fxm08cpAiq/Gr2J4BUnEnQODukg++vAoHfbTD57J9psH4XCg+ZKu+SKhhzejH9jPRqvM4UUsTY/sz3Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758651393; c=relaxed/simple;
	bh=JNwNjSurgcpPlXOhcGNj9bbi92aJUz2tEOoSfRoAXIU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 Cc:Content-Type; b=uiX8lhk5SwMubAXiai36W+7kmbq6gondiTHEb1EKwtDgd/cYYBnrG1atYbXk8X7D1f3Zubs0LJcmFignGvBplvMCZbnSj+xXjxmfeO7FZf8ZNedCg75D8XgJyln9u+BtkIoUgDwO8sIO0CE+TcOrk7K5e+y8Koe/j+p1dcPGQew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FEu2gaTL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b521995d498so4508218a12.1
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758651392; x=1759256192; darn=vger.kernel.org;
        h=cc:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Oa8Q2aTGVBenif3e/7v5uvSd5JKEyYerltvnq4kJmxY=;
        b=FEu2gaTLj/XL/aXE0Ds0V+gpMRnHXv0ICApijJCtilvm7k8JkYcFAYCu7ruiltWcSa
         c60dfHP7faBpxvvnF3Tzq0qfAZ8ZksSDZeG72SUpr+YEgOsuw9oI2iuHOStVbb0VYu9+
         yau9eJYLHUJ88PWu+7qgcug8ZqarVVpGu0YluXw4/iLdyLvZP39AFXA/Z7MhFgv56fie
         /7stIOSB4CjqBvyjAYL1RyBkK1gtcEKsvc2Q7jOHqTzHqhkDR5zLAFGpQoRaahx4WWmQ
         AHWXffwds2f2WhYk48yi+Iylq//J9eVVgLVv36pyk+GopxX0BDQWX6FQg0fqsHKS/5wq
         25NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758651392; x=1759256192;
        h=cc:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Oa8Q2aTGVBenif3e/7v5uvSd5JKEyYerltvnq4kJmxY=;
        b=rEtzP9URvr94MvZRhxM9Hv0EWHxy7/fmVfbrb1rny4/DCVB31dbe6fk4quP76JcbH0
         70zZAAMvuyqcRDBSIUDJ7nnwYMwmpix6oFJBxWqCvtQtbGfH6Os7nMuQaq2zbf4CdKaV
         /0SSe4Wf/8vEM4AazogLyNV5raiS7nc/rqG5MfJQWacuYIv8RPMoqBJXdMrx2jhF9vpN
         xtugSMtvH1FPuHtQ9RGBhXMq7w8eQ1nUshS7E4F1VxDM1meBSxnj5Oa/QyeNDxHgLGS1
         LO946JPZb7fqOG53ip4t/ZA8k2ynapqL0nd73aFBrkQYKxCKsaWuMOk/428XmxPX+4m9
         yPoA==
X-Forwarded-Encrypted: i=1; AJvYcCVKNO6C+6uxhvhxUslCJ+SljF6RtgEkvZQ8gnkI+KFhbIBJCp5Ovrmw6KQJ7DXMnJ+310jmj2Y9NJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcK5QUNsmWQRB5aSRUfwltfXqnhDOJzO01dcogaov0HG0Ak5j6
	Bj6Rrux7GMhvOetVRCubrgWRCePjOo/3m1awDP/81QBrkN04G7quN3U0qbjYa8kHyOWQUlv+e2H
	ca0FOc60mdl8NpiJX+A==
X-Google-Smtp-Source: AGHT+IErfx0Qc5k//IYvQhPfuUS7anf6kAjYPgNngerp5s5EW1cwtMxL8NXeCo7ZQVEnKyfdEz8rmWci++Aib+A=
X-Received: from pjiz15.prod.google.com ([2002:a17:90a:608f:b0:330:b9e9:7acc])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:72a7:b0:250:1407:50a4 with SMTP id adf61e73a8af0-2cfed265260mr5469277637.43.1758651391735;
 Tue, 23 Sep 2025 11:16:31 -0700 (PDT)
Date: Tue, 23 Sep 2025 18:16:07 +0000
In-Reply-To: <20250923181606.1583584-4-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250923181606.1583584-4-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=0B74D21BCA57BD40083A73A0DB00FC8CD80B20A1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3036; i=rdbabiera@google.com;
 h=from:subject; bh=JNwNjSurgcpPlXOhcGNj9bbi92aJUz2tEOoSfRoAXIU=;
 b=owGbwMvMwCV2m+FPzw1uhYWMp9WSGDIuPX6ere7rPlsxXbBGX6dkTUtC2v3/2dwrdvS/Vdzpd
 vBe/6fZHaUsDGJcDLJiiizcJZekT4XvdeCwKl4AM4eVCWQIAxenAEzk0geGv9Ivb0a3HrN0XPrg
 2YNO9/liaRdfrpbjj4nPVix0WuPqIsDI8EVM7rG1rrn/74bJ83uWyM557WH0wCIoctHBPzx5EQc NuQE=
X-Mailer: git-send-email 2.51.0.534.gc79095c0ca-goog
Message-ID: <20250923181606.1583584-5-rdbabiera@google.com>
Subject: [PATCH v2 1/2] usb: typec: class: add typec_get_data_role symbol
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
	RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Alt Mode drivers are responsible for sending Enter Mode through the TCPM,
but only a DFP is allowed to send Enter Mode. typec_get_data_role gets
the port's data role, which can then be used in altmode drivers via
typec_altmode_get_data_role to know if Enter Mode should be sent.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
Changes from v1:
* changed typec_altmode_get_data_role documentation format
---
 drivers/usb/typec/class.c         | 13 +++++++++++++
 include/linux/usb/typec.h         |  1 +
 include/linux/usb/typec_altmode.h | 13 +++++++++++++
 3 files changed, 27 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 67a533e35150..9b2647cb199b 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2120,6 +2120,19 @@ void typec_set_data_role(struct typec_port *port, enum typec_data_role role)
 }
 EXPORT_SYMBOL_GPL(typec_set_data_role);
 
+/**
+ * typec_get_data_role - Get port data role
+ * @port: The USB Type-C Port to query
+ *
+ * This routine is used by the altmode drivers to determine if the port is the
+ * DFP before issuing Enter Mode
+ */
+enum typec_data_role typec_get_data_role(struct typec_port *port)
+{
+	return port->data_role;
+}
+EXPORT_SYMBOL_GPL(typec_get_data_role);
+
 /**
  * typec_set_pwr_role - Report power role change
  * @port: The USB Type-C Port where the role was changed
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 252af3f77039..309251572e2e 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -337,6 +337,7 @@ struct typec_plug *typec_register_plug(struct typec_cable *cable,
 void typec_unregister_plug(struct typec_plug *plug);
 
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
+enum typec_data_role typec_get_data_role(struct typec_port *port);
 void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
 void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
 void typec_set_pwr_opmode(struct typec_port *port, enum typec_pwr_opmode mode);
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index b3c0866ea70f..f7db3bd4c90e 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -172,6 +172,19 @@ typec_altmode_get_svdm_version(struct typec_altmode *altmode)
 	return typec_get_negotiated_svdm_version(typec_altmode2port(altmode));
 }
 
+/**
+ * typec_altmode_get_data_role - Get port data role
+ * @altmode: Handle to the alternate mode
+ *
+ * Alt Mode drivers should only issue Enter Mode through the port if they are
+ * the DFP.
+ */
+static inline enum typec_data_role
+typec_altmode_get_data_role(struct typec_altmode *altmode)
+{
+	return typec_get_data_role(typec_altmode2port(altmode));
+}
+
 /**
  * struct typec_altmode_driver - USB Type-C alternate mode device driver
  * @id_table: Null terminated array of SVIDs
-- 
2.51.0.534.gc79095c0ca-goog


