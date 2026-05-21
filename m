Return-Path: <linux-usb+bounces-37825-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPNdICK9DmrXBwYAu9opvQ
	(envelope-from <linux-usb+bounces-37825-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:06:58 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0305A0ABE
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 10:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 418C830F69FE
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2026 08:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD7773A169E;
	Thu, 21 May 2026 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nuixDHT1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC51D432D;
	Thu, 21 May 2026 08:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779350427; cv=none; b=lwl9FP4ollBJd2ay1IwByWlrTEyL53j011MAHaEDIfUS9mjhNPanQjtCjlrtSo6TAzUwYSvm0MqJoaSQtt98ZX9e1aZgRb53aqEi/Ye/h/lDB5v7egw9EX1tQ0itBFISrCzbu30bFCMiiDhd36h3DpMwNYbU3ic+5glQ4hD8JcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779350427; c=relaxed/simple;
	bh=30DopE8A0+MuAJawRPhY3T0K2+zbu52aiZ71gD+Krpc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=X7AM8KHAYOYK6XBRw5qteI1onHUNZyd7nMeDV3zF7YvKQXIRYdLobgCgxENHOH3r0jqJD7Pt0URggHnzB80uMEAiqfgXJ0oBRE3YVRLZOE7joGShmGrMHG50IHDft77AC2Jj/372PZTzCuz0WITqcYV7OKSamZfTFbfbpYQ0mL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nuixDHT1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D80A0C2BCB4;
	Thu, 21 May 2026 08:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779350426;
	bh=30DopE8A0+MuAJawRPhY3T0K2+zbu52aiZ71gD+Krpc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=nuixDHT1/uSAaGdJSZC5c0CMS85i/ysc/nvT83+MHuO+GSwTLCI9kPWuHKF0iYS5t
	 rOmmSSxAZ5mgI2Y/PtweT9bTIt3FXoSm9IVVoxwkvD+dILph2MVW+6xNhRXcn0M9m8
	 bis6+vuoiwuYAIfvzNC6ggSfg5jOtCj8N2gpDkrIPp9uPfmfL68YAiYME/VzCAd30j
	 7gyeVPP2jgielu3bDyJGOsXfphgbyb5ERNVAIlCWJLKVHaO4j9kJ9boeri8vPEdBAS
	 Piw2eV8btk0c8S1nwiajDjSRMLw8+KXV0OWdeS9R0ZahOhxZJIaKHSEBrrWie2q41p
	 UX98G7aEDZW8g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4E4BCD4F5E;
	Thu, 21 May 2026 08:00:26 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v9 0/2] usb: cdns3: support configurations without DRD
 block
Date: Thu, 21 May 2026 10:16:22 +0200
Message-Id: <20260521-no_drd_config_v9-v9-0-2512cef10104@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFa/DmoC/yXMSwqAIBRA0a3EGyfYF2wrEeLnVa+BhlYE0d6zG
 p7BvRdEDIQRuuyCgAdF8i5B5BmYWbkJGdlkKHnZ8qYQzHlpg5XGu5EmeQimRdFopeoKNYeUrQF
 HOr9lP/yOu17QbO8H7vsBGdalR3QAAAA=
X-Change-ID: 20260519-no_drd_config_v9-b915baa43eb0
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779351391; l=4730;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=30DopE8A0+MuAJawRPhY3T0K2+zbu52aiZ71gD+Krpc=;
 b=xppJ9QL6VhG7iLIKEfM5jdYn/SXDJLlCR+xnSokRv1ppemfH8hJTXv/HlHeVvpu6N4jcxq3E4
 xBu2K1/+hiDCOUMPgb7vMmNPgcOZeDVfICkB7OEKOvnf7492CnfROg1
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
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
	TAGGED_FROM(0.00)[bounces-37825-lists,linux-usb=lfdr.de,pawell.cadence.com];
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
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cadence.com:replyto,cadence.com:mid,cadence.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2B0305A0ABE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds support for Cadence USBSSP controllers in hardware
layouts where the Dual-Role Device (DRD) register block is either
missing or inaccessible.

In such configurations, the controller is hardwired to a single role
(either host or device) and the driver must skip all OTG/DRD register
accesses to avoid bus errors or incorrect role detection.

The solution introduces a new 'cdns,cdnsp' compatible string
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
I am happy to provide a rebased v10 as soon as Peter's changes land in
linux-next if required.
---
v9:
- Dropped the "cdns,cdnsp-no-drd" string to avoid generic property-like 
  naming as requested by Conor.
- Introduced the clean generic fallback "cdns,cdnsp"
- Updated the patch description and commit message to reflect the new naming.

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
      dt-bindings: usb: cdns3: Add cdns,cdnsp compatible string
      usb: cdnsp: Add support for device-only configuration

 .../devicetree/bindings/usb/cdns,usb3.yaml         | 63 ++++++++++++++++++----
 drivers/usb/cdns3/cdns3-plat.c                     | 30 +++++++----
 drivers/usb/cdns3/cdnsp-pci.c                      | 48 +++++++++++++----
 drivers/usb/cdns3/core.c                           |  3 +-
 drivers/usb/cdns3/core.h                           |  4 ++
 drivers/usb/cdns3/drd.c                            | 45 ++++++++++++++--
 6 files changed, 159 insertions(+), 34 deletions(-)
---
base-commit: 80dd246accce631c328ea43294e53b2b2dd2aa32
change-id: 20260519-no_drd_config_v9-b915baa43eb0

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>



