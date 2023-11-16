Return-Path: <linux-usb+bounces-2915-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6042D7EDCF3
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 09:32:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13633281012
	for <lists+linux-usb@lfdr.de>; Thu, 16 Nov 2023 08:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FE411704;
	Thu, 16 Nov 2023 08:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xz4ssHLT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5E6F19B
	for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 00:32:47 -0800 (PST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-280465be3c9so635756a91.1
        for <linux-usb@vger.kernel.org>; Thu, 16 Nov 2023 00:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700123567; x=1700728367; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=31bn3B5X8I0gch6WfMuHeSex2F8MyGxZRscHzn524C8=;
        b=Xz4ssHLTUhOVFxm8GT+WxnZh2sFM3LwE91GD+RtCGakdgX7qGmpqvhbLAo0dlWnmnU
         HP6uV5kTqR0NwmbtGDm2ZhhPRi5rMyf++bGwn9hATh41ILDdlyQYZtOAMm6h1HWT1d8S
         IEnKoZfoL0ED10jgvlRYZ8q9G1XSC4+Ju89VpgGWGaJm8IcnZzFDKBJe2g+iB06S7LUy
         aWScEL7LOEZ/J85E+8CZQAt53wtsBhs9t9O4oGSd2J3csxjX1LIGm/x5PDmWJcG+8jtf
         5C7TeJyF+toucHvTQ0fw3Spm3mfBxJADAQWx3KGaGfyYXGOlVxkgtbJ1CYrHlqy2Z5DU
         WpGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700123567; x=1700728367;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=31bn3B5X8I0gch6WfMuHeSex2F8MyGxZRscHzn524C8=;
        b=OKWqunlPtvXRKXpU9v5a/eyNYtP+I5wzdBXeBiR2TaCQX/21w90xT3gi8wYcf4jN1W
         O13t3PBKcdxVtPdZoR6loMCWEknd3Z4QhP0ByDwS6som0+6z4hcROmKI5SV5N3xItIfA
         V4i6uJ9m+2CteDiKHnoXilQVgkMn6IPQx1MS+TyOWoMPL6ToBrLMHc+awT0IakwJf6wg
         P/W/v+1sHxm69Nj7EcLgnSWyzletaKVHW19RW4jY4Q38TjrKBkCaTcVxzvoOuhSvGjoy
         mBxT9+p/KWRgEnYAepB4MqBuX9dn6A7pmMP4w6EIISnY1OFnRi8hfLY/n3Gt2cF0ge1f
         MpeA==
X-Gm-Message-State: AOJu0YziaiEjT6iAB82jgSTZ2CeJNHzOglkvb78bLBu8WmgeJuE501l+
	nCFuK9S4EvE3vlXyYE/rDhDY4tZFObGXWcY=
X-Google-Smtp-Source: AGHT+IGF3a0V8XXgRSu/fRueRhaUTO2mo/G8zpcGV7+ayUWSjR7I8sWOE7UrZNwXXcnavubN3aWnRnTKC0SSOOg=
X-Received: from guanyulin-p620linsp01.ntc.corp.google.com ([2401:fa00:fc:202:86b7:16db:b4e1:f67a])
 (user=guanyulin job=sendgmr) by 2002:a17:90b:2d8c:b0:280:32d5:8904 with SMTP
 id sj12-20020a17090b2d8c00b0028032d58904mr287071pjb.1.1700123567158; Thu, 16
 Nov 2023 00:32:47 -0800 (PST)
Date: Thu, 16 Nov 2023 16:32:16 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.43.0.rc0.421.g78406f8d94-goog
Message-ID: <20231116083221.1201892-1-guanyulin@google.com>
Subject: [PATCH] usb: typec: tcpm: skip checking port->send_discover in PD3.0
From: Guan-Yu Lin <guanyulin@google.com>
To: linux@roeck-us.net, heikki.krogerus@linux.intel.com, 
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, badhri@google.com, 
	kyletso@google.com, albertccwang@google.com, 
	Guan-Yu Lin <guanyulin@google.com>
Content-Type: text/plain; charset="UTF-8"

The original Collison Avoidance mechanism, port->send_discover, avoids
the conflict when port partners start AMS almost the same time. However,
this mechanism is replaced by SINK_TX_OK and SINK_TX_NG. Skip the check
in PD3.0 to avoid the deadlock when source is requesting DR_SWAP where
sink is requesting DISCOVER_IDENTITY.

Signed-off-by: Guan-Yu Lin <guanyulin@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 058d5b853b57..ff3c171a3a75 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -2847,7 +2847,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover) {
+			if (port->send_discover && port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -2863,7 +2863,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 					   PD_MSG_CTRL_NOT_SUPP,
 					   NONE_AMS);
 		} else {
-			if (port->send_discover) {
+			if (port->send_discover && port->negotiated_rev < PD_REV30) {
 				tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 				break;
 			}
@@ -2872,7 +2872,7 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 		}
 		break;
 	case PD_CTRL_VCONN_SWAP:
-		if (port->send_discover) {
+		if (port->send_discover && port->negotiated_rev < PD_REV30) {
 			tcpm_queue_message(port, PD_MSG_CTRL_WAIT);
 			break;
 		}
-- 
2.43.0.rc0.421.g78406f8d94-goog


