Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D167D28181C
	for <lists+linux-usb@lfdr.de>; Fri,  2 Oct 2020 18:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388126AbgJBQjM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Oct 2020 12:39:12 -0400
Received: from mail-am6eur05on2061.outbound.protection.outlook.com ([40.107.22.61]:62943
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726017AbgJBQjM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Oct 2020 12:39:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAi+pNKguh5hn089TBoAReKvQlpGfy2JmT32Qqeyx80idmeSaGGm6irUYQqvPK9ZnbsbcrP4RHV1v6/mbCYYWBfk24j7TFoh6GizXgpu2fw+SWSXJx+5EHRglko+LtCp5KS9Wunh74G0SlkjRmWhYWK84mXBrx8vSvdLrK8s5/PYvTGvUPROVrjy7TV1Fq2kdjofKxCO7fDpL73jJfPgqlE+U2omseoYaTp4zDQQ07B7fx3hDWnjvvwoEo3svsln7RmiZVYWHCnuDtp+iPO80526LLvils4fhEIDyEONF4G9VMm7xlP2xmbUR+NlYTRkv6kHcWcCWxPh26aQFwAJ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gv4iEcMYx0OyvkqEPjT+zyiD0KFIWrrQgQNvESD/3U=;
 b=LB3xgkHYi5eBxcLSuBzN/nqLlRCsBHjAvECHPFy9QjF3D2ZVjzyHobMHu4y1gC6zm1nK6uw/sk/HSkhEi4LTfBz20o084o+mMxCEAEO2Zt++kfSj5+ve+ZVdlul1V8crducHp5TGVyJXFigHc6NtAPqY62jbH4ooe1WiMqjmUCt2ZVTb/L8l4IsOad6UcTLNWZWJUu2rVVQEsguEtFY16em9QhWkHa8++urqNps0MTpoLLn0uW9qZIcLTevksiZHp0jX1WX7OI44BN/NxnyuwiKl07GbVJeJidJJHM7CtTzNfiUpSnErOG+9LVHw90ybPJlbSX5lDRUhyRJzVS4QSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gv4iEcMYx0OyvkqEPjT+zyiD0KFIWrrQgQNvESD/3U=;
 b=ZCjQJWvG6huMj9jM+yXv1HtbImfTttgytlbazbdGnWgv8VE9x29pCsfGUx9uWU5dNwDW/DFFdto0VSC4hpkBlTaAuiS3MW9BawR/IspXEiM3/E6HrfzXhEohmNHHMzrrhqdRhm/5M6CuDE7t29DDCAVceo3vAKipIEFIXz5Z0F4=
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com (2603:10a6:803:127::18)
 by VI1PR04MB4063.eurprd04.prod.outlook.com (2603:10a6:803:43::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.34; Fri, 2 Oct
 2020 16:39:08 +0000
Received: from VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7]) by VE1PR04MB6528.eurprd04.prod.outlook.com
 ([fe80::acd3:d354:3f34:3af7%4]) with mapi id 15.20.3433.035; Fri, 2 Oct 2020
 16:39:08 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "balbi@kernel.org" <balbi@kernel.org>,
        "mathias.nyman@intel.com" <mathias.nyman@intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Joakim Zhang <qiangqing.zhang@nxp.com>,
        Horia Geanta <horia.geanta@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [PATCH v3 1/6] dt-bindings: usb: xhci: add property to disable
 xhci 64bit support
Thread-Topic: [PATCH v3 1/6] dt-bindings: usb: xhci: add property to disable
 xhci 64bit support
Thread-Index: AQHWkM61QrKLPu36k064JwjfY8gEcKl/9jEAgAScaLA=
Date:   Fri, 2 Oct 2020 16:39:07 +0000
Message-ID: <VE1PR04MB65289A63097155D84736D64589310@VE1PR04MB6528.eurprd04.prod.outlook.com>
References: <1600771612-30727-1-git-send-email-jun.li@nxp.com>
 <1600771612-30727-2-git-send-email-jun.li@nxp.com>
 <20200929181108.GA885311@bogus>
In-Reply-To: <20200929181108.GA885311@bogus>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.68]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b157fce4-35ec-4bc6-d364-08d866f1aee8
x-ms-traffictypediagnostic: VI1PR04MB4063:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB4063769CB4AF379AC7DF704F89310@VI1PR04MB4063.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: R+qWEwUWRKlTf9oKCRAY+jen/1gkUSp1n5TNqWu8UhZEuFQuK6v9nLTY+EedhKWonBpiuWpsA1bkHgq+fuV4qMrzvseeudeHjTKwvGnHDfKpLekVt/CJIU5ImEq1Onkef3RQju5Jx7SamlI6SvbnpduxmCSwebzZVRRdW2/pze+AKXP7gwRiPwnRsI1iGMuR9YJrIhXoi73xC1Rlm50pSwsBUePLPjSVJ8jIeW/yN/MxcoC8IwKjVHGwoHHpqGZtPB1ofqFM5bhZ4hgznLWHn8hW91VpG62nToaIv5seHfP7rzjelZdnX6ArGFJYCc+glupI5ZpCRwJS37czKvHoHw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6528.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(66946007)(64756008)(71200400001)(83380400001)(76116006)(2906002)(66446008)(66556008)(66476007)(33656002)(9686003)(5660300002)(6506007)(8676002)(55016002)(7696005)(44832011)(86362001)(186003)(52536014)(54906003)(4326008)(316002)(8936002)(478600001)(26005)(53546011)(7416002)(6916009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: ysOmlDiXtcO85rI2KJ2PLDAeoCjedFyhtIS1ZtByIvDRNgQ6nGkV3Qm7shI3GamxzyVv/QEITulD7B1vKzkxKVk1f6ETKDqApbPtY0XCtIOLiYTlO6YAPHJj8Dm668tiDt6K+hsZpI6Zt9tOR1thf+Sqxk9HkYebZaj82dCWWXCRIxMdu4jnSLA7IWTnA51UtHR9m0qSUa1xQu7lAZuLhUjCn5EW1Wr5EENnUMTG7dJLB4KRvCaXkc7dFUArXK8zMCv6t3SnppOwvIT+uCQRYh4o+3C9BZzBqHW6qcIRJradTcW0MW9Gl/eIf2jJZERYY/+djQU7ifCFtHfXxeSDemjpDyiw/RR+gmr9ZMsRuRwYzHyEg1nUSRyWtUbfi0umXpNtiIG4DvTT/Mjt77VxcI/ZtrIywe81oXlec82ChARcvrV1sKGKtrY5TRlKpek4Hyvi/LWQj5TndwA6OmUivsxfITzXF08akwdrhtgXuDAjsfw0VY6FiA0lRD+TjatqC7IfV+9fiReXZeOptSoDKY8/5oWxbcETREaAhcRSDnAzg1yuzStlvi1A9G08Btm6aqx6xqd+RCZlA6DW6iMsZx2FmrBf3NULZpwGZjJcDXaEt4J00WTHe4G1X4MIDRYT18k2PS+wPYyq/u1S0QtxQw==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6528.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b157fce4-35ec-4bc6-d364-08d866f1aee8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2020 16:39:07.8561
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OfDzdoWvd9bY4oSQDuZFzPo5Kbhu/mmUyU+llGGt6yxC0+C6e3O93N2aOcrl81hq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4063
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi Rob,
> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: Wednesday, September 30, 2020 2:11 AM
> To: Jun Li <jun.li@nxp.com>
> Cc: shawnguo@kernel.org; balbi@kernel.org; mathias.nyman@intel.com;
> gregkh@linuxfoundation.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; dl-linux-imx
> <linux-imx@nxp.com>; Anson Huang <anson.huang@nxp.com>; Aisheng Dong
> <aisheng.dong@nxp.com>; Peng Fan <peng.fan@nxp.com>; Andy Duan
> <fugang.duan@nxp.com>; Joakim Zhang <qiangqing.zhang@nxp.com>; Horia
> Geanta <horia.geanta@nxp.com>; linux-usb@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: Re: [PATCH v3 1/6] dt-bindings: usb: xhci: add property to disab=
le
> xhci 64bit support
>=20
> On Tue, Sep 22, 2020 at 06:46:47PM +0800, Li Jun wrote:
> > Add a property "xhci-64bit-support-disable" to disable xhci 64bit
> > address dma, some SoC integration may not support 64bit DMA but the
> > AC64 bit (bit 0) of HCCPARAMS1 is kept to be 1.
>=20
> Use 'dma-ranges' for this.

Thanks, sent out v4 with dma-ranges property approach.

Li Jun
>=20
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/usb/usb-xhci.txt | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > index 0c5cff8..26446fb 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > +++ b/Documentation/devicetree/bindings/usb/usb-xhci.txt
> > @@ -28,6 +28,9 @@ Optional properties:
> >    - quirk-broken-port-ped: set if the controller has broken port disab=
le
> mechanism
> >    - imod-interval-ns: default interrupt moderation interval is 5000ns
> >    - phys : see usb-hcd.yaml in the current directory
> > +  - xhci-64bit-support-disable: set if the AC64 bit (bit 0) of HCCPARA=
MS1
> is
> > +    set to be 1, but the controller actually can't handle 64-bit addre=
ss
> > +    due to SoC integration.
> >
> >  additionally the properties from usb-hcd.yaml (in the current
> > directory) are  supported.
> > --
> > 2.7.4
> >
