Return-Path: <linux-usb+bounces-18704-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4F89F958B
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 16:36:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3403E16C05D
	for <lists+linux-usb@lfdr.de>; Fri, 20 Dec 2024 15:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB431219A79;
	Fri, 20 Dec 2024 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pYrDUaET"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60210219A63;
	Fri, 20 Dec 2024 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708967; cv=none; b=lfuFN6Gm4cg3LIDJx5Xh27EUyZQcOxvHA0T8w/OzFb9IdDkMQOdEVUWbaWltztz8osV4IP/wjfhjiEZWEK3AJKTZu54b9TWJiAku6bRCcqGa/bNVOlq56ybxbamDF0wl+u25QE5EoAK7BGFNNjXqM/W4tZ1Fij1a+72jIPhhPE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708967; c=relaxed/simple;
	bh=fI2l8wjxgTL6CBJ4jSRjLWuA3M+8hNZ068W95H/+hlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BWzlW3qZAp0GiQxNEpLUBPcG4tVMp0/8bm9PqHnYikSpc00eWOCIFrT2h4aOHbJtHPPq0XataRO1NsR7lzepjfFKRtD9ED0FsRxtN/KqNEUgMuvCi2r01y+Ut/nSETuvtbdVSlh2Zdkz3pFOgqLqz8gcKnM+m7Ca4yqpCsaYnYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pYrDUaET; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C04C4CECD;
	Fri, 20 Dec 2024 15:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734708967;
	bh=fI2l8wjxgTL6CBJ4jSRjLWuA3M+8hNZ068W95H/+hlU=;
	h=Date:From:To:Cc:Subject:From;
	b=pYrDUaETp1mZkJ1YAH5fP637TiSdv9qlUIzZ2izNjnF90hViFmylkTkjLZJWVTpgu
	 KpptjnI6X04q4dkBCNkgvunSj7jg4kpNlovSHlDVIlZifXnXNDsIOeuV6gHdImkKml
	 mLjhP13oz0AfQt514ZC/k8bvklIgBWW5DGCuufRI=
Date: Fri, 20 Dec 2024 16:36:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB / Thunderbolt fixes for 6.13-rc4
Message-ID: <Z2WO42XdnBrYmdmN@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.13-rc4

for you to fetch changes up to 1b62f3cb74d2965e8f96f20241b1fe85017aa3e8:

  Merge tag 'thunderbolt-for-v6.13-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus (2024-12-19 12:35:02 +0100)

----------------------------------------------------------------
USB / Thunderbolt fixes for 6.13-rc4

Here are some important, and small, fixes for USB and Thunderbolt issues
that have come up in the -rc releases.  And some new device ids for good
measure.  Included in here are:
  - Much reported xhci bugfix for usb-storage devices (and other devices
    as well, tripped me up on a video camera)
  - thunderbolt fixes for some small reported issues
  - new usb-serial device ids

All of these have been in linux-next this week with no reported issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Daniel Swanemar (1):
      USB: serial: option: add TCL IK512 MBIM & ECM

Daniele Palmas (1):
      USB: serial: option: add Telit FE910C04 rmnet compositions

Greg Kroah-Hartman (2):
      Merge tag 'usb-serial-6.13-rc3' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus
      Merge tag 'thunderbolt-for-v6.13-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus

Jack Wu (1):
      USB: serial: option: add MediaTek T7XX compositions

Mank Wang (1):
      USB: serial: option: add Netprisma LCUK54 modules for WWAN Ready

Mario Limonciello (1):
      thunderbolt: Don't display nvm_version unless upgrade supported

Mathias Nyman (1):
      xhci: Turn NEC specific quirk for handling Stop Endpoint errors generic

Michal Hrusecky (1):
      USB: serial: option: add MeiG Smart SLM770A

Mika Westerberg (2):
      thunderbolt: Add support for Intel Panther Lake-M/P
      thunderbolt: Improve redrive mode handling

Niklas Neronin (1):
      usb: xhci: fix ring expansion regression in 6.13-rc1

 drivers/thunderbolt/nhi.c     |  8 ++++++++
 drivers/thunderbolt/nhi.h     |  4 ++++
 drivers/thunderbolt/retimer.c | 19 +++++++++++++++----
 drivers/thunderbolt/tb.c      | 41 +++++++++++++++++++++++++++++++++++++++++
 drivers/usb/host/xhci-mem.c   |  2 +-
 drivers/usb/host/xhci-ring.c  |  2 --
 drivers/usb/serial/option.c   | 27 +++++++++++++++++++++++++++
 7 files changed, 96 insertions(+), 7 deletions(-)

