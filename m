Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C781F1E0B4E
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 12:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389460AbgEYKDm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 06:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389302AbgEYKDm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 May 2020 06:03:42 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1741C061A0E
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 03:03:41 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id a25so8478158ljp.3
        for <linux-usb@vger.kernel.org>; Mon, 25 May 2020 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version;
        bh=jfKUW0da5l95yf3GIIysII+Y5seAxRRz44GiO5Iaw1o=;
        b=nl43lkDjTPijHVhT77WzM3zeKJnhRFX8qVh7rfLHilVq9kZYTtlC5VaDmX/E7CosSr
         zlKXfnugf3U3NdwM05e+Fpen97E+k7MdD7LZOZFijqcMup76qr9CpD9rl7yJD0E99e8M
         BfPlqSgE8nvsgoUNtQQ6IK+7aKMMhZdbxVX54XptqCj11sX/BPXZ/9q/j5wvDrf83muj
         4YfFy+Hm4WYzDYy9Nvsf2ma1rIysH9x/NjRLQddtBa+rfbK/G7+wCXcu1iRkpGBwacUR
         uViJGsJVykBiK6TuUQOGyxRStb90Ozp//QAkImIWz5b3/Zx+qgttJBpmfgDrVhuQfA8j
         4g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version;
        bh=jfKUW0da5l95yf3GIIysII+Y5seAxRRz44GiO5Iaw1o=;
        b=g3yb9kHU+V/72beGDHB8uwyJovKGXdPjcbMimfgD0Bar109VnPD7mPmiLo4Iu7VOah
         zfZKdjC7r9a0neE2XsTMFxkhCSlmFakPQCVIqQ+wRzOG7GWlPz8OaU1karIQ3AtgSADV
         stKivHtHgY/mGpgwtI4KTJ5P+CxLSUXCg08gKUxmVDB6ArrLhzI/EjzDKeL2o+BBTniv
         X4numGJHwyLfrBSqsEAG/ROHVfgmX0pQyS40tENNlomN1mNhHMHRCZbyCbL+gzuqhvlj
         i3FKw0PQ6iOp7+8cmUMeSdinkNqxy11oEThuoPtyAFbGGzXjy2p6lT3Rw9PaNj9qf+0t
         y2bw==
X-Gm-Message-State: AOAM533rOMkb/yxvDS18mfPnz7ysg4uxPgpMqXIAEWSFCQ5RONFeXS7o
        I2INaaLX2g8ITEMFW4/K7+fA1Fnc
X-Google-Smtp-Source: ABdhPJwpQoyw1OT+VAS41wYD5ReO8BXsmIYTeAGxhxwsgSBiYkgz5dIrCouA18pQWjkj9IgGqbiybg==
X-Received: by 2002:a2e:b4aa:: with SMTP id q10mr13988050ljm.12.1590401019873;
        Mon, 25 May 2020 03:03:39 -0700 (PDT)
Received: from saruman (91-155-214-58.elisa-laajakaista.fi. [91.155.214.58])
        by smtp.gmail.com with ESMTPSA id d11sm2416502lji.85.2020.05.25.03.03.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 May 2020 03:03:39 -0700 (PDT)
From:   Felipe Balbi <balbi@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: [GIT PULL] USB for v5.8 merge window
Date:   Mon, 25 May 2020 13:03:35 +0300
Message-ID: <87h7w4wcug.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha256; protocol="application/pgp-signature"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


Hi Greg,

here's my pull request for v5.8 merge window. Note that we have a
conflict in CDNS3 driver. The conflict is all about indentation, I don't
really have an opinion if you want to choose my version or yours,
whichever you choose works for me :-)

Most patches have been soaking for several weeks now without any
reports.

Let me know if you want anything to be changed.

Cheers

The following changes since commit 0e698dfa282211e414076f9dc7e83c1c288314fd:

  Linux 5.7-rc4 (2020-05-03 14:56:04 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git tags/usb-for-=
v5.8

for you to fetch changes up to 1c11e74e9079289d8aaccc34b74cbf6463c0b791:

  usb: dwc3: keystone: Turn on USB3 PHY before controller (2020-05-25 11:10=
:07 +0300)

=2D---------------------------------------------------------------
USB: changes for v5.8 merge window

Rather busy cycle. We have a total 99 non-merge commits going into v5.8
merge window. The majority of the changes are in dwc3 this around (31.7%
of all changes). It's composed mostly Thinh's recent updates to get dwc3
to behave correctly with stream transfers. We have also have Roger's for
Keystone platforms and Neil's updates for the meson glue layer.

Apart from those, we have the usual set of non-critical fixes, new
device IDs, spelling fixes all over the place.

Signed-off-by: Felipe Balbi <balbi@kernel.org>

=2D---------------------------------------------------------------
Andrey Konovalov (1):
      USB: dummy-hcd: use configurable endpoint naming scheme

Christophe JAILLET (1):
      usb: gadget: max3420: Add a missing '\n' in a log message

Colin Ian King (2):
      usb: gadget: function: remove redundant assignment to variable 'statu=
s'
      usb: gadget: lpc32xx_udc: don't dereference ep pointer before null ch=
eck

Dinghao Liu (1):
      usb: cdns3: Fix runtime PM imbalance on error

Fabrice Gasnier (4):
      usb: dwc2: gadget: move gadget resume after the core is in L0 state
      usb: gadget: u_serial: add suspend resume callbacks
      usb: gadget: f_serial: add suspend resume callbacks
      usb: gadget: f_acm: add suspend resume callbacks

Gregory CLEMENT (3):
      usb: gadget: udc: atmel: Don't use DT to configure end point
      dt-bindings: usb: atmel: Mark EP child node as deprecated
      ARM: dts: at91: Remove the USB EP child node

Jason Yan (6):
      usb: gadget: udc: remove unused 'driver_desc'
      usb: gadget: f_fs: remove unneeded semicolon in __ffs_data_got_descs()
      usb: dwc3: use true,false for dwc->otg_restart_host
      usb: gadget: net2272: use false for 'use_dma'
      usb: gadget: udc: remove comparison to bool in mv_u3d_core.c
      usb: gadget: omap_udc: remove unneeded semicolon

Jules Irenge (2):
      usb: gadget: Add missing annotation for xudc_handle_setup()
      USB: dummy-hcd: Add missing annotation for set_link_state()

Martin Blumenstingl (4):
      arm64: dts: amlogic: use the new USB control driver for GXL and GXM
      phy: amlogic: meson-gxl-usb3: remove code for non-existing PHY
      usb: dwc3: of-simple: remove Amlogic GXL and AXG compatibles
      dt-bindings: usb: dwc3: remove old DWC3 wrapper

Martin Kepplinger (1):
      usb: dwc3: support continuous runtime PM with dual role

Michael Grzeschik (1):
      usb: gadget: uvc_video: add worker to handle the frame pumping

Minas Harutyunyan (1):
      usb: dwc2: Update Core Reset programming flow.

Nagarjuna Kristam (4):
      usb: gadget: tegra-xudc: Add vbus_draw support
      dt-bindings: usb: tegra-xudc: Add Tegra194 XUSB controller support
      usb: gadget: tegra-xudc: Add Tegra194 support
      usb: gadget: tegra-xudc: add port_speed_quirk

Nathan Chancellor (1):
      USB: gadget: udc: s3c2410_udc: Remove pointless NULL check in s3c2410=
_udc_nuke

Neil Armstrong (10):
      dt-bindings: usb: amlogic,meson-g12a-usb-ctrl: add the Amlogic GXL an=
d GXM Families USB Glue Bindings
      usb: dwc3: meson-g12a: specify phy names in soc data
      usb: dwc3: meson-g12a: handle the phy and glue registers separately
      usb: dwc3: meson-g12a: get the reset as shared
      usb: dwc3: meson-g12a: check return of dwc3_meson_g12a_usb_init
      usb: dwc3: meson-g12a: refactor usb2 phy init
      usb: dwc3: meson-g12a: refactor usb init
      usb: dwc3: meson-g12a: support the GXL/GXM DWC3 host phy disconnect
      usb: dwc3: meson-g12a: add support for GXL and GXM SoCs
      doc: dt: bindings: usb: dwc3: remove amlogic compatible entries

Nishad Kamdar (5):
      USB: gadget: Use the correct style for SPDX License Identifier
      USB: dwc3: Use the correct style for SPDX License Identifier
      USB: dwc2: Use the correct style for SPDX License Identifier
      USB: mtu3: Use the correct style for SPDX License Identifier
      usb: renesas_usbhs: Use the correct style for SPDX License Identifier

Pawel Laszczak (1):
      usb: gadget: Fix issue with config_ep_by_speed function

Peter Chen (7):
      usb: cdns3: core: get role switch node from firmware
      usb: cdns3: delete role_override
      usb: cdns3: change "cdsn3" to"cdns3"
      usb: cdns3: change dev_info to dev_dbg for debug message
      usb: gadget: core: sync interrupt before unbind the udc
      usb: cdns3: gadget: assign interrupt number to USB gadget structure
      usb: cdns3: ep0: delete the redundant status stage

Qiushi Wu (1):
      usb: gadget: fix potential double-free in m66592_probe.

Roger Quadros (3):
      dt-bindings: usb: convert keystone-usb.txt to YAML
      dt-bindings: usb: ti,keystone-dwc3.yaml: Add USB3.0 PHY property
      usb: dwc3: keystone: Turn on USB3 PHY before controller

Sandeep Maheswaram (5):
      dt-bindings: usb: qcom,dwc3: Convert USB DWC3 bindings
      dt-bindings: usb: qcom,dwc3: Add compatible for SC7180
      dt-bindings: usb: qcom,dwc3: Introduce interconnect properties for Qu=
alcomm DWC3 driver
      arm64: dts: qcom: sdm845: Add interconnect properties for USB
      arm64: dts: qcom: sc7180: Add interconnect properties for USB

Tang Bin (1):
      usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()

Tao Ren (7):
      usb: gadget: aspeed: improve vhub port irq handling
      usb: gadget: aspeed: support multiple language strings
      usb: gadget: add "usb_validate_langid" function
      usb: gadget: aspeed: allow to set usb strings in device tree
      usb: gadget: aspeed: allow to set device IDs in device tree
      usb: gadget: aspeed: fixup usb1 device descriptor at init time
      dt-bindings: usb: document aspeed vhub device ID/string properties

Thinh Nguyen (24):
      usb: dwc3: gadget: Properly handle ClearFeature(halt)
      usb: dwc3: gadget: Give back staled requests
      usb: dwc3: gadget: Remove unnecessary checks
      usb: dwc3: gadget: Refactor dwc3_gadget_ep_dequeue
      usb: dwc3: drd: Don't free non-existing irq
      usb: dwc3: core: Use role-switch default dr_mode
      usb: dwc3: gadget: Properly handle failed kick_transfer
      usb: dwc3: gadget: Store resource index of start cmd
      usb: dwc3: gadget: Issue END_TRANSFER to retry isoc transfer
      usb: dwc3: gadget: WARN on no-resource status
      usb: dwc3: gadget: Continue to process pending requests
      usb: dwc3: Add support for DWC_usb32 IP
      usb: dwc3: Get MDWIDTH for DWC_usb32
      usb: gadget: Introduce usb_request->is_last
      usb: gadget: f_tcm: Inform last stream request
      usb: dwc3: gadget: Check for in-progress END_TRANSFER
      usb: dwc3: gadget: Refactor TRB completion handler
      usb: dwc3: gadget: Enable XferComplete event
      usb: dwc3: gadget: Handle XferComplete for streams
      usb: dwc3: gadget: Wait for transfer completion
      usb: dwc3: gadget: Don't prepare beyond a transfer
      usb: dwc3: gadget: Handle stream transfers
      usb: dwc3: gadget: Use SET_EP_PRIME for NoStream
      usb: dwc3: gadget: Check for prepared TRBs

Wei Yongjun (1):
      usb: gadget: mass_storage: use module_usb_composite_driver to simplif=
y the code

Yu Chen (1):
      usb: dwc3: Increase timeout for CmdAct cleared by device controller

kbuild test robot (1):
      usb: cdns3: mark local functions static

 .../devicetree/bindings/phy/meson-gxl-usb3-phy.txt |  31 --
 .../devicetree/bindings/usb/amlogic,dwc3.txt       |  42 --
 .../bindings/usb/amlogic,meson-g12a-usb-ctrl.yaml  |  73 +++-
 .../devicetree/bindings/usb/aspeed,usb-vhub.yaml   |  68 +++
 .../devicetree/bindings/usb/atmel-usb.txt          |  56 +--
 Documentation/devicetree/bindings/usb/dwc3.txt     |   2 -
 .../devicetree/bindings/usb/keystone-usb.txt       |  56 ---
 .../devicetree/bindings/usb/nvidia,tegra-xudc.yaml |   2 +
 .../devicetree/bindings/usb/qcom,dwc3.txt          | 104 -----
 .../devicetree/bindings/usb/qcom,dwc3.yaml         | 167 ++++++++
 .../devicetree/bindings/usb/ti,keystone-dwc3.yaml  |  77 ++++
 arch/arm/boot/dts/at91sam9g45.dtsi                 |  54 ---
 arch/arm/boot/dts/at91sam9rl.dtsi                  |  54 ---
 arch/arm/boot/dts/at91sam9x5.dtsi                  |  54 ---
 arch/arm/boot/dts/sama5d2.dtsi                     | 120 ------
 arch/arm/boot/dts/sama5d3.dtsi                     | 107 -----
 arch/arm/boot/dts/sama5d4.dtsi                     | 120 ------
 .../boot/dts/amlogic/meson-gx-libretech-pc.dtsi    |   3 +-
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |   3 +-
 .../dts/amlogic/meson-gxl-s805x-libretech-ac.dts   |   3 +-
 .../boot/dts/amlogic/meson-gxl-s805x-p241.dts      |   3 +-
 .../dts/amlogic/meson-gxl-s905d-phicomm-n1.dts     |   4 +
 .../boot/dts/amlogic/meson-gxl-s905w-p281.dts      |   4 +
 .../boot/dts/amlogic/meson-gxl-s905w-tx3-mini.dts  |   4 +
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts     |   4 +
 .../dts/amlogic/meson-gxl-s905x-libretech-cc.dts   |   3 +-
 .../dts/amlogic/meson-gxl-s905x-nexbox-a95x.dts    |   3 +-
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi     |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |  45 +-
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts     |   3 +-
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts |   3 +-
 arch/arm64/boot/dts/amlogic/meson-gxm-vega-s96.dts |   4 +
 arch/arm64/boot/dts/amlogic/meson-gxm.dtsi         |   7 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi               |   4 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |   8 +
 drivers/phy/amlogic/Kconfig                        |  12 -
 drivers/phy/amlogic/Makefile                       |   1 -
 drivers/phy/amlogic/phy-meson-gxl-usb3.c           | 283 -------------
 drivers/usb/cdns3/cdns3-ti.c                       |   3 +-
 drivers/usb/cdns3/core.c                           |  47 +--
 drivers/usb/cdns3/core.h                           |   2 -
 drivers/usb/cdns3/drd.c                            |   4 +-
 drivers/usb/cdns3/ep0.c                            |   7 -
 drivers/usb/cdns3/gadget.c                         |  35 +-
 drivers/usb/dwc2/core.c                            |  23 +-
 drivers/usb/dwc2/core.h                            |   6 +-
 drivers/usb/dwc2/core_intr.c                       |   7 +-
 drivers/usb/dwc2/debug.h                           |   2 +-
 drivers/usb/dwc2/hcd.h                             |   2 +-
 drivers/usb/dwc2/hw.h                              |   3 +-
 drivers/usb/dwc2/params.c                          |  19 -
 drivers/usb/dwc2/platform.c                        |  39 ++
 drivers/usb/dwc3/core.c                            |  62 +--
 drivers/usb/dwc3/core.h                            |  83 ++--
 drivers/usb/dwc3/debug.h                           |   4 +-
 drivers/usb/dwc3/debugfs.c                         |  14 +-
 drivers/usb/dwc3/drd.c                             |   6 +-
 drivers/usb/dwc3/dwc3-keystone.c                   |  41 +-
 drivers/usb/dwc3/dwc3-meson-g12a.c                 | 420 ++++++++++++++----
 drivers/usb/dwc3/dwc3-of-simple.c                  |  30 +-
 drivers/usb/dwc3/gadget.c                          | 469 ++++++++++++++++-=
----
 drivers/usb/dwc3/gadget.h                          |   2 +-
 drivers/usb/dwc3/host.c                            |   2 +-
 drivers/usb/dwc3/io.h                              |   2 +-
 drivers/usb/dwc3/trace.h                           |   2 +-
 drivers/usb/gadget/composite.c                     |  78 +++-
 drivers/usb/gadget/configfs.c                      |  14 +-
 drivers/usb/gadget/function/f_acm.c                |  16 +
 drivers/usb/gadget/function/f_eem.c                |   2 -
 drivers/usb/gadget/function/f_fs.c                 |   2 +-
 drivers/usb/gadget/function/f_serial.c             |  16 +
 drivers/usb/gadget/function/f_tcm.c                |   3 +
 drivers/usb/gadget/function/f_uvc.h                |   2 +-
 drivers/usb/gadget/function/rndis.h                |   2 +-
 drivers/usb/gadget/function/u_audio.h              |   2 +-
 drivers/usb/gadget/function/u_ecm.h                |   2 +-
 drivers/usb/gadget/function/u_eem.h                |   2 +-
 drivers/usb/gadget/function/u_ether.h              |   2 +-
 drivers/usb/gadget/function/u_ether_configfs.h     |   2 +-
 drivers/usb/gadget/function/u_fs.h                 |   2 +-
 drivers/usb/gadget/function/u_gether.h             |   2 +-
 drivers/usb/gadget/function/u_hid.h                |   2 +-
 drivers/usb/gadget/function/u_midi.h               |   2 +-
 drivers/usb/gadget/function/u_ncm.h                |   2 +-
 drivers/usb/gadget/function/u_phonet.h             |   2 +-
 drivers/usb/gadget/function/u_printer.h            |   2 +-
 drivers/usb/gadget/function/u_rndis.h              |   2 +-
 drivers/usb/gadget/function/u_serial.c             |  57 ++-
 drivers/usb/gadget/function/u_serial.h             |   4 +-
 drivers/usb/gadget/function/u_tcm.h                |   2 +-
 drivers/usb/gadget/function/u_uac1.h               |   2 +-
 drivers/usb/gadget/function/u_uac1_legacy.h        |   2 +-
 drivers/usb/gadget/function/u_uac2.h               |   2 +-
 drivers/usb/gadget/function/u_uvc.h                |   2 +-
 drivers/usb/gadget/function/uvc.h                  |   4 +-
 drivers/usb/gadget/function/uvc_configfs.h         |   2 +-
 drivers/usb/gadget/function/uvc_v4l2.c             |   4 +-
 drivers/usb/gadget/function/uvc_v4l2.h             |   2 +-
 drivers/usb/gadget/function/uvc_video.c            |  76 +---
 drivers/usb/gadget/function/uvc_video.h            |   4 +-
 drivers/usb/gadget/legacy/mass_storage.c           |  14 +-
 drivers/usb/gadget/udc/aspeed-vhub/core.c          |  16 +-
 drivers/usb/gadget/udc/aspeed-vhub/hub.c           | 236 +++++++++--
 drivers/usb/gadget/udc/aspeed-vhub/vhub.h          |  12 +-
 drivers/usb/gadget/udc/atmel_usba_udc.c            | 112 +++--
 drivers/usb/gadget/udc/atmel_usba_udc.h            |  12 +
 drivers/usb/gadget/udc/core.c                      |   2 +
 drivers/usb/gadget/udc/dummy_hcd.c                 |  27 +-
 drivers/usb/gadget/udc/fsl_udc_core.c              |   4 +-
 drivers/usb/gadget/udc/gr_udc.c                    |   1 -
 drivers/usb/gadget/udc/lpc32xx_udc.c               |  11 +-
 drivers/usb/gadget/udc/m66592-udc.c                |   2 +-
 drivers/usb/gadget/udc/max3420_udc.c               |   2 +-
 drivers/usb/gadget/udc/mv_u3d_core.c               |   2 +-
 drivers/usb/gadget/udc/net2272.c                   |   2 +-
 drivers/usb/gadget/udc/omap_udc.c                  |   2 +-
 drivers/usb/gadget/udc/s3c2410_udc.c               |   4 -
 drivers/usb/gadget/udc/tegra-xudc.c                | 140 ++++++
 drivers/usb/gadget/udc/udc-xilinx.c                |   1 +
 drivers/usb/gadget/usbstring.c                     |  24 ++
 drivers/usb/mtu3/mtu3.h                            |   2 +-
 drivers/usb/mtu3/mtu3_debug.h                      |   2 +-
 drivers/usb/mtu3/mtu3_dr.h                         |   2 +-
 drivers/usb/mtu3/mtu3_hw_regs.h                    |   2 +-
 drivers/usb/mtu3/mtu3_qmu.h                        |   2 +-
 drivers/usb/mtu3/mtu3_trace.h                      |   2 +-
 drivers/usb/renesas_usbhs/common.h                 |   2 +-
 drivers/usb/renesas_usbhs/fifo.h                   |   2 +-
 drivers/usb/renesas_usbhs/mod.h                    |   2 +-
 drivers/usb/renesas_usbhs/pipe.h                   |   2 +-
 drivers/usb/renesas_usbhs/rcar2.h                  |   2 +-
 drivers/usb/renesas_usbhs/rcar3.h                  |   2 +-
 drivers/usb/renesas_usbhs/rza.h                    |   2 +-
 include/linux/usb/composite.h                      |   3 +
 include/linux/usb/gadget.h                         |   8 +
 135 files changed, 2142 insertions(+), 1775 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/phy/meson-gxl-usb3-ph=
y.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/keystone-usb.txt
 delete mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.txt
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,dwc3.yaml
 create mode 100644 Documentation/devicetree/bindings/usb/ti,keystone-dwc3.=
yaml
 delete mode 100644 drivers/phy/amlogic/phy-meson-gxl-usb3.c

=2D-=20
balbi

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEElLzh7wn96CXwjh2IzL64meEamQYFAl7Ll/cACgkQzL64meEa
mQbFSQ//YazM5i9zqxAzwopuUkxJfPhgWFF1RBNAtWMxjDukiU/ugT1H+0N8vNu0
nqXIZOb8ASOimgm94gC307TgG0y5f83RbS0848pHJuANJoZEYRFxddqgxVBarZeF
auB3VjNlPIff/MIegJkApstBhHwgJzM5p/pahfgk+oFp9ZtxiubLGUfBAA6VCT9T
YY88fB4CvDUYzBa8junfdQ/XKWciqZWAsBG5LlGOQjbZ/6yaWioPmq73TOlVweEV
rW9hqKyC/RohhdPZIv6HJZw+bBN2O5mdwRnj5mnGk/v7j22rLAHNFFLNYTzL1Vdx
FxZZGHbmJA+kkgFnKbkBePEb75rb5p3pMejNKualqFeP2H3hqjPpFjElzJeVosW6
GbVVIUJ16Sr+EIXl/jprHKDnaDcHXTcaI6Wd3V/s/fln16PCDBmTLdRMHGsSjMwH
g38c6TCQb9rk66xwW4rVCbv8qp/UDsQjL5LFg10sYYAqzy3bnK8npyqdhezUhpnB
AN9BepMEu+snVm4KxAwwNDqQKb7127UYTUHGwni9byVn2xaodVKiHhp/iSJ2pR1s
FDzOQKkNtuH4eWR2Gi8whkEJV2mgZsiaGms9wLgU4HyXsmNFPe6SpwlRnEEAVtpl
Pq9gnWUv2iMe6939lK+UGoWA3jr0xBtActy+8aaG+P29fguKtuo=
=rZ+Q
-----END PGP SIGNATURE-----
--=-=-=--
