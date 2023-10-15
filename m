Return-Path: <linux-usb+bounces-1629-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE717C9807
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 07:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC7CE281A52
	for <lists+linux-usb@lfdr.de>; Sun, 15 Oct 2023 05:31:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD331FAD;
	Sun, 15 Oct 2023 05:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cRE3Sr3+"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE8A1FA1
	for <linux-usb@vger.kernel.org>; Sun, 15 Oct 2023 05:31:14 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29A2EE4
	for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 22:31:13 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a21e8ee1b7so34421817b3.1
        for <linux-usb@vger.kernel.org>; Sat, 14 Oct 2023 22:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697347872; x=1697952672; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DtQNq1gvU7zKIF2fj6mC9r8wogeTbs5S7+1Rv7+FYSI=;
        b=cRE3Sr3+OGdFuWvguBdI5OkXvOUa5OUmqnv1HRzc08keZpseXTEon9fGopA41Kej9u
         1DTwftREYU8G49bl6e+bbdrc6RsrIWIwkAoUOZ16LzvQw64NzJ0q00XhnefI0HTsdYf6
         w7O1QdWTxNQVIGjOy5FaKH5SzmVgAKVvzyu1T33WplM4BWa7vsWFC15C4Ev4w/W1lr37
         jJVCMjdYD1Jg8yfu3k+f9pc8aFcDyE+EE1rMl/k74nT7T+YI06m5+jIDVnlmIC8SvOSN
         v/gmUOKor4Tr2gCS+uo5rbcPkSei7DUSOcPps56uUYT7zpDfFKAhmPZOcXtDxdxyPvFp
         tpjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697347872; x=1697952672;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DtQNq1gvU7zKIF2fj6mC9r8wogeTbs5S7+1Rv7+FYSI=;
        b=P5MrRS1b6m0mB4CBqs6SNuwpJwDrE3DTPX443hmCjVnvav3at0y+2lcEZXJ8bqvpl/
         wYF3onJsm6DFjKO8/Exg1kDS5ebAAbwxKmZV5z8m9rMEGPH+nly67fJUI6VyOT49FG1p
         VtIy2l/fmATkBghp8euWD5BxCRKOvKydl0bLRqhJCbOro41w7UtfRY8M2TlmLwxeXbpx
         iUQUZA5imsfl8n45EjRELoCBdeS4UWw/b5PUb2FYdyJZkFu6aHD+oxP69VaMtPzl4aWA
         3aS+bfDzJCvtm5wYpJm2wa8a4ixm/2DEUttMdphV2zMGj0Kok8+KPAEl2+4zUjuAuksP
         HvpQ==
X-Gm-Message-State: AOJu0Yzke1FMA+ZBwWXJXGVyoNgXuljlHeoNVR4sgaUPZeovJOg1ZNMx
	eFFGvIKMJO9t0urz6iUdVslpJU73jPA=
X-Google-Smtp-Source: AGHT+IGyTMj9xW6ygP/QELMefFgrSubEY2BZNwMNN0MbjEe1WhMGqnMJcu80hthoO2uZPZUq/od869Qq9A8=
X-Received: from badhri.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:6442])
 (user=badhri job=sendgmr) by 2002:a25:aa83:0:b0:d8a:fcdb:d670 with SMTP id
 t3-20020a25aa83000000b00d8afcdbd670mr125664ybi.1.1697347872345; Sat, 14 Oct
 2023 22:31:12 -0700 (PDT)
Date: Sun, 15 Oct 2023 05:31:08 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231015053108.2349570-1-badhri@google.com>
Subject: [PATCH v2] usb: typec: tcpm: Add additional checks for contaminant
From: Badhri Jagan Sridharan <badhri@google.com>
To: gregkh@linuxfoundation.org, linux@roeck-us.net, 
	heikki.krogerus@linux.intel.com
Cc: kyletso@google.com, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Badhri Jagan Sridharan <badhri@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=unavailable
	autolearn_force=no version=3.4.6
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
Fixes: 599f008c257d ("usb: typec: tcpm: Add callbacks to mitigate wakeups due to contaminant")
Signed-off-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 6e843c511b85..1c7e8dc5282d 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -3903,6 +3903,8 @@ static void run_state_machine(struct tcpm_port *port)
 		port->potential_contaminant = ((port->enter_state == SRC_ATTACH_WAIT &&
 						port->state == SRC_UNATTACHED) ||
 					       (port->enter_state == SNK_ATTACH_WAIT &&
+						port->state == SNK_UNATTACHED) ||
+					       (port->enter_state == SNK_DEBOUNCED &&
 						port->state == SNK_UNATTACHED));
 
 	port->enter_state = port->state;

base-commit: 1034cc423f1b4a7a9a56d310ca980fcd2753e11d
-- 
2.42.0.655.g421f12c284-goog


