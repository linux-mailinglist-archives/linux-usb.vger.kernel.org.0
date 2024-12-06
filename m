Return-Path: <linux-usb+bounces-18190-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB549E682F
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 08:47:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8426D168E58
	for <lists+linux-usb@lfdr.de>; Fri,  6 Dec 2024 07:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7111F1DFD98;
	Fri,  6 Dec 2024 07:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NWV5LSqH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA91DE8A2;
	Fri,  6 Dec 2024 07:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733471219; cv=none; b=q3HldVLrBOKz0Ynmvu+CfzFAm7f5F3bw2ssrbpnHIIHlh++K08mCl9NeWX0Gna8KsmMBtHpjvO4IOFNWk03ODQRBvooc9nTnbEOHLJKEfRs3/1ro24G3ZbEvkJcHzsN3kiUkrsTSBBnwIHV+a7cInw8Ft+o0xZdyDs67z/0rnFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733471219; c=relaxed/simple;
	bh=Z6X7dtscopNLoz8nldaGstB4IaOylCRwJyOS1rJBRL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SPGmRbiAG5rrqJ+T4S5zrsB2KI8H1xGSDFNj+QAOjtSsEzchfzLsaMq3Y+iFvkifXJadC/ERxytyjW7kBUxZbJqQK+iG+ZWDaoxcJTndUdDFKdWyP3a6De3mtyh6oBSii3LvlhTy9gG5bJYhiAkM4c7tlqABMpXX+ak+4veVAxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NWV5LSqH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 592DAC4CEE3;
	Fri,  6 Dec 2024 07:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733471218;
	bh=Z6X7dtscopNLoz8nldaGstB4IaOylCRwJyOS1rJBRL8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NWV5LSqHfgUCoVAnvXP8z8CNO2CQLU4Ron9rH5qpmZBGjYBrVEUpnrKrr5DzT0Zwr
	 TCKmqjLFwsZG78NrP61R6Sa47XHPqWYlwZycYOI936HYY6hWghVcvXDVGJ0TlciRKy
	 BhDbMvVBbhguOLsrBanCmCttH2B5aAHin0X2Z7w6sJv88N9g+nwSRunB2rVrbhUK+o
	 znVsgMDowb9OPOyKwVCAWLZR9dvWrtLSWYtQFHzrkXdP7x+FXIsQpEEl0w0n88FDEj
	 Z7o8Ai+pPR/+dAThQyvOPMrfVJus5gLCd6n6c0VJkWZDcUBdFqlGvgPW9qhPnBaeuF
	 R22W4wdLAb90w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BA4DE77173;
	Fri,  6 Dec 2024 07:46:58 +0000 (UTC)
From: Amit Sunil Dhamne via B4 Relay <devnull+amitsd.google.com@kernel.org>
Date: Thu, 05 Dec 2024 23:46:10 -0800
Subject: [PATCH 3/3] usb: typec: tcpm: Add new AMS for Get_Revision
 response
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-get_rev_upstream-v1-3-90158ee7d75f@google.com>
References: <20241205-get_rev_upstream-v1-0-90158ee7d75f@google.com>
In-Reply-To: <20241205-get_rev_upstream-v1-0-90158ee7d75f@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Badhri Jagan Sridharan <badhri@google.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Kyle Tso <kyletso@google.com>, RD Babiera <rdbabiera@google.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-usb@vger.kernel.org, Amit Sunil Dhamne <amitsd@google.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733471217; l=4930;
 i=amitsd@google.com; s=20241031; h=from:subject:message-id;
 bh=YvUI3CfbZ7WfPHWV3UO69yuWSZoIOQnnvLn9UUmlros=;
 b=3N8ucg4taqS49w3NRKMQNlCekKvCDkA9FWY8/U7VBwHc7Z/szcbXtIrJH+cdGFMpCDPdk0lT/
 oRWxszd2HeoBGH7G/yxAkRl+WkRO3A70wW7n+ZJs+ot7p9t9r42kKAY
X-Developer-Key: i=amitsd@google.com; a=ed25519;
 pk=wD+XZSST4dmnNZf62/lqJpLm7fiyT8iv462zmQ3H6bI=
X-Endpoint-Received: by B4 Relay for amitsd@google.com/20241031 with
 auth_id=262
X-Original-From: Amit Sunil Dhamne <amitsd@google.com>
Reply-To: amitsd@google.com

From: Amit Sunil Dhamne <amitsd@google.com>

This commit adds a new AMS for responding to a "Get_Revision" request.
Revision message consists of the following fields:

 +----------------------------------------------------+
 |         Header             |         RMDO          |
 |  No. of data objects = 1   |                       |
 +----------------------------------------------------+

 While RMDO consists of:
  * B31..28     Revision Major
  * B27..24     Revision Minor
  * B23..20     Version Major
  * B19..16     Version Minor
  * B15..0      Reserved, shall be set to zero.

As per the PD spec ("8.3.3.16.2.1 PR_Give_Revision State"), a request is
only expected when an explicit contract is established and the port is
in ready state. This AMS is only supported for PD >= 3.0.

Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 41 ++++++++++++++++++++++++++++++++++++++++-
 include/linux/usb/pd.h        | 22 ++++++++++++++++++++--
 2 files changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index 59621cfaee3d67a36f3ad6870bd1aa92d382f33a..460dbde9fe2239b10c43cfb12dce92c736b1cea9 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -185,7 +185,8 @@
 	S(UNSTRUCTURED_VDMS),			\
 	S(STRUCTURED_VDMS),			\
 	S(COUNTRY_INFO),			\
-	S(COUNTRY_CODES)
+	S(COUNTRY_CODES),			\
+	S(REVISION_INFORMATION)
 
 #define GENERATE_ENUM(e)	e
 #define GENERATE_STRING(s)	#s
@@ -225,6 +226,7 @@ enum pd_msg_request {
 	PD_MSG_CTRL_NOT_SUPP,
 	PD_MSG_DATA_SINK_CAP,
 	PD_MSG_DATA_SOURCE_CAP,
+	PD_MSG_DATA_REV,
 };
 
 enum adev_actions {
@@ -1244,6 +1246,24 @@ static u32 tcpm_forge_legacy_pdo(struct tcpm_port *port, u32 pdo, enum typec_rol
 	}
 }
 
+static int tcpm_pd_send_revision(struct tcpm_port *port)
+{
+	struct pd_message msg;
+	u32 rmdo;
+
+	memset(&msg, 0, sizeof(msg));
+	rmdo = RMDO(port->pd_rev.rev_major, port->pd_rev.rev_minor,
+		    port->pd_rev.ver_major, port->pd_rev.ver_minor);
+	msg.payload[0] = cpu_to_le32(rmdo);
+	msg.header = PD_HEADER_LE(PD_DATA_REVISION,
+				  port->pwr_role,
+				  port->data_role,
+				  port->negotiated_rev,
+				  port->message_id,
+				  1);
+	return tcpm_pd_transmit(port, TCPC_TX_SOP, &msg);
+}
+
 static int tcpm_pd_send_source_caps(struct tcpm_port *port)
 {
 	struct pd_message msg;
@@ -3547,6 +3567,17 @@ static void tcpm_pd_ctrl_request(struct tcpm_port *port,
 				   PD_MSG_CTRL_NOT_SUPP,
 				   NONE_AMS);
 		break;
+	case PD_CTRL_GET_REVISION:
+		if (port->negotiated_rev >= PD_REV30 && port->pd_rev.rev_major)
+			tcpm_pd_handle_msg(port, PD_MSG_DATA_REV,
+					   REVISION_INFORMATION);
+		else
+			tcpm_pd_handle_msg(port,
+					   port->negotiated_rev < PD_REV30 ?
+					   PD_MSG_CTRL_REJECT :
+					   PD_MSG_CTRL_NOT_SUPP,
+					   NONE_AMS);
+		break;
 	default:
 		tcpm_pd_handle_msg(port,
 				   port->negotiated_rev < PD_REV30 ?
@@ -3791,6 +3822,14 @@ static bool tcpm_send_queued_message(struct tcpm_port *port)
 				tcpm_ams_finish(port);
 			}
 			break;
+		case PD_MSG_DATA_REV:
+			ret = tcpm_pd_send_revision(port);
+			if (ret)
+				tcpm_log(port,
+					 "Unable to send revision msg, ret=%d",
+					 ret);
+			tcpm_ams_finish(port);
+			break;
 		default:
 			break;
 		}
diff --git a/include/linux/usb/pd.h b/include/linux/usb/pd.h
index d50098fb16b5d2e2d9e39c55db4329224115e8b1..3068c3084eb6176d7d9184c3959a4110282a9fa0 100644
--- a/include/linux/usb/pd.h
+++ b/include/linux/usb/pd.h
@@ -33,7 +33,9 @@ enum pd_ctrl_msg_type {
 	PD_CTRL_FR_SWAP = 19,
 	PD_CTRL_GET_PPS_STATUS = 20,
 	PD_CTRL_GET_COUNTRY_CODES = 21,
-	/* 22-31 Reserved */
+	/* 22-23 Reserved */
+	PD_CTRL_GET_REVISION = 24,
+	/* 25-31 Reserved */
 };
 
 enum pd_data_msg_type {
@@ -46,7 +48,9 @@ enum pd_data_msg_type {
 	PD_DATA_ALERT = 6,
 	PD_DATA_GET_COUNTRY_INFO = 7,
 	PD_DATA_ENTER_USB = 8,
-	/* 9-14 Reserved */
+	/* 9-11 Reserved */
+	PD_DATA_REVISION = 12,
+	/* 13-14 Reserved */
 	PD_DATA_VENDOR_DEF = 15,
 	/* 16-31 Reserved */
 };
@@ -453,6 +457,20 @@ static inline unsigned int rdo_max_power(u32 rdo)
 #define EUDO_TBT_SUPPORT		BIT(14)
 #define EUDO_HOST_PRESENT		BIT(13)
 
+/*
+ * Request Message Data Object (PD Revision 3.1+ only)
+ * --------
+ * <31:28> :: Revision Major
+ * <27:24> :: Revision Minor
+ * <23:20> :: Version Major
+ * <19:16> :: Version Minor
+ * <15:0>  :: Reserved, Shall be set to zero
+ */
+
+#define RMDO(rev_maj, rev_min, ver_maj, ver_min)			\
+	(((rev_maj) & 0xf) << 28 | ((rev_min) & 0xf) << 24 |		\
+	 ((ver_maj) & 0xf) << 20 | ((ver_min) & 0xf) << 16)
+
 /* USB PD timers and counters */
 #define PD_T_NO_RESPONSE	5000	/* 4.5 - 5.5 seconds */
 #define PD_T_DB_DETECT		10000	/* 10 - 15 seconds */

-- 
2.47.0.338.g60cca15819-goog



