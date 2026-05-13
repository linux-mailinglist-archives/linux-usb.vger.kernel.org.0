Return-Path: <linux-usb+bounces-37404-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IzkLTatBGoSNAIAu9opvQ
	(envelope-from <linux-usb+bounces-37404-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:56:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0186D537860
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 18:56:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32EFE329FC6A
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 16:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C6B147B436;
	Wed, 13 May 2026 16:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRWirSsl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB18E4BC002;
	Wed, 13 May 2026 16:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778689425; cv=none; b=KerrWHV/6Ye+PSGVGmPB5GoVl8Zn0Mkqb0yJZBgXtR4XIch4CNuQKw1AJVIVU2onRgrP2PdV8j6mT0QGzKCbkdNMy/RdqUsy08f5iIfXNjlgBd5FEBHnHrjiHI3AUD7ZIw3ds8R0Xzu0bueqElBX25htPW1ovp0pM0D36uj0hSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778689425; c=relaxed/simple;
	bh=90yLqcKD/XqPsKXRZXoj3SWGgR+1X6A35CfsQ4oj2zs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NDGNXXA5Z2Vf7e5nVHeSRlgl4nughRqOTI6jPtMhE2VjHIChMwy21W6iS9LNBwN2fTCBaVPXbP7nvOeS8FqPHxWLutKrviYMycngnwzdD/cTRTmyWApzDPdLCayuwfenmy4b42n4EqoFGWjQPkNbT/+UnqLz67b/n0wTqK5Uubw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRWirSsl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D7EC19425;
	Wed, 13 May 2026 16:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778689425;
	bh=90yLqcKD/XqPsKXRZXoj3SWGgR+1X6A35CfsQ4oj2zs=;
	h=From:Subject:Date:To:Cc:From;
	b=hRWirSslMbFqyx2B88lSI/zYVzP7AgZVvbZ+pgMJVrsD3/Cu0H728dyp/29A1hjkA
	 2iMzHI8EOgSUFgiqlQLHi75I0CpGMgSqOcnIXktfBdkedBvQKWl0ATYKzGx6JWFVA+
	 jpUiKAknezZfsI2uCe2VO7LPFXc8JbfkhdFFMf5mSLTmzm4vQzbI/tI13En5y7lluU
	 R1UDsZEvPgbc6s80nsYu+i3mGY5BMknhKZWUTOevyiZ7nOJcpE6QZJNs87EXKoyqKW
	 hS/1No5X6SetuBe9X/8HRb/WTd8TxeYjBurcL9F1GmfoFPeXgYKqrpmYeJ5sZ8Mdui
	 22FtBFNSWXF5A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v3 0/4] Prepwork for non-PCIe NHI/TBT hosts
Date: Wed, 13 May 2026 18:23:31 +0200
Message-Id: <20260513-topic-usb4_nonpcie_prepwork-v3-0-b87b5e408ac7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43N3Q6CIBTA8VdpXIdDRIWueo/WnPKRrAQCpZrz3
 UNvummtm7P9z9l+ZwZBei0DOOxm4GXUQVuTotjvAO9bc5FQi9QAI1yhAjE4Wqc5nEJHGmON41o
 2zkv3sP4KaUVpruqKdVSBJKSD0s9NP51T9zqM1r+2ZzFft/+5MYcICoZyQUvFa0aONoTsPrU3b
 ochSwOsfMQfkmD6m8SJJCVWHRNVoer6C7ksyxsAgL4hIAEAAA==
X-Change-ID: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778689422; l=4462;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=90yLqcKD/XqPsKXRZXoj3SWGgR+1X6A35CfsQ4oj2zs=;
 b=h+0TSSIzLJqg6eEQ7oVi0YfNRUmjC+ZfX5XTcOnCZ6sizGVYueeCDWmKe+9So2D25CLHSToks
 zLOsjxmuavrDywbWWgIIOZxv52OsULaHbIMdEigJ96GKDtXVkgU6CpF
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 0186D537860
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37404-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
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
 drivers/thunderbolt/nhi.c       | 525 +++++++---------------------------------
 drivers/thunderbolt/nhi.h       |  31 +++
 drivers/thunderbolt/nhi_ops.c   |  35 ++-
 drivers/thunderbolt/pci.c       | 439 +++++++++++++++++++++++++++++++++
 drivers/thunderbolt/pci.h       |  19 ++
 drivers/thunderbolt/switch.c    |  41 +---
 drivers/thunderbolt/tb.c        |  18 +-
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   8 +-
 16 files changed, 667 insertions(+), 521 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


