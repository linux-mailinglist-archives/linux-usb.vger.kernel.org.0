Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9EFB211D9E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jul 2020 09:57:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728034AbgGBH5r (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Jul 2020 03:57:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:7345 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725287AbgGBH5r (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Jul 2020 03:57:47 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id CEC35A79C24D8AC23E28;
        Thu,  2 Jul 2020 15:57:44 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 15:57:36 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        "Mika Westerberg" <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Mario Limonciello <mario.limonciello@dell.com>
CC:     <linux-usb@vger.kernel.org>
Subject: [PATCH -next] thunderbolt: Fix old style declaration warning
Date:   Thu, 2 Jul 2020 16:07:50 +0800
Message-ID: <20200702080750.70614-1-weiyongjun1@huawei.com>
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

Fix gcc build warning:

drivers/thunderbolt/quirks.c:21:1: warning:
 'static' is not at beginning of declaration [-Wold-style-declaration]
   21 | const static struct tb_quirk tb_quirks[] = {
      | ^~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/thunderbolt/quirks.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
index 0525f59220ae..7eac3e0f90a2 100644
--- a/drivers/thunderbolt/quirks.c
+++ b/drivers/thunderbolt/quirks.c
@@ -18,7 +18,7 @@ struct tb_quirk {
 	void (*hook)(struct tb_switch *sw);
 };
 
-const static struct tb_quirk tb_quirks[] = {
+static const struct tb_quirk tb_quirks[] = {
 	/* Dell WD19TB supports self-authentication on unplug */
 	{ 0x00d4, 0xb070, quirk_force_power_link },
 };

