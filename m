Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CB263103AA
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 04:38:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbhBEDgF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 22:36:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230310AbhBEDfs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 22:35:48 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 901EAC06121C
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 19:34:37 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 134so5513627ybd.3
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 19:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=xuvEAsN0KJISBabHE8c3n6+McmR97NEy/0CVQ5vlPQ4=;
        b=CsqviQQyFwW4Z1uvUOPhG27GfeCYOnKmmQ+WjrzLmHuIlkt8EKMKztqNSwPe+vv6zO
         +A3qS4SD7u8QrVSM8QX9RgA14jdG1bzwFr7+z+hzCn/kK3KNIiz2J4F6rV+RSsi0ycWO
         mG7i1uLBXEE9C9Q75sJWR7UFYLKjLcuMbt718L6UR0QS85F0YjA4Nl+BNPlDUbPyCz9H
         E6rVYOyTqjG3ZxhpJrEstSSrqBNRvOzA1vmbeqbzwTn7K5Bz3NZUzwv9auojzDeK8Ivo
         RSbG7j0LxhllhSWSmbBBxBLRJX2W4X/kCF7l34rgbpkJprlyXVqtqaQ7hTOEUo/EiPfo
         lFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=xuvEAsN0KJISBabHE8c3n6+McmR97NEy/0CVQ5vlPQ4=;
        b=j6gnQrNav60d0t+mmzsN72IVDgwa7TOje6fqrbuxmY5UPF/lASfaMU9HM30XHABrgB
         mMstyAdCvwQMTDk06/AoECOZpWYXacwv4o63j9XMREvhOjLmVjRTJiekqq9C201NeV64
         W6olQULQPZZ1ssELdiZdOqXwkmp4/Gt3x6+NG3/ajFhbPc/SeGN2M1xJBn26P/tSqjVN
         wSPxILtLQFkdV4b0p+w7Iy+cvvoZ0b2jDc1qgFZa0hRH1CHmKn4rrWKwEYZBJepr3veY
         wGgI/iyRlDlitZMf5jY1xtumDUUitSsxYnOVfAHVsXnutcT7ZQ4dX7SJo8Lx7YRexh+K
         TzBQ==
X-Gm-Message-State: AOAM5333nbduCx8KNjCTL9FWM4rW0QLinkic9kqVpNTOAywMCQavxU6F
        1MRz+c/qcJv7lgraQiQPZGVJnYHL8lZY
X-Google-Smtp-Source: ABdhPJzULV/+zRPxBov/nxkHQO0y5QiaXlpjbXsH6n3H1RK027a128DtuYyTVSd04vY/mplHhOmBSy2AolbQ
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a25:d186:: with SMTP id
 i128mr3646941ybg.46.1612496076879; Thu, 04 Feb 2021 19:34:36 -0800 (PST)
Date:   Fri,  5 Feb 2021 11:34:12 +0800
In-Reply-To: <20210205033415.3320439-1-kyletso@google.com>
Message-Id: <20210205033415.3320439-5-kyletso@google.com>
Mime-Version: 1.0
References: <20210205033415.3320439-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v6 4/7] usb: typec: ucsi: Determine common SVDM Version
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org, hdegoede@redhat.com, robh+dt@kernel.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This patch implements the following requirement in the Spec.

PD Spec Revision 3.0 Version 2.0 + ECNs 2020-12-10
  6.4.4.2.3 Structured VDM Version
  "The Structured VDM Version field of the Discover Identity Command
  sent and received during VDM discovery Shall be used to determine the
  lowest common Structured VDM Version supported by the Port Partners or
  Cable Plug and Shall continue to operate using this Specification
  Revision until they are Detached."

Signed-off-by: Kyle Tso <kyletso@google.com>
---
Changes since v5:
- follow the changes of "usb: typec: Manage SVDM version"
- remove the "reset to default". Now the default SVDM version will be
  set when calling to typec_register_partner

 drivers/usb/typec/ucsi/displayport.c | 32 +++++++++++++++++++++++++---
 drivers/usb/typec/ucsi/ucsi.c        |  1 +
 2 files changed, 30 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 1d387bddefb9..73cd5bf35047 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -49,6 +49,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	struct ucsi *ucsi = dp->con->ucsi;
+	int svdm_version;
 	u64 command;
 	u8 cur = 0;
 	int ret;
@@ -83,7 +84,13 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	 * mode, and letting the alt mode driver continue.
 	 */
 
-	dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, CMD_ENTER_MODE);
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0) {
+		ret = svdm_version;
+		goto err_unlock;
+	}
+
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, svdm_version, CMD_ENTER_MODE);
 	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 
@@ -101,6 +108,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 static int ucsi_displayport_exit(struct typec_altmode *alt)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	int svdm_version;
 	u64 command;
 	int ret = 0;
 
@@ -120,7 +128,13 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	if (ret < 0)
 		goto out_unlock;
 
-	dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, CMD_EXIT_MODE);
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0) {
+		ret = svdm_version;
+		goto out_unlock;
+	}
+
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, svdm_version, CMD_EXIT_MODE);
 	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 
@@ -186,6 +200,7 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	int cmd_type = PD_VDO_CMDT(header);
 	int cmd = PD_VDO_CMD(header);
+	int svdm_version;
 
 	mutex_lock(&dp->con->lock);
 
@@ -198,9 +213,20 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 		return -EOPNOTSUPP;
 	}
 
+	svdm_version = typec_altmode_get_svdm_version(alt);
+	if (svdm_version < 0) {
+		mutex_unlock(&dp->con->lock);
+		return svdm_version;
+	}
+
 	switch (cmd_type) {
 	case CMDT_INIT:
-		dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, cmd);
+		if (PD_VDO_SVDM_VER(header) < svdm_version) {
+			typec_partner_set_svdm_version(dp->con->partner, PD_VDO_SVDM_VER(header));
+			svdm_version = PD_VDO_SVDM_VER(header);
+		}
+
+		dp->header = VDO(USB_TYPEC_DP_SID, 1, svdm_version, cmd);
 		dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 
 		switch (cmd) {
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ca3f4194ad90..244270755ae6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1052,6 +1052,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	cap->revision = ucsi->cap.typec_version;
 	cap->pd_revision = ucsi->cap.pd_version;
+	cap->svdm_version = SVDM_VER_2_0;
 	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
 
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
-- 
2.30.0.365.g02bc693789-goog

