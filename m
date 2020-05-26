Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2622D1D0FD3
	for <lists+linux-usb@lfdr.de>; Wed, 13 May 2020 12:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732792AbgEMKa6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 13 May 2020 06:30:58 -0400
Received: from foss.arm.com ([217.140.110.172]:42726 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732741AbgEMKa6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 May 2020 06:30:58 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72035D6E;
        Wed, 13 May 2020 03:30:57 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.cambridge.arm.com [10.1.197.25])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22DE23F305;
        Wed, 13 May 2020 03:30:56 -0700 (PDT)
From:   Andre Przywara <andre.przywara@arm.com>
To:     Rob Herring <robh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Mark Rutland <mark.rutland@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH v3 20/20] dt-bindings: ehci/ohci: Allow iommus property
Date:   Wed, 13 May 2020 11:30:16 +0100
Message-Id: <20200513103016.130417-21-andre.przywara@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200513103016.130417-1-andre.przywara@arm.com>
References: <20200513103016.130417-1-andre.przywara@arm.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A OHCI/EHCI controller could be behind an IOMMU, in which case an iommus
property assigns the stream ID for this device.

Allow that property in the DT bindings to fix a complaint about the Arm Juno
board's DTS file.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 3 +++
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 10edd05872ea..20664c28bfb2 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -74,6 +74,9 @@ properties:
   phy-names:
     const: usb
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index bcffec1f1341..ff6c04cde695 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -73,6 +73,9 @@ properties:
   phy-names:
     const: usb
 
+  iommus:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.17.1

