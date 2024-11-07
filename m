Return-Path: <linux-usb+bounces-17340-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B531F9C0EF2
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 20:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7A75A2841E5
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 19:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CE321832F;
	Thu,  7 Nov 2024 19:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B7qvQ3Pt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B75F2178EC
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731007908; cv=none; b=p+oXQxPCFX4Jf8qofylemqMPX7xQcHyEod0mZu93ZI02tjPnPUL0QVwK/SVkh3f36F4Gqf7wgh8iiNzO2CDvTyf6qjUjSd6u+v6s+vcgmwtpeGqQ2jy6AaKzWQg6xszLmfZW6JQdp8eP3CasMuUj88ew7j1GES79gYy9nid0xPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731007908; c=relaxed/simple;
	bh=F1pTFIC/STStCNqTkG+Kgg/bMEZb3NhFwcrsacG2V4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jx8c5vAyoP/23SsVeU+5gLFDGBHtJ/+WGSFL6ZR8mwDHzyFv1lht18qEkMwUMUthJYg6ZdB8o2U2cFvDUcRgP4E6n1psT4S4NW50Qytt5FsXv7OMH8AbFKb8b3xec8jsU4zpWXITPk5gKILJhD19zeF61iWHGCjm/NjWaJevx6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B7qvQ3Pt; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72061bfec2dso1118611b3a.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Nov 2024 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731007907; x=1731612707; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MHcj0dVpOorLNzt+K3XMiAGRMpCigjM3RXLcIpCRHg4=;
        b=B7qvQ3PtvX9X6yi8e3YvRXZb0AXPDwf3xDOamCQetG0+gOfljQdDbVV+WDzWW1LqtT
         aRAqi95v1LYRbEdM5M1uLw+CKH6pGiO14Pwa3tdar8Dp30Wp1q4DryGCMIgO8eRV2hmp
         vZISuXaUNC+q+oNeziXp8EBdEoQX47Fy2ET9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731007907; x=1731612707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MHcj0dVpOorLNzt+K3XMiAGRMpCigjM3RXLcIpCRHg4=;
        b=m95JkHNJWf49CCvqOqMFxgvYR8dA/nKql4FTlOrySJKg2TSdHycKRl2aLsNCRzeRmw
         DwfGNhb9m5BAE8AfspazNBtdLKF/SuiWBnpDaWaa+l3DbT02EFuwtqL3thqTuQyeLEYt
         kOCYyFlaVT4VnrUU2evoMIpkjUeXSj4+gHNkNroWpaMmvay48Hc1cNSY1Jbl69qhCulg
         k1FmScg55MyXlFUW9ecbSJnpnQTeZcO6sjS3fGxz2kcvHg9NXP4gqwEaw3PwU+JZuy9P
         4obgADWr51qbQD2tFg1u/2bI34TRVJINkRcR8TKXexbWfhYKwTfCRnc9heWxRdNu3BrO
         sTpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzHKb7wU13XMvw3UWekR8IMVdyTZ3pWXewaiGdWe4cLdlwVGoNjfdXtF8cpTKpqx7L1Ulr1KTcx7c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1T83RfB6kK7ZzUeIaoj4UHNJWb/Tb2tq8DgvcLnOcgchpVZrB
	8PYPvHecUJocAYjFFojam64ekSHAnrLEePWf2l+wYRTWuTMQ1we0fXOcm2hZbQ==
X-Google-Smtp-Source: AGHT+IHDevD6Gmfrr4MwmAepRm3599OBUDO0F/CJ4qgD4bU7JNZCnBYFjzrvU6Mh5L/usSA2LFDrWA==
X-Received: by 2002:a05:6a00:1252:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-724132a3730mr313854b3a.7.1731007906775;
        Thu, 07 Nov 2024 11:31:46 -0800 (PST)
Received: from localhost (198.103.247.35.bc.googleusercontent.com. [35.247.103.198])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72407a18e2csm2009358b3a.156.2024.11.07.11.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 11:31:46 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: jthies@google.com,
	akuchynski@google.com,
	pmalani@chromium.org,
	dmitry.baryshkov@linaro.org,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/7] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Thu,  7 Nov 2024 11:29:57 -0800
Message-ID: <20241107112955.v3.4.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
In-Reply-To: <20241107193021.2690050-1-abhishekpandit@chromium.org>
References: <20241107193021.2690050-1-abhishekpandit@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mux configuration is often the final piece of mode entry and can be used
to determine whether a partner altmode is active. When mux configuration
is done, use the active port altmode's SVID to set the partner active
field for all partner alt modes.

Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
---

(no changes since v1)

 drivers/platform/chrome/cros_ec_typec.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index c7781aea0b88..e3eabe5e42ac 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -618,6 +618,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node, *n;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -676,6 +677,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry_safe(node, n, &port->partner_mode_list, list) {
+		if (port->state.alt != NULL &&
+		    node->amode->svid == port->state.alt->svid) {
+			typec_altmode_update_active(node->amode, true);
+		} else {
+			typec_altmode_update_active(node->amode, false);
+		}
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.0.277.g8800431eea-goog


