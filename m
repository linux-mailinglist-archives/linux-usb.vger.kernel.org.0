Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B5A92E8F1E
	for <lists+linux-usb@lfdr.de>; Mon,  4 Jan 2021 02:00:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727482AbhADA73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 3 Jan 2021 19:59:29 -0500
Received: from mail-eopbgr60061.outbound.protection.outlook.com ([40.107.6.61]:2182
        "EHLO EUR04-DB3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727417AbhADA72 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 3 Jan 2021 19:59:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJDQf7kgYNDMCuohPF4IxPOfjaGac4U9+82AuP8liKLxCHRHW69YvKMLJAUklChz2tOAl8NhC8ws0w1iWxadpQzuWyi1SR5TGETRuuzEOzano0gnNSvuEf45kXbKpe2ztO8F4TbLK0BsrMO6MNCgH0CEjCuLAI//OVoEEFJ1yXngf0Q4w9pczSyUYUq/arFe+2AJNukEe8O6Gjlm+JKRtXAQryatw4Tyryv2RQq/jxOfWpexKisx0t9GkZAbBYCDP6LEOeBcZcg57YlVBPtttTOuLW8Fz8rieocqvcgEejj/EyBJ+5t8uBIA7uvLyiMz4PfpPJxNAv+VTXowHh26Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wzdhYg3rIJjjEMExiYl/rS6d1+hZCUwwKTQJdlGaxw=;
 b=Tp2TgFDHcIt9r/sMl0Rz1IfdC2nbOrjkUm30LH9BnARRdKCYkvXydrq7/3bmzRh3EcwIfW4Gw9c89zvnMFGgDzWEIELh9fka7yPG9Kx9G1XaYazCT8NJAvv3LIo5ZXGJFAW1dG3vnA91DZVwu5v/YqYx6Rv6FQSnd5jdowpvg7tiE/55YIEvjylGI2BYW76h9gWUV9CbH90edOU31kedziDxSTpubc+ba/nY7OrOFCF1NrcvnaVHmUcI9LzlFgMpbHIn7KzJDPj3lY0mQubWzMo73J0oFnCQQGBVMaOUDLSAhcmpqyuZXjuJB4A2WbVtiRM2UVBYeXBsBbFDHTRh9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wzdhYg3rIJjjEMExiYl/rS6d1+hZCUwwKTQJdlGaxw=;
 b=ACrkuhWobtU3CfwzGzekgybSzizsNaeuMEP6BE1jUB2RfCWv58ywFX7hFBnDkY19+7lqi1nwToiLhaSCtbWRYQIMHoxumK+GNDj2fS2FNhLRbfLZew2ogwQxAX+caXcn1M7qiijj2k/unD2VoXaQJf+8lXMYY1idfbXFJf/9hXM=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB5660.eurprd04.prod.outlook.com (2603:10a6:10:a5::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23; Mon, 4 Jan
 2021 00:58:39 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3721.024; Mon, 4 Jan 2021
 00:58:39 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Jack Pham <jackp@codeaurora.org>,
        Peter Chen <hzpeterchen@gmail.com>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Chandana Kishori Chiluveru <cchiluve@codeaurora.org>
Subject: RE: [PATCH v2] usb: gadget: configfs: Preserve function ordering
 after bind failure
Thread-Topic: [PATCH v2] usb: gadget: configfs: Preserve function ordering
 after bind failure
Thread-Index: AQHW3jSDJEn7axlTWU+hleDcCLorG6oQ/BwAgAJOiYCAA2FXEA==
Date:   Mon, 4 Jan 2021 00:58:39 +0000
Message-ID: <DBBPR04MB7979B180D10CCDB1E2B4C3B78BD20@DBBPR04MB7979.eurprd04.prod.outlook.com>
References: <20201229224443.31623-1-jackp@codeaurora.org>
 <20201231100122.GA12514@b29397-desktop>
 <20210101211737.GA29962@jackp-linux.qualcomm.com>
In-Reply-To: <20210101211737.GA29962@jackp-linux.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.65.210.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7d5879f4-5562-4456-8c08-08d8b04bdfe8
x-ms-traffictypediagnostic: DB8PR04MB5660:
x-microsoft-antispam-prvs: <DB8PR04MB5660E63F825650A110A9C5A78BD20@DB8PR04MB5660.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SSrHBARbMbr6kifW7DxCYarJsKjk1pmu7bNbQjUtQOX8U5a6WamCGAyd8ajrW5V/C4U0CFH9YCmZ1JDdp/LDjiFE0S5etXph8sCNZA8TqB8mjE8q+FqbVGlhyZxClAo2BAmVIfYxL8RTh7eiwBXgBp51y/PBm5INos0oo2tIo6HOOLaX107ml1Auu1wnWMer8vebrNOChrxfKYTy4GHnB2pPDtLiiQvn6saNVwtjW0erfcQDI2G1LMUkophyd7FoSVGpKIWQwGLB0Kh9HGz5JZWS1cMjRvFh/HPZ+AG76/hVdKIRVIWUae/xaugTllkDJKBD9E/NoVKDD/+HhZcqzr4BN9ff31/Hoh2e/FOOZvoiUxL2KQC6yoWorwHtERPPfMVK7oBIJ+Tzd1mC0blfKA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(376002)(396003)(39860400002)(346002)(26005)(54906003)(33656002)(52536014)(186003)(110136005)(55016002)(86362001)(9686003)(8936002)(7696005)(316002)(66476007)(478600001)(83380400001)(2906002)(44832011)(66946007)(64756008)(66446008)(71200400001)(76116006)(66556008)(6506007)(8676002)(4326008)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?gxfGUkD89K5E891SoxfYEJhF3xmP5WmVWjsu9s9zfwU3fqws197UIeEQhz57?=
 =?us-ascii?Q?qbvlHZeSgbtSuss6fFz1zXPWD4j2ouvN9AkY3iTZ2AIYkNG36FGGiT3CVGEG?=
 =?us-ascii?Q?vnEYlj44No8a0dOEE62UuZErdN7pG0RDJL4uFcwg0Ns8Xn3DzAKkSHmMP8QG?=
 =?us-ascii?Q?04scLZuJRG5FT7KR1xzMevsUvBKLXyWpWyX1n7YU60y0Ze+BaqAfX3ocjBW6?=
 =?us-ascii?Q?/LJWS5UfwdbE2xgIEErBqOXFnUtzsFzajFyONsrTjEpChtP3+DQ9tfbZFawm?=
 =?us-ascii?Q?HrkLOnMHFzcODqXDzoySTdzdDClnixZq8Rt1je4KjpzIMWu52hJK1qi9E2PZ?=
 =?us-ascii?Q?cNiUWpL/QVDZ2abVPpXOguyYCkN6ee/9b+jW2CaX6yUKuWWLS4qAx+b18knq?=
 =?us-ascii?Q?Q9nwTzH5ZKWQO0cnyuiqE0+k5UeGyp9/llt7kPV8dknEnTG0FVkijmyC1Ek9?=
 =?us-ascii?Q?AJuYoqOxc8dtwOr07KTwRLYN4Hig8CgIPr4zBM2ouPpa4ocQGCeQaWu8s5pD?=
 =?us-ascii?Q?LFjUcH2GE/7sgnb6kH6jCmHxAzGa3X4tAWgW0hLwOjikgsrVNYVOAH3/83ya?=
 =?us-ascii?Q?K7RUYrZ5etvSuv3H2c+fFVHroqq+pdUnZ3b/hAyPYOejQ0L7kQWprebxYfK8?=
 =?us-ascii?Q?YYK1XqENnVvxpxxaIOp/GVzm4iYmWgbkvHLdTdft0BiWEHKOUbQ2LDsP42YK?=
 =?us-ascii?Q?5IxsHB8HXBUj/ly71hoVOKWe9OYDaMgtQBMgyxEix5ozHP12M9IYL+1CY+yf?=
 =?us-ascii?Q?Gi9518d+zrnffDr8lKQv09f4A4NTdNs5MqfcKPvQaDXsY1gaMGF3+Eok7kNp?=
 =?us-ascii?Q?9INeZ0QNUlk0ORy8YrraWFZHBYeZ0EArPrXr4zRxPSPBHXT8d1PfMmPH1sIo?=
 =?us-ascii?Q?UUZ0NaaIQA4oWLJmua/vOpWe306FdKzduAzC1/Gvx3g5ZcFfnPKDWbrwOao2?=
 =?us-ascii?Q?Ys+D6i+VOoACo5JL6f1GYtybwXu3Kfm9wDvbGsPhFXE=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d5879f4-5562-4456-8c08-08d8b04bdfe8
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jan 2021 00:58:39.8052
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QeoWsXLrH3TgR+8eTGAflzxKKtrYGbwbusJNvjHgTwxYvuMxp8L2IL0V1OcT37tchhdAJMV0rzS5vyWNuuYYtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB5660
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> > Hi Jack,
> >
> > I am curious what features are broken if the functions are added with
> > not planned order?
>=20
> Hi Peter,
>=20
> This is mainly an issue for devices with functions that use vendor- speci=
fic
> instead of standard class/subclass IDs for their interface descriptors. A=
ndroid
> ADB and Qualcomm QMI are a couple examples. So host interface drivers
> would only be able to install or bind based on matching VID/PID and inter=
face
> position only. This is true for both Windows as well as Linux (see
> USB_DEVICE_INTERFACE_NUMBER).
>=20
> So if the gadget's function bind order gets jumbled up from the intended =
order,
> the resulting assigned interface numbers would be different and the host =
would
> not match its drivers to the correct interface. Instead we see the host d=
river
> gets bound but the endpoints it communicates with are wrong as they are f=
or a
> completely different interface.
>=20
> Thanks,
> Jack
=20
Thanks for your information, jack. But does Android ADB has specific host d=
river, I am
assumed it uses drivers/usb/core/devio.c, am I wrong?

Peter
