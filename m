Return-Path: <linux-usb+bounces-31157-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A88ECA304C
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 10:36:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7349C3013EE8
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 09:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D9B33074A2;
	Thu,  4 Dec 2025 09:36:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7204010957;
	Thu,  4 Dec 2025 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764840977; cv=none; b=nvsODMH1aDCAH999qsgKSCptRStF2+2FMZiYxEGVcNVdFbDbNShdNT+cJskcXZAgM6HBB5A/z+c+nESrsNLH0agmo73v4Bz7xkqne4Kd2jX6w7PC0oWuSkr5OAxfIqqfnQJO5Fy+La4iN81e3Y7CZyodILoJsIog/9Li927Pgbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764840977; c=relaxed/simple;
	bh=YYlnd7whKKOZX+zseI82GWQcnZ+Ybw7gdTV46M1crLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aswVC5XCQWA7YDA0GDwtdp2/XQ3UzBiHFMvroSzwnky6ZfEBI/LRVMZb3hDcVPnQVmB/8OGKlPEXZIqHwriOjvGR5uUBlR9fpMUbzBPHAh+R2liCJxXlJfXkFDQLv19NgKNyc+Yo7g0jLcBWzvIsbrNop3UmaYoDVeLGVl1QP14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-03 (Coremail) with SMTP id rQCowAD3hdgIVjFpfIUhAw--.10692S2;
	Thu, 04 Dec 2025 17:36:10 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: andreas.noever@gmail.com,
	westeri@kernel.org,
	YehezkelShB@gmail.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haotian Zhang <vulab@iscas.ac.cn>
Subject: [PATCH] thunderbolt: Return -ENOTSUPP when cm_ops callbacks are missing
Date: Thu,  4 Dec 2025 17:32:24 +0800
Message-ID: <20251204093224.1431-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3hdgIVjFpfIUhAw--.10692S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4kuw1rtw1UZF15Ar13Arb_yoW5GryUpF
	y7KrWjvr4UGF4Y93WxGa1kuFyYkwn3KFW2kr18Ga4rur13GrZ0yFyjyFy3ZrWfCrs7Cr45
	AayI9r1rZa47JaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x0JU8ucNUUUUU=
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwoGA2kxGRfu1gAAsm

Several tb_domain* helpers return -EPERM when the corresponding cm_ops
callback is NULL. A NULL callback indicates the operation is not
supported by the connection manager, not a permission denial.

Switch these sites to return -ENOTSUPP when the cm_ops callback is
absent: disapprove_switch, approve_switch, approve_switch_key,
challenge_switch_key, and disconnect_pcie_paths.

Fixes: e6b245ccd524 ("thunderbolt: Add support for host and device NVM firmware upgrade")
Fixes: f67cf491175a ("thunderbolt: Add support for Internal Connection Manager (ICM)")
Fixes: 3da88be24997 ("thunderbolt: Add support for de-authorizing devices")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/thunderbolt/domain.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/thunderbolt/domain.c b/drivers/thunderbolt/domain.c
index 83defc915d33..2e88a821ef08 100644
--- a/drivers/thunderbolt/domain.c
+++ b/drivers/thunderbolt/domain.c
@@ -635,7 +635,7 @@ int tb_domain_runtime_resume(struct tb *tb)
 int tb_domain_disapprove_switch(struct tb *tb, struct tb_switch *sw)
 {
 	if (!tb->cm_ops->disapprove_switch)
-		return -EPERM;
+		return -ENOTSUPP;
 
 	return tb->cm_ops->disapprove_switch(tb, sw);
 }
@@ -656,7 +656,7 @@ int tb_domain_approve_switch(struct tb *tb, struct tb_switch *sw)
 	struct tb_switch *parent_sw;
 
 	if (!tb->cm_ops->approve_switch)
-		return -EPERM;
+		return -ENOTSUPP;
 
 	/* The parent switch must be authorized before this one */
 	parent_sw = tb_to_switch(sw->dev.parent);
@@ -683,7 +683,7 @@ int tb_domain_approve_switch_key(struct tb *tb, struct tb_switch *sw)
 	int ret;
 
 	if (!tb->cm_ops->approve_switch || !tb->cm_ops->add_switch_key)
-		return -EPERM;
+		return -ENOTSUPP;
 
 	/* The parent switch must be authorized before this one */
 	parent_sw = tb_to_switch(sw->dev.parent);
@@ -718,7 +718,7 @@ int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw)
 	int ret;
 
 	if (!tb->cm_ops->approve_switch || !tb->cm_ops->challenge_switch_key)
-		return -EPERM;
+		return -ENOTSUPP;
 
 	/* The parent switch must be authorized before this one */
 	parent_sw = tb_to_switch(sw->dev.parent);
@@ -753,7 +753,7 @@ int tb_domain_challenge_switch_key(struct tb *tb, struct tb_switch *sw)
 int tb_domain_disconnect_pcie_paths(struct tb *tb)
 {
 	if (!tb->cm_ops->disconnect_pcie_paths)
-		return -EPERM;
+		return -ENOTSUPP;
 
 	return tb->cm_ops->disconnect_pcie_paths(tb);
 }
-- 
2.25.1


