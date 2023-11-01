Return-Path: <linux-usb+bounces-2435-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C17C57DE1B1
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 14:36:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 028AAB21109
	for <lists+linux-usb@lfdr.de>; Wed,  1 Nov 2023 13:36:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2B8134C5;
	Wed,  1 Nov 2023 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D211134B9
	for <linux-usb@vger.kernel.org>; Wed,  1 Nov 2023 13:35:54 +0000 (UTC)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C86E410C;
	Wed,  1 Nov 2023 06:35:49 -0700 (PDT)
Received: from dggpemm500011.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4SL7LT2QCqzVlG4;
	Wed,  1 Nov 2023 21:35:45 +0800 (CST)
Received: from huawei.com (10.175.104.170) by dggpemm500011.china.huawei.com
 (7.185.36.110) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Wed, 1 Nov
 2023 21:35:46 +0800
From: Ren Mingshuai <renmingshuai@huawei.com>
To: <davem@davemloft.net>
CC: <edumazet@google.com>, <kuba@kernel.org>, <jirislaby@kernel.org>,
	<caowangbao@huawei.com>, <yanan@huawei.com>, <liaichun@huawei.com>,
	<linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] tty: hso: Fix potential null pointer dereference
Date: Wed, 1 Nov 2023 21:35:44 +0800
Message-ID: <20231101133544.246961-1-renmingshuai@huawei.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.104.170]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500011.china.huawei.com (7.185.36.110)
X-CFilter-Loop: Reflected

Generally, the old always points to the address of a ktermios structure,
so old is unlikely to be NULL. Still check it before dereference as
elsewhere.

Signed-off-by: Ren Mingshuai <renmingshuai@huawei.com>
---
 drivers/net/usb/hso.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index ce1f6081d582..4ad829ab54d3 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -1396,7 +1396,8 @@ static void hso_serial_set_termios(struct tty_struct *tty,
 	if (serial->port.count)
 		_hso_serial_set_termios(tty);
 	else
-		tty->termios = *old;
+		if (old)
+			tty->termios = *old;
 	spin_unlock_irqrestore(&serial->serial_lock, flags);
 
 	/* done */
-- 
2.33.0


