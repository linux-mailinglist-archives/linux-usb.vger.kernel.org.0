Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58DFF354100
	for <lists+linux-usb@lfdr.de>; Mon,  5 Apr 2021 12:37:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238038AbhDEKAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Apr 2021 06:00:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:15481 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232063AbhDEKAn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Apr 2021 06:00:43 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FDR1Y1wKMzwQMJ;
        Mon,  5 Apr 2021 17:58:25 +0800 (CST)
Received: from localhost.localdomain (10.175.104.82) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Mon, 5 Apr 2021 18:00:24 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <zhengyongjun3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Tom Rix <trix@redhat.com>
CC:     <linux-usb@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] usb: host: u132-hcd: use DEFINE_MUTEX() for mutex lock
Date:   Mon, 5 Apr 2021 18:14:34 +0800
Message-ID: <20210405101434.14878-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.104.82]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

mutex lock can be initialized automatically with DEFINE_MUTEX()
rather than explicitly calling mutex_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/usb/host/u132-hcd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/host/u132-hcd.c b/drivers/usb/host/u132-hcd.c
index eb96e1e15b71..5a783c423d8e 100644
--- a/drivers/usb/host/u132-hcd.c
+++ b/drivers/usb/host/u132-hcd.c
@@ -78,7 +78,7 @@ static DECLARE_WAIT_QUEUE_HEAD(u132_hcd_wait);
 * u132_module_lock exists to protect access to global variables
 *
 */
-static struct mutex u132_module_lock;
+static DEFINE_MUTEX(u132_module_lock);
 static int u132_exiting;
 static int u132_instances;
 /*
@@ -3190,7 +3190,6 @@ static int __init u132_hcd_init(void)
 	int retval;
 	u132_instances = 0;
 	u132_exiting = 0;
-	mutex_init(&u132_module_lock);
 	if (usb_disabled())
 		return -ENODEV;
 	printk(KERN_INFO "driver %s\n", hcd_name);

