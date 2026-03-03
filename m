Return-Path: <linux-usb+bounces-33909-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Fb1EJPkpmlkZAAAu9opvQ
	(envelope-from <linux-usb+bounces-33909-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 14:39:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B43031F06AC
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 14:39:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A390630602E1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 13:37:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E062D7817;
	Tue,  3 Mar 2026 13:37:42 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from bm.lauterbach.com (bm.lauterbach.com [62.154.241.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ECA26B760
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.154.241.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772545062; cv=none; b=ePrL0jJamzwaK8KtOLVNwOnvVdsoTj4aUsZPoeUTOmG7rrf8OKiXtG2RpQ4ZMb+c9QT8P644P0OhW+dlL4/3BlDP0mzIZGozkJcxUdxR40SCov1q4abv+Di0UQNpDLUXnqhbUOW7cdRNdJpAnzj1tf6OvcZxWIG58X5An/7Msc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772545062; c=relaxed/simple;
	bh=LHKpa7WvmeFd6PC+bnlBQbwfklUNHPOXZ8BzfiGO/VY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b+17vOXg+nuE3YU6C0AZu5HfRBAKq4nCW6jFyEgQHLZfd5VXyIwuykpKGP+bv4KxikqM6cuz1rjuIXembBY2wVrVvH6hV4rnHm+kEs9qWKNKjITpJeTScACMMeOWlMI8psgqMMGK78cyoh4QknXAW1H3o//MLT+pYRyy+swjK3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com; spf=pass smtp.mailfrom=lauterbach.com; arc=none smtp.client-ip=62.154.241.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lauterbach.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lauterbach.com
Received: from ingpc2.intern.lauterbach.com (unknown [10.2.10.44])
	(Authenticated sender: ingo.rohloff@lauterbach.com)
	by bm.lauterbach.com (Postfix) with ESMTPSA id 29940DD8C542;
	Tue, 03 Mar 2026 14:37:32 +0100 (CET)
From: Ingo Rohloff <ingo.rohloff@lauterbach.com>
To: Thinh.Nguyen@synopsys.com
Cc: gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org,
	Ingo Rohloff <ingo.rohloff@lauterbach.com>
Subject: [PATCH v4 0/1] usb: dwc3: Support for USB3340x ULPI PHY
Date: Tue,  3 Mar 2026 14:37:19 +0100
Message-ID: <20260303133720.17167-1-ingo.rohloff@lauterbach.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Bm-Milter-Handled: 166a2dfb-2e12-4590-8fa5-72e30323519f
X-Bm-Transport-Timestamp: 1772545052219
X-Rspamd-Queue-Id: B43031F06AC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33909-lists,linux-usb=lfdr.de];
	DMARC_NA(0.00)[lauterbach.com];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_NEQ_ENVFROM(0.00)[ingo.rohloff@lauterbach.com,linux-usb@vger.kernel.org];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.898];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

The problem only pops up if you combine a DWC3 controller with a
Microchip USB3340 ULPI PHY.

This patch uses the USB Vendor/Product ID of the ULPI PHY
to detect the USB3340 model and then applies the necessary fix,
if this model is found.

Benefits of this approach
- Does not require any modification to existing device trees.
- Should work for all DWC3 IP / USB3340 combinations, not only
  for the Ultrascale+ ZyngMP DWC3 implementation, where this
  problem was originally found.
- Easy to extend in the future if a similar situation arises again.

Caveats:
- Replicates code from drivers/usb/common/ulpi.c

Signed-off-by: Ingo Rohloff <ingo.rohloff@lauterbach.com>
---
Changes in v4:
- Rename dwc3_ulpi_detect_quirks()   -> dwc3_ulpi_detect_config()
- Rename dwc3_hs_apply_ulpi_quirks() -> dwc3_ulpi_apply_config()
- Call dwc3_ulpi_apply_config() each time dwc3_core_init() is called.
  Makes sure config is applied when resuming.
- Link to v3: https://lore.kernel.org/linux-usb/20260227133038.45150-1-ingo.rohloff@lauterbach.com/

---
Changes in v3:
- Do not mention what the DWC3_GUSB2PHYCFG_XCVRDLY does.
- Do not use device tree property to set enable_usb2_transceiver_delay.
  Instead autodetect if it's necessary to set enable_usb2_transceiver_delay.
- Link to v2: https://lore.kernel.org/linux-usb/20260225130323.24606-1-ingo.rohloff@lauterbach.com/

---
Changes in v2:
- Mention sources of information in commit message instead of code.
- Renamed property to "snps,enable-usb2-transceiver-delay".
- Renamed struct member to "enable_usb2_transceiver_delay".
- Describe dt-bindings in a second commit.
- Link to v1: https://lore.kernel.org/linux-usb/20260224141438.39524-1-ingo.rohloff@lauterbach.com/

---

Ingo Rohloff (1):
  usb: dwc3: Support USB3340x ULPI PHY high-speed negotiation.

 drivers/usb/dwc3/core.c | 16 +++++++++++++++
 drivers/usb/dwc3/core.h |  4 ++++
 drivers/usb/dwc3/ulpi.c | 44 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

--
2.52.0


