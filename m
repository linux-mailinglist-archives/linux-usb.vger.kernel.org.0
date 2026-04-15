Return-Path: <linux-usb+bounces-36240-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADR4MLwz32lqQAAAu9opvQ
	(envelope-from <linux-usb+bounces-36240-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 08:44:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 38675400FCC
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 08:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C2E623032984
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2026 06:43:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82FE83909AC;
	Wed, 15 Apr 2026 06:42:59 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [4.193.249.245])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF4B1F2380;
	Wed, 15 Apr 2026 06:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=4.193.249.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776235379; cv=none; b=YxomhkmhVRoPEKXG8NBiXWCCZrmVhHxhkC9DzTVvk/Q2Ki1v9a01yhxsAdoYfN3hRxihihzrMnBb9TWPNuSBHiyb+6Zj6KQ/vsnKBUmbw3XIL5ig5NXgDJ1DJHMDo0+ThAW+apQDAXKyvq/l2GtarldpmZVTkj2Juv8h/UZhOr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776235379; c=relaxed/simple;
	bh=4feWVL1jWWFUHUQ97/N4BrM5XufWLfKISIcTIH8Q0pM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nNQfRE8COq7vQlfbbmFUn3VroTWF7Z1/RPznMb6PlYVFormvSRpp+DyyOcTf6ko5vETSPK7dyK30CXvGGO3SrYU+2IHPt1IPotqAd7E4vUWRqitNU9A8ytL++W1XZ2iPS6Y9vnFjEoIN2OPMtYFToJf3K4rmZAyr2XTj/Mx/T9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com; spf=pass smtp.mailfrom=eswincomputing.com; arc=none smtp.client-ip=4.193.249.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=eswincomputing.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eswincomputing.com
Received: from E0006493LT.eswin.cn (unknown [10.127.112.153])
	by app1 (Coremail) with SMTP id TAJkCgDniHJhM99pLN0RAA--.7331S4;
	Wed, 15 Apr 2026 14:42:43 +0800 (CST)
From: caohang@eswincomputing.com
To: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Thinh.Nguyen@synopsys.com,
	p.zabel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: ningyu@eswincomputing.com,
	linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	Hang Cao <caohang@eswincomputing.com>
Subject: [PATCH v2 1/1] dt-bindings: usb: Fix EIC7700 USB reset's issue
Date: Wed, 15 Apr 2026 14:42:38 +0800
Message-ID: <20260415064238.1784-1-caohang@eswincomputing.com>
X-Mailer: git-send-email 2.45.1.windows.1
In-Reply-To: <20260415064056.1757-1-caohang@eswincomputing.com>
References: <20260415064056.1757-1-caohang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:TAJkCgDniHJhM99pLN0RAA--.7331S4
X-Coremail-Antispam: 1UD129KBjvJXoW7CFWktF1kWryxWFWrZrWkZwb_yoW8Cr4fpa
	y3GFs2qrn7Xr1fCayUXF10k3WxW3Z3AF4YkFZ7Ca17XF1DX345tr13t3WYgF1UCr4xZrWa
	vFWagw15Ca42yrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
	MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr4
	1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
	IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4
	A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUXJ5wUUUUU=
X-CM-SenderInfo: xfdrxt1qj6v25zlqu0xpsx3x1qjou0bp/
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-36240-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	DMARC_NA(0.00)[eswincomputing.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[caohang@eswincomputing.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.919];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,eswincomputing.com:mid,eswincomputing.com:email]
X-Rspamd-Queue-Id: 38675400FCC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Hang Cao <caohang@eswincomputing.com>

The EIC7700 USB requires a USB PHY reset operation; otherwise, the USB
will not work. The reason why the USB driver that was applied can work
properly is that the USB PHY has already been reset in ESWIN's U-Boot.

However, the proper functioning of the USB driver should not be dependent
on the bootloader. Therefore, it is necessary to incorporate the USB PHY
reset signal into the DT bindings.

This patch does not introduce any backward incompatibility since the dts
is not upstream yet. As array of reset operations are used in the driver,
no modifications to the USB controller driver are needed.

Fixes: c640a4239db5 ("dt-bindings: usb: Add ESWIN EIC7700 USB controller")
Signed-off-by: Hang Cao <caohang@eswincomputing.com>
---
 .../devicetree/bindings/usb/eswin,eic7700-usb.yaml         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
index 41c3b1b98991..658260619423 100644
--- a/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
+++ b/Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
@@ -41,12 +41,13 @@ properties:
       - const: usb_en

   resets:
-    maxItems: 2
+    maxItems: 3

   reset-names:
     items:
       - const: vaux
       - const: usb_rst
+      - const: usb_phy

   eswin,hsp-sp-csr:
     description:
@@ -85,8 +86,8 @@ examples:
         interrupt-parent = <&plic>;
         interrupts = <85>;
         interrupt-names = "peripheral";
-        resets = <&reset 84>, <&hspcrg 2>;
-        reset-names = "vaux", "usb_rst";
+        resets = <&reset 84>, <&hspcrg 2>, <&hspcrg 4>;
+        reset-names = "vaux", "usb_rst", "usb_phy";
         dr_mode = "peripheral";
         maximum-speed = "high-speed";
         phy_type = "utmi";
--
2.34.1


