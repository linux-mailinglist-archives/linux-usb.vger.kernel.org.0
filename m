Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F31EA14B8C
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 16:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfEFOIu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 10:08:50 -0400
Received: from node.akkea.ca ([192.155.83.177]:37960 "EHLO node.akkea.ca"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726321AbfEFOIo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 10:08:44 -0400
Received: from localhost (localhost [127.0.0.1])
        by node.akkea.ca (Postfix) with ESMTP id 652A94E205C;
        Mon,  6 May 2019 14:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1557151724; bh=5L50ih8c7g/WWgfz2+Mh7aRuaW5CJO7HyCJLX/kPSZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nkJjc5ShRAtkZrNCll3t5PK15MVsqDyzumClp6gNyxKMS2tuX3fPwgDwOg9k4b93j
         lbvof4ohXegv5Lv2OAabFx7yWqJaydXHMlcBRqlcraYrYfhqsdVl9jrNQUtbBNP0Xh
         RmldVNd6jKpvtOiJ7twRnJrQozyjJSSju7ZdJV6c=
X-Virus-Scanned: Debian amavisd-new at mail.akkea.ca
Received: from node.akkea.ca ([127.0.0.1])
        by localhost (mail.akkea.ca [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id mk2qd3Wofqff; Mon,  6 May 2019 14:08:44 +0000 (UTC)
Received: from localhost.localdomain (198-48-167-13.cpe.pppoe.ca [198.48.167.13])
        by node.akkea.ca (Postfix) with ESMTPSA id 9ED3B4E204D;
        Mon,  6 May 2019 14:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=akkea.ca; s=mail;
        t=1557151724; bh=5L50ih8c7g/WWgfz2+Mh7aRuaW5CJO7HyCJLX/kPSZU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=nkJjc5ShRAtkZrNCll3t5PK15MVsqDyzumClp6gNyxKMS2tuX3fPwgDwOg9k4b93j
         lbvof4ohXegv5Lv2OAabFx7yWqJaydXHMlcBRqlcraYrYfhqsdVl9jrNQUtbBNP0Xh
         RmldVNd6jKpvtOiJ7twRnJrQozyjJSSju7ZdJV6c=
From:   "Angus Ainslie (Purism)" <angus@akkea.ca>
To:     angus.ainslie@puri.sm
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Angus Ainslie (Purism)" <angus@akkea.ca>
Subject: [PATCH 3/3] usb: typec: tcpm: Clear the fault status register
Date:   Mon,  6 May 2019 08:08:30 -0600
Message-Id: <20190506140830.25376-4-angus@akkea.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506140830.25376-1-angus@akkea.ca>
References: <20190506140830.25376-1-angus@akkea.ca>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

If the fault status register doesn't get cleared then
the ptn5110 interrupt gets stuck on. As the fault register gets
set everytime the ptn5110 powers on the interrupt is always stuck.

Signed-off-by: Angus Ainslie (Purism) <angus@akkea.ca>
---
 drivers/usb/typec/tcpm/tcpci.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
index c6e0e48b9a2a..17a0ffe818c0 100644
--- a/drivers/usb/typec/tcpm/tcpci.c
+++ b/drivers/usb/typec/tcpm/tcpci.c
@@ -507,6 +507,18 @@ irqreturn_t tcpci_irq(struct tcpci *tcpci)
 			tcpm_log(tcpci->port, "Invalid VBUS voltage %d", ret);
 	}
 
+	if (status & TCPC_ALERT_FAULT) {
+		u16 fault_status;
+
+		tcpci_read16(tcpci, TCPC_FAULT_STATUS, &fault_status);
+
+		tcpm_log(tcpci->port, "FAULT ALERT status 0x%x",
+				fault_status);
+
+		/* clear the fault status */
+		tcpci_write16(tcpci, TCPC_FAULT_STATUS, fault_status);
+	}
+
 	return IRQ_HANDLED;
 }
 EXPORT_SYMBOL_GPL(tcpci_irq);
-- 
2.17.1

