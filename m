Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2F63A8E26
	for <lists+linux-usb@lfdr.de>; Wed, 16 Jun 2021 03:16:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230454AbhFPBS1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Jun 2021 21:18:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:38120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229979AbhFPBS1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Jun 2021 21:18:27 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 45845611EE;
        Wed, 16 Jun 2021 01:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623806181;
        bh=a0o8jld/a8iCcQymEe2lQvky21fGeym9H0WKCTHwG74=;
        h=Date:From:To:Cc:Subject:From;
        b=EcefwWlCSASiYqG/m5imeLPGXLoQvMZOanQx1OpAM/HoFeumDK6Dl8Pjma6Bxqi1d
         ftIXKo6hEnwTPfqy300VBRaIl3Gc/Ye+rkft8HSZznTH3MW0Bnc2VBVLegXV3ffUEd
         Gef7ygLU4vaWwljQkcHac5ZHLh1kk7bXEQ79HRseM/xV64ZgLZcjsXk9f9NTJQJHI2
         2ckLtDpqjlU94sT7PA/mDF0DvomZpUx84zDPJtVzd03YmbIqeiBi7QQ8R2729uug4/
         O2MjLEFDgcuFR4+SXygXxDmhsQ6sW3iEjM8OGOxEiyKqzIIwNSArpYtbF7DpSuANqC
         QlLfMBhNp527A==
Date:   Wed, 16 Jun 2021 09:16:17 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] usb: fixes for v5.13
Message-ID: <20210616011617.GA19494@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a9aecef198faae3240921b707bc09b602e966fce:

  usb: cdnsp: Fix deadlock issue in cdnsp_thread_irq_handler (2021-05-27 09:36:20 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc7

for you to fetch changes up to c6d580d96f140596d69220f60ce0cfbea4ee5c0f:

  usb: chipidea: imx: Fix Battery Charger 1.2 CDP detection (2021-06-16 09:04:22 +0800)

----------------------------------------------------------------
One bug fix for USB charger detection at imx7d and imx8m series SoCs

----------------------------------------------------------------
Breno Lima (1):
      usb: chipidea: imx: Fix Battery Charger 1.2 CDP detection

 drivers/usb/chipidea/usbmisc_imx.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 

Thanks,
Peter Chen

