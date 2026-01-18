Return-Path: <linux-usb+bounces-32461-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 19461D3975A
	for <lists+linux-usb@lfdr.de>; Sun, 18 Jan 2026 16:11:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CB0F300B2BE
	for <lists+linux-usb@lfdr.de>; Sun, 18 Jan 2026 15:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9864B33AD94;
	Sun, 18 Jan 2026 15:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="1YHrgMpG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DEA1FC7;
	Sun, 18 Jan 2026 15:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768749079; cv=none; b=l7Vb0UIikCBp1fWeGppXHowen6WYkRDbqnYhOHd55s7Kvkh1gdISQe5JkC+jc93uCzj+BsEXHfFQuM3LQB4M4ySaDHO5V8yyAsngakOw/Q2xJeyQBt2vto0yOvSvtTb88GnJgxgjqOGdWTkZvNhZ7qbz+zSJnCoCSWMNXTfdaVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768749079; c=relaxed/simple;
	bh=6o64gC0MsxYrpfy9kpLT2oGXj1hN4m1mSpZ35roU50U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bDVqFvwb8GBKSeW0BZQKyTGMX0PbLwIoQqjLJ6j1adant7qAa7VMzmSCejdgv7zbVdvs3TcLRo1Sl1UOxYFipHOCo8zfWCGvlpuHdOzvIkgg5S4Usd3k9B/5T440VGUdruZZ/sphxiv357iG2slYkblijVNy2YWvCYmS1fRw0fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=1YHrgMpG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69917C116D0;
	Sun, 18 Jan 2026 15:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768749078;
	bh=6o64gC0MsxYrpfy9kpLT2oGXj1hN4m1mSpZ35roU50U=;
	h=Date:From:To:Cc:Subject:From;
	b=1YHrgMpGXEa/L/3dJT0OeJNSPTuEHeqESuh5FS4Z+xkFBZ8+PGnUx1wtRcFxZO/zy
	 9gt22K5r4SXhNHQuFUwNaB+qDP+TV6mFCXqk8s84h5/1zRig5hP1XxYzWiodwCmJTB
	 p7gm6quwUaJdqVVWQMA5BM1sp8e/dkT2v16KTKCQ=
Date: Sun, 18 Jan 2026 16:11:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 6.19-rc6
Message-ID: <aWz4Eyh6898JjAzB@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da:

  Linux 6.19-rc3 (2025-12-28 13:24:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc6

for you to fetch changes up to dd83dc1249737b837ac5d57c81f2b0977c613d9f:

  xhci: sideband: don't dereference freed ring when removing sideband endpoint (2026-01-16 12:19:37 +0100)

----------------------------------------------------------------
USB fixes for 6.19-rc6

Here are some small USB fixes and new device ids for 6.19-rc6

Included in here are:
  - new usb-serial device ids
  - dwc3-apple driver fixes to get things working properly on that
    hardware platform
  - ohci/uhci platfrom driver module soft-deps with ehci to remove a
    runtime warning that sometimes shows up on some platforms.
  - quirk for broken devices that can not handle reading the BOS
    descriptor from them without going crazy.
  - usb-serial driver fixes
  - xhci driver fixes
  - usb gadget driver fixes

All of these except for the last xhci fix has been in linux-next for a
while.  The xhci fix has been reported by others to solve the issue for
them, so should be ok.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Arnaud Ferraris (1):
      tcpm: allow looking for role_sw device in the main node

Ethan Nelson-Moore (1):
      USB: serial: ftdi_sio: add support for PICAXE AXE027 cable

Greg Kroah-Hartman (1):
      Merge tag 'usb-serial-6.19-rc6' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Huacai Chen (1):
      USB: OHCI/UHCI: Add soft dependencies on ehci_platform

Janne Grunau (1):
      usb: dwc3: apple: Ignore USB role switches to the active role

Ji-Ze Hong (Peter Hong) (1):
      USB: serial: f81232: fix incomplete serial port generation

Johannes Brüderl (1):
      usb: core: add USB_QUIRK_NO_BOS for devices that hang on BOS descriptor

Krzysztof Kozlowski (2):
      dt-bindings: usb: qcom,dwc3: Correct IPQ5018 interrupts
      dt-bindings: usb: qcom,dwc3: Correct MSM8994 interrupts

Mathias Nyman (1):
      xhci: sideband: don't dereference freed ring when removing sideband endpoint

Sven Peter (1):
      usb: dwc3: apple: Set USB2 PHY mode before dwc3 init

Thinh Nguyen (1):
      usb: dwc3: Check for USB4 IP_NAME

Ulrich Mohr (1):
      USB: serial: option: add Telit LE910 MBIM composition

Wayne Chang (1):
      usb: host: xhci-tegra: Use platform_get_irq_optional() for wake IRQs

Xu Yang (4):
      usb: gadget: uvc: fix req_payload_size calculation
      usb: gadget: uvc: fix interval_duration calculation
      usb: gadget: uvc: return error from uvcg_queue_init()
      usb: gadget: uvc: retry vb2_reqbufs() with vb_vmalloc_memops if use_sg fail

 .../devicetree/bindings/usb/qcom,dwc3.yaml         |  4 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  4 +-
 drivers/usb/core/config.c                          |  5 ++
 drivers/usb/core/quirks.c                          |  3 +
 drivers/usb/dwc3/core.c                            |  2 +
 drivers/usb/dwc3/core.h                            |  1 +
 drivers/usb/dwc3/dwc3-apple.c                      | 64 +++++++++++++-----
 drivers/usb/gadget/function/f_uvc.c                |  4 ++
 drivers/usb/gadget/function/uvc.h                  |  3 +-
 drivers/usb/gadget/function/uvc_queue.c            | 23 +++++--
 drivers/usb/gadget/function/uvc_video.c            | 14 ++--
 drivers/usb/host/ohci-platform.c                   |  1 +
 drivers/usb/host/uhci-platform.c                   |  1 +
 drivers/usb/host/xhci-sideband.c                   |  1 -
 drivers/usb/host/xhci-tegra.c                      |  2 +-
 drivers/usb/host/xhci.c                            | 15 ++++-
 drivers/usb/serial/f81232.c                        | 77 +++++++++++++---------
 drivers/usb/serial/ftdi_sio.c                      |  1 +
 drivers/usb/serial/ftdi_sio_ids.h                  |  2 +
 drivers/usb/serial/option.c                        |  1 +
 drivers/usb/typec/tcpm/tcpm.c                      |  2 +-
 include/linux/usb/quirks.h                         |  3 +
 22 files changed, 166 insertions(+), 67 deletions(-)

