Return-Path: <linux-usb+bounces-19222-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C32A0A9E3
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 15:05:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 460CE166B0B
	for <lists+linux-usb@lfdr.de>; Sun, 12 Jan 2025 14:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BEF1B6D0F;
	Sun, 12 Jan 2025 14:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wRbhIfCs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E02A18CBFE;
	Sun, 12 Jan 2025 14:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736690709; cv=none; b=l2G7WIevp4FIXm9EJr3XI/cqSGJupAOriZm/iDIKhtC6Sd0ZZ1JeEEkAO4SccldWvUnkYSzr0r/Qxifl/c/A5KkAsf/On4byv0t9vBgbqITAAjkvPJqpAVA151nJJGpHIMWLJhbYQ+5b0vb2uyS+8E6b1vRh6PDRo5sZIAGcvLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736690709; c=relaxed/simple;
	bh=agK2oSOW2chP2B3Ne2p+C6B8+p1yYJn3GhrLgczeFhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ziecvf3ttDTij4U/Bm/709yV/c3aya7WDkycSV/p5tks+AoeJwb/veWNm7tHzmssuny2bdXPslthGSehNUxu05uomHvRVNZ2Jwdfgtoz0vM+aJyD0Hhb/QiuRDjKJv1bENmWSUuxPrFV71hOvNvcBhi9i5tzqSsC0wrJRBt/Aoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wRbhIfCs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B45EC4CEDF;
	Sun, 12 Jan 2025 14:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1736690708;
	bh=agK2oSOW2chP2B3Ne2p+C6B8+p1yYJn3GhrLgczeFhg=;
	h=Date:From:To:Cc:Subject:From;
	b=wRbhIfCsBWGevaSATGnWzWRWinM+8izOIFKQGeE5/F7ZU3eCuwsPz59uYxeYIQZCQ
	 lrAnr8kKr6eP7PB4Ium9QlNMcrtkxug7L+er+xb0/uzWc9KIp0kLK/XONU/yJkmyZE
	 6uEbZVv6WmwsGGjZ246imf3f/sMsVy9hF5n8hXwA=
Date: Sun, 12 Jan 2025 15:05:05 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB fixes for 6.13-rc7
Message-ID: <Z4PMEd1UC6-ew5wY@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 4bbf9020becbfd8fc2c3da790855b7042fad455b:

  Linux 6.13-rc4 (2024-12-22 13:22:21 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc7

for you to fetch changes up to f3149ed697dd0c4fc1d696fef78129fa2fe4ca12:

  Merge tag 'usb-serial-6.13-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2025-01-10 14:59:20 +0100)

----------------------------------------------------------------
USB fixes for 6.13-rc7

Here are some small USB driver fixes and new device ids for 6.13-rc7.
Included in here are:
  - usb serial new device ids
  - typec bugfixes for reported issues
  - dwc3 driver fixes
  - chipidea driver fixes
  - gadget driver fixes
  - other minor fixes for reported problems.

All of these have been in linux-next for a while, with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abel Vesa (1):
      usb: typec: ucsi: Set orientation as none when connector is unplugged

Akash M (1):
      usb: gadget: f_fs: Remove WARN_ON in functionfs_bind

André Draszik (1):
      usb: dwc3: gadget: fix writing NYET threshold

Chukun Pan (1):
      USB: serial: option: add MeiG Smart SRM815

Dan Carpenter (1):
      usb: typec: tcpm/tcpci_maxim: fix error code in max_contaminant_read_resistance_kohm()

GONG Ruiqi (1):
      usb: typec: fix pm usage counter imbalance in ucsi_ccg_sync_control()

Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-6.13-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Ingo Rohloff (1):
      usb: gadget: configfs: Ignore trailing LF for user strings to cdev

Joe Hattori (1):
      usb: chipidea: ci_hdrc_imx: decrement device's refcount in .remove() and in the error path of .probe()

Johan Hovold (1):
      USB: serial: cp210x: add Phoenix Contact UPS Device

Jun Yan (1):
      USB: usblp: return error when setting unsupported protocol

Kai-Heng Feng (1):
      USB: core: Disable LPM only for non-suspended ports

Lianqin Hu (1):
      usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null

Lubomir Rintel (1):
      usb-storage: Add max sectors quirk for Nokia 208

Ma Ke (1):
      usb: fix reference leak in usb_new_device()

Michal Hrusecky (1):
      USB: serial: option: add Neoway N723-EA support

Prashanth K (2):
      usb: dwc3-am62: Disable autosuspend during remove
      usb: gadget: f_uac2: Fix incorrect setting of bNumEndpoints

Takashi Iwai (1):
      usb: gadget: midi2: Reverse-select at the right place

Xu Yang (2):
      usb: host: xhci-plat: set skip_phy_initialization if software node has XHCI_SKIP_PHY_INIT property
      usb: typec: tcpci: fix NULL pointer issue on shared irq case

 drivers/usb/chipidea/ci_hdrc_imx.c         | 25 +++++++++++++++++--------
 drivers/usb/class/usblp.c                  |  7 ++++---
 drivers/usb/core/hub.c                     |  6 ++++--
 drivers/usb/core/port.c                    |  7 ++++---
 drivers/usb/dwc3/core.h                    |  1 +
 drivers/usb/dwc3/dwc3-am62.c               |  1 +
 drivers/usb/dwc3/gadget.c                  |  4 +++-
 drivers/usb/gadget/Kconfig                 |  4 ++--
 drivers/usb/gadget/configfs.c              |  6 +++++-
 drivers/usb/gadget/function/f_fs.c         |  2 +-
 drivers/usb/gadget/function/f_uac2.c       |  1 +
 drivers/usb/gadget/function/u_serial.c     |  8 ++++----
 drivers/usb/host/xhci-plat.c               |  3 ++-
 drivers/usb/serial/cp210x.c                |  1 +
 drivers/usb/serial/option.c                |  4 +++-
 drivers/usb/storage/unusual_devs.h         |  7 +++++++
 drivers/usb/typec/tcpm/maxim_contaminant.c |  4 ++--
 drivers/usb/typec/tcpm/tcpci.c             | 25 +++++++++++++++----------
 drivers/usb/typec/ucsi/ucsi_ccg.c          |  4 ++--
 drivers/usb/typec/ucsi/ucsi_glink.c        |  5 +++++
 20 files changed, 84 insertions(+), 41 deletions(-)

