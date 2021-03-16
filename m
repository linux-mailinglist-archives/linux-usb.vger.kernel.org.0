Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA6BB33CA4F
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 01:25:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbhCPAZT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 20:25:19 -0400
Received: from mail.kernel.org ([198.145.29.99]:55788 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhCPAYy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 20:24:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2E29C64DD7;
        Tue, 16 Mar 2021 00:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615854293;
        bh=NF7rWj5+seYmZ1ibSD2CQbd9lzR7JhDGjL88IQ51qTY=;
        h=Date:From:To:Cc:Subject:From;
        b=HvfgTjackpXxoSesMiyR+Dw2goADqTic+ZMf4/V2QEU8b/03KHk8cjkgBLuCJTQ74
         jpzZOqwD+cTBe0rwuT40VgscbLkFxFjp/WLQGDBiX/uCpViq0iPVXv+E0HOLBNa4UM
         YWIFHqUna1Pew+Xoh8s42tBsPzY1e9Y75sFyiPdWq8X/uAa0qozYX8f/XaAGX+1Le/
         yvQrQWECmt3WhcheUZUV9G3wSH9OVjFvSASq/fliK/2/3/vzK8Sowr8m5JMLXEx4Zr
         X5IR0Gx5cOmjCgf6NaE+nTxd1JQgmHDs4UxE9nPyIADtViOotZvA2bKqleXtgoy/jF
         r+irEA4zk4YNg==
Date:   Tue, 16 Mar 2021 08:24:50 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.12
Message-ID: <20210316002450.GA15335@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.12-rc4

for you to fetch changes up to d0dcd90b7f472691de122515eb0d1765808b6d91:

  usb: cdnsp: Fixes incorrect value in ISOC TRB (2021-03-13 22:03:24 +0800)

----------------------------------------------------------------
It fixed one incorrect value issue for cdns ssp driver

----------------------------------------------------------------
Pawel Laszczak (1):
      usb: cdnsp: Fixes incorrect value in ISOC TRB

 drivers/usb/cdns3/cdnsp-ring.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 

Thanks,
Peter Chen

