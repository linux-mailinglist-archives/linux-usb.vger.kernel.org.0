Return-Path: <linux-usb+bounces-36315-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKshLMre5GljbQEAu9opvQ
	(envelope-from <linux-usb+bounces-36315-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 15:55:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2C1424445
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 15:55:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7CBA73011041
	for <lists+linux-usb@lfdr.de>; Sun, 19 Apr 2026 13:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E65F37BE74;
	Sun, 19 Apr 2026 13:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gc0rr5ex"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B375478D;
	Sun, 19 Apr 2026 13:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776606914; cv=none; b=mLhNU9Erjs74zVcJPgjbQinYIJmoqekZVbyKD/8XMI93D7pja4LlrL/g9Nlm+ZgAe10wVkEdSXCR+MxGnqz7cS+laVXVjCcQLfLfEAZzS9u/qRt+av3OTHGWUkwUitR/bVgu0u15YkcnB2gAZeWJ0/RN2MEWl1/nNQcNki3z6RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776606914; c=relaxed/simple;
	bh=dMMPdr1yCtnq85ZUV4IaIVAr4hymeDtFkPgm5Lcu9ec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSnnvHXdIzAtIXXlvmNagumcN8uxysNXnqxWVewrM8lCEBgr9KoGO4SuJ2PAZP3CLqYE8cP12xMTbt6/e0SPM+Muc1dPlbXrp+ymuXeUaGzFh5pk/Kq+zT9Tc3RdoFxir3Pjl7se6F2gQ3BATe8nQPXyoTAAhxwHT/GZSaJ6/sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gc0rr5ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCB45C2BCAF;
	Sun, 19 Apr 2026 13:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776606914;
	bh=dMMPdr1yCtnq85ZUV4IaIVAr4hymeDtFkPgm5Lcu9ec=;
	h=Date:From:To:Cc:Subject:From;
	b=gc0rr5exZBJHsOj5t2VdY/VkCm7YVPHjE6Q/P6DTpoojn6tWX2ajEe9q7YQaKp5Et
	 9zKDbML0WnHoYBLIU14Rwa5yV+VS/m43r0aHS5eSCEJu3xjhXm4LZRXXgMOfUx2q5u
	 ll3I5TluKDbgxNxC7W3VJcgLZFNyKwFKF10fMqKY=
Date: Sun, 19 Apr 2026 15:55:11 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB/Thunderbolt driver changes for 7.1-rc1
Message-ID: <aeTev23E6mRmbsJu@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36315-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,i.mx:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kroah.com:mid]
X-Rspamd-Queue-Id: 4A2C1424445
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 591cd656a1bf5ea94a222af5ef2ee76df029c1d2:

  Linux 7.0-rc7 (2026-04-05 15:26:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc1

for you to fetch changes up to 87117347a0e77f528f357faa2230d5caffcd1b4e:

  usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller (2026-04-11 12:02:43 +0200)

----------------------------------------------------------------
USB / Thunderbolt changes for 7.1-rc1

Here is the big set of USB and Thunderbolt changes for 7.1-rc1.

Lots of little things in here, nothing major, just constant
improvements, updates, and new features.  Highlights are:
  - new USB power supply driver support (will cause merge conflicts in
    drivers/power/supply/Makefile, but it's a simple fix)  These changes
    did touch outside of drivers/usb/ but got acks from the relevant
    mantainers for them.
  - dts file updates and conversions
  - string function conversions into "safer" ones
  - new device quirks
  - xhci driver updates
  - usb gadget driver minor fixes
  - typec driver additions and updates
  - small number of thunderbolt driver changes
  - dwc3 driver updates and additions of new hardware support
  - other minor driver updates

All of these have been in the linux-next tree for a while with no
reported issues

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Abel Vesa (2):
      dt-bindings: usb: qcom,dwc3: Allow high-speed interrupt on Glymur, Hamoa and Milos
      dt-bindings: usb: qcom,snps-dwc3: Document the Eliza compatible

Ai Chao (7):
      USB: serial: ti_usb_3410_5052: Use safer strscpy() instead of strcpy()
      usb: musb: Use safer strscpy() instead of strcpy()
      usb: gadget: functionfs: Use safer strscpy() instead of strcpy()
      usb: typec: tcpm: Use safer strscpy() instead of strcpy()
      usb: gadget: udc: Use safer strscpy() instead of strcpy()
      usbip: vhci_sysfs: Use safer strscpy() instead of strcpy()
      USB: serial: ti_usb_3410_5052: use strscpy() instead of strcpy()

Aldo Conte (1):
      usb: typec: Document priority and mode_selection fields in struct typec_altmode

Alexander Stein (2):
      dt-bindings: usb: cdns,usb3: support USB devices in DT
      dt-bindings: usb: ti,usb8041: Support nested USB hubs

Alexey Charkov (9):
      usb: misc: onboard_usb_dev: Add support for requesting VBUS for Type-A ports
      dt-bindings: vendor-prefixes: Add Shenzhen Corechips Microelectronics
      dt-bindings: usb: Add Corechips SL6341 USB2.0/3.0 hub controller
      usb: misc: onboard_usb_dev: Add Corechips SL6341 USB 2.0/3.0 hub
      dt-bindings: vendor-prefixes: Add Hynetek Semiconductor Co., Ltd.
      dt-bindings: usb: richtek,rt1711h: Switch ETEK ET7304 to use a fallback compatible
      dt-bindings: usb: richtek,rt1711h: Add Hynetek HUSB311
      usb: typec: tcpci_rt1711h: Drop unnecessary VID/PID/DID checks
      usb: typec: fusb302: Switch to threaded IRQ handler

Amit Sunil Dhamne (9):
      dt-bindings: connector: Add sink properties to comply with PD 3.1 spec
      usb: typec: tcpm: add support for Sink Cap Extended msg response
      dt-bindings: mfd: maxim,max77759: reference power-supply schema and add regulator property
      dt-bindings: usb: maxim,max33359: Add supply property for vbus
      mfd: max77759: add register bitmasks and modify irq configs for charger
      lib/linear_ranges: Add linear_range_get_selector_high_array
      power: supply: max77759: add charger driver
      usb: typec: tcpm/tcpci_maxim: deprecate WAR for setting charger mode
      mfd: max77759: fix comment style for enums

Anjelique Melendez (1):
      usb: typec: ucsi: ucsi_glink: Add support for Glymur and Kaanapali

Badhri Jagan Sridharan (3):
      dt-bindings: connector: Add SPR AVS Sink APDO definitions
      power: supply: Add PD SPR AVS support to USB type enum
      tcpm: Implement sink support for PD SPR AVS negotiation

Bence CsÛk·s (1):
      USB: core: Use krealloc() in usb_cache_string()

Charan Pedumuru (8):
      dt-bindings: usb: ti,omap4-musb: convert to DT schema
      dt-bindings: usb: ti,dwc3: convert to DT schema
      dt-bindings: usb: st,st-ohci-300x: convert to DT schema
      arm: dts: at91: remove unused #address-cells/#size-cells from sam9x60 udc node
      dt-bindings: usb: generic-ohci: add AT91RM9200 OHCI binding support
      dt-bindings: usb: generic-ehci: fix schema structure and add at91sam9g45 constraints
      dt-bindings: usb: atmel,at91rm9200-udc: convert to DT schema
      dt-bindings: usb: atmel,at91sam9rl-udc: convert to DT schema

Chukun Pan (1):
      usb: dwc3: Add optional VBUS regulator support to SpacemiT K1

Conor Dooley (1):
      dt-bindings: usb: mpfs-musb: permit resets

Daniel Br·t (1):
      usb: storage: Expand range of matched versions for VL817 quirks entry

Dave Carey (1):
      USB: cdc-acm: Add quirks for Yoga Book 9 14IAH10 INGENIC touchscreen

Dave Hansen (1):
      MAINTAINERS: Remove bouncing maintainer, Mika takes over DMA test driver

Diogo Ivo (1):
      usb: xhci: tegra: Remove redundant mutex when setting phy mode

Ethan Tidmore (2):
      usb: typec: Fix error pointer dereference
      usb: gadget: f_hid: Add missing error code

Fabio Porcedda (1):
      USB: serial: option: add Telit Cinterion FN990A MBIM composition

Gabor Juhos (1):
      usb: ehci-orion: remove optional PHY handling code remnants

Greg Kroah-Hartman (11):
      Merge 7.0-rc4 into usb-next
      Revert "usb: cdnsp: Add support for device-only configuration"
      Revert "usb: cdns3: Add USBSSP platform driver support"
      Revert "dt-bindings: usb: cdns,usb3: document USBSSP controller support"
      Merge tag 'v7.0-rc7' into usb-next
      usb: core: config: reverse the size check of the SSP isoc endpoint descriptor
      usb: gadget: renesas_usb3: validate endpoint index in standard request handlers
      usb: gadget: f_phonet: fix skb frags[] overflow in pn_rx_complete()
      usb: gadget: f_ncm: validate minimum block_len in ncm_unwrap_ntb()
      Merge tag 'thunderbolt-for-v7.1-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-next
      Merge tag 'usb-serial-7.1-rc1' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-next

Hans Zhang (1):
      USB: of: Simplify with scoped for each OF child loop

Ingo Rohloff (1):
      usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.

Jameson Thies (3):
      usb: typec: ucsi: Set usb mode on partner change
      dt-bindings: chrome: Add cros-ec-ucsi compatibility to typec binding
      usb: typec: cros_ec_ucsi: Load driver from OF and ACPI definitions

Johan Hovold (7):
      USB: cypress_cy7c63: drop redundant device reference
      USB: cytherm: drop redundant device reference
      USB: ljca: drop redundant interface reference
      USB: trancevibrator: drop redundant device reference
      USB: usbsevseg: drop redundant device reference
      USB: apple-mfi-fastcharge: drop redundant device reference
      USB: usbip: drop redundant device reference

Kelvin Mbogo (3):
      usb: usbip: fix integer overflow in usbip_recv_iso()
      usb: usbip: validate iso frame actual_length in usbip_recv_iso()
      usb: usbip: fix OOB read/write in usbip_pad_iso()

Kexin Sun (1):
      usb: gadget: udc: update outdated comment for renamed usb_gadget_udc_start()

Krishna Kurapati (1):
      usb: typec: ucsi: Add UCSI_USB4_IMPLIES_USB quirk for X1E80100

Krzysztof Kozlowski (7):
      USB: typec: tcpci: Make tcpci_pm_ops variable static
      usb: misc: onboard_dev: Remove duplicated static structures
      dt-bindings: usb: qcom,snps-dwc3: Drop stale child node comment
      dt-bindings: usb: qcom,snps-dwc3: Add missing clocks and interrupts constraints
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM6375
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for SM4250
      dt-bindings: usb: qcom,snps-dwc3: Add constraints for IPQ5424 and IPQ9574

Loic Poulain (1):
      usb: typec: ucsi: Invoke ucsi_run_command tracepoint

Michael Zimmermann (1):
      usb: gadget: f_hid: don't call cdev_init while cdev in use

Michal Pecio (3):
      usb: xhci: Simplify clearing the Event Interrupt bit
      usb: xhci: Fix debugfs bandwidth reporting
      usb: xhci: Make usb_host_endpoint.hcpriv survive endpoint_disable()

Minda Chen (2):
      dt-bindings: usb: dwc3: add support for StarFive JHB100
      usb: dwc3: starfive: Add JHB100 USB 2.0 DRD controller

Mostafa Saleh (1):
      usb: typec: ps883x: Fix Oops at unbind

Nathan Rebello (1):
      usbip: validate number_of_packets in usbip_pack_ret_submit()

Neil Armstrong (1):
      dt-bindings: usb: document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller

Nicolas Chauvet (1):
      usb: tegra: use MODULE_FIRMWARE if SOC is ENABLED

Niklas Neronin (21):
      usb: xhci: simplify CMRT initialization logic
      usb: xhci: relocate Restore/Controller error check
      usb: xhci: factor out roothub bandwidth cleanup
      usb: xhci: move reserving command ring trb
      usb: xhci: move ring initialization
      usb: xhci: move initialization for lifetime objects
      usb: xhci: split core allocation and initialization
      usb: xhci: improve debug messages during suspend
      usb: xhci: optimize resuming from S4 (suspend-to-disk)
      usb: xhci: stop treating 'wIndex' as a mutable port number
      usb: xhci: rename 'wIndex' parameters to 'portnum'
      usb: xhci: clean up handling of upper bits in SetPortFeature wIndex
      usb: xhci: clean up 'wValue' handling in xhci_hub_control()
      usb: xhci: separate use of USB Chapter 11 PLS macros from xHCI-specific PLS macros
      usb: xhci: add PORTPMSC variable to xhci_hub_control()
      usb: xhci: add PORTSC variable to xhci_hub_control()
      usb: xhci: rename parameter to match argument 'portsc'
      usb: xhci: cleanup xhci_hub_report_usb3_link_state()
      usb: xhci: simpilfy resume root hub code
      usb: xhci: move roothub port limit validation
      usb: xhci: remove duplicate '0x' prefix

Oliver Neukum (17):
      net: cdc-ncm: cleanup device descriptor
      usb: uss720: unify error handling in probe
      usb: image: microtek: cleanup ep handling
      usb: image: microtek: remove function trace macro
      usb: image: microtek: remove outdated comment
      usb: image: microtek: remove unused macro
      usb: image: microtek: use dev_warn and dev_err
      USB: uas: give the error handler the correct name
      usb: iowarrior: remove inherent race with minor number
      iowarrior: use interruptible lock in iowarrior_write()
      iowarrior: use normal memory in write path
      usb: misc: appledisplay: use HID includes
      usb: misc: iowarrior: use HID includes
      usb: uapi: add usb 3.0 authentication declarations
      USB: uapi: add BULK_MAX_PACKET_UPDATE
      usb: translate ENOSPC for user space
      xhci: use BIT macro

Pawel Laszczak (1):
      usb: cdnsp: Add support for device-only configuration

Pengpeng Hou (1):
      usb: gadget: bdc: validate status-report endpoint indices

Pengyu Luo (1):
      usb: ucsi: huawei_gaokun: make gaokun_ucsi_ops static

Peter Chen (2):
      dt-bindings: usb: cdns,usb3: document USBSSP controller support
      usb: cdns3: Add USBSSP platform driver support

Qinghua Zhao (1):
      drivers/usb/host: Fix spelling error 'seperate' -> 'separate'

Rene Sapiens (2):
      thunderbolt: Read router NVM version before applying quirks
      thunderbolt: Disable CLx on Titan Ridge-based devices with old firmware

Rodrigo Gobbi (1):
      dt-bindings: usb: maxim,max3421: convert to DT schema

Rosen Penev (6):
      usb: typec: tcpm: kzalloc + kcalloc to kzalloc_flex
      thunderbolt: dma_port: kmalloc_array + kzalloc to flex
      usb: renesas_usbhs: use kzalloc_flex
      usb: fhci: use kzalloc_flex for priv struct
      thunderbolt: Use kzalloc_flex() for struct tb_path allocation
      thunderbolt: tunnel: Simplify allocation

Sean Rhodes (1):
      usb: core: allow ACPI-managed hard-wired ports to power off

Sebastian Reichel (3):
      usb: typec: fusb302: add DRM DP HPD bridge support
      usb: typec: mux: avoid duplicated orientation switches
      usb: typec: mux: avoid duplicated mux switches

Thomas Weiﬂschuh (1):
      usb: endpoint: drop custom sysfs attribute structure

Thorsten Blum (1):
      USB: serial: iuu_phoenix: fix iuutool author name

Xu Yang (12):
      dt-bindings: usb: introduce nxp,imx-dwc3
      usb: dwc3: add needs_full_reinit flag
      usb: dwc3: introduce flatten model driver of i.MX Soc
      usb: dwc3: fix a kernel-doc issue
      usb: dwc3: fix a typo 'HishSpeed'
      usb: port: add delay after usb_hub_set_port_power()
      usb: dwc3: imx: avoid calling imx suspend/resume callbacks twice
      dt-bindings: usb: nxp,ptn5110: add optional orientation-gpios property
      usb: typec: tcpci: support setting orientation via GPIO
      usb: chipidea: core: refactor ci_usb_role_switch_set()
      usb: chipidea: core: allow ci_irq_handler() handle both ID and VBUS change
      usb: chipidea: otg: not wait vbus drop if use role_switch

Yixun Lan (4):
      dt-bindings: usb: dwc3: spacemit: add support for K3 SoC
      usb: dwc3: dwc3-generic-plat: spacemit: add support for K3 SoC
      dt-bindings: usb: Add support for Terminus FE1.1s USB2.0 Hub controller
      usb: misc: onboard_usb_dev: Add Terminus FE1.1s USB2.0 Hub (1a40:0101)

Yuanshen Cao (2):
      dt-bindings: usb: document the Etek ET7304 USB Type-C Port Controller
      usb: typec: tcpm: Add vid and chip info for Etek ET7304

Zeeshan Ahmad (2):
      usb: dwc3: qcom: simplify error check in dwc3_qcom_find_num_ports()
      usb: dwc3: gadget: use explicit 0 for success in __dwc3_gadget_kick_transfer()

Zhaoyang Yu (1):
      USB: pxa27x_udc: check return value of clk_enable

Zongmin Zhou (1):
      usbip: tools: add hint when no exported devices are found

 Documentation/ABI/testing/sysfs-class-power        |   3 +-
 .../bindings/chrome/google,cros-ec-typec.yaml      |  19 +-
 .../bindings/connector/usb-connector.yaml          |  39 +-
 .../devicetree/bindings/mfd/maxim,max77759.yaml    |  16 +-
 .../bindings/usb/atmel,at91rm9200-udc.yaml         |  76 ++
 .../bindings/usb/atmel,at91sam9rl-udc.yaml         |  74 ++
 .../devicetree/bindings/usb/atmel-usb.txt          | 125 ---
 .../devicetree/bindings/usb/cdns,usb3.yaml         |   1 +
 .../devicetree/bindings/usb/corechips,sl6341.yaml  |  79 ++
 .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |   2 +
 .../devicetree/bindings/usb/generic-ehci.yaml      |  46 +-
 .../devicetree/bindings/usb/generic-ohci.yaml      |  41 +
 .../devicetree/bindings/usb/maxim,max33359.yaml    |   8 +
 .../devicetree/bindings/usb/maxim,max3421.txt      |  23 -
 .../devicetree/bindings/usb/maxim,max3421.yaml     |  67 ++
 .../bindings/usb/microchip,mpfs-musb.yaml          |   3 +
 .../devicetree/bindings/usb/nxp,imx-dwc3.yaml      | 123 +++
 .../devicetree/bindings/usb/nxp,ptn5110.yaml       |   4 +
 Documentation/devicetree/bindings/usb/ohci-st.txt  |  36 -
 Documentation/devicetree/bindings/usb/omap-usb.txt |  80 --
 .../devicetree/bindings/usb/qcom,snps-dwc3.yaml    |  41 +-
 .../bindings/usb/renesas,upd720201-pci.yaml        |  63 ++
 .../devicetree/bindings/usb/richtek,rt1711h.yaml   |  18 +-
 .../devicetree/bindings/usb/spacemit,k1-dwc3.yaml  |   6 +-
 .../devicetree/bindings/usb/st,st-ohci-300x.yaml   |  85 ++
 .../bindings/usb/starfive,jhb100-dwc3.yaml         |  64 ++
 .../devicetree/bindings/usb/terminus,fe11.yaml     |  62 ++
 Documentation/devicetree/bindings/usb/ti,dwc3.yaml | 100 +++
 .../devicetree/bindings/usb/ti,omap4-musb.yaml     | 120 +++
 .../devicetree/bindings/usb/ti,usb8041.yaml        |  23 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |   6 +
 MAINTAINERS                                        |  11 +-
 arch/arm/boot/dts/microchip/sam9x60.dtsi           |   2 -
 drivers/mfd/max77759.c                             |  95 ++-
 drivers/power/supply/Kconfig                       |  11 +
 drivers/power/supply/Makefile                      |   1 +
 drivers/power/supply/max77759_charger.c            | 774 ++++++++++++++++++
 drivers/power/supply/power_supply_sysfs.c          |   2 +
 drivers/thunderbolt/dma_port.c                     |  15 +-
 drivers/thunderbolt/path.c                         |  28 +-
 drivers/thunderbolt/quirks.c                       |   7 +
 drivers/thunderbolt/switch.c                       |  30 +-
 drivers/thunderbolt/tb.h                           |   5 +-
 drivers/thunderbolt/tunnel.c                       |  10 +-
 drivers/thunderbolt/tunnel.h                       |   5 +-
 drivers/usb/chipidea/core.c                        |  74 +-
 drivers/usb/chipidea/otg.c                         |   7 +-
 drivers/usb/class/cdc-acm.c                        |  53 +-
 drivers/usb/core/config.c                          |   4 +-
 drivers/usb/core/endpoint.c                        |   8 -
 drivers/usb/core/message.c                         |  20 +-
 drivers/usb/core/of.c                              |   8 +-
 drivers/usb/core/port.c                            |  21 +-
 drivers/usb/dwc3/Kconfig                           |  12 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  29 +-
 drivers/usb/dwc3/core.h                            |   9 +-
 drivers/usb/dwc3/dwc3-generic-plat.c               |  25 +-
 drivers/usb/dwc3/dwc3-imx.c                        | 448 +++++++++++
 drivers/usb/dwc3/dwc3-qcom.c                       |   4 +-
 drivers/usb/dwc3/gadget.c                          |   2 +-
 drivers/usb/dwc3/glue.h                            |   3 +
 drivers/usb/dwc3/ulpi.c                            |  25 +
 drivers/usb/gadget/function/f_hid.c                |  17 +-
 drivers/usb/gadget/function/f_midi2.c              |   6 +-
 drivers/usb/gadget/function/f_ncm.c                |   4 +-
 drivers/usb/gadget/function/f_phonet.c             |   9 +
 drivers/usb/gadget/function/u_serial.c             |   2 +-
 drivers/usb/gadget/udc/bdc/bdc_ep.c                |   4 +
 drivers/usb/gadget/udc/core.c                      |   5 +-
 drivers/usb/gadget/udc/pxa27x_udc.c                |  68 +-
 drivers/usb/gadget/udc/renesas_usb3.c              |   7 +-
 drivers/usb/gadget/udc/snps_udc_core.c             |   2 +-
 drivers/usb/host/ehci-orion.c                      |   9 -
 drivers/usb/host/fhci-hcd.c                        |  15 +-
 drivers/usb/host/fhci.h                            |   3 +-
 drivers/usb/host/xhci-debugfs.c                    |  10 +-
 drivers/usb/host/xhci-hub.c                        | 383 +++++----
 drivers/usb/host/xhci-mem.c                        | 133 +--
 drivers/usb/host/xhci-mvebu.c                      |   2 +-
 drivers/usb/host/xhci-ring.c                       |   9 +-
 drivers/usb/host/xhci-tegra.c                      |  12 +-
 drivers/usb/host/xhci.c                            | 231 +++---
 drivers/usb/host/xhci.h                            | 124 +--
 drivers/usb/image/microtek.c                       |  79 +-
 drivers/usb/misc/apple-mfi-fastcharge.c            |   3 +-
 drivers/usb/misc/appledisplay.c                    |   8 +-
 drivers/usb/misc/cypress_cy7c63.c                  |   4 +-
 drivers/usb/misc/cytherm.c                         |   4 +-
 drivers/usb/misc/iowarrior.c                       |  42 +-
 drivers/usb/misc/onboard_usb_dev.c                 |   5 +
 drivers/usb/misc/onboard_usb_dev.h                 |  40 +-
 drivers/usb/misc/trancevibrator.c                  |   3 +-
 drivers/usb/misc/usb-ljca.c                        |  15 +-
 drivers/usb/misc/usbsevseg.c                       |   3 +-
 drivers/usb/misc/uss720.c                          |  27 +-
 drivers/usb/musb/musb_core.c                       |   2 +-
 drivers/usb/renesas_usbhs/mod_gadget.c             |  16 +-
 drivers/usb/serial/iuu_phoenix.c                   |   2 +-
 drivers/usb/serial/option.c                        |   2 +
 drivers/usb/serial/ti_usb_3410_5052.c              |  16 +-
 drivers/usb/storage/uas.c                          |   4 +-
 drivers/usb/storage/unusual_devs.h                 |   7 +-
 drivers/usb/typec/mux.c                            |  25 +-
 drivers/usb/typec/mux/ps883x.c                     |   1 +
 drivers/usb/typec/tcpm/Kconfig                     |   2 +
 drivers/usb/typec/tcpm/fusb302.c                   |  18 +-
 drivers/usb/typec/tcpm/tcpci.c                     |  20 +-
 drivers/usb/typec/tcpm/tcpci_maxim.h               |   1 +
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |  54 +-
 drivers/usb/typec/tcpm/tcpci_rt1711h.c             |  45 +-
 drivers/usb/typec/tcpm/tcpm.c                      | 889 ++++++++++++++++++---
 drivers/usb/typec/tipd/core.c                      |   6 +-
 drivers/usb/typec/ucsi/cros_ec_ucsi.c              |  26 +-
 drivers/usb/typec/ucsi/ucsi.c                      |  14 +-
 drivers/usb/typec/ucsi/ucsi.h                      |   3 +
 drivers/usb/typec/ucsi/ucsi_glink.c                |   4 +
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c        |   2 +-
 drivers/usb/usbip/stub_dev.c                       |   5 +-
 drivers/usb/usbip/usbip_common.c                   |  83 +-
 drivers/usb/usbip/vhci_sysfs.c                     |   2 +-
 include/dt-bindings/usb/pd.h                       |  36 +
 include/linux/linear_range.h                       |   3 +
 include/linux/mfd/max77759.h                       | 166 +++-
 include/linux/power_supply.h                       |   3 +
 include/linux/usb.h                                |   5 +-
 include/linux/usb/cdc_ncm.h                        |   4 +-
 include/linux/usb/pd.h                             | 108 ++-
 include/linux/usb/tcpm.h                           |   2 +-
 include/linux/usb/typec_altmode.h                  |   3 +
 include/uapi/linux/usb/ch9.h                       |  33 +-
 lib/linear_ranges.c                                |  36 +
 tools/usb/usbip/libsrc/usbip_device_driver.c       |   6 +-
 tools/usb/usbip/libsrc/usbip_host_common.c         |   3 +
 tools/usb/usbip/libsrc/usbip_host_driver.c         |   7 +-
 135 files changed, 4767 insertions(+), 1387 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/atmel,at91rm9200-udc.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/atmel,at91sam9rl-udc.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/atmel-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/corechips,sl6341.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.txt
 create mode 100644 Documentation/devicetree/bindings/usb/maxim,max3421.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/nxp,imx-dwc3.yaml
 delete mode 100644 Documentation/devicetree/bindings/usb/ohci-st.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/omap-usb.txt
 create mode 100644 Documentation/devicetree/bindings/usb/renesas,upd720201-pci.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/st,st-ohci-300x.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/starfive,jhb100-dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/terminus,fe11.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,omap4-musb.yaml
 create mode 100644 drivers/power/supply/max77759_charger.c
 create mode 100644 drivers/usb/dwc3/dwc3-imx.c

