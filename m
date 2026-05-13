Return-Path: <linux-usb+bounces-37378-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKv1BJxhBGq6HgIAu9opvQ
	(envelope-from <linux-usb+bounces-37378-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:33:48 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 881D853259B
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 13:33:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6E2F3115648
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 11:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9439B3FE655;
	Wed, 13 May 2026 11:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fhYECYfy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071473D3319;
	Wed, 13 May 2026 11:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778671725; cv=none; b=KJwizingSQ6Lsyw9TW2yzXcfUmhZuvWSkq/G23PpjOLxSolHM85237eJ1TrhtmemJmvuc23jOVPHHXb66QW685CEd80XyXf+R95LzQuzrubHOK+8EtS8DIayU5g0A3s79WCX9ZIFnpeNSnDxYA6ZkPoHW0vjYD3l2r0Heo6oX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778671725; c=relaxed/simple;
	bh=R4JDpEwqyp7vUWVCK1KADNQAmcCo5wwLCVQ4YmtJdts=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ChgYeUjhQUuuyoC4IyM2K3HgZsbOnKtGcGB7MlnflsL93CvhL8oTnbkCHYUsQu9yQr6zg7iApgkBOCq71jeBhRML4qY/B3zM5bErPAMEG+ESCtFtf+6xtDhREuTAvKCsmkYXJpHuMYH5pFI+Bu8hS24Fz2Y5tmj0BSRIgQI2wFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fhYECYfy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0F19C2BCB8;
	Wed, 13 May 2026 11:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778671724;
	bh=R4JDpEwqyp7vUWVCK1KADNQAmcCo5wwLCVQ4YmtJdts=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fhYECYfyHlZ7rk3tUHIlaX4QnN4UhxU/TPqR5F6OcmDLbY/CPkGSzVka1NAyuknpU
	 vxsbB3YilwoJwZo+hcE8kDRNFQQUkFvwSqnEGjDVfIt4IyqG695lk1nLsGDNZ8jQGZ
	 YsHIt++w8nXERjHZtwP1uYjOc/a/WsWFPJzpd7zpErQz42EU4WdkCNcjWFJgXwRbmE
	 wL3DUPnC8xqJIN7zMZIo5t13aZHPWVVnyJHRFK1JE0prLIT7kgPI+aG9eP9DXM3U6C
	 nLnEf5Y2HO1WwvofimitrnHOhQV+utlMtXrmePpxtEpw/rJMBvc7V5VknORoIj7WPk
	 LiNXQpeRkulGQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A038FCD4851;
	Wed, 13 May 2026 11:28:44 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v6 0/2] usb: cdns3: support configurations without DRD
 block
Date: Wed, 13 May 2026 13:44:18 +0200
Message-Id: <20260513-b4-no_drd_config-v6-0-e7789cd0e581@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABJkBGoC/33N0QrCIBgF4FcJrzOmU9u66j0ihv7+bgZp6BrF2
 Lu3rZuC6PLAOd8ZScbkMZPDZiQJB599DHNQ2w2BTocWqbdzJrzgqpCMUyNoiI1NtoEYnG+pk2X
 hmGPKVprMs1tC5x8reTq/c76bC0K/OEuj87mP6bl+DmLp/eEHQQu6NwKlhVq5ih1BWwyAO4hXs
 hwM8pMofxByJhiostTC1JrX38Q0TS+W8S/IBwEAAA==
X-Change-ID: 20260512-b4-no_drd_config-f530f1f16d8a
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778672670; l=3527;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=R4JDpEwqyp7vUWVCK1KADNQAmcCo5wwLCVQ4YmtJdts=;
 b=r/o2bDuIm3XmuKHFtqGGN403hJHsPUwU4uVVxTPvX7KkOqdsZgMO/YhYJ0tOktmo2pubeXwxy
 cJpNlbDrgGtD3yTNXLwWlLlyG4+zNvbkzuljKsNjssapdV7pw6RTtJC
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: 881D853259B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37378-lists,linux-usb=lfdr.de,pawell.cadence.com];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[pawell@cadence.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-usb@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:email,cadence.com:mid,cadence.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

usb: cdns3: support configurations without DRD block

This series adds support for Cadence USBSSP controllers in hardware
layouts where the Dual-Role Device (DRD) register block is either
missing or inaccessible.

In such configurations, the controller is hardwired to a single role
(either host or device) and the driver must skip all OTG/DRD register
accesses to avoid bus errors or incorrect role detection.

The solution introduces a new 'no_drd' property that can be passed
via DT or software nodes. When set, the driver:
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
I am happy to provide a rebased v7 as soon as Peter's changes land in
linux-next if required.
---
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
      dt-bindings: usb: cdns3: Add no_drd property
      usb: cdnsp: Add support for device-only configuration

 .../devicetree/bindings/usb/cdns,usb3.yaml         | 70 +++++++++++++++++++---
 drivers/usb/cdns3/cdns3-plat.c                     | 26 ++++----
 drivers/usb/cdns3/cdnsp-pci.c                      | 47 ++++++++++++---
 drivers/usb/cdns3/core.c                           |  3 +-
 drivers/usb/cdns3/core.h                           |  4 ++
 drivers/usb/cdns3/drd.c                            | 44 +++++++++++++-
 6 files changed, 162 insertions(+), 32 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-b4-no_drd_config-f530f1f16d8a

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>



