Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BCFC27A329
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 22:00:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726997AbgI0T5V (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 15:57:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726882AbgI0T5R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 15:57:17 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 100A5C0613CE;
        Sun, 27 Sep 2020 12:57:17 -0700 (PDT)
Message-Id: <20200927194920.621578351@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1601236635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=GmRWTTg+MNTA0DaNDIlEXevW16R3g516zjE3yhxS5XQ=;
        b=EcGTRs6kb2RDfe2vyrf2+4PlTt9+1DxF8xx4TukwbvrjHvPN/bK00Rh9OwV+XrLtzQQiKp
        5YkzTiEqP+CUpeMVzxkK770Zn2LqxoGqekXuL4WpC03EEpLfqHHNc+yaATldWUENSYX8uK
        Fpwww0Eg/kIenfNeKQFWF/4R8zudM55O/i8cF0E+53SJuBr+zlRE42pPnxnUHgpw+PpUuw
        yxMnpHdK1H6DVKGV2jJT0QVET6zb9XNaf9xXe3Q8emDzLnwU/sRViGNhTqD5hInVKQ4bkZ
        M6MnBlUz1M+wQzG84vC+cHQ2X8UeSNGr7HJYylvjMNB9y+F5NNaQbmd/ZsW5mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1601236635;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  references:references;
        bh=GmRWTTg+MNTA0DaNDIlEXevW16R3g516zjE3yhxS5XQ=;
        b=hWtxjUGi2gFRAx8XtEhLw5uROxf7tPRASC/GDVwAj2gS8xyWHVw9Vv65j/9pO1/TwqLZ27
        FQxcdeBMHBK0AYBw==
Date:   Sun, 27 Sep 2020 21:48:54 +0200
From:   Thomas Gleixner <tglx@linutronix.de>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Linus Torvalds <torvalds@linuxfoundation.org>,
        Paul McKenney <paulmck@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        Christian Benvenuti <benve@cisco.com>,
        Govindarajulu Varadarajan <_govind@gmx.com>,
        Dave Miller <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Jay Cliburn <jcliburn@gmail.com>,
        Chris Snook <chris.snook@gmail.com>,
        Vishal Kulkarni <vishal@chelsio.com>,
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
Subject: [patch 08/35] net: e100: Remove in_interrupt() usage and pointless
 GFP_ATOMIC allocation
References: <20200927194846.045411263@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

e100_hw_init() invokes e100_self_test() only if in_interrupt() returns
false as e100_self_test() uses msleep() which requires sleepable task
context. The in_interrupt() check is incomplete because in_interrupt()
cannot catch callers from contexts which have just preemption or interrupts
disabled.

e100_hw_init() is invoked from:

  - e100_loopback_test() which clearly is sleepable task context as the
    function uses msleep() itself.

  - e100_up() which clearly is sleepable task context as well because it
    invokes e100_alloc_cbs() abd request_irq() which both require sleepable
    task context due to GFP_KERNEL allocations and mutex_lock() operations.

Remove the pointless in_interrupt() check.

As a side effect of this analysis it turned out that e100_rx_alloc_list()
which is only invoked from e100_loopback_test() and e100_up() pointlessly
uses a GFP_ATOMIC allocation. The next invoked function e100_alloc_cbs() is
using GFP_KERNEL already.

Change the allocation mode in e100_rx_alloc_list() to GFP_KERNEL as well.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org

---
 drivers/net/ethernet/intel/e100.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/net/ethernet/intel/e100.c
+++ b/drivers/net/ethernet/intel/e100.c
@@ -1531,7 +1531,7 @@ static int e100_hw_init(struct nic *nic)
 	e100_hw_reset(nic);
 
 	netif_err(nic, hw, nic->netdev, "e100_hw_init\n");
-	if (!in_interrupt() && (err = e100_self_test(nic)))
+	if ((err = e100_self_test(nic)))
 		return err;
 
 	if ((err = e100_phy_init(nic)))
@@ -2155,7 +2155,7 @@ static int e100_rx_alloc_list(struct nic
 	nic->rx_to_use = nic->rx_to_clean = NULL;
 	nic->ru_running = RU_UNINITIALIZED;
 
-	if (!(nic->rxs = kcalloc(count, sizeof(struct rx), GFP_ATOMIC)))
+	if (!(nic->rxs = kcalloc(count, sizeof(struct rx), GFP_KERNEL)))
 		return -ENOMEM;
 
 	for (rx = nic->rxs, i = 0; i < count; rx++, i++) {

