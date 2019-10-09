Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4A5FD09F6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 10:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729595AbfJIIde (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 04:33:34 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37904 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725989AbfJIIde (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 04:33:34 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id EC7098B886BEDF7E30BD;
        Wed,  9 Oct 2019 16:33:31 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 16:33:23 +0800
From:   zhengbin <zhengbin13@huawei.com>
To:     <balbi@kernel.org>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>
CC:     <zhengbin13@huawei.com>
Subject: [PATCH 1/2] usb: gadget: Remove set but not used variable 'opts' in acm_ms_do_config
Date:   Wed, 9 Oct 2019 16:40:33 +0800
Message-ID: <1570610434-68293-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570610434-68293-1-git-send-email-zhengbin13@huawei.com>
References: <1570610434-68293-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/usb/gadget/legacy/acm_ms.c: In function acm_ms_do_config:
drivers/usb/gadget/legacy/acm_ms.c:108:19: warning: variable opts set but not used [-Wunused-but-set-variable]

It is not used since commit f78bbcae86e6 ("usb: f_mass_storage:
test whether thread is running before starting another")

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: zhengbin <zhengbin13@huawei.com>
---
 drivers/usb/gadget/legacy/acm_ms.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/usb/gadget/legacy/acm_ms.c b/drivers/usb/gadget/legacy/acm_ms.c
index af16672..59be2d8 100644
--- a/drivers/usb/gadget/legacy/acm_ms.c
+++ b/drivers/usb/gadget/legacy/acm_ms.c
@@ -105,7 +105,6 @@ static struct usb_function *f_msg;
  */
 static int acm_ms_do_config(struct usb_configuration *c)
 {
-	struct fsg_opts *opts;
 	int	status;

 	if (gadget_is_otg(c->cdev->gadget)) {
@@ -113,8 +112,6 @@ static int acm_ms_do_config(struct usb_configuration *c)
 		c->bmAttributes |= USB_CONFIG_ATT_WAKEUP;
 	}

-	opts = fsg_opts_from_func_inst(fi_msg);
-
 	f_acm = usb_get_function(f_acm_inst);
 	if (IS_ERR(f_acm))
 		return PTR_ERR(f_acm);
--
2.7.4

