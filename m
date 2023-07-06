Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F5A47498AA
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jul 2023 11:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232003AbjGFJji (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jul 2023 05:39:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231905AbjGFJjh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jul 2023 05:39:37 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 523451727;
        Thu,  6 Jul 2023 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1688636375; x=1720172375;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4J/rfsepVEnQrtAObT+mYD5rOZnXSFT+UufQ22b8Q+w=;
  b=oBueWc0DC66fcN7O6+DnafU5Tl8YVXKVej9l2WIJW96aBoOUcT8DPG3k
   qGBD0h9u3KMvZB/PTLWPikYgjFFu5DdLJ5r5Ire7TMjQk00i8G24XUYUQ
   iNNVlJz8DNFXcAUOuhMTxY5QgbIDcpQ+Kj3Fid0sKJriuVF9aBGV8A0sS
   +qhxIjLkIol/aKh4D0clu+WNkY+ePt82symdqgsWJdY+cStRYY6AAxlsH
   Db8A59EMGXiPTgEvGD5fh8OR+yRDoUQ6QNkTUTAmoKkjBthh9wma/L1LT
   iehup0fzU3sKd9xjbGEcZ6CxBr1YOC3ApvVhQdUplWOCMUar4/NRAEKpC
   w==;
X-IronPort-AV: E=Sophos;i="6.01,185,1684792800"; 
   d="scan'208";a="31788584"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jul 2023 11:39:33 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 0EA5E280084;
        Thu,  6 Jul 2023 11:39:33 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Xu Yang <xu.yang_2@nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: usb: ci-hdrc-usb2: Fix number of clocks
Date:   Thu,  6 Jul 2023 11:39:28 +0200
Message-Id: <20230706093928.3580544-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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

Some (older) IP cores require 3 clocks, named 'ipg', 'ahb' and 'per' while
more recent IP cores just require one. Fix the number and explicitly
state the clock-names.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
From I can tell, is that imx25, imx27, imx35 have specified 3 clocks in
their DT.
IMHO minItems for 'clock-names' can be removed as I presume that this
property is not set when only one clock is used.

 Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
index 782402800d4a..8aab1e831578 100644
--- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
+++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
@@ -76,11 +76,13 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 3
 
   clock-names:
-    minItems: 1
-    maxItems: 2
+    items:
+      - const: ipg
+      - const: ahb
+      - const: per
 
   dr_mode: true
 
-- 
2.34.1

