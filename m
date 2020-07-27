Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 643FF22FDDE
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jul 2020 01:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727789AbgG0XXw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 19:23:52 -0400
Received: from mail.kernel.org ([198.145.29.99]:34678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727080AbgG0XXv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 19:23:51 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2ACA920A8B;
        Mon, 27 Jul 2020 23:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595892230;
        bh=a7+jqbpnd8sBWZRYKOrHM91lfcH6g+4prjK5QM+D2Nc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NSt+iLsrN5Drm2UxB3Qk9SIRTXC3qr12+5hnK8iEXt+TsIir4dbS2BtNGDy5ApM7F
         MUonB9OGI4B7KkFWCtaTdHbzMtKdLIQyjHI7zFdl+JowdN6SJCS+dF/mIRhHi/sPGg
         ErVSKpuVCsyAtjQFlrIXOhwkS5+Ig0ZkGCf3N5Iw=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        "David S . Miller" <davem@davemloft.net>,
        Sasha Levin <sashal@kernel.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 03/25] usb: hso: Fix debug compile warning on sparc32
Date:   Mon, 27 Jul 2020 19:23:23 -0400
Message-Id: <20200727232345.717432-3-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200727232345.717432-1-sashal@kernel.org>
References: <20200727232345.717432-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Geert Uytterhoeven <geert@linux-m68k.org>

[ Upstream commit e0484010ec05191a8edf980413fc92f28050c1cc ]

On sparc32, tcflag_t is "unsigned long", unlike on all other
architectures, where it is "unsigned int":

    drivers/net/usb/hso.c: In function ‘hso_serial_set_termios’:
    include/linux/kern_levels.h:5:18: warning: format ‘%d’ expects argument of type ‘unsigned int’, but argument 4 has type ‘tcflag_t {aka long unsigned int}’ [-Wformat=]
    drivers/net/usb/hso.c:1393:3: note: in expansion of macro ‘hso_dbg’
       hso_dbg(0x16, "Termios called with: cflags new[%d] - old[%d]\n",
       ^~~~~~~
    include/linux/kern_levels.h:5:18: warning: format ‘%d’ expects argument of type ‘unsigned int’, but argument 5 has type ‘tcflag_t {aka long unsigned int}’ [-Wformat=]
    drivers/net/usb/hso.c:1393:3: note: in expansion of macro ‘hso_dbg’
       hso_dbg(0x16, "Termios called with: cflags new[%d] - old[%d]\n",
       ^~~~~~~

As "unsigned long" is 32-bit on sparc32, fix this by casting all tcflag_t
parameters to "unsigned int".
While at it, use "%u" to format unsigned numbers.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/usb/hso.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/usb/hso.c b/drivers/net/usb/hso.c
index bb8c34d746ab3..5f123a8cf68ed 100644
--- a/drivers/net/usb/hso.c
+++ b/drivers/net/usb/hso.c
@@ -1390,8 +1390,9 @@ static void hso_serial_set_termios(struct tty_struct *tty, struct ktermios *old)
 	unsigned long flags;
 
 	if (old)
-		hso_dbg(0x16, "Termios called with: cflags new[%d] - old[%d]\n",
-			tty->termios.c_cflag, old->c_cflag);
+		hso_dbg(0x16, "Termios called with: cflags new[%u] - old[%u]\n",
+			(unsigned int)tty->termios.c_cflag,
+			(unsigned int)old->c_cflag);
 
 	/* the actual setup */
 	spin_lock_irqsave(&serial->serial_lock, flags);
-- 
2.25.1

