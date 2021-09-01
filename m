Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25FBE3FD690
	for <lists+linux-usb@lfdr.de>; Wed,  1 Sep 2021 11:20:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243580AbhIAJVC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Sep 2021 05:21:02 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:59255 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243570AbhIAJU7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Sep 2021 05:20:59 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailnew.nyi.internal (Postfix) with ESMTP id 5424D580AF6;
        Wed,  1 Sep 2021 05:20:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 01 Sep 2021 05:20:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=PytU1BeOpjKoC
        sm+j1TMa4thWhCzz3InbcUDrOTPMy4=; b=OhUjXcVBgyv18WMuNtd5JXVagdqNe
        ig39Dj1HOTyzbYD2mEyNxsJ/uDNjllX/EqMwq3DMKQ6wPNFtq0A38esjqNbTEqdl
        275T+8ptiQ1Mzs85WxYdrw7aCC3AGvu+Iq6JRhepsBGusvICNwU5wsX86Ezt/c44
        t77qCBXYMFvV221UCOnLFWHjDtsZLsN3BDB+EiLuEpDa0i4mz1fDheyV7wNyPNRy
        5fOmy0si4204kJ30L9XSNMDCmnb7QNxs0IUeI9kAMkuKBPUEW470STffvxxSRjkj
        nR+AZGH3TKgGegCwEi3TM/PVGW7aqFNXsHqwnji0FWXDwfmOubaVmbmSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=PytU1BeOpjKoCsm+j1TMa4thWhCzz3InbcUDrOTPMy4=; b=qAXoqBW/
        CUhqWIzc7pHKpaOuDfu2a2b1WsjcHdVJlZrMtAyApn5hFq7v2l4turNuagW4kbN7
        ADK7XM4QXzUDu+UjWzxa66B6JgZho2T/lp5BrrqbuR/UGjmfRer7JS36PhnZKD72
        aZdipbAYQXUk7c4sf03DGQ6H/LqrVxu+GzzUwhng7+y3ZlMpxSntl7jfb4LfjgPP
        cbiSxAnBkVI/9tGrB3wfdW3FeDHMrJqG3/saTDHBLA0R3lJ88tdrgY6I04Srhflj
        DANTz431YAR9yYOqSx012PdK6o2Nm6sePNtSNU8cfXMyh/MTFdHsqK5Cw695Qqyw
        UTzle7f22N/M7w==
X-ME-Sender: <xms:wUUvYWyerl9f9KPcZOkaH_c1oxBN5m53anm9MY4MjM_EHfPHV0eEnA>
    <xme:wUUvYSSYNJuKouv0_Asyzgm5chTy_werB5aLVr20nrbgT8FvZrjjjWx4CSUsw83z4
    yjbTDOa_2DK-SHY134>
X-ME-Received: <xmr:wUUvYYV3pcYobgsiRqVhLvOlmkoX8UOi1j4aTwtLW2TDSBqPe7_0PVrECkCIIeOajD0-ZPLj9RS7gXZ3Iu6De-9A0S_5_BpOzwAq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:wUUvYcjNVAcuZ9KtBBWX4TyVJu5K0AjKvKwza1h5pOxZnyydA2ayGA>
    <xmx:wUUvYYASobDxX5J-g2qoeYQSvZUq1RKicDpi4E6w7vg1R9z4jVVj-w>
    <xmx:wUUvYdJ8GnqmKxjKhL0N8mikiYORzhe9z70M0G2cMB4EbQYo8C_H9w>
    <xmx:wkUvYYvw2OH2_8xmVN0Qxvej1z9y5ZkGfH6XrUiP_xoBL1zVrcNzgA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 05:20:01 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 37/52] dt-bindings: usb: dwc3: Fix usb-phy check
Date:   Wed,  1 Sep 2021 11:18:37 +0200
Message-Id: <20210901091852.479202-38-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901091852.479202-1-maxime@cerno.tech>
References: <20210901091852.479202-1-maxime@cerno.tech>
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
index 078fb7889593..c1c970073681 100644
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

