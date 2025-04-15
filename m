Return-Path: <linux-usb+bounces-23062-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E71A89453
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 08:59:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84ED73A638A
	for <lists+linux-usb@lfdr.de>; Tue, 15 Apr 2025 06:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75BF22741CE;
	Tue, 15 Apr 2025 06:59:23 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A698D2DFA34
	for <linux-usb@vger.kernel.org>; Tue, 15 Apr 2025 06:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700363; cv=none; b=okrpprHE+z9yEyTmtlvlHfj7DWMTMzr1qFxf4sDqBr0rGBll8CpZubfOVA8XJglQMvCL5E/lAYq/GZdB75qvr4kjFEqWhhytOqa2V8CRs79xW4vNpVOBRM+hLh5mjWWtEAOtzO7x0XeVHPKaY6K6O28YDylcPHNKjOq+qMvzvfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700363; c=relaxed/simple;
	bh=eCqr5bler881djOtK1LtONoOn8h2gUoZxmbZeWClUMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z4eIhcYoJsT0ldGKgCYpWsONdnvqWy3aOQQ9QVS14IKIvlGGtgdL9OY/IZzECBEZzGkU4rdSZDIzS67l3hBnn9CCcvz+VUN5pbphZqGN46O7eA10xVNko6Kmi3wme9kWWrUKkKa2UVC1cL6zcbXfFHoN822YzzeRnz37W4VR3gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn; spf=pass smtp.mailfrom=iie.ac.cn; arc=none smtp.client-ip=159.226.251.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iie.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iie.ac.cn
Received: from localhost.localdomain (unknown [159.226.95.28])
	by APP-05 (Coremail) with SMTP id zQCowACHxg6+A_5nA4sQCQ--.28714S2;
	Tue, 15 Apr 2025 14:59:11 +0800 (CST)
From: Chen Yufeng <chenyufeng@iie.ac.cn>
To: gregkh@linuxfoundation.org
Cc: Thinh.Nguyen@synopsys.com,
	linux-usb@vger.kernel.org,
	Chen Yufeng <chenyufeng@iie.ac.cn>
Subject: [PATCH] usb: potential integer overflow in usbg_make_tpg()
Date: Tue, 15 Apr 2025 14:58:57 +0800
Message-ID: <20250415065857.1619-1-chenyufeng@iie.ac.cn>
X-Mailer: git-send-email 2.43.0.windows.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowACHxg6+A_5nA4sQCQ--.28714S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ar17Xw1fuFW3KF48AFy7KFg_yoW8Xr1xpa
	yxW345KrWUArWDX3y8Jws5ZFy5GFs7tryUKrW7t3909a9xJF48XFZFkFyFkF13XFyxCa12
	qFWY9r95Aw4DCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkq14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r47
	MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
	0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
	wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
	W8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAI
	cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjdOz3UUUUU==
X-CM-SenderInfo: xfkh05xxih0wo6llvhldfou0/1tbiDAYNEmf95Gx0PQAAsO

The variable tpgt in usbg_make_tpg() is defined as unsigned long and is 
assigned to tpgt->tport_tpgt, which is defined as u16. This may cause an 
integer overflow when tpgt is greater than USHRT_MAX (65535). I 
haven't tried to trigger it myself, but it is possible to trigger it
by calling usbg_make_tpg() with a large value for tpgt.

I modified the type of tpgt to match tpgt->tport_tpgt and adjusted the 
relevant code accordingly.

This patch is similar to commit 59c816c1f24d ("vhost/scsi: potential 
memory corruption").

Signed-off-by: Chen Yufeng <chenyufeng@iie.ac.cn>
---
 drivers/usb/gadget/function/f_tcm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/function/f_tcm.c b/drivers/usb/gadget/function/f_tcm.c
index 5a2e1237f85c..6e8804f04baa 100644
--- a/drivers/usb/gadget/function/f_tcm.c
+++ b/drivers/usb/gadget/function/f_tcm.c
@@ -1641,14 +1641,14 @@ static struct se_portal_group *usbg_make_tpg(struct se_wwn *wwn,
 	struct usbg_tport *tport = container_of(wwn, struct usbg_tport,
 			tport_wwn);
 	struct usbg_tpg *tpg;
-	unsigned long tpgt;
+	u16 tpgt;
 	int ret;
 	struct f_tcm_opts *opts;
 	unsigned i;
 
 	if (strstr(name, "tpgt_") != name)
 		return ERR_PTR(-EINVAL);
-	if (kstrtoul(name + 5, 0, &tpgt) || tpgt > UINT_MAX)
+	if (kstrtou16(name + 5, 0, &tpgt))
 		return ERR_PTR(-EINVAL);
 	ret = -ENODEV;
 	mutex_lock(&tpg_instances_lock);
-- 
2.34.1


