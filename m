Return-Path: <linux-usb+bounces-1610-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B7E7C9277
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 05:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F0A8282EDF
	for <lists+linux-usb@lfdr.de>; Sat, 14 Oct 2023 03:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 642EB15C9;
	Sat, 14 Oct 2023 03:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1+NygvOf"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5ACEA9
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 03:17:17 +0000 (UTC)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B043C0
	for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 20:17:14 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5a4cec94094so1339051a12.1
        for <linux-usb@vger.kernel.org>; Fri, 13 Oct 2023 20:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697253434; x=1697858234; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Cygcl9PmHTIW27CQufR8VhIxisSzXoKQWoi0Hf3IAWI=;
        b=1+NygvOfJg0W+zLTPqNITbFbaF0LwuY/no3E4jZrvj42scbKwP8v/wRlGsN8whgJhl
         YpvE+XaxV7oCRdj0bgW82bkeQo5Yj+c7q/l2kAw6ip8DaKVYq7Ji2urlfx7KFSiBX4KD
         z8/TGwvqSvCpSLegYmyOEWuVkrOLAojUg0bzC5T3sohfwgCttqQcZnfe09usLik2O/kV
         SZKi0oeRKLIs0XJFF8NtmvPrT2HZZ9ddbbsiLlYCPATumnHtV/FYc0D0ihjh3CvpDWtD
         Z594fVrNZzGu+EzIV8A9WpmXZQViyXOEDuTAmxkF9Zjz60Dve8GOG6EA/LxGZq/q7Lbm
         4C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697253434; x=1697858234;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cygcl9PmHTIW27CQufR8VhIxisSzXoKQWoi0Hf3IAWI=;
        b=tRhYHToAY8qBugQ4P/fE+QqQpIrDE+jV2yZHe7emAQO05yTKBTY7qMxDMoO6tWtGrx
         +g6CPRm6cI52giXfGVLsAg/K72S3PQq9bsInL7zi8PLvNTCiaFxE81vas6dMdwioM+wy
         3KTGAURWp5e5CzbeJelaKtZhpZaczrPTSNSvy8uyKu7wCLrU60xOWltR3OrH+TTJ2J1t
         Qvg/ev3ZMPppwcIk8v1cy8WrxX4VW65HVolIarK/w/g96cejsbwze7iBMhPKSnDDZYqS
         twTdzwumSdmn8sT/FnZ6zXY8zaf1iMze5S8XtkyB7kWiza7c6ho8XwcajKnyjP5BSrn8
         IzJA==
X-Gm-Message-State: AOJu0YxCLYrgmodxkwAotbTFibeOvnK3JBjYyIbYpt+C7bRf8R/j6heg
	aROIwOyafyrJTv6E3F10pzXR71ADCgw=
X-Google-Smtp-Source: AGHT+IGr78g2jXoouBJder6syoTwtrbmWyiVJWo80raBkuAFBVoRCBxKZJB0snIcYs+zarooC8jRwRH9JCw=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a65:6697:0:b0:5ab:7d1d:3322 with SMTP id
 b23-20020a656697000000b005ab7d1d3322mr90269pgw.9.1697253433887; Fri, 13 Oct
 2023 20:17:13 -0700 (PDT)
Date: Sat, 14 Oct 2023 03:17:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231014031709.1900370-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Check for sink pdp op current only for pd
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

TCPM checks for sink caps operational current even when PD is disabled.
This incorrectly sets tcpm_set_charge() when PD is disabled.
Check for sink caps only when PD is disabled.

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
Fixes: 34fde9ec08a3 ("FROMGIT: usb: typec: tcpm: not sink vbus if operational current is 0mA")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..994493481c24 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -4268,7 +4268,8 @@ static void run_state_machine(struct tcpm_port *port)
 				current_lim = PD_P_SNK_STDBY_MW / 5;
 			tcpm_set_current_limit(port, current_lim, 5000);
 			/* Not sink vbus if operational current is 0mA */
-			tcpm_set_charge(port, !!pdo_max_current(port->snk_pdo[0]));
+			tcpm_set_charge(port, port->pd_supported ?
+					!!pdo_max_current(port->snk_pdo[0]) : true);
 
 			if (!port->pd_supported)
 				tcpm_set_state(port, SNK_READY, 0);

base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
-- 
2.42.0.655.g421f12c284-goog


