Return-Path: <linux-usb+bounces-8473-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3BD688E4B2
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 15:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 103C51C2BEE3
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 14:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099E312DDB8;
	Wed, 27 Mar 2024 12:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="m0ga/tYY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814625A113
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 12:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711543156; cv=none; b=V/otqgjUA/qeowNJw/0NPPSVk6+iQWguGfZ0cJSZV9U1mRK8NeUfpraW9naf5h29oHm0+4rZRVeFFBiXYX/rhzCtq08GlxpbXosnKfALn9JWBggeDuXvSSzuSKU9rXLOM7wiSHKgRIqkD6aeQdkcnveyzwp6it/ccg6mnq4YIN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711543156; c=relaxed/simple;
	bh=nGAAAQHujGtOv551HsvDzlAjM44B3jBWIBAXCadqxX4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R9dq3YX95cmMXK1D9lDXc/V8E/IeGam/iq1OZ6OsGI1Pytg7Gi7qOQjVN9XLdDY5umx0VwM7tspRKK7ru/yOqH5/hGTmIXPc7S8vNFaaiknRQo9BQEbs3VePZ8Qn2BwNgnmhtAgbGdVScFyS+2e8gQYVbG+mLHlhxcQbVmlPwXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=m0ga/tYY; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 74ABE600880B;
	Wed, 27 Mar 2024 12:39:11 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id fIp7og20f1No; Wed, 27 Mar 2024 12:39:08 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 6F0156008810;
	Wed, 27 Mar 2024 12:39:08 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1711543148;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=xyIbe0TwT6++Yjuw01zrOMOiTmBx14vAEiq1O8iNBV0=;
	b=m0ga/tYYNyZdoF3NUY8ls6pEA1E7t1ZHLDeKKgnlmJNq3nR2Pn/Duze3qsXLU+OFq2o3pM
	XXIMa8Y0e281K30fA1x0lTzQZmY4IrS8yIneYIyLzUQyIAUj9MhArn5Yz/09QsoQJpwPKu
	3U3psgrUhPBasAf4bdCgUQmgcBUUPH8=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id A7755360030;
	Wed, 27 Mar 2024 12:39:07 +0000 (WET)
Date: Wed, 27 Mar 2024 12:39:04 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	neil.armstrong@linaro.org, quic_prashk@quicinc.com, dmitry.baryshkov@linaro.org, 
	fabrice.gasnier@foss.st.com, saranya.gopal@intel.com, lk@c--e.de, linux-usb@vger.kernel.org
Cc: diogo.ivo@tecnico.ulisboa.pt
Subject: [RFC PATCH] usb: typec: ucsi: ack connector change after all tasks
 finish
Message-ID: <vuh25ueep3rwcmthlkvhb2avpkqzc6lsbee3qdmerolijq7azq@rwmakgznqvmq>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The UCSI specification mentions that when the OPM is notified by the
PPM of an asynchronous event it should first send all the commands it
needs to get the details of the event and only after acknowledge it by
sending ACK_CC_CI with the Connector Change bit set, while the current
code sends this ack immediately after scheduling all the partner_tasks.
Move this ACK_CC_CI command to the end of all partner_tasks.

This fixes a problem with some LG Gram laptops where the PPM sometimes
notifies the OPM with the Connector Change Indicator field set in the
CCI after an ACK_CC_CI command is sent, causing the UCSI stack to check
the connector status indefinitely since the EVENT_PENDING bit is already
cleared. This causes an interrupt storm and an artificial high load on
these platforms.

It would also be interesting to see if we could take this approach and
implement the discussion in [1] regarding sending an ACK_CC_CI command
that acks both the command completion and the connector change.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

[1]: https://lore.kernel.org/all/20240320073927.1641788-1-lk@c--e.de/
---
 drivers/usb/typec/ucsi/ucsi.c | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 0c8f3b3a99d6..b8b39e43aba8 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -69,6 +69,23 @@ static int ucsi_acknowledge_connector_change(struct ucsi *ucsi)
 	return ucsi->ops->sync_write(ucsi, UCSI_CONTROL, &ctrl, sizeof(ctrl));
 }
 
+static void ucsi_handle_ack_connector_change(struct ucsi_connector *con)
+{
+	struct ucsi *ucsi = con->ucsi;
+	int ret;
+
+	if (list_empty(&con->partner_tasks)) {
+		mutex_lock(&ucsi->ppm_lock);
+		ret = ucsi_acknowledge_connector_change(ucsi);
+		mutex_unlock(&ucsi->ppm_lock);
+
+		if (ret)
+			dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
+
+		clear_bit(EVENT_PENDING, &ucsi->flags);
+	}
+}
+
 static int ucsi_exec_command(struct ucsi *ucsi, u64 command);
 
 static int ucsi_read_error(struct ucsi *ucsi)
@@ -222,6 +239,7 @@ static void ucsi_poll_worker(struct work_struct *work)
 		list_del(&uwork->node);
 		mutex_unlock(&con->lock);
 		kfree(uwork);
+		ucsi_handle_ack_connector_change(con);
 		return;
 	}
 
@@ -232,6 +250,7 @@ static void ucsi_poll_worker(struct work_struct *work)
 	} else {
 		list_del(&uwork->node);
 		kfree(uwork);
+		ucsi_handle_ack_connector_change(con);
 	}
 
 	mutex_unlock(&con->lock);
@@ -1215,13 +1234,7 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 	if (con->status.change & UCSI_CONSTAT_CAM_CHANGE)
 		ucsi_partner_task(con, ucsi_check_altmodes, 1, 0);
 
-	clear_bit(EVENT_PENDING, &con->ucsi->flags);
-
-	mutex_lock(&ucsi->ppm_lock);
-	ret = ucsi_acknowledge_connector_change(ucsi);
-	mutex_unlock(&ucsi->ppm_lock);
-	if (ret)
-		dev_err(ucsi->dev, "%s: ACK failed (%d)", __func__, ret);
+	ucsi_handle_ack_connector_change(con);
 
 out_unlock:
 	mutex_unlock(&con->lock);
-- 
2.44.0


