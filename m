Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 51FF53D10B8
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:05:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239126AbhGUNZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:25:06 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:54511 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234757AbhGUNZF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:25:05 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id B91EC5C0211;
        Wed, 21 Jul 2021 10:05:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Wed, 21 Jul 2021 10:05:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=1hxm7ZvxSBW/e
        Lxiajgn9WDyphDoFaLHCugmnFnH84Q=; b=dGs66b+eJWSoYMeJdW0tmFCV4BOjO
        Q2sbpxI5Pn+EK5Zlnzg7MbC+1JnO9lyjWMvgs9fO2IcJb9cU42CbbmyIcZ3zafff
        ud01j5nOXMA6MRJ1AXuC3HDml+rzJWGz+JyeNEkI5XmnAdYA8lC8x3ru4/LxzTYI
        8njyrAVnZoUB03jXkaY2jGEu90HXIV/gk5QLrqFDRHjTNeSB0vey6xIe4swcSDkI
        T9EaDnQ6xusRXeO5Lf4IgOyxRJTvwQXzKcPkBhx/g4zMLF6Y1EvnTQF0ipA++nr4
        c1n0DwXajiFnfW+BUso7HHX3r1NobuCyY+qhjeAfBOM4QchKPPFUKJjHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=1hxm7ZvxSBW/eLxiajgn9WDyphDoFaLHCugmnFnH84Q=; b=G1htRB69
        TfuBok2YYhwT/dRHrag3nmFwP9DNJzZGqGmTFjyL5Gs0M3PhAZ1/HqVb0w0RR5xO
        OVChuKzywDB5506Yhsb9h1FdgGfSIpTWPmOOV2RqgGlVcJFyquZ2f/tAJT5ihsWp
        eszsRivJRvUbsEkFAL8w5UMkQZazYYvL5YzlysZi37VKEo/WKA0LzfG3M3daj5cC
        f6ok2G0TUCx3hyhYZHER+C4CNVLxbeNHyIDpsOL9+NpiqJnMvfREUoD6dsGXEdNN
        W2AbXYqbGoQkNKSU9RasMc1oLlE47i7WRgqMdrV/VqFQhXfQcPqX+6sJHBZFlkcC
        eBykcZ7PLOy+zQ==
X-ME-Sender: <xms:tSn4YKZwH0BVwB7k7dEy6WujEiQOIthJPxPZpAt2-5Md-ztUi7AHtw>
    <xme:tSn4YNY2lqH9i7Lt-zJoV1rioHKnBa5oP-7jo2OxDR-RpCJ2P0PIHI4Dk1AQ_UBn3
    TgbZrnuNITwTFpGJbo>
X-ME-Received: <xmr:tSn4YE_14dqwRN77mkA5HhUAbVSSMTPhGsjW0wLQr_1q6S5oONrbka37C5pzEJosNDc2bV8YtVkTtujM-B9Lw01Ucv0Ub83xt56->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tSn4YMrYUSChfI14iNTrqBBMXdw3V7MeR0UPykAx8_uq-CoYgO_9Yw>
    <xmx:tSn4YFqOGo7Cqck1xY0okmRuvPikR0tGXWk_IGWBeEyzeV1cMYNGmA>
    <xmx:tSn4YKQUEiX7rcDN2Jthx7YnpIkfG3iuBZyEicKawgVzIkL3xSAoGA>
    <xmx:tSn4YJfPxFbVKKJpKg5Ru1EEEqZ-8H6EqMpKJNOM8bJTxrS4aAF_Dg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:41 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 36/54] dt-bindings: usb: ehci: Add Allwinner A83t compatible
Date:   Wed, 21 Jul 2021 16:04:06 +0200
Message-Id: <20210721140424.725744-37-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The A83t EHCI compatible was introduced in device trees, but it was
never documented.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
index 8089dc956ba3..19217a8fbe22 100644
--- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
@@ -34,6 +34,7 @@ properties:
               - allwinner,sun6i-a31-ehci
               - allwinner,sun7i-a20-ehci
               - allwinner,sun8i-a23-ehci
+              - allwinner,sun8i-a83t-ehci
               - allwinner,sun8i-h3-ehci
               - allwinner,sun8i-r40-ehci
               - allwinner,sun9i-a80-ehci
-- 
2.31.1

