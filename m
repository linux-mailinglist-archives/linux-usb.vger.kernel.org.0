Return-Path: <linux-usb+bounces-33238-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aIJMN2j1imn2OwAAu9opvQ
	(envelope-from <linux-usb+bounces-33238-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:07:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A26118901
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6030E300F111
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB15F33F368;
	Tue, 10 Feb 2026 09:07:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8E633DEE9;
	Tue, 10 Feb 2026 09:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714469; cv=none; b=Ra4V2RJ6CCMXbjsPWxX3k+KAyC6Ep9ymghKYZF1q2Ox0dFTbrjhZZl5lr84hY88hVnbNy/XzBKTBjcMLmqhMYEraO0dfX9zY/moLhmwPWq73XJsS8wGsbidGxM4TP/vpdWX6Fj24Y9/H3CAcw9PjOsIIFhxpBrC018MGCbcn59c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714469; c=relaxed/simple;
	bh=TAqqQeAk+DVoCThnev7AmUZgI+z8/GCI13dAZ3V2hy0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=YXX4So+ddrLFqycpl0YDhMHAMKGATtLRnbo+BAKpgv5ll9sIywodxCdAGtiaC1N6Rdz7Swuvd0fO7UC3evxEEx7zNI/oM0PgLo2VICoCY7YOul1xNGi2A8CsymoeUiw8h8C3wMbgua6+Mwx+8vXw3jjTrY7RzReeWndZwTYk1nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost (unknown [124.16.138.129])
	by APP-03 (Coremail) with SMTP id rQCowABHY9pW9Yppq28oCA--.3613S2;
	Tue, 10 Feb 2026 17:07:34 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: rui.silva@linaro.org,
	gregkh@linuxfoundation.org,
	laurent.pinchart@ideasonboard.com,
	balbi@ti.com
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] usb: isp1760: Add missing error check for platform_get_resource()
Date: Tue, 10 Feb 2026 17:02:02 +0800
Message-Id: <20260210090202.2332349-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABHY9pW9Yppq28oCA--.3613S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XF18Cry5KryDAF48Gr1xXwb_yoWfJFc_CF
	48uFZ7GF4FkF90kr4Utrya9ay2kw1DXr4kXanFyry3tF9Igr18Xw4Uur4rA3WUWF48JFyv
	kryqyry3ur1UKjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbaxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02
	F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4I
	kC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF
	7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW8uwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUIFAJUUUUU=
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-33238-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nichen@iscas.ac.cn,linux-usb@vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_DKIM_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: F0A26118901
X-Rspamd-Action: no action

Check the return value of platform_get_resource() to prevent potential
NULL pointer dereference when the memory resource is unavailable.

Fixes: 7ef077a8ad35 ("usb: isp1760: Move driver from drivers/usb/host/ to drivers/usb/isp1760/")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/usb/isp1760/isp1760-if.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index a64190addba6..60f81ec81373 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -196,6 +196,8 @@ static int isp1760_plat_probe(struct platform_device *pdev)
 	int ret;
 
 	mem_res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!mem_res)
+		return -EINVAL;
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
-- 
2.25.1


