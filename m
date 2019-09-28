Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 774B5C0F5B
	for <lists+linux-usb@lfdr.de>; Sat, 28 Sep 2019 04:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfI1Cg6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Sep 2019 22:36:58 -0400
Received: from mail.nic.cz ([217.31.204.67]:59632 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbfI1Cg6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 27 Sep 2019 22:36:58 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Sep 2019 22:36:57 EDT
Received: from localhost (unknown [172.20.6.135])
        by mail.nic.cz (Postfix) with ESMTPSA id 6B2C5140E6C;
        Sat, 28 Sep 2019 04:29:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1569637790; bh=oPsVH4Q8uPW/JICE5X/Kykl30D0ud1nhXptnC2f5l1M=;
        h=Date:From:To;
        b=HAcVemmhYvF5c7PLAn3IRwAhwVZckjQHryW1OAFIzedguEZiLOndwEcb1ega4NFaH
         oHLbt3VXSVLTVQWvccV0DQ7tMtLjiSWsRx+jwSISvE/3DKEUz0zXzuKaC0Ju7s5vxu
         A8YaGXT6rOmkFPNpDhbjCQaA/gvReWKz8IAxcYQk=
Date:   Sat, 28 Sep 2019 04:29:50 +0200
From:   Marek Behun <marek.behun@nic.cz>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     linux-usb@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: regression from commit "usb: host: xhci-plat: Prevent an abnormally
 restrictive PHY init skipping"
Message-ID: <20190928042950.3ae07173@nic.cz>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.100.3 at mail.nic.cz
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,SHORTCIRCUIT
        shortcircuit=ham autolearn=disabled version=3.4.2
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.nic.cz
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Miquel,

I am encountering a regression caused by your commit eb6c2eb6c7fb
"usb: host: xhci-plat: Prevent an abnormally restrictive PHY init
skipping" [1]

In the Turris Mox device tree, we use both a comphy and a usb-phy, see
[2]. I am not sure how to solve this now. You write in your commit
message that "While there is not users of both PHY types at the same
time, drop this limitation from the xhci-plat.c driver."

Should I get this patch reverted or try to solve it another way?

Thank you.

Marek

[1]
https://lore.kernel.org/linux-usb/20190731121150.2253-1-miquel.raynal@bootlin.com/
[2]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts#n258
