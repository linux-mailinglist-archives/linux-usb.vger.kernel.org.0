Return-Path: <linux-usb+bounces-34280-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJiOCV+irmk9HAIAu9opvQ
	(envelope-from <linux-usb+bounces-34280-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:35:11 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2164F2372EC
	for <lists+linux-usb@lfdr.de>; Mon, 09 Mar 2026 11:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 46C5B301220A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Mar 2026 10:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CCB738F246;
	Mon,  9 Mar 2026 10:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2Po0qCA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFEA87262E;
	Mon,  9 Mar 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052422; cv=none; b=rVmqNWhM2e+jyTkX6gMC00ZF4+FjEOePa+o/FgBBfxhqnD+QOoz4YBNBkgdz/B1x7mQYxA6MXbvEPXXrV9FAv0jTON8t87ofyYmeRmx/5Qd3qrhDzVSENyvFmgHUYUANSQoC/fpn6R87H5btlcfxakCgcWVr7x23QQ9TDu2v8Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052422; c=relaxed/simple;
	bh=T0tIkr/NeK7n2B0rGmYxOgjcsF4ABmlarjy5SxolQFQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=k5kkLnibxQEZn6V8RCBZv3CM5xZzDw49QvtcstCq0Gy4DwlVrO/xsjp4v9ySWlaJ7gMhV1IONN5ojVAqUNuhEovwHfEAOCxSY4E8vCKpG4VzOKsatc0ntYTpjDP6QwiH5kxotgIh1F9OCc25QtHSyoD92kP5BTAnDbiv5s5TRlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2Po0qCA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780BBC4CEF7;
	Mon,  9 Mar 2026 10:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773052422;
	bh=T0tIkr/NeK7n2B0rGmYxOgjcsF4ABmlarjy5SxolQFQ=;
	h=From:Subject:Date:To:Cc:From;
	b=C2Po0qCAWyI3MCSIY6cu5UE0HPuJZjBEO6uUGeMiRFLDQ1VtdmNY+ibXzqc8dkPrq
	 nUZyHhSjMiThGzxc1TKVdXaJKzCwda5jY1fb/VgakMbPHU8nSvJVkf25olHX42fxwZ
	 gDZ08HVhk83Q6IjIpZwD7EPT824suEunh2cRO9CqsZapib3utG7KCcp1WxfvVREZdT
	 s/dUfc/W+JWQG4Xzj8oh7/NcILi6/SU71fXzpom30PlEnLKDnKKQD6fdsQt/6KzQHB
	 0aCcsMv/niDyCDG+YNMt3zjxzCKZ0GN/k4c3UcNAb/JMzqgfFNZFdbTmGY2vvRaAQr
	 Gc3tx5dT/Hfvg==
From: Konrad Dybcio <konradybcio@kernel.org>
Subject: [RFC/RFT PATCH 0/3] Prepwork for non-PCIe NHI/TBT hosts
Date: Mon, 09 Mar 2026 11:32:58 +0100
Message-Id: <20260309-topic-usb4_nonpcie_prepwork-v1-0-d901d85fc794@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MWwqAIBBA0a3EfCfYA7O2EiFlYw2BivaCaO9Jn
 4cL94GIgTBClz0Q8KRIziYUeQZ6He2CjOZkKHkpeMVbtjtPmh1xqpV11mtC5QP6y4WNSSFlYRr
 RTtJAOqRg6P7v/fC+H8rn0RhtAAAA
X-Change-ID: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f
To: Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 usb4-upstream@oss.qualcomm.com, 
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773052420; l=2468;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=T0tIkr/NeK7n2B0rGmYxOgjcsF4ABmlarjy5SxolQFQ=;
 b=kQbLx/0U0HXZgY45NpqALi6JrS9uF6YBbL4hZc3iREf3QiR6FYqzNHqDB0g0ZPzoWvUyjYlWV
 iaF+1g+Mb+hDg2PjOCeAX7mOkyd6q4LImAhCDR6V+56TfcjvP82lwds
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
X-Rspamd-Queue-Id: 2164F2372EC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34280-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.968];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konradybcio@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email]
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
	ret = nhi_probe_common(&my_usb4->nhi)
	...

	// cleanup boilerplate
}

Instead of the previously-suggested aux/fauxbus, the NHI device remains
the same 'struct dev' as the PCIe/platform/[...] device that provides
it. This is in line with some other buses and it makes things easier
from the PM perspective.

Compile-tested only for the PCIe case. The Qualcomm USB4 driver that
leverages this patchset is unfortunately still work in progress and
will be shared at a later time. Nonetheless, we need to get this
non-PCIe topic sorted.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
Konrad Dybcio (3):
      thunderbolt: Move pci_device out of tb_nhi
      thunderbolt: Separate out common NHI bits
      thunderbolt: Add some more descriptive probe error messages

 drivers/thunderbolt/Makefile    |   2 +-
 drivers/thunderbolt/acpi.c      |  14 +-
 drivers/thunderbolt/ctl.c       |  14 +-
 drivers/thunderbolt/domain.c    |   2 +-
 drivers/thunderbolt/eeprom.c    |   2 +-
 drivers/thunderbolt/icm.c       |  25 +-
 drivers/thunderbolt/nhi.c       | 494 ++++++---------------------------------
 drivers/thunderbolt/nhi.h       |  32 +++
 drivers/thunderbolt/nhi_ops.c   |  31 ++-
 drivers/thunderbolt/nhi_pci.c   | 496 ++++++++++++++++++++++++++++++++++++++++
 drivers/thunderbolt/nhi_pci.h   |  22 ++
 drivers/thunderbolt/switch.c    |  41 +---
 drivers/thunderbolt/tb.c        |  76 +-----
 drivers/thunderbolt/tb.h        |  10 +-
 drivers/thunderbolt/usb4_port.c |   2 +-
 include/linux/thunderbolt.h     |   5 +-
 16 files changed, 699 insertions(+), 569 deletions(-)
---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260309-topic-usb4_nonpcie_prepwork-86881f769b8f

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


