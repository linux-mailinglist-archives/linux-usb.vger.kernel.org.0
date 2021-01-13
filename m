Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16D2A2F40D3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Jan 2021 01:57:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437204AbhAMAnJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Jan 2021 19:43:09 -0500
Received: from mail-eopbgr1320118.outbound.protection.outlook.com ([40.107.132.118]:50112
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2392213AbhAMAIw (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 12 Jan 2021 19:08:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VOYwFyQUo9OWhK8l6osYIWDzyUnvW8ehVD7dVvBXNU2fO2+gIvs/UFEQfkERSFDx/zBS0UNs5KizFDHMCnWNFUQlJqVk5drwRqt1CIzo33IIBNzhOUkb5R82Bgp4dV00R9JS0XsEb7a/k6gjMsr1QUEBM3EHBKLKUNxepbd1ySB1/IhnFa4IRjkI9XYWzEEYthASGlamohb478uIxDuYds84Xejusl0b1klPf67BDjU5IYcX8s7vdAi53QCF7iBu9WIWQxRvBJgbutIfx9KlXjI5mLJx87F3srfuZDtyeFrCOZV7s5vu1y6p9nJ6d/g5Zkng61cr/Mj+TQUJ0zcFrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNut+MAOOGCPfH2O9UmxnaeyOXaudK6vNWmLYxY+HVI=;
 b=CyyXC4bNgjR/CIH/UhVc7TSurFWAb2oorIsJVLpMPw+bIpijv1Mjno5wk5o5MiYi92tK1g/gq5Chs2lyAMGGfbu1/DEfhC/+HwzLtEluq5EJsJZufuXOxOsDw3L9jgS3Dhd1Vrl7+mXOtNpN0Ue/BStGO62CuqPz5UxFjZHmoIqUK/z6tgipQ4eVzkjooc4Czqk8iTTzYoKajT8VMWdmwKP09jNfwpHe8KpVvTliu8eBhpH1TgZeWzh1EZD64qSOLmgzZwAzo62ZBu1XGiGH2122hj6gYq2eyCb4V7tyGyzJ5jSRqFs6kD3L8sgMluvGN4PMxcHz4MGky8oAV/9DgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BNut+MAOOGCPfH2O9UmxnaeyOXaudK6vNWmLYxY+HVI=;
 b=m8TANk7i1fjbLEHk23FCjQqNx7M6v04KZS/1RBLqJehTCb1paXXN1v3ybEHvWbo+LXO2LIoIi6VTuBkFsRIVg5L46VSll/0034AWA2/KDQwfEL2XkwTFSbtn5BPOBUEimxl1TKDXKd359VGL1ZIvXMrx616e3nqZaM77zXe9TTc=
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com (2603:1096:404:d5::22)
 by TY2PR01MB3290.jpnprd01.prod.outlook.com (2603:1096:404:7b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Wed, 13 Jan
 2021 00:07:17 +0000
Received: from TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037]) by TY2PR01MB3692.jpnprd01.prod.outlook.com
 ([fe80::2023:7ed1:37c3:8037%5]) with mapi id 15.20.3763.010; Wed, 13 Jan 2021
 00:07:17 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Rob Herring <robh@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: usb: Use OF graph schema
Thread-Topic: [PATCH] dt-bindings: usb: Use OF graph schema
Thread-Index: AQHW6PiQZUs3aLKeIkG4TfOxjpCPIKokrdfQ
Date:   Wed, 13 Jan 2021 00:07:17 +0000
Message-ID: <TY2PR01MB36921199AF76D6AE7AC9BE35D8A90@TY2PR01MB3692.jpnprd01.prod.outlook.com>
References: <20210112153527.391232-1-robh@kernel.org>
In-Reply-To: <20210112153527.391232-1-robh@kernel.org>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [240f:60:5f3e:1:99a6:33ef:b98e:6b0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08751d33-1afc-4d03-4031-08d8b757304a
x-ms-traffictypediagnostic: TY2PR01MB3290:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <TY2PR01MB329024896F020FF31B6F6D5BD8A90@TY2PR01MB3290.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:632;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lYDoHzA4kzQyXp0nF7G1E0L9Exe4Hj3Gsj3yy84dF6tjGcugp/wXmas2JIcCkYv9R+ZebYEQDxoUJLM+jVfSuCJ8jdO8JyaydmnKan978OV2XcU0Tgd2n/sgII8NrGB0FzFlEnXHJDhqjqO/UmgaPhIARdRJhxqwXKvzWymSYTQo1RvFWbsYyjYbF9hFF6OcIl4l/9Gj1PYRGeviLaB6q836CCoVQhPSVJYVYNP7Dz2neGPFRnXbADduTTleY5hSC+sj5ZiQQTcEJKqfjNjR0EssSkLklVM51gcRi1vCb25yLUCP1Nn1zKG03GyruM0QT0g8PXBM3F/YiihsxtxpCg29oP4z2iKycKamjECGeUwYQ0l3be10EgwHIwQzTy0G4fzbN/AwkHYuE47pWO8mZg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3692.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39860400002)(136003)(6506007)(55016002)(2906002)(9686003)(66556008)(66476007)(64756008)(7696005)(66446008)(71200400001)(76116006)(316002)(8936002)(478600001)(54906003)(8676002)(186003)(86362001)(66946007)(52536014)(110136005)(4326008)(33656002)(5660300002)(4744005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gdzUD5uW3D8c3tDb9F+vuwrIv1S3mDsSHOZFUbhoH9AfyEHuopeAoINO0HaQ?=
 =?us-ascii?Q?NQ0GMwolggc9DVyfHxmIcxp5cOgHjyIxKSoBDT/jZfJmGcUe/kGuwiDtafGD?=
 =?us-ascii?Q?yIc4myYyKunJ0/fa03tG7gkLiAXufGI/CUbpCBwbaAi9ZRF75rkK6IC8hCGV?=
 =?us-ascii?Q?X3ciRvW6eQwP0C7EXxX4MSopSAWrAb5/1WpXfx8VXkiGlLcr1q+Mef8g2QO2?=
 =?us-ascii?Q?RPHIIH1LjamHkjVnY6ZEt3DcHqokYL1woMzGTXIrEbbrQe2/E/78oCM0lkdG?=
 =?us-ascii?Q?I9rPluvO+YSLsnqxKGtufts2+OiHW0quTNry/eU3QV5aSew0/moGejbiXP5W?=
 =?us-ascii?Q?v84efNKtsixbcTVUHRFV/v96zYGD49WXnTySCuHEE0BmH3Jh0y5gv/OJoxeX?=
 =?us-ascii?Q?8DyjD2HZzMNIE9VJg/EmvFxo9K75D8M6oHFGYxrGt4wQeoElj1FNaUCr/xD8?=
 =?us-ascii?Q?WhIil96NDex+PfZV4MV/TdqQwDKKZZGel32gUsk9/Mf8fhbUiTN3OC46S1x0?=
 =?us-ascii?Q?27QbWn9u7KG0plPEQLMbR7CcGT53EvsYjsVu3gy0m4yZutSjU4XUi4DaQrRX?=
 =?us-ascii?Q?Fgygh0qv4HYql/CF8S5XX6KLfOC7yZk6/xt/FUHvHHYgoKK+VaWXm/X7AqMT?=
 =?us-ascii?Q?ruHxRpohQcTKtwn+6+JMzineq1JuZ8sQXuY3B3cvooQAz8Wvcn8qCY9AyTd4?=
 =?us-ascii?Q?T91zuWRFvUTDEMN3pF4ktHYfzvRa6KVG92D5cwQHqT97tmX3CMGhHoK6J8+g?=
 =?us-ascii?Q?qhA/3Ta3c81eRwlCk/zJbn/POBeoZXN2dVU+PMHys/9fG346oiqI8knNgLaJ?=
 =?us-ascii?Q?PM2xlA+7y07pzr2qxg89S3A7SZRFdSD8w7MzPAakCbT8Mfs/YEy+IYBe6WuJ?=
 =?us-ascii?Q?mCvIeArabOW7DM4n3wLYiew3pH/hBxxiRC72D4J8C6fYyO0SN568VhBzuPih?=
 =?us-ascii?Q?7LRfdcs6MJnsHcFtmF548uKHG5pdthUm38YahpWAg3QRUhELMXeZAei+kJtq?=
 =?us-ascii?Q?Ytgkkt8JiADws65w0wWzUSgeCmJY98bxrZqF6mfBHAZD9ak=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3692.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08751d33-1afc-4d03-4031-08d8b757304a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2021 00:07:17.2385
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L/Q0ympBNgSTWFbkH8FAvJj89KqYNDiovn6KVK3wGhzZpfNPlH93mnQ/3xTkzKN7oOQaqCK9TMQkionLPAtUnv/c53T//n0GS5OrsebAu7Zsv4bXVWFIldKAq9iIlqMc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3290
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Rob Herring, Sent: Wednesday, January 13, 2021 12:35 AM
>=20
> Now that we have a graph schema, rework the USB related schemas to use
> it. Mostly this is adding a reference to graph.yaml and dropping duplicat=
e
> parts from schemas.
>=20
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: linux-usb@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda

