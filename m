Return-Path: <linux-usb+bounces-8472-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73188E281
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 14:28:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC818290B45
	for <lists+linux-usb@lfdr.de>; Wed, 27 Mar 2024 13:28:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC4D513BC11;
	Wed, 27 Mar 2024 12:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="u0Q7GKPi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E84D172628
	for <linux-usb@vger.kernel.org>; Wed, 27 Mar 2024 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711542121; cv=none; b=by1WdszR0qP0i9KQU14lNwWky/h7gcceisHMuAfdbU04xhkdLaGZpJCmX5Tt4Iw19xTxU5x/Fo+0o1Wa/ChhI13Ym1I9RfUtWAQP7Mjrvg155e1CcbrDLjGW5hmIIGCuMRQERRibRmlao3idNG/MzJv3BGByxKrZM1jLaN8z8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711542121; c=relaxed/simple;
	bh=lkVH+6YHdoA4iYT1IUy+4zufKo6t/7PDPEXy+5yOxnc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jz1MWyF5+kuMdijMoMiLxe8/49TfJNxA0sECNbeHljiqA7WPvcRCAXA3hYOOME5WkQrjhPC39T8zaXwd4TNmCPUfGVAugyEWrzY+ISa+rZtGprtODMu9rJIFJ5JejVz2Em8qAFSPKqoUkqy/pd+8xzexN68OLvZ59TTPxaUceUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=u0Q7GKPi; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 36902633F00B;
	Wed, 27 Mar 2024 12:11:51 +0000 (WET)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id B8Tzowf7w7GP; Wed, 27 Mar 2024 12:11:49 +0000 (WET)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id C7DC6633F004;
	Wed, 27 Mar 2024 12:11:48 +0000 (WET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1711541509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=OFvWDb3iT0xFr2ncRSq04CoUbExvv0SD+VTJL/n4qCY=;
	b=u0Q7GKPiyk6RbY/VZACQStWu9d6GD26KnG2FDBg3xkd5TU5T5qJ7Gp3x1ULwjwOUpWtcml
	am/Wq20EOQu/OHQ28rsR1HnAoi6OlcxMVVxVe9xXTetnktKen2v1K1Tpk+XL7lMyiEuRet
	f7j+HMZhREZI3yLO5RTIUhUGTpiHDPk=
Received: from diogo-gram.home (unknown [IPv6:2a01:14:8070:dc60:f4e6:62fe:d7f8:e109])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 9024B360080;
	Wed, 27 Mar 2024 12:11:47 +0000 (WET)
Date: Wed, 27 Mar 2024 12:11:42 +0000
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
To: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org, 
	pmalani@chromium.org, jthies@google.com, neil.armstrong@linaro.org, 
	abhishekpandit@chromium.org, fabrice.gasnier@foss.st.com, linux-usb@vger.kernel.org
Cc: diogo.ivo@tecnico.ulisboa.pt
Subject: [PATCH] usb: typec: ucsi: Only enable supported notifications
Message-ID: <yhz7nq622mbg3rqsyvqz632pc756niagpfbnzayfswhzo7esho@vrdtx5c3hjgx>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The UCSI specification defines some notifications to be optional for the
PPM to support. From these only enable the ones the PPM informs us are
actually supported.

Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
---
 drivers/usb/typec/ucsi/ucsi.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index cf52cb34d285..0c8f3b3a99d6 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1626,6 +1626,27 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	return ret;
 }
 
+static u64 ucsi_get_supported_notifications(struct ucsi *ucsi)
+{
+	u8 features = ucsi->cap.features;
+	u64 ntfy = UCSI_ENABLE_NTFY_ALL;
+
+	if (!(features & UCSI_CAP_ALT_MODE_DETAILS))
+		ntfy &= ~UCSI_ENABLE_NTFY_CAM_CHANGE;
+
+	if (!(features & UCSI_CAP_PDO_DETAILS))
+		ntfy &= ~(UCSI_ENABLE_NTFY_PWR_LEVEL_CHANGE |
+			  UCSI_ENABLE_NTFY_CAP_CHANGE);
+
+	if (!(features & UCSI_CAP_EXT_SUPPLY_NOTIFICATIONS))
+		ntfy &= ~UCSI_ENABLE_NTFY_EXT_PWR_SRC_CHANGE;
+
+	if (!(features & UCSI_CAP_PD_RESET))
+		ntfy &= ~UCSI_ENABLE_NTFY_PD_RESET_COMPLETE;
+
+	return ntfy;
+}
+
 /**
  * ucsi_init - Initialize UCSI interface
  * @ucsi: UCSI to be initialized
@@ -1679,8 +1700,8 @@ static int ucsi_init(struct ucsi *ucsi)
 			goto err_unregister;
 	}
 
-	/* Enable all notifications */
-	ntfy = UCSI_ENABLE_NTFY_ALL;
+	/* Enable all supported notifications */
+	ntfy = ucsi_get_supported_notifications(ucsi);
 	command = UCSI_SET_NOTIFICATION_ENABLE | ntfy;
 	ret = ucsi_send_command(ucsi, command, NULL, 0);
 	if (ret < 0)
-- 
2.44.0


