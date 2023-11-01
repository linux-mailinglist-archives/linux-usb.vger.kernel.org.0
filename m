Return-Path: <linux-usb+bounces-2416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B087DDAE6
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 03:19:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 092FA281943
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 02:19:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC28AED5;
	Wed,  1 Nov 2023 02:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QiAXIgx8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312FEA6
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 02:19:15 +0000 (UTC)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 544F6BD
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 19:19:14 -0700 (PDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5b62a669d61so4708511a12.1
        for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 19:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698805154; x=1699409954; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YxMLCnvrWc25EU4H4xs2rJSBgkcEn2A7t+6WriOcpdA=;
        b=QiAXIgx8BWbe7hw4awJHYl6/U2/l+ROHgBNVlkSD30Gb99uEQ2bdhkO7MLWQEXNa00
         BJfdVKe0AtA7YwbxV0K2HbYcpv78wL3V/VcJ4je2dLWmactBdkwYkQBQLqtn6Lz7em9s
         b1PH7UJ45SUSJ6Ye0qIVs7RMy3XFVrH+s7Kt7WTcQr6+ZL/W6ClFkvDc3CeEh7l6TkY3
         L2uOQBbvqt/Hkm8QEtKc/uhoSpZK1L9EmezEJEU9Nb5PLJzURJ4v9nt2492zptkbYdwI
         YNnplLVJQLIl5ifpfIqdEk5h4B88y4E9jyhfsPl8XJtcVKlb43lPaAbH+GNsuHou+dG7
         THtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698805154; x=1699409954;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YxMLCnvrWc25EU4H4xs2rJSBgkcEn2A7t+6WriOcpdA=;
        b=Jq1xO8djhRXj26hFjKT2AUK0/RK71srcIHESSUOJ55F8n2Y9aJdCSaTP6K7DdCzj7s
         C43AI1rSwDZ2BSKLm6F7TDvU/2sZP+rK2smAHUMFU5Vxs+adEae3+ToM7u0Go53yO7Ms
         nN7em/RGse2uvGZP6T7KunU2eo6/MGOZ4+1eYiE5u3Bnr4Gui5/t6zkPm9v6DIdXdaPJ
         GhdlFuUEzMyT1l2nYNNh2+se4bmQw4wsOMbZHw1UxIDCVBZSWSz5s9IYZ13AQvYO320j
         OV+52sxR6lr7sJ+Jg3wbxYIeILOcbP9IsBmGpeSMB1kB8/WTKt15MF4u9rul7JTaPiYG
         C6Gw==
X-Gm-Message-State: AOJu0YxoJVBLVqDr5rW6qzEtPPqY+8lqiiImOmSg0T+3hq6cpNFldsP1
	agRzG2mg4onGUtsnHAAWxzWXyK9t5Ro=
X-Google-Smtp-Source: AGHT+IG12wBNMJ1P0/BdAkR/0ARm+Dw/pyRIRjaikGvugugX+UjkePUEUplt1JoJ//05fozTbly+stJq0Ow=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a63:344b:0:b0:5a9:fb7b:7f1d with SMTP id
 b72-20020a63344b000000b005a9fb7b7f1dmr255710pga.0.1698805153730; Tue, 31 Oct
 2023 19:19:13 -0700 (PDT)
Date: Wed,  1 Nov 2023 02:19:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231101021909.2962679-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Skip hard reset when in error recovery
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"

Hard reset queued prior to error recovery (or) received during
error recovery will make TCPM to prematurely exit error recovery
sequence. Ignore hard resets received during error recovery (or)
port reset sequence.

```
[46505.459688] state change SNK_READY -> ERROR_RECOVERY [rev3 NONE_AMS]
[46505.459706] state change ERROR_RECOVERY -> PORT_RESET [rev3 NONE_AMS]
[46505.460433] disable vbus discharge ret:0
[46505.461226] Setting usb_comm capable false
[46505.467244] Setting voltage/current limit 0 mV 0 mA
[46505.467262] polarity 0
[46505.470695] Requesting mux state 0, usb-role 0, orientation 0
[46505.475621] cc:=0
[46505.476012] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev3 NONE_AMS]
[46505.476020] Received hard reset
[46505.476024] state change PORT_RESET -> HARD_RESET_START [rev3 HARD_RESET]
```

Cc: stable@vger.kernel.org
Fixes: f0690a25a140 ("staging: typec: USB Type-C Port Manager (tcpm)")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 058d5b853b57..b386102f7a3a 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -5391,6 +5391,15 @@ static void _tcpm_pd_hard_reset(struct tcpm_port *port)
 	if (port->bist_request == BDO_MODE_TESTDATA && port->tcpc->set_bist_data)
 		port->tcpc->set_bist_data(port->tcpc, false);
 
+	switch (port->state) {
+	case ERROR_RECOVERY:
+	case PORT_RESET:
+	case PORT_RESET_WAIT_OFF:
+		return;
+	default:
+		break;
+	}
+
 	if (port->ams != NONE_AMS)
 		port->ams = NONE_AMS;
 	if (port->hard_reset_count < PD_N_HARD_RESET_COUNT)

base-commit: c70793fb7632a153862ee9060e6d48131469a29c
-- 
2.42.0.820.g83a721a137-goog


