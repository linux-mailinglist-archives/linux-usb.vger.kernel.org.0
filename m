Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07AF92EBD0D
	for <lists+linux-usb@lfdr.de>; Wed,  6 Jan 2021 12:14:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbhAFLOA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 6 Jan 2021 06:14:00 -0500
Received: from mail.kernel.org ([198.145.29.99]:51234 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725788AbhAFLOA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 6 Jan 2021 06:14:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id BEAC82226A;
        Wed,  6 Jan 2021 11:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609931599;
        bh=x0LIrZ8x5m/1MEs8qqVFkppNc03V2+7lBXeYKZKDe+4=;
        h=Date:From:To:Cc:Subject:From;
        b=XsWri7mgbLp0C+ZrD8+l3XahARSE79PwSDmhaGIx0sCQe8dV2tbcqf0qa+xkD2AlB
         +7fN0/p/gfdIYodleiO8g3Akr5CxL4vcXty5mdJ5vIzjwfHYoyCs+zuIaX3hv1YqSx
         Hzu3O2EdH88wLfGnQIGaQJ1mGFCmD73knjVyF3focRNY4uLaEN+8aJppGjGFAOyhkJ
         SwtwBsxMFhlbn65rWufDpRMFP2PmgADz+6FVQa/6gCfaHNObpaDrRmlgu5Np8P+WLU
         GmohCh5kySvJPlp51LGNj0M/Vg7rdXDrbO6bp1gJUcf+mTcSDxBqiRus0eW5fN3Kj7
         HVeWpeMEcKpRA==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kx6kd-00072x-Us; Wed, 06 Jan 2021 12:13:16 +0100
Date:   Wed, 6 Jan 2021 12:13:15 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB-serial fixes for 5.11-rc3
Message-ID: <X/WbS27KrQAbUgfK@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.11-rc3

for you to fetch changes up to 54d0a3ab80f49f19ee916def62fe067596833403:

  USB: serial: iuu_phoenix: fix DMA from stack (2021-01-04 16:30:09 +0100)

----------------------------------------------------------------
USB-serial fixes for 5.11-rc3

Here's a fix for a DMA-from-stack issue in iuu_phoenix and a couple of
new modem device ids.

All have been in linux-next with no reported issues.

----------------------------------------------------------------
Bjørn Mork (1):
      USB: serial: option: add Quectel EM160R-GL

Daniel Palmer (1):
      USB: serial: option: add LongSung M5710 module support

Johan Hovold (1):
      USB: serial: iuu_phoenix: fix DMA from stack

 drivers/usb/serial/iuu_phoenix.c | 20 +++++++++++++++-----
 drivers/usb/serial/option.c      |  3 +++
 2 files changed, 18 insertions(+), 5 deletions(-)
