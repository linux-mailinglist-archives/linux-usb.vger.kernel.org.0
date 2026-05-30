Return-Path: <linux-usb+bounces-38176-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iI16C23KGmqA8wgAu9opvQ
	(envelope-from <linux-usb+bounces-38176-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 13:30:53 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADBE060C7E0
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 13:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BFFAB303608B
	for <lists+linux-usb@lfdr.de>; Sat, 30 May 2026 11:30:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37847548EE;
	Sat, 30 May 2026 11:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="z63QA8x3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4492F26A0D5;
	Sat, 30 May 2026 11:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780140638; cv=none; b=N+CBdtAD6A+sWLCs76Fdfg/95P5xkr3rGL+Igt3bfbbp7n3LCHw+QzCDUGj9xULY3tPqtF1y4KHj/dM1Y5SU1sGeHDu7rKCpcuneGY+guv4YwxfulvECmNT7BKiN5oGssr0rfh5MUEBDeezEGaxhzvZOpIs5cPhZo7BnHVu3DCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780140638; c=relaxed/simple;
	bh=cS3vu4G9HCXs/4oQOJfTOXGjbAsqGn9mb2QOhkLG1a0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hme1MJZylRB1CKkPZ+jt4MWe1hdKPHywt040HVlM3Pk8tYZrID2fyGhDaL/+hu2x2D+q4D0gbMUK1SYcHBQ2UPmJRuPX/2Mjrz0/TTQt8K+p3Rm5vRqXo8tsLl6lzRwNJxa8DarXn620VB23WqPSJ3t1G4hJSbil+OpTd7o3vkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=z63QA8x3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D9A1F00893;
	Sat, 30 May 2026 11:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1780140636;
	bh=spUyBJAOLhAa1uP4u1Y57v5Dd+W+WYRNRfuAA+ayBP8=;
	h=Date:From:To:Cc:Subject;
	b=z63QA8x3XgaHYDbVXpo/mNtGv7bsgWpLaINBzobI8IdcCS5/Waw3YcNXKqj9Jc/gy
	 jpBWLCrGf3jnr5T3S8bKg81ay2iqrdZ61qfRcydTX+xoszcbG+pJyw/QxQ8Kj1zmtF
	 bxqUzIgOABt86xSybkFWKDoP6D+8zAtxelOEm0cA=
Date: Sat, 30 May 2026 13:29:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.1-rc6
Message-ID: <ahrKJXlzYYoQ7vzR@kroah.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38176-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kroah.com:mid,linuxfoundation.org:email,linuxfoundation.org:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ADBE060C7E0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.1-rc6

for you to fetch changes up to 645d4eda1d0db0202ed8e4a2c3abb2ebce6b86ef:

  Merge tag 'usb-serial-7.1-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-05-23 13:21:56 +0200)

----------------------------------------------------------------
USB and Thunderbolt fixes for 7.1-rc6

Here is a set of USB fixes and new device ids for 7.1-rc6.  Nothing
major in here, just lots of tiny fixes for reported issues found by
users and some older patches found by some scanning tools.  Included in
here are:
  - typec fixes found by fuzzers that have decided to finally look at
    that device interaction path (i.e. before a driver is bound to a
    device).
  - typec fixes for issues found by users
  - thunderbolt driver fixes for reported problems
  - cdns3 driver fixes
  - dwc3 driver fixes
  - new device quirks added
  - usb serial driver fixes for broken devices
  - other small driver fixes

All of these have been in linux-next for over a week with no reported
issues.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Dan Carpenter (2):
      usb: typec: tipd: Fix error code in tps6598x_probe()
      usb: dwc2: Fix use after free in debug code

Felix Gu (1):
      usb: typec: fusb302: Fix resource leak when devm_drm_dp_hpd_bridge_add() fails

Greg Kroah-Hartman (10):
      usb: typec: ucsi: ccg: reject firmware images without a ':' record header
      Merge tag 'thunderbolt-for-v7.1-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      usb: typec: wcove: don't write past struct pd_message in wcove_read_rx_buffer()
      usb: typec: altmodes/displayport: validate count before reading Status Update VDO
      usb: typec: tcpm/tcpci_maxim: validate header NDO against RX_BYTE_CNT
      usb: typec: tcpm: validate VDO count in Discover Identity ACK handlers
      usb: typec: tcpm: bound altmode_desc[] per iteration in svdm_consume_modes()
      usb: typec: ucsi: displayport: NAK DP_CMD_CONFIGURE without a payload VDO
      usb: typec: ucsi: validate connector number in ucsi_connector_change()
      Merge tag 'usb-serial-7.1-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Guangshuo Li (2):
      usb: gadget: f_hid: fix device reference leak in hidg_alloc()
      usb: gadget: net2280: Fix double free in probe error path

Hang Cao (1):
      dt-bindings: usb: Fix EIC7700 USB reset's issue

Heitor Alves de Siqueira (2):
      usb: usbtmc: check URB actual_length for interrupt-IN notifications
      usb: usbtmc: reject interrupt endpoints with small wMaxPacketSize

Jan Volckaert (1):
      USB: serial: option: add MeiG SRM813Q

Jeremy Erazo (1):
      usb: gadget: composite: fix integer underflow in WebUSB GET_URL handling

Johan Hovold (8):
      USB: serial: digi_acceleport: fix memory corruption with small endpoints
      USB: serial: keyspan: fix missing indat transfer sanity check
      USB: serial: mct_u232: fix memory corruption with small endpoint
      USB: serial: mct_u232: fix missing interrupt-in transfer sanity check
      USB: serial: cypress_m8: fix memory corruption with small endpoint
      USB: serial: mxuport: fix memory corruption with small endpoint
      USB: serial: omninet: fix memory corruption with small endpoint
      USB: serial: safe_serial: fix memory corruption with small endpoint

Kai Aizen (1):
      usb: gadget: uvc: hold opts->lock across XU walks in uvc_function_bind

Michael Bommarito (6):
      thunderbolt: property: Reject u32 wrap in tb_property_entry_valid()
      thunderbolt: property: Reject dir_len < 4 to prevent size_t underflow
      thunderbolt: property: Cap recursion depth in __tb_property_parse_dir()
      usbip: vudc: Fix use after free bug in vudc_remove due to race condition
      usb: gadget: f_fs: copy only received bytes on short ep0 read
      usb: gadget: f_fs: serialize DMABUF cancel against request completion

Michal Pecio (3):
      usb: core: Fix SuperSpeed root hub wMaxPacketSize
      usb: core: Fix up Interrupt IN endpoints with bogus wBytesPerInterval
      usb: core: Clean up SuperSpeed/eUSB2 descriptor validation logging

Myrrh Periwinkle (2):
      usb: typec: ucsi: Check if power role change actually happened before handling
      usb: typec: ucsi: Don't update power_supply on power role change if not connected

Peter Chen (2):
      usb: cdns3: plat: fix leaked usb2_phy initialization on usb3_phy acquisition failure
      usb: cdns3: plat: fix unbalanced pm_runtime_forbid() call permanently leaks the runtime PM usage counter across bind/unbind cycles

Radhey Shyam Pandey (1):
      usb: dwc3: xilinx: fix error handling in zynqmp init error paths

Rob Herring (Arm) (1):
      dt-bindings: usb: ti,omap4-musb: Drop duplicate 'usb-phy' property constraints

Sam Burkels (1):
      usb: storage: Add quirks for PNY Elite Portable SSD

Sebastian Reichel (1):
      usb: typec: tcpm: improve handling of DISCOVER_MODES failures

Seungjin Bae (1):
      usb: gadget: dummy_hcd: Reject hub port requests for non-existent ports

Stephen J. Fuhry (1):
      USB: quirks: add NO_LPM for Lenovo ThinkPad USB-C Dock Gen2 hub controllers

Wanquan Zhong (1):
      USB: serial: option: add missing RSVD(5) flag for Rolling RW135R-GL

Wei-Cheng Chen (1):
      xhci: tegra: Fix ghost USB device on dual-role port unplug

Wentao Guan (1):
      USB: cdc-acm: Fix bit overlap and move quirk definitions to header

Wentao Liang (1):
      usb: musb: omap2430: Fix use-after-free in omap2430_probe()

Xu Yang (1):
      usb: chipidea: core: convert ci_role_switch to local variable

Yongchao Wu (1):
      usb: cdns3: gadget: fix request skipping after clearing halt

Zhang Cen (2):
      USB: serial: belkin_sa: validate interrupt status length
      USB: serial: cypress_m8: validate interrupt packet headers

 .../devicetree/bindings/usb/eswin,eic7700-usb.yaml |   7 +-
 .../devicetree/bindings/usb/ti,omap4-musb.yaml     |   7 +-
 drivers/thunderbolt/property.c                     |  32 ++++--
 drivers/usb/cdns3/cdns3-gadget.c                   |  12 ++-
 drivers/usb/cdns3/cdns3-plat.c                     |  11 +-
 drivers/usb/chipidea/core.c                        |  16 ++-
 drivers/usb/class/cdc-acm.c                        |   2 -
 drivers/usb/class/cdc-acm.h                        |   2 +
 drivers/usb/class/usbtmc.c                         |  14 +++
 drivers/usb/core/config.c                          |  46 ++++----
 drivers/usb/core/hcd.c                             |   4 +-
 drivers/usb/core/quirks.c                          |   4 +
 drivers/usb/dwc2/hcd.c                             |   4 +-
 drivers/usb/dwc3/dwc3-xilinx.c                     |  27 ++---
 drivers/usb/gadget/composite.c                     |   5 +-
 drivers/usb/gadget/function/f_fs.c                 |  26 ++++-
 drivers/usb/gadget/function/f_hid.c                |   3 +-
 drivers/usb/gadget/function/f_uvc.c                |  28 +++--
 drivers/usb/gadget/udc/dummy_hcd.c                 |   4 +
 drivers/usb/gadget/udc/net2280.c                   |   4 +-
 drivers/usb/host/xhci-tegra.c                      |  71 +++++++------
 drivers/usb/musb/omap2430.c                        |   3 +-
 drivers/usb/serial/belkin_sa.c                     |   3 +
 drivers/usb/serial/cypress_m8.c                    |  20 +++-
 drivers/usb/serial/digi_acceleport.c               |  23 +++-
 drivers/usb/serial/keyspan.c                       |   4 +
 drivers/usb/serial/mct_u232.c                      |  26 +++--
 drivers/usb/serial/mxuport.c                       |   8 ++
 drivers/usb/serial/omninet.c                       |   9 +-
 drivers/usb/serial/option.c                        |   9 +-
 drivers/usb/serial/safe_serial.c                   |  11 ++
 drivers/usb/storage/unusual_uas.h                  |   7 ++
 drivers/usb/typec/altmodes/displayport.c           |   2 +
 drivers/usb/typec/tcpm/fusb302.c                   |  20 ++--
 drivers/usb/typec/tcpm/tcpci_maxim_core.c          |   9 ++
 drivers/usb/typec/tcpm/tcpm.c                      | 117 +++++++++++++--------
 drivers/usb/typec/tcpm/wcove.c                     |  13 ++-
 drivers/usb/typec/tipd/core.c                      |   1 +
 drivers/usb/typec/ucsi/displayport.c               |   4 +
 drivers/usb/typec/ucsi/ucsi.c                      |  24 ++++-
 drivers/usb/typec/ucsi/ucsi_ccg.c                  |   5 +
 drivers/usb/usbip/vudc_dev.c                       |   1 +
 drivers/usb/usbip/vudc_transfer.c                  |   3 +-
 43 files changed, 445 insertions(+), 206 deletions(-)

