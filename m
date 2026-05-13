Return-Path: <linux-usb+bounces-37370-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GGNIuc1BGoqFgIAu9opvQ
	(envelope-from <linux-usb+bounces-37370-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:27:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74A52FA1F
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 10:27:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1149A30AFFD0
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2026 08:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA5CF1E8332;
	Wed, 13 May 2026 08:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CI6erl1Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6733DBD7C;
	Wed, 13 May 2026 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778660757; cv=none; b=RGJOzrug/FZDBpsKyuO9ZwCChEXw0uYgS9MIUxPMEhA7Lm8S11Sgahl6Qu9xnPHPbTCzOt9pGVqjo83DAKajKwRpw6+1FzYxXnvg/ZocmEtWljBMvO2b1k9U7BEbdFzdXY7/cx9Q4H17UhHvDcrGHDzTUwal/mC6mGYIvK61bjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778660757; c=relaxed/simple;
	bh=1zD6x03NDaHsAcKxIsaEJgXum3xkeDGydr1lcBTCjn8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vDg1sO5Bt39bvwC3ivNLI9wes5j1GvKrZKsq69LShBKWgMF/4qiGu0U3cJNypEaj7L+JUYRAz9AKWPtgUuf0bcOQs6I0KzCEhD1k1xllPLH2fmW9nFhuSya+0ZJP6ZF2m9KGjbxmyosELQGi7dSCt9m5i4HJpD3CGqeGvx7cejc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CI6erl1Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6896C2BCB7;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778660755;
	bh=1zD6x03NDaHsAcKxIsaEJgXum3xkeDGydr1lcBTCjn8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CI6erl1QblKP5KTBxCrdt9SFN14AnSV411oxLKSgqhXx4shhSrVwdrKbmQKN2xKTB
	 buZz+HeW585o147aSWcPfl4/Ff+YNoKYlk/GrwsLTj6hKcM8fVEg6Fu6vLox8+g9Dg
	 eJlWuGHVm5qfC8qOONn7aDcBbmjAuspX7eNifnLboAa6nPp4MiJ43+Jl6UH5bzKFD0
	 vA//l14ebVfbat58d/bJL18WIjxKGpAHwm6qpqME7YcezvQGAuAf1j4Iw4HLxPk+Nq
	 F37qvWgpd5VIEYr88pjEKxH7fg/0ZvEdiaDW8emWjAQ5F/kAcqC1JBTOMUYn2ZJaGO
	 gXoO7sJIyTWJQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B43FFCD4851;
	Wed, 13 May 2026 08:25:55 +0000 (UTC)
From: Pawel Laszczak via B4 Relay <devnull+pawell.cadence.com@kernel.org>
Subject: [PATCH v5 0/2] usb: cdns3: support configurations without DRD
 block
Date: Wed, 13 May 2026 10:41:20 +0200
Message-Id: <20260513-b4-no_drd_config-v5-0-1c633a4b9a29@cadence.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADA5BGoC/32NQQ6CMBBFr0JmbU2LLSIr72EIgekUxsTWtEg0h
 LsLuHf5kvffnyFRZEpQZTNEmjhx8CuYQwY4tL4nwXZlyGVeSKNy0WnhQ2OjbTB4x71w5iSdcqq
 wZQvr7BnJ8XtP3uofp1d3Jxy3zmYMnMYQP/vnpDfvT37SQopzp8lYvBSuVFdsLXmkI4YH1Muyf
 AHAlmOcxAAAAA==
X-Change-ID: 20260512-b4-no_drd_config-f530f1f16d8a
To: Peter Chen <peter.chen@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Pawel Laszczak <pawell@cadence.com>, 
 Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778661701; l=3306;
 i=pawell@cadence.com; h=from:subject:message-id;
 bh=1zD6x03NDaHsAcKxIsaEJgXum3xkeDGydr1lcBTCjn8=;
 b=Wk/I6orvflQoGMiUzWSZ7vSWaiAi7iy85xQ3q9zg/9tzG3aGTpBR4mHOcN7eliwJ2ZNYtNvai
 apuXyHXni6hB91PIsMx1HLNNi3XHijz7QXtiuXyNo5QhaEU8qd71FTq
X-Developer-Key: i=pawell@cadence.com; a=ed25519;
 pk=EUPBvLO9CDg7j6defeDl2iqi+z5Ivqu4Z46aiqe7dYc=
X-Endpoint-Received: by B4 Relay for pawell@cadence.com/default with
 auth_id=707
X-Original-From: Pawel Laszczak <pawell@cadence.com>
Reply-To: pawell@cadence.com
X-Rspamd-Queue-Id: 2F74A52FA1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37370-lists,linux-usb=lfdr.de,pawell.cadence.com];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
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
I am happy to provide a rebased v6 as soon as Peter's changes land in
linux-next if required.
---
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

---
Pawel Laszczak (2):
      dt-bindings: usb: cdns3: Add no_drd property
      usb: cdnsp: Add support for device-only configuration

 .../devicetree/bindings/usb/cdns,usb3.yaml         | 67 +++++++++++++++++++---
 drivers/usb/cdns3/cdns3-plat.c                     | 26 +++++----
 drivers/usb/cdns3/cdnsp-pci.c                      | 47 ++++++++++++---
 drivers/usb/cdns3/core.c                           |  3 +-
 drivers/usb/cdns3/core.h                           |  4 ++
 drivers/usb/cdns3/drd.c                            | 44 +++++++++++++-
 6 files changed, 159 insertions(+), 32 deletions(-)
---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260512-b4-no_drd_config-f530f1f16d8a

Best regards,
--  
Pawel Laszczak <pawell@cadence.com>



