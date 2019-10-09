Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50EA1D0E44
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2019 14:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731096AbfJIMFY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Oct 2019 08:05:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3669 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729883AbfJIMFY (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Oct 2019 08:05:24 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0B8C2C8544BD8198EC56;
        Wed,  9 Oct 2019 20:05:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Wed, 9 Oct 2019 20:05:10 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     YueHaibing <yuehaibing@huawei.com>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: typec: remove duplicated include from hd3ss3220.c
Date:   Wed, 9 Oct 2019 12:04:49 +0000
Message-ID: <20191009120449.44899-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/usb/typec/hd3ss3220.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
index 1900910c637e..0ea5bf3c19c7 100644
--- a/drivers/usb/typec/hd3ss3220.c
+++ b/drivers/usb/typec/hd3ss3220.c
@@ -10,7 +10,6 @@
 #include <linux/usb/role.h>
 #include <linux/irqreturn.h>
 #include <linux/interrupt.h>
-#include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/usb/typec.h>





