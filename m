Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF8927D8F9
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 22:40:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729780AbgI2UkM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 16:40:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729324AbgI2Ufs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Sep 2020 16:35:48 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BF52C0613D2;
        Tue, 29 Sep 2020 13:35:47 -0700 (PDT)
Message-Id: <20200929203500.071597188@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601411746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=zDgJwSbJCA+MuakKWIIYI2iSP44g1VtIIgPU/+Xoi30=;
        b=OWYJZWTeoyPok/OfbMfE/krKN3fMc7z/9tQdL+rGUNeJ/Irgj0ugp2TkJwJZmEkGO+ZbTT
        waYdbX7gd9yKoZM4SCSHbQuOEoxag0lAEjQPyn1dwIfnDRxyyECjsAjZepkDEkZ6+GSEJN
        vc7VTCUsOW2akQCbmi5f/lB/lupw0jkobT5u2f/iye33pBdew8qZgVBMDaosOIIHSSh6TN
        vFCaaBkrBAyldr1FoseQUHccUiCXMqNcu2MH/q0Qk7+tqt/EhetRtqo9Awg9kRritb6nmg
        MRW/BAwaPUNhqQlrUDAugC6MHhA4Vgi57dkAlrgGTBUflHl7/k6PIs95xJw/8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601411746;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=zDgJwSbJCA+MuakKWIIYI2iSP44g1VtIIgPU/+Xoi30=;
        b=//KDY86qJDlhiOgtHyoTJPj3vj107Xio3KldaaDalcG/u/K6HxuoTv2FlvZBG6g74ef9Hj
        VJXGYGhdnjrdBgDQ==
Date:   Tue, 29 Sep 2020 22:25:15 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Christian Benvenuti <benve@cisco.com>,
        Govindarajulu Varadarajan <_govind@gmx.com>,
        Dave Miller <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Jay Cliburn <jcliburn@gmail.com>,
        Chris Snook <chris.snook@gmail.com>,
        Vishal Kulkarni <vishal@chelsio.com>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        intel-wired-lan@lists.osuosl.org,
        Shannon Nelson <snelson@pensando.io>,
        Pensando Drivers <drivers@pensando.io>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Solarflare linux maintainers <linux-net-drivers@solarflare.com>,
        Edward Cree <ecree@solarflare.com>,
        Martin Habets <mhabets@solarflare.com>,
        Jon Mason <jdmason@kudzu.us>, Daniel Drake <dsd@gentoo.org>,
        Ulrich Kunitz <kune@deine-taler.de>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arend van Spriel <arend.vanspriel@broadcom.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Chi-Hsien Lin <chi-hsien.lin@cypress.com>,
        Wright Feng <wright.feng@cypress.com>,
        brcm80211-dev-list.pdl@broadcom.com,
        brcm80211-dev-list@cypress.com,
        Stanislav Yakovlev <stas.yakovlev@gmail.com>,
        Stanislaw Gruszka <stf_xl@wp.pl>,
        Johannes Berg <johannes.berg@intel.com>,
        Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
        Luca Coelho <luciano.coelho@intel.com>,
        Intel Linux Wireless <linuxwifi@intel.com>,
        Jouni Malinen <j@w1.fi>,
        Amitkumar Karwar <amitkarwar@gmail.com>,
        Ganapathi Bhat <ganapathi.bhat@nxp.com>,
        Xinming Hu <huxinming820@gmail.com>,
        libertas-dev@lists.infradead.org,
        Pascal Terjan <pterjan@google.com>,
        Ping-Ke Shih <pkshih@realtek.com>
Subject: [patch V2 06/36] net: cxgb3: Cleanup in_interrupt() usage
References: <20200929202509.673358734@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Thomas Gleixner <tglx@linutronix.de>

t3_sge_stop() is called from task context and from error handlers in
interrupt context. It relies on in_interrupt() to differentiate the
contexts.

in_interrupt() is deprecated as it is ill defined and does not provide what
it suggests.

Instead of replacing it with some other construct, simply split the
function into t3_sge_stop_dma(), which can be called from any context, and
t3_sge_stop() which can be only called from task context.

This has the advantage that any bogus invocation of t3_sge_stop() from
wrong contexts can be caught by debug kernels instead of being papered over
by the conditional.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>


---
 drivers/net/ethernet/chelsio/cxgb3/adapter.h    |    1 
 drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c |    2 -
 drivers/net/ethernet/chelsio/cxgb3/sge.c        |   44 ++++++++++++++----------
 3 files changed, 29 insertions(+), 18 deletions(-)

--- a/drivers/net/ethernet/chelsio/cxgb3/adapter.h
+++ b/drivers/net/ethernet/chelsio/cxgb3/adapter.h
@@ -313,6 +313,7 @@ void t3_os_link_fault(struct adapter *ad
 void t3_os_link_fault_handler(struct adapter *adapter, int port_id);
 
 void t3_sge_start(struct adapter *adap);
+void t3_sge_stop_dma(struct adapter *adap);
 void t3_sge_stop(struct adapter *adap);
 void t3_start_sge_timers(struct adapter *adap);
 void t3_stop_sge_timers(struct adapter *adap);
--- a/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c
@@ -2996,7 +2996,7 @@ void t3_fatal_err(struct adapter *adapte
 	unsigned int fw_status[4];
 
 	if (adapter->flags & FULL_INIT_DONE) {
-		t3_sge_stop(adapter);
+		t3_sge_stop_dma(adapter);
 		t3_write_reg(adapter, A_XGM_TX_CTRL, 0);
 		t3_write_reg(adapter, A_XGM_RX_CTRL, 0);
 		t3_write_reg(adapter, XGM_REG(A_XGM_TX_CTRL, 1), 0);
--- a/drivers/net/ethernet/chelsio/cxgb3/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb3/sge.c
@@ -3271,30 +3271,40 @@ void t3_sge_start(struct adapter *adap)
 }
 
 /**
- *	t3_sge_stop - disable SGE operation
+ *	t3_sge_stop_dma - Disable SGE DMA engine operation
  *	@adap: the adapter
  *
- *	Disables the DMA engine.  This can be called in emeregencies (e.g.,
- *	from error interrupts) or from normal process context.  In the latter
- *	case it also disables any pending queue restart tasklets.  Note that
- *	if it is called in interrupt context it cannot disable the restart
- *	tasklets as it cannot wait, however the tasklets will have no effect
- *	since the doorbells are disabled and the driver will call this again
- *	later from process context, at which time the tasklets will be stopped
- *	if they are still running.
+ *	Can be invoked from interrupt context e.g.  error handler.
+ *
+ *	Note that this function cannot disable the restart of tasklets as
+ *	it cannot wait if called from interrupt context, however the
+ *	tasklets will have no effect since the doorbells are disabled. The
+ *	driver will call tg3_sge_stop() later from process context, at
+ *	which time the tasklets will be stopped if they are still running.
  */
-void t3_sge_stop(struct adapter *adap)
+void t3_sge_stop_dma(struct adapter *adap)
 {
 	t3_set_reg_field(adap, A_SG_CONTROL, F_GLOBALENABLE, 0);
-	if (!in_interrupt()) {
-		int i;
+}
+
+/**
+ *	t3_sge_stop - disable SGE operation completly
+ *	@adap: the adapter
+ *
+ *	Called from process context. Disables the DMA engine and any
+ *	pending queue restart tasklets.
+ */
+void t3_sge_stop(struct adapter *adap)
+{
+	int i;
+
+	t3_sge_stop_dma(adap);
 
-		for (i = 0; i < SGE_QSETS; ++i) {
-			struct sge_qset *qs = &adap->sge.qs[i];
+	for (i = 0; i < SGE_QSETS; ++i) {
+		struct sge_qset *qs = &adap->sge.qs[i];
 
-			tasklet_kill(&qs->txq[TXQ_OFLD].qresume_tsk);
-			tasklet_kill(&qs->txq[TXQ_CTRL].qresume_tsk);
-		}
+		tasklet_kill(&qs->txq[TXQ_OFLD].qresume_tsk);
+		tasklet_kill(&qs->txq[TXQ_CTRL].qresume_tsk);
 	}
 }
 


