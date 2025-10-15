Return-Path: <linux-usb+bounces-29331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 71818BDED83
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 15:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB8E73B4836
	for <lists+linux-usb@lfdr.de>; Wed, 15 Oct 2025 13:50:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E730230D35;
	Wed, 15 Oct 2025 13:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HaH2cK4Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF6F215191
	for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 13:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760536251; cv=none; b=I/h4m2bwz+wu+HsEBqlddZVcIeZfbNGLHPDkD9X1/Ji8tIPwamvvMT0RJg4sJo7WMDs8U+TJvT6MhIPZTXB4OUYNPlOxaGbJ+qCSwwd0Dclq9qV2Gh3k65WpXIwoKWAbQh2sotdrq6HDXIg4VUV60zaXRuhpCjEmcQBBlfF+1ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760536251; c=relaxed/simple;
	bh=knT0AgUZx/WJt/TfX3dK506+fZPjXPnwCi0Sfg3XEk0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aWmQWXPuh6sUyQzKrF6BpMJc+zQMnYxbcP8Lx00iZfwTW6f5bPy13O98voRGRJV6JKcX3v6Is7IjpUPfHsfjaYbXrw7FFn6QDoPJNLjo3V/c4wYsk4IQn/bW8NjWzW8FrPSVEfi9HHA2Al8HzReCeUN/OndrB/pRt14uln7d8sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HaH2cK4Y; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee15b5435bso4003960f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 15 Oct 2025 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760536247; x=1761141047; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CtQg60jxxHPLg2XrygVfHHTNwesZOmU2O0EczGZvtRc=;
        b=HaH2cK4Y4jJBti0Sa6EKDsNx78ZZl83PvmH7wIQ/yTafF4FTLexi0PHIwaewfYYOsA
         Af01Nz+r9fTRddtSGGSvcRo34Ec5nQXILerojePkQlo45cBLObyxdRl0HjFd7YzEhB54
         hj28xprCWEiuuj8LdydDFKQ2I/rMhjyQfNVSe10pta23StiKjEZXDOCgVAPxZp+EPUW2
         BiX+8/ZIEBOaf9CT3dazaWDypehzx+uUGzaUK/ct2LZHOh+pKxjyvngfrUlfhueKy1Ga
         BNyAwnwplGlukfc5O31mJFy8vKtvh2JtND83H097/fDsrKlKEPrCYu/K2nGQk8M9Bbvi
         fzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760536247; x=1761141047;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CtQg60jxxHPLg2XrygVfHHTNwesZOmU2O0EczGZvtRc=;
        b=gvQwLJtX1cKQPbZ3T9LnZNBnVs88pS4gZOoFMiumC35M1nfWqP2U8o0bVXUtiHlzdC
         i+Tfw57A6vXpVkwFwEnPj3rtqy0tVxSCqdEzkGNEDp7BzwwyQikMrRyi5+/O+kBGLV4+
         TkaFsIZQIenN4gyJMwUcLdyHuBfFydCRw+ZWHtBj0PY/7GZ6X4Y98m49eYKS8d7IcZNV
         JItSNkHWD1qRgVF3b67oykKxxOPLSSNk5oh/SyLfwtfkh8RmN1s9iqGZeNigCGRrnqH8
         UUh4Tl8hQ9C1HVQ31WYx5s2GMO2MypggXL8SJHpzTNd6ZXKS+dQPsP+SAsL6NRiG0dre
         jrrQ==
X-Gm-Message-State: AOJu0YygXny9B8QOptR+Pv/CzQ938HdLLRDBtaHkkjq6OWNFDrdS6PFZ
	CWh0ooXBzHIA/yKtyw/CSuYwIIVrxkxTLOyWrswZk0yPpCbugJfF8r8zYblcbm5WlVY=
X-Gm-Gg: ASbGncs7MfIl+E8XzLcTP1ZOwpO5yV5zPg/gvSlhAUt2OTuifteDR1Yf1eOQTK/RgPA
	GPV8evo9BDUwYUxehQAiu12yubjSiHGsyGXgri+OkbkebWSqu+5Z7uxpav3xfzb4Z5cpnKkSyYD
	6uPofnmowtX01xB7mDJ6X1G4Dj2/M/HLu+VE5eJak/HuKY27DgEA8d1y0WAIpDw7gw7QyBvOqTF
	dI0RxbyBqgiu+WvkfYeLRxtg6CHD5OwUq4iK8XDT4cHpCuqVNm6zfZeCjnUn+A/DJuOo9RJmKwz
	GgQLSgO3zxNWg3zg1l+rbQ7DVLZ2BWsfA0BKj/LkexHpMw7g+b36UVCEXuoT3dw5Uz1QvSFqZP1
	8Y7x3jdnd5R6OQ+a0WK4n5rC4o5hyIrTzXc8q8wCvkYo=
X-Google-Smtp-Source: AGHT+IET9LWb+g7l3Fho2/XpjW/mb5azVvQakw10RTmxd6GzJmRhbSPq+kNx1ap6c+iHxmjFaZ7rig==
X-Received: by 2002:a05:6000:2085:b0:426:d53a:fbb6 with SMTP id ffacd0b85a97d-426d53afc93mr10252904f8f.31.1760536246782;
        Wed, 15 Oct 2025 06:50:46 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce583335sm28882807f8f.18.2025.10.15.06.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:50:45 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Wed, 15 Oct 2025 16:50:36 +0300
Subject: [PATCH RFC] usb: typec: ucsi: Add support for orientation
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-usb-typec-ucsi-orientation-v1-1-18cd109fb0b7@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKum72gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDA0NT3dLiJN2SyoLUZN3S5OJM3Xyg7rySxBKgNl1z09QUg0SjZMu0NGM
 loAEFRalpmRVgw6OVgtyclWJrawFenFiPcQAAAA==
X-Change-ID: 20251015-usb-typec-ucsi-orientation-75ed0a2c9ff3
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3082; i=abel.vesa@linaro.org;
 h=from:subject:message-id; bh=knT0AgUZx/WJt/TfX3dK506+fZPjXPnwCi0Sfg3XEk0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBo76ay07z4bJL+B6GLZdNrrvquXjltLhL58A5m4
 wdEWin4R7KJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaO+msgAKCRAbX0TJAJUV
 VmG8D/9pmjnhzSmP3MymHz3QutR+WJPD1tUFHKbtALhaqQteoGSS8oPclvfEO/ipMFJ7U0Y3wF6
 aVHTTNRnthGOoR7wT4DbWa+mXvNX+Gv1qyf/aYmbPdJ4uzb8ycnYeruf187VZBuJ4b1S8ZbwvZH
 qZe3dxsgilqQiXVd+NwVaI2n0D1CJdyWUVdU4YKfkELq1DWpUsFgk/kNM20uyXydrOkZUe9J6EX
 gg4UaadH/p9E3xBAM3NkilUIZbmMDUG/7hIZQQFQpckVjQCsjCbKvl3qr5OZeSgrCUio9gWidbT
 V1y/uv1P+mRILNgM1fTYLILkNR238mYAB4k0Z6Fz4JXsnEl66WAh1348zNTWUhXtE+wMMVu80z6
 1898IzLzGitRIa1IFzO7j2RiLSIFBsL33sXwoF9G7MztpK2f6L5PF5T6sSwN54kK+wrSyyz+OVS
 C9Kn/73l72fzOHBmLz1f5M3ExXANfnU8Q63VsIQKTgH5zlNaR0ND1I54IW5RoXiPy8OjaQAVZTt
 scT3LLqaAbVV4hGR0VGhrWURkTJNFzKrZEqZRuAL4nHG+XbczY/1CAVkbJ5JHT1I4sNfvQkylk3
 eGusO7P5GMAeVcDUdzEXufAQahYutRNJo9+CAviVAn0FHuGh2FfdEwq/qmWN7uoINMBiq6w17cy
 6jb1ojWxRRGN9Rw==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE

According to UCSI 2.0 specification, the orientation is
part of the connector status payload. So tie up the port
orientation.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
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


