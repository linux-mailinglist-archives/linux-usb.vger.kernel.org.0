Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BEA93103B6
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 04:38:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231181AbhBEDg4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 4 Feb 2021 22:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbhBEDg1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 4 Feb 2021 22:36:27 -0500
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com [IPv6:2607:f8b0:4864:20::84a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8120DC061222
        for <linux-usb@vger.kernel.org>; Thu,  4 Feb 2021 19:34:41 -0800 (PST)
Received: by mail-qt1-x84a.google.com with SMTP id d1so4216691qtp.11
        for <linux-usb@vger.kernel.org>; Thu, 04 Feb 2021 19:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=sender:date:in-reply-to:message-id:mime-version:references:subject
         :from:to:cc;
        bh=mEd4FTkoIBVEm4F+2S7f9RkcZv4AxQI1AwgNCprZwuk=;
        b=vEetQxmQz8ho7HXn1xdXwOPHDHA/cRRYB/U5tVoa2W57Vpu+KFdA/ELfbMuqk9WPm8
         jDn7yWu30yg73aDCBBYCcT8V/bChvPuI3K10Y8OE3u8Fx5nxJ+QjOqncwiGRzSOFmCec
         N+PmoDS2KP6jl01qq2nDWS4J7hG70y1AF+Rew+mR3ZcNVEZtAI3z4MDBtkc7vIfTLvZ5
         5YVS01uOKXNV84ZmOZ+tJMMpf0tOcJjtz3UV4RwxiEGTZlN/uBtsQHDM47jIOqFldAib
         f7P4Gue3lshUQ0f1z73B3GEDzfkb0URo1/bxJtrKUmSZvSZKMP97ixRRdNlKJ5FqxUF4
         MOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=mEd4FTkoIBVEm4F+2S7f9RkcZv4AxQI1AwgNCprZwuk=;
        b=PaXWCjeyV9J6PZTNlb3ySWDi2Cj4N3wYyz9kMPEQLsqjyoV0PlKIN7rOXBL3fTOLQr
         OD2UEr/U7EuIg+IpuU7fQIzJzliK14yTBRnF33RmhFrivA/Pzmo6fqu9xPI1rKPGm241
         Jal69Kl70O8zlklKsSVSn4PtHZtWPGyHTWXfkaXgOXROTkOZN4vMhqP7TIXKlaU2/CEH
         Tis30Pwz0t4LP0/+hwE30LtsO/md6bo2U/l5nYFJBu/Q6jyue+dfBqCgoj2wtxDOLdad
         O9Y7mEdMYGOe3xeKErA6dL//mpsMe3p1Vz7qFcUYMA0++irRzwd4Z2ZPnAvK69LytZdv
         mH1A==
X-Gm-Message-State: AOAM533IdFbIMF+V6TNWeKRD6kcR4V6hvjgpcPrjm09CHlSSSspkPltU
        O4sgGq1QUPXGf5fxMcFB+zNtBxvg5tlF
X-Google-Smtp-Source: ABdhPJymMyffcfDrxC34DHJwSAMAyoUcX6YhpeZ+Cy+HdNdWFhhB+q1RJrugDpxUY2CNHqICKkaMP011aAQJ
Sender: "kyletso via sendgmr" <kyletso@kyletso.ntc.corp.google.com>
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:dd94:c753:a81d:c855])
 (user=kyletso job=sendgmr) by 2002:ad4:4f41:: with SMTP id
 eu1mr2526004qvb.34.1612496080440; Thu, 04 Feb 2021 19:34:40 -0800 (PST)
Date:   Fri,  5 Feb 2021 11:34:13 +0800
In-Reply-To: <20210205033415.3320439-1-kyletso@google.com>
Message-Id: <20210205033415.3320439-6-kyletso@google.com>
Mime-Version: 1.0
References: <20210205033415.3320439-1-kyletso@google.com>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
Subject: [PATCH v6 5/7] usb: typec: displayport: Fill the negotiated SVDM
 Version in the header
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

VDM header now requires SVDM Version. Get it from typec_partner.

Signed-off-by: Kyle Tso <kyletso@google.com>
---
Changes since v5:
- follow the changes of "usb: typec: Manage SVDM version"

 drivers/usb/typec/altmodes/displayport.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 0abc3121238f..b7f094435b00 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -15,8 +15,8 @@
 #include <linux/usb/typec_dp.h>
 #include "displayport.h"
 
-#define DP_HEADER(_dp, cmd)		(VDO((_dp)->alt->svid, 1, SVDM_VER_1_0, cmd) | \
-					 VDO_OPOS(USB_TYPEC_DP_MODE))
+#define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
+					 | VDO_OPOS(USB_TYPEC_DP_MODE))
 
 enum {
 	DP_CONF_USB,
@@ -156,9 +156,14 @@ static int dp_altmode_configured(struct dp_altmode *dp)
 
 static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 {
-	u32 header = DP_HEADER(dp, DP_CMD_CONFIGURE);
+	int svdm_version = typec_altmode_get_svdm_version(dp->alt);
+	u32 header;
 	int ret;
 
+	if (svdm_version < 0)
+		return svdm_version;
+
+	header = DP_HEADER(dp, svdm_version, DP_CMD_CONFIGURE);
 	ret = typec_altmode_notify(dp->alt, TYPEC_STATE_SAFE, &dp->data);
 	if (ret) {
 		dev_err(&dp->alt->dev,
@@ -181,6 +186,7 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 static void dp_altmode_work(struct work_struct *work)
 {
 	struct dp_altmode *dp = container_of(work, struct dp_altmode, work);
+	int svdm_version;
 	u32 header;
 	u32 vdo;
 	int ret;
@@ -194,7 +200,10 @@ static void dp_altmode_work(struct work_struct *work)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
 	case DP_STATE_UPDATE:
-		header = DP_HEADER(dp, DP_CMD_STATUS_UPDATE);
+		svdm_version = typec_altmode_get_svdm_version(dp->alt);
+		if (svdm_version < 0)
+			break;
+		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
 		if (ret)
-- 
2.30.0.365.g02bc693789-goog

