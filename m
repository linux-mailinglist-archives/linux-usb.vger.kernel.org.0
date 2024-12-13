Return-Path: <linux-usb+bounces-18463-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4B79F1A30
	for <lists+linux-usb@lfdr.de>; Sat, 14 Dec 2024 00:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDA717A0561
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2024 23:37:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C004E1EBA1E;
	Fri, 13 Dec 2024 23:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B5QhcAwP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD761DFD9B
	for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 23:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734132962; cv=none; b=GFI8jywE37WQ5ziBwpl/fUEoLiHQP8pSE7a0yMDaAqBWRmJeGMXhfV4m6vTRolWVkKt1pqL/M/HjzGCD4Ey+VAx2fCk22rWBVBzZ4vNNR3GSb946mUGxMYZp3Tsu9v+6IbIR7kVw4R8HUmUBKmOSRK4C7peHm3OpnJCUTJmXfGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734132962; c=relaxed/simple;
	bh=xa7ZITbx/fKw+VP+IHzx4VpDezXjxvTI2S/mn22zsww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iSCtgrkSxZGXwFtC1Tuz81SU1pgxwh6WPHUTaOZ8/467yVMAQwWLfTy/xYl45A3mNn/K1U0b3Y51Jo9D9XupwC/kWXPliM6DXOeVDu0wH4pRBSuEkw+W5SEJij9fcNDTlmjJq3DxrRr2on3BpdcprAnA+Msmw0RCYKQ39ehJfJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=B5QhcAwP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21644aca3a0so27011915ad.3
        for <linux-usb@vger.kernel.org>; Fri, 13 Dec 2024 15:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734132959; x=1734737759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OoXGk9cHKtSOQa4a6C6LkFtb9JQOG5rkseWbgU5QyPQ=;
        b=B5QhcAwPg5jqAYOui85hHiZUYhyVgqb7sIWbEoZNhrXymXXWachWwzDUuOFH2aNrbV
         i+qLl9QZC+RmS5gPo+9JAb2yDS3RF1pzwCp/phBBTCsTqM0rZDbMRzpNXe6dzvXymlcX
         jd4uRnQclj21KmM/2iA4rMT2xgIDJwBlfrqqc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734132959; x=1734737759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OoXGk9cHKtSOQa4a6C6LkFtb9JQOG5rkseWbgU5QyPQ=;
        b=aUHs1abTwvWoQQ58hV/hjb4vDJNTx9EaltSraxc4eAX1B+lpsqX2ISBQ1J/4rdOp4r
         7HBSnAV2qopd6pcXfGqO+P2sLLTFo28b1qIJtJ73uXNH0kZ5pm4NrTPQzlaH68zG8YnR
         caA7UZaVaHeymhYiGIyk/9cOqf074MX1sZeysI+4F/7cf/qiZyUJnbSNSiPgPYmVthBA
         Vqgwy3KwSnqCDfYIS+s+c1l66SeawIMMy9BW1P62eQa0mrPzeEyT8DXhBkH8y9rLb0N5
         EoZH53QDs6TcpX+d/tvdsH2UyBzioo8qduc1tyPtX3V46XTvGPKulz9KdoNVPtx+L1T5
         5hbg==
X-Forwarded-Encrypted: i=1; AJvYcCVaFyXZVvQNpUgl80LuK9p9cbb7FtAzFH3kgrX3ylmwKDBUb9PrpHpX5vT+4iwJo0oB8dC99BcsSUg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwddfrUkBlKYH1Nny9SFudktMP13at7e2whA6RcO6SuE6cBDtBn
	De4jUuRNJ8xVv07yqzEy+2HbpVif+aJ9fDJ/UjTNvhNBKMC0+pDJOmUSj24gmw==
X-Gm-Gg: ASbGncv/eqi0u6nuQ4NqWNLxgdH0DfHfAxzM6ItPqrbrPK6DI9/Amx+U9r/kJ36GMnQ
	3VfEbGyd0jaKpi5p08pNJHMFbeQK0gxn6yMQwnVJhnmvFqNGEd/qHN9sRuebU4Zu1ceiZCtVpB8
	WfblGIjNQtR1d7JuTCo7WZ6+18qNFeSpG76RqEbjpv+Kh3MIuCGbJUy9YoWEfYHJiwwXU96ohab
	B4bbVsW3RHlKwNuWKgCzuL14AOMMUNFmh56uzdpOXHEBS5vP77aeUPwNnOvki2Gkb6dZrX/6NgJ
	RXQJEpOUPP+dW0bzXlpl1dwoC+4d63Y=
X-Google-Smtp-Source: AGHT+IGj8OoR6PcX7JFvEhC3cr+1TepLuESzGZ1SSO6zsYDlRXtgjRP76IUOq4gmFU1odsuAMpqg/A==
X-Received: by 2002:a17:902:e84f:b0:216:1543:196c with SMTP id d9443c01a7336-218929d708bmr57844975ad.27.1734132959517;
        Fri, 13 Dec 2024 15:35:59 -0800 (PST)
Received: from localhost (227.180.227.35.bc.googleusercontent.com. [35.227.180.227])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-218a1e5437asm2896585ad.162.2024.12.13.15.35.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 15:35:59 -0800 (PST)
From: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
To: heikki.krogerus@linux.intel.com,
	tzungbi@kernel.org,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: akuchynski@google.com,
	sboyd@kernel.org,
	pmalani@chromium.org,
	badhri@google.com,
	rdbabiera@google.com,
	dmitry.baryshkov@linaro.org,
	jthies@google.com,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 5/8] platform/chrome: cros_ec_typec: Update partner altmode active
Date: Fri, 13 Dec 2024 15:35:46 -0800
Message-ID: <20241213153543.v5.5.I083bf9188947be8cb7460211cfdf3233370a28f6@changeid>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
In-Reply-To: <20241213233552.451927-1-abhishekpandit@chromium.org>
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
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

Changes in v5:
- Use list_for_each_entry and simplify conditional statement within

 drivers/platform/chrome/cros_ec_typec.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index ae2f86296954..77f748fc8542 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -619,6 +619,7 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 	};
 	struct ec_params_usb_pd_mux_ack mux_ack;
 	enum typec_orientation orientation;
+	struct cros_typec_altmode_node *node;
 	int ret;
 
 	ret = cros_ec_cmd(typec->ec, 0, EC_CMD_USB_PD_MUX_INFO,
@@ -677,6 +678,14 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 			port->mux_flags);
 	}
 
+	/* Iterate all partner alt-modes and set the active alternate mode. */
+	list_for_each_entry(node, &port->partner_mode_list, list) {
+		typec_altmode_update_active(
+			node->amode,
+			port->state.alt &&
+				node->amode->svid == port->state.alt->svid);
+	}
+
 mux_ack:
 	if (!typec->needs_mux_ack)
 		return ret;
-- 
2.47.1.613.gc27f4b7a9f-goog


