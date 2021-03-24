Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FB39347AC8
	for <lists+linux-usb@lfdr.de>; Wed, 24 Mar 2021 15:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236336AbhCXOdX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 10:33:23 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:14886 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236345AbhCXOdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 10:33:12 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4F59f85k65zkdVX;
        Wed, 24 Mar 2021 22:31:28 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Wed, 24 Mar 2021 22:32:59 +0800
From:   'Wei Yongjun <weiyongjun1@huawei.com>
To:     <weiyongjun1@huawei.com>, Guenter Roeck <linux@roeck-us.net>,
        "Heikki Krogerus" <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Badhri Jagan Sridharan <badhri@google.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: typec: tcpci_maxim: Make symbol 'max_tcpci_tcpci_write_table' static
Date:   Wed, 24 Mar 2021 14:42:53 +0000
Message-ID: <20210324144253.1011234-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

The sparse tool complains as follows:

drivers/usb/typec/tcpm/tcpci_maxim.c:55:34: warning:
 symbol 'max_tcpci_tcpci_write_table' was not declared. Should it be static?

This symbol is not used outside of tcpci_maxim.c, so this
commit marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/typec/tcpm/tcpci_maxim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tcpm/tcpci_maxim.c b/drivers/usb/typec/tcpm/tcpci_maxim.c
index 041a1c393594..df2505570f07 100644
--- a/drivers/usb/typec/tcpm/tcpci_maxim.c
+++ b/drivers/usb/typec/tcpm/tcpci_maxim.c
@@ -52,7 +52,7 @@ static const struct regmap_range max_tcpci_tcpci_range[] = {
 	regmap_reg_range(0x00, 0x95)
 };
 
-const struct regmap_access_table max_tcpci_tcpci_write_table = {
+static const struct regmap_access_table max_tcpci_tcpci_write_table = {
 	.yes_ranges = max_tcpci_tcpci_range,
 	.n_yes_ranges = ARRAY_SIZE(max_tcpci_tcpci_range),
 };

