Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE2152F3830
	for <lists+linux-usb@lfdr.de>; Tue, 12 Jan 2021 19:14:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406502AbhALSNh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 13:13:37 -0500
Received: from mail-eopbgr1410102.outbound.protection.outlook.com ([40.107.141.102]:1624
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2406466AbhALSNf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 13:13:35 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P3YKsOzaIS/W6t6JXZ8agclDz+DF21rkYgtsx8z+GuXOftNnv6K6ZZHm2GKLif6Mr4ikTaEv74AZy335DFyC51ipQQ1S/oegRXLZh22w+ObdkeQjbxvajDSlBQNkE0xayt8URAueiWLu1FcwzUgsPBN7bXPDpQf3D47WQjsw2UXyPfHGcQQ3352ypSf7PuL+7TIaaSpO9nLcHxE7+wnK3yfDHN4c7Ip9/veQRpsOowruVSVJaVRLRit0lXqpqGYuzUy8anAy7h5HFcL7U3e1qtcs7kcU3jV4dI3T0ToDM0gZM5FTv1Z0h5w6EwFMPf5R/u1COd10Q8/rrs9vFMlw8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c25+ytTH9vN65hMGSXREsX2Dn6JV5tzFTxI8GqkP98=;
 b=S2/vuXeGR18U6lCvmMv1ZmwtsJtbRKIa8mBVS/wrPyuN1c7IUyjWpgX+y8KLYqsT+vhhjnnNwZhUV1pLWXqFOT7GLh5TWTb3u2DB7lkjTAJ/SCx2X6SE8iPwuKLvOtzHtYQ9ECNPFpgivn1Gjs4C2DMhR9Li7Jpqd4Of1MFIXUWVd/tHkOgf3Lt0naNccIxAT60kW9B57KCJ87un8LhzeV9Mh1sSNBoQIsu0iTMdbPIGZlonpFOhQo20gx12lBbeHitiVCujM8pdORTmz5+KmUOCfT9N/hpAL3MFyssJqNqu+IObJUulTfCtp5I3pc5xRX92FliZk4txSdxR+QWVdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1c25+ytTH9vN65hMGSXREsX2Dn6JV5tzFTxI8GqkP98=;
 b=TxzWY84utjU+n6H2zWdIPYHbcEe/S2FLtoUi6c3+Q6ss2vJNW/InufTXm7IVk/TJRz80UaWfRAnP1QYrvqmdaoiVkOuXRg4G3XdD/sBLmqXlRE7M6NHlVhsWREXp9ghPGRUuMvOO0uor77unG4RQuWEk/EIkTuY+L00IYLMhjCc=
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 (2603:1096:404:8025::15) by TY1PR01MB1515.jpnprd01.prod.outlook.com
 (2603:1096:403:1::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.12; Tue, 12 Jan
 2021 18:12:45 +0000
Received: from TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::fd98:4b52:88e8:e1ec]) by TYBPR01MB5309.jpnprd01.prod.outlook.com
 ([fe80::fd98:4b52:88e8:e1ec%9]) with mapi id 15.20.3763.010; Tue, 12 Jan 2021
 18:12:44 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: usb: Use OF graph schema
Thread-Topic: [PATCH] dt-bindings: usb: Use OF graph schema
Thread-Index: AQHW6PiQw87V9KubwkaTKh4U4cD7G6okSsJg
Date:   Tue, 12 Jan 2021 18:12:44 +0000
Message-ID: <TYBPR01MB530966F6B19239F08770DF1786AA0@TYBPR01MB5309.jpnprd01.prod.outlook.com>
References: <20210112153527.391232-1-robh@kernel.org>
In-Reply-To: <20210112153527.391232-1-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=bp.renesas.com;
x-originating-ip: [81.159.255.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d07c759-face-4241-3a42-08d8b725a8e5
x-ms-traffictypediagnostic: TY1PR01MB1515:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY1PR01MB1515FDEC497E48429208BE8C86AA0@TY1PR01MB1515.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RfN8gvg4wI0TEgdnuwzDRubDVTggBdOJRDDe3qui09kgOovJEn8m0iw50ZsfkgBYMwB2vCK3JPNKrQMAV9MLYXQV6VLDV6Gq0bdsQCfl/NUXw8EAnEI1a/qoxP0ZYoRMU45l+9DkdJlunh5POzBVRnlNt7I0vzo38k9/eXPUYKJOj7fYqWX7pZxR7CihjZovRLnur2ze9tbBKOAV4MN9IOPjRw474tO9tA/dLpttODNmwgGM8g/tu9eg5TmC2vqpFUfmTscNFpvZSb1fdMjyEIjw2rF8L7tiQcOlrQVmemJb/aQbGv94F+OCjUj6cnjM38pwht0ulbeBbSh2jMUkARWzXQfqSwk6DRxY6mZjsoAwvAkUNo9pEbFQTAKEuYlcFKHrUNAjEI3cEMDKh9QUug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5309.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(39850400004)(376002)(64756008)(66556008)(66476007)(8676002)(76116006)(66446008)(316002)(4326008)(110136005)(52536014)(9686003)(54906003)(7696005)(5660300002)(55016002)(86362001)(2906002)(478600001)(186003)(26005)(33656002)(71200400001)(53546011)(6506007)(83380400001)(66946007)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?VutSvlB43rQOsPHB6+YRNp9QfrnTu2cbbJmAxQLccoDLhy71SolHSQ+yb/Ci?=
 =?us-ascii?Q?DFXnciC5QBGcoSs31+bPuVWaECA/H0q7wzCL8y5SgHP1WLa8I+e1rotz2Gqv?=
 =?us-ascii?Q?FziiK3h8fp3NJ7SjcQV5DtwqovPQZojbqK8M8wD5XLLtIZJclRy5/hVoNBr4?=
 =?us-ascii?Q?CbonVoAUBD0pbvF41DBnah3YhsjSmxa68WXX17RCOp1TBaklgtQdC6PTRUAT?=
 =?us-ascii?Q?bwV2sMnKe5rIptcrT85YyISW6J0JfAoQ4o1U/KM/f0oZb5a7yCMAdSDKssI7?=
 =?us-ascii?Q?VylgVMShJdTwacx6di3SNmn6eJDvajjmp/dtlZcDusICAjDac4urBA8Pbced?=
 =?us-ascii?Q?mN/o71srVD1BkW2A30rCIQzrpDHRgGP95yCW6PRW5xMDz5HXgMo1yFosFO4M?=
 =?us-ascii?Q?q0cDyq5BZQlr2HxZmVEhg39CGiVtJ/DZv9D035RDfYTwLDRC07OcUJuNQ34s?=
 =?us-ascii?Q?YeddLW6x+ZG2pcj2gusMqJM0dUJgWQhijB79IA34voL0ttPS2XJZqBc8/xFt?=
 =?us-ascii?Q?c10tCDd+GfEBCExSEMFN3efibrmOrIXoFKprQRy2HZ6/T5hlh85x49h2dHQH?=
 =?us-ascii?Q?ICMmAaZLOzXn7fjnaIKc7M02QLr3jS2Ab4LAgLcnHs6pmp9ZdFdcdnmI3NbO?=
 =?us-ascii?Q?Up3G0DHC4xlfY2CIeplHd7PC4Wn92TV3kVgm2fKmgzJWVq958jsy+2gHyQNg?=
 =?us-ascii?Q?osYSi7INmL5fXV/oRti+wN1pzoeP6tIG0ADQH8yBD/W2XLwRtZp5DZL0yn5h?=
 =?us-ascii?Q?INYKobsC7CZqchasNZhBBVGlgCL4vrJTRmRQPpH1FfIOfZx9+svpaBSC6UIZ?=
 =?us-ascii?Q?5xt6c99T8voqkANbukTUSUqvf43YZ+PoD2ZYdBwqBAWIf4RRPzsqYoU1zftH?=
 =?us-ascii?Q?UWT1nzFoEu+9NBQj+IIFut2SeGQZoIssGMyR+l03evXz6DPv42TDyMinG2Xd?=
 =?us-ascii?Q?GJZVx5BYZD/Z5zSq3z4Lg9dCZK5tlPKdqOODIMoWa+I=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5309.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d07c759-face-4241-3a42-08d8b725a8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2021 18:12:44.6570
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AZ8Xw/jT5NahwY23pLlYA2agDUBx4oseGFWb58x6ySEWyVYtanPZoRP9x+o1KXCF0bI8F8FBCDsl5j06zsnBfZnYEQE/J2evmWahYjXBers=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1515
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Rob Herring <robh@kernel.org>
> Sent: 12 January 2021 15:35
> To: devicetree@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>; Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com>; Biju Das <biju.das.jz@bp.renesas.com>=
;
> linux-usb@vger.kernel.org
> Subject: [PATCH] dt-bindings: usb: Use OF graph schema
>=20
> Now that we have a graph schema, rework the USB related schemas to use it=
.
> Mostly this is adding a reference to graph.yaml and dropping duplicate
> parts from schemas.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  .../devicetree/bindings/usb/renesas,usb3-peri.yaml        | 7 ++++---
>  Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml   | 8 ++++----
>  2 files changed, 8 insertions(+), 7 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> index 929a3f413b44..9fcf54b10b07 100644
> --- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> +++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
> @@ -54,18 +54,19 @@ properties:
>      description: phandle of a companion.
>=20
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: |
>        any connector to the data bus of this controller should be modelle=
d
>        using the OF graph bindings specified, if the "usb-role-switch"
>        property is used.
> -    type: object
> +
>      properties:
>        port@0:
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: High Speed (HS) data bus.
>=20
>        port@1:
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: Super Speed (SS) data bus.
>=20
>      required:
> diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> index 52ceb07294a3..b86bf6bc9cd6 100644
> --- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> +++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
> @@ -26,17 +26,17 @@ properties:
>      maxItems: 1
>=20
>    ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
>      description: OF graph bindings (specified in bindings/graph.txt) tha=
t
> model
>        SS data bus to the SS capable connector.
> -    type: object
> +
>      properties:
>        port@0:
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: Super Speed (SS) MUX inputs connected to SS capable
> connector.
> -        $ref: /connector/usb-
> connector.yaml#/properties/ports/properties/port@1
>=20
>        port@1:
> -        type: object
> +        $ref: /schemas/graph.yaml#/properties/port
>          description: Output of 2:1 MUX connected to Super Speed (SS) dat=
a
> bus.
>=20
>      required:
> --
> 2.27.0

