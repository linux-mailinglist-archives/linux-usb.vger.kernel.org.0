Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E1711E37E
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 13:20:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726879AbfLMMUs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Dec 2019 07:20:48 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:7233 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726345AbfLMMUr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 13 Dec 2019 07:20:47 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 9C2E1B4B746459A57554;
        Fri, 13 Dec 2019 20:20:45 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.439.0; Fri, 13 Dec 2019 20:20:39 +0800
From:   zhong jiang <zhongjiang@huawei.com>
To:     <heikki.krogerus@linux.intel.com>, <linux@roeck-us.net>,
        <gregkh@linuxfoundation.org>
CC:     <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <zhongjiang@huawei.com>
Subject: [PATCH v2] usb: typec: fusb302: Fix an undefined reference to 'extcon_get_state'
Date:   Fri, 13 Dec 2019 20:16:18 +0800
Message-ID: <1576239378-50795-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
In-Reply-To: <20191212122053.GA1541203@kroah.com>
References: <20191212122053.GA1541203@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes the following compile error:

drivers/usb/typec/tcpm/fusb302.o: In function `tcpm_get_current_limit':
fusb302.c:(.text+0x3ee): undefined reference to `extcon_get_state'
fusb302.c:(.text+0x422): undefined reference to `extcon_get_state'
fusb302.c:(.text+0x450): undefined reference to `extcon_get_state'
fusb302.c:(.text+0x48c): undefined reference to `extcon_get_state'
drivers/usb/typec/tcpm/fusb302.o: In function `fusb302_probe':
fusb302.c:(.text+0x980): undefined reference to `extcon_get_extcon_dev'
make: *** [vmlinux] Error 1

It is because EXTCON is build as a module, but FUSB302 is not.

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: zhong jiang <zhongjiang@huawei.com>
---
 drivers/usb/typec/tcpm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
index 72481bb..5b986d6 100644
--- a/drivers/usb/typec/tcpm/Kconfig
+++ b/drivers/usb/typec/tcpm/Kconfig
@@ -32,6 +32,7 @@ endif # TYPEC_TCPCI
 config TYPEC_FUSB302
 	tristate "Fairchild FUSB302 Type-C chip driver"
 	depends on I2C
+	depends on EXTCON || !EXTCON
 	help
 	  The Fairchild FUSB302 Type-C chip driver that works with
 	  Type-C Port Controller Manager to provide USB PD and USB
-- 
1.7.12.4

