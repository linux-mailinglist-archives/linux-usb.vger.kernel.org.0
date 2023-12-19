Return-Path: <linux-usb+bounces-4370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C85081932A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 23:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50C8F1C213C8
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 22:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5F9546435;
	Tue, 19 Dec 2023 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pGlZ5+O5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFC63D0DE;
	Tue, 19 Dec 2023 22:03:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5C25C433AB;
	Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703023395;
	bh=l7H1/Ge1nRjMVx7Hs3hW3qsONOZuyDDJPFFUe8cJFmQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=pGlZ5+O5pKRM6RW7wKXknomhhgWrvXmEIoGDufYCMR+zfAJJv3im9hAuAFfhC07Ne
	 s57NHK1ysjzspCYzJm5IpXFg2Rk7F9ck9MNTCihb+vyMeyvStDfhVarwS8FycM8dxd
	 dwstzXu13cn6ModN0JH+6huwj2SazPw86Ld0Gs46KiJR/RncCGdRn3tzR+OnHd0aK0
	 5nGnbzqU0GyC/WBZbHTMCjC9gXZPfhs+o4IzfozejtG4gNxgv76s+JmtRtt0TNqyFc
	 DkjG0WdbEgw0q7+4dC1p0E/3yECAnxq4yhLaSNh/6r5lPx7/3USuAgzOAh2Iyt8KZv
	 ULnYcZKGRWqEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A75C46CD7;
	Tue, 19 Dec 2023 22:03:15 +0000 (UTC)
From: Sam Ravnborg via B4 Relay <devnull+sam.ravnborg.org@kernel.org>
Date: Tue, 19 Dec 2023 23:03:13 +0100
Subject: [PATCH 08/27] sparc32: Drop patching of interrupt vector
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231219-sam-sparc32-sunset-v3-v1-8-64bb44b598c5@ravnborg.org>
References: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
In-Reply-To: <20231219-sam-sparc32-sunset-v3-v1-0-64bb44b598c5@ravnborg.org>
To: "David S. Miller" <davem@davemloft.net>, 
 Arnd Bergmann <arnd@kernel.org>, Andreas Larsson <andreas@gaisler.com>
Cc: Helge Deller <deller@gmx.de>, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alan Stern <stern@rowland.harvard.edu>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, sparclinux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-sound@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1703023392; l=6266;
 i=sam@ravnborg.org; s=20230107; h=from:subject:message-id;
 bh=6WXUtHucXVIC1CvsnHFkmt7ZnTvhcm6yclCPOtQXlG8=; =?utf-8?q?b=3D+fl0Mw1vxUIC?=
 =?utf-8?q?jNtGXW2+/mruhy0H+Fj6QtYuJqYz5LoeHz3J4Is35ammoJ3uxSYREENnAYIwXtc8?=
 qq5N8hUlD1Dg1MOvNvVUgGcqe6sTi+mZXrLmK7J2j0DupzTex70N
X-Developer-Key: i=sam@ravnborg.org; a=ed25519;
 pk=R0+pqV7BRYOAeOIGkyOrSNke7arx5y3LkEuNi37YEyU=
X-Endpoint-Received: by B4 Relay for sam@ravnborg.org/20230107 with auth_id=22
X-Original-From: Sam Ravnborg <sam@ravnborg.org>
Reply-To: <sam@ravnborg.org>

From: Sam Ravnborg <sam@ravnborg.org>

Drop the sun4m specific handling and the patching that
takes place in sun4d and LEON.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/kernel/entry.S       | 98 -----------------------------------------
 arch/sparc/kernel/kernel.h      |  1 -
 arch/sparc/kernel/leon_kernel.c | 16 -------
 arch/sparc/kernel/sun4d_irq.c   | 25 -----------
 4 files changed, 140 deletions(-)

diff --git a/arch/sparc/kernel/entry.S b/arch/sparc/kernel/entry.S
index 7cf148a996b9..9bd3813b872d 100644
--- a/arch/sparc/kernel/entry.S
+++ b/arch/sparc/kernel/entry.S
@@ -79,15 +79,6 @@ bad_trap_handler:
 real_irq_entry:
 	SAVE_ALL
 
-#ifdef CONFIG_SMP
-	.globl	patchme_maybe_smp_msg
-
-	cmp	%l7, 11
-patchme_maybe_smp_msg:
-	bgu	maybe_smp4m_msg
-	 nop
-#endif
-
 real_irq_continue:
 	or	%l0, PSR_PIL, %g2
 	wr	%g2, 0x0, %psr
@@ -105,95 +96,6 @@ patch_handler_irq:
 	RESTORE_ALL
 
 #ifdef CONFIG_SMP
-	/* SMP per-cpu ticker interrupts are handled specially. */
-smp4m_ticker:
-	bne	real_irq_continue+4
-	 or	%l0, PSR_PIL, %g2
-	wr	%g2, 0x0, %psr
-	WRITE_PAUSE
-	wr	%g2, PSR_ET, %psr
-	WRITE_PAUSE
-	call	smp4m_percpu_timer_interrupt
-	 add	%sp, STACKFRAME_SZ, %o0
-	wr	%l0, PSR_ET, %psr
-	WRITE_PAUSE
-	RESTORE_ALL
-
-#define GET_PROCESSOR4M_ID(reg)	\
-	rd	%tbr, %reg;	\
-	srl	%reg, 12, %reg;	\
-	and	%reg, 3, %reg;
-
-	/* Here is where we check for possible SMP IPI passed to us
-	 * on some level other than 15 which is the NMI and only used
-	 * for cross calls.  That has a separate entry point below.
-	 *
-	 * IPIs are sent on Level 12, 13 and 14. See IRQ_IPI_*.
-	 */
-maybe_smp4m_msg:
-	GET_PROCESSOR4M_ID(o3)
-	sethi	%hi(sun4m_irq_percpu), %l5
-	sll	%o3, 2, %o3
-	or	%l5, %lo(sun4m_irq_percpu), %o5
-	sethi	%hi(0x70000000), %o2	! Check all soft-IRQs
-	ld	[%o5 + %o3], %o1
-	ld	[%o1 + 0x00], %o3	! sun4m_irq_percpu[cpu]->pending
-	andcc	%o3, %o2, %g0
-	be,a	smp4m_ticker
-	 cmp	%l7, 14
-	/* Soft-IRQ IPI */
-	st	%o2, [%o1 + 0x04]	! sun4m_irq_percpu[cpu]->clear=0x70000000
-	WRITE_PAUSE
-	ld	[%o1 + 0x00], %g0	! sun4m_irq_percpu[cpu]->pending
-	WRITE_PAUSE
-	or	%l0, PSR_PIL, %l4
-	wr	%l4, 0x0, %psr
-	WRITE_PAUSE
-	wr	%l4, PSR_ET, %psr
-	WRITE_PAUSE
-	srl	%o3, 28, %o2		! shift for simpler checks below
-maybe_smp4m_msg_check_single:
-	andcc	%o2, 0x1, %g0
-	beq,a	maybe_smp4m_msg_check_mask
-	 andcc	%o2, 0x2, %g0
-	call	smp_call_function_single_interrupt
-	 nop
-	andcc	%o2, 0x2, %g0
-maybe_smp4m_msg_check_mask:
-	beq,a	maybe_smp4m_msg_check_resched
-	 andcc	%o2, 0x4, %g0
-	call	smp_call_function_interrupt
-	 nop
-	andcc	%o2, 0x4, %g0
-maybe_smp4m_msg_check_resched:
-	/* rescheduling is done in RESTORE_ALL regardless, but incr stats */
-	beq,a	maybe_smp4m_msg_out
-	 nop
-	call	smp_resched_interrupt
-	 nop
-maybe_smp4m_msg_out:
-	RESTORE_ALL
-
-
-	.globl	smp4d_ticker
-	/* SMP per-cpu ticker interrupts are handled specially. */
-smp4d_ticker:
-	SAVE_ALL
-	or	%l0, PSR_PIL, %g2
-	sethi	%hi(CC_ICLR), %o0
-	sethi	%hi(1 << 14), %o1
-	or	%o0, %lo(CC_ICLR), %o0
-	stha	%o1, [%o0] ASI_M_MXCC	/* Clear PIL 14 in MXCC's ICLR */
-	wr	%g2, 0x0, %psr
-	WRITE_PAUSE
-	wr	%g2, PSR_ET, %psr
-	WRITE_PAUSE
-	call	smp4d_percpu_timer_interrupt
-	 add	%sp, STACKFRAME_SZ, %o0
-	wr	%l0, PSR_ET, %psr
-	WRITE_PAUSE
-	RESTORE_ALL
-
 	.globl	smpleon_ipi
 	.extern leon_ipi_interrupt
 	/* SMP per-cpu IPI interrupts are handled specially. */
diff --git a/arch/sparc/kernel/kernel.h b/arch/sparc/kernel/kernel.h
index 1d3980ac0658..85a3c3d1195e 100644
--- a/arch/sparc/kernel/kernel.h
+++ b/arch/sparc/kernel/kernel.h
@@ -145,7 +145,6 @@ extern char cputypval[];
 extern unsigned long lvl14_save[4];
 extern unsigned int real_irq_entry[];
 extern unsigned int smp4d_ticker[];
-extern unsigned int patchme_maybe_smp_msg[];
 
 /* trampoline_32.S */
 extern unsigned long sun4m_cpu_startup;
diff --git a/arch/sparc/kernel/leon_kernel.c b/arch/sparc/kernel/leon_kernel.c
index 4c61da491fee..ea04bad6a118 100644
--- a/arch/sparc/kernel/leon_kernel.c
+++ b/arch/sparc/kernel/leon_kernel.c
@@ -421,22 +421,6 @@ void __init leon_init_timers(void)
 	if (eirq != 0)
 		leon_eirq_setup(eirq);
 
-#ifdef CONFIG_SMP
-	{
-		unsigned long flags;
-
-		/*
-		 * In SMP, sun4m adds a IPI handler to IRQ trap handler that
-		 * LEON never must take, sun4d and LEON overwrites the branch
-		 * with a NOP.
-		 */
-		local_irq_save(flags);
-		patchme_maybe_smp_msg[0] = 0x01000000; /* NOP out the branch */
-		local_ops->cache_all();
-		local_irq_restore(flags);
-	}
-#endif
-
 	config = LEON3_BYPASS_LOAD_PA(&leon3_gptimer_regs->config);
 	if (config & (1 << LEON3_GPTIMER_SEPIRQ))
 		leon3_gptimer_irq += leon3_gptimer_idx;
diff --git a/arch/sparc/kernel/sun4d_irq.c b/arch/sparc/kernel/sun4d_irq.c
index 9a137c70e8d1..7140cff04b54 100644
--- a/arch/sparc/kernel/sun4d_irq.c
+++ b/arch/sparc/kernel/sun4d_irq.c
@@ -391,30 +391,6 @@ static unsigned int sun4d_build_timer_irq(unsigned int board,
 }
 
 
-static void __init sun4d_fixup_trap_table(void)
-{
-#ifdef CONFIG_SMP
-	unsigned long flags;
-	struct tt_entry *trap_table = &sparc_ttable[SP_TRAP_IRQ1 + (14 - 1)];
-
-	/* Adjust so that we jump directly to smp4d_ticker */
-	lvl14_save[2] += smp4d_ticker - real_irq_entry;
-
-	/* For SMP we use the level 14 ticker, however the bootup code
-	 * has copied the firmware's level 14 vector into the boot cpu's
-	 * trap table, we must fix this now or we get squashed.
-	 */
-	local_irq_save(flags);
-	patchme_maybe_smp_msg[0] = 0x01000000; /* NOP out the branch */
-	trap_table->inst_one = lvl14_save[0];
-	trap_table->inst_two = lvl14_save[1];
-	trap_table->inst_three = lvl14_save[2];
-	trap_table->inst_four = lvl14_save[3];
-	local_ops->cache_all();
-	local_irq_restore(flags);
-#endif
-}
-
 static void __init sun4d_init_timers(void)
 {
 	struct device_node *dp;
@@ -478,7 +454,6 @@ static void __init sun4d_init_timers(void)
 		prom_halt();
 	}
 	sun4d_load_profile_irqs();
-	sun4d_fixup_trap_table();
 }
 
 void __init sun4d_init_sbi_irq(void)

-- 
2.34.1


