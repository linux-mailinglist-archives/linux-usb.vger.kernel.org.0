Return-Path: <linux-usb+bounces-31821-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B2FCE8927
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 03:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B306B3015846
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 02:38:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A4372E06D2;
	Tue, 30 Dec 2025 02:37:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4341DFE22;
	Tue, 30 Dec 2025 02:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767062278; cv=none; b=PAgsTLS1GT1gZ3gDQPM8l0rY2yCOZvykS2yoD9CM51yyPWm8bFxJQfJAkKMWdGG5z99pnFPmyOGYdmAE3iTM445yKWWkzdOAcCqQlf92AmeMUKHBDSQ9/E7SDzwuW1JWRiWYHkZFY8AcWbem2A88uNM1jyVM4+jj9zpMsW/l3Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767062278; c=relaxed/simple;
	bh=QFRlpOrF1GoMvkpqnwoBl3pjQJ98KpiTbXUh4J+HAIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3XHaSuQG4Kp/MdouQY7UXpl6abktaJCKjc/BdURi/tGRb15plHu4CSQ906GcUvDty3glBqdUhtvqgcGcVo5Rgbi6sp5OgGuJkT71b4DOkfcsjTdJwhQqpwWzwF0+yth3vcJIu5CLrIJV4M1cnjqmBy0GvBwSQV5m1u+fl91xoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S5;
	Tue, 30 Dec 2025 10:37:40 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 3/5] dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
Date: Tue, 30 Dec 2025 10:37:22 +0800
Message-ID: <20251230023725.15966-4-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXQW3oOlNpIqZOAg--.5334S5
X-Coremail-Antispam: 1UD129KBjvdXoW7JrW3JFWkWw4DZw1ruF1xXwb_yoW3uFg_Z3
	ZruF4rCFWDJFySqr4qyFs2kF15Zw47trn7uF1qqFn8Cw4j9ws8Wa4ktw13Ar1rCF4Uurn5
	urs3JrZFgFs7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkkFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUWwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84
	ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0x
	vEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVj
	vjDU0xZFpf9x0JUHWlkUUUUU=
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/

Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
for the DWC2 IP which is used by Canaan K230.

Signed-off-by: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
---
 Documentation/devicetree/bindings/usb/dwc2.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
index 6c3a10991b8b..352487c6392a 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.yaml
+++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
@@ -17,6 +17,9 @@ properties:
   compatible:
     oneOf:
       - const: brcm,bcm2835-usb
+      - items:
+          - const: canaan,k230-usb
+          - const: snps,dwc2
       - const: hisilicon,hi6220-usb
       - const: ingenic,jz4775-otg
       - const: ingenic,jz4780-otg
-- 
2.52.0


