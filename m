Return-Path: <linux-usb+bounces-37509-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJNFGMEXB2qQrgIAu9opvQ
	(envelope-from <linux-usb+bounces-37509-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:55:29 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70D54FFCF
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 14:55:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A7782300AC28
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 12:39:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC7F47A0DB;
	Fri, 15 May 2026 12:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL+uLEeX"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B48144B66A;
	Fri, 15 May 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778848738; cv=none; b=LBHKW013bBpvM3MhaUlU5dcDVPAYyJvN+k933MLSOp0KXRNcfJq74pHyFmuYKthd6ern7mHDMDNBB2dG/EUcnkX/AWfdyENl8kDhzQ83Vlg8uwNPMnRzTwfmGFe8Yb77bIQLfvT2b2wbRjaLUHz83D0yIsRt42YsvPHl7V0bev0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778848738; c=relaxed/simple;
	bh=oVG07TLRLmk+o2XR2gujNvsrBV7SA7kpwp7pPq+c+QE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=o7hHtnK8bL0wbkRCzbrIvhgi6QOoK5MRUNzsWjzHJA44+ZtJsGp2BqJcfifiu2eEF5dU1OLGJLJbi5S+a5JyPY4g7dlz3DwsW9BEPWTwHLwBQi2cXxzTVegsX3zIAXZZqklvK9Tj99pNgKmx0M/Fr26/XFuS/SsEGX2OCcr+XeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL+uLEeX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D41C2BCB0;
	Fri, 15 May 2026 12:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778848737;
	bh=oVG07TLRLmk+o2XR2gujNvsrBV7SA7kpwp7pPq+c+QE=;
	h=From:Subject:Date:To:Cc:From;
	b=fL+uLEeXyH/pjB92UTa/ZzmcRYaw9Ne8QQGfwg0luzasbTN01iXxmZYW5J/mRJkYE
	 2LLjCGp3n/sJTwH7vgTK3OfIyOHBwDSCviZSca+U2CHmgSEYVqL9HiFC5IYNkjBAQi
	 u8e4Y1lbyEfhyR6t3Ca/S8xjTC4CMjptYmxX6AEY3kKIvXVPSvk4Bay7d+7xJ4rXwz
	 fY+XwIm+FHsGx2ikkHtDUW7VZkRY8tx4vLgvNnjbVxSBREUkN23OhkMSlZdaXX2AJj
	 4yS0um9tE3lPiaOra6Vw6hv4PFk8d5NV/HisefdnhpWAUEnAjuF/eb/57GBt79Q4s4
	 KNMYrvp6r71ag==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v4 0/4] Prepwork for non-PCIe NHI/TBT hosts
Date: Fri, 15 May 2026 14:38:40 +0200
Message-Id: <20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NSw7CIBCA4asY1mJ4lYcr72GMKRSUaAtCrRrTu
 0u7caPGzST/TPLNE2SbvM1gvXiCZAeffehKsOUCmGPdHSz0TWlAEOGIIgX7EL2B16zZvgtdNN7
 uY7LxFtIJSi4ldoIrLR0oQjk4f5/17a700ec+pMf8bMDT9j93wBDBRiHcyMoZodgm5Ly6XOuzC
 W27KgNM/EDeJCPyN0kKySritGo4dUJ8IembrDD9TdJCail0ZRmStflEjuP4AvuJC1tzAQAA
X-Change-ID: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778848734; l=4750;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=oVG07TLRLmk+o2XR2gujNvsrBV7SA7kpwp7pPq+c+QE=;
 b=bUG/CURKmKtueYAvStE7s6Jt/x7pb1ghxKfMOZwdY/aGrzzustZmSnM4XtgXjAFppgG6rFLS/
 JCDKU8sZbgVCGhGSD57Q5kyLLW8rPp/Xr2qqXiqL1Wl15D+1mdGdlmb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: CB70D54FFCF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37509-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Currently, the NHI driver (and other parts of the TBT framework) make
multiple assumptions about the host router being a PCIe device. This
series tries to decouple them by moving the 'struct pci_device' out of
the NHI code and introduce NHI-on-PCIe-specific abstractions where
necessary (with no functional change).

The intended usage of the new nhi_probe_common() is pretty similar to
other bus frameworks (I2C, SPI, USB..), i.e.:

static int foo_bar_probe() {
        // get SoC-specifc resources (clks, regulators..)

        // power things on

        // set some implementation-specific registers

        // register NHI and all the sub-devices
        ret = nhi_probe(&my_usb4->nhi)
        ...

        // cleanup boilerplate
}

Instead of the previously-suggested aux/fauxbus, the NHI device remains
the same 'struct dev' as the PCIe/platform/[...] device that provides
it. This is in line with some other buses and it makes things easier
from the PM perspective.

Tested on:
* Qualcomm X1E80100 CRD (OOT driver)
 * USB4 (Qualcomm controller)
 * Connected to a TBT3 ASUS ProArt 27 monitor
 * Parade PS8830 on-board retimer

Domain 0 Route 0: 0000:0000
Domain 0 Route 2: 0031:9000 ASUS-Display PA27AC

* Intel Coffee Lake NUC (NUC8i3BEK)
 * TBT3 (Alpine Ridge 2C 2016 controller)
 * Connected to a Dell TB16 dock (TBT active cable)
 * S3 + S2idle sleep

Domain 0 Route 0: 8086:6357 Intel Corporation NUC8BEB
Domain 0 Route 1: 00d4:b051 Dell Dell Thunderbolt Cable
Domain 0 Route 301: 00d4:b054 Dell Dell Thunderbolt Dock

* AMD Ryzen 7 PRO 7840U-based Lenovo ThinkPad T14s Gen 4
 * USB4 ("Pink Sardine" controller)
 * Connected to a Lenovo ThinkPad Thunderbolt 3 Dock
 * Parade PS8830 on-board retimer
 * Only S2idle is present on this platform

Domain 0 Route 0: 0000:0000
Domain 1 Route 0: 0000:0000
Domain 1 Route 2: 0108:1630 Lenovo ThinkPad Thunderbolt 3 Dock

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Changes in v4:
- Fold in Icelake support to pci.c to avoid exporting nhi_pci_xx()
  functions and nhi_pci_ops
- I only compile-tested this revision, since it's a purely mechanical
  moving-around of code
- Link to v3: https://patch.msgid.link/20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com

Changes in v3:
- Add missing/update affected kerneldoc
- Apply naming change suggestions
- Back out of moving tb_apple_add_links()
- Drop error log from nhi_pci_probe() calling nhi_probe()
- Unbreak some lines, touch up some change-adjacent whitespace
- Rebase on next-20260508
- Link to v2: https://lore.kernel.org/r/20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com

Changes in v2:
- Make 'struct tb_nhi_pci' private, strip it of the 'struct pci_dev
  field since it can be accessed via to_pci_dev(tb_nhi_pci->nhi.dev)
- Thin out patch 1, move some of its prior contents to patch 2
- Rename nhi_pci.[ch] to pci.[ch]
- Rename nhi_probe_common() to nhi_probe()
- Squash a number of bugs discovered at runtime on x86
- Add a patch to make ops necessary to drop boilerplate checks
- Reword the error messages introduced in the last patch
- Drop RFC/RFT tags
- Link to v1: https://lore.kernel.org/r/20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com

To: Andreas Noever <andreas.noever@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
To: Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Konrad Dybcio (4):
      thunderbolt: Move pci_device out of tb_nhi
      thunderbolt: Separate out common NHI bits
      thunderbolt: Require nhi->ops be valid
      thunderbolt: Add some more descriptive probe error messages

 drivers/thunderbolt/Makefile    |   2 +-
 drivers/thunderbolt/acpi.c      |  14 +-
 drivers/thunderbolt/ctl.c       |  16 +-
 drivers/thunderbolt/domain.c    |   2 +-
 drivers/thunderbolt/eeprom.c    |   2 +-
 drivers/thunderbolt/icm.c       |  24 +-
 drivers/thunderbolt/nhi.c       | 525 ++++++---------------------------
 drivers/thunderbolt/nhi.h       |  33 ++-
 drivers/thunderbolt/nhi_ops.c   | 185 ------------
 drivers/thunderbolt/pci.c       | 622 ++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c    |  41 +--
 drivers/thunderbolt/tb.c        |  18 +-
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   8 +-
 15 files changed, 807 insertions(+), 697 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


