Return-Path: <linux-usb+bounces-1627-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DAC7C97FB
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 07:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BC2C2B20CDC
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 05:15:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E791C37;
	Sun, 15 Oct 2023 05:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N3HanSpN"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4DEDB
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 05:15:47 +0000 (UTC)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AF27B7
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 22:15:42 -0700 (PDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5896dac4f32so2799380a12.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 22:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697346942; x=1697951742; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TdaEzOTX6ywtIk5zck1LY8j1JHQ8Qsr1vK5cWeNfXMc=;
        b=N3HanSpNBGNxmLQH3LAh2FcJBxee86VOHrOWCjZUsuwukqPNNiJxuIUb4s1cz1obLJ
         FtivQJsGPyvkZollxt/yFS2FTJXjCNROE6/QIWrr1zyeJTIV0fWl73Gdm1uh00BytX1U
         A9MhddtKlLy37VOV76DyXmfEYbkvOTHPQqDqSmfHiS1ZrjeldDah3m9+UBKurXGD8ewW
         djrpNnVCDoIfeuvjV+hkFb+5EF80uZkT9ovQYjwBgxV9gupyTeGLE6EITfInb0YSpIKb
         7vSgXSP8pqkTtwBkQ2OzfzolTZ2OkrSMIR5tx7z46pRejXW/Ld6vB6jkNxUMkzN54DeV
         tDbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697346942; x=1697951742;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TdaEzOTX6ywtIk5zck1LY8j1JHQ8Qsr1vK5cWeNfXMc=;
        b=TAgSpqT6XrF2kUNd6k7ah39s9oEMemtUMCIiSr2HddS/R92/EKpZh9dfTBlkVBsz9I
         7MIFT+4pbbKzmsGRnKmJFVs0aJA+2vfN6wQGEvgSfcXdSZUQeuF2sqYBRpHU3wfbnMLj
         2DyyYrNxhBjVrpsHMn8Ul0JroVMTjoH1Pmb2Fd/gie3FO4diejjlDjMydpKTB5m+pL/V
         Sa9Fu27zf+yTOBU896yHBEOrFGbbQMN1KMchPNsiP1eW7wXDZ3gGNo6uIhGp15gfcNZJ
         JS3+T3gPagZ6ihQq4rkQ9njpf4Yv2F2qHeghvZmxjljTYnAOu4Yw/4XmfsRppiPdBfG7
         Jodw==
X-Gm-Message-State: AOJu0YwC7l8glnh0gSj3oKgZjvMfHUlWBN3eilUWX6NrVCxVHbnGiSkC
	P5oUj1SG9Wh512mj/I9zImxOSMBvzOA=
X-Google-Smtp-Source: AGHT+IG0jy59Rsv7ESphioQunhxw4q/SrMwa5fIMSN14rVK7m4kY8tzaw4ZKdhJgi38niKUcBa/gHCArfMo=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a63:334e:0:b0:58a:a0c:a62 with SMTP id
 z75-20020a63334e000000b0058a0a0c0a62mr472465pgz.9.1697346942053; Sat, 14 Oct
 2023 22:15:42 -0700 (PDT)
Date: Sun, 15 Oct 2023 05:15:38 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231015051538.2344565-1-badhri@google.com>
Subject: [PATCH v1] usb: typec: tcpm: Add additional checks for contaminant
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

When transitioning from SNK_DEBOUNCED to unattached, its worthwhile to
check for contaminant to mitigate wakeups.

```
[81334.219571] Start toggling
[81334.228220] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[81334.305147] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[81334.305162] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
[81334.305187] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
[81334.475515] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[81334.486480] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
[81334.486495] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
[81334.486515] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
[81334.506621] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
[81334.506640] Start toggling
[81334.516972] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[81334.592759] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[81334.592773] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
[81334.592792] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
[81334.762940] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[81334.773557] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
[81334.773570] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
[81334.773588] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
[81334.793672] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
[81334.793681] Start toggling
[81334.801840] CC1: 0 -> 0, CC2: 0 -> 0 [state TOGGLING, polarity 0, disconnected]
[81334.878655] CC1: 0 -> 0, CC2: 0 -> 3 [state TOGGLING, polarity 0, connected]
[81334.878672] state change TOGGLING -> SNK_ATTACH_WAIT [rev3 NONE_AMS]
[81334.878696] pending state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED @ 170 ms [rev3 NONE_AMS]
[81335.048968] state change SNK_ATTACH_WAIT -> SNK_DEBOUNCED [delayed 170 ms]
[81335.060684] CC1: 0 -> 0, CC2: 3 -> 0 [state SNK_DEBOUNCED, polarity 0, disconnected]
[81335.060754] state change SNK_DEBOUNCED -> SNK_DEBOUNCED [rev3 NONE_AMS]
[81335.060775] pending state change SNK_DEBOUNCED -> SNK_UNATTACHED @ 20 ms [rev3 NONE_AMS]
[81335.080884] state change SNK_DEBOUNCED -> SNK_UNATTACHED [delayed 20 ms]
[81335.080900] Start toggling
```

Cc: stable@vger.kernel.org
Fixes: 00bdc7e4e0f56 ("usb: typec: tcpm: Add callbacks to mitigate wakeups due to contaminant")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..3634f9092a84 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3903,7 +3903,9 @@ static void run_state_machine(struct tcpm_port *port)
 		port->potential_contaminant = ((port->enter_state == SRC_ATTACH_WAIT &&
 						port->state == SRC_UNATTACHED) ||
 					       (port->enter_state == SNK_ATTACH_WAIT &&
-						port->state == SNK_UNATTACHED));
+						port->state == SNK_UNATTACHED) ||
+					       (port->enter_state == SNK_DEBOUNCED &&
+					        port->state == SNK_UNATTACHED));
 
 	port->enter_state = port->state;
 	switch (port->state) {

base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
-- 
2.42.0.655.g421f12c284-goog


