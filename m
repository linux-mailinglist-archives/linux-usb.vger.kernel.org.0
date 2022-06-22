Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA55554A6C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jun 2022 15:04:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243103AbiFVNE5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jun 2022 09:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350274AbiFVNEw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jun 2022 09:04:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3FB23173
        for <linux-usb@vger.kernel.org>; Wed, 22 Jun 2022 06:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903091; x=1687439091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IDe+XSP0w6CqM/w7HgCF6rtWL5f6zRKINNcLCNSdqoA=;
  b=WHL/EGhjSN9oeBKLhgAXmz6s8etUcGQUkhqRvor/OuCADW3BGSjRPNf+
   SzH527LB54OQK+/b3XJJYW20s9Rg6m9ummx8288p3uPA2JbwwNdilZVL1
   JV0FmXn6uAwFBTtVAWRhYyDqwdtW6L7334wPxzFtt5XpfqnUnB9tNV+AE
   tAWy57UprINru3jw3+nZnZ1nIJu/nqSUx2TGjYl9t+TvqXi44ps9MyVl/
   e1phQZT9MnXU2BSIdEllYPdQMCSQ3LiktRFNKLWFiXpsZa4f24xGAcaJV
   in5VkoWq9mshc68/mk2ylwRvXrqouqT6+WMmZGLEfC8wWjmbC4mOCDpOf
   A==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605518"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 22 Jun 2022 15:04:47 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 22 Jun 2022 15:04:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1655903087; x=1687439087;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IDe+XSP0w6CqM/w7HgCF6rtWL5f6zRKINNcLCNSdqoA=;
  b=i6/XgxzcwNDG3xJM4viVVS21a8izkTSMvoRo1z/CxW90xDfroiBEcz1e
   PpM5l0O+Q9GyWxtTDCE7pa+rbMygal+au1K8+QVAukv9BwX3U2/oX861n
   LMA8ue6K2EOxhsZJaOQrRM6hmk0KNKX7TgY63KXgMEWQlctEg/jUgAGpC
   FlOOv2gBhViDo6A372cNSlCGMmHhjvjXGCdUJRwIJXbQesFntwRfnvtkj
   o++X7irrK3cL3wZm1jw8M/HCYCNXn5p3io5D8KZtXHmUcatDsYptxuThQ
   NvyMJNeucFQuIEX4jVv++W9zbJAa+8humr/r+J5abN5oXUfZl6jrqR/A0
   w==;
X-IronPort-AV: E=Sophos;i="5.92,212,1650924000"; 
   d="scan'208";a="24605517"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 22 Jun 2022 15:04:47 +0200
Received: from steina-w.tq-net.de (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 4F46C280072;
        Wed, 22 Jun 2022 15:04:47 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 1/4] dt-bindings: usb: dwc3: Add gfladj-refclk-lpm-sel-quirk
Date:   Wed, 22 Jun 2022 15:04:37 +0200
Message-Id: <20220622130440.955465-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
References: <20220622130440.955465-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This selects SOF/ITP to be running on ref_clk.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index d41265ba8ce2..efc755502d0a 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -234,6 +234,11 @@ properties:
       avoid -EPROTO errors with usbhid on some devices (Hikey 970).
     type: boolean
 
+  snps,gfladj-refclk-lpm-sel-quirk:
+    description:
+      When set, run the SOF/ITP counter based on ref_clk.
+    type: boolean
+
   snps,is-utmi-l1-suspend:
     description:
       True when DWC3 asserts output signal utmi_l1_suspend_n, false when
-- 
2.25.1

