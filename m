Return-Path: <linux-usb+bounces-6184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 316B5850025
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 23:39:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 556E21C23393
	for <lists+linux-usb@lfdr.de>; Fri,  9 Feb 2024 22:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BD9339854;
	Fri,  9 Feb 2024 22:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eizT1way"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC95364C0
	for <linux-usb@vger.kernel.org>; Fri,  9 Feb 2024 22:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707518310; cv=none; b=cRGFLiZvauiXhZkdISs8JqcKK4Fwc92eYDcyHp1cQKMwFkTpT0AKLNb6CucZpLuHl7/XzivHJgTRtZU9umPdaUHo+nNAFl9VJv8BEPkTDGtjuFw+l11ai+VJC9jEjFEXXDg+SV7/oHx/BSQ8VC+6tjhv/UPQxVNbHt7ADnzMlmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707518310; c=relaxed/simple;
	bh=DzKLDci93ApF7vfkyDoGWiESzva00+zLX2rytI+hW08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQY530bgw9+9shpDsFvLtmln/+WLOP3F2R9a2/v7MZ+Nv4a7HoiN7fEM6W77T59L+A89LDeOCqJeU/eg4A5OHX6KTvk++Mmz8MVDeHEek6UzJxv/B251TVp9WpJxRKRD71ty87VRGK3loYF2M57OvCck8M3YDFesSesqsUPnRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eizT1way; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6e05b72fd56so948279b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 09 Feb 2024 14:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707518309; x=1708123109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBapnpxnnvVPFmrxNQOjLuxZFVASUjEQpu3IWq7x3K8=;
        b=eizT1wayJEgiA1Aw5lFvJrdDHjByuPs5zrXwNKbIYKGvoMofQtOiyd6Dc19nb4l20s
         wKucOu/RLM0LlPyyDyqgXQkqMHG9Iv9GCvGcvijTL+MkiSViFrWSs6D5Xr2J/egDWMme
         2I8qHBKzT+i7rTNch1WK2gBeClOD1exGurbfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707518309; x=1708123109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBapnpxnnvVPFmrxNQOjLuxZFVASUjEQpu3IWq7x3K8=;
        b=BlsHngmZKVF6fhNMaT5yPB+d5C7upD4HAOErQOTL4GOy/ojCkxImtp7v3bHYEQq7Aj
         O9L/ebJqcl8PklQQo2JVSf7rcITLJBC+OM0ahkMrhCuQOKnvlg//K9Yq7ghV9M0bTnBB
         ckOEBDEiziGzuxvPQ8LWN6WVXrgUbZtcn3Ow+lMxLC2L7x/U2SpMHa4UXg6NsZyg5Fis
         B3JDfQgj3q1tUf5dEDtWxUFICK9JhhSrXA2/YDhCS52aQp9MnmnTDVbdJuCGhyy/s5aL
         agVb37/LH1sY0SZdLxlKAoaKSyFfP8o4STaYq5wwAkS+1DiORyQcDRBVqvsOGT6R0wgA
         DKBA==
X-Forwarded-Encrypted: i=1; AJvYcCX+wRwRA/j3Q5dakuEdL2hxo7GAfQXDGD5CUEgKT4MYfjKhA78Vx0cUhkI5OWotTfWQBUlyY4gDjHColN+pLSDYmDb55zE4nUhs
X-Gm-Message-State: AOJu0YxHYdsNh9gXWY8yp9f12x9AUH03F+foPa5eUX2zyhiAVt1Ca5ip
	ByHw7N56kYca2k7VVoZAkjTA37JoGEOoFBcY68HSBwG3C6gm8S1SItPpoqzvIQ==
X-Google-Smtp-Source: AGHT+IEvUme/lI0pNUHdBSEMYzL+Fi6hlOie5vF+RNSfaYzvZI1P1XoQ0x1souIpQLH0NdS7e3Potw==
X-Received: by 2002:a05:6a00:26ec:b0:6e0:4697:a8f1 with SMTP id p44-20020a056a0026ec00b006e04697a8f1mr712031pfw.11.1707518308710;
        Fri, 09 Feb 2024 14:38:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVp9Dz1zelnFPdV/3pwulYB9UFPGcc96Gc4BNeYpmdH5uHNF11FIH76+41mlIstjpF26M0Kpx//LQPmVs+9d2RXfydqmdpVJOTPTqwsIuMcrlur6AMbmbEUubjEozx/1VfPV6VnTTO57vCdqjkGtbYQFYYodVPE1SX3PeivEsb5dQ5e8ABs7ILsvNw/Aluql5hKw/3f3aWDGdVAF2VIWgvrdHDA0rzOymduuRtBvPqTFt4gCv4puP1SiFsNjz2qwFIZpTQ8vN9BZULIv6G0C7nVW/B9vhdlWYmhLmyh87YhE1qaZzFLxdHu/OjaSapHaad1Gf70nLofL8tZVZHNac08uMglP2N41eHlVfeGfTroRA2Lh+3DpF8uE1g7eyuLm024wXU+0g==
Received: from localhost (209.148.168.34.bc.googleusercontent.com. [34.168.148.209])
        by smtp.gmail.com with UTF8SMTPSA id z3-20020a62d103000000b006e03a64000esm1092546pfg.150.2024.02.09.14.38.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Feb 2024 14:38:28 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org
Cc: pmalani@chromium.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Saranya Gopal <saranya.gopal@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] usb: typec: ucsi: Get PD revision for partner
Date: Fri,  9 Feb 2024 14:37:32 -0800
Message-ID: <20240209143723.v5.3.Idf7d373c3cbb54058403cb951d644f1f09973d15@changeid>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
In-Reply-To: <20240209223824.622869-1-abhishekpandit@chromium.org>
References: <20240209223824.622869-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PD major revision for the port partner is described in
GET_CONNECTOR_CAPABILITY and is only valid on UCSI 2.0 and newer. Update
the pd_revision on the partner if the UCSI version is 2.0 or newer.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Prashant Malani <pmalani@chromium.org>
Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---
$ cat /sys/class/typec/port2-partner/usb_power_delivery_revision
3.0

(no changes since v4)

Changes in v4:
  - Replace IS_MIN_VERSION macro and just compare version directly.

Changes in v2:
  - Formatting changes and update macro to use brackets.
  - Fix incorrect guard condition when checking connector capability.

 drivers/usb/typec/ucsi/ucsi.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 7c5cecdd93d6..ae105383e69e 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -782,6 +782,7 @@ static int ucsi_register_partner(struct ucsi_connector *con)
 	}
 
 	desc.usb_pd = pwr_opmode == UCSI_CONSTAT_PWR_OPMODE_PD;
+	desc.pd_revision = UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags);
 
 	partner = typec_register_partner(con->port, &desc);
 	if (IS_ERR(partner)) {
@@ -856,6 +857,27 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 			con->num, u_role);
 }
 
+static int ucsi_check_connector_capability(struct ucsi_connector *con)
+{
+	u64 command;
+	int ret;
+
+	if (!con->partner || con->ucsi->version < UCSI_VERSION_2_0)
+		return 0;
+
+	command = UCSI_GET_CONNECTOR_CAPABILITY | UCSI_CONNECTOR_NUMBER(con->num);
+	ret = ucsi_send_command(con->ucsi, command, &con->cap, sizeof(con->cap));
+	if (ret < 0) {
+		dev_err(con->ucsi->dev, "GET_CONNECTOR_CAPABILITY failed (%d)\n", ret);
+		return ret;
+	}
+
+	typec_partner_set_pd_revision(con->partner,
+		UCSI_CONCAP_FLAG_PARTNER_PD_MAJOR_REV_AS_BCD(con->cap.flags));
+
+	return ret;
+}
+
 static int ucsi_check_connection(struct ucsi_connector *con)
 {
 	u8 prev_flags = con->status.flags;
@@ -925,6 +947,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 		if (con->status.flags & UCSI_CONSTAT_CONNECTED) {
 			ucsi_register_partner(con);
 			ucsi_partner_task(con, ucsi_check_connection, 1, HZ);
+			ucsi_partner_task(con, ucsi_check_connector_capability, 1, HZ);
 
 			if (UCSI_CONSTAT_PWR_OPMODE(con->status.flags) ==
 			    UCSI_CONSTAT_PWR_OPMODE_PD)
-- 
2.43.0.687.g38aa6559b0-goog


