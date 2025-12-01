Return-Path: <linux-usb+bounces-31067-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BEDC97428
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 13:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D4EB934436C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 12:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2D330BF6E;
	Mon,  1 Dec 2025 12:26:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="N24/OuYs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F4030EF7A
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764591990; cv=none; b=rGOnKEoViJjPNYPUHFKMSwj7LcnEMfZpQC5ExRY6WobnJkP4yesHs5ZsOUgr1M/wLXBihwn1Kf1qujszR07gABuibrtsbVNvTRgrie84U2WR/wVvS+S/HndPL1GRMmAX3psZMXynC1WK7z7t8+V4WaPySE52P7e9zegeVt18GQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764591990; c=relaxed/simple;
	bh=fqrnPd4WduD46/XBBnyXBF4b8D6EY+CUvKdyAZAiwiY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TfFJsCEIvTVi1s3wn+0rucEp09ExMatVpvFaDQuVU1DcCdDZZDbG66gKcAXrG+vY00uyNFNRz+T2qDkbrtpkQmtfgJ9zYNfr905GF9h7hv3GwIEfJDanJGqUxQuO2hhjeir6Pfp6sqP5I3VGjuYyzhJmzNI5CKdg7skB6QLPvoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=N24/OuYs; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-640bd9039fbso510458a12.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Dec 2025 04:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1764591985; x=1765196785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8OH98ZYDJQZtNnl6fPGXU4bT8ZiUExlrTHFtG0JJc9Y=;
        b=N24/OuYsxvTnt0grSgvy/892SMM2pdrlfYW+21nkOn631MFZ8p4YBfiKibskb4sshg
         gqhpy1ZWmARgPD0g/cesbYbTN0kI6AWrI2rWYc+Icy3gMwwBNyMTZbwFjExqebsuOP5/
         Xbqy95rKD27WvB0XyYnMAsfv+fFDCrcp+2WoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591985; x=1765196785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8OH98ZYDJQZtNnl6fPGXU4bT8ZiUExlrTHFtG0JJc9Y=;
        b=rW3XRlUZYLXlvODRR1qHqyTwij4aM1gKtX/awjTJHajMHDIceJpofhVlcXzif5TTuC
         W++kwpl7mMsQ0DemOJyMJ8LwIeD022kE7jpYEmer3vofuAM608te+FddbF+1eoFXaWMV
         J7uGgRDmOnby58+fU++XHDMEkZC8KsJOIKA21uaLLdwZXDEsDRizKfVI7h66/gPfIS/7
         ZOPnFK76Xp0gph29eq3luDHQUmKpZHGXFAfRmG956sTiTJ1FSYWcFJdoJKFuxGsWyfnb
         zDYc0HI0tZekabQHh2qKNlkJW3UnP4ArWpjiJO498kGLDJjkAfvCEXQ9cAFD4RHDgXMm
         EIEg==
X-Forwarded-Encrypted: i=1; AJvYcCVVkMd4ZZwsLiY6W7De5ACQMethr6qv3N8V5PV5etdObmTDF1x73dcFX/XQxnQutef+ixQYBRl+iMk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq/IPf4IeuMK00Oa2F+9m99QUNKelNe+WcouipNvltJmoETXkF
	w69wblr3+cM9nbbt6+d6mOGIXyrZ97HPanoRNFtbLAUORPLVuzc4a7wJOCUAJ/Kg7g==
X-Gm-Gg: ASbGnct+uYg19/Vegm7GmlTE0fx9wWeX9DEVdkydPWS9AKIP7zMeTQVo/BDaB42ozDM
	8dg/sXxvje57jvKtL2zJTpPC6JYWJJNfMxPhZYfWWhcackpbe5ZFnu2TEq4rLCqLSLPuFndsn2p
	dA2PVHVEL7hKqjcPr14OzdlwgtOkUJN3KqSFm/VSUpUuXft0Oe7pw2AX5l8IlgN6sWBDsUysoVE
	0jIJfS0ghobFu9UrFVArLy+ETAuHnwaA2HPrlz3uDVf/6eM8R3QnYUpvpveRHuovPaoG6svaz5a
	X7kb0GI5hXRyuzURRW8uRuBoYNHgVkcpZLAaQJrEEyoOmlMnWtSSYqPmlBf3Sui5DLzMiW7yc9O
	BgMsUK5QdAjL8T21PoyQx2Tic4XUihkdP5AxPIn78edAVKxWA60BQKXHzuwil9nick2QkZbQZn2
	FAKOaNHeSfECFXWfuVeZCQ35BVCkfCsUtjPyW+dL974jVtunfUPK/TbmUAVVVCFft9PYkatd4uo
	NE0eEJ9dAw=
X-Google-Smtp-Source: AGHT+IGnKQdr5PepexfByhiK/VHIvgqI+kwxEyqKKnfjEsKm61/OkPzj8RjDbEc+U2QIWtElauJeDw==
X-Received: by 2002:a17:907:940e:b0:b74:352d:6dc1 with SMTP id a640c23a62f3a-b7671695438mr3121812966b.28.1764591985193;
        Mon, 01 Dec 2025 04:26:25 -0800 (PST)
Received: from akuchynski.c.googlers.com.com (218.127.147.34.bc.googleusercontent.com. [34.147.127.218])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e331sm1229049266b.24.2025.12.01.04.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 04:26:24 -0800 (PST)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	Abel Vesa <abel.vesa@linaro.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Pavan Holla <pholla@chromium.org>,
	Madhu M <madhu.m@intel.com>,
	Venkat Jayaraman <venkat.jayaraman@intel.com>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH RFC 6/8] usb: typec: ucsi: Implement enter_usb_mode operation
Date: Mon,  1 Dec 2025 12:26:02 +0000
Message-ID: <20251201122604.1268071-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.52.0.158.g65b55ccf14-goog
In-Reply-To: <20251201122604.1268071-1-akuchynski@chromium.org>
References: <20251201122604.1268071-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`enter_usb_mode` uses the SET_USB UCSI command to manage USB modes such as
USB3, and USB4 for current and future connections.
It allows port drivers and user-space applications (via the "usb_mode"
partner attribute) to enable and disable USB modes on a connector.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 22 ++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ee96c42e9e27..3d4c277bcd49 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1624,7 +1624,29 @@ static int ucsi_pr_swap(struct typec_port *port, enum typec_role role)
 	return ret;
 }
 
+static int ucsi_enter_usb_mode(struct typec_port *port, enum usb_mode mode)
+{
+	struct ucsi_connector *con = typec_get_drvdata(port);
+	u64 command;
+	int ret;
+
+	command = UCSI_SET_USB | UCSI_CONNECTOR_NUMBER(con->num);
+	if (mode == USB_MODE_USB3)
+		command |= UCSI_USB3_ENABLE;
+	else if (mode == USB_MODE_USB4)
+		command |= UCSI_USB4_ENABLE;
+
+	if (!ucsi_con_mutex_lock(con))
+		return -ENOTCONN;
+	con->ucsi->message_in_size = 0;
+	ret = ucsi_send_command(con->ucsi, command);
+	ucsi_con_mutex_unlock(con);
+
+	return ret;
+}
+
 static const struct typec_operations ucsi_ops = {
+	.enter_usb_mode = ucsi_enter_usb_mode,
 	.dr_set = ucsi_dr_swap,
 	.pr_set = ucsi_pr_swap
 };
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 6e77bdbdaeae..a5ef35d9dce5 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -219,6 +219,9 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define   UCSI_GET_PD_MESSAGE_TYPE_IDENTITY	4
 #define   UCSI_GET_PD_MESSAGE_TYPE_REVISION	5
 
+/* SET_USB command bits */
+#define UCSI_USB3_ENABLE		((u64)1 << 23)
+#define UCSI_USB4_ENABLE		((u64)1 << 24)
 /* -------------------------------------------------------------------------- */
 
 /* Error information returned by PPM in response to GET_ERROR_STATUS command. */
-- 
2.52.0.158.g65b55ccf14-goog


