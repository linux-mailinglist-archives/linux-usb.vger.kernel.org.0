Return-Path: <linux-usb+bounces-2414-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1147DDA9B
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 02:28:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2772D2818DD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 01:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FFA7FE;
	Wed,  1 Nov 2023 01:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cBl+Hb5H"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E0E65F
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 01:28:51 +0000 (UTC)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A52E2F4
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 18:28:49 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-da0631f977bso6557857276.2
        for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 18:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698802129; x=1699406929; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VxjREVhKIwNUHPrTEbniLZS6ji7rcCI9L7LUymPl9mk=;
        b=cBl+Hb5H45g1Zs6aUOl/J0Z6Xf2sgzRwQ/ZCiOqF8NtuAId5Syl15yUc1yhXsZ7v69
         nRS9vVfLU4Ziu/YQaa6koE9UAGFXA7Zw/0jUF/4bHmhADxwYMn7c7iX50FBxVPaA9lEt
         9cTz+o/zgktS99MB2oxMDE3Op6XZENrCYemmJp1wqCjfnuQLS5PovYg4oVCLdDHyl6vE
         Ys8yUu57Bd2X70uwsGw9UHDks/MukaAtcbvhI6glrPExwaSLhhLnSncM0BVz4QDxU1Cs
         1TdqH70uy2YjCzUMr0NOtfJXIMAFwGOX6VmDWNkLQQlzVIj/1wj2c0NPTZNjxvmqT4dC
         7C8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698802129; x=1699406929;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VxjREVhKIwNUHPrTEbniLZS6ji7rcCI9L7LUymPl9mk=;
        b=WAK8mNjLkmMEp6v6z+a/dpUGUAq4aWU9e/QcprzQZCwX+YGDb722eB9ZMabbmMT6vB
         G3nSb2ubAeXJCOtN+r52EnAoquNFi4fff0TBdN863q9bjjpAcK59xMgEn88SAnJna/DA
         18V5+cZEGNFp+Nkk2Cs4A+Wg2PFS6JqrqgPAekel1Khxntr62F4L+jcVPCGUYkH12VcT
         R1W44+ZA2eieyvuhM0t/4lN6CH6O5YIhC/gG2HMRjA59sdAFGCsmUY123UStHaaujBSd
         dJL4oqr6Y0HOUyEPuAZ+hDKIZ8XCoVSswc3R8uL44hnMinc/4R0j/u0WrpY+0mQwiXuo
         q4Mw==
X-Gm-Message-State: AOJu0Yw4FPzd9gEaSehI0Od3h3qA8Orw/4T0vJG6MiQNRbP00+QyKOLq
	EEnMNAIvgfWQ7lbqnCgEX2UTAasrHf8=
X-Google-Smtp-Source: AGHT+IH2G54HVEVIYbn3qEM7Uh8KXF5UOjbqJ1LWEr//qTninScBLtbinVdR0me/FhTzFqgkkOQXirVVsvg=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a25:5c2:0:b0:d9a:68de:16a1 with SMTP id
 185-20020a2505c2000000b00d9a68de16a1mr276149ybf.0.1698802128834; Tue, 31 Oct
 2023 18:28:48 -0700 (PDT)
Date: Wed,  1 Nov 2023 01:28:45 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231101012845.2701348-1-badhri@google.com>
Subject: [PATCH v3] usb: typec: tcpm: Fix sink caps op current check
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"

TCPM checks for sink caps operational current even when PD is disabled.
This incorrectly sets tcpm_set_charge() when PD is disabled.
Check for sink caps only when PD is enabled.

[   97.572342] Start toggling
[   97.578949] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[   99.571648] CC1: 0 -> 0, CC2: 0 -> 4 [state TOGGLING, polarity 0, connected]
[   99.571658] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
[   99.571673] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
[   99.741778] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[   99.789283] CC1: 0 -> 0, CC2: 4 -> 5 [state SNK_DEBOUNCED, polarity 0, connected]
[   99.789306] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
[   99.903584] VBUS on
[   99.903591] state change SNK_DEBOUNCED -> SNK_ATTACHED [rev3 NONE_AMS]
[   99.903600] polarity 1
[   99.910155] enable vbus discharge ret:0
[   99.910160] Requesting mux state 1, usb-role 2, orientation 2
[   99.946791] state change SNK_ATTACHED -> SNK_STARTUP [rev3 NONE_AMS]
[   99.946798] state change SNK_STARTUP -> SNK_DISCOVERY [rev3 NONE_AMS]
[   99.946800] Setting voltage/current limit 5000 mV 500 mA
[   99.946803] vbus=0 charge:=1
[  100.027139] state change SNK_DISCOVERY -> SNK_READY [rev3 NONE_AMS]
[  100.027145] Setting voltage/current limit 5000 mV 3000 mA
[  100.466830] VBUS on

Cc: stable@vger.kernel.org
Fixes: 803b1c8a0cea ("usb: typec: tcpm: not sink vbus if operational current is 0mA")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v2:
* Fix the "Fixes" tag
* Refactor code based on Guenter Roeck's suggestion.

Changes since v1:
* Fix commit title and description to address comments from Guenter Roeck
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 058d5b853b57..afc791ab6d4f 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4273,7 +4273,8 @@ static void run_state_machine(struct tcpm_port *port)
 				current_lim = PD_P_SNK_STDBY_MW / 5;
 			tcpm_set_current_limit(port, current_lim, 5000);
 			/* Not sink vbus if operational current is 0mA */
-			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
+			tcpm_set_charge(port, !port->pd_supported ||
+					pdo_max_current(port->snk_pdo[0]));
 
 			if (!port->pd_supported)
 				tcpm_set_state(port, SNK_READY, 0);

base-commit: c70793fb7632a153862ee9060e6d48131469a29c
-- 
2.42.0.820.g83a721a137-goog


