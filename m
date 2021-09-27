Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D38E41900F
	for <lists+linux-usb@lfdr.de>; Mon, 27 Sep 2021 09:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233272AbhI0HhA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Sep 2021 03:37:00 -0400
Received: from new2-smtp.messagingengine.com ([66.111.4.224]:38245 "EHLO
        new2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233242AbhI0Hg7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Sep 2021 03:36:59 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailnew.nyi.internal (Postfix) with ESMTP id 53A0A580BDD;
        Mon, 27 Sep 2021 03:35:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 Sep 2021 03:35:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=3v8ypuwgp+UVL
        BlnX3yZhpFVxptbvBS5y5LkJwvOoxg=; b=O+q+GLcBTUeF3L8pCNn39b1vl+A/Q
        GOZ4Omj4i3+pJlVXROBsuzUjshOxfipchnAVN0M5taFaCRvwpCSokzLiJ2NA2TGv
        VPiXlH33z9qGjvVqN7KGaoNeO+T+LTqUvYwCxmhr6+OApNi0Lg4gwsE76o9HsVKZ
        ykfOpqQRAuUWv5mmsD4E9iGtLqg33Ur4imeEZ6YOsmdqjKm4ODFLtRRfDrIZ8noz
        LXjjvFtpajcc2xc1Eq7ejiN/hLU8tYrJazfN/Xt5Z6/2Z+gMHFODiFbRVXDhJ1Qy
        z2gMoRkHWHegDgvgyufJ0oaR6avphK6ZFHbscGXMN5qg7nmXiQzCvm/4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=3v8ypuwgp+UVLBlnX3yZhpFVxptbvBS5y5LkJwvOoxg=; b=CVWIV1nM
        D74h+udd8yC3gMTid6bOmumzDDz6peFapI/d6LsjcwoVn97moMXoFsh1FIb4dpNT
        CFol8UTLifCz/ydozY/xWbPTxTcOpgouM1oB5saSQDhO7HBKyngvUsIOLCgKyEzu
        VZi1ckoC9p17KyXbOd8Hgm4pB+HF7rrI8gcWhdWnQRxhb5DU6Q7jH+3Tn0e118yL
        3gXoxnzQc2Qlc14jBCdMn/5uxrnc/VwRtj3LJXClShgvwxsgV3ebaNH5N+mFDWSq
        qCLWvoUW2qNBEOlzXRS8Gvgvl4tm5X/QDeaql2DNTzu2ihdxSol/QmBReX8+fHr/
        3DzngJeOCzw9Mg==
X-ME-Sender: <xms:OHRRYSSNKGMICn7GCmb5ddMXG6UKpr8_Bv67WZvvfo4jBKbDEAK8iQ>
    <xme:OHRRYXyMOERw2Wv2OILZiFwTzNnKRrbW3v2LQn4LXeoKByI_NZauGmFVnO6UDMz8p
    6NRlHo4sa12UGLzdII>
X-ME-Received: <xmr:OHRRYf2Q-9sk8WrN5_HzyzptJN13ej3uXqQkQ8JEGEhzdXNZkK5BuJkQn0d7OoZ-YDLV_7JUXMxz6AGsUNmwhK_SC8c6qBDj-vwtiBtw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejjedguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveev
    heehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OHRRYeB1fwIG97CbGNqbMTSJ7DzF9yZYwm9Ao4IkCMXuI56ihbRMBQ>
    <xmx:OHRRYbg08LpeUok0fcszjef5pj607o_lGcrjkomhkumAxlGqP1_8mA>
    <xmx:OHRRYapeKhKX0TFsUu2v5Y-gF2XjFrTs2VpZDi_-0_vn1Loy2g31Sw>
    <xmx:OXRRYQZlLcuNrx3Ll98yu1Ga80sOJpab2u4TusAg-DTJtYOxJZQFNg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Sep 2021 03:35:20 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-sunxi@lists.linux.dev, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [RESEND v2 2/2] dt-bindings: usb: dwc3: Fix usb-phy check
Date:   Mon, 27 Sep 2021 09:35:14 +0200
Message-Id: <20210927073514.14334-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927073514.14334-1-maxime@cerno.tech>
References: <20210927073514.14334-1-maxime@cerno.tech>
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
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
index 1040d06cc0d7..25ac2c93dc6c 100644
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

