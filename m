Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B95803D10B6
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238580AbhGUNZE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:25:04 -0400
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:34293 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237349AbhGUNZD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:25:03 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 133375809CC;
        Wed, 21 Jul 2021 10:05:40 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Wed, 21 Jul 2021 10:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=dl9JkUAuyzpIr
        TOxu1i2v9vc4da4FlF7FRCf7MyfqZc=; b=c5khjbmbj+1WOoepaIcdlgsRmq8lT
        CYJQs6e28rgwSH3Wm5JPsgf9zqTq22H6K6ic/h3PEhCq3rNaMbOlDWk37MMOQokD
        OIQ9CdhwjCn2opdufG6Ci5eWYbAqq1iPGxmookiEk8CmsDRrkUFeJTthKfgh2OmE
        GBWAi0P3FJfdT1DmG9vgQ233iPrM5LHswk0fa4hB0MXgAxh2sqnS+AMwIV8NGioG
        f3ZwiKLmksbAeAETe6tFr1RRJqAdeY7boL2kD/+IroOMgAhRgCCd/5HDgKL6oA0k
        n23DTTvWrVxhkDlRvR0+FXd/TrdhTOqiLoWhwRiAOnRCM6fxqbIAN2NZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=dl9JkUAuyzpIrTOxu1i2v9vc4da4FlF7FRCf7MyfqZc=; b=a/6JFxB9
        AnV07P1D5VOMudcesdDUJ/wr3lUuHjH8PSbBVi2caZQHFrATmpv7u1LuwcdEydSE
        kxik39AsDDgR47oruW9uQ9HJ6zxAxO3+TgyUCg8Zskly47pgO/CqtNojYkIoaSpq
        +NkZDYVn3KvICjcTzuzoxXaFxxieMUyy15JDWWHvP5B3ftBU3y+ZUPY4HIsqArXO
        nJP7zNZDJvJfVjRUnLY8t3O1j0ZOtqhQQW7MKGOrplkpZDaVvdmpxINc0oUESpA5
        hDAuHiHdqm0sIirMFDOsZhJlxRfBH3Ex+b2A70cWo6XfjP4Cl+TJEZg5p7heoopq
        8MXyWpAO81zLBQ==
X-ME-Sender: <xms:syn4YPLMe24PgriZ_xgUNjOYzLtdsBcXEBVeLBsEe4QIBYa-id9Ayw>
    <xme:syn4YDLL5Vd2qzvszhceZ3WHYCSS_GyaFegb10vo17h4Ha8m9aYYBfNb7XtvIU2f3
    6wTM-jvamhI4IoMChM>
X-ME-Received: <xmr:syn4YHvI3oY9MRK79tEXREsBND_ypP3dDCfQNZmi09U5FB9P22eIKLUnaiYiV1AJblokBoLhKyVCFyvbWHZ43ikTChnr289JF7A9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:syn4YIZKQVUBatb2hEe9NRZACO5b6_jvUcNkZSzHlKiZHiq4iIaUVg>
    <xmx:syn4YGbjjBkPMJKf23pAMcZx6nQYEc5K_HWaeiSUzI_W1JaV5EnJNA>
    <xmx:syn4YMASOQzbij9oIYaRMRyObqNgN71j0y6cvGRE-9ttQbwT6Xp3CQ>
    <xmx:tCn4YMkY9klW8YG2QUYmSaz8qVQMHcX-5u13TnocXoqBNKO8VBkrVA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 35/54] dt-bindings: usb: dwc3: Fix usb-phy check
Date:   Wed, 21 Jul 2021 16:04:05 +0200
Message-Id: <20210721140424.725744-36-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The original binding was allowing any combination of usb2-phy and
usb3-phy in the phys and phy-names properties.

However, the current binding enforces that those properties must be a
list of usb2-phy and usb3-phy, with exactly one element, effectively
making usb2-phy the only value being valid.

Let's rework the properties description to allow either one or two
element picked with values either usb2-phy or usb3-phy. The rest of the
tooling makes sure that we don't get any duplicate value, so this should
be what we want.

Cc: Felipe Balbi <balbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 41416fbd92aa..6c3f7c9a76c0 100644
--- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
@@ -73,15 +73,15 @@ properties:
 
   phys:
     minItems: 1
-    items:
-      - description: USB2/HS PHY
-      - description: USB3/SS PHY
+    maxItems: 2
 
   phy-names:
     minItems: 1
+    maxItems: 2
     items:
-      - const: usb2-phy
-      - const: usb3-phy
+      enum:
+        - usb2-phy
+        - usb3-phy
 
   resets:
     minItems: 1
-- 
2.31.1

