Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4D6E260B94
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:11:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728625AbgIHHLq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:11:46 -0400
Received: from mail-am6eur05on2065.outbound.protection.outlook.com ([40.107.22.65]:1153
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728562AbgIHHLo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:11:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=irz2kmy749XI7heaerk53RhOpRRmHO0f90dNJ+smAlKUUhhaITKGlOdGRGGVrbtkzITjJbuUBGgxVZCEyHv1MFGrWOy9ucafH6p7HdQxg8peVJVm3vj/qCyEAZOlYuxIK1CKq4ywaB5UZLQccyO4aBdPwNWzxyGjavWgsgUd53DDTW5JAJ7DmufWwbdWrFwXO4T8czlwvgd69sxWecAEe0AFYImuTCvirEmQQmHUbnpq/ElofWnjkeOjj1NiN2w2Ips0dL98W3AzBwGwwmZpJG42PzM6RZZw3RH1+OOuONs3MgqUlMpPng74g/+bLZxiF9QV5XhC0QfPm8Z+RrTVWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Y32vjNaapzVKhkTQBsPyfmKrRWDzZJHkBn3QO3ylk=;
 b=V9qB9voCAxnNK+0PtYMZr/qGxZV5q6fjEocBg+6dbXKlq+EwVc0y3k9shx185J6SYWedNqvgNDIePloUewX0cw+fvpTNGjfefkrd+FwDg3E71Kjv1BazzKc10d8PAGwrfRQDRe9iX/M+qLIPkk0xl8DYJ73370zqSJL54kt81hUQQ4NeqBHwgiDPfjJaGvuhHqvOqpDyN/yjdJc6yGG4NIgdrwlDbdeSj3C7HpvOoLahgYfDsPufhQcOAiG4z+gZpoyoavw2A7dgZXhtmUtyW3Z6zJeLo/R79+2q9aXmNx0+46cdBbuz9+s8E8mvkFbakQrUPPEItLNp2USk8vzFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0Y32vjNaapzVKhkTQBsPyfmKrRWDzZJHkBn3QO3ylk=;
 b=VzH895oBbcntDq6hVPLI7r8km7iIHMPyKBCp8dHZXEaMhcJ1TlowYDRM5/rNOL+idy3nDhr5my0aUFNTzWRakkVVyZR1loJJ9JfeS9Wf9p9OVe8SxhCwmEFPHK9JBlGuRk68slrILsMWKjYBM5HEQ+NCv2DmAtmLRJIAjk7s+/Q=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4359.eurprd04.prod.outlook.com (2603:10a6:209:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:11:41 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:11:41 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 2/8] usb: cdns3: gadget: improve the dump TRB operation at
 cdns3_ep_run_transfer
Thread-Topic: [PATCH 2/8] usb: cdns3: gadget: improve the dump TRB operation
 at cdns3_ep_run_transfer
Thread-Index: AQHWgDw+TlJIPZq4yUe1ORA9Z7u4JqleT3aAgAAOiwA=
Date:   Tue, 8 Sep 2020 07:11:41 +0000
Message-ID: <20200908071114.GB17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-3-peter.chen@nxp.com> <87lfhkn63k.fsf@kernel.org>
In-Reply-To: <87lfhkn63k.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 44088aeb-6a52-4909-199e-08d853c66fac
x-ms-traffictypediagnostic: AM6PR04MB4359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB4359DF278451A6117D0640D38B290@AM6PR04MB4359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:792;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zELnT1FgW3nqL7Tk/3ONrciShEVPXiXQuYzjK0vODPtv6LMikHgqgw4UbKjOGLeb9sf0AZ4yIROZY5BRIfPDQkPFwmGqIPOrjAexpI1JizQLs0E1+UmO9rzbnKz1puxr1LbL+L5VQKSjQhkYjMGdI54pbA0uw10YOiq5pJg9AnPWBr7hG25cnRnPk2xW+EQFzIbaWF8q7AFUcPO/H25Z/T1RwTvQNOhuhuFC+w1SYdX+C6lGTmuzYsKO1ACtpbsCAneHfPZXshYraRcHcBVy6rvbC0HZ2Qt+1yGSKQxAvwCNLn3r0ehRFbc77JQoEgiR7+nABiI7lv5Uvn76b4ng3g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(66556008)(5660300002)(8936002)(33656002)(66946007)(54906003)(71200400001)(91956017)(4326008)(6512007)(9686003)(186003)(76116006)(6486002)(33716001)(66446008)(26005)(1076003)(66476007)(6916009)(478600001)(86362001)(64756008)(2906002)(8676002)(6506007)(4744005)(83380400001)(316002)(53546011)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: mvQjxeUVAs46yF/IpTdB/HaWpiKk9jA9mwwHbkzwUAJYk/Jvl4PIiS6mxJSX5Qzx6x+QWIrJxF42ZUYu87g8nEYLPmZFNftxG0BVPKJCrUakLoqvU6Ml5uQ4vP4wxzxOoMB+jmJFvx655FC5wpv+R610u/fDCcLI1DkrG25WWsMkGp8BoJzjbINt4pdi05F8cZpngOMPEWQ+RwXEGML6u7EFbtecony174IFgBzhbTP9ciNnYC1mk6lQ4F9Ghn6jOo4Tnfysfo7CeixHR5jHVPXNVbaKTpEaPrty1dHuRoM4vT8dBDx2D4FblwoOCUvq4EtFPdyZ7passKL/vb9Bsii88oOj8NAjyOKANbdkdsiUP8g7QIMzrLFbfcUNy6rGyMxYbOSuRFo6DEBqfXEOGxJP96JN8OCxIDcVvQY7H+lMc9G6OR9yaNrUPx3DmtRL03Fs6Lom/qZzMwxIHG1U4BdnQkefrRWLP4hDv8qKYojnb62aLDqlbixVLFtLNVgSczSOZv7hrpDAAT4qByMb78o4pD+cxrkMDNyPwEeoITt1pV/Q6U9yMhZKde7ySS8udKe59pZ0qiag5kXUXKlar3LpAWfRPh8h0Bcy1O1o/vbe3ujry2cSzp+SyceATObQDb4W34Cwsl/AwU5/tKFElg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <233F3E5223B40E4590C46E84232C87A4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44088aeb-6a52-4909-199e-08d853c66fac
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:11:41.4507
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1Iwz1Z/tlIfSpFgdqxJxZAepx+sQcAxqMSD2XMU05NxN5X/KFv2HqQ++9I2wHxHUZmiPrlAtq4QcUI0X2o0ltA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4359
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:19:11, Felipe Balbi wrote:
> Peter Chen <peter.chen@nxp.com> writes:
>=20
> > It only dumps the first TRB per request, it is not useful if only dump
> > the first TRB when there are several TRBs per request. We improve it by
> > dumpping all TRBs per request in this commit.
> >
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> >  drivers/usb/cdns3/gadget.c | 20 +++++++++++++++++---
> >  1 file changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/usb/cdns3/gadget.c b/drivers/usb/cdns3/gadget.c
> > index 50282cab5fb6..f68c30b808dc 100644
> > --- a/drivers/usb/cdns3/gadget.c
> > +++ b/drivers/usb/cdns3/gadget.c
> > @@ -1089,7 +1089,7 @@ static int cdns3_ep_run_transfer(struct cdns3_end=
point *priv_ep,
> >  {
> >  	struct cdns3_device *priv_dev =3D priv_ep->cdns3_dev;
> >  	struct cdns3_request *priv_req;
> > -	struct cdns3_trb *trb;
> > +	struct cdns3_trb *trb, *link_trb;
>=20
> one declaration per line
>=20

Will change, thanks.

--=20

Thanks,
Peter Chen=
