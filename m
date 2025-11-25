Return-Path: <linux-usb+bounces-30888-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C014CC83F7E
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 09:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F0B1D4E7716
	for <lists+linux-usb@lfdr.de>; Tue, 25 Nov 2025 08:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0632D8DA9;
	Tue, 25 Nov 2025 08:25:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.229.205.26])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6629F2D8390;
	Tue, 25 Nov 2025 08:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.229.205.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764059122; cv=none; b=ckvwrDGgosUWhsnKYgdQONJx3YvQBoc0ckUYp9X8SFmsPUXE9UW9rEU0mAF7/2Xcz1oWANzBst0Efmd9V6njjMryxyAtgiZ05mu3c5KxHuSSyznel8azoxqnmTQ3hKUmloOcdA1EeRJKth2Xc5LlYfUSyj3KCvHFFOsUYyEay1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764059122; c=relaxed/simple;
	bh=VSlMgOQoBvHVoz7cPGrlqyrTrXMh9dlkmzPJgb0oNgM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=N05z3kpKRsOmZH+V+F2B8RFz21mBH1X1Etc5VKQQ5imNVYN6m8NNLK3TyTTtQcbPZjacHdDT8VUC+r1b/JFZoJ+IcNk2l3DxQlB7wfa8h1r9xGXgN17YdykieYiyYT9gqRlXJMD/EEV8Efe14uZ2HKuHI85k43Qfjk0WdPcypzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=52.229.205.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.18.214])
	by mtasvr (Coremail) with SMTP id _____wBXFODnZyVpUm0wAA--.300S3;
	Tue, 25 Nov 2025 16:25:12 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.18.214])
	by mail-app4 (Coremail) with SMTP id zi_KCgDXj4bjZyVpIpR7Aw--.3199S2;
	Tue, 25 Nov 2025 16:25:10 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	heikki.krogerus@linux.intel.com,
	mitltlatltl@gmail.com,
	linux-kernel@vger.kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>
Subject: [PATCH] usb: typec: ucsi: fix probe failure in gaokun_ucsi_probe()
Date: Tue, 25 Nov 2025 16:25:05 +0800
Message-Id: <20251125082505.52249-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zi_KCgDXj4bjZyVpIpR7Aw--.3199S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcBAWkktQEIMQAcsY
X-CM-DELIVERINFO: =?B?IjkNzwXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR1z+B/Lu5rwjGSWc5TXIqN1J+vDw/6vGrBHhG6Yap+dzDHGPOrx/Ttv0IplcbSEQM9tVA
	RRpOhCIWEF97gNMTDEhcji+pbPFqaCGF7jf/S0t3lV9fuK4dMa4+Nmh30fWfMg==
X-Coremail-Antispam: 1Uk129KBj93XoW7Wry7tFWxGryDuryDZF18JFc_yoW8XFy5pr
	Wq9r40yr1UGr4a93Z8WF93Za1SqwnrXryUKF47X34Y9rZ7ta4fZry8t3yFgF92gw18tF1Y
	vF1jywnxXFWDKwcCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUvvb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I
	3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxV
	WUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8I
	cVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aV
	AFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuY
	vjxU26pBDUUUU

The gaokun_ucsi_probe() uses ucsi_create() to allocate a UCSI instance.
The ucsi_create() validates whether ops->poll_cci is defined, and if not,
it directly returns -EINVAL. However, the gaokun_ucsi_ops structure dose
not define the poll_cci, causing ucsi_create() always fail with -EINVAL.
This issue can be observed in the kernel log with the following error:

ucsi_huawei_gaokun.ucsi huawei_gaokun_ec.ucsi.0: probe with driver
ucsi_huawei_gaokun.ucsi failed with error -22

Fix the issue by adding the missing poll_cci callback to gaokun_ucsi_ops.

Fixes: 00327d7f2c8c ("usb: typec: ucsi: add Huawei Matebook E Go ucsi driver")
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 7b5222081bb..8401ab414bd 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -196,6 +196,7 @@ static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
 const struct ucsi_operations gaokun_ucsi_ops = {
 	.read_version = gaokun_ucsi_read_version,
 	.read_cci = gaokun_ucsi_read_cci,
+	.poll_cci = gaokun_ucsi_read_cci,
 	.read_message_in = gaokun_ucsi_read_message_in,
 	.sync_control = ucsi_sync_control_common,
 	.async_control = gaokun_ucsi_async_control,
-- 
2.34.1


