Return-Path: <linux-usb+bounces-1625-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C897C97CC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 05:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F23AB20CCA
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 03:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9971C03;
	Sun, 15 Oct 2023 03:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dkrdn8PP"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E801517E1
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 03:58:44 +0000 (UTC)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 203ACDA
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 20:58:42 -0700 (PDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-27d11401561so2669605a91.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 20:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697342321; x=1697947121; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=shh/0TwHJv/d7VwXwypDokr6btLr6DjEH1mcpVIpW4Y=;
        b=Dkrdn8PPycjNl9+oo/M69VPCpl/RIWyeCgx7vfAxSpokgEvCUjBm2LKfiQsqurgITc
         HBeKxcw/HBYQL1HTQagAd2YKc3+IUpLsoY5Ib90lB+6D60hLjitSys1+auNU/7o6H4L6
         K3MLYhBiRSmTadxmY9jJEL448tq/EGEzK2QkDKAwfpIJ+9sJVerXZxD2a27klEzPbGvP
         p84Z8JWlxdLl/cXtlMMKIjdw3Yy4CKns7RxydaXw/2QLGDYJ2JlNJ7QX4NnzfV6+4wsC
         WC+nbZYvI+QujG96fiCYZw2HrVURE15wbE3ecdfSo9+Ai0B3jciPKXmJ/iTU+yKSqc0N
         vK9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697342321; x=1697947121;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=shh/0TwHJv/d7VwXwypDokr6btLr6DjEH1mcpVIpW4Y=;
        b=fPBJhc/0iYfjkwQr8tdvCWGQ732lSRdCuKmMsblPMensC4ILu2+wBN9nFnA2uM2fEE
         xrtuPLKxAmxU37x9d/lRbcs90qgdFMNGOgCfY5EGvpcX7X4PGU+YJ01/soeo7xrLXZsV
         qui0RGyE15HLGg1e89H4//UkLAXoHbsmIRSfwIjTRORCr525eAk5xhWXcpGirj8Z+l1w
         cumdzCUpfEYgrqLsJq3w4fYUKCP1gPhJsrkYBJ2uUH0fEiOg6ctl6ecKv5Ukbegbbr3O
         HJPfNd+OEaQlXals9s03FQONPwXbqYQAn3zR73AFklKzlBiyXOiP2O1GG3wz12NBESwo
         QEnw==
X-Gm-Message-State: AOJu0YzwxZHSa7pmLrIMapXiEX4l76W8YZJVQ5zP0TLJH5xQCm2OIgMU
	AtiG0CAG/7te9zJJXLx0TYGb/TFbdGQ=
X-Google-Smtp-Source: AGHT+IE35cKxw5sBD/mR/Q5zVjNgyUV6uOsgqpFlMr7NvVz4geHj4d2P/SIA/RzrV79Ze0sb1nppTIv/pgo=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a05:6a00:1792:b0:68f:a681:390a with SMTP id
 s18-20020a056a00179200b0068fa681390amr737762pfg.0.1697342321622; Sat, 14 Oct
 2023 20:58:41 -0700 (PDT)
Date: Sun, 15 Oct 2023 03:58:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231015035838.2207567-1-badhri@google.com>
Subject: [PATCH v2] usb: typec: tcpm: Fix sink caps op current check
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rdbabiera@google.com, amitsd@google.com, 
	stable@vger.kernel.org, Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

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
Fixes: 34fde9ec08a3 ("FROMGIT: usb: typec: tcpm: not sink vbus if operational current is 0mA")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
* Fix commit title and description to address comments from Guenter Roeck
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


