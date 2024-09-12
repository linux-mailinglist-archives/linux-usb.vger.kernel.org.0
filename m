Return-Path: <linux-usb+bounces-14977-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1135976087
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 07:45:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CAE91F22A2F
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 05:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87A6A188926;
	Thu, 12 Sep 2024 05:45:00 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418201885A2;
	Thu, 12 Sep 2024 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726119900; cv=none; b=doLafN+lJFvXk72xuIUMFImS8TxDst9vrHHg0xW7KWziI+BLadl1NcQaV4ezb5I50vmoBY+R3TP/rWMIjsR6k6IUaFevSuSnQp9QXoZ1oRC25Yj7WsxXhpHzB+EzWkUPQ8AWUNZBhzbvFzcyhJhaAZyuZnUEWyywIW/a5DSB2gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726119900; c=relaxed/simple;
	bh=rOeQorWaZDlaIIJiAOwM/shiKOi3AhhiIX+db/g+M4U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AbT81bEkLE6Cp8CB36PxVDbdm2wdOmCdEd5jGi4ohpZbxFpDKXXEYpWx6MVyfr5HqeLUUYNYJy6bDbg+x0rqret0hQri71fu0EUSWug4+Q3jAdKzT8/wq2bOCgC/2qFH4ymnYekrjgchi7sZH8pqYJrHw0QnHxpciS2fr+EHY0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 7A6721402BA; Thu, 12 Sep 2024 07:44:49 +0200 (CEST)
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: "Christian A. Ehrhardt" <lk@c--e.de>,
	Anurag Bijea <icaliberdev@gmail.com>,
	Christian Heusel <christian@heusel.eu>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Subject: [PATCH] usb: typec: ucsi: Fix busy loop on ASUS VivoBooks
Date: Thu, 12 Sep 2024 07:44:33 +0200
Message-Id: <20240912054433.721651-1-lk@c--e.de>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the busy indicator is set, all other fields in CCI should be
clear according to the spec. However, some UCSI implementations do
not follow this rule and report bogus data in CCI along with the
busy indicator. Ignore the contents of CCI if the busy indicator is
set.

If a command timeout is hit it is possible that the EVENT_PENDING
bit is cleared while connector work is still scheduled which can
cause the EVENT_PENDING bit to go out of sync with scheduled connector
work. Check and set the EVENT_PENDING bit on entry to
ucsi_handle_connector_change() to fix this.

Finally, check UCSI_CCI_BUSY before the return code of ->sync_control.
This ensures that the command is cancelled even if ->sync_control
returns an error (most likely -ETIMEDOUT).

Reported-by: Anurag Bijea <icaliberdev@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=219108
Bisected-by: Christian Heusel <christian@heusel.eu>
Tested-by: Anurag Bijea <icaliberdev@gmail.com>
Fixes: de52aca4d9d5 ("usb: typec: ucsi: Never send a lone connector change ack")
Cc: stable@vger.kernel.org
Signed-off-by: Christian A. Ehrhardt <lk@c--e.de>
---
 NOTE: Rebased onto usb-next.

 drivers/usb/typec/ucsi/ucsi.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 35dce4057c25..e0f3925e401b 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -38,6 +38,10 @@
 
 void ucsi_notify_common(struct ucsi *ucsi, u32 cci)
 {
+	/* Ignore bogus data in CCI if busy indicator is set. */
+	if (cci & UCSI_CCI_BUSY)
+		return;
+
 	if (UCSI_CCI_CONNECTOR(cci))
 		ucsi_connector_change(ucsi, UCSI_CCI_CONNECTOR(cci));
 
@@ -103,15 +107,13 @@ static int ucsi_run_command(struct ucsi *ucsi, u64 command, u32 *cci,
 		return -EINVAL;
 
 	ret = ucsi->ops->sync_control(ucsi, command);
-	if (ret)
-		return ret;
-
-	ret = ucsi->ops->read_cci(ucsi, cci);
-	if (ret)
-		return ret;
+	if (ucsi->ops->read_cci(ucsi, cci))
+		return -EIO;
 
 	if (*cci & UCSI_CCI_BUSY)
 		return ucsi_run_command(ucsi, UCSI_CANCEL, cci, NULL, 0, false) ?: -EBUSY;
+	if (ret)
+		return ret;
 
 	if (!(*cci & UCSI_CCI_COMMAND_COMPLETE))
 		return -EIO;
@@ -1197,6 +1199,10 @@ static void ucsi_handle_connector_change(struct work_struct *work)
 
 	mutex_lock(&con->lock);
 
+	if (!test_and_set_bit(EVENT_PENDING, &ucsi->flags))
+		dev_err_once(ucsi->dev, "%s entered without EVENT_PENDING\n",
+			     __func__);
+
 	command = UCSI_GET_CONNECTOR_STATUS | UCSI_CONNECTOR_NUMBER(con->num);
 
 	ret = ucsi_send_command_common(ucsi, command, &con->status,
-- 
2.43.0


