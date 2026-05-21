Return-Path: <linux-usb+bounces-37867-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADmTGjDhDmqKCwYAu9opvQ
	(envelope-from <linux-usb+bounces-37867-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:40:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C09055A376F
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 12:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5A8E63046DEA
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FC63A5429;
	Thu, 21 May 2026 10:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICpAD/K1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C08385D6A;
	Thu, 21 May 2026 10:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779360008; cv=none; b=OPqEQstt3qC5GwWjfnrwZLIgTQBkXeLYRH7+3FO5F1jGa5M8mDPlpjsLkjbeHx8iyW966NwmCaFf0rYbVvoud0CiRCbkAvH1bnJxAjSREK25iPY/fzJtXWru3P9XqC7a2AcSHPAscgoiQMQkAXnbD8gdLYVykTPexMoS1bTfo9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779360008; c=relaxed/simple;
	bh=8LfbtKGWRBChcSbvGQFQdqchAIHTB1f3HTunAm2IgHs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=rmyM0+hqH1ZWNk2jnq6B5QOqHDxfjPpxseyQSgU5jeGWhtDkSTxIQFlehN6LWZ+IE+XoyBLiuH9/hQti20j78Aa3cp8lDj/GSofCKfdIYD2EOzj57S1Evp9vFY+IsEZFli3fO40rtqCz2wqiDmkqMM6NBH2k9U008MRRlFNTH8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICpAD/K1; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA1D1F000E9;
	Thu, 21 May 2026 10:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779360006;
	bh=81HJEY7YnDxCKfBTu/iPddG+V5kZR4kRHF3w/pF/l/g=;
	h=From:Subject:Date:To:Cc;
	b=ICpAD/K1HSKejTzsCaPuu4EbQjQ3NIq1wTSZp1dG/mwyhq42VDMLTWmlkaQ2Wj2kc
	 0MwVTYGzEoDBJHSgohb0u8CZuaT3bZbaq4UpRTlnhPaTN7ujyJR4GddiqNIBNjpqsI
	 s17Klcn8hVH0EHq4eXwRZuGxkm0DA1d0ypGmu+KA6cj2TsJksS5n53+1v18JinxFWw
	 KB7yjQvb9mLXpr43Td7EpHmJqVCeCZIa2NDx+jKRrdFGg3KpCOdV5aw5d9OgjNuFh+
	 vXMBzrln11sRCLS7DJQcQ5X/vkXqd6JpJfKR5N/gp/0w+L3Ds7DB2wJYr+1uWYYmjh
	 cCGhu6yl6WP2A==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [PATCH v5 0/4] Prepwork for non-PCIe NHI/TBT hosts
Date: Thu, 21 May 2026 12:39:59 +0200
Message-Id: <20260521-topic-usb4_nonpcie_prepwork-v5-0-b67dbe7508e8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NS27CMBCA4asgrzHyMx6z4h4VQrFjF6sQpzYEE
 MrdO7ChixJ1M9I/I31zJzWUFCpZL+6khDHVlHsMvVwQv2/7z0BTh00EEw2TzNJTHpKn5+rUrs/
 94FPYDSUMl1y+KDQAPJrGOogEBTzEdH3qH1vsfaqnXG7PZyN/bP/njpwy2lnGO9DRG6s2udbV9
 7k9+Hw8rnCQBz+KF6kEzJMCSaVFdLZrZDTmDSlfpOZynpRIOjBOB8Wg9e9I9ZvU86RCUnvgIA0
 IJcMf5DRNP3ZK2vfGAQAA
X-Change-ID: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779360003; l=4939;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=8LfbtKGWRBChcSbvGQFQdqchAIHTB1f3HTunAm2IgHs=;
 b=40bHtw2x3PR+s8hpma6AqjFV/7mEMNbroB/6kQo7DWgMv0QiJ7F4r/RigRjnTqGcAwZ/cpZJM
 o93p2UqbQI1C0eSE/5mdUsu/SlH+aZ5yn8Jn6L813himffyb4aNdiV6
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37867-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,msgid.link:url]
X-Rspamd-Queue-Id: C09055A376F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
Changes in v5:
- Rebase atop thunderbolt.git/next and re-test on the NUC
- Link to v4: https://patch.msgid.link/20260515-topic-usb4_nonpcie_prepwork-v4-0-5c818378243e@oss.qualcomm.com

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
 drivers/thunderbolt/nhi.c       | 520 ++++++---------------------------
 drivers/thunderbolt/nhi.h       |  33 ++-
 drivers/thunderbolt/nhi_ops.c   | 185 ------------
 drivers/thunderbolt/pci.c       | 622 ++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/switch.c    |  41 +--
 drivers/thunderbolt/tb.c        |  18 +-
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   8 +-
 15 files changed, 805 insertions(+), 694 deletions(-)
---
base-commit: e24f3c0df48378214d9a67c5048d0faca144b163
change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f

Best regards,
--  
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


