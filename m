Return-Path: <linux-usb+bounces-33890-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNKRIocwpmkrLwAAu9opvQ
	(envelope-from <linux-usb+bounces-33890-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 01:51:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B158A1E766B
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 01:51:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 630C43072D84
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 00:47:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CBC52165EA;
	Tue,  3 Mar 2026 00:47:08 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net (zg8tmja2lje4os4yms4ymjma.icoremail.net [206.189.21.223])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625B1126C03;
	Tue,  3 Mar 2026 00:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=206.189.21.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772498827; cv=none; b=DgzFwx9u+ZbgR98jImQy+WxgASoqscPYW+D9Pt7rmauNgU25ISHKgXZTIIMOjmG7JuQ8opC9Mb9ude07mAExE6i39BZ4iB8NwewJt1J7+S1c9Q49WeIX9XQ7ewjE20ErQGs8EJnO+TYF3BdeCDXw2reI7gYr3Ul6eogkgB371LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772498827; c=relaxed/simple;
	bh=Xj+hJ8C0iyzRhW5dTcW07ZcUiXE2q0v7eUTKSxFd+8A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GKU/kAaX7nZiDbfKHdaoRkggNHMLAp2JjK5G0tTAn25GoAnv9y42LZmFDtD5dfrqkCbybzYS0XXvaSiRwCQI4SYEM3ApxLZa0tfnwtsVtHs7rd7F8mwNCatUQLfX7BgOfz4m9Nfaev+jgyo9fG3hnTZu2drD7crI/1F0bL40Gnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn; spf=pass smtp.mailfrom=zju.edu.cn; arc=none smtp.client-ip=206.189.21.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zju.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zju.edu.cn
Received: from zju.edu.cn (unknown [10.98.66.117])
	by mtasvr (Coremail) with SMTP id _____wDHbcx4L6ZpFRb7AA--.12932S3;
	Tue, 03 Mar 2026 08:46:49 +0800 (CST)
Received: from localhost.localdomain (unknown [10.98.66.117])
	by mail-app1 (Coremail) with SMTP id yy_KCgBXqdR3L6ZpZVVxBg--.51320S2;
	Tue, 03 Mar 2026 08:46:47 +0800 (CST)
From: UAF Researcher <fanwu01@zju.edu.cn>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Fan Wu <fanwu01@zju.edu.cn>
Subject: [PATCH] usb: renesas_usbhs: fix race between device remove and ISR
Date: Tue,  3 Mar 2026 00:45:50 +0000
Message-Id: <20260303004550.67219-1-fanwu01@zju.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:yy_KCgBXqdR3L6ZpZVVxBg--.51320S2
X-CM-SenderInfo: qrstjiaswqq6lmxovvfxof0/
X-CM-DELIVERINFO: =?B?HWSIswXKKxbFmtjJiESix3B1w3vZ3A9ovKVTomAyoQazvoRs/NHSP8GI2EvgeEEW7R
	sfnTvtdAQ+gzDzcUufjJMvYC159ZhGHHQibX5Ykm+cUw/TSGp/KxV9uRdogyIrjOhn3LWK
	WdR/BvM6T20X28Ig0dep9E6mavGmQbzmcFsnzP86
X-Coremail-Antispam: 1Uk129KBj93XoWxWw1fJw48JFy7CFWxWr17urX_yoW5CrWUpr
	4fGF429r48JF4jqw47Jw1xZ34rCFZ0gryUur1xKan7uw13A3WUAFyIgay09ry5CayxAw4D
	KF1vy3W5KasxCrXCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Cb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_Cr1j6rxdM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l57
	IF6xkI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE
	14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2
	IYc2Ij64vIr41lF7xvr2IYc2Ij64vIr40E4x8a64kEw24l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j
	6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jbo7NUUUUU=
X-Rspamd-Queue-Id: B158A1E766B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33890-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[zju.edu.cn];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fanwu01@zju.edu.cn,linux-usb@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zju.edu.cn:mid,zju.edu.cn:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

From: Fan Wu <fanwu01@zju.edu.cn>

In usbhs_remove(), the pipe array info->pipe is freed by calling
usbhs_pipe_remove(priv). However, the interrupt handler usbhs_interrupt()
is registered using devm_request_irq(). The devres cleanup, which
includes freeing the IRQ, happens after usbhs_remove() returns.

If a hardware interrupt fires or a pending ISR executes after
usbhs_pipe_remove() but before devres cleanup, the ISR will access the
freed info->pipe array via the usbhs_for_each_pipe_with_dcp() macro,
leading to a slab-use-after-free.

The race window can be illustrated as:

CPU 0 (remove path)              CPU 1 (ISR context)
---------------------            ---------------------
usbhs_remove()
  usbhs_pipe_remove()
    kfree(info->pipe)  <--+
                          |
                          |   usbhs_interrupt()
                          |     usbhsf_irq_empty()
                          |       usbhs_for_each_pipe_with_dcp()
                          |         access pipe->pipe_type  <-- UAF!
  ...
return
(devres cleanup frees IRQ too late)

Fix this by explicitly calling disable_irq() before freeing the pipe
array in usbhs_remove(), ensuring that no ISR can run and access the
freed memory.

KASAN report:

BUG: KASAN: slab-use-after-free in usbhsf_irq_empty+0x1c4/0x210 [renesas_usbhs]
Read of size 4 at addr ffff88800d3d3d00 by task swapper/0/0

Call Trace:
 <IRQ>
 dump_stack_lvl+0x68/0xa0
 kasan_report+0xca/0x100
 usbhs_for_each_pipe_with_dcp+... [renesas_usbhs]
 usbhsf_irq_empty+... [renesas_usbhs]
 usbhs_interrupt+... [renesas_usbhs]
 </IRQ>

Allocated by task 70:
 kcalloc+0x52/0xb0
 usbhs_pipe_probe+0xed/0x4f0 [renesas_usbhs]
 usbhs_probe+0xa3e/0xf40 [renesas_usbhs]
 ...

Freed by task 70:
 kfree+0x12c/0x350
 usbhs_pipe_remove+0x41/0x60 [renesas_usbhs]
 usbhs_remove+0x1a1/0x1f0 [renesas_usbhs]
 device_release_driver_internal+0x371/0x540
 ...

Fixes: f1407d5c6624 ("usb: renesas_usbhs: Add Renesas USBHS common code")
Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
---

Note for reviewers:
Due to the difficulty of precisely controlling hardware interrupt timing
for physical hot-unplug, I verified this race condition dynamically.
I wrote a software harness that injects a delay in usbhs_remove() and
simulates the ISR accessing the pipe array via a high-frequency timer
in QEMU. This reliably triggers the KASAN Use-After-Free trace shown
in the commit message, confirming the vulnerability.

 drivers/usb/renesas_usbhs/common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
index cf4a0367d..404220ceb 100644
--- a/drivers/usb/renesas_usbhs/common.c
+++ b/drivers/usb/renesas_usbhs/common.c
@@ -815,6 +815,10 @@ static void usbhs_remove(struct platform_device *pdev)
 
 	usbhs_platform_call(priv, hardware_exit, pdev);
 	reset_control_assert(priv->rsts);
+
+	/* Disable IRQ before freeing resources to prevent UAF in ISR */
+	disable_irq(priv->irq);
+
 	usbhs_mod_remove(priv);
 	usbhs_fifo_remove(priv);
 	usbhs_pipe_remove(priv);
-- 
2.34.1


