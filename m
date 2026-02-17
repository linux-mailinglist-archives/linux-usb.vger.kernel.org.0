Return-Path: <linux-usb+bounces-33407-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIA2IYR7lGkfFAIAu9opvQ
	(envelope-from <linux-usb+bounces-33407-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 15:30:28 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 310D014D29A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 15:30:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6A2193014A19
	for <lists+linux-usb@lfdr.de>; Tue, 17 Feb 2026 14:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7140036C0D8;
	Tue, 17 Feb 2026 14:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lqX4ywLD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17DE36B057;
	Tue, 17 Feb 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771338622; cv=none; b=i7qcAVi1wK98XQGwlHcvsVRZGdxM9mv5rqEFQwB10pnHcr0HdNAGzixRVIzNInkvYvei+ljA5wR+26ajA1s0cuAkH1MNA2DsBhSa4ayeBQokroI1CP28qjfII1mAfU+qj8JQzS3glbnDFykVMgUVyZDemMGJAK4qgmUubSSuYs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771338622; c=relaxed/simple;
	bh=L76Ux3JWf44Dhu4JEQT5kLok0aYSNCd2/k9FQxuDxz8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oDifMvyfhc54Z2ZjlrGMU7b7F2BMvmT4fWl7FmNoCI2ZS9a+R9rbXrLPfBysEVjS5QsgvZYk7Zsfge8ZDslR+C0I+eC9OvpKVMkQVfzeUHH1r+6HKfCu/f4zAASVda7/DN7g0D63NK+Om05IWaYqpPoyiflhtmvnrXIYey6nhJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lqX4ywLD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 085E7C4CEF7;
	Tue, 17 Feb 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771338621;
	bh=L76Ux3JWf44Dhu4JEQT5kLok0aYSNCd2/k9FQxuDxz8=;
	h=Date:From:To:Cc:Subject:From;
	b=lqX4ywLDapFQvttD38X1O8rlYKb1kyzDMO85aYAyag2uDaGsHpiGkNTU1zWcryZ70
	 jiGnofAlH+QvUbQcIzn/GPcQyP35IKs2hRqk7EEc/lecU0etn8z4/ZONGGxv50AF4C
	 ID9H5a1WO/GeG1oH4JWnB8rrQEpgeNe/7VhQaWJM=
Date: Tue, 17 Feb 2026 15:30:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver updates for 7.0-rc1
Message-ID: <aZR7eYewulF4M0CR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33407-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,linuxfoundation.org:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kroah.com:mid]
X-Rspamd-Queue-Id: 310D014D29A
X-Rspamd-Action: no action

The following changes since commit 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7:

  Linux 6.19-rc6 (2026-01-18 15:42:45 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc1

for you to fetch changes up to da87d45b195148d670ab995367d52aa9e8a9a1fa:

  usb: typec: ucsi: Add Thunderbolt alternate mode support (2026-02-06 15:32:13 +0100)

----------------------------------------------------------------
USB / Thunderbolt changes for 7.0-rc1

Here is the "big" set of USB and Thunderbolt driver updates for 7.0-rc1.
Overall more lines were removed than added, thanks to dropping the
obsolete isp1362 USB host controller driver, always a nice change.

Other than that, nothing major happening here, highlights are:
  - lots of dwc3 driver updates and new hardware support added
  - usb gadget function driver updates
  - usb phy driver updates
  - typec driver updates and additions
  - USB rust binding updates for syntax and formatting changes
  - more usb serial device ids added
  - other smaller USB core and driver updates and additions

All of these have been in linux-next for a long time, with no reported
problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alice Ryhl (1):
      rust: usb: add __rust_helper to helpers

Andrei Kuchynski (8):
      usb: typec: Add mode_control field to port property
      platform/chrome: cros_ec_typec: Set no_mode_control flag
      usb: typec: Expose alternate mode priority via sysfs
      usb: typec: Implement mode selection
      usb: typec: Introduce mode_selection bit
      usb: typec: ucsi: Support mode selection to activate altmodes
      usb: typec: ucsi: Enforce mode selection for cros_ec_ucsi
      usb: typec: ucsi: Add Thunderbolt alternate mode support

Andy Yan (1):
      USB: typec: tcpm: Fix a typo

Bartosz Golaszewski (1):
      USB: host: drop unneeded dependency on OF_GPIO

Benson Leung (2):
      usb: typec: ucsi: psy: Fix ucsi_psy_get_current_now in non-PD cases
      usb: typec: ucsi: psy: Fix voltage and current max for non-Fixed PDOs

Chaoyi Chen (3):
      usb: typec: Export typec bus and typec altmode device type
      dt-bindings: usb: Add binding for WCH CH334/CH335 hub controller
      usb: misc: onboard_dev: Add WCH CH334 USB2.0 Hub (1a86:8091)

Chen Ni (1):
      usb: dwc3: google: Remove redundant dev_err()

Chia-Lin Kao (AceLan) (1):
      thunderbolt: Log path activation failures without WARN backtraces

Christophe JAILLET (1):
      usb: gadget: Constify struct configfs_item_operations and configfs_group_operations

Danilo Krummrich (1):
      rust: usb: use "kernel vertical" style for imports

Fabio Porcedda (1):
      USB: serial: option: add Telit FN920C04 RNDIS compositions

Geert Uytterhoeven (4):
      usb: phy: generic: Always use dev in usb_phy_generic_probe()
      usb: phy: generic: Convert to devm_clk_get_optional()
      usb: phy: generic: Convert to dev_err_probe()
      usb: phy: generic: Convert to device property API

Greg Kroah-Hartman (5):
      Merge 6.19-rc3 into usb-next
      USB: HCD: remove logic about which hcd is loaded
      Merge 6.19-rc6 usb-next
      Merge tag 'thunderbolt-for-v6.20-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-6.20-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Haotien Hsu (1):
      usb: gadget: tegra-xudc: Add handling for BLCG_COREPLL_PWRDN

Heikki Krogerus (1):
      usb: typec: Set the bus also for the port and plug altmodes

Jaime Saguillo Revilla (1):
      docs: admin-guide: thunderbolt: Replace ifconfig with ip

Jan Remmet (2):
      usb: typec: hd3ss3220: Enable VBUS based on role state
      usb: typec: hd3ss3220: Check if regulator needs to be switched

Jiasheng Jiang (1):
      usb: gadget: f_tcm: initialize data_len in UAS path for consistency

Jisheng Zhang (1):
      usb: dwc2: fix resume failure if dr_mode is host

Justin Chen (1):
      usb: bdc: fix sleep during atomic

Krishna Kurapati (1):
      usb: gadget: f_sourcesink: Support maxburst configurability for bulk endpoints

Kuen-Han Tsai (3):
      usb: gadget: u_ether: add gether_opts for config caching
      usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device
      usb: gadget: f_ncm: align net_device lifecycle with bind/unbind

Mario Peter (1):
      usb: chipidea: udc: fix DMA and SG cleanup in _ep_nuke()

Prashanth K (4):
      usb: dwc3: Remove of dep->regs
      usb: dwc3: Add dwc pointer to dwc3_readl/writel
      usb: dwc3: Log dwc3 address in traces
      usb: dwc3: gadget: Move vbus draw to workqueue context

Randy Dunlap (2):
      usb: typec: ucsi: drop an unused Kconfig symbol
      usb: gadget: u_ether: use <linux/hex.h> header file

Rob Herring (Arm) (2):
      dt-bindings: usb: ehci/ohci: Allow "dma-coherent"
      dt-bindings: usb: Add Socionext Uniphier DWC3 controller

Robert Marko (1):
      dt-bindings: usb: Add Microchip LAN969x support

Roy Luo (2):
      dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
      usb: dwc3: Add Google Tensor SoC DWC3 glue driver

Ryan Chen (2):
      dt-bindings: usb: aspeed,usb-vhub: Add ast2700 support
      usb: gadget: aspeed-vhub: Add ast2700 support

Sam Day (2):
      usb: gadget: f_fs: Fix ioctl error handling
      usb: gadget: f_fs: fix DMA-BUF OUT queues

Sean Anderson (1):
      usb: dwc3: Always deassert xilinx resets

Shuah Khan (2):
      tools: usb: usbip: remove dead-link from README
      usbip: Reduce CONNRESET message noise in dmesg from stub

Svyatoslav Ryhel (6):
      usb: phy: tegra: use phy type directly
      usb: phy: tegra: add HSIC support
      usb: phy: tegra: cosmetic fixes
      usb: phy: tegra: return error value from utmi_wait_register
      usb: phy: tegra: parametrize HSIC PTS value
      usb: phy: tegra: parametrize PORTSC1 register offset

Thomas Richard (TI) (1):
      usb: cdns3: fix role switching during resume

Tommaso Merciai (1):
      dt-bindings: usb: renesas,usbhs: Add RZ/G3E SoC support

Victor Krawiec (1):
      usb: gadget: f_midi: allow customizing the USB MIDI interface string through configfs

Vladimir Zapolskiy (1):
      usb: isp1362-hcd: remove Philips ISP1362 USB OTG controller driver

Wayne Chang (1):
      usb: host: tegra: Remove manual wake IRQ disposal

Xu Yang (4):
      usb: dwc3: drd: extend dwc3_pre_set_role() to extcon and otg usecase
      usb: dwc3: imx8mp: rename dwc3 to dwc3_pdev in struct dwc3_imx8mp
      usb: dwc3: imx8mp: disable auto suspend for host role
      usb: chipidea: ci_hdrc_imx: use "wakeup" suffix for wakeup interrupt name

Yi Cong (1):
      usb: linux/usb.h: Correct the description of the usb_device_driver member

Łukasz Bartosik (4):
      xhci: dbc: prepare to expose strings through sysfs
      xhci: dbc: allow setting device serial number through sysfs
      xhci: dbc: allow setting product string through sysfs
      xhci: dbc: allow setting manufacturer string through sysfs

 Documentation/ABI/testing/configfs-usb-gadget-midi |   17 +-
 .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |   42 +
 Documentation/ABI/testing/sysfs-class-typec        |   11 +
 Documentation/admin-guide/thunderbolt.rst          |    2 +-
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   |   22 +-
 .../devicetree/bindings/usb/generic-ehci.yaml      |    2 +
 .../devicetree/bindings/usb/generic-ohci.yaml      |    2 +
 .../devicetree/bindings/usb/google,lga-dwc3.yaml   |  140 +
 .../bindings/usb/microchip,lan9691-dwc3.yaml       |   66 +
 .../devicetree/bindings/usb/renesas,usbhs.yaml     |    1 +
 .../bindings/usb/socionext,uniphier-dwc3.yaml      |   89 +
 .../devicetree/bindings/usb/wch,ch334.yaml         |   65 +
 Documentation/usb/gadget-testing.rst               |   18 +-
 MAINTAINERS                                        |    2 +
 drivers/platform/chrome/cros_ec_typec.c            |    1 +
 drivers/thunderbolt/path.c                         |    2 +-
 drivers/usb/Makefile                               |    1 -
 drivers/usb/cdns3/core.c                           |    2 +-
 drivers/usb/chipidea/ci_hdrc_imx.c                 |    9 +-
 drivers/usb/chipidea/udc.c                         |    7 +
 drivers/usb/core/hcd.c                             |    4 -
 drivers/usb/dwc2/core.c                            |    1 +
 drivers/usb/dwc3/Kconfig                           |   11 +
 drivers/usb/dwc3/Makefile                          |    1 +
 drivers/usb/dwc3/core.c                            |  215 +-
 drivers/usb/dwc3/core.h                            |   14 +-
 drivers/usb/dwc3/debugfs.c                         |   44 +-
 drivers/usb/dwc3/drd.c                             |   86 +-
 drivers/usb/dwc3/dwc3-google.c                     |  626 +++++
 drivers/usb/dwc3/dwc3-imx8mp.c                     |   47 +-
 drivers/usb/dwc3/dwc3-xilinx.c                     |   67 +-
 drivers/usb/dwc3/ep0.c                             |   22 +-
 drivers/usb/dwc3/gadget.c                          |  172 +-
 drivers/usb/dwc3/gadget.h                          |    4 +-
 drivers/usb/dwc3/io.h                              |   11 +-
 drivers/usb/dwc3/trace.h                           |   88 +-
 drivers/usb/dwc3/ulpi.c                            |   10 +-
 drivers/usb/fotg210/fotg210-hcd.c                  |    6 -
 drivers/usb/gadget/configfs.c                      |   24 +-
 drivers/usb/gadget/function/f_acm.c                |    2 +-
 drivers/usb/gadget/function/f_fs.c                 |   26 +-
 drivers/usb/gadget/function/f_hid.c                |    2 +-
 drivers/usb/gadget/function/f_loopback.c           |    2 +-
 drivers/usb/gadget/function/f_mass_storage.c       |    6 +-
 drivers/usb/gadget/function/f_midi.c               |  112 +-
 drivers/usb/gadget/function/f_midi2.c              |   10 +-
 drivers/usb/gadget/function/f_ncm.c                |  130 +-
 drivers/usb/gadget/function/f_obex.c               |    2 +-
 drivers/usb/gadget/function/f_phonet.c             |    2 +-
 drivers/usb/gadget/function/f_printer.c            |    2 +-
 drivers/usb/gadget/function/f_serial.c             |    2 +-
 drivers/usb/gadget/function/f_sourcesink.c         |   54 +-
 drivers/usb/gadget/function/f_tcm.c                |    5 +-
 drivers/usb/gadget/function/f_uac1.c               |    2 +-
 drivers/usb/gadget/function/f_uac1_legacy.c        |    2 +-
 drivers/usb/gadget/function/f_uac2.c               |    2 +-
 drivers/usb/gadget/function/g_zero.h               |    1 +
 drivers/usb/gadget/function/u_ether.c              |   45 +
 drivers/usb/gadget/function/u_ether.h              |   30 +
 drivers/usb/gadget/function/u_ether_configfs.h     |  179 +-
 drivers/usb/gadget/function/u_midi.h               |    2 +-
 drivers/usb/gadget/function/u_ncm.h                |    4 +-
 drivers/usb/gadget/function/uvc_configfs.c         |   36 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |   30 +
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |    1 +
 drivers/usb/gadget/udc/bdc/bdc_core.c              |    4 +-
 drivers/usb/gadget/udc/tegra-xudc.c                |   12 +-
 drivers/usb/host/Kconfig                           |   14 +-
 drivers/usb/host/Makefile                          |    1 -
 drivers/usb/host/ehci-hcd.c                        |    8 -
 drivers/usb/host/isp1362-hcd.c                     | 2769 --------------------
 drivers/usb/host/isp1362.h                         |  914 -------
 drivers/usb/host/ohci-hcd.c                        |    3 -
 drivers/usb/host/uhci-hcd.c                        |    5 -
 drivers/usb/host/xhci-dbgcap.c                     |  259 +-
 drivers/usb/host/xhci-dbgcap.h                     |   39 +-
 drivers/usb/host/xhci-tegra.c                      |   21 +-
 drivers/usb/misc/onboard_usb_dev.h                 |    8 +
 drivers/usb/phy/phy-generic.c                      |   74 +-
 drivers/usb/phy/phy-tegra-usb.c                    |  297 ++-
 drivers/usb/serial/option.c                        |    6 +
 drivers/usb/typec/Makefile                         |    2 +-
 drivers/usb/typec/altmodes/displayport.c           |    6 +-
 drivers/usb/typec/altmodes/thunderbolt.c           |    2 +-
 drivers/usb/typec/bus.c                            |   25 +-
 drivers/usb/typec/bus.h                            |    6 -
 drivers/usb/typec/class.c                          |  136 +-
 drivers/usb/typec/class.h                          |    3 +
 drivers/usb/typec/hd3ss3220.c                      |   30 +-
 drivers/usb/typec/mode_selection.c                 |  283 ++
 drivers/usb/typec/tcpm/tcpm.c                      |    2 +-
 drivers/usb/typec/ucsi/Kconfig                     |    1 -
 drivers/usb/typec/ucsi/Makefile                    |    4 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |   22 +
 drivers/usb/typec/ucsi/psy.c                       |   54 +-
 drivers/usb/typec/ucsi/thunderbolt.c               |  212 ++
 drivers/usb/typec/ucsi/ucsi.c                      |   30 +-
 drivers/usb/typec/ucsi/ucsi.h                      |   24 +
 drivers/usb/usbip/stub_tx.c                        |    4 +-
 include/linux/usb.h                                |    3 +-
 include/linux/usb/gadget_configfs.h                |    4 +-
 include/linux/usb/hcd.h                            |    6 -
 include/linux/usb/isp1362.h                        |   47 -
 include/linux/usb/tegra_usb_phy.h                  |   11 +-
 include/linux/usb/typec.h                          |    6 +
 include/linux/usb/typec_altmode.h                  |   50 +
 rust/helpers/usb.c                                 |    3 +-
 rust/kernel/usb.rs                                 |   21 +-
 samples/rust/rust_driver_usb.rs                    |   10 +-
 tools/usb/usbip/README                             |    2 -
 110 files changed, 3494 insertions(+), 4594 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/microchip,lan9691-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/wch,ch334.yaml
 create mode 100644 drivers/usb/dwc3/dwc3-google.c
 delete mode 100644 drivers/usb/host/isp1362-hcd.c
 delete mode 100644 drivers/usb/host/isp1362.h
 create mode 100644 drivers/usb/typec/mode_selection.c
 create mode 100644 drivers/usb/typec/ucsi/thunderbolt.c
 delete mode 100644 include/linux/usb/isp1362.h

