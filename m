Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1833064D
	for <lists+linux-usb@lfdr.de>; Fri, 31 May 2019 03:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfEaBqj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 May 2019 21:46:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:51140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726576AbfEaBqj (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 30 May 2019 21:46:39 -0400
Received: from localhost (ip67-88-213-2.z213-88-67.customer.algx.net [67.88.213.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFC7126191;
        Fri, 31 May 2019 01:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559267198;
        bh=KpPDgF37BI8PGuzKi/AA8C9Gf/dJFMJfPiiskVuyFmU=;
        h=Date:From:To:Cc:Subject:From;
        b=EQXrIQVgFRXMTKfCDtHfH6Z409V3726d91GnWJ39dPSVwItU2MTlOxUbfgCG+sMYc
         ldq5L2QiPYaF1vl22AhQSFd2Fz0R4svZAqvKHo1Ad+bceFXXtMpCBBBE0EQDgfpkn8
         pClP1k7b10PYDw029XOG0kiPPAilEGcz3b8vZ9/0=
Date:   Thu, 30 May 2019 18:46:37 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for 5.2-rc3
Message-ID: <20190531014637.GA30613@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.2-rc3

for you to fetch changes up to 3ea3091f1bd8586125848c62be295910e9802af0:

  usbip: usbip_host: fix stub_dev lock context imbalance regression (2019-05-29 13:26:32 -0700)

----------------------------------------------------------------
USB fixes for 5.2-rc3

Here are some tiny USB fixes for a number of reported issues for
5.2-rc3.

Nothing huge here, just a small collection of xhci and other driver bugs
that syzbot has been finding in some drivers.  There is also a usbip fix
and a fix for the usbip fix in here :)

All have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Stern (3):
      USB: Fix slab-out-of-bounds write in usb_get_bos_descriptor
      media: usb: siano: Fix general protection fault in smsusb
      media: usb: siano: Fix false-positive "uninitialized variable" warning

Andrey Smirnov (1):
      xhci: Convert xhci_handshake() to use readl_poll_timeout_atomic()

Carsten Schmid (1):
      usb: xhci: avoid null pointer deref when bos field is NULL

Chunfeng Yun (1):
      usb: mtu3: fix up undefined reference to usb_debug_root

Fabio Estevam (1):
      xhci: Use %zu for printing size_t type

Henry Lin (1):
      xhci: update bounce buffer with correct sg num

Jia-Ju Bai (1):
      usb: xhci: Fix a potential null pointer dereference in xhci_debugfs_create_endpoint()

Mathias Nyman (1):
      xhci: Fix immediate data transfer if buffer is already DMA mapped

Mauro Carvalho Chehab (1):
      media: smsusb: better handle optional alignment

Maximilian Luz (1):
      USB: Add LPM quirk for Surface Dock GigE adapter

Oliver Neukum (5):
      USB: sisusbvga: fix oops in error path of sisusb_probe
      USB: rio500: refuse more than one device at a time
      USB: rio500: fix memory leak in close after disconnect
      USB: rio500: simplify locking
      USB: rio500: update Documentation

Shuah Khan (2):
      usbip: usbip_host: fix BUG: sleeping function called from invalid context
      usbip: usbip_host: fix stub_dev lock context imbalance regression

 Documentation/usb/rio.txt           | 66 ++++++------------------------
 drivers/media/usb/siano/smsusb.c    | 33 +++++++++------
 drivers/usb/core/config.c           |  4 +-
 drivers/usb/core/quirks.c           |  3 ++
 drivers/usb/host/xhci-debugfs.c     |  3 ++
 drivers/usb/host/xhci-ring.c        | 26 ++++++++----
 drivers/usb/host/xhci.c             | 24 +++++------
 drivers/usb/host/xhci.h             |  3 +-
 drivers/usb/misc/rio500.c           | 80 ++++++++++++++++++++++---------------
 drivers/usb/misc/sisusbvga/sisusb.c | 15 +++----
 drivers/usb/mtu3/mtu3_debugfs.c     |  3 +-
 drivers/usb/usbip/stub_dev.c        | 75 ++++++++++++++++++++++++----------
 12 files changed, 182 insertions(+), 153 deletions(-)
