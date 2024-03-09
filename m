Return-Path: <linux-usb+bounces-7766-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97930877308
	for <lists+linux-usb@lfdr.de>; Sat,  9 Mar 2024 19:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D8B7281187
	for <lists+linux-usb@lfdr.de>; Sat,  9 Mar 2024 18:17:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0005C535AF;
	Sat,  9 Mar 2024 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3Ww3pM4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE3B4776A;
	Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710008149; cv=none; b=qf7dBx3EXb90GmXIi3rTesVJe++/nfK7WXJfg1UxUOFnH9NRJvzc8GScmgEBaO0dCTGypQWjNAJsQMV6QGAMEW6asjc1evBgCZr7WYiMlV5sRHswp34M3LIp0FOhAIBguV5Nq/u0M2UrX1Z6TBO2xWz5BubAypI4LokaWfkskDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710008149; c=relaxed/simple;
	bh=bDdSQ5OXenp8idL9VsJshycUErnHizhyVEKD6wuzwf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ef3JTx/7dX6J5xWUnz8O3K3Idv6qSRrZ0bQcodyN4yeaLLYsKlgFxE3NW6EVRitYVRHgKzoYJ0NAwQpc4jDBJG8RdrP41/lX92mmzjoeEXZ4CdXq7EbkHQXf4wQYsZXHhfT3xatGoyIWBeHP3QncxS8OuB5Y5tUuB1vy9uz0HwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3Ww3pM4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0674FC41679;
	Sat,  9 Mar 2024 18:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710008149;
	bh=bDdSQ5OXenp8idL9VsJshycUErnHizhyVEKD6wuzwf0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P3Ww3pM4L6+PZwdbNwQlMtRSWROGf3RoJaRqaig/IaYoTim4S2/6TYfh/aMcOQoGh
	 I3Jd88PBZ7qGR9aAajYWYzAGqzRXo7BT2d41dDX5GPuMwuZzdByXavJ92Jcj/uqdNH
	 hoh4qi8wber6QJBiSjq4ul8mq882di3Br09gPsSArpuAMX9fxpGXnPJPOq9h4x9Ynv
	 06t6kP0dQHyBOQ6HUiLQki6JzD6ouqX5Eki6BxvrYUP5/5tV31TjRrzMkvqD6SO1jI
	 Vjt01TwZfEg3GI/UDU+erYmEZDCaM9JhM2LBMoULZFF5pyDAKjc8XIelP1l4ri3zys
	 uqhFNmXrUymuQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5613C54E60;
	Sat,  9 Mar 2024 18:15:48 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Sat, 09 Mar 2024 19:15:30 +0100
Subject: [PATCH v2 09/28] sparc32: Drop sun4m/sun4d specific irq handling
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240309-sunset-v2-9-f09912574d2c@ravnborg.org>
References: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
In-Reply-To: <20240309-sunset-v2-0-f09912574d2c@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Kjetil Oftedal <oftedal@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1710008145; l=25224;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=0vwGh6YM0dCUoW+EtF5Blq9pmNyy5xU2x81Eck+EPGI=; =?utf-8?q?b=3DzLIQSUTmiJVX?=
 =?utf-8?q?VN+seUULSgzJPGfFqzTQv3eCpxhpFPwrID5g3Y+PD0I5K+FBKA0QNX6CSlXMqRFT?=
 DJpN3RTaBMHkRFiLEpH2EMLaomKuqdYAkyoXJobZx5tFuLOFW9JH
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
Reply-To: <sam@ravnborg.org>

From: Sam Ravnborg <sam@ravnborg.org>

Some of the sun4m irq infrastructure is used by LEON too,
so keep that and drop the rest.
The patch include a few extra fixes fix the build after
the removal of the irq support.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Arnd Bergmann <arnd@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/include/asm/irq_32.h |   2 -
 arch/sparc/kernel/Makefile      |   2 +-
 arch/sparc/kernel/irq_32.c      |  30 +--
 arch/sparc/kernel/kernel.h      |  13 --
 arch/sparc/kernel/sun4d_irq.c   | 494 ----------------------------------------
 arch/sparc/kernel/sun4d_smp.c   |   4 -
 arch/sparc/kernel/sun4m_irq.c   | 240 -------------------
 arch/sparc/mm/io-unit.c         |   2 -
 8 files changed, 2 insertions(+), 785 deletions(-)

diff --git a/arch/sparc/include/asm/irq_32.h b/arch/sparc/include/asm/irq_32.h
index 6ee48321cbc2..c402c81b85a7 100644
--- a/arch/sparc/include/asm/irq_32.h
+++ b/arch/sparc/include/asm/irq_32.h
@@ -17,8 +17,6 @@
 
 #define irq_canonicalize(irq)	(irq)
 
-void __init sun4d_init_sbi_irq(void);
-
 #define NO_IRQ		0xffffffff
 
 #endif
diff --git a/arch/sparc/kernel/Makefile b/arch/sparc/kernel/Makefile
index b253b7e132ce..d3d21e58b4e6 100644
--- a/arch/sparc/kernel/Makefile
+++ b/arch/sparc/kernel/Makefile
@@ -28,7 +28,7 @@ obj-y                   += traps_$(BITS).o
 
 # IRQ
 obj-y                   += irq_$(BITS).o
-obj-$(CONFIG_SPARC32)   += sun4m_irq.o sun4d_irq.o
+obj-$(CONFIG_SPARC32)   += sun4m_irq.o
 
 obj-y                   += process_$(BITS).o
 obj-y                   += process.o
diff --git a/arch/sparc/kernel/irq_32.c b/arch/sparc/kernel/irq_32.c
index 510184c3aa17..135170f362c1 100644
--- a/arch/sparc/kernel/irq_32.c
+++ b/arch/sparc/kernel/irq_32.c
@@ -235,36 +235,8 @@ void handler_irq(unsigned int pil, struct pt_regs *regs)
 	set_irq_regs(old_regs);
 }
 
-/* djhr
- * This could probably be made indirect too and assigned in the CPU
- * bits of the code. That would be much nicer I think and would also
- * fit in with the idea of being able to tune your kernel for your machine
- * by removing unrequired machine and device support.
- *
- */
-
 void __init init_IRQ(void)
 {
-	switch (sparc_cpu_model) {
-	case sun4m:
-		pcic_probe();
-		if (pcic_present())
-			sun4m_pci_init_IRQ();
-		else
-			sun4m_init_IRQ();
-		break;
-
-	case sun4d:
-		sun4d_init_IRQ();
-		break;
-
-	case sparc_leon:
-		leon_init_IRQ();
-		break;
-
-	default:
-		prom_printf("Cannot initialize IRQs on this Sun machine...");
-		break;
-	}
+	leon_init_IRQ();
 }
 
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index 6165e1b26df7..c467b1425506 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -93,7 +93,6 @@ extern spinlock_t irq_action_lock;
 void unexpected_irq(int irq, void *dev_id, struct pt_regs * regs);
 
 /* sun4m_irq.c */
-void sun4m_init_IRQ(void);
 void sun4m_unmask_profile_irq(void);
 void sun4m_clear_profile_irq(int cpu);
 
@@ -106,18 +105,6 @@ void __init smp4m_smp_done(void);
 void smp4m_cross_call_irq(void);
 void smp4m_percpu_timer_interrupt(struct pt_regs *regs);
 
-/* sun4d_irq.c */
-extern spinlock_t sun4d_imsk_lock;
-
-void sun4d_init_IRQ(void);
-int sun4d_request_irq(unsigned int irq,
-                      irq_handler_t handler,
-                      unsigned long irqflags,
-                      const char *devname, void *dev_id);
-int show_sun4d_interrupts(struct seq_file *, void *);
-void sun4d_distribute_irqs(void);
-void sun4d_free_irq(unsigned int irq, void *dev_id);
-
 /* sun4d_smp.c */
 void sun4d_cpu_pre_starting(void *arg);
 void sun4d_cpu_pre_online(void *arg);
diff --git a/arch/sparc/kernel/sun4d_irq.c b/arch/sparc/kernel/sun4d_irq.c
deleted file mode 100644
index 7140cff04b54..000000000000
--- a/arch/sparc/kernel/sun4d_irq.c
+++ /dev/null
@@ -1,494 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * SS1000/SC2000 interrupt handling.
- *
- *  Copyright (C) 1997,1998 Jakub Jelinek (jj@sunsite.mff.cuni.cz)
- *  Heavily based on arch/sparc/kernel/irq.c.
- */
-
-#include <linux/kernel_stat.h>
-#include <linux/slab.h>
-#include <linux/seq_file.h>
-
-#include <asm/timer.h>
-#include <asm/traps.h>
-#include <asm/irq.h>
-#include <asm/io.h>
-#include <asm/sbi.h>
-#include <asm/cacheflush.h>
-#include <asm/setup.h>
-#include <asm/oplib.h>
-
-#include "kernel.h"
-#include "irq.h"
-
-/* Sun4d interrupts fall roughly into two categories.  SBUS and
- * cpu local.  CPU local interrupts cover the timer interrupts
- * and whatnot, and we encode those as normal PILs between
- * 0 and 15.
- * SBUS interrupts are encodes as a combination of board, level and slot.
- */
-
-struct sun4d_handler_data {
-	unsigned int cpuid;    /* target cpu */
-	unsigned int real_irq; /* interrupt level */
-};
-
-
-static unsigned int sun4d_encode_irq(int board, int lvl, int slot)
-{
-	return (board + 1) << 5 | (lvl << 2) | slot;
-}
-
-struct sun4d_timer_regs {
-	u32	l10_timer_limit;
-	u32	l10_cur_countx;
-	u32	l10_limit_noclear;
-	u32	ctrl;
-	u32	l10_cur_count;
-};
-
-static struct sun4d_timer_regs __iomem *sun4d_timers;
-
-#define SUN4D_TIMER_IRQ        10
-
-/* Specify which cpu handle interrupts from which board.
- * Index is board - value is cpu.
- */
-static unsigned char board_to_cpu[32];
-
-static int pil_to_sbus[] = {
-	0,
-	0,
-	1,
-	2,
-	0,
-	3,
-	0,
-	4,
-	0,
-	5,
-	0,
-	6,
-	0,
-	7,
-	0,
-	0,
-};
-
-/* Exported for sun4d_smp.c */
-DEFINE_SPINLOCK(sun4d_imsk_lock);
-
-/* SBUS interrupts are encoded integers including the board number
- * (plus one), the SBUS level, and the SBUS slot number.  Sun4D
- * IRQ dispatch is done by:
- *
- * 1) Reading the BW local interrupt table in order to get the bus
- *    interrupt mask.
- *
- *    This table is indexed by SBUS interrupt level which can be
- *    derived from the PIL we got interrupted on.
- *
- * 2) For each bus showing interrupt pending from #1, read the
- *    SBI interrupt state register.  This will indicate which slots
- *    have interrupts pending for that SBUS interrupt level.
- *
- * 3) Call the genreric IRQ support.
- */
-static void sun4d_sbus_handler_irq(int sbusl)
-{
-	unsigned int bus_mask;
-	unsigned int sbino, slot;
-	unsigned int sbil;
-
-	bus_mask = bw_get_intr_mask(sbusl) & 0x3ffff;
-	bw_clear_intr_mask(sbusl, bus_mask);
-
-	sbil = (sbusl << 2);
-	/* Loop for each pending SBI */
-	for (sbino = 0; bus_mask; sbino++, bus_mask >>= 1) {
-		unsigned int idx, mask;
-
-		if (!(bus_mask & 1))
-			continue;
-		/* XXX This seems to ACK the irq twice.  acquire_sbi()
-		 * XXX uses swap, therefore this writes 0xf << sbil,
-		 * XXX then later release_sbi() will write the individual
-		 * XXX bits which were set again.
-		 */
-		mask = acquire_sbi(SBI2DEVID(sbino), 0xf << sbil);
-		mask &= (0xf << sbil);
-
-		/* Loop for each pending SBI slot */
-		slot = (1 << sbil);
-		for (idx = 0; mask != 0; idx++, slot <<= 1) {
-			unsigned int pil;
-			struct irq_bucket *p;
-
-			if (!(mask & slot))
-				continue;
-
-			mask &= ~slot;
-			pil = sun4d_encode_irq(sbino, sbusl, idx);
-
-			p = irq_map[pil];
-			while (p) {
-				struct irq_bucket *next;
-
-				next = p->next;
-				generic_handle_irq(p->irq);
-				p = next;
-			}
-			release_sbi(SBI2DEVID(sbino), slot);
-		}
-	}
-}
-
-void sun4d_handler_irq(unsigned int pil, struct pt_regs *regs)
-{
-	struct pt_regs *old_regs;
-	/* SBUS IRQ level (1 - 7) */
-	int sbusl = pil_to_sbus[pil];
-
-	/* FIXME: Is this necessary?? */
-	cc_get_ipen();
-
-	cc_set_iclr(1 << pil);
-
-#ifdef CONFIG_SMP
-	/*
-	 * Check IPI data structures after IRQ has been cleared. Hard and Soft
-	 * IRQ can happen at the same time, so both cases are always handled.
-	 */
-	if (pil == SUN4D_IPI_IRQ)
-		sun4d_ipi_interrupt();
-#endif
-
-	old_regs = set_irq_regs(regs);
-	irq_enter();
-	if (sbusl == 0) {
-		/* cpu interrupt */
-		struct irq_bucket *p;
-
-		p = irq_map[pil];
-		while (p) {
-			struct irq_bucket *next;
-
-			next = p->next;
-			generic_handle_irq(p->irq);
-			p = next;
-		}
-	} else {
-		/* SBUS interrupt */
-		sun4d_sbus_handler_irq(sbusl);
-	}
-	irq_exit();
-	set_irq_regs(old_regs);
-}
-
-
-static void sun4d_mask_irq(struct irq_data *data)
-{
-	struct sun4d_handler_data *handler_data = irq_data_get_irq_handler_data(data);
-	unsigned int real_irq;
-#ifdef CONFIG_SMP
-	int cpuid = handler_data->cpuid;
-	unsigned long flags;
-#endif
-	real_irq = handler_data->real_irq;
-#ifdef CONFIG_SMP
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
-	cc_set_imsk_other(cpuid, cc_get_imsk_other(cpuid) | (1 << real_irq));
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
-#else
-	cc_set_imsk(cc_get_imsk() | (1 << real_irq));
-#endif
-}
-
-static void sun4d_unmask_irq(struct irq_data *data)
-{
-	struct sun4d_handler_data *handler_data = irq_data_get_irq_handler_data(data);
-	unsigned int real_irq;
-#ifdef CONFIG_SMP
-	int cpuid = handler_data->cpuid;
-	unsigned long flags;
-#endif
-	real_irq = handler_data->real_irq;
-
-#ifdef CONFIG_SMP
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
-	cc_set_imsk_other(cpuid, cc_get_imsk_other(cpuid) & ~(1 << real_irq));
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
-#else
-	cc_set_imsk(cc_get_imsk() & ~(1 << real_irq));
-#endif
-}
-
-static unsigned int sun4d_startup_irq(struct irq_data *data)
-{
-	irq_link(data->irq);
-	sun4d_unmask_irq(data);
-	return 0;
-}
-
-static void sun4d_shutdown_irq(struct irq_data *data)
-{
-	sun4d_mask_irq(data);
-	irq_unlink(data->irq);
-}
-
-static struct irq_chip sun4d_irq = {
-	.name		= "sun4d",
-	.irq_startup	= sun4d_startup_irq,
-	.irq_shutdown	= sun4d_shutdown_irq,
-	.irq_unmask	= sun4d_unmask_irq,
-	.irq_mask	= sun4d_mask_irq,
-};
-
-#ifdef CONFIG_SMP
-/* Setup IRQ distribution scheme. */
-void __init sun4d_distribute_irqs(void)
-{
-	struct device_node *dp;
-
-	int cpuid = cpu_logical_map(1);
-
-	if (cpuid == -1)
-		cpuid = cpu_logical_map(0);
-	for_each_node_by_name(dp, "sbi") {
-		int devid = of_getintprop_default(dp, "device-id", 0);
-		int board = of_getintprop_default(dp, "board#", 0);
-		board_to_cpu[board] = cpuid;
-		set_sbi_tid(devid, cpuid << 3);
-	}
-	printk(KERN_ERR "All sbus IRQs directed to CPU%d\n", cpuid);
-}
-#endif
-
-static void sun4d_clear_clock_irq(void)
-{
-	sbus_readl(&sun4d_timers->l10_timer_limit);
-}
-
-static void sun4d_load_profile_irq(int cpu, unsigned int limit)
-{
-	unsigned int value = limit ? timer_value(limit) : 0;
-	bw_set_prof_limit(cpu, value);
-}
-
-static void __init sun4d_load_profile_irqs(void)
-{
-	int cpu = 0, mid;
-
-	while (!cpu_find_by_instance(cpu, NULL, &mid)) {
-		sun4d_load_profile_irq(mid >> 3, 0);
-		cpu++;
-	}
-}
-
-static unsigned int _sun4d_build_device_irq(unsigned int real_irq,
-                                            unsigned int pil,
-                                            unsigned int board)
-{
-	struct sun4d_handler_data *handler_data;
-	unsigned int irq;
-
-	irq = irq_alloc(real_irq, pil);
-	if (irq == 0) {
-		prom_printf("IRQ: allocate for %d %d %d failed\n",
-			real_irq, pil, board);
-		goto err_out;
-	}
-
-	handler_data = irq_get_handler_data(irq);
-	if (unlikely(handler_data))
-		goto err_out;
-
-	handler_data = kzalloc(sizeof(struct sun4d_handler_data), GFP_ATOMIC);
-	if (unlikely(!handler_data)) {
-		prom_printf("IRQ: kzalloc(sun4d_handler_data) failed.\n");
-		prom_halt();
-	}
-	handler_data->cpuid    = board_to_cpu[board];
-	handler_data->real_irq = real_irq;
-	irq_set_chip_and_handler_name(irq, &sun4d_irq,
-	                              handle_level_irq, "level");
-	irq_set_handler_data(irq, handler_data);
-
-err_out:
-	return irq;
-}
-
-
-
-static unsigned int sun4d_build_device_irq(struct platform_device *op,
-                                           unsigned int real_irq)
-{
-	struct device_node *dp = op->dev.of_node;
-	struct device_node *board_parent, *bus = dp->parent;
-	char *bus_connection;
-	const struct linux_prom_registers *regs;
-	unsigned int pil;
-	unsigned int irq;
-	int board, slot;
-	int sbusl;
-
-	irq = real_irq;
-	while (bus) {
-		if (of_node_name_eq(bus, "sbi")) {
-			bus_connection = "io-unit";
-			break;
-		}
-
-		if (of_node_name_eq(bus, "bootbus")) {
-			bus_connection = "cpu-unit";
-			break;
-		}
-
-		bus = bus->parent;
-	}
-	if (!bus)
-		goto err_out;
-
-	regs = of_get_property(dp, "reg", NULL);
-	if (!regs)
-		goto err_out;
-
-	slot = regs->which_io;
-
-	/*
-	 * If Bus nodes parent is not io-unit/cpu-unit or the io-unit/cpu-unit
-	 * lacks a "board#" property, something is very wrong.
-	 */
-	if (!of_node_name_eq(bus->parent, bus_connection)) {
-		printk(KERN_ERR "%pOF: Error, parent is not %s.\n",
-			bus, bus_connection);
-		goto err_out;
-	}
-	board_parent = bus->parent;
-	board = of_getintprop_default(board_parent, "board#", -1);
-	if (board == -1) {
-		printk(KERN_ERR "%pOF: Error, lacks board# property.\n",
-			board_parent);
-		goto err_out;
-	}
-
-	sbusl = pil_to_sbus[real_irq];
-	if (sbusl)
-		pil = sun4d_encode_irq(board, sbusl, slot);
-	else
-		pil = real_irq;
-
-	irq = _sun4d_build_device_irq(real_irq, pil, board);
-err_out:
-	return irq;
-}
-
-static unsigned int sun4d_build_timer_irq(unsigned int board,
-                                          unsigned int real_irq)
-{
-	return _sun4d_build_device_irq(real_irq, real_irq, board);
-}
-
-
-static void __init sun4d_init_timers(void)
-{
-	struct device_node *dp;
-	struct resource res;
-	unsigned int irq;
-	const u32 *reg;
-	int err;
-	int board;
-
-	dp = of_find_node_by_name(NULL, "cpu-unit");
-	if (!dp) {
-		prom_printf("sun4d_init_timers: Unable to find cpu-unit\n");
-		prom_halt();
-	}
-
-	/* Which cpu-unit we use is arbitrary, we can view the bootbus timer
-	 * registers via any cpu's mapping.  The first 'reg' property is the
-	 * bootbus.
-	 */
-	reg = of_get_property(dp, "reg", NULL);
-	if (!reg) {
-		prom_printf("sun4d_init_timers: No reg property\n");
-		prom_halt();
-	}
-
-	board = of_getintprop_default(dp, "board#", -1);
-	if (board == -1) {
-		prom_printf("sun4d_init_timers: No board# property on cpu-unit\n");
-		prom_halt();
-	}
-
-	of_node_put(dp);
-
-	res.start = reg[1];
-	res.end = reg[2] - 1;
-	res.flags = reg[0] & 0xff;
-	sun4d_timers = of_ioremap(&res, BW_TIMER_LIMIT,
-				  sizeof(struct sun4d_timer_regs), "user timer");
-	if (!sun4d_timers) {
-		prom_printf("sun4d_init_timers: Can't map timer regs\n");
-		prom_halt();
-	}
-
-#ifdef CONFIG_SMP
-	sparc_config.cs_period = SBUS_CLOCK_RATE * 2;  /* 2 seconds */
-#else
-	sparc_config.cs_period = SBUS_CLOCK_RATE / HZ; /* 1/HZ sec  */
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-	sbus_writel(timer_value(sparc_config.cs_period),
-		    &sun4d_timers->l10_timer_limit);
-
-	master_l10_counter = &sun4d_timers->l10_cur_count;
-
-	irq = sun4d_build_timer_irq(board, SUN4D_TIMER_IRQ);
-	err = request_irq(irq, timer_interrupt, IRQF_TIMER, "timer", NULL);
-	if (err) {
-		prom_printf("sun4d_init_timers: request_irq() failed with %d\n",
-		             err);
-		prom_halt();
-	}
-	sun4d_load_profile_irqs();
-}
-
-void __init sun4d_init_sbi_irq(void)
-{
-	struct device_node *dp;
-	int target_cpu;
-
-	target_cpu = boot_cpu_id;
-	for_each_node_by_name(dp, "sbi") {
-		int devid = of_getintprop_default(dp, "device-id", 0);
-		int board = of_getintprop_default(dp, "board#", 0);
-		unsigned int mask;
-
-		set_sbi_tid(devid, target_cpu << 3);
-		board_to_cpu[board] = target_cpu;
-
-		/* Get rid of pending irqs from PROM */
-		mask = acquire_sbi(devid, 0xffffffff);
-		if (mask) {
-			printk(KERN_ERR "Clearing pending IRQs %08x on SBI %d\n",
-			       mask, board);
-			release_sbi(devid, mask);
-		}
-	}
-}
-
-void __init sun4d_init_IRQ(void)
-{
-	local_irq_disable();
-
-	sparc_config.init_timers      = sun4d_init_timers;
-	sparc_config.build_device_irq = sun4d_build_device_irq;
-	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
-	sparc_config.clear_clock_irq  = sun4d_clear_clock_irq;
-	sparc_config.load_profile_irq = sun4d_load_profile_irq;
-
-	/* Cannot enable interrupts until OBP ticker is disabled. */
-}
diff --git a/arch/sparc/kernel/sun4d_smp.c b/arch/sparc/kernel/sun4d_smp.c
index be5bcbee1af4..7f49a8fa3e3a 100644
--- a/arch/sparc/kernel/sun4d_smp.c
+++ b/arch/sparc/kernel/sun4d_smp.c
@@ -65,7 +65,6 @@ void sun4d_cpu_pre_starting(void *arg)
 
 void sun4d_cpu_pre_online(void *arg)
 {
-	unsigned long flags;
 	int cpuid;
 
 	cpuid = hard_smp_processor_id();
@@ -103,9 +102,7 @@ void sun4d_cpu_pre_online(void *arg)
 	while (!cpumask_test_cpu(cpuid, &smp_commenced_mask))
 		barrier();
 
-	spin_lock_irqsave(&sun4d_imsk_lock, flags);
 	cc_set_imsk(cc_get_imsk() & ~0x4000); /* Allow PIL 14 as well */
-	spin_unlock_irqrestore(&sun4d_imsk_lock, flags);
 }
 
 /*
@@ -177,7 +174,6 @@ void __init smp4d_smp_done(void)
 
 	/* Ok, they are spinning and ready to go. */
 	smp_processors_ready = 1;
-	sun4d_distribute_irqs();
 }
 
 /* Memory structure giving interrupt handler information about IPI generated */
diff --git a/arch/sparc/kernel/sun4m_irq.c b/arch/sparc/kernel/sun4m_irq.c
index 1079638986b5..1a220a2b9ac3 100644
--- a/arch/sparc/kernel/sun4m_irq.c
+++ b/arch/sparc/kernel/sun4m_irq.c
@@ -187,103 +187,6 @@ static unsigned long sun4m_imask[0x50] = {
 	0, SUN4M_INT_VME(6), 0, 0
 };
 
-static void sun4m_mask_irq(struct irq_data *data)
-{
-	struct sun4m_handler_data *handler_data;
-	int cpu = smp_processor_id();
-
-	handler_data = irq_data_get_irq_handler_data(data);
-	if (handler_data->mask) {
-		unsigned long flags;
-
-		local_irq_save(flags);
-		if (handler_data->percpu) {
-			sbus_writel(handler_data->mask, &sun4m_irq_percpu[cpu]->set);
-		} else {
-			sbus_writel(handler_data->mask, &sun4m_irq_global->mask_set);
-		}
-		local_irq_restore(flags);
-	}
-}
-
-static void sun4m_unmask_irq(struct irq_data *data)
-{
-	struct sun4m_handler_data *handler_data;
-	int cpu = smp_processor_id();
-
-	handler_data = irq_data_get_irq_handler_data(data);
-	if (handler_data->mask) {
-		unsigned long flags;
-
-		local_irq_save(flags);
-		if (handler_data->percpu) {
-			sbus_writel(handler_data->mask, &sun4m_irq_percpu[cpu]->clear);
-		} else {
-			sbus_writel(handler_data->mask, &sun4m_irq_global->mask_clear);
-		}
-		local_irq_restore(flags);
-	}
-}
-
-static unsigned int sun4m_startup_irq(struct irq_data *data)
-{
-	irq_link(data->irq);
-	sun4m_unmask_irq(data);
-	return 0;
-}
-
-static void sun4m_shutdown_irq(struct irq_data *data)
-{
-	sun4m_mask_irq(data);
-	irq_unlink(data->irq);
-}
-
-static struct irq_chip sun4m_irq = {
-	.name		= "sun4m",
-	.irq_startup	= sun4m_startup_irq,
-	.irq_shutdown	= sun4m_shutdown_irq,
-	.irq_mask	= sun4m_mask_irq,
-	.irq_unmask	= sun4m_unmask_irq,
-};
-
-
-static unsigned int sun4m_build_device_irq(struct platform_device *op,
-					   unsigned int real_irq)
-{
-	struct sun4m_handler_data *handler_data;
-	unsigned int irq;
-	unsigned int pil;
-
-	if (real_irq >= OBP_INT_LEVEL_VME) {
-		prom_printf("Bogus sun4m IRQ %u\n", real_irq);
-		prom_halt();
-	}
-	pil = (real_irq & 0xf);
-	irq = irq_alloc(real_irq, pil);
-
-	if (irq == 0)
-		goto out;
-
-	handler_data = irq_get_handler_data(irq);
-	if (unlikely(handler_data))
-		goto out;
-
-	handler_data = kzalloc(sizeof(struct sun4m_handler_data), GFP_ATOMIC);
-	if (unlikely(!handler_data)) {
-		prom_printf("IRQ: kzalloc(sun4m_handler_data) failed.\n");
-		prom_halt();
-	}
-
-	handler_data->mask = sun4m_imask[real_irq];
-	handler_data->percpu = real_irq < OBP_INT_LEVEL_ONBOARD;
-	irq_set_chip_and_handler_name(irq, &sun4m_irq,
-	                              handle_level_irq, "level");
-	irq_set_handler_data(irq, handler_data);
-
-out:
-	return irq;
-}
-
 struct sun4m_timer_percpu {
 	u32		l14_limit;
 	u32		l14_count;
@@ -293,21 +196,6 @@ struct sun4m_timer_percpu {
 
 static struct sun4m_timer_percpu __iomem *timers_percpu[SUN4M_NCPUS];
 
-struct sun4m_timer_global {
-	u32		l10_limit;
-	u32		l10_count;
-	u32		l10_limit_noclear;
-	u32		reserved;
-	u32		timer_config;
-};
-
-static struct sun4m_timer_global __iomem *timers_global;
-
-static void sun4m_clear_clock_irq(void)
-{
-	sbus_readl(&timers_global->l10_limit);
-}
-
 void sun4m_nmi(struct pt_regs *regs)
 {
 	unsigned long afsr, afar, si;
@@ -348,131 +236,3 @@ void sun4m_clear_profile_irq(int cpu)
 {
 	sbus_readl(&timers_percpu[cpu]->l14_limit);
 }
-
-static void sun4m_load_profile_irq(int cpu, unsigned int limit)
-{
-	unsigned int value = limit ? timer_value(limit) : 0;
-	sbus_writel(value, &timers_percpu[cpu]->l14_limit);
-}
-
-static void __init sun4m_init_timers(void)
-{
-	struct device_node *dp = of_find_node_by_name(NULL, "counter");
-	int i, err, len, num_cpu_timers;
-	unsigned int irq;
-	const u32 *addr;
-
-	if (!dp) {
-		printk(KERN_ERR "sun4m_init_timers: No 'counter' node.\n");
-		return;
-	}
-
-	addr = of_get_property(dp, "address", &len);
-	of_node_put(dp);
-	if (!addr) {
-		printk(KERN_ERR "sun4m_init_timers: No 'address' prop.\n");
-		return;
-	}
-
-	num_cpu_timers = (len / sizeof(u32)) - 1;
-	for (i = 0; i < num_cpu_timers; i++) {
-		timers_percpu[i] = (void __iomem *)
-			(unsigned long) addr[i];
-	}
-	timers_global = (void __iomem *)
-		(unsigned long) addr[num_cpu_timers];
-
-	/* Every per-cpu timer works in timer mode */
-	sbus_writel(0x00000000, &timers_global->timer_config);
-
-#ifdef CONFIG_SMP
-	sparc_config.cs_period = SBUS_CLOCK_RATE * 2;  /* 2 seconds */
-	sparc_config.features |= FEAT_L14_ONESHOT;
-#else
-	sparc_config.cs_period = SBUS_CLOCK_RATE / HZ; /* 1/HZ sec  */
-	sparc_config.features |= FEAT_L10_CLOCKEVENT;
-#endif
-	sparc_config.features |= FEAT_L10_CLOCKSOURCE;
-	sbus_writel(timer_value(sparc_config.cs_period),
-	            &timers_global->l10_limit);
-
-	master_l10_counter = &timers_global->l10_count;
-
-	irq = sun4m_build_device_irq(NULL, SUN4M_TIMER_IRQ);
-
-	err = request_irq(irq, timer_interrupt, IRQF_TIMER, "timer", NULL);
-	if (err) {
-		printk(KERN_ERR "sun4m_init_timers: Register IRQ error %d.\n",
-			err);
-		return;
-	}
-
-	for (i = 0; i < num_cpu_timers; i++)
-		sbus_writel(0, &timers_percpu[i]->l14_limit);
-	if (num_cpu_timers == 4)
-		sbus_writel(SUN4M_INT_E14, &sun4m_irq_global->mask_set);
-
-#ifdef CONFIG_SMP
-	{
-		unsigned long flags;
-		struct tt_entry *trap_table = &sparc_ttable[SP_TRAP_IRQ1 + (14 - 1)];
-
-		/* For SMP we use the level 14 ticker, however the bootup code
-		 * has copied the firmware's level 14 vector into the boot cpu's
-		 * trap table, we must fix this now or we get squashed.
-		 */
-		local_irq_save(flags);
-		trap_table->inst_one = lvl14_save[0];
-		trap_table->inst_two = lvl14_save[1];
-		trap_table->inst_three = lvl14_save[2];
-		trap_table->inst_four = lvl14_save[3];
-		local_ops->cache_all();
-		local_irq_restore(flags);
-	}
-#endif
-}
-
-void __init sun4m_init_IRQ(void)
-{
-	struct device_node *dp = of_find_node_by_name(NULL, "interrupt");
-	int len, i, mid, num_cpu_iregs;
-	const u32 *addr;
-
-	if (!dp) {
-		printk(KERN_ERR "sun4m_init_IRQ: No 'interrupt' node.\n");
-		return;
-	}
-
-	addr = of_get_property(dp, "address", &len);
-	of_node_put(dp);
-	if (!addr) {
-		printk(KERN_ERR "sun4m_init_IRQ: No 'address' prop.\n");
-		return;
-	}
-
-	num_cpu_iregs = (len / sizeof(u32)) - 1;
-	for (i = 0; i < num_cpu_iregs; i++) {
-		sun4m_irq_percpu[i] = (void __iomem *)
-			(unsigned long) addr[i];
-	}
-	sun4m_irq_global = (void __iomem *)
-		(unsigned long) addr[num_cpu_iregs];
-
-	local_irq_disable();
-
-	sbus_writel(~SUN4M_INT_MASKALL, &sun4m_irq_global->mask_set);
-	for (i = 0; !cpu_find_by_instance(i, NULL, &mid); i++)
-		sbus_writel(~0x17fff, &sun4m_irq_percpu[mid]->clear);
-
-	if (num_cpu_iregs == 4)
-		sbus_writel(0, &sun4m_irq_global->interrupt_target);
-
-	sparc_config.init_timers      = sun4m_init_timers;
-	sparc_config.build_device_irq = sun4m_build_device_irq;
-	sparc_config.clock_rate       = SBUS_CLOCK_RATE;
-	sparc_config.clear_clock_irq  = sun4m_clear_clock_irq;
-	sparc_config.load_profile_irq = sun4m_load_profile_irq;
-
-
-	/* Cannot enable interrupts until OBP ticker is disabled. */
-}
diff --git a/arch/sparc/mm/io-unit.c b/arch/sparc/mm/io-unit.c
index d8376f61b4d0..d94d7868feb9 100644
--- a/arch/sparc/mm/io-unit.c
+++ b/arch/sparc/mm/io-unit.c
@@ -86,8 +86,6 @@ static int __init iounit_init(void)
 		of_propagate_archdata(op);
 	}
 
-	sun4d_init_sbi_irq();
-
 	return 0;
 }
 

-- 
2.34.1


