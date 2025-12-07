Return-Path: <linux-usb+bounces-31227-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2B1CAAFEC
	for <lists+linux-usb@lfdr.de>; Sun, 07 Dec 2025 01:46:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B7523009137
	for <lists+linux-usb@lfdr.de>; Sun,  7 Dec 2025 00:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49A5217723;
	Sun,  7 Dec 2025 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gofZtYNj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507438F4A;
	Sun,  7 Dec 2025 00:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765068386; cv=none; b=Ad/MkTANhR0QV3Kv+kj8ySUWrbDWyY6DinLzHHuAXa/wiXPLumsLg8x0KVdnNZYy1A7psySNWU558ie7/Mw/QAOEc0LLv5n2cSxrhldeDSONgR0d4VmHxVOeyUX7AE3AL8Mks+IAr0Qz7b3LorxRK0CrCwQJElsXDQOWIy/U9RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765068386; c=relaxed/simple;
	bh=be0INBNCcsR49iff4Qa5z7MV5iKW/32CSZ+Q3TfoMYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lCeLih+g/6K9iMB38G5wVdLvQ5dOWZSz97ji9XFyBWvpQ7W6XGDazB0h9MvqpgNvwqjVphuiclrudL7y6hjNmqqPDoxafYpwkjS1YJfyEhLOJD1afFf31bADr478XUa8Gq7+I8DRkDFfazihqv+3x576YsdLVpLHp/uLvtwl1as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gofZtYNj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB63BC4CEF5;
	Sun,  7 Dec 2025 00:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1765068386;
	bh=be0INBNCcsR49iff4Qa5z7MV5iKW/32CSZ+Q3TfoMYA=;
	h=Date:From:To:Cc:Subject:From;
	b=gofZtYNjYhknQrTqkPcW8PIm6djYKP458vcORL08FxQ6wmtC9ORAMGv5vn7wgtwh9
	 7oIeAqaSj3gPLN6aWh9cSF+hgyCht+yA06jErXUicED8y4moINaDGn41NFf006IJeO
	 dBwdCokeV+1Ns4EPvpfgVYBdVvGbBrXp3M50sBIg=
Date: Sun, 7 Dec 2025 09:46:24 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver updates for 6.19-rc1
Message-ID: <aTTOYMDU73pfRneS@kroah.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.19-rc1

for you to fetch changes up to 2585973c7f9ee31d21e5848c996fab2521fd383d:

  usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt (2025-11-27 10:22:48 +0100)

----------------------------------------------------------------
USB/Thunderbolt changes for 6.19-rc1

Here is the big set of USB and Thunderbolt driver updates for 6.19-rc1.
Nothing major here, just lots of tiny updates for most of the common USB
drivers.  Included in here are:
  - more xhci driver updates and fixes
  - Thunderbolt driver cleanups
  - usb serial driver updates
  - typec driver updates
  - USB tracepoint additions
  - dwc3 driver updates, including support for Apple hardware
  - lots of other smaller driver updates and cleanups

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abel Vesa (2):
      usb: typec: ucsi: Add support for orientation
      usb: typec: ucsi: Set orientation_aware if UCSI version is 2.x and above

Alan Borzeszkowski (17):
      thunderbolt: Update NVM firmware upgrade documentation
      thunderbolt: Update deprecated firmware update site in icm.c
      thunderbolt: Fix typos in ctl.c
      thunderbolt: Fix typos in debugfs.c
      thunderbolt: Fix typos in domain.c
      thunderbolt: Fix typos in icm.c
      thunderbolt: Fix typos in lc.c
      thunderbolt: Fix typos in nhi.c
      thunderbolt: Fix typos in retimer.c
      thunderbolt: Fix typos in switch.c
      thunderbolt: Fix typos in tb.c
      thunderbolt: Fix typos in tb.h
      thunderbolt: Fix typos in tb_regs.h
      thunderbolt: Fix typos in tmu.c
      thunderbolt: Fix typos in tunnel.c
      thunderbolt: Fix typos in usb4.c
      thunderbolt: Fix typos in xdomain.c

André Draszik (1):
      dt-bindings: usb: samsung,exynos-dwc3: add power-domains

Anjelique Melendez (2):
      usb: typec: ucsi_glink: Update request/response buffers to be packed
      usb: typec: ucsi_glink: Increase buffer size to support UCSI v2

Badhri Jagan Sridharan (2):
      tcpm: Parse and log AVS APDO
      usb: typec: pd: Register SPR AVS caps with usb_power_delivery class

Bartosz Golaszewski (1):
      usb: ohci-da8xx: remove unused platform data

Chen Changcheng (1):
      usb: usb-storage: No additional quirks need to be added to the EL-R12 optical drive.

Christophe JAILLET (1):
      xen/usb: Constify struct hc_driver

Claudiu Beznea (5):
      usb: core: Drop spaces after function names
      usb: host: Do not check priv->clks[clk]
      usb: host: ehci-platform: Call reset assert/deassert on suspend/resume
      usb: host: ohci-platform: Call reset assert/deassert on suspend/resume
      usb: renesas_usbhs: Assert/de-assert reset signals on suspend/resume

Cristian Ciocaltea (2):
      usb: vhci-hcd: Switch to dev_err_probe() in probe path
      usb: vhci-hcd: Replace pr_*() with dev_*() logging

David Laight (1):
      drivers/usb/storage: use min() instead of min_t()

Diogo Ivo (1):
      usb: phy: Initialize struct usb_phy list_head

Dominik Karol Piątkowski (1):
      thunderbolt: Fix typo in tb_eeprom_ctl_read documentation

Duoming Zhou (2):
      usb: typec: ucsi: fix probe failure in gaokun_ucsi_probe()
      usb: typec: ucsi: fix use-after-free caused by uec->work

Fabio Porcedda (2):
      USB: serial: option: add Telit Cinterion FE910C04 new compositions
      USB: serial: option: move Telit 0x10c7 composition in the right place

Frank Li (3):
      dt-bindings: usb: add missed compatible string for arm64 layerscape
      usb: dwc3: Add software-managed properties for flattened model
      usb: dwc3: dwc3-generic-plat: Add layerscape dwc3 support

Gopi Krishna Menon (1):
      usb: raw-gadget: cap raw_io transfer length to KMALLOC_MAX_SIZE

Greg Kroah-Hartman (5):
      Revert "USB: disable rust bindings from the build for now"
      Merge patch series "usb: typec: ucsi_glink: Add support UCSI v2"
      Merge 6.18-rc3 into usb-next
      Merge tag 'thunderbolt-for-v6.19-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-nextx
      Merge tag 'usb-serial-6.19-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Hang Cao (2):
      dt-bindings: usb: Add ESWIN EIC7700 USB controller
      usb: dwc3: eic7700: Add EIC7700 USB driver

Haotien Hsu (1):
      usb: gadget: tegra-xudc: Always reinitialize data toggle when clear halt

Hongyu Xie (1):
      usb: xhci: limit run_graceperiod for only usb 3.0 devices

Ivaylo Ivanov (1):
      dt-bindings: usb: samsung,exynos-dwc3 add exynos8890 compatible

Jack Hsu (1):
      dt-bindings: usb: Support MediaTek MT8189 xhci

Jameson Thies (3):
      usb: typec: ucsi: psy: Add power supply status
      usb: typec: ucsi: Report power supply changes on power opmode changes
      usb: typec: ucsi: Report power supply change on sink path change

Jisheng Zhang (2):
      usb: dwc2: fix hang during shutdown if set as peripheral
      usb: dwc2: fix hang during suspend if set as peripheral

Johan Hovold (16):
      USB: serial: belkin_sa: fix TIOCMBIS and TIOCMBIC
      USB: serial: kobil_sct: fix TIOCMBIS and TIOCMBIC
      USB: serial: belkin_sa: clean up tiocmset()
      USB: serial: kobil_sct: clean up tiocmset()
      USB: serial: kobil_sct: clean up device type checks
      USB: serial: kobil_sct: add control request helpers
      USB: serial: kobil_sct: clean up set_termios()
      USB: serial: kobil_sct: drop unnecessary initialisations
      USB: serial: ftdi_sio: match on interface number for jtag
      USB: serial: ftdi_sio: silence jtag probe
      USB: serial: ftdi_sio: rewrite 8u2232c quirk
      USB: serial: ftdi_sio: clean up quirk comments
      USB: serial: ftdi_sio: rename quirk symbols
      USB: serial: ftdi_sio: enable NDI speed hack consistently
      USB: serial: ftdi_sio: clean up NDI speed hack
      USB: serial: ftdi_sio: drop NDI quirk module parameter

Konrad Dybcio (5):
      usb: typec: ps883x: Cache register settings, not Type-C mode
      usb: typec: ps883x: Rework ps883x_set()
      usb: typec: ps883x: Add USB4 mode and TBT3 altmode support
      usb: typec: ps883x: Fix missing mutex_unlock()
      dt-bindings: usb: qcom,snps-dwc3: Add the SM8750 compatible

Krishna Kurapati (3):
      dt-bindings: usb: ti,hd3ss3220: Add support for VBUS based on ID state
      usb: typec: hd3ss3220: Enable VBUS based on ID pin state
      usb: dwc3: core: Remove redundant comment in core init

Kuen-Han Tsai (2):
      usb: core: Centralize device state update logic
      usb: core: Add tracepoints for device allocation and state changes

Lad Prabhakar (1):
      dt-bindings: usb: renesas,rzg3e-xhci: Add RZ/V2H(P) and RZ/V2N support

Liang Jie (1):
      usb: gadget: functionfs: use dma_buf_unmap_attachment_unlocked() helper

Lizhi Xu (1):
      usbip: Fix locking bug in RT-enabled kernels

Marco Crivellari (6):
      thunderbolt: Replace use of system_wq with system_percpu_wq
      usb: xhci: replace use of system_wq with system_percpu_wq
      usb: dwc3: replace use of system_wq with system_percpu_wq
      usb: uas: add WQ_PERCPU to alloc_workqueue users
      USB: add WQ_PERCPU to alloc_workqueue users
      usb: typec: anx7411: add WQ_PERCPU to alloc_workqueue users

Mark Pearson (1):
      usb: typec: ucsi: Handle incorrect num_connectors capability

Mathias Nyman (2):
      xhci: Add helper to find trb from its dma address
      xhci: simplify and rework trb_in_td()

Michal Pecio (2):
      usb: xhci: Assume that endpoints halt as specified
      usb: xhci: Don't unchain link TRBs on quirky HCs

Miguel Ojeda (1):
      rust: usb: fix formatting

Nathan Chancellor (1):
      usb: uhci: Work around bogus clang shift overflow warning from DMA_BIT_MASK(64)

Niklas Neronin (16):
      usb: xhci: rework xhci_decode_portsc()
      usb: xhci: add tracing for PORTSC register writes
      usb: xhci: add helper to read PORTSC register
      usb: xhci: add USB Port Register Set struct
      usb: xhci: implement USB Port Register Set struct
      usb: xhci: remove deprecated TODO comment
      usb: xhci: remove unused trace operation and argument
      usb: xhci: use cached HCSPARAMS1 value
      usb: xhci: simplify handling of Structural Parameters 1 values
      usb: xhci: limit number of ports to 127
      usb: xhci: limit number of interrupts to 128
      usb: xhci: improve xhci-caps.h comments
      usb: xhci: simplify Isochronous Scheduling Threshold handling
      usb: xhci: simplify Max Scratchpad buffer macros
      usb: xhci: drop xhci-caps.h dependence on xhci-ext-caps.h
      usb: xhci: standardize single bit-field macros

Oliver Neukum (3):
      usb: chaoskey: fix locking for O_NONBLOCK
      uapi: cdc.h: cleanly provide for more interfaces and countries
      usb: uas: reduce time under spinlock

Peter Korsgaard (1):
      usb: typec: tipd: mark as orientation aware

Pooja Katiyar (4):
      usb: typec: ucsi: Update UCSI structure to have message in and message out fields
      usb: typec: ucsi: Add support for message out data structure
      usb: typec: ucsi: Enable debugfs for message_out data structure
      usb: typec: ucsi: Add support for SET_PDOS command

Pritam Manohar Sutar (1):
      usb: dwc3: Allow usb role swich control from userspace

RD Babiera (2):
      usb: typec: class: add typec_get_data_role symbol
      usb: typec: altmodes/displayport: do not enter mode if port is the UFP

Radhey Shyam Pandey (1):
      dt-bindings: usb: dwc3-xilinx: Describe the reset constraint for the versal platform

Rai, Amardeep (1):
      usb: xhci: Add debugfs support for xHCI Port Link Info (PORTLI) register.

Randy Dunlap (3):
      usb: mtu3: fix misspelled words
      usb: mtu3: fix invalid kernel-doc in mtu3.h
      usb: xhci-mtk: correct most kernel-doc problems in xhci-mtk.h

Rob Herring (Arm) (2):
      dt-bindings: usb: xhci: Allow "iommus" and "dr_mode" properties
      dt-bindings: usb: xhci: Add "generic-xhci" compatible for Marvell Armada 37xx/8k

Ronak Raheja (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Kaanapali compatible

Ryan Chen (6):
      dt-bindings: usb: uhci: Add reset property
      usb: uhci: Add reset control support
      dt-bindings: usb: uhci: Add Aspeed AST2700 compatible
      usb: uhci: Add Aspeed AST2700 support
      dt-bindings: usb: ehci: Add Aspeed AST2700 compatible
      usb: ehci: Add Aspeed AST2700 support

Sakari Ailus (4):
      usb: misc: ljca: Remove Wentong's e-mail address
      usb: ljca: Order ACPI hardware IDs alphabetically
      usb: ljca: Improve ACPI hardware ID documentation
      usb: Remove redundant pm_runtime_mark_last_busy() calls

Seungjin Bae (1):
      USB: Fix descriptor count when handling invalid MBIM extended descriptor

Slark Xiao (1):
      USB: serial: option: add Foxconn T99W760

Sven Peter (7):
      usb: typec: tipd: Fix error handling in cd321x_read_data_status
      dt-bindings: usb: Add Apple dwc3
      usb: dwc3: dwc3_power_off_all_roothub_ports: Use ioremap_np when required
      usb: dwc3: glue: Add documentation
      usb: dwc3: glue: Allow more fine grained control over mode switches
      usb: dwc3: Add Apple Silicon DWC3 glue layer driver
      usb: dwc3: apple: Only support a single reset controller

Thorsten Blum (3):
      usb: usbtmc: Remove unnecessary local variable from usbtmc_ioctl_request
      usb: hub: Use max() to improve usb_set_lpm_pel()
      usbip: Use min to simplify stub_send_ret_submit

Venkat Jayaraman (1):
      usb: typec: ucsi: Add SET_POWER_LEVEL UCSI command to debugfs

Wesley Cheng (1):
      dt-bindings: usb: qcom,snps-dwc3: Add Glymur compatible

Xu Yang (3):
      usb: gadget: zero: add function wakeup support
      dt-bindings: usb: usbmisc-imx: add fsl,imx94-usbmisc compatible
      usb: chipidea: imx: add USB support for i.MX94

 .../ABI/testing/sysfs-class-usb_power_delivery     |  28 ++
 Documentation/admin-guide/thunderbolt.rst          |  50 ++-
 .../devicetree/bindings/usb/apple,dwc3.yaml        |  80 ++++
 .../devicetree/bindings/usb/dwc3-xilinx.yaml       |  22 +
 .../devicetree/bindings/usb/eswin,eic7700-usb.yaml |  94 ++++
 .../devicetree/bindings/usb/fsl,ls1028a.yaml       |  33 +-
 .../devicetree/bindings/usb/fsl,usbmisc.yaml       |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |   1 +
 .../devicetree/bindings/usb/generic-xhci.yaml      |  17 +-
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml |   4 +-
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  32 ++
 .../bindings/usb/renesas,rzg3e-xhci.yaml           |  12 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml          |   6 +
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      |   8 +
 .../devicetree/bindings/usb/usb-uhci.yaml          |  13 +
 MAINTAINERS                                        |   2 +
 drivers/thunderbolt/ctl.c                          |   2 +-
 drivers/thunderbolt/debugfs.c                      |   4 +-
 drivers/thunderbolt/domain.c                       |   2 +-
 drivers/thunderbolt/eeprom.c                       |   2 +-
 drivers/thunderbolt/icm.c                          |   8 +-
 drivers/thunderbolt/lc.c                           |   2 +-
 drivers/thunderbolt/nhi.c                          |   2 +-
 drivers/thunderbolt/retimer.c                      |   2 +-
 drivers/thunderbolt/switch.c                       |   6 +-
 drivers/thunderbolt/tb.c                           |  16 +-
 drivers/thunderbolt/tb.h                           |  14 +-
 drivers/thunderbolt/tb_regs.h                      |   6 +-
 drivers/thunderbolt/tmu.c                          |   4 +-
 drivers/thunderbolt/tunnel.c                       |  14 +-
 drivers/thunderbolt/usb4.c                         |  26 +-
 drivers/thunderbolt/xdomain.c                      |   4 +-
 drivers/usb/cdns3/cdns3-gadget.c                   |   1 -
 drivers/usb/cdns3/cdnsp-gadget.c                   |   1 -
 drivers/usb/chipidea/core.c                        |   1 -
 drivers/usb/chipidea/otg_fsm.c                     |   1 -
 drivers/usb/chipidea/usbmisc_imx.c                 |  12 +
 drivers/usb/class/cdc-acm.c                        |   2 +-
 drivers/usb/class/usbtmc.c                         |  12 +-
 drivers/usb/core/Makefile                          |   5 +-
 drivers/usb/core/hcd.c                             |   8 +-
 drivers/usb/core/hub.c                             |  43 +-
 drivers/usb/core/message.c                         |   2 +-
 drivers/usb/core/trace.c                           |   6 +
 drivers/usb/core/trace.h                           |  61 +++
 drivers/usb/core/usb.c                             |   2 +
 drivers/usb/dwc2/platform.c                        |  17 +-
 drivers/usb/dwc3/Kconfig                           |  11 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  34 +-
 drivers/usb/dwc3/drd.c                             |   1 +
 drivers/usb/dwc3/dwc3-am62.c                       |   1 -
 drivers/usb/dwc3/dwc3-apple.c                      | 489 +++++++++++++++++++++
 drivers/usb/dwc3/dwc3-generic-plat.c               |  70 +++
 drivers/usb/dwc3/dwc3-imx8mp.c                     |   1 -
 drivers/usb/dwc3/dwc3-pci.c                        |   1 -
 drivers/usb/dwc3/dwc3-qcom.c                       |   1 +
 drivers/usb/dwc3/dwc3-xilinx.c                     |   1 -
 drivers/usb/dwc3/gadget.c                          |   4 +-
 drivers/usb/dwc3/glue.h                            | 157 +++++++
 drivers/usb/dwc3/host.c                            |   7 +-
 drivers/usb/gadget/function/f_fs.c                 |   4 +-
 drivers/usb/gadget/function/f_hid.c                |   3 +-
 drivers/usb/gadget/legacy/raw_gadget.c             |   3 +
 drivers/usb/gadget/legacy/zero.c                   |  27 +-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c        |   1 -
 drivers/usb/gadget/udc/tegra-xudc.c                |   6 -
 drivers/usb/host/ehci-platform.c                   |  40 +-
 drivers/usb/host/ohci-da8xx.c                      |  17 -
 drivers/usb/host/ohci-platform.c                   |  24 +-
 drivers/usb/host/uhci-hcd.h                        |   1 +
 drivers/usb/host/uhci-platform.c                   |  28 +-
 drivers/usb/host/xen-hcd.c                         |   4 +-
 drivers/usb/host/xhci-caps.h                       | 167 ++++---
 drivers/usb/host/xhci-dbgcap.c                     |   8 +-
 drivers/usb/host/xhci-debugfs.c                    |  57 ++-
 drivers/usb/host/xhci-hub.c                        | 125 +++---
 drivers/usb/host/xhci-mem.c                        |  41 +-
 drivers/usb/host/xhci-mtk.c                        |   1 -
 drivers/usb/host/xhci-mtk.h                        |  10 +-
 drivers/usb/host/xhci-pci.c                        |   6 +-
 drivers/usb/host/xhci-port.h                       |   5 +
 drivers/usb/host/xhci-ring.c                       | 240 +++++-----
 drivers/usb/host/xhci-tegra.c                      |  13 +-
 drivers/usb/host/xhci-trace.h                      |  25 +-
 drivers/usb/host/xhci.c                            |  92 ++--
 drivers/usb/host/xhci.h                            | 118 ++---
 drivers/usb/misc/apple-mfi-fastcharge.c            |   1 -
 drivers/usb/misc/chaoskey.c                        |  16 +-
 drivers/usb/misc/usb-ljca.c                        |  39 +-
 drivers/usb/mtu3/mtu3.h                            |  34 +-
 drivers/usb/mtu3/mtu3_core.c                       |   2 +-
 drivers/usb/mtu3/mtu3_plat.c                       |   1 -
 drivers/usb/mtu3/mtu3_qmu.c                        |   2 +-
 drivers/usb/musb/musb_core.c                       |   5 -
 drivers/usb/musb/musb_debugfs.c                    |   5 -
 drivers/usb/musb/musb_dsps.c                       |   1 -
 drivers/usb/musb/musb_gadget.c                     |   4 -
 drivers/usb/musb/omap2430.c                        |   1 -
 drivers/usb/phy/phy.c                              |   4 +
 drivers/usb/renesas_usbhs/common.c                 |  51 ++-
 drivers/usb/serial/belkin_sa.c                     |  42 +-
 drivers/usb/serial/ftdi_sio.c                      | 200 +++------
 drivers/usb/serial/kobil_sct.c                     | 208 ++++-----
 drivers/usb/serial/option.c                        |  22 +-
 drivers/usb/storage/protocol.c                     |   3 +-
 drivers/usb/storage/uas.c                          |  29 +-
 drivers/usb/storage/unusual_uas.h                  |   2 +-
 drivers/usb/typec/altmodes/displayport.c           |   4 +-
 drivers/usb/typec/anx7411.c                        |   3 +-
 drivers/usb/typec/class.c                          |  13 +
 drivers/usb/typec/hd3ss3220.c                      |  75 +++-
 drivers/usb/typec/mux/ps883x.c                     | 127 ++++--
 drivers/usb/typec/pd.c                             |  95 +++-
 drivers/usb/typec/tcpm/tcpm.c                      |  15 +-
 drivers/usb/typec/tipd/core.c                      |  15 +-
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |   5 +-
 drivers/usb/typec/ucsi/debugfs.c                   |  37 +-
 drivers/usb/typec/ucsi/displayport.c               |  11 +-
 drivers/usb/typec/ucsi/psy.c                       |  26 ++
 drivers/usb/typec/ucsi/ucsi.c                      | 156 +++++--
 drivers/usb/typec/ucsi/ucsi.h                      |  30 +-
 drivers/usb/typec/ucsi/ucsi_acpi.c                 |  25 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |  11 +-
 drivers/usb/typec/ucsi/ucsi_glink.c                |  88 +++-
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |   2 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            |  15 +-
 drivers/usb/usbip/stub_tx.c                        |   9 +-
 drivers/usb/usbip/vhci_hcd.c                       |  96 ++--
 include/linux/platform_data/usb-davinci.h          |  22 -
 include/linux/usb/pd.h                             |  69 ++-
 include/linux/usb/typec.h                          |   1 +
 include/linux/usb/typec_altmode.h                  |  13 +
 include/linux/usb/typec_tbt.h                      |   1 +
 include/uapi/linux/usb/cdc.h                       |  12 +-
 rust/bindings/bindings_helper.h                    |   1 +
 rust/helpers/helpers.c                             |   1 +
 rust/kernel/lib.rs                                 |   2 +
 samples/rust/Kconfig                               |   2 +-
 139 files changed, 2943 insertions(+), 1247 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/apple,dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/eswin,eic7700-usb.yaml
 create mode 100644 drivers/usb/core/trace.c
 create mode 100644 drivers/usb/core/trace.h
 create mode 100644 drivers/usb/dwc3/dwc3-apple.c
 delete mode 100644 include/linux/platform_data/usb-davinci.h

