Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED1B02250D3
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jul 2020 11:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726255AbgGSJOg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jul 2020 05:14:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:46582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725836AbgGSJOg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jul 2020 05:14:36 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1FA272073A;
        Sun, 19 Jul 2020 09:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595150075;
        bh=nF9Kk0fsiiHxdM0DX/V1NeZbZVFr0e0LyaXMRk/e5W8=;
        h=Date:From:To:Cc:Subject:From;
        b=LPtb6vMEOV4QH7ZWqkVex4vT5AAZYTqjvZof9ETRhDuDmu3398k6+lrzqqVGO2pxP
         mal1JY0QydEBpPCvvEIbGQ31PgfiMkCCLZl7WFrEBGH6iNuktN3NGYwJq4sSZ7Q/1N
         /lctXREGFQYHBmQDXAabZQZdY3mvc1mHteoDTNnQ=
Date:   Sun, 19 Jul 2020 11:14:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 5.8-rc6
Message-ID: <20200719091447.GA157963@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit 9ebcfadb0610322ac537dd7aa5d9cbc2b2894c68:

  Linux 5.8-rc3 (2020-06-28 15:00:24 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.8-rc6

for you to fetch changes up to c7300cdf8f683ae00cf74616b5fd14ffac327979:

  Merge tag 'usb-serial-5.8-rc6' of https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2020-07-16 17:30:59 +0200)

----------------------------------------------------------------
USB fixes for 5.8-rc6

Here are a few small USB fixes, and one thunderbolt fix, for 5.8-rc6.

Nothing huge in here, just the normal collection of gadget, dwc2/3,
serial, and other minor USB driver fixes and id additions.  Full details
are in the shortlog.

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
AceLan Kao (1):
      USB: serial: option: add Quectel EG95 LTE modem

Evgeny Novikov (1):
      usb: gadget: udc: gr_udc: fix memleak on error handling path in gr_ep_init()

Greg Kroah-Hartman (4):
      Merge tag 'thunderbolt-fix-for-v5.8-rc4' of git://git.kernel.org/.../westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-5.8-rc5' of https://git.kernel.org/.../johan/usb-serial into usb-linus
      Merge tag 'fixes-for-v5.8-rc3' of git://git.kernel.org/.../balbi/usb into usb-linus
      Merge tag 'usb-serial-5.8-rc6' of https://git.kernel.org/.../johan/usb-serial into usb-linus

Heikki Krogerus (2):
      usb: dwc3: pci: add support for the Intel Tiger Lake PCH -H variant
      usb: dwc3: pci: add support for the Intel Jasper Lake

Igor Moura (1):
      USB: serial: ch341: add new Product ID for CH340

James Hilliard (1):
      USB: serial: cypress_m8: enable Simply Automated UPB PIM

Johan Hovold (1):
      USB: serial: iuu_phoenix: fix memory corruption

Jörgen Storvist (1):
      USB: serial: option: add GosunCn GM500 series

Michał Mirosław (2):
      usb: gadget: udc: atmel: remove outdated comment in usba_ep_disable()
      usb: gadget: udc: atmel: fix uninitialized read in debug printk

Mika Westerberg (1):
      thunderbolt: Fix path indices used in USB3 tunnel discovery

Minas Harutyunyan (1):
      usb: dwc2: Fix shutdown callback in platform

Peter Chen (3):
      usb: chipidea: core: add wakeup support for extcon
      usb: cdns3: ep0: fix some endian issues
      usb: cdns3: trace: fix some endian issues

Randy Dunlap (1):
      usb: gadget: fix langid kernel-doc warning in usbstring.c

Tom Rix (1):
      USB: c67x00: fix use after free in c67x00_giveback_urb

Zhang Qiang (1):
      usb: gadget: function: fix missing spinlock in f_uac1_legacy

 drivers/thunderbolt/tunnel.c                | 12 ++++++------
 drivers/usb/c67x00/c67x00-sched.c           |  2 +-
 drivers/usb/cdns3/ep0.c                     | 30 ++++++++++++++---------------
 drivers/usb/cdns3/trace.h                   |  6 +++---
 drivers/usb/chipidea/core.c                 | 24 +++++++++++++++++++++++
 drivers/usb/dwc2/platform.c                 |  3 ++-
 drivers/usb/dwc3/dwc3-pci.c                 |  8 ++++++++
 drivers/usb/gadget/function/f_uac1_legacy.c |  2 ++
 drivers/usb/gadget/udc/atmel_usba_udc.c     | 10 ++--------
 drivers/usb/gadget/udc/gr_udc.c             |  7 +++++--
 drivers/usb/gadget/usbstring.c              |  2 +-
 drivers/usb/serial/ch341.c                  |  1 +
 drivers/usb/serial/cypress_m8.c             |  2 ++
 drivers/usb/serial/cypress_m8.h             |  3 +++
 drivers/usb/serial/iuu_phoenix.c            |  8 +++++---
 drivers/usb/serial/option.c                 |  6 ++++++
 16 files changed, 86 insertions(+), 40 deletions(-)
