Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 139CF550934
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jun 2022 09:46:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231939AbiFSHqX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jun 2022 03:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229849AbiFSHqT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 19 Jun 2022 03:46:19 -0400
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A172E1009;
        Sun, 19 Jun 2022 00:46:17 -0700 (PDT)
X-UUID: 29a4d04f56dc4bb18650e726dc75ffd4-20220619
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:1a9a1524-5524-4d16-9809-21d64264d146,OB:10,L
        OB:20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
        CTION:release,TS:45
X-CID-INFO: VERSION:1.1.6,REQID:1a9a1524-5524-4d16-9809-21d64264d146,OB:10,LOB
        :20,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
        ION:release,TS:45
X-CID-META: VersionHash:b14ad71,CLOUDID:0f340e49-4c92-421c-ad91-b806c0f58b2a,C
        OID:83ca1b803afe,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
        RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 29a4d04f56dc4bb18650e726dc75ffd4-20220619
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1497243284; Sun, 19 Jun 2022 15:46:14 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Sun, 19 Jun 2022 15:46:13 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 19 Jun 2022 15:46:12 +0800
Message-ID: <bb460aa483cc888ffa36709d9e9c1f2e3be0e000.camel@mediatek.com>
Subject: Re: [PATCH 2/3] dt-bindings: usb: mtk-xhci: Allow middle optional
 clocks to be missing
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>, <kernel@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>, <linux-usb@vger.kernel.org>
Date:   Sun, 19 Jun 2022 15:46:12 +0800
In-Reply-To: <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
References: <20220617222916.2435618-1-nfraprado@collabora.com>
         <20220617222916.2435618-3-nfraprado@collabora.com>
         <8639e64d-c659-7090-2d0a-078fd96cfbd4@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK:  N
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 2022-06-17 at 18:25 -0700, Krzysztof Kozlowski wrote:
> On 17/06/2022 15:29, Nícolas F. R. A. Prado wrote:
> > The current clock list in the binding doesn't allow for one of the
> > optional clocks to be missing and a subsequent clock to be present.
> > An
> > example where this is an issue is in mt8192.dtsi, which has
> > "sys_ck",
> > "ref_ck", "xhci_ck" and would cause dtbs_check warnings.
> > 
> > Change the clock list in a way that allows the middle optional
> > clocks to
> > be missing, while still guaranteeing a fixed order. The "ref_ck" is
> > kept
> > as a const even though it is optional for simplicity, since it is
> > present in all current dts files.
> > 
> > Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> > ---
> > 
> >  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml       | 9
> > +++++++--
> >  1 file changed, 7 insertions(+), 2 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-
> > xhci.yaml
> > index 63cbc2b62d18..99a1b233ec90 100644
> > --- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > +++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
> > @@ -80,8 +80,13 @@ properties:
> >      items:
> >        - const: sys_ck  # required, the following ones are optional
> >        - const: ref_ck
> > -      - const: mcu_ck
> > -      - const: dma_ck
> > +      - enum:
> > +          - mcu_ck
> > +          - dma_ck
> > +          - xhci_ck
> > +      - enum:
> > +          - dma_ck
> > +          - xhci_ck
> >        - const: xhci_ck
> 
> You allow now almost any order here, including incorrect like
> sys,ref,xhci,xhci,xhci.
> 
> The order of clocks has to be fixed and we cannot allow flexibility.
> Are
> you sure that these clocks are actually optional (not wired to the
> device)?
In fact, these optional clocks are fixed, due to no gates are provided,
SW can't control them by CCF;
In this case, I usually use a fixed clock, or ignore it.

> 
> 
> Best regards,
> Krzysztof

