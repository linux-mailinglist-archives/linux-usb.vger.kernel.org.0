Return-Path: <linux-usb+bounces-19790-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0981A1DBB1
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 18:58:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EE758188624B
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 17:58:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05BCC17BEB6;
	Mon, 27 Jan 2025 17:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TxiR7tH5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BC271747;
	Mon, 27 Jan 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738000710; cv=none; b=CEvJmm/Hunag1fRRHyoE5S/3fi2VsUQYQlTiOkoa5pu4XnQ/7rdraaH67fPAFqT0QYBp03H1glqdtGFoOlvabPK3xjOAQUoiKgKNdnvdnCYgiig9nBGYNDBZxjaK40mB3mh+2oP1noaeEwTks74NShAow84JDEJD3c9V0blTRGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738000710; c=relaxed/simple;
	bh=1/PiyLAmJe3uoB3o4FavG956+exdj07EVA47CxutneA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=INeE4LgHsClCl9DjhsB4O3zJIsHB/TVixbdQ35iHGloJBVAKan+5giPAdxVeqcyuqpF+HFHw4l1EpwzvkoU1dpfyECqI8WO9kiYaAcN/ZI8S7jdR5eU9cxdu+8em3/4pYOr/eFzKHSe6L1zjgPUwgPBIrMCsgn04tkPJ7avcn5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TxiR7tH5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB9FC4CED2;
	Mon, 27 Jan 2025 17:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1738000709;
	bh=1/PiyLAmJe3uoB3o4FavG956+exdj07EVA47CxutneA=;
	h=Date:From:To:Cc:Subject:From;
	b=TxiR7tH5MN0OJQvq68vcvzODGG16eE8GMpKWJ8I/4ykpsdDyR6xFeOPvO3i+oYg0e
	 VWvXJjMzad42IhJrTxScJaA9Q4POVeg08P9W5puv2/hMz8Ud25wTu+MuOI/6RDNh1L
	 z7OyN9KQghjXZ68qFtUWq7Z7ka43hx8gcy30afio=
Date: Mon, 27 Jan 2025 18:58:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB / Thunderbolt driver updates for 6.14-rc1
Message-ID: <Z5fJQw63-jHgfTqD@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

The following changes since commit 5bc55a333a2f7316b58edc7573e8e893f7acb532:

  Linux 6.13-rc7 (2025-01-12 14:37:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-6.14-rc1

for you to fetch changes up to 70cd0576aa39c55aabd227851cba0c601e811fb6:

  usb: hcd: Bump local buffer size in rh_string() (2025-01-17 15:26:33 +0100)

----------------------------------------------------------------
USB / Thunderbolt driver updates for 6.14-rc1

Here is the USB and Thunderbolt driver updates for 6.14-rc1.  Nothing
huge in here, just lots of new hardware support and updates for existing
drivers.  Changes here are:
  - big gadget f_tcm driver update
  - other gadget driver updates and fixes
  - thunderbolt driver updates for new hardware and capabilities and
    lots more debugging functionality to handle it when things aren't
    working well.
  - xhci driver updates
  - new USB-serial device updates
  - typec driver updates, including a chrome platform driver (acked by
    the subsystem maintainers)
  - other small driver updates

All of these have been in linux-next for a while with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abhishek Pandit-Subedi (7):
      usb: typec: Only use SVID for matching altmodes
      usb: typec: Make active on port altmode writable
      usb: typec: Print err when displayport fails to enter
      platform/chrome: cros_ec_typec: Update partner altmode active
      platform/chrome: cros_ec_typec: Displayport support
      platform/chrome: cros_ec_typec: Thunderbolt support
      platform/chrome: cros_ec_typec: Disable tbt on port

Amit Sunil Dhamne (3):
      dt-bindings: connector: Add pd-revision property
      usb: typec: tcpm: Add support for parsing pd-revision DT property
      usb: typec: tcpm: Add new AMS for Get_Revision response

André Draszik (1):
      dt-bindings: usb: max33359: add max77759-tcpci flavor

Andy Shevchenko (1):
      usb: hcd: Bump local buffer size in rh_string()

Bjorn Andersson (1):
      dt-bindings: usb: snps,dwc3: Split core description

Chunfeng Yun (1):
      usb: host: xhci-plat: add support compatible ID PNP0D15

Claudiu Beznea (1):
      dt-bindings: usb: renesas,usbhs: Document RZ/G3S SoC

David Disseldorp (1):
      usb: collapse USB_STORAGE Kconfig comment

Dingyan Li (1):
      usb: storage: add a macro for the upper limit of max LUN

Duan Chenghao (1):
      USB: Fix the issue of task recovery failure caused by USB status when S4 wakes up

Faisal Hassan (1):
      usb: dwc3: core: Disable USB2 retry for DWC_usb31 1.80a and prior

Gil Fine (1):
      thunderbolt: debugfs: Add write capability to path config space

Gordon Ou (1):
      USB: usbip: Update USB/IP OP_REP_IMPORT documentation.

Greg Kroah-Hartman (6):
      Merge 6.13-rc3 into usb-next
      Merge 6.14-rc4 into usb-next
      Merge 6.13-rc7 into usb-next
      Merge tag 'thunderbolt-for-v6.14-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-6.14-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next
      Revert "usb: gadget: u_serial: Disable ep before setting port to null to fix the crash caused by port being null"

Heikki Krogerus (2):
      usb: typec: intel_pmc_mux: Silence snprintf() output truncation warning
      usb: typec: Add driver for Thunderbolt 3 Alternate Mode

Hongyu Xie (1):
      usb: cdns3: remove redundant if branch

Jason Long (1):
      usbip: Accept arbitrarily long scatter-gather list

Joe Hattori (1):
      usb: dwc3-am62: Fix an OF node leak in phy_syscon_pll_refclk()

Johan Hovold (1):
      USB: serial: ch341: use fix-width types consistently

Jon Hunter (1):
      usb: xhci: tegra: Fix OF boolean read warning

Jos Wang (1):
      usb: typec: tcpm: set SRC_SEND_CAPABILITIES timeout to PD_T_SENDER_RESPONSE

Jun Yan (1):
      USB: usblp: remove redundant semicolon

Konrad Dybcio (1):
      dt-bindings: usb: qcom,dwc3: Make ss_phy_irq optional for X1E80100

Krishna Kurapati (1):
      dt-bindings: usb: qcom,dwc3: Add QCS615 to USB DWC3 bindings

Krzysztof Kozlowski (7):
      dt-bindings: usb: Correct indentation and style in DTS example
      USB: Replace own str_plural with common one
      USB: host: Use str_enable_disable-like helpers
      USB: typec: Use str_enable_disable-like helpers
      USB: phy: Use str_enable_disable-like helpers
      USB: gadget: Use str_enable_disable-like helpers
      USB: Use str_enable_disable-like helpers

Kyle Tso (2):
      usb: dwc3: core: Defer the probe until USB power supply ready
      usb: typec: tcpci: Prevent Sink disconnection before vPpsShutdown in SPR PPS

Lode Willems (1):
      USB: serial: ch341: add hardware flow control RTS/CTS

Lucy Mielke (1):
      usb: common: expand documentation for USB functions

Luis Felipe Hernandez (1):
      usb: dwc3: remove unused sg struct member

Mathias Nyman (4):
      xhci: dbc: Improve performance by removing delay in transfer event polling.
      xhci: dbgtty: Improve performance by handling received data immediately.
      xhci: Add command completion parameter support
      xhci: Add missing capability definition bits

Miao Li (1):
      usb: quirks: Add NO_LPM quirk for TOSHIBA TransMemory-Mx device

Michal Pecio (1):
      usb: xhci: Fix NULL pointer dereference on certain command aborts

Mika Westerberg (13):
      thunderbolt: Drop doubled empty line from ctl.h
      thunderbolt: Log config space when invalid config space reply is received
      thunderbolt: Debug log an invalid config space reply just once
      thunderbolt: Increase DPRX capabilities read timeout
      thunderbolt: Make tb_tunnel_one_dp() return void
      thunderbolt: Show path name in debug log when path is deactivated
      thunderbolt: Rework how tunnel->[init|deinit] hooks are called
      thunderbolt: Drop tb_tunnel_restart()
      thunderbolt: Pass reason to tb_dp_resource_unavailable()
      thunderbolt: Move forward declarations in one place
      thunderbolt: Rework tb_tunnel_consumed_bandwidth()
      thunderbolt: Handle DisplayPort tunnel activation asynchronously
      thunderbolt: Expose router DROM through debugfs

Oliver Facklam (3):
      usb: typec: hd3ss3220: configure advertised power opmode based on fwnode property
      usb: typec: hd3ss3220: support configuring port type
      usb: typec: hd3ss3220: support configuring role preference based on fwnode property and typec_operation

Pavan Holla (2):
      platform/chrome: Update ChromeOS EC header for UCSI
      usb: typec: ucsi: Implement ChromeOS UCSI driver

Pei Xiao (1):
      usb: typec: ucsi: make yoga_c630_ucsi_ops be static

Pengyu Luo (1):
      usb: typec: ucsi: Add a macro definition for UCSI v1.0

Qasim Ijaz (1):
      USB: serial: quatech2: fix null-ptr-deref in qt2_process_read_urb()

Randy Dunlap (1):
      usb: gadget: functionfs: fix spellos

Raphael Gallais-Pou (1):
      usb: dwc3: st: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

Ray Chi (1):
      usb: dwc3: Skip resume if pm_runtime_set_active() fails

Rob Herring (Arm) (2):
      usb: dwc3: omap: Use devm_regulator_get_optional()
      usb: dwc3: omap: Fix devm_regulator_get_optional() error handling

Roger Quadros (1):
      usb: dwc3: dwc3-am62: Re-initialize controller if lost power in PM suspend

Roy Luo (1):
      usb: dwc3: gadget: Fix incorrect UDC state after manual deconfiguration

Stephan Gerhold (3):
      dt-bindings: usb: gpio-sbu-mux: Add an entry for FSUSB42
      arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB switches
      arm64: dts: qcom: x1e80100-qcp: Enable external DP support

Stephen Boyd (2):
      usb: typec: cros-ec-ucsi: Add newlines to printk messages
      usb: typec: cros-ec-ucsi: Mark cros_ucsi_ops static/const

Thinh Nguyen (29):
      usb: gadget: f_tcm: Don't free command immediately
      usb: gadget: f_tcm: Translate error to sense
      usb: gadget: f_tcm: Decrement command ref count on cleanup
      usb: gadget: f_tcm: Fix Get/SetInterface return value
      usb: gadget: f_tcm: ep_autoconfig with fullspeed endpoint
      usb: gadget: f_tcm: Don't prepare BOT write request twice
      usb: gadget: f_tcm: Increase stream count
      usb: gadget: f_tcm: Increase bMaxBurst
      usb: gadget: f_tcm: Limit number of sessions
      usb: gadget: f_tcm: Get stream by sbitmap number
      usb: gadget: f_tcm: Don't set static stream_id
      usb: gadget: f_tcm: Allocate matching number of commands to streams
      usb: gadget: f_tcm: Handle multiple commands in parallel
      usb: gadget: f_tcm: Use extra number of commands
      usb: gadget: f_tcm: Return ATA cmd direction
      usb: gadget: f_tcm: Execute command on write completion
      usb: gadget: f_tcm: Minor cleanup redundant code
      usb: gadget: f_tcm: Handle abort command
      usb: gadget: f_tcm: Cleanup requests on ep disable
      usb: gadget: f_tcm: Stop proceeding further on -ESHUTDOWN
      usb: gadget: f_tcm: Save CPU ID per command
      usb: gadget: f_tcm: Send sense on cancelled transfer
      usb: gadget: f_tcm: Handle TASK_MANAGEMENT commands
      usb: gadget: f_tcm: Check overlapped command
      usb: gadget: f_tcm: Stall on invalid CBW
      usb: gadget: f_tcm: Requeue command request on error
      usb: gadget: f_tcm: Track BOT command kref
      usb: gadget: f_tcm: Refactor goto check_condition
      usb: dwc3: gadget: Reinitiate stream for all host NoStream behavior

Thomas Weißschuh (2):
      usb: core: sysfs: Constify 'struct bin_attribute'
      usbip: vudc: Constify 'struct bin_attribute'

WangYuli (1):
      usb: host: xhci-plat: Assign shared_hcd->rsrc_start

Wolfram Sang (1):
      usb: typec: tcpci_mt6370: don't include 'pm_wakeup.h' directly

Xiong Nandi (2):
      usbip: Fix seqnum sign extension issue in vhci_tx_urb
      usbip: Correct format specifier for seqnum from %d to %u

Xu Yang (2):
      usb: chipidea: host: Improve port index sanitizing
      usb: typec: tcpci: set local CC to Rd only when cc1/cc2 status is Rp

Zijun Hu (2):
      USB: Optimize goto logic in API usb_register_driver()
      usb: phy: Remove API devm_usb_put_phy()

 .../bindings/connector/usb-connector.yaml          |   7 +
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   |  40 +-
 .../devicetree/bindings/usb/brcm,bdc.yaml          |  14 +-
 .../devicetree/bindings/usb/cypress,hx3.yaml       |  24 +-
 Documentation/devicetree/bindings/usb/dwc2.yaml    |   4 +-
 .../devicetree/bindings/usb/fcs,fsa4480.yaml       |  20 +-
 .../devicetree/bindings/usb/gpio-sbu-mux.yaml      |   1 +
 .../bindings/usb/intel,keembay-dwc3.yaml           |  30 +-
 .../devicetree/bindings/usb/ite,it5205.yaml        |  18 +-
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   9 +-
 .../devicetree/bindings/usb/maxim,max3420-udc.yaml |  28 +-
 .../bindings/usb/nvidia,tegra210-xusb.yaml         |   4 +-
 .../devicetree/bindings/usb/qcom,dwc3.yaml         |   5 +
 .../bindings/usb/renesas,rzv2m-usb3drd.yaml        |  36 +-
 .../devicetree/bindings/usb/renesas,usb3-peri.yaml |  24 +-
 .../devicetree/bindings/usb/renesas,usbhs.yaml     |   2 +
 .../devicetree/bindings/usb/snps,dwc3-common.yaml  | 415 ++++++++++++
 .../devicetree/bindings/usb/snps,dwc3.yaml         | 391 +----------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      |  38 +-
 .../devicetree/bindings/usb/ti,tusb73x0-pci.yaml   |   6 +-
 .../devicetree/bindings/usb/ti,usb8020b.yaml       |  20 +-
 .../devicetree/bindings/usb/ti,usb8041.yaml        |  16 +-
 Documentation/driver-api/driver-model/devres.rst   |   1 -
 Documentation/usb/usbip_protocol.rst               |  12 +-
 MAINTAINERS                                        |  10 +
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts          | 178 +++++
 drivers/platform/chrome/Kconfig                    |   7 +
 drivers/platform/chrome/Makefile                   |   4 +
 drivers/platform/chrome/cros_ec_typec.c            |  46 +-
 drivers/platform/chrome/cros_ec_typec.h            |   1 +
 drivers/platform/chrome/cros_typec_altmode.c       | 373 +++++++++++
 drivers/platform/chrome/cros_typec_altmode.h       |  51 ++
 drivers/thunderbolt/ctl.c                          |  11 +-
 drivers/thunderbolt/ctl.h                          |   1 -
 drivers/thunderbolt/debugfs.c                      |  69 +-
 drivers/thunderbolt/eeprom.c                       |  78 ++-
 drivers/thunderbolt/path.c                         |   4 +-
 drivers/thunderbolt/tb.c                           | 196 ++++--
 drivers/thunderbolt/tb.h                           |   5 +
 drivers/thunderbolt/test.c                         |  90 +--
 drivers/thunderbolt/tunnel.c                       | 406 +++++++-----
 drivers/thunderbolt/tunnel.h                       |  61 +-
 drivers/usb/cdns3/cdnsp-gadget.c                   |  13 +-
 drivers/usb/cdns3/core.c                           |   4 +-
 drivers/usb/chipidea/host.c                        |  13 +-
 drivers/usb/class/usblp.c                          |   2 +-
 drivers/usb/common/common.c                        |  14 +
 drivers/usb/common/usb-conn-gpio.c                 |   3 +-
 drivers/usb/core/config.c                          |  19 +-
 drivers/usb/core/driver.c                          |   7 +-
 drivers/usb/core/generic.c                         |  12 +-
 drivers/usb/core/hcd-pci.c                         |  15 +-
 drivers/usb/core/hcd.c                             |   2 +-
 drivers/usb/core/hub.c                             |  10 +-
 drivers/usb/core/port.c                            |   3 +-
 drivers/usb/core/quirks.c                          |   3 +
 drivers/usb/core/sysfs.c                           |  12 +-
 drivers/usb/dwc3/core.c                            |  55 +-
 drivers/usb/dwc3/core.h                            |   5 +-
 drivers/usb/dwc3/dwc3-am62.c                       |  83 ++-
 drivers/usb/dwc3/dwc3-omap.c                       |  13 +-
 drivers/usb/dwc3/dwc3-st.c                         |   6 +-
 drivers/usb/dwc3/gadget.c                          | 111 ++--
 drivers/usb/fotg210/fotg210-core.c                 |   5 +-
 drivers/usb/gadget/function/f_ecm.c                |   4 +-
 drivers/usb/gadget/function/f_ncm.c                |   3 +-
 drivers/usb/gadget/function/f_tcm.c                | 723 +++++++++++++++------
 drivers/usb/gadget/function/storage_common.h       |   2 +-
 drivers/usb/gadget/function/tcm.h                  |  28 +-
 drivers/usb/gadget/function/u_serial.c             |  11 +-
 drivers/usb/gadget/legacy/inode.c                  |   3 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c           |   3 +-
 drivers/usb/gadget/udc/at91_udc.c                  |   3 +-
 drivers/usb/gadget/udc/cdns2/cdns2-gadget.c        |  13 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |   3 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |   3 +-
 drivers/usb/gadget/udc/omap_udc.c                  |   3 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |   3 +-
 drivers/usb/host/oxu210hp-hcd.c                    |   3 +-
 drivers/usb/host/sl811-hcd.c                       |   3 +-
 drivers/usb/host/xhci-caps.h                       |   6 +
 drivers/usb/host/xhci-dbgcap.c                     |   2 +-
 drivers/usb/host/xhci-dbgtty.c                     |  98 ++-
 drivers/usb/host/xhci-plat.c                       |   3 +
 drivers/usb/host/xhci-ring.c                       |  18 +-
 drivers/usb/host/xhci-tegra.c                      |   7 +-
 drivers/usb/host/xhci.c                            |   3 +-
 drivers/usb/host/xhci.h                            |   4 +
 drivers/usb/mtu3/mtu3_debugfs.c                    |   3 +-
 drivers/usb/mtu3/mtu3_dr.c                         |   3 +-
 drivers/usb/mtu3/mtu3_gadget.c                     |   3 +-
 drivers/usb/musb/da8xx.c                           |   3 +-
 drivers/usb/musb/musb_core.c                       |   3 +-
 drivers/usb/musb/musb_dsps.c                       |   3 +-
 drivers/usb/musb/musb_gadget.c                     |   3 +-
 drivers/usb/musb/musb_host.c                       |   3 +-
 drivers/usb/phy/phy-fsl-usb.c                      |   3 +-
 drivers/usb/phy/phy-mv-usb.c                       |   3 +-
 drivers/usb/phy/phy-tahvo.c                        |   3 +-
 drivers/usb/phy/phy.c                              |  26 -
 drivers/usb/serial/ch341.c                         |  35 +-
 drivers/usb/serial/quatech2.c                      |   2 +-
 drivers/usb/storage/Kconfig                        |   3 +-
 drivers/usb/storage/shuttle_usbat.c                |   4 +-
 drivers/usb/storage/transport.c                    |   8 +-
 drivers/usb/typec/altmodes/Kconfig                 |   9 +
 drivers/usb/typec/altmodes/Makefile                |   2 +
 drivers/usb/typec/altmodes/displayport.c           |   4 +-
 drivers/usb/typec/altmodes/nvidia.c                |   2 +-
 drivers/usb/typec/altmodes/thunderbolt.c           | 388 +++++++++++
 drivers/usb/typec/bus.c                            |   6 +-
 drivers/usb/typec/class.c                          |  16 +-
 drivers/usb/typec/hd3ss3220.c                      | 207 +++++-
 drivers/usb/typec/mux/intel_pmc_mux.c              |   2 +-
 drivers/usb/typec/tcpm/fusb302.c                   |  24 +-
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_pdphy.c    |   3 +-
 .../typec/tcpm/qcom/qcom_pmic_typec_pdphy_stub.c   |   3 +-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c |   4 +-
 drivers/usb/typec/tcpm/tcpci.c                     |  17 +-
 drivers/usb/typec/tcpm/tcpci_mt6370.c              |   1 -
 drivers/usb/typec/tcpm/tcpm.c                      | 104 ++-
 drivers/usb/typec/ucsi/Kconfig                     |  13 +
 drivers/usb/typec/ucsi/Makefile                    |   1 +
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              | 333 ++++++++++
 drivers/usb/typec/ucsi/ucsi.h                      |   1 +
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c            |   2 +-
 drivers/usb/usbip/stub_rx.c                        |   2 +-
 drivers/usb/usbip/stub_tx.c                        |   2 +-
 drivers/usb/usbip/vhci_hcd.c                       |  13 +-
 drivers/usb/usbip/vhci_rx.c                        |   6 +-
 drivers/usb/usbip/vudc_sysfs.c                     |   8 +-
 drivers/usb/usbip/vudc_tx.c                        |   2 +-
 include/linux/platform_data/cros_ec_commands.h     |  28 +-
 include/linux/pm.h                                 |   3 +-
 include/linux/usb/pd.h                             |  22 +-
 include/linux/usb/phy.h                            |   5 -
 include/linux/usb/storage.h                        |   8 +
 include/linux/usb/tcpm.h                           |   3 +-
 include/linux/usb/typec.h                          |   2 +
 include/linux/usb/typec_tbt.h                      |   1 +
 include/uapi/linux/usb/functionfs.h                |   8 +-
 scripts/mod/devicetable-offsets.c                  |   1 -
 scripts/mod/file2alias.c                           |   9 +-
 143 files changed, 4011 insertions(+), 1483 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.c
 create mode 100644 drivers/platform/chrome/cros_typec_altmode.h
 create mode 100644 drivers/usb/typec/altmodes/thunderbolt.c
 create mode 100644 drivers/usb/typec/ucsi/cros_ec_ucsi.c

