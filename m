Return-Path: <linux-usb+bounces-31785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 21059CE4E6A
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 13:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4DA063017020
	for <lists+linux-usb@lfdr.de>; Sun, 28 Dec 2025 12:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FDEE2E54B3;
	Sun, 28 Dec 2025 12:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aJZxRPDK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED062E36F8;
	Sun, 28 Dec 2025 12:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766925871; cv=none; b=p8a/KhKA3uCOz5RSAxPyArkSYQdlMeqwECtbRZwZrZguFV04WxY65++niY3i4mJiT1oVlJrjshjuTqxixCL0o0D2AWSSUssTK2hk35+9KnLizBIaHEO1nU0zO1imbSwo6zDu1NN2szCN+nCZyj2DnxaYN4mu9HIDIS5kIqkDP6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766925871; c=relaxed/simple;
	bh=7c9S4tstvUJy8SctuYVwrPWCg1jYZ3iMiBlz6vITYYs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GyXPRTSjj9GXZ/zRfjh2UF7fBln9cQkThbDnWO8ksOlWqA5rtkcvgJ1cwzxi/oLoEAJekRDeaDz8OYqbXKrCd5db42cfMPJ0lYC1vB3ck8pnrP7TOiOjmGPfIQ5AFv1d3Qz6dEoc9MxZJRLPq+yRi8u+bv30gLKn4jmuCiQQUW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aJZxRPDK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFF09C4CEFB;
	Sun, 28 Dec 2025 12:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766925871;
	bh=7c9S4tstvUJy8SctuYVwrPWCg1jYZ3iMiBlz6vITYYs=;
	h=Date:From:To:Cc:Subject:From;
	b=aJZxRPDK5MdDPpGK5QOBeeAz9WdkoBpVUXfGCquwpBj4kIs9OthXPcwMNZMl+FLio
	 eVWz5322tFgbmFMnX1ybbgUS7CfMhhPo8m9ipVgXXf4yc/K824CxOme1MklbypV8Ha
	 DgrMSdc/itY0OmXHTimad2zoeqhgrcTazNltuN4Q=
Date: Sun, 28 Dec 2025 13:44:28 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.19-rc3
Message-ID: <aVEmLOWNDg7eHH5L@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc3

for you to fetch changes up to 22201800f198ad33c225e5ce2f0f254df828d01b:

  Merge patch series "usb: typec: ucsi: revert broken buffer management" (2025-12-23 15:59:03 +0100)

----------------------------------------------------------------
USB fixes for 6.19-rc3

Here are some small USB fixes, and bunch of reverts for 6.19-rc3.
Included in here are:
  - reverts of some typec ucsi driver changes that had a lot of
    regression reports after -rc1.  Let's just revert it all for now and
    it will come back in a way that is better tested.
  - other typec bugfixes
  - usb-storage quirk fixups
  - dwc3 driver fix
  - other minor USB fixes for reported problems.

All of these have passed 0-day testing and individual testing.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Arnd Bergmann (1):
      usb: typec: ucsi: huawei-gaokin: add DRM dependency

Chen Changcheng (1):
      usb: usb-storage: Maintain minimal modifications to the bcdDevice range.

Duoming Zhou (1):
      usb: phy: fsl-usb: Fix use-after-free in delayed work during device removal

Greg Kroah-Hartman (3):
      Revert "usb: typec: ucsi: Get connector status after enable notifications"
      Revert "usb: typec: ucsi: Fix null pointer dereference in ucsi_sync_control_common"
      Merge patch series "usb: typec: ucsi: revert broken buffer management"

Haoxiang Li (2):
      usb: renesas_usbhs: Fix a resource leak in usbhs_pipe_malloc()
      usb: typec: altmodes/displayport: Drop the device reference in dp_altmode_probe()

Hsin-Te Yuan (1):
      usb: typec: ucsi: Get connector status after enable notifications

Johan Hovold (9):
      usb: gadget: lpc32xx_udc: fix clock imbalance in error path
      usb: phy: isp1301: fix non-OF device reference imbalance
      usb: ohci-nxp: fix device leak on probe failure
      usb: gadget: lpc32xx_udc: clean up probe error labels
      usb: ohci-nxp: clean up probe error labels
      Revert "usb: typec: ucsi: Add support for SET_PDOS command"
      Revert "usb: typec: ucsi: Enable debugfs for message_out data structure"
      Revert "usb: typec: ucsi: Add support for message out data structure"
      Revert "usb: typec: ucsi: Update UCSI structure to have message in and message out fields"

Ma Ke (1):
      USB: lpc32xx_udc: Fix error handling in probe

Mario Limonciello (AMD) (1):
      usb: typec: ucsi: Fix null pointer dereference in ucsi_sync_control_common

Miaoqian Lin (1):
      usb: dwc3: of-simple: fix clock resource leak in dwc3_of_simple_probe

Udipto Goswami (1):
      usb: dwc3: keep susphy enabled during exit to avoid controller faults

Łukasz Bartosik (1):
      xhci: dbgtty: fix device unregister: fixup

 drivers/usb/dwc3/dwc3-of-simple.c        |   7 +-
 drivers/usb/dwc3/gadget.c                |   2 +-
 drivers/usb/dwc3/host.c                  |   2 +-
 drivers/usb/gadget/udc/lpc32xx_udc.c     |  42 ++++++-----
 drivers/usb/host/ohci-nxp.c              |  18 ++---
 drivers/usb/host/xhci-dbgtty.c           |   2 +-
 drivers/usb/phy/phy-fsl-usb.c            |   1 +
 drivers/usb/phy/phy-isp1301.c            |   7 +-
 drivers/usb/renesas_usbhs/pipe.c         |   2 +
 drivers/usb/storage/unusual_uas.h        |   2 +-
 drivers/usb/typec/altmodes/displayport.c |   8 ++-
 drivers/usb/typec/ucsi/Kconfig           |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c    |   5 +-
 drivers/usb/typec/ucsi/debugfs.c         |  36 ++--------
 drivers/usb/typec/ucsi/displayport.c     |  11 +--
 drivers/usb/typec/ucsi/ucsi.c            | 118 ++++++++++---------------------
 drivers/usb/typec/ucsi/ucsi.h            |  22 ++----
 drivers/usb/typec/ucsi/ucsi_acpi.c       |  25 ++-----
 drivers/usb/typec/ucsi/ucsi_ccg.c        |  11 +--
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c  |  15 ++--
 20 files changed, 130 insertions(+), 207 deletions(-)

