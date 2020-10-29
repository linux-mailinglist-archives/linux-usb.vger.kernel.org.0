Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAE6929E7BB
	for <lists+linux-usb@lfdr.de>; Thu, 29 Oct 2020 10:47:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgJ2Jra (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Oct 2020 05:47:30 -0400
Received: from mail-db8eur05on2074.outbound.protection.outlook.com ([40.107.20.74]:29664
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725980AbgJ2Jr3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 29 Oct 2020 05:47:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QGz/PHDL5/Bpzdo0AlxclH8FtGX9wXf9FDVMGClENHtrhkda+7FnCJli5q7jpMNGxJia/zJjwyOSTaJjNqWiZlT8xKJMIwPXxnla2R43Mv8zAqykbe0sN2oB/KxgIS8yRLnNCs8w9k9CMrbTyzSPCWt67/fTTN5GlBt22q/ir51sN5Zv9JxHhhCiCr6afi/wMTkZvtRihnXCuL9UBJZaMDt8vztIABw+mFlNQLojsN3w0I5rElreUYR788S07Gqh7kebDnJsFMAfPO+IzEI42pcEZETlNKb1g2V4hsxgqNEjzJCDiDWm62YTCxeV5LXBWj4z8SDzcrZt011Le+Y3Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPUCjzyLfAz5BeThXeFHHD9aIVmlUFPPpmP6ucK9BMI=;
 b=oXr3LIHfjXkgrtl3jvaW0rcE1iyIP2W9ifOJrdZSlBx83jQl8Sdh/tKnnbkzagC2zjYf2VJbSxL6DyN6ogY4z66EycZAfVLiONjiZuRI8k8BMPWDo5iYmqFllQPLEec5wHZU+3JHunlYo01sig+9wu22KQPFKWAN0Npa2lson28RriFmLLoRIfCxMgFThbNVwJshARFIYxhD1FSfLykAkNqWaBWTW4sIQ2g04dc0tSoX86Li3oF1gFTHvtzlXWcW6Sjbwp8JU2NBunWGMKinK0UHIiy71/qSFqKsCVfYJBbdyvvGmpaGI0uEmpNpVHq3lk2FKGdQFiIY/jNqCkuKeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPUCjzyLfAz5BeThXeFHHD9aIVmlUFPPpmP6ucK9BMI=;
 b=IouWSaM0uy/GyvGIXC27/UBimxHa0X1mBTG5yqeEoDcHzi88dRdaPAI2eGHXDOKdEVk95wAofvt7D/WAzNoLY0GTWVc6+03K/oEN9Z8/ZqpQRrHll9iQUZU0OK2Lhjuhyg4/Tva3OxHTyLalx/EXgNad1MmKS2kBKrnvWMMyddI=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4003.eurprd04.prod.outlook.com (2603:10a6:208:56::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.27; Thu, 29 Oct
 2020 09:31:07 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.027; Thu, 29 Oct 2020
 09:31:06 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH v2 2/3] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
Thread-Topic: [PATCH v2 2/3] usb: cdns3: gadget: own the lock wrongly at the
 suspend routine
Thread-Index: AQHWqA4WIOonarEPEU2ykg2qAptnwamrNoMAgAMlswA=
Date:   Thu, 29 Oct 2020 09:31:06 +0000
Message-ID: <20201029093038.GB30677@b29397-desktop>
References: <20201022005505.24167-1-peter.chen@nxp.com>
 <20201022005505.24167-3-peter.chen@nxp.com> <87blgoc93z.fsf@kernel.org>
In-Reply-To: <87blgoc93z.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e2b508a9-773f-47cc-bcdd-08d87bed5cf5
x-ms-traffictypediagnostic: AM0PR04MB4003:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR04MB400365CDAEB1D90D2D6B22088B140@AM0PR04MB4003.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iMwObR/jh0/b2rRHfRrj5rfYN+ATPvQ1TuENXKNGp2CDWWvHKxny/N0z5KKziIavjbpINtxCqrHJqHmvRt8iyLcQCg/fwRgHx+DyyW4iab1RF+bg81OZ/OhtG4sGhoEABQHpO1HDKVT7CAQRTr1T5fxQtnaOEEUFow63WzveHaiHggQiX7HJrThaoclfXD82mkv6fBN/LY3D8Hch6+hupPi3Kc+O2LgnAx2Ob7WiJPK6JfVN2PUY3wt8BISmch+BzV+NaaGrWUb1LHVQqet+7l7XzRorp5XEcZcfOWyFiZLEuNus+a7h6fPR6geb/jzs8Jt/IS/NaYbxnYjam7I34g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(346002)(39860400002)(136003)(366004)(6486002)(8936002)(5660300002)(478600001)(86362001)(9686003)(4744005)(33716001)(6512007)(33656002)(53546011)(1076003)(8676002)(6506007)(2906002)(91956017)(15650500001)(76116006)(54906003)(71200400001)(6916009)(26005)(44832011)(66946007)(316002)(64756008)(66556008)(186003)(66476007)(66446008)(83380400001)(4326008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: h6f3HvEt+yFvzBpIPgiusJZhA0VJWQjNDCUWCVsl4YLHAd2bYHZhazagsRGivaLU2JRrgOq+NscfeIOYQJYDjOtpCQYINu3bcNZFaythl3QTdtFJKE5R1/JycPCNqyZvSQfXIAmfO12yh8Lk91oQh86oT70+7PdjVTRRQEnlhWxxfHuO2sntnL1oE7mEtBHXOU+NanQu0TumG/l0M2awtoQ3wa8ojRz0mp5LEX8uYTLzIxpST9qn3unx6iV3XQLecQCdxWI9DeEmLttPtIfK5wWM+Gd9UNkSw9xMWTs62Xl8Phez9q7cCDz1ttLEd9emI9cPUl+nP3aVIsC0YmXm07HOLTDYvnoEG3CeUYeV1ZVASjI6P0+dKbcIABwtJNqZ5mdcFFLekR1Vdz6/CYNaVdskWxxIu3RWGrqzdf2WLP9pq/wokaHDWC+fvU18BGw8mQSCdc70SmuIoGlRlRPdjGWPbwQ6ho7XQaIlMedaApjWvEuQlE71hg2VDiKbHUHtynTY0TUME2OI4/H5XxtneX6Yr5tUCR9E7/my6mRgkUoLTwViReGan8SxFZStvW8TvlmOAqwDdJUIuatVZ+x8odz9c/8pxgZL/Q5xg0OfDWKOUHM/y3S+9PSOUXl7N4/IhaRlzwdq5dJydx9VasjDWQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <51587D5F80FD974198D73570752F8F3A@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b508a9-773f-47cc-bcdd-08d87bed5cf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2020 09:31:06.9571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0KKBDQQuDNWTmZlWajC4QQNb6G9ffeXhAyAYEQ2esB4FfRxVN+3ieK0lcRgIebxKIpoBtEAr6qCVGiQcm94rDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4003
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-10-27 11:26:56, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > When the system goes to suspend, if the controller is at device mode wi=
th
> > cable connecting to host, the call stack is: cdns3_suspend->
> > cdns3_gadget_suspend -> cdns3_disconnect_gadget, after cdns3_disconnect=
_gadget
> > is called, it owns lock wrongly, it causes the system being deadlock af=
ter
> > resume due to at cdns3_device_thread_irq_handler, it tries to get the l=
ock,
> > but can't get it forever.
> >
> > To fix it, we delete the unlock-lock operations at cdns3_disconnect_gad=
get,
> > and do it at the caller.
> >
> > Fixes: b1234e3b3b26 ("usb: cdns3: add runtime PM support")
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
>=20
> comment from previous thread is still valid. Missing __releases() and
> __acquires() annotation.
>=20

Thanks, will add __must_hold sparse checker

--=20

Thanks,
Peter Chen=
