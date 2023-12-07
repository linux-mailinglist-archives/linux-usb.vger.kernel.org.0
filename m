Return-Path: <linux-usb+bounces-3811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 919A58083CF
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59CE1C21F27
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D659132C64;
	Thu,  7 Dec 2023 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1kq/U8ow"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D89D53
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:08:00 -0800 (PST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5d3bdbf1fb5so6100347b3.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701940079; x=1702544879; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IlwDNRF0jV105tsk3ywp0IxXP2QGZQspw7+2aSCQaIs=;
        b=1kq/U8owp4nheMbZQxXpxRt5JbLN0eG5qvfbCjftEraaRoKPsZisDdBKyqeAbqKBjx
         jXY+18ItAMvxcXeU/oRTt2e5yAGS6Uo/taUONZJsrFjRlFWruqzN1F2W1PI/omXoGZFU
         DmtM34ZM4ch7GGn6cjxnF0h9R9mJsUB/fpWnST2Ricmkph6EqHcq1dhaYZA9GEE3GmcA
         XqJoxNK6ly1JIWUiEHTBZHT8IxiS2PmLIcAeiXWpn87GETZCGqQtu/Eu0FjyMuzdOQqc
         KLMkIXVcj5kMhAcuHPmuWnnB+HQYvB5kDgLmM/cJnMr6Q5ZmiywzhYxedr/jjd8dGbVM
         cGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701940079; x=1702544879;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IlwDNRF0jV105tsk3ywp0IxXP2QGZQspw7+2aSCQaIs=;
        b=lOwiEIl9ofeK/ODqm9H2P+waK54YjOs8CxdBLL9IxF0ousSN5eCsfQXpg4XKhQOD7b
         CXibeOpcLDR3FUZVibmSkHL/fnkZFxn3dyHDn112/MiUCosAmL4f6kLGGyos/d6xYJD3
         bTON4lUReW4XMA6aok945nP4J+ukC9dAz1hBE2aFtUBoxpr5C49i0aj1NcGBCwsvX4VO
         4NF6AEXBPDZSlygOekTrPrr+gU19O47G5uzpEtjwGQ3nXt24bA0PZVLyDOw4fX+ZJkKu
         8ObkajcfOr4ya9nliQsmDeLeNu3nPWLfVuOnzJjGT/OY+F/3NiXommABn7HoPXpnziK7
         4T8Q==
X-Gm-Message-State: AOJu0Ywq7/8DY648QGligc4QTvoq5AiPwqOr0uc0GvulIOEQukxVe5Im
	EBJTPPs8wJlF7zILiKqxCUEbVUGwjx63QRY=
X-Google-Smtp-Source: AGHT+IHZEEQjZoEnOBsKzlP2Auy7Gh6l/teur99y5GR9ePRQwA0i3osCNMscCbr1fquiC9fxvx+zjW2/SXsp3/g=
X-Received: from rdbabiera.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:18a8])
 (user=rdbabiera job=sendgmr) by 2002:a81:fe09:0:b0:5cb:1bf4:ce09 with SMTP id
 j9-20020a81fe09000000b005cb1bf4ce09mr34135ywn.2.1701940079525; Thu, 07 Dec
 2023 01:07:59 -0800 (PST)
Date: Thu,  7 Dec 2023 09:07:32 +0000
In-Reply-To: <20231207090738.15721-12-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20231207090738.15721-12-rdbabiera@google.com>
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=15225; i=rdbabiera@google.com;
 h=from:subject; bh=3vbCFGH2UJtseAJZxfRyPH6azfTtU2voKWoUAVpBJZg=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDKmF3VGH8jbHqwQa2s0vbXhgynlZ+z//5tOc+t9W7pXyv
 TIx7vycjlIWBjEOBlkxRRZd/zyDG1dSt8zhrDGGmcPKBDKEgYtTACayYDXDfw+xuZfn32j9pXxG
 r+FScGDajbupBt0/pommNEyYvEVQdxrDP+vWusb18ap3TT8+dvRav2ljFRfbD8mQG01rD5Rybre 6wg4A
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
Message-ID: <20231207090738.15721-13-rdbabiera@google.com>
Subject: [PATCH v1 01/10] usb: typec: bus: provide transmit type for alternate
 mode drivers
From: RD Babiera <rdbabiera@google.com>
To: heikki.krogerus@linux.intel.com, linux@roeck-us.net, 
	gregkh@linuxfoundation.org, pmalani@chromium.org, bleung@chromium.org, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Cc: badhri@google.com, tzungbi@kernel.org, utkarsh.h.patel@intel.com, 
	andriy.shevchenko@linux.intel.com, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"

Add enum tcpm_altmode_transmit_type that Alternate Mode drivers can use
to communicate which SOP type to send a SVDM on to the tcpm, and that the
tcpm can use to communicate a received SVDM' SOP type to the Alternate Mode
drivers.

Update all typec_altmode_ops users to use tcpm_altmode_transmit_type, and
drop all messages that are not TYPEC_ALTMODE_SOP. Default all calls that
require sop_type as input to TYPEC_ALTMODE_SOP.

Signed-off-by: RD Babiera <rdbabiera@google.com>
---
 drivers/platform/chrome/cros_typec_vdm.c | 12 +++++++++--
 drivers/usb/typec/altmodes/displayport.c | 15 +++++++-------
 drivers/usb/typec/bus.c                  | 17 ++++++++++------
 drivers/usb/typec/class.c                |  2 +-
 drivers/usb/typec/tcpm/tcpm.c            | 15 ++++++++------
 drivers/usb/typec/ucsi/displayport.c     | 18 +++++++++++++---
 include/linux/usb/typec_altmode.h        | 26 ++++++++++++++++++------
 7 files changed, 74 insertions(+), 31 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_vdm.c b/drivers/platform/chrome/cros_typec_vdm.c
index 3f632fd35000..ff33e5305866 100644
--- a/drivers/platform/chrome/cros_typec_vdm.c
+++ b/drivers/platform/chrome/cros_typec_vdm.c
@@ -92,7 +92,8 @@ void cros_typec_handle_vdm_response(struct cros_typec_data *typec, int port_num)
 			svid, port_num);
 }
 
-static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
+static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo,
+				       enum typec_altmode_transmit_type sop_type)
 {
 	struct cros_typec_port *port = typec_altmode_get_drvdata(amode);
 	struct ec_params_typec_control req = {
@@ -102,6 +103,9 @@ static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
 	struct typec_vdm_req vdm_req = {};
 	u32 hdr;
 
+	if (sop_type != TYPEC_ALTMODE_SOP)
+		return 0;
+
 	hdr = VDO(amode->svid, 1, SVDM_VER_2_0, CMD_ENTER_MODE);
 	hdr |= VDO_OPOS(amode->mode);
 
@@ -118,7 +122,8 @@ static int cros_typec_port_amode_enter(struct typec_altmode *amode, u32 *vdo)
 }
 
 static int cros_typec_port_amode_vdm(struct typec_altmode *amode, const u32 hdr,
-				     const u32 *vdo, int cnt)
+				     const u32 *vdo, int cnt,
+				     enum typec_altmode_transmit_type sop_type)
 {
 	struct cros_typec_port *port = typec_altmode_get_drvdata(amode);
 	struct ec_params_typec_control req = {
@@ -128,6 +133,9 @@ static int cros_typec_port_amode_vdm(struct typec_altmode *amode, const u32 hdr,
 	struct typec_vdm_req vdm_req = {};
 	int i;
 
+	if (sop_type != TYPEC_ALTMODE_SOP)
+		return 0;
+
 	vdm_req.vdm_data[0] = hdr;
 	vdm_req.vdm_data_objects = cnt;
 	for (i = 1; i < cnt; i++)
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index f81bec0c7b86..5ed470069c3e 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -202,7 +202,7 @@ static int dp_altmode_configure_vdm(struct dp_altmode *dp, u32 conf)
 		return ret;
 	}
 
-	ret = typec_altmode_vdm(dp->alt, header, &conf, 2);
+	ret = typec_altmode_vdm(dp->alt, header, &conf, 2, TYPEC_ALTMODE_SOP);
 	if (ret)
 		dp_altmode_notify(dp);
 
@@ -221,7 +221,7 @@ static void dp_altmode_work(struct work_struct *work)
 
 	switch (dp->state) {
 	case DP_STATE_ENTER:
-		ret = typec_altmode_enter(dp->alt, NULL);
+		ret = typec_altmode_enter(dp->alt, NULL, TYPEC_ALTMODE_SOP);
 		if (ret && ret != -EBUSY)
 			dev_err(&dp->alt->dev, "failed to enter mode\n");
 		break;
@@ -231,7 +231,7 @@ static void dp_altmode_work(struct work_struct *work)
 			break;
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
-		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
+		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2, TYPEC_ALTMODE_SOP);
 		if (ret)
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
@@ -244,7 +244,7 @@ static void dp_altmode_work(struct work_struct *work)
 				"unable to send Configure command (%d)\n", ret);
 		break;
 	case DP_STATE_EXIT:
-		if (typec_altmode_exit(dp->alt))
+		if (typec_altmode_exit(dp->alt, TYPEC_ALTMODE_SOP))
 			dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
 		break;
 	default:
@@ -283,7 +283,8 @@ static void dp_altmode_attention(struct typec_altmode *alt, const u32 vdo)
 }
 
 static int dp_altmode_vdm(struct typec_altmode *alt,
-			  const u32 hdr, const u32 *vdo, int count)
+			  const u32 hdr, const u32 *vdo, int count,
+			  enum typec_altmode_transmit_type sop_type)
 {
 	struct dp_altmode *dp = typec_altmode_get_drvdata(alt);
 	int cmd_type = PD_VDO_CMDT(hdr);
@@ -350,8 +351,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 static int dp_altmode_activate(struct typec_altmode *alt, int activate)
 {
-	return activate ? typec_altmode_enter(alt, NULL) :
-			  typec_altmode_exit(alt);
+	return activate ? typec_altmode_enter(alt, NULL, TYPEC_ALTMODE_SOP) :
+			  typec_altmode_exit(alt, TYPEC_ALTMODE_SOP);
 }
 
 static const struct typec_altmode_ops dp_altmode_ops = {
diff --git a/drivers/usb/typec/bus.c b/drivers/usb/typec/bus.c
index e95ec7e382bb..c9c6e55bed9b 100644
--- a/drivers/usb/typec/bus.c
+++ b/drivers/usb/typec/bus.c
@@ -117,13 +117,15 @@ EXPORT_SYMBOL_GPL(typec_altmode_notify);
  * typec_altmode_enter - Enter Mode
  * @adev: The alternate mode
  * @vdo: VDO for the Enter Mode command
+ * @sop_type: SOP* target for the Enter Mode command
  *
  * The alternate mode drivers use this function to enter mode. The port drivers
  * use this to inform the alternate mode drivers that the partner has initiated
  * Enter Mode command. If the alternate mode does not require VDO, @vdo must be
  * NULL.
  */
-int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
+int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo,
+			enum typec_altmode_transmit_type sop_type)
 {
 	struct altmode *partner = to_altmode(adev)->partner;
 	struct typec_altmode *pdev = &partner->adev;
@@ -144,17 +146,18 @@ int typec_altmode_enter(struct typec_altmode *adev, u32 *vdo)
 		return ret;
 
 	/* Enter Mode */
-	return pdev->ops->enter(pdev, vdo);
+	return pdev->ops->enter(pdev, vdo, sop_type);
 }
 EXPORT_SYMBOL_GPL(typec_altmode_enter);
 
 /**
  * typec_altmode_exit - Exit Mode
  * @adev: The alternate mode
+ * @sop_type: SOP* target for the Exit Mode command
  *
  * The partner of @adev has initiated Exit Mode command.
  */
-int typec_altmode_exit(struct typec_altmode *adev)
+int typec_altmode_exit(struct typec_altmode *adev, enum typec_altmode_transmit_type sop_type)
 {
 	struct altmode *partner = to_altmode(adev)->partner;
 	struct typec_altmode *pdev = &partner->adev;
@@ -172,7 +175,7 @@ int typec_altmode_exit(struct typec_altmode *adev)
 		return ret;
 
 	/* Exit Mode command */
-	return pdev->ops->exit(pdev);
+	return pdev->ops->exit(pdev, sop_type);
 }
 EXPORT_SYMBOL_GPL(typec_altmode_exit);
 
@@ -206,13 +209,15 @@ EXPORT_SYMBOL_GPL(typec_altmode_attention);
  * @header: VDM Header
  * @vdo: Array of Vendor Defined Data Objects
  * @count: Number of Data Objects
+ * @sop_type: SOP* target for the VDM
  *
  * The alternate mode drivers use this function for SVID specific communication
  * with the partner. The port drivers use it to deliver the Structured VDMs
  * received from the partners to the alternate mode drivers.
  */
 int typec_altmode_vdm(struct typec_altmode *adev,
-		      const u32 header, const u32 *vdo, int count)
+		      const u32 header, const u32 *vdo, int count,
+		      enum typec_altmode_transmit_type sop_type)
 {
 	struct typec_altmode *pdev;
 	struct altmode *altmode;
@@ -230,7 +235,7 @@ int typec_altmode_vdm(struct typec_altmode *adev,
 	if (!pdev->ops || !pdev->ops->vdm)
 		return -EOPNOTSUPP;
 
-	return pdev->ops->vdm(pdev, header, vdo, count);
+	return pdev->ops->vdm(pdev, header, vdo, count, sop_type);
 }
 EXPORT_SYMBOL_GPL(typec_altmode_vdm);
 
diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 2e0451bd336e..7514766df195 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -375,7 +375,7 @@ static ssize_t active_store(struct device *dev, struct device_attribute *attr,
 
 		/* Make sure that the partner exits the mode before disabling */
 		if (altmode->partner && !enter && altmode->partner->adev.active)
-			typec_altmode_exit(&altmode->partner->adev);
+			typec_altmode_exit(&altmode->partner->adev, TYPEC_ALTMODE_SOP);
 	} else if (altmode->partner) {
 		if (enter && !altmode->partner->adev.active) {
 			dev_warn(dev, "port has the mode disabled\n");
diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index ff67553b6932..795e3145b0c2 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1862,13 +1862,13 @@ static void tcpm_handle_vdm_request(struct tcpm_port *port,
 			break;
 		case ADEV_NOTIFY_USB_AND_QUEUE_VDM:
 			WARN_ON(typec_altmode_notify(adev, TYPEC_STATE_USB, NULL));
-			typec_altmode_vdm(adev, p[0], &p[1], cnt);
+			typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP);
 			break;
 		case ADEV_QUEUE_VDM:
-			typec_altmode_vdm(adev, p[0], &p[1], cnt);
+			typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP);
 			break;
 		case ADEV_QUEUE_VDM_SEND_EXIT_MODE_ON_FAIL:
-			if (typec_altmode_vdm(adev, p[0], &p[1], cnt)) {
+			if (typec_altmode_vdm(adev, p[0], &p[1], cnt, TYPEC_ALTMODE_SOP)) {
 				int svdm_version = typec_get_negotiated_svdm_version(
 									port->typec_port);
 				if (svdm_version < 0)
@@ -2219,7 +2219,8 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
 	return 0;
 }
 
-static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
+static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo,
+			      enum typec_altmode_transmit_type tx_sop_type)
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	int svdm_version;
@@ -2236,7 +2237,8 @@ static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
 	return 0;
 }
 
-static int tcpm_altmode_exit(struct typec_altmode *altmode)
+static int tcpm_altmode_exit(struct typec_altmode *altmode,
+			     enum typec_altmode_transmit_type tx_sop_type)
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 	int svdm_version;
@@ -2254,7 +2256,8 @@ static int tcpm_altmode_exit(struct typec_altmode *altmode)
 }
 
 static int tcpm_altmode_vdm(struct typec_altmode *altmode,
-			    u32 header, const u32 *data, int count)
+			    u32 header, const u32 *data, int count,
+			    enum typec_altmode_transmit_type tx_sop_type)
 {
 	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
 
diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index d9d3c91125ca..9043defbb86c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -45,7 +45,8 @@ struct ucsi_dp {
  * -EOPNOTSUPP.
  */
 
-static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
+static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo,
+				  enum typec_altmode_transmit_type sop_type)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	struct ucsi *ucsi = dp->con->ucsi;
@@ -54,6 +55,9 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	u8 cur = 0;
 	int ret;
 
+	if (sop_type != TYPEC_ALTMODE_SOP)
+		return 0;
+
 	mutex_lock(&dp->con->lock);
 
 	if (!dp->override && dp->initialized) {
@@ -105,13 +109,17 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	return ret;
 }
 
-static int ucsi_displayport_exit(struct typec_altmode *alt)
+static int ucsi_displayport_exit(struct typec_altmode *alt,
+				 enum typec_altmode_transmit_type sop_type)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	int svdm_version;
 	u64 command;
 	int ret = 0;
 
+	if (sop_type != TYPEC_ALTMODE_SOP)
+		return 0;
+
 	mutex_lock(&dp->con->lock);
 
 	if (!dp->override) {
@@ -195,13 +203,17 @@ static int ucsi_displayport_configure(struct ucsi_dp *dp)
 }
 
 static int ucsi_displayport_vdm(struct typec_altmode *alt,
-				u32 header, const u32 *data, int count)
+				u32 header, const u32 *data, int count,
+				enum typec_altmode_transmit_type sop_type)
 {
 	struct ucsi_dp *dp = typec_altmode_get_drvdata(alt);
 	int cmd_type = PD_VDO_CMDT(header);
 	int cmd = PD_VDO_CMD(header);
 	int svdm_version;
 
+	if (sop_type != TYPEC_ALTMODE_SOP)
+		return 0;
+
 	mutex_lock(&dp->con->lock);
 
 	if (!dp->override && dp->initialized) {
diff --git a/include/linux/usb/typec_altmode.h b/include/linux/usb/typec_altmode.h
index 28aeef8f9e7b..4d527d92457d 100644
--- a/include/linux/usb/typec_altmode.h
+++ b/include/linux/usb/typec_altmode.h
@@ -34,6 +34,16 @@ struct typec_altmode {
 
 #define to_typec_altmode(d) container_of(d, struct typec_altmode, dev)
 
+/**
+ * These are used by the Alternate Mode drivers to tell the tcpm to transmit
+ * over the selected SOP type, and are used by the tcpm to communicate the
+ * received VDM SOP type to the Alternate Mode drivers.
+ */
+enum typec_altmode_transmit_type {
+	TYPEC_ALTMODE_SOP,
+	TYPEC_ALTMODE_SOP_PRIME,
+};
+
 static inline void typec_altmode_set_drvdata(struct typec_altmode *altmode,
 					     void *data)
 {
@@ -55,21 +65,25 @@ static inline void *typec_altmode_get_drvdata(struct typec_altmode *altmode)
  * @activate: User callback for Enter/Exit Mode
  */
 struct typec_altmode_ops {
-	int (*enter)(struct typec_altmode *altmode, u32 *vdo);
-	int (*exit)(struct typec_altmode *altmode);
+	int (*enter)(struct typec_altmode *altmode, u32 *vdo,
+		     enum typec_altmode_transmit_type sop_type);
+	int (*exit)(struct typec_altmode *altmode,
+		    enum typec_altmode_transmit_type sop_type);
 	void (*attention)(struct typec_altmode *altmode, u32 vdo);
 	int (*vdm)(struct typec_altmode *altmode, const u32 hdr,
-		   const u32 *vdo, int cnt);
+		   const u32 *vdo, int cnt, enum typec_altmode_transmit_type sop_type);
 	int (*notify)(struct typec_altmode *altmode, unsigned long conf,
 		      void *data);
 	int (*activate)(struct typec_altmode *altmode, int activate);
 };
 
-int typec_altmode_enter(struct typec_altmode *altmode, u32 *vdo);
-int typec_altmode_exit(struct typec_altmode *altmode);
+int typec_altmode_enter(struct typec_altmode *altmode, u32 *vdo,
+			enum typec_altmode_transmit_type sop_type);
+int typec_altmode_exit(struct typec_altmode *altmode, enum typec_altmode_transmit_type sop_type);
 int typec_altmode_attention(struct typec_altmode *altmode, u32 vdo);
 int typec_altmode_vdm(struct typec_altmode *altmode,
-		      const u32 header, const u32 *vdo, int count);
+		      const u32 header, const u32 *vdo, int count,
+		      enum typec_altmode_transmit_type sop_type);
 int typec_altmode_notify(struct typec_altmode *altmode, unsigned long conf,
 			 void *data);
 const struct typec_altmode *
-- 
2.43.0.rc2.451.g8631bc7472-goog


