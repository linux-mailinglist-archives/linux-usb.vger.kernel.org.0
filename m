Return-Path: <linux-usb+bounces-9687-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A18AFE04
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 03:49:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6C0F2865CD
	for <lists+linux-usb@lfdr.de>; Wed, 24 Apr 2024 01:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38351125DC;
	Wed, 24 Apr 2024 01:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CXkE/UrG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE89182A3
	for <linux-usb@vger.kernel.org>; Wed, 24 Apr 2024 01:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713923341; cv=none; b=nF4tQUFHTBLtk9b+AGP2GzPjaDQ3qNY2D6A0GmwDfqEcyelrfJu9t9ysicg0cstcvfwwUTIFvaKf6FvQkUQAcRPJ229qU+Jty3PgOALLDIXyKdqY+KGJ3tmDkI6G9pskL4KVuhU86A86jRBUpDkB7jcMfLJx0o8xq4tlDz2204k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713923341; c=relaxed/simple;
	bh=m1HtQmNf4KxCI7tQe3eA9QXlPOTeo26skECh7AV7JzU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P/kjT7qGPCpdQGbmDhTUEvnqOnP1ZNkfZM9AVX/BWxBfyqXj7DBL8W20NYi8kLjR95cirt5MAo0wHgSHSwj/cV6t6STLnIG7DyNC9vV9JTf8/4+dsNDYDokeOzrKIoYGhQTa9qJ0nC24Xa0WmELP3c4Pgadsh35XiyLxFmNsFEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CXkE/UrG; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-61b6f415d0fso43247687b3.2
        for <linux-usb@vger.kernel.org>; Tue, 23 Apr 2024 18:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713923339; x=1714528139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cwsr5zimwwl7iB3IB5gm0hd1CCE5USVnmuwHUKdLC78=;
        b=CXkE/UrGQnlycONR5ZDkxjK3Gagc0IAHOlKCKTzeHxBklZWBi7ypN7okFeqR4oCIgC
         Exn0ZTRuhfxAJEJ2J7em9nbS1OVK0+jvCrZulH0P+SXwKLrFnk6UhFT5J1XwVGcD0cSV
         j2HgqQy+pAgfSqNVUbWn9dXeaOkUr3u/rvyjzgchkht0nNkAhLExd6/yn1AQkudYT5+Q
         Xr3c7zP+5ZD2OvdRFXKtf22WvLqxgdQ3pEX+p74gZsZOAhuAnVjW6JFTdm/hQqYpXmEg
         hkry37OXyOmu3ljFphEUmfAYTuIrnoP8mXBQQrc3zBVW28PTDSvcQsa7A/DAsur1qTaF
         0HNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713923339; x=1714528139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwsr5zimwwl7iB3IB5gm0hd1CCE5USVnmuwHUKdLC78=;
        b=G3v+Fh4R6n5hHjkim1bV/WZJzqj4/dPN4ggvHWAYPzi57Gsdzc6UGJtVIv5d4Wqi1m
         yT7jU8mDhB09bPer1pJtnFfcpqfY7DgbTpUNEOeEUNRhnIE6qZD4mw6dmf4H/2x7Ka80
         5sN4KOhyg3JzsFI9DRvgNCs6GQH40V2bru+5ek+j4nDX8i+6LhlrVBFoOQxSQTxW/spE
         stSeYhgextih5VPkMPYeXfl1/sMM65rc7HFklVRR+trLlSQkCam77BawBE4kQT/rItYU
         RDdP+IsZ6mNoknK6EJL0WNL533OjrkOOpUlGbeNz51PHbPXUUaK5/DGwSPbinjMLPhaD
         AYlw==
X-Forwarded-Encrypted: i=1; AJvYcCXgat3/whmDv+b1kmsNDfKayjm6/oH5wXdXlxBuGUQAz0jSudagKNi9Ys2ESP1kR9ICePP8T0MLTULpjbFrxfih43VZdgiNlpNA
X-Gm-Message-State: AOJu0YwO+WeAhOngsO7xYIfKIoYi/6ZeXZOX5/HA1AyHXOM4bCuNpyGU
	FJURiGmVbCWeIyGgw3RlT1HIltycMFmM+DjCgXxJPxihxPIii/EMhs0XgOeKBTPZX0mz5Y8shG6
	7Pg==
X-Google-Smtp-Source: AGHT+IH1BHhOw7kyUiS+4sIrPrs9btWxNAO8b7+PXhv4qFdWIlAm8r+0yDNmAnw6wb1NsagAOL+uG5JbIG0=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a81:7744:0:b0:61b:1346:3cd5 with SMTP id
 s65-20020a817744000000b0061b13463cd5mr308854ywc.9.1713923338677; Tue, 23 Apr
 2024 18:48:58 -0700 (PDT)
Date: Wed, 24 Apr 2024 01:48:19 +0000
In-Reply-To: <20240424014821.4154159-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240424014821.4154159-1-jthies@google.com>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240424014821.4154159-3-jthies@google.com>
Subject: [PATCH v2 2/4] usb: typec: Update sysfs when setting ops
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org
Cc: jthies@google.com, pmalani@chromium.org, bleung@google.com, 
	abhishekpandit@chromium.org, andersson@kernel.org, 
	dmitry.baryshkov@linaro.org, fabrice.gasnier@foss.st.com, 
	gregkh@linuxfoundation.org, hdegoede@redhat.com, neil.armstrong@linaro.org, 
	rajaram.regupathy@intel.com, saranya.gopal@intel.com, 
	linux-kernel@vger.kernel.org, Benson Leung <bleung@chromium.org>
Content-Type: text/plain; charset="UTF-8"

From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>

When adding altmode ops, update the sysfs group so that visibility is
also recalculated.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Benson Leung <bleung@chromium.org>
Reviewed-by: Jameson Thies <jthies@google.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Changes in V2:
- None.

 drivers/usb/typec/altmodes/displayport.c |  2 +-
 drivers/usb/typec/class.c                | 18 +++++++++++++++++-
 drivers/usb/typec/ucsi/displayport.c     |  2 +-
 include/linux/usb/typec.h                |  3 +++
 4 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 596cd4806018b..92cc1b1361208 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -746,7 +746,7 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	dp->alt = alt;
 
 	alt->desc = "DisplayPort";
-	alt->ops = &dp_altmode_ops;
+	typec_altmode_set_ops(alt, &dp_altmode_ops);
 
 	if (plug) {
 		plug->desc = "Displayport";
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9610e647a8d48..9262fcd4144f8 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -467,6 +467,22 @@ static const struct attribute_group *typec_altmode_groups[] = {
 	NULL
 };
 
+/**
+ * typec_altmode_set_ops - Set ops for altmode
+ * @adev: Handle to the alternate mode
+ * @ops: Ops for the alternate mode
+ *
+ * After setting ops, attribute visiblity needs to be refreshed if the alternate
+ * mode can be activated.
+ */
+void typec_altmode_set_ops(struct typec_altmode *adev,
+			   const struct typec_altmode_ops *ops)
+{
+	adev->ops = ops;
+	sysfs_update_group(&adev->dev.kobj, &typec_altmode_group);
+}
+EXPORT_SYMBOL_GPL(typec_altmode_set_ops);
+
 static int altmode_id_get(struct device *dev)
 {
 	struct ida *ids;
@@ -2317,7 +2333,7 @@ void typec_port_register_altmodes(struct typec_port *port,
 			continue;
 		}
 
-		alt->ops = ops;
+		typec_altmode_set_ops(alt, ops);
 		typec_altmode_set_drvdata(alt, drvdata);
 		altmodes[index] = alt;
 		index++;
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d9d3c91125ca8..eb7b8d6e47d00 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -337,7 +337,7 @@ struct typec_altmode *ucsi_register_displayport(struct ucsi_connector *con,
 	dp->con = con;
 	dp->alt = alt;
 
-	alt->ops = &ucsi_displayport_ops;
+	typec_altmode_set_ops(alt, &ucsi_displayport_ops);
 	typec_altmode_set_drvdata(alt, dp);
 
 	return alt;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index b35b427561ab5..549275f8ac1b3 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -167,6 +167,9 @@ struct typec_port *typec_altmode2port(struct typec_altmode *alt);
 
 void typec_altmode_update_active(struct typec_altmode *alt, bool active);
 
+void typec_altmode_set_ops(struct typec_altmode *alt,
+			   const struct typec_altmode_ops *ops);
+
 enum typec_plug_index {
 	TYPEC_PLUG_SOP_P,
 	TYPEC_PLUG_SOP_PP,
-- 
2.44.0.769.g3c40516874-goog


