Return-Path: <linux-usb+bounces-35992-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id jAgWJNgd0mk+TgcAu9opvQ
	(envelope-from <linux-usb+bounces-35992-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 10:31:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CBD39DD9F
	for <lists+linux-usb@lfdr.de>; Sun, 05 Apr 2026 10:31:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D8C03009B0A
	for <lists+linux-usb@lfdr.de>; Sun,  5 Apr 2026 08:31:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40D2A36B05E;
	Sun,  5 Apr 2026 08:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RMJuwRQr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C501534104E;
	Sun,  5 Apr 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775377872; cv=none; b=b78sjYQfpeOywfFSrkeF1tVkqBplNYgmpNKBeW06LslOtE6GZuxeL1mCFTANcxDPJU6Jie+lCFOIe1zmukFxyzQTdbTlwfklFJnnzFaJqWbZL+dZjNF5c+IhSf7GIVOkDYwjdJNx9fxBkkSj5soafd7BcwRZ/87445RIJLj+l4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775377872; c=relaxed/simple;
	bh=WaHCErWCHdCnNPXwpSPgNoUYszNN6CLPExbnu7Z57jo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GvcuBr1pvQ8jnY3Wyz+ZKdv+Se5XeqdEL5L03zaJccoJbbA/anEhA1VCX3b+Vp1SAUXv1TTdiIHyjj5yqYhtuH70gbHF9czy1fhkkxvU1VlyIrmPDU0cbZsr4dOzR+tfNoOZX6PhPyOfKAYsuo2C89KOTuMuhTawl/5q+No2B5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RMJuwRQr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 016ACC116C6;
	Sun,  5 Apr 2026 08:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1775377872;
	bh=WaHCErWCHdCnNPXwpSPgNoUYszNN6CLPExbnu7Z57jo=;
	h=Date:From:To:Cc:Subject:From;
	b=RMJuwRQrvt3oBxV5vL25SzwklJ4d2DXP0v4gNNy9uDNQcIiLw26erKGQF8WfBBcoD
	 Stx/5wDT9N6P9jLpg8Jzo3qKV49SnPGPu8aHC5i7A25BjlCY/t9LdWmyVb3OFmCZ7N
	 e1ZHaE1On8fBVH1/6K3BlLpY3IhZS/1syePk8RXc=
Date: Sun, 5 Apr 2026 10:31:09 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [GIT PULL] USB driver fixes for 7.0-rc7
Message-ID: <adIdzbVtDh2g5Ofo@kroah.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35992-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: F1CBD39DD9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git tags/usb-7.0-rc7

for you to fetch changes up to bf3781a35c27978341c31f59f1460dcaabf2e726:

  Merge tag 'usb-serial-7.0-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus (2026-04-02 13:28:22 +0200)

----------------------------------------------------------------
USB/Thunderbolt fixes for 7.0-rc7

Here are a bunch of USB and Thunderbolt fixes (most all are USB) for
7.0-rc7.  More than I normally like this late in the release cycle,
partly due to my recent travels, and partly due to people banging away
on the USB gadget interfaces and apis more than normal (big shoutout to
Android for getting the vendors to actually work upstream on this,
that's a huge win overall for everyone here.)

Included in here are:
  - Small thunderbolt fix
  - new USB serial driver ids added
  - typec driver fixes
  - gadget driver fixes for some disconnect issues
  - other usb gadget driver fixes for reported problems with binding and
    unbinding devices as happens when a gadget device connects /
    disconnects from a system it is plugged into (or it switches device
    mode at a user's request, these things are complex little beasts...)
  - usb offload fixes (where USB audio tunnels through the controller
    while the main CPU is asleep) for when EMP spikes hit the system
    causing disconnects to happen (as often happens with static
    electricity in the winter months).  This has been much reported by
    at least one vendor, and resolves the issues they have been seeing
    with this codepath.  Can't wait for the "formal methods are the
    answer!" people to try to model that one properly...
  - Other small usb driver fixes for issues reported.

All of these have been in linux-next this week, and before, with no
reported issues, and I've personally been stressing these harder than
normal on my systems here with no problems.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

----------------------------------------------------------------
Alan Stern (2):
      USB: dummy-hcd: Fix locking/synchronization error
      USB: dummy-hcd: Fix interrupt synchronization error

Andrei Kuchynski (2):
      usb: typec: Remove alt->adev.dev.class assignment
      usb: typec: thunderbolt: Set enter_vdo during initialization

Ernestas Kulik (1):
      USB: serial: option: add MeiG Smart SRM825WN

Felix Gu (2):
      dwc3: google: Fix PM domain leak in dwc3_google_probe()
      usb: misc: usbio: Fix URB memory leak on submit failure

Frej Drejhammar (1):
      USB: serial: io_edgeport: add support for Blackbox IC135A

Gabor Juhos (1):
      usb: core: phy: avoid double use of 'usb3-phy'

Greg Kroah-Hartman (2):
      Merge tag 'thunderbolt-for-v7.0-rc5' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt into usb-linus
      Merge tag 'usb-serial-7.0-rc7' of ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial into usb-linus

Guan-Yu Lin (2):
      usb: core: use dedicated spinlock for offload state
      usb: host: xhci-sideband: delegate offload_usage tracking to class drivers

Guangshuo Li (1):
      usb: ulpi: fix double free in ulpi_register_interface() error path

Heitor Alves de Siqueira (1):
      usb: usbtmc: Flush anchored URBs in usbtmc_release

JP Hein (1):
      USB: core: add NO_LPM quirk for Razer Kiyo Pro webcam

Jimmy Hu (1):
      usb: gadget: uvc: fix NULL pointer dereference during unbind race

Juno Choi (1):
      usb: dwc2: gadget: Fix spin_lock/unlock mismatch in dwc2_hsotg_udc_stop()

Justin Chen (1):
      usb: ehci-brcm: fix sleep during atomic

Konrad Dybcio (1):
      thunderbolt: Fix property read in nhi_wake_supported()

Kuen-Han Tsai (9):
      usb: gadget: u_ether: Fix race between gether_disconnect and eth_stop
      usb: gadget: u_ether: Fix NULL pointer deref in eth_get_drvinfo
      usb: gadget: f_subset: Fix unbalanced refcnt in geth_free
      usb: gadget: f_rndis: Protect RNDIS options with mutex
      usb: gadget: u_ncm: Add kernel-doc comments for struct f_ncm_opts
      usb: gadget: f_ecm: Fix net_device lifecycle with device_move
      usb: gadget: f_eem: Fix net_device lifecycle with device_move
      usb: gadget: f_subset: Fix net_device lifecycle with device_move
      usb: gadget: f_rndis: Fix net_device lifecycle with device_move

Miao Li (1):
      usb: quirks: add DELAY_INIT quirk for another Silicon Motion flash drive

Michael Zimmermann (1):
      usb: gadget: f_hid: move list and spinlock inits from bind to alloc

Nathan Rebello (1):
      usb: typec: ucsi: validate connector number in ucsi_notify_common()

Oliver Neukum (1):
      cdc-acm: new quirk for EPSON HMD

Sebastian Urban (1):
      usb: gadget: dummy_hcd: fix premature URB completion when ZLP follows partial transfer

Taegu Ha (1):
      usb: gadget: f_uac1_legacy: validate control request size

Wanquan Zhong (1):
      USB: serial: option: add support for Rolling Wireless RW135R-GL

Xiaolei Wang (1):
      usb: dwc3: imx8mp: fix memory leak on probe failure path

Xu Yang (2):
      usb: hcd: queue wakeup_work to system_freezable_wq workqueue
      dt-bindings: connector: add pd-disable dependency

Yongchao Wu (2):
      usb: cdns3: gadget: fix NULL pointer dereference in ep_queue
      usb: cdns3: gadget: fix state inconsistency on gadget init failure

 .../bindings/connector/usb-connector.yaml          |   1 +
 drivers/thunderbolt/nhi.c                          |   2 +-
 drivers/usb/cdns3/cdns3-gadget.c                   |   4 +
 drivers/usb/class/cdc-acm.c                        |   9 ++
 drivers/usb/class/cdc-acm.h                        |   1 +
 drivers/usb/class/usbtmc.c                         |   3 +
 drivers/usb/common/ulpi.c                          |   5 +-
 drivers/usb/core/driver.c                          |  23 +++--
 drivers/usb/core/hcd.c                             |   2 +-
 drivers/usb/core/offload.c                         | 102 ++++++++++++---------
 drivers/usb/core/phy.c                             |  12 ++-
 drivers/usb/core/quirks.c                          |   3 +
 drivers/usb/core/usb.c                             |   1 +
 drivers/usb/dwc2/gadget.c                          |   2 +
 drivers/usb/dwc3/dwc3-google.c                     |   5 +-
 drivers/usb/dwc3/dwc3-imx8mp.c                     |   2 +-
 drivers/usb/gadget/function/f_ecm.c                |  35 ++++---
 drivers/usb/gadget/function/f_eem.c                |  59 ++++++------
 drivers/usb/gadget/function/f_hid.c                |  19 ++--
 drivers/usb/gadget/function/f_rndis.c              |  49 ++++++----
 drivers/usb/gadget/function/f_subset.c             |  63 +++++++------
 drivers/usb/gadget/function/f_uac1_legacy.c        |  47 ++++++++--
 drivers/usb/gadget/function/f_uvc.c                |  39 +++++++-
 drivers/usb/gadget/function/u_ecm.h                |  21 +++--
 drivers/usb/gadget/function/u_eem.h                |  21 +++--
 drivers/usb/gadget/function/u_ether.c              |  16 ++--
 drivers/usb/gadget/function/u_gether.h             |  22 +++--
 drivers/usb/gadget/function/u_ncm.h                |  21 +++--
 drivers/usb/gadget/function/u_rndis.h              |  31 +++++--
 drivers/usb/gadget/function/uvc.h                  |   3 +
 drivers/usb/gadget/function/uvc_v4l2.c             |   5 +-
 drivers/usb/gadget/udc/dummy_hcd.c                 |  42 +++++----
 drivers/usb/host/ehci-brcm.c                       |   4 +-
 drivers/usb/host/xhci-sideband.c                   |  18 +---
 drivers/usb/misc/usbio.c                           |   7 +-
 drivers/usb/serial/io_edgeport.c                   |   3 +
 drivers/usb/serial/io_usbvend.h                    |   1 +
 drivers/usb/serial/option.c                        |   4 +
 drivers/usb/typec/altmodes/thunderbolt.c           |  44 ++++-----
 drivers/usb/typec/class.c                          |   4 -
 drivers/usb/typec/ucsi/ucsi.c                      |   9 +-
 include/linux/usb.h                                |  10 +-
 sound/usb/qcom/qc_audio_offload.c                  |  10 +-
 43 files changed, 507 insertions(+), 277 deletions(-)

