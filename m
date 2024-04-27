Return-Path: <linux-usb+bounces-9858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B90678B47CF
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 22:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6ECE3281B9B
	for <lists+linux-usb@lfdr.de>; Sat, 27 Apr 2024 20:18:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6169D3B289;
	Sat, 27 Apr 2024 20:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vVvMa4jD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7D55B1E3
	for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 20:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714249113; cv=none; b=lLPgLybBY8fPh3vkD2p6vfWnIzAyTrlGmiYjgHr7/UuCqaVoEqeL3RCkpA69dWibd/PttPyyZrFnGoii7DSqtP9v/zoB5PzjpRn9pzXJa65y6CzCQ/zo2WCh3VWfpLHTVz2XoEyOaEKuv83PzlIAjh5LiRZdEM35TpOMieUABrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714249113; c=relaxed/simple;
	bh=vGS2/u89PF7/otpUQK90Oz1lFEXoU6UBuU6k8KnR/Dk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=hejGDvUzzKgJNRduVE1KSllsyGeh4zlgD0KevQp2a8BpTNxQ4OKx7lZv5XN/sSB25rWXw2D9Uf8xp6vW6nERwT3Ra0njcHMjHMtspYW9i28RL8TnLUG/gl4OzgOIzNQh7wDq/3YeULQjLOmFRvMwT5JEYVEHpJYYo8krtv+73VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vVvMa4jD; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--badhri.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2a2dbaacff8so3698197a91.2
        for <linux-usb@vger.kernel.org>; Sat, 27 Apr 2024 13:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714249112; x=1714853912; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sfa5YDgyksbNRIIlp+y0lds34H3yK+b5QDjrM8ldPCA=;
        b=vVvMa4jDm68HTet+WeoKgylr1uOIqCQaFsDFvaoPstpfBRooqPFwBHreFsnUcgI2E0
         55G+lnxsKIQUNwAiahF6+N7RNfYId9e1Dtz6CVQSa7qB/jpdqLZ5fcamAloggEs/0Nmo
         ev5MGEVG4S8m7WykMLkhE+tOVzUaohDq4xCmq3R70yATfBj+oDuFH+MRy//zF0YtTMyH
         oBqRCPnMdqV65K1mX0pnK7G2UUL+2ZIwakaqtYjmJBWZ+WW6WcBVYC65YY9w4T1oTgIa
         PGm7j77hyTuavpIabpppjbQwzawCDxbiFN+Qh94XI+FxDHgN3pnZ3e2uMif5vga3Af+8
         L7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714249112; x=1714853912;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sfa5YDgyksbNRIIlp+y0lds34H3yK+b5QDjrM8ldPCA=;
        b=KBkNqXA2O7poDM+eOaGM+06T9l3iEjTxZojVWe70dT2HPVVKff4oH+DDyoJ3RjOH46
         IwsCDTDvE/8XuXFaAiqr22ojoTbHYGlUXh/hQ3w+uTK/jSnUqDxnSR0EN9BoBLqHH1ZX
         +WQmxnZhDr6/MHtwF3BFi0UKkqROj6huC4H+hfnjyz4PLcp6gz6V7YF/XByAbH73tu1g
         eTYJ8FpWXFdLsHXbzNwDRdU+XmY+p/AC0mkHpl2UDkpBa/Fw0J5jCd0YinNxIRo/Ohf6
         fTdqQVNMtzM34yDseDasBnxViqGRGznWHWNibJDwQRxSo75BJXhUUDZCB5ikp5p++3xu
         e1ag==
X-Forwarded-Encrypted: i=1; AJvYcCUv2e1LA+eofboFCyqB14b3Mx7yvaDPH+oCi2ZjymZPkVf/j9oX59BCiIv9JBLr93Yp6CQdyHx7aAs1wTtOyUwzUHSKKqUYCFLx
X-Gm-Message-State: AOJu0Yz0lD6lNAn4bwyWj6FiYnGXgdNdqNt+h3Q9XN2bJwWfc6aF1XhG
	zvu9xG6S11sp0qEL1RO9Ra79/0G2YRdFQGUchv33XjlbYQBbK3pIrlrc2kclSGcd8LuR65wxuFl
	6Rw==
X-Google-Smtp-Source: AGHT+IHHerC52i4r2e7c6erHYCeB0Yloh7vqJTnA/5Zl+bo8JD/bDpT2hdm45YNwxTACMr8F4lILDrdYMno=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a17:90b:3652:b0:2a7:82a8:2ac0 with SMTP id
 nh18-20020a17090b365200b002a782a82ac0mr20041pjb.1.1714249111787; Sat, 27 Apr
 2024 13:18:31 -0700 (PDT)
Date: Sat, 27 Apr 2024 20:18:28 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240427201828.3432713-1-badhri@google.com>
Subject: [PATCH v2] usb: typec: tcpm: Check for port partner validity before
 consuming it
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, frank.wang@rock-chips.com, broonie@kernel.org, 
	dmitry.baryshkov@linaro.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"

typec_register_partner() does not guarantee partner registration
to always succeed. In the event of failure, port->partner is set
to the error value or NULL. Given that port->partner validity is
not checked, this results in the following crash:

Unable to handle kernel NULL pointer dereference at virtual address 00000000000003c0
 pc : run_state_machine+0x1bc8/0x1c08
 lr : run_state_machine+0x1b90/0x1c08
..
 Call trace:
   run_state_machine+0x1bc8/0x1c08
   tcpm_state_machine_work+0x94/0xe4
   kthread_worker_fn+0x118/0x328
   kthread+0x1d0/0x23c
   ret_from_fork+0x10/0x20

To prevent the crash, check for port->partner validity before
derefencing it in all the call sites.

Cc: stable@vger.kernel.org
Fixes: c97cd0b4b54e ("usb: typec: tcpm: set initial svdm version based on pd revision")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ab6ed6111ed0..454165776797 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4,7 +4,6 @@
  *
  * USB Power Delivery protocol stack.
  */
-
 #include <linux/completion.h>
 #include <linux/debugfs.h>
 #include <linux/device.h>
@@ -1580,7 +1579,8 @@ static void svdm_consume_identity(struct tcpm_port *port, const u32 *p, int cnt)
 	port->partner_ident.cert_stat = p[VDO_INDEX_CSTAT];
 	port->partner_ident.product = product;
 
-	typec_partner_set_identity(port->partner);
+	if (port->partner)
+		typec_partner_set_identity(port->partner);
 
 	tcpm_log(port, "Identity: %04x:%04x.%04x",
 		 PD_IDH_VID(vdo),
@@ -1742,6 +1742,9 @@ static void tcpm_register_partner_altmodes(struct tcpm_port *port)
 	struct typec_altmode *altmode;
 	int i;
 
+	if (!port->partner)
+		return;
+
 	for (i = 0; i < modep->altmodes; i++) {
 		altmode = typec_partner_register_altmode(port->partner,
 						&modep->altmode_desc[i]);
@@ -4231,7 +4234,10 @@ static int tcpm_init_vconn(struct tcpm_port *port)
 
 static void tcpm_typec_connect(struct tcpm_port *port)
 {
+	struct typec_partner *partner;
+
 	if (!port->connected) {
+		port->connected = true;
 		/* Make sure we don't report stale identity information */
 		memset(&port->partner_ident, 0, sizeof(port->partner_ident));
 		port->partner_desc.usb_pd = port->pd_capable;
@@ -4241,9 +4247,13 @@ static void tcpm_typec_connect(struct tcpm_port *port)
 			port->partner_desc.accessory = TYPEC_ACCESSORY_AUDIO;
 		else
 			port->partner_desc.accessory = TYPEC_ACCESSORY_NONE;
-		port->partner = typec_register_partner(port->typec_port,
-						       &port->partner_desc);
-		port->connected = true;
+		partner = typec_register_partner(port->typec_port, &port->partner_desc);
+		if (IS_ERR(partner)) {
+			dev_err(port->dev, "Failed to register partner (%ld)\n", PTR_ERR(partner));
+			return;
+		}
+
+		port->partner = partner;
 		typec_partner_set_usb_power_delivery(port->partner, port->partner_pd);
 	}
 }
@@ -4323,9 +4333,11 @@ static void tcpm_typec_disconnect(struct tcpm_port *port)
 	port->plug_prime = NULL;
 	port->cable = NULL;
 	if (port->connected) {
-		typec_partner_set_usb_power_delivery(port->partner, NULL);
-		typec_unregister_partner(port->partner);
-		port->partner = NULL;
+		if (port->partner) {
+			typec_partner_set_usb_power_delivery(port->partner, NULL);
+			typec_unregister_partner(port->partner);
+			port->partner = NULL;
+		}
 		port->connected = false;
 	}
 }
@@ -4549,6 +4561,9 @@ static enum typec_cc_status tcpm_pwr_opmode_to_rp(enum typec_pwr_opmode opmode)
 
 static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
 {
+	if (!port->partner)
+		return;
+
 	switch (port->negotiated_rev) {
 	case PD_REV30:
 		break;

base-commit: 3f12222a4bebeb13ce06ddecc1610ad32fa835dd
-- 
2.44.0.769.g3c40516874-goog


