Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B0D1A3145
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 10:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDIIxE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Apr 2020 04:53:04 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:57344 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbgDIIxE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Apr 2020 04:53:04 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id B15C5BECF9A5BA504953;
        Thu,  9 Apr 2020 16:52:52 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Thu, 9 Apr 2020
 16:52:43 +0800
From:   Jason Yan <yanaijie@huawei.com>
To:     <linux@roeck-us.net>, <heikki.krogerus@linux.intel.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC:     Jason Yan <yanaijie@huawei.com>
Subject: [PATCH] usb: typec: tcpm: remove tcpm_altmode_ops and associations
Date:   Thu, 9 Apr 2020 16:51:17 +0800
Message-ID: <20200409085117.45819-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fix the following gcc warning:

drivers/usb/typec/tcpm/tcpm.c:1551:39: warning: ‘tcpm_altmode_ops’
defined but not used [-Wunused-const-variable=]
 static const struct typec_altmode_ops tcpm_altmode_ops = {
                                       ^~~~~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/usb/typec/tcpm/tcpm.c | 51 -----------------------------------
 1 file changed, 51 deletions(-)

diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
index de3576e6530a..0fcb1023bdbe 100644
--- a/drivers/usb/typec/tcpm/tcpm.c
+++ b/drivers/usb/typec/tcpm/tcpm.c
@@ -1503,57 +1503,6 @@ static int tcpm_validate_caps(struct tcpm_port *port, const u32 *pdo,
 	return 0;
 }
 
-static int tcpm_altmode_enter(struct typec_altmode *altmode, u32 *vdo)
-{
-	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
-	u32 header;
-
-	mutex_lock(&port->lock);
-	header = VDO(altmode->svid, vdo ? 2 : 1, CMD_ENTER_MODE);
-	header |= VDO_OPOS(altmode->mode);
-
-	tcpm_queue_vdm(port, header, vdo, vdo ? 1 : 0);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
-	mutex_unlock(&port->lock);
-
-	return 0;
-}
-
-static int tcpm_altmode_exit(struct typec_altmode *altmode)
-{
-	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
-	u32 header;
-
-	mutex_lock(&port->lock);
-	header = VDO(altmode->svid, 1, CMD_EXIT_MODE);
-	header |= VDO_OPOS(altmode->mode);
-
-	tcpm_queue_vdm(port, header, NULL, 0);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
-	mutex_unlock(&port->lock);
-
-	return 0;
-}
-
-static int tcpm_altmode_vdm(struct typec_altmode *altmode,
-			    u32 header, const u32 *data, int count)
-{
-	struct tcpm_port *port = typec_altmode_get_drvdata(altmode);
-
-	mutex_lock(&port->lock);
-	tcpm_queue_vdm(port, header, data, count - 1);
-	mod_delayed_work(port->wq, &port->vdm_state_machine, 0);
-	mutex_unlock(&port->lock);
-
-	return 0;
-}
-
-static const struct typec_altmode_ops tcpm_altmode_ops = {
-	.enter = tcpm_altmode_enter,
-	.exit = tcpm_altmode_exit,
-	.vdm = tcpm_altmode_vdm,
-};
-
 /*
  * PD (data, control) command handling functions
  */
-- 
2.17.2

