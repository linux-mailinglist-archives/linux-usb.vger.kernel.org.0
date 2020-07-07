Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C595D216A9D
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 12:43:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgGGKnx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 06:43:53 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:39198 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726911AbgGGKnx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 06:43:53 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id F2A6DBE51F2C418ED6C8;
        Tue,  7 Jul 2020 18:43:50 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.487.0; Tue, 7 Jul 2020 18:43:41 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Hulk Robot <hulkci@huawei.com>, Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        "Colin Ian King" <colin.king@canonical.com>,
        Corentin Labbe <clabbe@baylibre.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] udc: lpc32xx: make symbol 'lpc32xx_usbddata' static
Date:   Tue, 7 Jul 2020 18:53:50 +0800
Message-ID: <20200707105350.7064-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The sparse tool complains as follows:

drivers/usb/gadget/udc/lpc32xx_udc.c:2989:25: warning:
 symbol 'lpc32xx_usbddata' was not declared. Should it be static?

This variable is not used outside of lpc32xx_udc.c, so this commit
marks it static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 4a112670cc6c..e8a4637a9a17 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -2986,7 +2986,7 @@ static void lpc32xx_rmwkup_chg(int remote_wakup_enable)
 	/* Enable or disable USB remote wakeup */
 }
 
-struct lpc32xx_usbd_cfg lpc32xx_usbddata = {
+static struct lpc32xx_usbd_cfg lpc32xx_usbddata = {
 	.vbus_drv_pol = 0,
 	.conn_chgb = &lpc32xx_usbd_conn_chg,
 	.susp_chgb = &lpc32xx_usbd_susp_chg,

