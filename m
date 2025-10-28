Return-Path: <linux-usb+bounces-29774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 029D7C14B52
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 13:52:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 811D0351F96
	for <lists+linux-usb@lfdr.de>; Tue, 28 Oct 2025 12:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AB6532D7D8;
	Tue, 28 Oct 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t5lmB8IL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907B30147E
	for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 12:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761655940; cv=none; b=ZCjGNW3CKLFHEYaVi0qEabXEWmFjiVDHZm+fgcvbQktHMHh4SVDdZLNi2/18plAjuPyASanUbJbNnSCxnpyiP7Cd6TywVqHLlW67FJyoueiBPzgvYcXsCSF35se0D+7y/hvxBCzPO2QYOewFchcX76fS3ZKbvNfSYajPSTOY3Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761655940; c=relaxed/simple;
	bh=19Aw2e3syKvL7oQUEOvzHNrGapjCIBdFH4EzxMLy+/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QoZ1+QKRpByg+Cvt0CKibvfTTaZPaUA+A9O3+9MmsiD02grRe8Lxqr2qynfeMwDIDNSeCpWlOCTSLvwyS/tDyiu4IRps8pYmTcVQ7MEX641ZS54Tek8IDW7zEFJYEeyhF+xYwdqWxBsrLawhjNYkfrNpYd6YcXHUVE2GKlWHz/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t5lmB8IL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47112edf9f7so38067955e9.0
        for <linux-usb@vger.kernel.org>; Tue, 28 Oct 2025 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761655937; x=1762260737; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uiFbGd4UbNp+KeVPTy2XKkvgsMstWdXWxCkfgt0Ii14=;
        b=t5lmB8ILCzcCo0kZkm/Rpy4ganugVM9zz1PxtEAQjtll187v0KRCpTJAjfQLqfVLP/
         aMEW/QftyP3ypGLTt+2QcWKU8E2o8kpGk7B0k03zF+fWgcQJbCCgd3vZBT/s8+fCv3ZD
         ExruTv6usUZJpSp0D9V9xRuyD+TVjVAAYKpAnVFvFMhtLrfNUYlCrq/T/DHy8YaGu70T
         U+/rFkHXVkxNn49TZIwkQu7H9c1yqIxgXTP6R5x4NnWhmcoZxL5piwLOQe0iNC2OxaDB
         yucy4XE1LqGtKLgpk17pLJfYfZQTgyiQ4jvRkUkDlKtulx9PkX29A1z7bMjyMc51dCql
         wYdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761655937; x=1762260737;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uiFbGd4UbNp+KeVPTy2XKkvgsMstWdXWxCkfgt0Ii14=;
        b=MhKBGsD4E/gEcz/Hcd7GYHjr0DMSEP5rrZbFK2FAr4Z/YGi3bwNhOv0FMlDgLY7KhP
         k1VYpAsix3NDteJJz16UUu6BAPxe9MSuIt01dFwviNPP9pW925JPATr8IJjOWPShk9dv
         SPzaRjnyPrByNf4CHZXmC/XXZeQDcEwYgZ8XQroCnG3wUJKjcC8LHkNF95wDJETXeNkE
         NO8UqmHG1kwoqiiXA9Qga1q29N/Fa8qtaAoTikr5jMVb482lDW3Q8ymbs3mteECzMRB7
         XrA7dINqF4l29n+It2JYeMDm+kdPKuHgo5Pm9LEiZ6pjMdZYPKdKX/mgmCh4r3Hi2RQg
         +8Ow==
X-Gm-Message-State: AOJu0YxTBdqIiF7Wc4G2FM8Q4LBMD1918JG0jaxLkGS9iqt8gVIgVMCx
	u5yAxDlnrM4abg1hj7ypDrXUOHAirFpv2cu3tZVJJNKHIhiVB0KC7Vfh8xfGZt4Qtd/KzduD6xY
	Et6/c
X-Gm-Gg: ASbGncuWGFhCdsI6Y0J5E1TBg6wdpy8JDt+cyDPNWYcTYX+sb1C5YnveMByNjnUjwVW
	hR+TO6fHXH17bw9sVQEsaSWSEcMjKAkNgoZHedctq4dcmsNW9JaAbjIX6weyXh/eWRicXqE/3iO
	1RQC+6CldKIBP8rJXAanEYBAbqWYiaGhcS4lK57ZDobptgfM23m/cWaa+W4lkwU0+trC7cRrteW
	9qBA10/lNO50qGN1o3t75iicKbXUVA4DnQcEiX8KyHdqnzVLvevFWVAVKs5gLzY1ROD/y3mK0pl
	PFIiPXN9+NHga05ifemBsNm/K1PNsST4uVd+Joh+TWqCG5ERNqvvFPcr8KInkc7CYe0tnm3erf3
	015MDjuiZR/ucBtSU1FUJnmD5FdKXVERUKejcY4z7ajkUvxowDTqRAGfgyYc2zPX5lLpi08Pzzw
	==
X-Google-Smtp-Source: AGHT+IHegn1qI4Kn9PvxJhv6Hp8XHuri1BwXoTpbjFFuvvKl85oIEEM0HrKmuYa1l6KMovMnyZOCYQ==
X-Received: by 2002:a05:600c:3b14:b0:475:dd9a:f786 with SMTP id 5b1f17b1804b1-47717e7ab64mr27833225e9.40.1761655937047;
        Tue, 28 Oct 2025 05:52:17 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd478202sm193697355e9.14.2025.10.28.05.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 05:52:16 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 28 Oct 2025 14:52:12 +0200
Subject: [PATCH v2] usb: typec: ucsi: Add support for orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-usb-typec-ucsi-orientation-v2-1-9330478bb6c1@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHu8AGkC/42NQQqDMBBFryKz7pQkRaxd9R7FRYwTHSiJJFEq4
 t079QTlr96H//4OmRJThke1Q6KVM8cgYC4VuMmGkZAHYTDK1FrpGpfcY9lmcri4zBhlHYotMsO
 mpkFZ41rvbyCCOZHnzyl/dcIT5xLTdn6t+tf+pV01Su5u0Kr1veqb55uDTfEa0wjdcRxfnmk4X
 cUAAAA=
X-Change-ID: 20251015-usb-typec-ucsi-orientation-75ed0a2c9ff3
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3338; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=19Aw2e3syKvL7oQUEOvzHNrGapjCIBdFH4EzxMLy+/c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpALx+5NxQ8m+JVMkVpgW22EAhwxn4LDIWRCrrN
 5eYiQGLQaKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaQC8fgAKCRAbX0TJAJUV
 VmzQEADNH1s3sHmGwJIeFwm7fYJvYFBI1tWsjCUM2E84uqXBeW0hxNNyZGX6Cb+P9FdlVjHHOPJ
 JW8R+s/pZ2u/UXP2CipODaSKs2HuOolsSbn11X1TXhYIyDAHBMLbWkqp+1IsmTOkP+O1sk1Z12q
 Ifdt18jBElyKMEbgqiMlbrSxc0sAx68oBlSqiB8ifIoBbv7zr6+Hny8T12CRilDJGqv3WTmwid4
 oGh2esBl+B42NS4KD0Dd3PXC1YbJS6dUNqmW6HtqQ5Ml9l4UkiEqFzvPtek0g3Tx9BxHk4CcZhJ
 dWzq4Ka8X609tudquzkTj8tsvfRVtzP9ie6HWh59CzJ5YgBAY5yyuql594X+6+x2T60kGJlCzpI
 dw5CCLAnamfyljdTGyVZMUckf06HObHKVgsr6gBNII2awQ0INY/GoIA2azP2zrHG1B2LrnCFPhs
 mN1UgZIQx1qcKfOFmp+OGhkCJwBylVCyco1pCETsKr7/uf1kRbjFkfw99eFixj3qI6fJjMM5Zi3
 74drFg9Ov2iBzeyUnnbVeXrJJ7w6Jk+ZMv9n9k1tkB3VVMuBDYDz72ASCFyt5kzMT7u25i8djaH
 MPspvInBJrYFfluMep98jE8Hyd11vdfjCHsHaeKsIDmYkcv2gy/AsERsALP7ejJqudybFSK6CPX
 gP1ibgMicArOwjw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to UCSI 2.0 specification, the orientation is
part of the connector status payload. So tie up the port
orientation.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Respinning as proper patch.

Changes since RFC:
- Picked-up Hiekki's R-b tag
- Link to v1: https://lore.kernel.org/r/20251015-usb-typec-ucsi-orientation-v1-1-18cd109fb0b7@linaro.org
---
 drivers/usb/typec/ucsi/ucsi.c | 24 ++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3995483a0aa097b822046e819f994164d6183b0d..17439ec434d41d24e8e4c7a97d7e6117fd07d950 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1008,6 +1008,28 @@ static int ucsi_check_connector_capability(struct ucsi_connector *con)
 	return ret;
 }
 
+static void ucsi_orientation(struct ucsi_connector *con)
+{
+	if (con->ucsi->version < UCSI_VERSION_2_0)
+		return;
+
+	if (!UCSI_CONSTAT(con, CONNECTED)) {
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NONE);
+		return;
+	}
+
+	switch (UCSI_CONSTAT(con, ORIENTATION)) {
+	case UCSI_CONSTAT_ORIENTATION_NORMAL:
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_NORMAL);
+		break;
+	case UCSI_CONSTAT_ORIENTATION_REVERSE:
+		typec_set_orientation(con->port, TYPEC_ORIENTATION_REVERSE);
+		break;
+	default:
+		break;
+	}
+}
+
 static void ucsi_pwr_opmode_change(struct ucsi_connector *con)
 {
 	switch (UCSI_CONSTAT(con, PWR_OPMODE)) {
@@ -1258,6 +1280,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		typec_set_pwr_role(con->port, role);
 		ucsi_port_psy_changed(con);
 		ucsi_partner_change(con);
+		ucsi_orientation(con);
 
 		if (UCSI_CONSTAT(con, CONNECTED)) {
 			ucsi_register_partner(con);
@@ -1690,6 +1713,7 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 		typec_set_pwr_role(con->port, UCSI_CONSTAT(con, PWR_DIR));
 		ucsi_register_partner(con);
 		ucsi_pwr_opmode_change(con);
+		ucsi_orientation(con);
 		ucsi_port_psy_changed(con);
 		if (con->ucsi->cap.features & UCSI_CAP_GET_PD_MESSAGE)
 			ucsi_get_partner_identity(con);
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index e301d9012936fb85eaff7f260a862ff099eb77c5..c85175cd001487fa9d66076e608e098d236f5275 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -360,6 +360,9 @@ struct ucsi_cable_property {
 #define   UCSI_CONSTAT_BC_SLOW_CHARGING		2
 #define   UCSI_CONSTAT_BC_TRICKLE_CHARGING	3
 #define UCSI_CONSTAT_PD_VERSION_V1_2		UCSI_DECLARE_BITFIELD_V1_2(70, 16)
+#define UCSI_CONSTAT_ORIENTATION		UCSI_DECLARE_BITFIELD_V2_0(86, 1)
+#define   UCSI_CONSTAT_ORIENTATION_NORMAL	0
+#define   UCSI_CONSTAT_ORIENTATION_REVERSE	1
 #define UCSI_CONSTAT_PWR_READING_READY_V2_1	UCSI_DECLARE_BITFIELD_V2_1(89, 1)
 #define UCSI_CONSTAT_CURRENT_SCALE_V2_1		UCSI_DECLARE_BITFIELD_V2_1(90, 3)
 #define UCSI_CONSTAT_PEAK_CURRENT_V2_1		UCSI_DECLARE_BITFIELD_V2_1(93, 16)

---
base-commit: 13863a59e410cab46d26751941980dc8f088b9b3
change-id: 20251015-usb-typec-ucsi-orientation-75ed0a2c9ff3

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>


