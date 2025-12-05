Return-Path: <linux-usb+bounces-31196-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA9BCA6092
	for <lists+linux-usb@lfdr.de>; Fri, 05 Dec 2025 04:50:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CBA831DCD65
	for <lists+linux-usb@lfdr.de>; Fri,  5 Dec 2025 03:49:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116D5284B26;
	Fri,  5 Dec 2025 03:49:35 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE5D502BE;
	Fri,  5 Dec 2025 03:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764906574; cv=none; b=C9RvXmf1GXc13yG3lTM/GbLnBWuo8em5KumhxFR4u1IaDjuKaNRMG//wmwHXABgSSdElAsv65k0M18FHzuvrDWx4Gj7x3qPAkVyqa8X/wTLRf1n7bwZcTywnVLv+4TR/9hSHCYmruDjOBw6KD2aGjDajFjWIkcYqGTv2XCfbIRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764906574; c=relaxed/simple;
	bh=5bjh7MhyfDCL2fHUhL+nHxbuiWJ/BPjoATrMFNeZBpk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BuVaEc7uwT71pnXmu73J1HZz0NcwG98lYMDH2aP5VYn9ZIQUYxV1ZPxMLLB75ll6rymlPTpE4sTQLYiJ5E6NZl1Td0TxnFi/n1CteAIvLMtUwxLNahHSXJwSlia0/VQ2fMy8cWd47g+cf+3BtjGr3nM2FcQbUttCP5zqURL8XOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [218.12.17.178])
	by mtasvr (Coremail) with SMTP id _____wDX31caVjJpYKGTAA--.1541S3;
	Fri, 05 Dec 2025 11:48:43 +0800 (CST)
Received: from ubuntu.localdomain (unknown [218.12.17.178])
	by mail-app2 (Coremail) with SMTP id zC_KCgCHn0MRVjJpBFhHBA--.22493S2;
	Fri, 05 Dec 2025 11:48:41 +0800 (CST)
From: Duoming Zhou <duoming@zju.edu.cn>
To: linux-usb@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org,
	kuba@kernel.org,
	alexander.deucher@amd.com,
	Jonathan.Cameron@huawei.com,
	akpm@linux-foundation.org,
	johannes.berg@intel.com,
	krzk@kernel.org,
	Duoming Zhou <duoming@zju.edu.cn>,
	stable@kernel.org
Subject: [PATCH] usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal
Date: Fri,  5 Dec 2025 11:48:31 +0800
Message-Id: <20251205034831.12846-1-duoming@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zC_KCgCHn0MRVjJpBFhHBA--.22493S2
X-CM-SenderInfo: qssqjiasttq6lmxovvfxof0/1tbiAwcLAWkx5AIM0gAIsm
X-CM-DELIVERINFO: =?B?j0HlvAXKKxbFmtjJiESix3B1w3uoVhYI+vyen2ZzBEkOnu5chDpkB+ZdGnv/zQ0PbP
	CR16GQhhX7CLsrTBlHDX8VE3hxA2jxVBpq5LBx5X8Ol3lnYAWqYY2/yZA320YDVkW20HE8
	NVVf84O/fLUxbbpHjYSfeD2Wx8BuxjLhK+v8QtyJ0RnAOEKmL7dslCylMbVLRA==
X-Coremail-Antispam: 1Uk129KBj93XoW7tw4DCr4fAr1rXryUGF1UCFX_yoW8Ary8pr
	WfXr15KFyvgr13tanxtw4ruF15WwsFv34UKr1Ik3W3Xwn8Jw1jqry0kFyF93yY9r95ur12
	qwn0qa4fuFW8CrbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Eb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AK
	xVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
	02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAF
	wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0Y48IcxkI7V
	AKI48G6xCjnVAKz4kxM4IIrI8v6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20x
	vaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8
	JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU801v3UUUUU==

The delayed work item otg_event is initialized in fsl_otg_conf() and
scheduled under two conditions:
1. When a host controller binds to the OTG controller.
2. When the USB ID pin state changes (cable insertion/removal).

A race condition occurs when the device is removed via fsl_otg_remove():
the fsl_otg instance may be freed while the delayed work is still pending
or executing. This leads to use-after-free when the work function
fsl_otg_event() accesses the already freed memory.

The problematic scenario:

(detach thread)            | (delayed work)
fsl_otg_remove()           |
  kfree(fsl_otg_dev) //FREE| fsl_otg_event()
                           |   og = container_of(...) //USE
                           |   og-> //USE

Fix this by calling disable_delayed_work_sync() in fsl_otg_remove()
before deallocating the fsl_otg structure. This ensures the delayed work
is properly canceled and completes execution prior to memory deallocation.

This bug was identified through static analysis.

Fixes: 0807c500a1a6 ("USB: add Freescale USB OTG Transceiver driver")
Cc: stable@kernel.org
Signed-off-by: Duoming Zhou <duoming@zju.edu.cn>
---
 drivers/usb/phy/phy-fsl-usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 40ac68e52ce..e266a47c4d4 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -988,6 +988,7 @@ static void fsl_otg_remove(struct platform_device *pdev)
 {
 	struct fsl_usb2_platform_data *pdata = dev_get_platdata(&pdev->dev);
 
+	disable_delayed_work_sync(&fsl_otg_dev->otg_event);
 	usb_remove_phy(&fsl_otg_dev->phy);
 	free_irq(fsl_otg_dev->irq, fsl_otg_dev);
 
-- 
2.34.1


