Return-Path: <linux-usb+bounces-32591-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEUVIGgFcWmgbAAAu9opvQ
	(envelope-from <linux-usb+bounces-32591-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:57:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 19FFD5A35B
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 17:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 756407828AE
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 15:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBF8744B681;
	Wed, 21 Jan 2026 14:55:51 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B833D3321;
	Wed, 21 Jan 2026 14:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769007351; cv=none; b=tV+tQvmvKrXVV9Pv6bWxpPTCFoWvQVIV3BHueGzbtpPgtFGqraOyPlLlsPZ3tp5u8T4rK1KmusmWpTxziHZG35mZIloofp6V8hMUPuTXQpTUOzG/q3HGFsddrRy+3BrB3Q9PxG/KhmrDWGmZ3uYZzfuHEyrSw/mGXteUzANIs6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769007351; c=relaxed/simple;
	bh=3OdinlhSDIJQT6GNLzcgLshL1bUG9HuAifOjrxLgKZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j+RK8E9DuMtnOB0tDubJGJXVaRjUuaAKHLwfd2fDcQ2iN38NkKAXv9A0k8W7VuKXfns65QHxydfqz97w1SKs6uqGHIE7ZOkDTHiOqWKv4eFWqjUxdfidTcEGzIG3ZS3D9GdhqnE6Bi5cRqJfsdqioedP9f4UA0iEQ4TfRMbpCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-01 (Coremail) with SMTP id qwCowACXP2vl6HBpCoqlBQ--.20720S4;
	Wed, 21 Jan 2026 22:55:39 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
Date: Wed, 21 Jan 2026 22:55:23 +0800
Message-ID: <20260121145526.14672-3-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
References: <20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACXP2vl6HBpCoqlBQ--.20720S4
X-Coremail-Antispam: 1UD129KBjvdXoW7JrW3JFWkWw4DZw1ruF1xXwb_yoWfXrb_Z3
	ZruF4rCFZ8JFySqr4qyFs2kF15Zw42qrn3uF1qqFn8Cw4j9ws8Wa4ktwnxAr1rCF48urn3
	uFs3JrZ2gFs7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkxFF20E14v26rWj6s0DM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI8067AKxVWUXwA2048vs2IY02
	0Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
	x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUbH5lUUUUUU==
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-Spamd-Result: default: False [1.74 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	R_SPF_SOFTFAIL(0.00)[~all];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32591-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jiayu.riscv@isrc.iscas.ac.cn,linux-usb@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:7979, ipnet:213.196.21.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[isrc.iscas.ac.cn:mid,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,iscas.ac.cn:email]
X-Rspamd-Queue-Id: 19FFD5A35B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add 'canaan,k230-usb' compatible string with 'snps,dwc2' as fallback
for the DWC2 IP which is used by Canaan K230.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
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


