Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A96E3D10BA
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239130AbhGUNZI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:25:08 -0400
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:36675 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237527AbhGUNZI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:25:08 -0400
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
        by mailout.nyi.internal (Postfix) with ESMTP id C901C5C0140;
        Wed, 21 Jul 2021 10:05:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Wed, 21 Jul 2021 10:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=fm3; bh=QyKlL+wTQSc+f
        ZVHGY1kOa8Mvop81twS43JV0O8gebQ=; b=gASts5VfM5pUBAAj9810o7z9LrtGV
        y2BTMzYVrALW2N0WB3RhbdbP1m2Sp6LNblgiDBZLKF6/IVTK5Wa14e0oqEyb13Kx
        3hJ5n44szy3hiO0FMYSfRagyKpCVhjYY5TNLEx6DGYxl25KG5szAscHbuU7L+vdy
        J5rJfA22/lZWiAb+51qui75yUAFMJmTkqSZUvYA1IjXomzzwb9gGxwUHXXgxIWy4
        xLCGkDUq83huO3JmdJAWlLE1xqpvMCQ/kcajl/Ag13YEUfgNuKpc08IkqpTce3zR
        g6ac/afSHRe9hplO0DLRW44RZm+WbyM0c9s/IJU6RUybq2EiIiNhLllbg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:date:from
        :in-reply-to:message-id:mime-version:references:subject:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=QyKlL+wTQSc+fZVHGY1kOa8Mvop81twS43JV0O8gebQ=; b=oRzgK1vV
        pI4FaiqMv+GzR07VbYhXLUnXdZdxoYJs+UDHFoyAzjsJSQaCrQFpvDOUySJT9vpO
        hj2T7aYrmV2a5yt+xTNrqHyeg+swCj7AMgCfOcklB0e2D45joPXhY27yTZaHI770
        3mQJnspqPdyO7+TCiGUTdfTWyrhOa7ariY1Zr/IxcaDHFy7Cr6s6cj/MONyzD/xZ
        Gjjop1QzWdmc7zgFdDJ8ammi+l4aVzjSQYZzQCxYXt0kwTQrB/blWExfegT7ndeE
        xun9AGY4Q0Amv3BDCeN6adVI540rH3J4sUuGFT4ceQYbLoicuGR5BcX7VDLwGUdv
        qzJWKqXK1iZGLQ==
X-ME-Sender: <xms:tyn4YMTuZE_6l2MrqXlkj5Tg3EDatsxjIhyZtPi6SEIO_VdS4wg13w>
    <xme:tyn4YJzdI9nUfevjtLcxF9Klh2iDgkhZBJLu1PA-04ca7l-KOrL01LwpGfim3N_Zl
    IPXKGIL9vbp1oegdvE>
X-ME-Received: <xmr:tyn4YJ3bjzikaEX5lNea6FS9GXq0ASYFUY5AIzLN9sGH6danMhVUcBANglrU0BHNlgfCxDy37vwW-LXq-m07faWnjONHPYgWgBTk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrfeeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:tyn4YAD8LjTBedOeT1Wf0Y53yuM1WhMq6QYM28BqqDjB2sYmbwvFgQ>
    <xmx:tyn4YFgQrfpKcrYS1sQ_3gDsBkS9Ia8B2eaw5qmv7wgIVvEnfezAfQ>
    <xmx:tyn4YMqhZRrrJMz02FkZzDAPQfnUOM_TtsnghU-VhbSmW2tpX7e_UA>
    <xmx:uCn4YGXlEBeonMWNTUrZn-_yZcvdlSH0-4nr-wTi0e9AEmrx21hkdA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jul 2021 10:05:42 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: [PATCH 37/54] dt-bindings: usb: ohci: Add Allwinner A83t compatible
Date:   Wed, 21 Jul 2021 16:04:07 +0200
Message-Id: <20210721140424.725744-38-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721140424.725744-1-maxime@cerno.tech>
References: <20210721140424.725744-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The A83t OHCI compatible was introduced in device trees, but it was
never documented.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
index 0f5f6ea702d0..700e95262a8e 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -24,6 +24,7 @@ properties:
               - allwinner,sun6i-a31-ohci
               - allwinner,sun7i-a20-ohci
               - allwinner,sun8i-a23-ohci
+              - allwinner,sun8i-a83t-ohci
               - allwinner,sun8i-h3-ohci
               - allwinner,sun8i-r40-ohci
               - allwinner,sun9i-a80-ohci
-- 
2.31.1

