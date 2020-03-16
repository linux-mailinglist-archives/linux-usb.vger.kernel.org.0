Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B914187421
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 21:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732580AbgCPUgB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 16:36:01 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:57485 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732486AbgCPUgA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Mar 2020 16:36:00 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584390960; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nRMqUJDll887CN+SOzHmyFOYFHbWJheteucS110/Lrg=; b=eOombVqTDOAVRsLKPi45wE6XFBAHgOAIH0SgAIXwOaY3pcWqGft/BkL6qynWX1XeIYqFYgtF
 f7VNqeTOOwBBUkjRTii1xd7hqnilliHH/qeOiuuj5Ft0rd3kvNOJPX0RAmHdNRKNlQHD/stt
 TrEoTkLdTXXTmmbDjn1cDt7/C80=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e6fe32c.7f460d6cfb90-smtp-out-n03;
 Mon, 16 Mar 2020 20:35:56 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 743F3C433CB; Mon, 16 Mar 2020 20:35:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mrana-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mrana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A8E6CC433D2;
        Mon, 16 Mar 2020 20:35:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8E6CC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mrana@codeaurora.org
From:   Mayank Rana <mrana@codeaurora.org>
To:     heikki.krogerus@linux.intel.com, ajayg@nvidia.com
Cc:     Mayank Rana <mrana@codeaurora.org>, linux-usb@vger.kernel.org,
        jackp@codeaurora.org
Subject: [PATCH] usb: typec: ucsi: set USB data role when partner type is power cable/ufp
Date:   Mon, 16 Mar 2020 13:35:49 -0700
Message-Id: <1584390949-9208-1-git-send-email-mrana@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently UCSI framework doesn't update USB data role when partner type
is reported as power cable or power cable with ufp connected. This
results into no USB host mode functionality. This is valid usecase where
user wants to use legacy type c power cable with type a female connector
to attach different USB devices like mouse, thumb drive etc. Hence update
USB data role as host when partner type is reported as power cable or
power cable with ufp connected.

Signed-off-by: Mayank Rana <mrana@codeaurora.org>
---
 drivers/usb/typec/ucsi/ucsi.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index d5a6aac..ce62732 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -558,6 +558,8 @@ static void ucsi_partner_change(struct ucsi_connector *con)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
@@ -619,6 +621,8 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 		switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 		case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+		case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 			typec_set_data_role(con->port, TYPEC_HOST);
 			break;
 		case UCSI_CONSTAT_PARTNER_TYPE_DFP:
@@ -919,6 +923,8 @@ static int ucsi_register_port(struct ucsi *ucsi, int index)
 
 	switch (UCSI_CONSTAT_PARTNER_TYPE(con->status.flags)) {
 	case UCSI_CONSTAT_PARTNER_TYPE_UFP:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE:
+	case UCSI_CONSTAT_PARTNER_TYPE_CABLE_AND_UFP:
 		typec_set_data_role(con->port, TYPEC_HOST);
 		break;
 	case UCSI_CONSTAT_PARTNER_TYPE_DFP:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
