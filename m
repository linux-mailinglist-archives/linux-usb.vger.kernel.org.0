Return-Path: <linux-usb+bounces-30858-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 744B2C8070C
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 13:22:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD0B93A6EAE
	for <lists+linux-usb@lfdr.de>; Mon, 24 Nov 2025 12:21:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F04272E56;
	Mon, 24 Nov 2025 12:21:38 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A35A1E505;
	Mon, 24 Nov 2025 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763986898; cv=none; b=lTSyOrPd3cQZY0ShOY3gai1SmLfFyz2gvHlMyAYjnkve0FHiUpFbjbw2pGVltS+SW8O5Qg5N5cXrabNLLeAALlzVtqW3bZg4k4h65yCxJaVqjWk2YuuB94AmZwxrqPQBQK8uphUSV+eLTmGw2w3VkyK2+in1mBtth8WnlLZSu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763986898; c=relaxed/simple;
	bh=KTIw4+2Nt4SmQhOk/TXduEnko6o6FtjuyQnwYRlxP+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P/taCSFvh2Vk4A5Lkq+73pRU1U1XVvSDTxNwdUGfxBMnAcABq2bIjoa4YF9OyJslTuRU9tO1Dkn/R6Q66ZN2hnq8A1tuUogmL4CDrX2y/5JOz03xO2AzTPOTqwirxfRyCFygPF6JUDM8Wy4e03ph+BRfiRbgF62Ijjf5VKFfrgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-05 (Coremail) with SMTP id zQCowAC3vG3GTSRpSV7bAQ--.21580S2;
	Mon, 24 Nov 2025 20:21:27 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] usb: typec: ucsi: Fix missing typec_unregister_port on error paths
Date: Mon, 24 Nov 2025 20:20:30 +0800
Message-ID: <20251124122030.1759-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowAC3vG3GTSRpSV7bAQ--.21580S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJr1rtw18KFW5uFy7Xw4rGrg_yoW8Xw15pa
	s2g3y5trW0qFsxuF4DGFs8ZFZ0gayDK3y8CryxW34agF4DGr9Fva18Aa4YqFyUur4fZFn8
	tw4UJa1DuayUCF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjO6pDUUUU
	U==
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAgQA2kkS34FJgAAsM

The ucsi_register_port()  registers a Type-C port with
typec_register_port(), but several error paths after a successful
registration returned directly to cleanup without calling
typec_unregister_port(). This lead to a potential resource leak.

Add a common error-unwind path that calls typec_unregister_port()
for all failures to ensure proper cleanup.

Fixes: c1b0bc2dabfa ("usb: typec: Add support for UCSI interface")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/usb/typec/ucsi/ucsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index 3f568f790f39..096c4911e8bf 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1656,14 +1656,14 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 	if (ret) {
 		dev_err(ucsi->dev, "con%d: failed to register alt modes\n",
 			con->num);
-		goto out;
+		goto out_unregister;
 	}
 
 	/* Get the status */
 	ret = ucsi_get_connector_status(con, false);
 	if (ret) {
 		dev_err(ucsi->dev, "con%d: failed to get status\n", con->num);
-		goto out;
+		goto out_unregister;
 	}
 
 	if (ucsi->ops->connector_status)
@@ -1717,6 +1717,10 @@ static int ucsi_register_port(struct ucsi *ucsi, struct ucsi_connector *con)
 
 	trace_ucsi_register_port(con->num, con);
 
+	goto out;
+
+out_unregister:
+	typec_unregister_port(con->port);
 out:
 	fwnode_handle_put(cap->fwnode);
 out_unlock:
-- 
2.25.1


