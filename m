Return-Path: <linux-usb+bounces-29312-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D4ABDC671
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 06:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9D3A74EB11F
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 04:06:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18B222F2617;
	Wed, 15 Oct 2025 04:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bn6CIB0J"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8722E2F08
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 04:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760501181; cv=none; b=OImI8zkJ622hl2TRheAv+OKQUz944MZlLfD/ULNrONawo23vn4qgBb5aPv+ZQpHBPm5RwrAqTY+Vjh8unwD7+LkCk992KgkYlI5GvbS95ZresR4MaC3QzOQdrN8D+vKtqlUmBdOa0RKyWSpfudxi7KnQo7qD7O67RsBQrBydnPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760501181; c=relaxed/simple;
	bh=trVDpPeuksR1g5+HJktuuaoSn4xF4L/l/PJUJWdoebc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fvfmpvqjA+o1mvOI6cdbp/TG0BQyU0qfNM78DsZ0eOAyw/zuB9BjDgNokQurixd0DYv2LL/2X9GrUBTot9Q6WjssEH0XODEHEAa+IYALYmexgLsQk8KD8iz/cYSHaFhxO0ChOa2/wF5n40YEyPro2tVXy4PWVoKgIYLufxajuz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bn6CIB0J; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-780fdbbdd20so8882625b3a.1
        for <linux-usb@vger.kernel.org>; Tue, 14 Oct 2025 21:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760501179; x=1761105979; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=iclwpaqYBe4yoycNmS4MZD/ygkFaqNaaV+F1qM1aqaA=;
        b=Bn6CIB0JH+Qn2bwn/CZ4GF6dtuVJ761n6zogodES3yxF2OcCQxRqynG5a04b5avrOd
         1l/gPJcDBn+vjonXenhLmp8wNIw5Hmotau+LEYZRQy+QL6hoWOVaXw3DDklsoF55RpF2
         u/iVLmn1KmSTrADIK7nSUkaWvLVB3hyaRALlKnxBWwOQC6d0pMKHiQPXVBDz2rhfbCvf
         Ol4Q519M6EL/1L4dFbyAiM2ObFtQQmPKJW+r+PQU/44HGAWdor7NpJ3W/nD+Gzzqsy8d
         P1RfApxUk/sBv2o4biyy8zNEUCZA3iR8yAibCdFyWSZ/Axymd5TWqrPRkPJ3Cjyy+vBu
         AggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760501179; x=1761105979;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iclwpaqYBe4yoycNmS4MZD/ygkFaqNaaV+F1qM1aqaA=;
        b=P07je8RykcKPdaAB9GdtWel18CRzlyqwLjBxymgWpNFum1NPaoSTt97i0RA9DlATib
         HMaZYAcGf2j7T9MYTHY9lHjzH36I/Iucs0ce7ZoysBshatXdHXZIo10O+S+dOnvA3MPy
         YW2ZTYhzrIN1ID90kpoEq2QVyPespePZE4XHZIDz5Sg02o0xL4x5nBgvGTFQpbg9m2D2
         Y6nCsz4kzNur9r9cpNPbPwMCDWgr1gI+/B34obVnXFq76paCzCiDd194Mdf06L/cuCde
         Zuzso6pFq99jU/atImNbwAleFKImJ2+Hb7zhe0dn3+I4YRgJI4KazLWgpaANszJNpun8
         Wa7A==
X-Forwarded-Encrypted: i=1; AJvYcCUno3acxtS+NC/MMO68z5vU0QDilPq8KHzAwAeHq1saAgwSYz5OEtfLGZPLPVLeqAnpZSCIXOjM9BY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4xMAwNz1GmSH5vWS/WmS3buntwueszzXPtidgr9ygfkgmVxsc
	30IJk94t7vqCcnP0MBge5SYI46pV02VYNQewQWH5c7o2pB4AH2w0TMMlBFLD0X6Im60sNIqUxAl
	UOjoGsQ==
X-Google-Smtp-Source: AGHT+IF/9BeNC+s53hVuRtAdrMlwC3C6QrxcmE2ArO+xiyT4cnu3trM59B2AinY0W3cTk/qBSUgJX1vtZWY=
X-Received: from pgiz14.prod.google.com ([2002:a63:c04e:0:b0:b55:6eb3:fd1])
 (user=badhri job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d8d:b0:32d:a77b:c628
 with SMTP id adf61e73a8af0-32da8190c5emr34832025637.12.1760501179172; Tue, 14
 Oct 2025 21:06:19 -0700 (PDT)
Date: Wed, 15 Oct 2025 04:06:06 +0000
In-Reply-To: <20251015040607.3005975-1-badhri@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251015040607.3005975-1-badhri@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251015040607.3005975-2-badhri@google.com>
Subject: [PATCH v1 2/2] usb: typec: pd: Register SPR AVS caps with
 usb_power_delivery class
From: Badhri Jagan Sridharan <badhri@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	badhri@google.com
Cc: amitsd@google.com, kyletso@google.com, rdbabiera@google.com, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

usb_power_delivery class will now display AVS cap as
`spr_adjustable_voltage_supply`. `maximum_current_9V_to_15V` and
`maximum_current_15V_to_20V` shows the corresponding current limits
in mA. `peak_current` follows the same convention as fixed_supply
where the value reported in the capabilities message is displayed
as is.

Sample output with an SPR AVS capable PD charger:
$cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustable_voltage_supply/maximum_current_9V_to_15V
4000mA

$cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustable_voltage_supply/maximum_current_15V_to_20V
3350mA

$cat /sys/class/usb_power_delivery/pd1/source-capabilities/5:spr_adjustable_voltage_supply/peak_current
0

Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 .../testing/sysfs-class-usb_power_delivery    | 28 ++++++
 drivers/usb/typec/pd.c                        | 95 ++++++++++++++++++-
 drivers/usb/typec/tcpm/tcpm.c                 |  2 +-
 3 files changed, 119 insertions(+), 6 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-usb_power_delivery b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
index 61d233c320ea..c754458a527e 100644
--- a/Documentation/ABI/testing/sysfs-class-usb_power_delivery
+++ b/Documentation/ABI/testing/sysfs-class-usb_power_delivery
@@ -254,3 +254,31 @@ Contact:	Heikki Krogerus <heikki.krogerus@linux.intel.com>
 Description:
 		The PPS Power Limited bit indicates whether or not the source
 		supply will exceed the rated output power if requested.
+
+Standard Power Range (SPR) Adjustable Voltage Supplies
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:spr_adjustable_voltage_supply
+Date:		Oct 2025
+Contact:	Badhri Jagan Sridharan <badhri@google.com>
+Description:
+		Adjustable Voltage Supply (AVS) Augmented PDO (APDO).
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:spr_adjustable_voltage_supply/maximum_current_9V_to_15V
+Date:		Oct 2025
+Contact:	Badhri Jagan Sridharan <badhri@google.com>
+Description:
+		Maximum Current for 9V to 15V range in milliamperes.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:spr_adjustable_voltage_supply/maximum_current_15V_to_20V
+Date:		Oct 2025
+Contact:	Badhri Jagan Sridharan <badhri@google.com>
+Description:
+		Maximum Current for greater than 15V till 20V range in
+		milliamperes.
+
+What:		/sys/class/usb_power_delivery/.../<capability>/<position>:spr_adjustable_voltage_supply/peak_current
+Date:		Oct 2025
+Contact:	Badhri Jagan Sridharan <badhri@google.com>
+Description:
+		This file shows the value of the Adjustable Voltage Supply Peak Current
+		Capability field.
diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
index d78c04a421bc..67f20b5ffdf4 100644
--- a/drivers/usb/typec/pd.c
+++ b/drivers/usb/typec/pd.c
@@ -359,6 +359,84 @@ static const struct device_type sink_pps_type = {
 	.groups = sink_pps_groups,
 };
 
+/* -------------------------------------------------------------------------- */
+/* Standard Power Range (SPR) Adjustable Voltage Supply (AVS) */
+
+static ssize_t
+spr_avs_9v_to_15v_max_current_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umA\n",
+			  pdo_spr_avs_apdo_9v_to_15v_max_current_ma(to_pdo(dev)->pdo));
+}
+
+static ssize_t
+spr_avs_15v_to_20v_max_current_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%umA\n",
+			  pdo_spr_avs_apdo_15v_to_20v_max_current_ma(to_pdo(dev)->pdo));
+}
+
+static ssize_t
+spr_avs_src_peak_current_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%u\n",
+			  pdo_spr_avs_apdo_src_peak_current(to_pdo(dev)->pdo));
+}
+
+static struct device_attribute spr_avs_9v_to_15v_max_current_attr = {
+	.attr = {
+		.name = "maximum_current_9V_to_15V",
+		.mode = 0444,
+	},
+	.show = spr_avs_9v_to_15v_max_current_show,
+};
+
+static struct device_attribute spr_avs_15v_to_20v_max_current_attr = {
+	.attr = {
+		.name = "maximum_current_15V_to_20V",
+		.mode = 0444,
+	},
+	.show = spr_avs_15v_to_20v_max_current_show,
+};
+
+static struct device_attribute spr_avs_src_peak_current_attr = {
+	.attr = {
+		.name = "peak_current",
+		.mode = 0444,
+	},
+	.show = spr_avs_src_peak_current_show,
+};
+
+static struct attribute *source_spr_avs_attrs[] = {
+	&spr_avs_9v_to_15v_max_current_attr.attr,
+	&spr_avs_15v_to_20v_max_current_attr.attr,
+	&spr_avs_src_peak_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(source_spr_avs);
+
+static const struct device_type source_spr_avs_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = source_spr_avs_groups,
+};
+
+static struct attribute *sink_spr_avs_attrs[] = {
+	&spr_avs_9v_to_15v_max_current_attr.attr,
+	&spr_avs_15v_to_20v_max_current_attr.attr,
+	NULL
+};
+ATTRIBUTE_GROUPS(sink_spr_avs);
+
+static const struct device_type sink_spr_avs_type = {
+	.name = "pdo",
+	.release = pdo_release,
+	.groups = sink_spr_avs_groups,
+};
+
 /* -------------------------------------------------------------------------- */
 
 static const char * const supply_name[] = {
@@ -368,7 +446,8 @@ static const char * const supply_name[] = {
 };
 
 static const char * const apdo_supply_name[] = {
-	[APDO_TYPE_PPS]  = "programmable_supply",
+	[APDO_TYPE_PPS]      = "programmable_supply",
+	[APDO_TYPE_SPR_AVS]  = "spr_adjustable_voltage_supply",
 };
 
 static const struct device_type *source_type[] = {
@@ -378,7 +457,8 @@ static const struct device_type *source_type[] = {
 };
 
 static const struct device_type *source_apdo_type[] = {
-	[APDO_TYPE_PPS]  = &source_pps_type,
+	[APDO_TYPE_PPS]     = &source_pps_type,
+	[APDO_TYPE_SPR_AVS] = &source_spr_avs_type,
 };
 
 static const struct device_type *sink_type[] = {
@@ -388,7 +468,8 @@ static const struct device_type *sink_type[] = {
 };
 
 static const struct device_type *sink_apdo_type[] = {
-	[APDO_TYPE_PPS]  = &sink_pps_type,
+	[APDO_TYPE_PPS]     = &sink_pps_type,
+	[APDO_TYPE_SPR_AVS] = &sink_spr_avs_type,
 };
 
 /* REVISIT: Export when EPR_*_Capabilities need to be supported. */
@@ -407,8 +488,12 @@ static int add_pdo(struct usb_power_delivery_capabilities *cap, u32 pdo, int pos
 	p->object_position = position;
 
 	if (pdo_type(pdo) == PDO_TYPE_APDO) {
-		/* FIXME: Only PPS supported for now! Skipping others. */
-		if (pdo_apdo_type(pdo) > APDO_TYPE_PPS) {
+		/*
+		 * FIXME: Only PPS, SPR_AVS supported for now!
+		 * Skipping others.
+		 */
+		if (pdo_apdo_type(pdo) != APDO_TYPE_PPS &&
+		    pdo_apdo_type(pdo) != APDO_TYPE_SPR_AVS) {
 			dev_warn(&cap->dev, "Unknown APDO type. PDO 0x%08x\n", pdo);
 			kfree(p);
 			return 0;
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e6c27df3c2e..c65aa8104950 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -831,7 +831,7 @@ static void tcpm_log_source_caps(struct tcpm_port *port)
 				scnprintf(msg, sizeof(msg),
 					  "EPR AVS %u-%u mV %u W peak_current: %u",
 					  pdo_epr_avs_apdo_min_voltage_mv(pdo),
-					  pdo_epr_avs_apdo_min_voltage_mv(pdo),
+					  pdo_epr_avs_apdo_max_voltage_mv(pdo),
 					  pdo_epr_avs_apdo_pdp_w(pdo),
 					  pdo_epr_avs_apdo_src_peak_current(pdo));
 			else if (pdo_apdo_type(pdo) == APDO_TYPE_SPR_AVS)
-- 
2.51.0.858.gf9c4a03a3a-goog


