Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1040330C741
	for <lists+linux-usb@lfdr.de>; Tue,  2 Feb 2021 18:17:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237296AbhBBRPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Feb 2021 12:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235998AbhBBQU7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Feb 2021 11:20:59 -0500
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 946E3C061354
        for <linux-usb@vger.kernel.org>; Tue,  2 Feb 2021 08:17:58 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 11so23556410ybl.21
        for <linux-usb@vger.kernel.org>; Tue, 02 Feb 2021 08:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=G83UMcGfs1JwC6PuJSpXcsaU8cHWlIPK7q/f+Tkx3xA=;
        b=aComoEVKjRKcOCaq27ftruVqnGD0vx0k5c4Q1OZGD51yM7i164oZo1GcPFZ9UmHy66
         /QlUnlp+Wk/AxUW0TXBtIrZRhf5D6GQJgPy4LDkuD928BGVY9R+b3Hjb/0gWCwOF34BY
         dHKQkcrJ4tfPrdKUh0pmvaAaeGifZZgtvhytxH+QQDjvZEYPuAP9yx8CQknv04yKVO7Q
         TwKhipAwhwNOf1aSBnynxJAgJWY8W/GRBC92kBblN2FoAgAa7WFfJLVy/eXH6yiA0i4O
         uvEbHX9MAhDcXhh9RCmQZmy83vlAjdxSq9giXBvhh7E88f38vShXkEDERQyGkffBWYkI
         POLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=G83UMcGfs1JwC6PuJSpXcsaU8cHWlIPK7q/f+Tkx3xA=;
        b=PM1o9o8R9RlehNU8Jgq/wqHwtRNRX04kSX5NcaJJpy5oncXBpwiSroYM3K7hxyem6Y
         Jzf9uernkcQ/DtGBjtQWYMcIcqzzTOTC8EzihW19F6BbTUZE85zKSoebe1IhJonmMjfH
         wwG2GPeKCE+DxgX86CoVb/xaY8WNZBdW75mMER4RFPD13ODivDf3BH2R++dC48h0wx8O
         6i5GuCvi+MVZEKu1UoCoMAzjMHmh21fqndF3iFwFxeNjK02er/ZYidEOo4jH4sixe3BW
         8aQWzgOOBuU6vaAPfOcwwCXTiL8w2j0KQNzGZawzYa8AqyD5aObpf3eTt8S8q2xOMUm1
         3TKQ==
X-Gm-Message-State: AOAM533dSAGPhha5W/B9ycWgGmch/Xnyhz5A7SPLXfVm/MNtFOhzKDqB
        yDtIdEwm8cyO7ASWNTYL+9oXu/bzsya5
X-Google-Smtp-Source: ABdhPJweB8TIL1E3fQ50UJTi69BGSjmN3DLlM0XEklGGqF5SUXa2njgcW92gGBfAMbiGgf0AMHiqB1++rL6q
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:a25:7a44:: with SMTP id
 v65mr34602514ybc.0.1612282677894; Tue, 02 Feb 2021 08:17:57 -0800 (PST)
Date:   Wed,  3 Feb 2021 00:17:30 +0800
In-Reply-To: <20210202161733.932215-1-kyletso@google.com>
Message-Id: <20210202161733.932215-6-kyletso@google.com>
Mime-Version: 1.0
References: <20210202161733.932215-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v5 5/8] usb: typec: ucsi: Detemine common SVDM Version
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
 drivers/usb/typec/ucsi/displayport.c | 12 +++++++++---
 drivers/usb/typec/ucsi/ucsi.c        |  2 ++
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 1d387bddefb9..b58ef26a50e0 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -48,6 +48,7 @@ struct ucsi_dp {
 static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct typec_port *port = dp->con->port;
 	struct ucsi *ucsi = dp->con->ucsi;
 	u64 command;
 	u8 cur = 0;
@@ -83,7 +84,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	 * mode, and letting the alt mode driver continue.
 	 */
 
-	dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, CMD_ENTER_MODE);
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, typec_get_svdm_version(port), CMD_ENTER_MODE);
 	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 
@@ -101,6 +102,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 static int ucsi_displayport_exit(struct typec_altmode *alt)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct typec_port *port = dp->con->port;
 	u64 command;
 	int ret = 0;
 
@@ -120,7 +122,7 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	if (ret < 0)
 		goto out_unlock;
 
-	dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, CMD_EXIT_MODE);
+	dp->header = VDO(USB_TYPEC_DP_SID, 1, typec_get_svdm_version(port), CMD_EXIT_MODE);
 	dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 	dp->header |= VDO_CMDT(CMDT_RSP_ACK);
 
@@ -184,6 +186,7 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 				u32 header, const u32 *data, int count)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
+	struct typec_port *port = dp->con->port;
 	int cmd_type = PD_VDO_CMDT(header);
 	int cmd = PD_VDO_CMD(header);
 
@@ -200,7 +203,10 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 
 	switch (cmd_type) {
 	case CMDT_INIT:
-		dp->header = VDO(USB_TYPEC_DP_SID, 1, SVDM_VER_1_0, cmd);
+		if (PD_VDO_SVDM_VER(header) < typec_get_svdm_version(port))
+			typec_set_svdm_version(port, PD_VDO_SVDM_VER(header));
+
+		dp->header = VDO(USB_TYPEC_DP_SID, 1, typec_get_svdm_version(port), cmd);
 		dp->header |= VDO_OPOS(USB_TYPEC_DP_MODE);
 
 		switch (cmd) {
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index ca3f4194ad90..8c4897a7bf75 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -764,6 +764,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	if (con->status.change & UCSI_CONSTAT_CONNECT_CHANGE) {
 		typec_set_pwr_role(con->port, role);
+		typec_set_svdm_version(con->port, con->typec_cap.svdm_version);
 
 		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
@@ -1052,6 +1053,7 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	cap->revision = ucsi->cap.typec_version;
 	cap->pd_revision = ucsi->cap.pd_version;
+	cap->svdm_version = SVDM_VER_2_0;
 	cap->prefer_role = TYPEC_NO_PREFERRED_ROLE;
 
 	if (con->cap.op_mode & UCSI_CONCAP_OPMODE_AUDIO_ACCESSORY)
-- 
2.30.0.365.g02bc693789-goog

