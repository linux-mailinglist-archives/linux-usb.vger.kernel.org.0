Return-Path: <linux-usb+bounces-31042-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB1AC92956
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 17:34:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B02694E00CF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 16:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977BA265632;
	Fri, 28 Nov 2025 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SK9j3gmg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA03BEACE;
	Fri, 28 Nov 2025 16:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764347644; cv=none; b=qSCBjB78F34ux2OE5dvGhMhVu1lxQ68RsHSC37Mw/Z7rQ/OtJWKP2E0sXbU5VgyXLisZYvFA1x0HI3J3I0pnb5HB4r8mQICBztFy7XZ7jifKkv9Yy6m2oth0TPgSHolwTvMZtxOY8SBUDrnebPdq8cyx6nCVkzxnasmwVN23ZGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764347644; c=relaxed/simple;
	bh=9aHW2RgoujPHnjs3cFlsmNMLi26sfEbPysrzDYeL/sI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Js99r/5o96uRSyVHFPhMjude4ZA11DeLSoYgRG6mm3Dt0hWa8N2iL9CMCrp2T1A983cu8RuGy/Y7GoCKRvJxzJGvpNUhweBcOmGp99LTYqXpJVypkw4oNclbEdBGewunPtwtgdLGwoMK8YcE6Ir6RlovWmj5Xbd5nrZ8Xc3oETw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SK9j3gmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BD3C4CEF1;
	Fri, 28 Nov 2025 16:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764347642;
	bh=9aHW2RgoujPHnjs3cFlsmNMLi26sfEbPysrzDYeL/sI=;
	h=Date:From:To:Cc:Subject:From;
	b=SK9j3gmgsPOY2JsIZaxiynPNogXcWj/m3DsFwme/aITLnSZPm+M6hJtudVUW+3AKs
	 PL+JCfyNyEdizd8840UCjbA5bW41zr0qDfxv8OjxfXRm3x3Leyi9I/5NS7ZQawbKR8
	 P85JhUuValGuyYxViF+B6BhHS9lBiA/ryqByE24g=
Date: Fri, 28 Nov 2025 17:33:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver fixes for 6.18-rc8
Message-ID: <aSnO91JZkop49hKI@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa:

  Linux 6.18-rc3 (2025-10-26 15:59:49 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.18-rc8

for you to fetch changes up to 74851fbb6d647304f8a7dc491434d3a335ef4b8d:

  usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors (2025-11-24 18:00:45 +0100)

----------------------------------------------------------------
USB/Thunderbolt fixes for 6.18-rc8

Here are some last-minutes USB and Thunderbolt driver fixes and new
device ids for 6.18-rc8.  Included in here are:
  - usb storage quirk fixup
  - xhci driver fixes for reported issues
  - usb gadget driver fixes
  - dwc3 driver fixes
  - UAS driver fixup
  - thunderbolt new device ids
  - usb-serial driver new ids

All of these have been in linux-next with no reported issues, many for
many weeks.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Borzeszkowski (1):
      thunderbolt: Add support for Intel Wildcat Lake

Alan Stern (1):
      USB: storage: Remove subclass and protocol overrides from Novatek quirk

Claudiu Beznea (1):
      usb: renesas_usbhs: Fix synchronous external abort on unbind

Desnes Nunes (1):
      usb: storage: Fix memory leak in USB bulk transport

Greg Kroah-Hartman (2):
      Merge tag 'thunderbolt-for-v6.18-rc4' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-6.18-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Haotian Zhang (1):
      usb: gadget: renesas_usbf: Handle devm_pm_runtime_enable() errors

Heikki Krogerus (2):
      usb: dwc3: pci: add support for the Intel Nova Lake -S
      usb: dwc3: pci: Sort out the Intel device IDs

Jameson Thies (1):
      usb: typec: ucsi: psy: Set max current to zero when disconnected

Jamie Iles (1):
      drivers/usb/dwc3: fix PCI parent check

Jimmy Hu (1):
      usb: gadget: udc: fix use-after-free in usb_gadget_state_work

Kuen-Han Tsai (1):
      usb: gadget: f_eem: Fix memory leak in eem_unwrap

Manish Nagar (1):
      usb: dwc3: Fix race condition between concurrent dwc3_remove_requests() call paths

Mathias Nyman (3):
      xhci: fix stale flag preventig URBs after link state error is cleared
      xhci: dbgtty: Fix data corruption when transmitting data form DbC to host
      xhci: sideband: Fix race condition in sideband unregister

Miaoqian Lin (1):
      usb: cdns3: Fix double resource release in cdns3_pci_probe

Oleksandr Suvorov (1):
      USB: serial: ftdi_sio: add support for u-blox EVK-M101

Owen Gu (1):
      usb: uas: fix urb unmapping issue when the uas device is remove during ongoing data transfer

Tianchu Chen (1):
      usb: storage: sddr55: Reject out-of-bound new_pba

Vanillan Wang (1):
      USB: serial: option: add support for Rolling RW101R-GL

Łukasz Bartosik (1):
      xhci: dbgtty: fix device unregister

 drivers/thunderbolt/nhi.c             |   2 +
 drivers/thunderbolt/nhi.h             |   1 +
 drivers/usb/cdns3/cdns3-pci-wrap.c    |   5 +-
 drivers/usb/dwc3/core.c               |   3 +-
 drivers/usb/dwc3/dwc3-pci.c           |  82 ++++++++++++++-------------
 drivers/usb/dwc3/ep0.c                |   1 +
 drivers/usb/dwc3/gadget.c             |   7 +++
 drivers/usb/gadget/function/f_eem.c   |   7 ++-
 drivers/usb/gadget/udc/core.c         |  17 +++++-
 drivers/usb/gadget/udc/renesas_usbf.c |   4 +-
 drivers/usb/host/xhci-dbgcap.h        |   1 +
 drivers/usb/host/xhci-dbgtty.c        |  23 +++++++-
 drivers/usb/host/xhci-ring.c          |  15 +++--
 drivers/usb/host/xhci-sideband.c      | 102 +++++++++++++++++++---------------
 drivers/usb/host/xhci.c               |   1 +
 drivers/usb/renesas_usbhs/common.c    |  14 ++---
 drivers/usb/serial/ftdi_sio.c         |   1 +
 drivers/usb/serial/ftdi_sio_ids.h     |   1 +
 drivers/usb/serial/option.c           |  10 +++-
 drivers/usb/storage/sddr55.c          |   6 ++
 drivers/usb/storage/transport.c       |  16 ++++++
 drivers/usb/storage/uas.c             |   5 ++
 drivers/usb/storage/unusual_devs.h    |   2 +-
 drivers/usb/typec/ucsi/psy.c          |   5 ++
 include/linux/usb/gadget.h            |   5 ++
 25 files changed, 228 insertions(+), 108 deletions(-)

