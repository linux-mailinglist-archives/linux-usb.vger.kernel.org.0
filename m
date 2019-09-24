Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0CDFBC880
	for <lists+linux-usb@lfdr.de>; Tue, 24 Sep 2019 15:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441074AbfIXNBi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Sep 2019 09:01:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35166 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408301AbfIXNBe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 24 Sep 2019 09:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=u4xEWx22Lrj2M+bfYCnSPNEFlhzX2MJ0DeWVCcXj/Zs=; b=m5KfwHUnEfajftth2nEmu13PEH
        dPvM05WqDEm0muFfWnsI5Ld5UWLF+kcZQpxGUXffftjBGhcE1nlYn5roZUEBWbUlNGJOGwD5Kpllq
        f+jgISAyMhKc3v4ff982cwv3RlTom34QpR0GS7BJUamU/q1gZ1QGOW5TN8Q/dAYv0VkQ6roZQgwMY
        kVq9PXV1hhb/nxJ/OTS3N/nu7XMhR4jxZXfeTzhZzx1kd5Dwzy+TMOLD1LzHVx849dvgBeh2ao1SZ
        1T0q9kdlcOnEUdo9wa5KYM2y+eI8gRz4fDR5eXt8MAop5iw0Sf4TBpILqhHyHfsLcP1hAajhwQFp+
        KIHhorqA==;
Received: from 177.96.206.173.dynamic.adsl.gvt.net.br ([177.96.206.173] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iCkRi-0000um-3o; Tue, 24 Sep 2019 13:01:34 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92.2)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1iCkRf-0001b0-SI; Tue, 24 Sep 2019 10:01:31 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>, corbet@lwn.net
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/3] bindings: rename links to mason USB2/USB3 DT files
Date:   Tue, 24 Sep 2019 10:01:29 -0300
Message-Id: <9ca2d136a1f79c878fff1208f9b536b0b613c0d5.1569330078.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
References: <b87385b2ac6ce6c75df82062fce2976149bbaa6b.1569330078.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Those files got renamed, but another DT file still points to the older
places.

Fixes: 87a55485f2fc ("dt-bindings: phy: meson-g12a-usb3-pcie-phy: convert to yaml")
Fixes: da86d286cce8 ("dt-bindings: phy: meson-g12a-usb2-phy: convert to yaml")
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
index b9f04e617eb7..6ffb09be7a76 100644
--- a/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
+++ b/Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
@@ -85,8 +85,8 @@ A child node must exist to represent the core DWC2 IP block. The name of
 the node is not important. The content of the node is defined in dwc2.txt.
 
 PHY documentation is provided in the following places:
-- Documentation/devicetree/bindings/phy/meson-g12a-usb2-phy.txt
-- Documentation/devicetree/bindings/phy/meson-g12a-usb3-pcie-phy.txt
+- Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
+- Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb3-pcie-phy.yaml
 
 Example device nodes:
 	usb: usb@ffe09000 {
-- 
2.21.0

