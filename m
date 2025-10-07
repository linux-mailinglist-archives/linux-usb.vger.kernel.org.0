Return-Path: <linux-usb+bounces-28940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C1569BBFD08
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 02:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 40A7B4F3475
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 00:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A39621ADA7;
	Tue,  7 Oct 2025 00:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FYcUT6KL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801C8C8E6
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 00:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759795222; cv=none; b=T2DqCp8he3+Uh5vQglfMXYfhnAK92XUFFI8Z5YEIfLUHT00RC3xCMaf81Shf4RT8w5ZdgKxHEL3hLfXECfCHbzNzjqUAo83Vb5BW7HYRGYcG/AIZ+iS4H0uWtera6vdpjjHbCetr5nAlhHEX5X74mWHRnLPG7QGrfbza70QsbG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759795222; c=relaxed/simple;
	bh=Str9fH8hydrNHWjtKguZVPS+zITiFbgB/SOHaQ7ym60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=nHeZk0UDfj88ysFwiv8YmHw6HhkL5sAI/z8kgIP78E72KrstbB/vKdCG8IZMVGv2Rny7B5ycjsqo5Btsjt5Ah19eyd2MmBAtBAfCz6QeUTEFw4xmO7dffcwcWLJKqkjsxujv9Te7oDdP10OCNHB419zVR+5HiIjeJB+vSemEj50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FYcUT6KL; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthies.bounces.google.com
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b630753cc38so2663757a12.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 17:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759795219; x=1760400019; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Ntr7wFteVMdK8qe86TO1gtoCOtxfr/CBl4A1p6Hm4=;
        b=FYcUT6KLYheAHDFMl1qMXSMcw1GeXKfC1JHvAO4DDh8F6/mkG7XxsXyhO4y/s4a5Kz
         C0CxUh2DDVSOU4IsbmSwTpFKx5aRkf75rBhVrjkg2FCWvIjLqhgKSIoQhcIyoJ5v6X2d
         M/Kbb7LygdCtPFrDa58fUCMmypYwAkpr/r0Ujcf7lFJN1icJottWhYGrfFNKlxvY41fp
         4hJxmqntOtvCDAsLNUJSTCzROtVNUuDnG9Cq+zMUNsmENi+WH0rscfhf4XhmjSGl5O+6
         IrXVpaAfL5FGTO/LMP0bUiNKnwZ9MD4SdrqZnkPrBUIKV4kyozp6w6c9UN398iPoH9kJ
         nbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759795219; x=1760400019;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/Ntr7wFteVMdK8qe86TO1gtoCOtxfr/CBl4A1p6Hm4=;
        b=SgDAhmk08Hvnvm4JyUeP1ql61KuK/YiWov32yIvFhG50t+p8DWreXNmAN5A2jgklqa
         x43Md/RKuk2KrPicrw6/P2YF7NpgtwHISkkBRkGZ0S3H+f8Xf2iRWgOTTpTDtIL64JuR
         bpx66y0Jzg7npzd8yq6wYT0AkDCBgJ6q6C5aHjCZ/l6tf1uaK8IyrHvtCMLb/uZH9TCp
         XP2BRGnuAFaozBcfulajLCJbchwqQjbY5SsgjL2SO5D6IznWKa6w3XQ9cCnECdD5fvJx
         inTa8giv3+KkdBexIfUyXrsgZaWLpGeIBXjgJ1wVjJA62KmG/9RS3qE9Fi3z6RmmSEVP
         JnjA==
X-Forwarded-Encrypted: i=1; AJvYcCV8fgqro/chLl7jSc+L8aBX3FuXdt3AMeuocHL1uXf8QPLWUP5EAL4bxU6UZFwBkJQCSL2jMqRbnYw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHpFVOT6Wx+nP6bLFyEwsvvyqc1gpMQtj9yg/LFkJ2Lss/zlxG
	+DirSJOmdn9iz7nP6SVEXvDIN5DgcXR5UNQfvOqu4peYkxJhbsmmfAH5/p03dmA3yMjd/xA+IGw
	jq+I85Q==
X-Google-Smtp-Source: AGHT+IGtj1LUUjLYbsIMAV2GwYOXjjJ8onhXCjB5EWGPd6ipgp/twyTqetktTXVYLm7pESak4E3PvR4IS0U=
X-Received: from plcs4.prod.google.com ([2002:a17:903:30c4:b0:28e:cc8d:f602])
 (user=jthies job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b63:b0:281:613:844b
 with SMTP id d9443c01a7336-28e9a6b1988mr189582965ad.52.1759795219487; Mon, 06
 Oct 2025 17:00:19 -0700 (PDT)
Date: Tue,  7 Oct 2025 00:00:02 +0000
In-Reply-To: <20251007000007.3724229-1-jthies@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251007000007.3724229-1-jthies@google.com>
X-Mailer: git-send-email 2.51.0.618.g983fd99d29-goog
Message-ID: <20251007000007.3724229-2-jthies@google.com>
Subject: [PATCH 1/6] usb: typec: ucsi: psy: Add power supply status
From: Jameson Thies <jthies@google.com>
To: heikki.krogerus@linux.intel.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: jthies@google.com, dmitry.baryshkov@oss.qualcomm.com, bleung@chromium.org, 
	gregkh@linuxfoundation.org, akuchynski@chromium.org, 
	abhishekpandit@chromium.org, sebastian.reichel@collabora.com, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Add support for power supply status. If a port is acting as a sink
with the sink path enabled, report it is charging. If a port is
source, report it is discharging. If there is no connection or the
port hasn't enabled the sink path, report not charging.

Signed-off-by: Jameson Thies <jthies@google.com>
---
 drivers/usb/typec/ucsi/psy.c  | 26 ++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 29 insertions(+)

diff --git a/drivers/usb/typec/ucsi/psy.c b/drivers/usb/typec/ucsi/psy.c
index 62a9d68bb66d..2b0225821502 100644
--- a/drivers/usb/typec/ucsi/psy.c
+++ b/drivers/usb/typec/ucsi/psy.c
@@ -29,6 +29,7 @@ static enum power_supply_property ucsi_psy_props[] = {
 	POWER_SUPPLY_PROP_CURRENT_MAX,
 	POWER_SUPPLY_PROP_CURRENT_NOW,
 	POWER_SUPPLY_PROP_SCOPE,
+	POWER_SUPPLY_PROP_STATUS,
 };
 
 static int ucsi_psy_get_scope(struct ucsi_connector *con,
@@ -51,6 +52,29 @@ static int ucsi_psy_get_scope(struct ucsi_connector *con,
 	return 0;
 }
 
+static int ucsi_psy_get_status(struct ucsi_connector *con,
+			       union power_supply_propval *val)
+{
+	bool is_sink = UCSI_CONSTAT(con, PWR_DIR) == TYPEC_SINK;
+	bool sink_path_enabled = true;
+
+	val->intval = POWER_SUPPLY_STATUS_NOT_CHARGING;
+
+	if (con->ucsi->version >= UCSI_VERSION_2_0)
+		sink_path_enabled =
+			UCSI_CONSTAT(con, SINK_PATH_STATUS_V2_0) ==
+			UCSI_CONSTAT_SINK_PATH_ENABLED;
+
+	if (UCSI_CONSTAT(con, CONNECTED)) {
+		if (is_sink && sink_path_enabled)
+			val->intval = POWER_SUPPLY_STATUS_CHARGING;
+		else if (!is_sink)
+			val->intval = POWER_SUPPLY_STATUS_DISCHARGING;
+	}
+
+	return 0;
+}
+
 static int ucsi_psy_get_online(struct ucsi_connector *con,
 			       union power_supply_propval *val)
 {
@@ -245,6 +269,8 @@ static int ucsi_psy_get_prop(struct power_supply *psy,
 		return ucsi_psy_get_current_now(con, val);
 	case POWER_SUPPLY_PROP_SCOPE:
 		return ucsi_psy_get_scope(con, val);
+	case POWER_SUPPLY_PROP_STATUS:
+		return ucsi_psy_get_status(con, val);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e301d9012936..cce93af7461b 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -360,6 +360,9 @@ struct ucsi_cable_property {
 #define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
 #define UCSI_CONSTAT_PD_VERSION_V1_2		UCSI_DECLARE_BITFIELD_V1_2(70, 16)
+#define UCSI_CONSTAT_SINK_PATH_STATUS_V2_0	UCSI_DECLARE_BITFIELD_V2_0(87, 1)
+#define   UCSI_CONSTAT_SINK_PATH_DISABLED   0
+#define   UCSI_CONSTAT_SINK_PATH_ENABLED    1
 #define UCSI_CONSTAT_PWR_READING_READY_V2_1	UCSI_DECLARE_BITFIELD_V2_1(89, 1)
 #define UCSI_CONSTAT_CURRENT_SCALE_V2_1		UCSI_DECLARE_BITFIELD_V2_1(90, 3)
 #define UCSI_CONSTAT_PEAK_CURRENT_V2_1		UCSI_DECLARE_BITFIELD_V2_1(93, 16)
-- 
2.51.0.618.g983fd99d29-goog


