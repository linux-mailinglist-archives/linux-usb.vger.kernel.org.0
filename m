Return-Path: <linux-usb+bounces-10212-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 620D48C2A12
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 20:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E12C01F223E4
	for <lists+linux-usb@lfdr.de>; Fri, 10 May 2024 18:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD43482EF;
	Fri, 10 May 2024 18:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UPXYbBMN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F9447A60
	for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715366623; cv=none; b=nicgFHOYHMam1I/nwcr+DVpBjXujzsEjc+Ere1flIlE0OuE4KjkYNj55LHaOMUtzI49Qb4//vvFkkXJjgRYKzwzDan6uwkOj1C7r5oKc2qVrFsx0NOhJesIKHQwhATgc9MdnRbc02BDUiQS0Ej2v0aLVv6DCXiGtoBk2sy7XxKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715366623; c=relaxed/simple;
	bh=gQji9l12Fjk6vAy1gBuYFgvwCdzi4ZJBVjEkxA6DHUk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fS+q5yyJeNXUmoYpTcefIoN/+SvtbUnO1TSgidMW7XhkxrSLW342BUZk1eTXEQt4EOf6SHUWo2gz5QQPBwfG9jw3/biPsRiYqZzuCsEVR86wuSZEIMS9OTgFzldfgBZrABogp9SImnEBNGwtQIVwRvCtehm+24r0PuU4EhzrTAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UPXYbBMN; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so3614586276.3
        for <linux-usb@vger.kernel.org>; Fri, 10 May 2024 11:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715366621; x=1715971421; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gcZTWRljQX/x9I6RAMAcoKUh92qzwt0cLFIO8/Y0bdA=;
        b=UPXYbBMNcl0BzrwD4yEBs5E74eyC75moFzXMQGQAWs/ne1LdCUwkaXDMEpMvCaS4yB
         2JIkMxr4JLhsNqDFvdeejx0ODnnp1D6Bze4jcyWypPWJsmfXhe6+kwiZQCb5nHh0OAys
         5plfXXpwygQj3ebmTZ+2q5ynH9I+ccNjwJDHqQpTZaWN7ERsV0s9H72E8JiN6fVp3f8a
         T8agyjhODp1RLJtaDfEsFhx9R6f0fcZsoHi9rivQiEzdZpG4iTiDzBOg8W+19VX5a6Sv
         bchQtXMZnRpvX6gvcQ7rUzqzgdeFKkdyKVZ/IyhVQU7bDc8GBAq7xyD3tndI2KbixIGf
         NBrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715366621; x=1715971421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gcZTWRljQX/x9I6RAMAcoKUh92qzwt0cLFIO8/Y0bdA=;
        b=iNbAsS3jssJdNXwTuv1uvARrO3jUW8RTzAiFgjMb2eL8Z4aA/A5BzRvITXotbINs51
         2jgMxSi0khFxinBfBxqvfKwv4VT5jUMB/wRHnfh5YZ8OWv781pzeaIerGazWFDQ9qjB6
         Z4IDkLBuRbxhWURExR6/stbVZ11n/injqJD05OGS/VAuyqER10kjdPc3fPek5Pkb8hAi
         M8LA33I6TaWWeE3Iolxv9z4brzglBdm6sEYsQPWbBrj7iMyhd2jgakZp4ZURiFCD/X6W
         heKvkg2qCenQkgvbxpYzzji8sVjuZwC9xWSqG7T98ZJYtqPvNcrZALBZ5y8oSMI9g46y
         P4uw==
X-Forwarded-Encrypted: i=1; AJvYcCUZtAttPKydreBIHU6mUc9hyuqS/Fry7Nw5VIvx8TuUDhpZ2dZRMOzSdoodi0+nxUbJvX5VCvZ3uu1k6+/1A9Q2m5p2MSMYXgCk
X-Gm-Message-State: AOJu0Yxy/RzsBcMPktgvHZMZhBQX6dT9dU9Fb8UZtjL/yDvq2C1s0b/a
	lWjDFNpIBXgRDsC3nEu/EdG8dax4cdtxSPX3RCHxHq33s2BdPGxfNk4dDGKKZeykOFT/xXlsyUJ
	6Iw==
X-Google-Smtp-Source: AGHT+IEX+Y0TwfXDXyAK2FWGkX+Yp7DciNo2SWMVEaaeHqCrTSftQYF1VowZjG+ms1EStcbrcZ9NIePZn7Q=
X-Received: from jthies.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:23db])
 (user=jthies job=sendgmr) by 2002:a25:fb06:0:b0:dce:5218:c89b with SMTP id
 3f1490d57ef6-dee4f3595b8mr317092276.5.1715366621008; Fri, 10 May 2024
 11:43:41 -0700 (PDT)
Date: Fri, 10 May 2024 18:43:22 +0000
In-Reply-To: <20240510184324.2944101-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240510184324.2944101-1-jthies@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510184324.2944101-3-jthies@google.com>
Subject: [PATCH v4 2/4] usb: typec: Update sysfs when setting ops
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
Signed-off-by: Jameson Thies <jthies@google.com>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
Changes in V4:
- None.

Changes in V3:
- None.

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
2.45.0.118.g7fe29c98d7-goog


