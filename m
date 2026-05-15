Return-Path: <linux-usb+bounces-37505-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4N2uLqwGB2p+qwIAu9opvQ
	(envelope-from <linux-usb+bounces-37505-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:42:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2B054EA69
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 13:42:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 34BED306B33E
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2026 11:09:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A0D478E3D;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C2B/Nd1V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC303E9F9A;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843336; cv=none; b=bLovF4VoCpdhhytRGzOUor8NqYZfLHTstpzHN4JJ+v3pEdQiMxTNPXDfUgdW0gUtB0yMKa9tzs5qSv9JWLWJZdqy2wUmSGPGQ5rWpicATo7P9k3Ap4W/s2Fn32do6jtsRCZ8dhRzS6ehW8Ec0WMvRQf4P5RA2UYqsWsMmSIs20c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843336; c=relaxed/simple;
	bh=BU5QjjaKc8Oa45q+cDVXISvMkJHNH5Kes2M6ehvtJSY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qb1fXCyox3vrll/lf6Ys8mAkvYS/bKQ3/u1rIGQQ/c9w2tNO/ZmPwwvL7LcJuuHYkdxEt2hyZmgOHR5bXojcGtNTAv9LtqZeDe2MQ91R3Jv/JEVsWeZm0sJEgdNu2trq79ejwcbnfocygSzQKoUrf1I2DyJBIF+2MT4xpIQ0zPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C2B/Nd1V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0B921C2BCB0;
	Fri, 15 May 2026 11:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778843336;
	bh=BU5QjjaKc8Oa45q+cDVXISvMkJHNH5Kes2M6ehvtJSY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=C2B/Nd1VlcvjM25emCnKDW/AUF2w9K3y+C8EhR6sFx+XBBNHWIkWnYJGwh0YQ+2+m
	 kSemw9YraW5EDPie0Dqjkw1yYd983Q2wVSkIfGhIHdG6rlJcITt9OhNl3umnXIEJc/
	 7ZI0ToMwk6NxUONKHNNsWkimGdojbwYGCQtZSyL+T0f1Mo0rGd5KHjaVreD8VT9J2P
	 ERKY/ScpBN+6sUn3QU4bxolYbWEyKl0Hm8pCSdNfYilKCt8vcj8w0tUaRrUSdyKpgU
	 Tv9cKKGDtw4PpIexFoDiDJk035kHKMOf7+SOAp7x7AVtHLO0BaNcWyhDACGNTut6+X
	 wfMmOjLFK3Qtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE3ECD4851;
	Fri, 15 May 2026 11:08:55 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v8 0/2] usb: cdns3: support configurations without DRD
 block
Date: Fri, 15 May 2026 13:24:37 +0200
Message-Id: <20260515-b4-no_drd_config-v8-0-75cb05317679@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHUCB2oC/4XO3WoDIRAF4FcJXteg6+/2qu9RQnDHMbFQLZosL
 WHfPZrcJHRpLw+c+c5cSMUSsZLXzYUUnGONObVgXzYEji4dkEbfMhnYoJniA50kTXnvi99DTiE
 eaFCCBR649taRdvZVMMTvG/m+u+d6nj4QTt3pjWOsp1x+bpuz7L0/+FlSRs0kUXkYdbD8DZzHB
 LiF/En6wKweCbFCqEZw0EI4OY1uGH8T+j9CNwKNsSN4hmrtC/NIyBXC9C8sgGQotAj+mViW5Qr
 B+DzhjQEAAA==
X-Change-ID: 20260512-b4-no_drd_config-f530f1f16d8a
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778844286; l=4496;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=BU5QjjaKc8Oa45q+cDVXISvMkJHNH5Kes2M6ehvtJSY=;
 b=T97xkwpE3i9dE8+91BxsUVqjnhFTgbUD/PX+Q7M2E6ZQbDl9kdRMaX8NuP9BpZ8I6VvJNji9O
 tABdi/E8z6FC6Ujl5IKNf99D3quIGJc2aK4zR8JN5diAFMPeHhz3y0G
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: BF2B054EA69
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
	TAGGED_FROM(0.00)[bounces-37505-lists,linux-usb=lfdr.de,pawell.cadence.com];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,cadence.com:mid,cadence.com:replyto,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series adds support for Cadence USBSSP controllers in hardware
layouts where the Dual-Role Device (DRD) register block is either
missing or inaccessible.

In such configurations, the controller is hardwired to a single role
(either host or device) and the driver must skip all OTG/DRD register
accesses to avoid bus errors or incorrect role detection.

The solution introduces a new 'cdns,cdnsp-no-drd' compatible string
that can be passed via DT or software nodes.
When set, the driver:
1. Skips DRD register mapping and IRQ requests.
2. Uses a different BAR indexing logic for PCI-based configurations
   (32-bit addressing layout).
3. Hardwires the role based on 'dr_mode'.

Signed-off-by: Pawel Laszczak <pawell@cadence.com>
---
Note: This series is based on current linux-next. I am aware of Peter
Chen's recent refactoring series ("usb: cdns3: plat: Expose platform
core driver as library"). Although there is a minor conflict in
cdns3-plat.c, Peter has already provided an Acked-by for this version.
I am happy to provide a rebased v9 as soon as Peter's changes land in
linux-next if required.
---
v8:
- Update commit message to reflect schema changes.
- Removed 'cdns,no-drd' boolean property as per Rob Herring's suggestion.
- Introduced a new compatible string 'cdns,cdnsp-no-drd' for controller
  variants that lack the DRD/OTG register block.
- Use 'cdns,cdnsp-no-drd' compatible string to trigger no-DRD logic.
- Update PCI glue layer to inject the new compatible string.

v7:
- Rename 'no_drd' to 'cdns,no-drd' (added vendor prefix).
- Update commit message to reflect property renaming and schema changes.
- Simplify 'reg-names' using a single enum for items.
- Revert 'interrupt-names' to a list of constants for strict ordering.
- Move 'reg' item descriptions to if/else blocks for better accuracy.
- Clean up 'if' logic (remove redundant 'true' check and 'dr_mode'
  requirement).
- Add explicit 'items' list for 'interrupt-names' in the 'else' block.
- Fix "uninitialized variable" warning in cdns_drd_host_on() by
  initializing 'ret' to 0.

v6:
- Fixed validation error for 'interrupt-names' by correcting
  the items definition.
- Adjusted 'minItems'/'maxItems' to properly support the optional
 'wakeup' interrupt.
- Fixed 'too long' schema error in examples.

v5:
- Implemented strict conditional validation using if-then-else logic.
- Enforced 2 register/interrupt items and required 'dr_mode'
  (host or peripheral) when 'no_drd' is present.
- Enforced the standard 3 register/interrupt items (otg, host, dev)
  when 'no_drd' is absent to ensure backward compatibility.
- Updated 'reg-names' and 'interrupt-names' to use enums in the main
  properties section to support flexible resource ordering during
  validation.

v4:
  - Added DT binding documentation for the 'no_drd' property.
  - Relaxed 'reg' and 'interrupts' requirements in the DT schema (minItems 2)
    to allow configurations where the OTG/DRD register block is missing.
  - Moved PCI_DEVICE_ID_CDNS_UDC_USBSSP from pci_ids.h to cdnsp-pci.c
    to keep the global PCI ID list clean.

v3:
  - Improved descriptions and comments for better clarity.
  - Introduced the 'no_drd' property to indicate missing DRD register block.
  - Added support for fixed host-only and device-only configurations.
  - Ensured cdns_otg_disable_irq is called only when no_drd is false.
  - Updated cdns_drd_gadget_on/off to ensure PHY mode is correctly
    handled even if DRD is disabled.

v2:
  - Changed otg_irq to be optional.
  - Added cdns->no_drd check in cdns_power_is_lost.
  - Added cdns->no_drd check in cdns_get_id.

---
Pawel Laszczak (2):
      dt-bindings: usb: cdns3: Add cdns,cdnsp-no-drd compatible string
      usb: cdnsp: Add support for device-only configuration

 .../devicetree/bindings/usb/cdns,usb3.yaml         | 60 ++++++++++++++++++----
 drivers/usb/cdns3/cdns3-plat.c                     | 30 +++++++----
 drivers/usb/cdns3/cdnsp-pci.c                      | 48 +++++++++++++----
 drivers/usb/cdns3/core.c                           |  3 +-
 drivers/usb/cdns3/core.h                           |  4 ++
 drivers/usb/cdns3/drd.c                            | 45 ++++++++++++++--
 6 files changed, 156 insertions(+), 34 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-b4-no_drd_config-f530f1f16d8a

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>



