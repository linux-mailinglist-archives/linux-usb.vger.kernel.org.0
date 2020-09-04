Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFC4E25CFC0
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 05:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729689AbgIDDXH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 23:23:07 -0400
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:42881 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729554AbgIDDXF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 23:23:05 -0400
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id E29FE84487;
        Fri,  4 Sep 2020 15:23:00 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1599189780;
        bh=FO/GvvPK88wYveqA4cy1JGNJmVuc1A7K+Phw+/GBSNY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References;
        b=yat8fNDPyAHgKTOtQJ1urvLTGXYvJs9K9PFiZ/SvtuAxTac7IFhGe2oU/iDZ6Uolz
         21z9JfaYHH9u+E5dcF/cqPzyWppfMrK57cup5lMXow5ZnJOhOVkfbLafeMDs4vFpyF
         OasC+Jvbai0xai1+HK7DLL7TKgJP0llAPhK23GEXE8JisXNovcCKVemBgcg0/CuW7F
         m6MB14xe5+IYPk8NhXK7yeNDHnNMyZNTeRKuhWMGrpLyhUMiSihT/kzX/q/PVP0GwC
         wy1MLgWF0ezsYXSUksJ7/CkQg09ODHG6ko4ufs+mS5P+VCuE93e0lrc1oIiuaLzu06
         HQ2FINndz8cAQ==
Received: from smtp (Not Verified[10.32.16.33]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5f51b3150000>; Fri, 04 Sep 2020 15:23:01 +1200
Received: from hamishm-dl.ws.atlnz.lc (hamishm-dl.ws.atlnz.lc [10.33.24.30])
        by smtp (Postfix) with ESMTP id 777F413EF39;
        Fri,  4 Sep 2020 15:23:00 +1200 (NZST)
Received: by hamishm-dl.ws.atlnz.lc (Postfix, from userid 1133)
        id BF2512A06EA; Fri,  4 Sep 2020 15:23:00 +1200 (NZST)
From:   Hamish Martin <hamish.martin@alliedtelesis.co.nz>
To:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hamish Martin <hamish.martin@alliedtelesis.co.nz>
Subject: [PATCH 2/2] dt-bindings: usb: generic-ohci: Document per-port-overcurrent property
Date:   Fri,  4 Sep 2020 15:22:47 +1200
Message-Id: <20200904032247.11345-3-hamish.martin@alliedtelesis.co.nz>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904032247.11345-1-hamish.martin@alliedtelesis.co.nz>
References: <20200904032247.11345-1-hamish.martin@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
x-atlnz-ls: pat
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

OHCI overcurrent protection defaults to Global or "ganged" overcurrent
protection mode. This new property allows for the Individual Port
Over-current Protection to be selected when required.

Signed-off-by: Hamish Martin <hamish.martin@alliedtelesis.co.nz>
---
 Documentation/devicetree/bindings/usb/generic-ohci.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/generic-ohci.yaml b/Do=
cumentation/devicetree/bindings/usb/generic-ohci.yaml
index 2178bcc401bc..5a68a647d059 100644
--- a/Documentation/devicetree/bindings/usb/generic-ohci.yaml
+++ b/Documentation/devicetree/bindings/usb/generic-ohci.yaml
@@ -70,6 +70,11 @@ properties:
     description:
       Overrides the detected port count
=20
+  per-port-overcurrent:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Set this flag for per-port overcurrent protection mode
+
   phys:
     description: PHY specifier for the USB PHY
=20
--=20
2.28.0

