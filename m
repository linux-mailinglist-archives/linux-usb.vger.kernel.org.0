Return-Path: <linux-usb+bounces-36646-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAmIGmQB8WnubgEAu9opvQ
	(envelope-from <linux-usb+bounces-36646-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:50:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0CE48AD81
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 20:50:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BFE0303BB2E
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 18:49:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D952147CC6C;
	Tue, 28 Apr 2026 18:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwsIj9q5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A624501D;
	Tue, 28 Apr 2026 18:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402190; cv=none; b=cvsYQIMtfjZvUBcQ3f7bp1DAkmQPJKHc5dEeQSsJo7giYEUZOOqXCCHabvxP3cQKVELw4WbQZazDd2Yk3g0WiCK8kz+flCGC9YvxlH/uXTVx6zJ3fsk2fpC2C/bjsrRmbhaU0XY2L9ATHxHq3FERN4sm85mDSMnn9psnKZOrPrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402190; c=relaxed/simple;
	bh=td8J+tGx5+HIccinESQ79TGfcNKXYIqh9Zh45MhdKWc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pL6zyogKl3wibQjGkUF1gycDd8N6OSBdH8Rj4lgn91UHW8GAJTwexgezol/pu24auzCRzmTFoY7P7uasNDeHpO5f1iILtHWInTZoZka+rgpS5EC5Y5rh8LGcGZ14u9mEqiAEaNEsBOzj/NpOB6N1sZrLhfX84UcE6OojKKL34Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwsIj9q5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9EFC2BCAF;
	Tue, 28 Apr 2026 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777402189;
	bh=td8J+tGx5+HIccinESQ79TGfcNKXYIqh9Zh45MhdKWc=;
	h=From:Subject:Date:To:Cc:From;
	b=VwsIj9q5PSDRceXBxZJLcYgiC8FR3xDwk71rDyieMncUe1KW1RUP3DObXn54EF9l8
	 c85YOB4dl21Ex1NoUv4/C1iXjJnXUmScpRISA3gsjBC+0rgBMTo0ElNWQ7tTrSP5gE
	 /X0bWbQD73NEkormtwTgzClNFdYp/AagV5UepsoZH38ZLhoyJhO+sOae8Vo2Vq+Ing
	 UD70uU8Ebd5LCizMJh8F1ZDEB+E0mJnNWjb+8A2QzfjdswionI2h1hzM1gBmx9ILdc
	 2tBNO1oZCwuUYFtamZaUcMEzjH8NDbLTZPWWZCoiaOOjgsvxw/ET6OzZ08KoZTWrZm
	 bLKs5apHwlf2A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v2 0/4] Prepwork for non-PCIe NHI/TBT hosts
Date: Tue, 28 Apr 2026 20:49:43 +0200
Message-Id: <20260428-topic-usb4_nonpcie_prepwork-v2-0-452fb9d63f77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBREr0K6tqStCK0r72EIgdLKj9JfW0AN4
 e5WTuBmkjeTvFlJNAFMJOdsJcEsEAFdAnHIiB5adzMU+sREMFGyI1N0Qg+azrErGofOazCND8a
 /MNypLKXktipVJy1JhjRYeO/2a514gDhh+OxnC/+1/3kXThntFeO9PFldqeKCMebPuX1oHMc8B
 am3bfsC/pA7Js0AAAA=
X-Change-ID: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777402187; l=3870;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=td8J+tGx5+HIccinESQ79TGfcNKXYIqh9Zh45MhdKWc=;
 b=S7t3SkjRX5itaJzUfxxQX5ee6/5xfDs4YU2pILIZ0KPAED3JanJ2dvAlDVeDxV04Vr7oivRef
 5JfEtsPiVNpA9z9jo4brF8A18SJNna91zdjyuuBMtzQqKRcLpRmgLOs
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: AC0CE48AD81
X-Rspamd-Action: no action
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
	TAGGED_FROM(0.00)[bounces-36646-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,qualcomm.com:email]

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

---
Konrad Dybcio (4):
      thunderbolt: Move pci_device out of tb_nhi
      thunderbolt: Separate out common NHI bits
      thunderbolt: Require nhi->ops be valid
      thunderbolt: Add some more descriptive probe error messages

 drivers/thunderbolt/Makefile    |   2 +-
 drivers/thunderbolt/acpi.c      |  14 +-
 drivers/thunderbolt/ctl.c       |  14 +-
 drivers/thunderbolt/domain.c    |   2 +-
 drivers/thunderbolt/eeprom.c    |   2 +-
 drivers/thunderbolt/icm.c       |  24 +-
 drivers/thunderbolt/nhi.c       | 513 +++++++---------------------------------
 drivers/thunderbolt/nhi.h       |  32 +++
 drivers/thunderbolt/nhi_ops.c   |  35 ++-
 drivers/thunderbolt/pci.c       | 507 +++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/pci.h       |  19 ++
 drivers/thunderbolt/switch.c    |  41 +---
 drivers/thunderbolt/tb.c        |  76 +-----
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   5 +-
 16 files changed, 724 insertions(+), 574 deletions(-)
---
base-commit: 936c21068d7ade00325e40d82bfd2f3f29d9f659
change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


