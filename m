Return-Path: <linux-usb+bounces-1876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A95587CE912
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 22:34:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63C542835EF
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 20:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A728B134BF;
	Wed, 18 Oct 2023 20:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tjTDUDgg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFADD9CA41
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 20:34:52 +0000 (UTC)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA03F115
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 13:34:48 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7bcbb95b2so112089777b3.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697661288; x=1698266088; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GYfskxGvkh052vsvEl3d1awIlELqt+/ddHAW9BMrb5M=;
        b=tjTDUDggaay6pZ8JPWGnkBCMlNApkbCjAUcM95JTuLhhNKnx4jWxVlXdeIZLUrk5CA
         spybpbmeC77+7ZVi8jZEzRAinCS5ZqAEzHiW75KYIcVLyAxXmfJChHm1/Sho/rjyo7UZ
         JFkTSF0ajFt1PecigoRKX5q0NlFhtik1G0P7fv1NVKcyMcRmUlbl0vt+dT/j9clocfxc
         qLICOXY5foAUQyx/HrF8cS0HpSQRDw8oEXlwls7r6Q40dDlfgG3c48ZDIh+hrtF80hgr
         SDVZtJRhJWMyFPaTyEfW97HDtQyPb65V9Wuh3CYaBawU0qAP/YGU7wJ58q43xiiuxwgg
         CGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697661288; x=1698266088;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GYfskxGvkh052vsvEl3d1awIlELqt+/ddHAW9BMrb5M=;
        b=geE1xKeEEs7GZVG/3wIuNvZEYcdZM0KC9rta+HDFBzIeRTyoWNn6x9RC/ittOikebx
         jCxFKCNs3oFSQkQKauKEvH+Gdtsjd1D6aMFrnAHpqvKKXjUh9A9NXRuw6Z2gm1Q3j1QL
         69Mle2bkLJ3HC09V/BMwQ0+u0j8wTi6wd+TduYUWHyiZn5LTu91W9BD0X2sH3KLCagT3
         KRt1L9YUlZSAij8edH7XwpAXeIrTq9HsgqV5I6ox0dCOoHQmvD1jOJkD1doe7fzMor2S
         6GJdLcNnx8MuhSTvArjEntKrMhwWD3cNr5c/1rmUlMnG1t6EAWggZoMK0U/3FVgkY7Gg
         BslA==
X-Gm-Message-State: AOJu0YwWjSxW+yhm9GBgGvRx0sz6JApQ5eaCHJpWLZG5Jn8Sl56Y/3y1
	GAfE6bYAiYyRbYpvkFig9StTQGDraOfeEXI=
X-Google-Smtp-Source: AGHT+IHH9L2XcQrcEnBx+5sYGPq31tgkiNdL4i/MGxTDHxJzWb/KYYrSKiunlxKSpvVOsOx41RQLlhhGwcxpntY=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a81:4948:0:b0:59b:d33b:5ddc with SMTP id
 w69-20020a814948000000b0059bd33b5ddcmr8572ywa.4.1697661287989; Wed, 18 Oct
 2023 13:34:47 -0700 (PDT)
Date: Wed, 18 Oct 2023 20:34:09 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2514; i=rdbabiera@google.com;
 h=from:subject; bh=hbXS4m7M+3a84/Y9ShZ33pG/hhrskV0AxsaMBUHbk7Y=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKkGjg4WTwWm9nz6HvjwYaA023frFi2/Z/w3b1Trlb2Ra
 JgRKnOyo5SFQYyDQVZMkUXXP8/gxpXULXM4a4xh5rAygQxh4OIUgInMfMjwP5Zh0tM4sb/H7jhm
 iGjGq05RTf52o3CJRPDV/wIedq8PHGJkWPMnNezDosTQBc//BmpWrI2uKHjv5rRDJnG3sFSB0qr /XAA=
X-Mailer: git-send-email 2.42.0.655.g421f12c284-goog
Message-ID: <20231018203408.202845-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: altmodes/displayport: verify compatible
 source/sink role combination
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, badhri@google.com, 
	RD Babiera <rdbabiera@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

DisplayPort Alt Mode CTS test 10.3.8 states that both sides of the
connection shall be compatible with one another such that the connection
is not Source to Source or Sink to Sink.

The DisplayPort driver currently checks for a compatible pin configuration
that resolves into a source and sink combination. The CTS test is designed
to send a Discover Modes message that has a compatible pin configuration
but advertises the same port capability as the device; the current check
fails this.

Verify that the port and port partner resolve into a valid source and sink
combination before checking for a compatible pin configuration.

---
Changes since v1:
* Fixed styling errors
* Added DP_CAP_IS_UFP_D and DP_CAP_IS_DFP_D as macros to typec_dp.h
---

Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
Cc: stable@vger.kernel.org
Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/usb/typec/altmodes/displayport.c | 5 +++++
 include/linux/usb/typec_dp.h             | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 718da02036d8..9c17955da570 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -578,6 +578,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 
 	/* FIXME: Port can only be DFP_U. */
 
+	/* Make sure that the port and partner can resolve into source and sink */
+	if (!(DP_CAP_IS_DFP_D(port->vdo) && DP_CAP_IS_UFP_D(alt->vdo)) &&
+	    !(DP_CAP_IS_UFP_D(port->vdo) && DP_CAP_IS_DFP_D(alt->vdo)))
+		return -ENODEV;
+
 	/* Make sure we have compatiple pin configurations */
 	if (!(DP_CAP_PIN_ASSIGN_DFP_D(port->vdo) &
 	      DP_CAP_PIN_ASSIGN_UFP_D(alt->vdo)) &&
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index 1f358098522d..4e6c0479307f 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -67,6 +67,8 @@ enum {
 #define   DP_CAP_UFP_D			1
 #define   DP_CAP_DFP_D			2
 #define   DP_CAP_DFP_D_AND_UFP_D	3
+#define DP_CAP_IS_UFP_D(_cap_)		(!!(DP_CAP_CAPABILITY(_cap_) & DP_CAP_UFP_D))
+#define DP_CAP_IS_DFP_D(_cap_)		(!!(DP_CAP_CAPABILITY(_cap_) & DP_CAP_DFP_D))
 #define DP_CAP_DP_SIGNALLING(_cap_)	(((_cap_) & GENMASK(5, 2)) >> 2)
 #define   DP_CAP_SIGNALLING_HBR3	1
 #define   DP_CAP_SIGNALLING_UHBR10	2

base-commit: 5220d8b04a840fa09434072c866d032b163419e3
-- 
2.42.0.655.g421f12c284-goog


