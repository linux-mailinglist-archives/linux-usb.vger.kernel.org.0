Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD459348707
	for <lists+linux-usb@lfdr.de>; Thu, 25 Mar 2021 03:43:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbhCYCnO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Mar 2021 22:43:14 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:14582 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235098AbhCYCmk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Mar 2021 22:42:40 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4F5TqT5mR6z19J2S;
        Thu, 25 Mar 2021 10:40:37 +0800 (CST)
Received: from localhost.localdomain (10.175.113.32) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Thu, 25 Mar 2021 10:42:30 +0800
From:   'Qinglang Miao <miaoqinglang@huawei.com>
To:     <miaoqinglang@huawei.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Wei Yongjun <weiyongjun1@huawei.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: typec: tipd: Remove duplicated include from core.c
Date:   Thu, 25 Mar 2021 11:12:55 +0800
Message-ID: <20210325031255.120479-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Qinglang Miao <miaoqinglang@huawei.com>

Remove duplicated include.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/usb/typec/tipd/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index d8212b15f6f9..938219bc1b4b 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -6,8 +6,6 @@
  * Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
  */
 
-#include "tps6598x.h"
-
 #include <linux/i2c.h>
 #include <linux/acpi.h>
 #include <linux/module.h>

