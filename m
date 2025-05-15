Return-Path: <linux-usb+bounces-23962-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA31AB7B0B
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 03:40:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C56288C7E3F
	for <lists+linux-usb@lfdr.de>; Thu, 15 May 2025 01:40:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4DBB27A11D;
	Thu, 15 May 2025 01:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mY4yBTIz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B2A279358
	for <linux-usb@vger.kernel.org>; Thu, 15 May 2025 01:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747273212; cv=none; b=enERlGNOkh4vEzUbzoqMd+n05JRiiJFiUEYx4y0yC6F8XWVPi18deZTzlP3L48mRNdV5b2OoLGo3GlkMbmTZyCNeDh2pXpgMzp4QfP6hLNMzBpMTcE58sSjWlfXzaCUHM6odnWcvyf9F+QgZOgYx+fgVp9mfk1LUxgcW3sPsdmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747273212; c=relaxed/simple;
	bh=j3AQqh2bF+a1tTBBmMb6vQqukFWdDH12NEK3gDZ/zHw=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=Q7uaT1HrzKdgXEVopHm1C/cQRO8VlzABiJeHbOShBhiSTSDHJfrlSqKxDw60g9sje0swO32oR0q1TkD1HHjVxzXB24jZYRllGAAHfz/6PazWV76eUaPYrKosN81XNmc1NZwBY/OFBuvr9LBWpSTBmI7tc7NASsXLPhCjPkkeWu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mY4yBTIz; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30aab0f21a3so470804a91.3
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 18:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747273209; x=1747878009; darn=vger.kernel.org;
        h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IakyZJkj7nOlvLL2uNc9irIZAgoOcA1vyttW9qbfPnU=;
        b=mY4yBTIzgZmK5j5zGfnDvG6JQm/gN6JTEo1tXzzkXxZy8vDFMgJp0S9V0JplwDYdgh
         T4Jt3D116pUj+P2fqsBkLLf76tUCi97li2me8oSvwN3cYRwM0pBHF+08U4sWrCUK08DR
         MVBalcLuDWN5kuXObLpRrWrb5UFrfqzmMtVJqHW554zbg7Dsfg2lVP5NmE46TWMoxGpn
         YSEw6+P7scu6QlQOfOnHTuKFxmZFRrxK8PxwRW1KWtZWWZfPRab/ImDge4bQlrIMC/gB
         saASXtqZrDZJfGvI5Hw/VuD4gCsa6MWb4k+rnuBslKRcCzzCLf2URUNQzNgtLnAZ2HXe
         gKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747273209; x=1747878009;
        h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IakyZJkj7nOlvLL2uNc9irIZAgoOcA1vyttW9qbfPnU=;
        b=im+qMgBrtWHVpZ2vrbZdke7GhsyOJs3dcenXKVShQxG373+rEarq9NZ+ddwlCPfnBQ
         aVZogf96NuEL0M5/lPnjyEg2tPyJCdohSwY5U2uBKb0IU1H8oIr78gfzIq2vKFEJ1eWT
         CaaZzg/uZ+JvqyHfH7/MLMv30LcGcct69KbRbKBspY/TuzMlJObphIi61F6MlPDfUwAC
         Ol8fCgM2/fbJ+SG0DBetbmSbPQrO+xXulXflNbywtpKjiQk2nsiDREuNIuEsaIWaNLJV
         Xd/iMLQY9BcFGmvlyWp8ufbct/1OhGr1dzPLDCzXO1We+zyeMHtvPzdVYGlQVNTdXBWI
         Udzw==
X-Forwarded-Encrypted: i=1; AJvYcCWCW5blBj5ey1GyY80v84SGPi1xQFgx3XktxIli0m4PPc64WJ/xeaVUk60dNT928KGTNGtycMuwNb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwunMNL+UZMVAAngv2a+0HHRzJVQ0Egs2leHEWNRLIM49ajTFXB
	SH//YQkjg3VEazfZqR/4pQj2CMT7i0IHLA5Mq0Y5o71S/Ub3gxj6/0uVsdcvPayVnoXRFZb/XIE
	5ITBrCTDsbT46QQ==
X-Google-Smtp-Source: AGHT+IEyLvp3ghttpO9cVp/ndy7EDcY+GfCBT+shK3xrBkQdK1whbMrygpWLNQikJyJ78DDaeVfQrWnuBB9FBDk=
X-Received: from pjbsu3.prod.google.com ([2002:a17:90b:5343:b0:2fc:3022:36b8])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3949:b0:2ea:a9ac:eee1 with SMTP id 98e67ed59e1d1-30e2e5e5a63mr9196895a91.10.1747273209002;
 Wed, 14 May 2025 18:40:09 -0700 (PDT)
Date: Thu, 15 May 2025 01:40:02 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2883; i=rdbabiera@google.com;
 h=from:subject; bh=j3AQqh2bF+a1tTBBmMb6vQqukFWdDH12NEK3gDZ/zHw=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBmqrp+nexnMyP91YvlDq4/t5j/2nvGYyf91ySyXoOzNO
 wrbRPRedZSyMIhxMMiKKbLo+ucZ3LiSumUOZ40xzBxWJpAhDFycAjCR9GqGf+ZF/zoNwq07ZgSm
 T7kyi9fm3pke0cUXr2TuN+VPPdd+VouRYeGMU16hm0Oenr75ZWHY7xdHmLpWdb378D6Jx/ix99t jRzkA
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <20250515014003.1681068-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: tcpm: apply vbus before data bringup in tcpm_src_attach
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

This patch fixes Type-C compliance test TD 4.7.6 - Try.SNK DRP Connect
SNKAS.

tVbusON has a limit of 275ms when entering SRC_ATTACHED. Compliance
testers can interpret the TryWait.Src to Attached.Src transition after
Try.Snk as being in Attached.Src the entire time, so ~170ms is lost
to the debounce timer.

Setting the data role can be a costly operation in host mode, and when
completed after 100ms can cause Type-C compliance test check TD 4.7.5.V.4
to fail.

Turn VBUS on before tcpm_set_roles to meet timing requirement.

Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
Changes since v1:
* Rebased on top of usb-linus for v6.15
---
 drivers/usb/typec/tcpm/tcpm.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 8adf6f954633..05c62a1673af 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4353,16 +4353,6 @@ static int tcpm_src_attach(struct tcpm_port *port)
 
 	tcpm_enable_auto_vbus_discharge(port, true);
 
-	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, tcpm_data_role_for_source(port));
-	if (ret < 0)
-		return ret;
-
-	if (port->pd_supported) {
-		ret = port->tcpc->set_pd_rx(port->tcpc, true);
-		if (ret < 0)
-			goto out_disable_mux;
-	}
-
 	/*
 	 * USB Type-C specification, version 1.2,
 	 * chapter 4.5.2.2.8.1 (Attached.SRC Requirements)
@@ -4372,12 +4362,22 @@ static int tcpm_src_attach(struct tcpm_port *port)
 	    (polarity == TYPEC_POLARITY_CC2 && port->cc1 == TYPEC_CC_RA)) {
 		ret = tcpm_set_vconn(port, true);
 		if (ret < 0)
-			goto out_disable_pd;
+			return ret;
 	}
 
 	ret = tcpm_set_vbus(port, true);
 	if (ret < 0)
 		goto out_disable_vconn;
+	
+	ret = tcpm_set_roles(port, true, TYPEC_SOURCE, tcpm_data_role_for_source(port));
+	if (ret < 0)
+		goto out_disable_vbus;
+
+	if (port->pd_supported) {
+		ret = port->tcpc->set_pd_rx(port->tcpc, true);
+		if (ret < 0)
+			goto out_disable_mux;
+	}
 
 	port->pd_capable = false;
 
@@ -4389,14 +4389,14 @@ static int tcpm_src_attach(struct tcpm_port *port)
 
 	return 0;
 
-out_disable_vconn:
-	tcpm_set_vconn(port, false);
-out_disable_pd:
-	if (port->pd_supported)
-		port->tcpc->set_pd_rx(port->tcpc, false);
 out_disable_mux:
 	tcpm_mux_set(port, TYPEC_STATE_SAFE, USB_ROLE_NONE,
 		     TYPEC_ORIENTATION_NONE);
+out_disable_vbus:
+	tcpm_set_vbus(port, false);
+out_disable_vconn:
+	tcpm_set_vconn(port, false);
+
 	return ret;
 }
 

base-commit: 82f2b0b97b36ee3fcddf0f0780a9a0825d52fec3
-- 
2.49.0.1045.g170613ef41-goog


