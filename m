Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C82A2199A3
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 09:23:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbgGIHXP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 03:23:15 -0400
Received: from mail-eopbgr80051.outbound.protection.outlook.com ([40.107.8.51]:46339
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726006AbgGIHXO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jul 2020 03:23:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ik4BMEtrGBJjxAh4c3MuqaNrgi10oxwJINujTOI/HdTCSByTvHd7NWUCMEbx4OikjqEA9JavB3/W3EGIdCT2ov+fVRoUTkPR+gZxTFjmTSJh2Q9qf1E3JV5X68zruAez+Ii52G2Z4fH6S6f0JebtyYVIG1pC9GR3Y6mpHfWAy4JTbc+Rdu9WWXOBwTh2PXKajRMC1uXueDS1J2oh5sVtL/4xOJPcXZx+XGriCxd3gXBLOn8dC5+Pxo28BtrHc9DAZf0KtIzqYJAJb1PhgQ57t6m+L7uNVZ3Hmig8znsTOIs/r92SDX0IzDOEEg6geTeOP4l8Vyu9pkdL8KoVgZpm4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fEpkdSMwpa70y9Va1ncTlWwf5XIT9ssXgjZ4+jVRJc=;
 b=CSQyKsY5lPa4DpRpFKBpj+JYHX/SjgEjp4hlbdkUv6O+NfInu6GhDHDllZBEwGBZjGnBqtdO6BawZ9FhBOuhXrh3al8qpfuDOfgDw1RBMxyFMxNhKScVkMfJg6yH3t9ynXVbfC0+YSjJ4aenqdNVe7BXp2F/W1fwAZW2vCoRO67hVkl0JeAScPUwkO+xVEwtUGi7NvhInMyFaFy47JLUl6rXAzsAmNnk1qjs56zT97hLTr4tjEX1i0pzN7ozXo1aPhz+UkdzBHscVwcOHhrNmxJZ9wJXynWP0pE261xJFKXVEwr57sQEQytAghnbXBYnMF3M/nH7YvaFZnLRyGFkOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fEpkdSMwpa70y9Va1ncTlWwf5XIT9ssXgjZ4+jVRJc=;
 b=pd3Lei7ie3ojvxCfLIOLLN/yDFL6JknJZ7t06AbnaLIykIUO1fbTLfK1GPJ7loqZYufcoKi8AXgIXt6OH6WjwEd5j7bu4j1kG4cAx31U51SdY97zV0Hw62MPWTT6gnEDMw+JfZYTN+QYKxy9R3btf5kLVBacbfPPmmjCH1YFjdg=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB5622.eurprd04.prod.outlook.com (2603:10a6:20b:ad::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.22; Thu, 9 Jul
 2020 07:23:12 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1101:adaa:ee89:af2a%3]) with mapi id 15.20.3174.022; Thu, 9 Jul 2020
 07:23:12 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>, Benoit <benoit.sansoni@gmail.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: gadget mass storage with two USB OTG device controller
Thread-Topic: gadget mass storage with two USB OTG device controller
Thread-Index: AQHWUJxdsyfCKA187EKrFqj5oCUvDaj0rfUAgAooJACAAAwmoA==
Date:   Thu, 9 Jul 2020 07:23:12 +0000
Message-ID: <AM7PR04MB71574B7256939ECA27B50CEA8B640@AM7PR04MB7157.eurprd04.prod.outlook.com>
References: <8f870ba5-5dec-e362-51dd-65311315f6f2@gmail.com>
 <CAH8TKc9gaebqZOpv0OFxG-Dq+Tj+FdgJamQ=eP4SMJ-eYBrkOA@mail.gmail.com>
 <391a537e-108d-210b-01be-c20dd9d0e68e@gmail.com> <87o8op6vl9.fsf@kernel.org>
In-Reply-To: <87o8op6vl9.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [222.67.222.179]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 7562ac12-5a9c-4e31-5785-08d823d8f075
x-ms-traffictypediagnostic: AM6PR04MB5622:
x-microsoft-antispam-prvs: <AM6PR04MB5622F22F74ECE7CBC4D712908B640@AM6PR04MB5622.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NzrLPvUwLvMW512maLm44qkZ7B62h9uQktM83BP1QWYEZVX8WQyJIZt1/msHHooS9U+ffiDmtb0jO/gYitSeF5P8dMWmxAiUz56uiHc/iIZQUxdwN0aRbdymd17VXDaS02b6cXGMdArdklMuDfpfG0Mn9pxU9HWq33ciEiZ1jUBk1iTwbCI/Ffcvrc3PSerc3jJTowiecFliUR8ljqOW1HDh0zMsNKHGO/UfDY3jJS1p9M1H/mil2JkWn7k1hi1cDrzguJ5X8DLfEtRFwmCuqMFMMBFXYeRB1g4ejAXkOWeUvwIT5yAtGZHSFsnVR0GSCPy9KaSH/+uG7xZj1kb+Ug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(66946007)(8676002)(55016002)(9686003)(8936002)(66476007)(4744005)(5660300002)(64756008)(66446008)(66556008)(52536014)(186003)(478600001)(316002)(26005)(110136005)(6506007)(44832011)(2906002)(76116006)(71200400001)(7696005)(33656002)(86362001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 6Dl2MXmHheJ5hMOd6EWl36vzYLgIXZymF7e8NIkGPDJusIEsWdFdlV0uSutBjWzq5UilYVeotkv6UG4UHZ5MGrpyS8nuSoFjcVnuglbiA6zubraeFBqkewvW/euwxmRZxhz3wJbpTwB7YGeQ3/O7cpv+I8OQlN6+8Lu3vOOFH4C5VbdO1K8/h8Sjc8BSSekHIlfiOOwhWUzyZlasHlxxgExK6KDRTcGCQSlSTQlqesj8GPY1+MBWXMlz/xTGJXXVvWOezrjiAJhDGccs0sIE3baztTNYdpqGgfwzq6XK9kNVxwCNs2u5lSOaL9ENlpQlRgAMOE4RX9PF9Iyn2eRlzcUW//s6mukAvB/D6AsLb1rGoYmDBVOIo5UU9+bLASD0kF0ijjrwUR2GmH1NPxr54GLGCInWZOJIC6+I6mZ5cUGJ/V4EgUCtXkRsU5Oz8uljPtCWvmuQWWt6Cqt/VLMAWboyY42KVewGZlVhJvzXcpyY/1CP0a27b5W9HpEvaUZ/
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7562ac12-5a9c-4e31-5785-08d823d8f075
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2020 07:23:12.6318
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rEoHx2Vn//b1lCPpDqc4hL/4e/gKLQSU9XWTBh+Lg9OBiKlarkSPxRlLZYOAl5lEcaqVTlTmrhmdIM8sQx6xFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5622
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=20
>=20
> Benoit <benoit.sansoni@gmail.com> writes:
> > I am in fact a newbie in USB OTG device mode.
> > The configfs is really convenient.
> > It works like a charm.
> >
> > I applied this configuration below and can see on the host the
> > different mass storage.
> > This configuration can be set in boot init script file.
> > But what is the best choice to apply this configuration at boot up ?
> > (I am currently using yocto.)
>

Try at:

/etc/rc.local

Peter
=20
