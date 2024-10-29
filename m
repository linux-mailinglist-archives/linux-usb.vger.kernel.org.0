Return-Path: <linux-usb+bounces-16830-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7A9B4D45
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 16:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 888D81F24E28
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 15:14:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91561946B1;
	Tue, 29 Oct 2024 15:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="ZwPdPdb+"
X-Original-To: linux-usb@vger.kernel.org
Received: from pv50p00im-zteg10021301.me.com (pv50p00im-zteg10021301.me.com [17.58.6.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6C9192B63
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 15:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730214842; cv=none; b=i6+g+zG9wlKLDz+HY8CEIpzeRVaXiEMvJ7zw0MAIQu1fU/zn6w0TWMPdtFhZTUxCbOID1C+tTBW1DxYhNnFABosKcaG+SzzduOsi00Ei3F0nQ/MZi9uWVt1VKdDkc4AYph8NmL2zs4P4dSdCLp7/Z03P+drGNcPrKlOvVbQAi0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730214842; c=relaxed/simple;
	bh=36nprHPkH6oU4PmId9qb+SWEjSQYJw7oxeUHfCaKhCg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PAMq6d0JFjSpjlAW6keOxn1F4EzJSKBr4dhCwXrKdz7SzKi7BvwQT7eElCTPmBoc5eJrChFMb6gt4dJn7s4+C1+dY1XrmYuDDu7R8qXcujp9IZudl6JNEJ63H5WjTiI1RNt27oQocSiDtO4iq100OZlqZ4DrxecppMtBC+AAM+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=ZwPdPdb+; arc=none smtp.client-ip=17.58.6.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; t=1730214840;
	bh=m0RPAITzRHsXZ5OofhylNXltQHUN+yHYntp1o/XyG/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To;
	b=ZwPdPdb+lL8xoHbcZxk7RKv9WXJXTl3gMLYqI5pPQ/o+upMs9Sh91F16y69ETq7Nh
	 +CSujS9Cqu05y0OBMPUwGQgh18FVigj0Y/TAuSTGHAWVO4woyqmZhZ8J02yzO74zgH
	 51hNbYbV7P5cc63gqIPqZI5UBr0hTV7ZoH3FVhClmsn/aW8jb4jRhMCzdxrCksEodw
	 0KJ7R9SJm5od5EHCEVbbLIXIPWO2RAxpeh3C0CeFs6sqbgNdA8kKeH+UpxCmX5IVYJ
	 tuWswcdudWsSblO4XTyslg93asjskfxSQ7TXP5L+wDkwADU/INdy+Nit2DF4tUQkT5
	 HjJkjqFi8U4ZA==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-zteg10021301.me.com (Postfix) with ESMTPSA id B28925003C7;
	Tue, 29 Oct 2024 15:13:54 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 29 Oct 2024 23:13:38 +0800
Subject: [PATCH] usb: musb: sunxi: Fix accessing an released usb phy
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241029-sunxi_fix-v1-1-9431ed2ab826@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAKH7IGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyNL3eLSvIrM+LTMCl0D87RUQwsjIwtzY2MloPqColSgMNis6NjaWgD
 YrKlkWwAAAA==
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Jonathan Liu <net147@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-usb@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.1
X-Proofpoint-GUID: A52_arbNQN9AMkzMRMQ8e3GA-Vxpu0ol
X-Proofpoint-ORIG-GUID: A52_arbNQN9AMkzMRMQ8e3GA-Vxpu0ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-29_10,2024-10-29_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=658 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2410290116
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8

From: Zijun Hu <quic_zijuhu@quicinc.com>

Commit 6ed05c68cbca ("usb: musb: sunxi: Explicitly release USB PHY on
exit") will cause that usb phy @glue->xceiv is accessed after released.

1) register platform driver @sunxi_musb_driver
// get the usb phy @glue->xceiv
sunxi_musb_probe() -> devm_usb_get_phy().

2) register and unregister platform driver @musb_driver
musb_probe() -> sunxi_musb_init()
use the phy here
//the phy is released here
musb_remove() -> sunxi_musb_exit() -> devm_usb_put_phy()

3) register @musb_driver again
musb_probe() -> sunxi_musb_init()
use the phy here but the phy has been released at 2).
...

Fixed by reverting the commit, namely, removing devm_usb_put_phy()
from sunxi_musb_exit().

Fixes: 6ed05c68cbca ("usb: musb: sunxi: Explicitly release USB PHY on exit")
Cc: stable@vger.kernel.org
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/musb/sunxi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/musb/sunxi.c b/drivers/usb/musb/sunxi.c
index d54283fd026b..05b6e7e52e02 100644
--- a/drivers/usb/musb/sunxi.c
+++ b/drivers/usb/musb/sunxi.c
@@ -293,8 +293,6 @@ static int sunxi_musb_exit(struct musb *musb)
 	if (test_bit(SUNXI_MUSB_FL_HAS_SRAM, &glue->flags))
 		sunxi_sram_release(musb->controller->parent);
 
-	devm_usb_put_phy(glue->dev, glue->xceiv);
-
 	return 0;
 }
 

---
base-commit: afb92ad8733ef0a2843cc229e4d96aead80bc429
change-id: 20241029-sunxi_fix-07fe18228733

Best regards,
-- 
Zijun Hu <quic_zijuhu@quicinc.com>


