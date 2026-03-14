Return-Path: <linux-usb+bounces-34796-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oEy7L7BLtWmzywAAu9opvQ
	(envelope-from <linux-usb+bounces-34796-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 12:51:12 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B7328CECB
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 12:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 331B530305F7
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 11:51:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F0642609EE;
	Sat, 14 Mar 2026 11:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N7/e3HBe"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE60D246762;
	Sat, 14 Mar 2026 11:51:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773489065; cv=none; b=Nid43yekFPcZpM4M2s38kE3+GpzGWy5YaYxh5Kq3SFuHF9RwB17GqJ0WTbBGJeNwbBDQEQ6K481eQGR9ILq3dO/nFAXtBIlgnOW8swBGyt+A1uenSJz5iRVh/5RqrwkAjSkgV+yWrt5h3NPdg+tx6pMuBfVkudnqOr9p5MkhgpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773489065; c=relaxed/simple;
	bh=DmkshDHVxH2j16lHfio7B9xXktEADK/s+NEakcduPro=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kS466UsICQIZ4icz2o1zHtnmJM0aIz7HD34HAVxVR3SajqZG0eeD4AwCmwd8yfRLtt4MUGyK/Czt4zzvpV6df7oZT1xPSc/O+LT5xttJHBjbmeDcHsPUvzS3UyCc7m9oCh9j1HdBvCUhnrPMQVC1tPtC+fCC27g9Cukcx7L6gG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N7/e3HBe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB8AC116C6;
	Sat, 14 Mar 2026 11:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773489065;
	bh=DmkshDHVxH2j16lHfio7B9xXktEADK/s+NEakcduPro=;
	h=Date:From:To:Cc:Subject:From;
	b=N7/e3HBeNb2U0m0E4F7H+heu1uj31AsqjqEQ0sovLviFhEs6f7nFaFfUv5KjjoIyR
	 8c9MVpncdZ/6hpzx88zcFLVw+A7E+GmFOaYOB0hOHSkYfCKRt8KBwKp0pM4OfLAGMB
	 avaOx2M/3idV9sPSJ9YIa+ehvfCX1+ejzlx5EL5o=
Date: Sat, 14 Mar 2026 12:51:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.0-rc4
Message-ID: <abVLpuXaT8KcBt3J@kroah.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34796-lists,linux-usb=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,kroah.com:mid]
X-Rspamd-Queue-Id: 52B7328CECB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc4

for you to fetch changes up to d0d9b1f4f5391e6a00cee81d73ed2e8f98446d5f:

  USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed (2026-03-13 18:19:07 +0100)

----------------------------------------------------------------
USB fixes for 7.0-rc4

Here is a large chunk of USB driver fixes for 7.0-rc4.  Included in here
are:
  - usb gadget reverts due to reported issues, and then a follow-on fix
    to hopefully resolve the reported overall problem
  - xhci driver fixes
  - dwc3 driver fixes
  - usb core "killable" bulk message api addition to fix a usbtmc driver
    bug where userspace could hang the driver for forever
  - small USB driver fixes for reported issues
  - new usb device quirks

All except the last USB device quirk change have been in linux-next with
no reported issues.  That one came in too late, and is "obviously
correct" :)

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
A1RM4X (1):
      USB: add QUIRK_NO_BOS for video capture several devices

Alan Stern (3):
      USB: usbcore: Introduce usb_bulk_msg_killable()
      USB: usbtmc: Use usb_bulk_msg_killable() with user-specified timeouts
      USB: core: Limit the length of unkillable synchronous timeouts

Christoffer Sandberg (1):
      usb/core/quirks: Add Huawei ME906S-device to wakeup quirk

Dayu Jiang (1):
      usb: xhci: Prevent interrupt storm on host controller error (HCE)

Fan Wu (1):
      usb: renesas_usbhs: fix use-after-free in ISR during device removal

Gabor Juhos (1):
      usb: core: don't power off roothub PHYs if phy_set_mode() fails

Greg Kroah-Hartman (1):
      usb: misc: uss720: properly clean up reference in uss720_probe()

Heikki Krogerus (1):
      usb: dwc3: pci: add support for the Intel Nova Lake -H

Jiasheng Jiang (1):
      usb: gadget: f_tcm: Fix NULL pointer dereferences in nexus handling

Jie Deng (1):
      usb: core: new quirk to handle devices with zero configurations

John Keeping (1):
      usb: gadget: f_hid: fix SuperSpeed descriptors

Junzhong Pan (1):
      usb: gadget: uvc: fix interval_duration calculation

Kuen-Han Tsai (9):
      usb: legacy: ncm: Fix NPE in gncm_bind
      usb: gadget: f_ncm: Fix atomic context locking issue
      Revert "usb: gadget: f_ncm: Fix atomic context locking issue"
      Revert "usb: legacy: ncm: Fix NPE in gncm_bind"
      Revert "usb: gadget: f_ncm: align net_device lifecycle with bind/unbind"
      Revert "usb: gadget: u_ether: Add auto-cleanup helper for freeing net_device"
      Revert "usb: gadget: u_ether: use <linux/hex.h> header file"
      Revert "usb: gadget: u_ether: add gether_opts for config caching"
      usb: gadget: f_ncm: Fix net_device lifecycle with device_move

Marc Zyngier (1):
      usb: cdc-acm: Restore CAP_BRK functionnality to CH343

Mathias Nyman (1):
      xhci: Fix NULL pointer dereference when reading portli debugfs files

Oliver Neukum (3):
      usb: yurex: fix race in probe
      usb: mdc800: handle signal and read racing
      usb: class: cdc-wdm: fix reordering issue in read code path

RD Babiera (1):
      usb: typec: altmode/displayport: set displayport signaling rate in configure message

Seungjin Bae (1):
      usb: gadget: f_mass_storage: Fix potential integer overflow in check_command_size_in_blocks()

Vyacheslav Vahnenko (1):
      USB: ezcap401 needs USB_QUIRK_NO_BOS to function on 10gbs usb speed

Xu Yang (2):
      Revert "tcpm: allow looking for role_sw device in the main node"
      usb: roles: get usb role switch from parent only for usb-b-connector

Zilin Guan (1):
      usb: xhci: Fix memory leak in xhci_disable_slot()

Ziyi Guo (1):
      usb: image: mdc800: kill download URB on timeout

 Documentation/admin-guide/kernel-parameters.txt |   3 +
 drivers/usb/class/cdc-acm.c                     |   5 +
 drivers/usb/class/cdc-acm.h                     |   1 +
 drivers/usb/class/cdc-wdm.c                     |   4 +-
 drivers/usb/class/usbtmc.c                      |   6 +-
 drivers/usb/core/config.c                       |   6 +-
 drivers/usb/core/message.c                      | 100 ++++++++++---
 drivers/usb/core/phy.c                          |   8 +-
 drivers/usb/core/quirks.c                       |  21 +++
 drivers/usb/dwc3/dwc3-pci.c                     |   2 +
 drivers/usb/gadget/function/f_hid.c             |   4 +
 drivers/usb/gadget/function/f_mass_storage.c    |  12 +-
 drivers/usb/gadget/function/f_ncm.c             | 144 ++++++++++---------
 drivers/usb/gadget/function/f_tcm.c             |  14 ++
 drivers/usb/gadget/function/u_ether.c           |  67 +++------
 drivers/usb/gadget/function/u_ether.h           |  56 ++++----
 drivers/usb/gadget/function/u_ether_configfs.h  | 177 ------------------------
 drivers/usb/gadget/function/u_ncm.h             |   4 +-
 drivers/usb/gadget/function/uvc_video.c         |   2 +-
 drivers/usb/host/xhci-debugfs.c                 |  10 +-
 drivers/usb/host/xhci-ring.c                    |   1 +
 drivers/usb/host/xhci.c                         |   4 +-
 drivers/usb/image/mdc800.c                      |   6 +-
 drivers/usb/misc/uss720.c                       |   2 +-
 drivers/usb/misc/yurex.c                        |   2 +-
 drivers/usb/renesas_usbhs/common.c              |   9 ++
 drivers/usb/roles/class.c                       |   7 +-
 drivers/usb/typec/altmodes/displayport.c        |   7 +-
 drivers/usb/typec/tcpm/tcpm.c                   |   2 +-
 include/linux/usb.h                             |   8 +-
 include/linux/usb/quirks.h                      |   3 +
 31 files changed, 329 insertions(+), 368 deletions(-)

