Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84EAF12762F
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2019 08:07:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727165AbfLTHHe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Dec 2019 02:07:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:57426 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbfLTHHe (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Dec 2019 02:07:34 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DA83524679;
        Fri, 20 Dec 2019 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576825652;
        bh=DsXW0Gs0MivMncxjTRzFK4LBCsqpOeFEz2Rkne+5NfE=;
        h=Date:From:To:Cc:Subject:From;
        b=fXeukvU40uyFie6dkYH7y56kHDdbd8KQOw3ROSZuJOw0zDRn1YJanbxxZYtdrNCty
         aiu+rBTEyQeQG2taT1D/uAafdg99A1yFWCllykAo9T9zd/bM9DfE3lp01e1WMip9iw
         KlMUv0ae/ufrL45Wq4qCiDRf5BBFaGeQwvuwG5v4=
Date:   Fri, 20 Dec 2019 08:07:30 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for 5.5-rc3
Message-ID: <20191220070730.GA2190076@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The following changes since commit d1eef1c619749b2a57e514a3fa67d9a516ffa919:

  Linux 5.5-rc2 (2019-12-15 15:16:08 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-5.5-rc3

for you to fetch changes up to 6056a0f8ede27b296d10ef46f7f677cc9d715371:

  usb: xhci: Fix build warning seen with CONFIG_PM=n (2019-12-18 19:23:42 +0100)

----------------------------------------------------------------
USB fixes for 5.5-rc3

Here are some small USB fixes for some reported issues.

Included in here are:
  - xhci build warning fix
  - ehci disconnect warning fix
  - usbip lockup fix and error cleanup fix
  - typec build fix

All of these have been in linux-next with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Erkka Talvitie (1):
      USB: EHCI: Do not return -EPIPE when hub is disconnected

Guenter Roeck (1):
      usb: xhci: Fix build warning seen with CONFIG_PM=n

Suwan Kim (2):
      usbip: Fix receive error in vhci-hcd when using scatter-gather
      usbip: Fix error path of vhci_recv_ret_submit()

zhong jiang (1):
      usb: typec: fusb302: Fix an undefined reference to 'extcon_get_state'

 drivers/usb/host/ehci-q.c        | 13 ++++++++++++-
 drivers/usb/host/xhci-pci.c      |  2 +-
 drivers/usb/typec/tcpm/Kconfig   |  1 +
 drivers/usb/usbip/usbip_common.c |  3 +++
 drivers/usb/usbip/vhci_rx.c      | 13 +++++++++----
 5 files changed, 26 insertions(+), 6 deletions(-)
