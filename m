Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB23260B93
	for <lists+linux-usb@lfdr.de>; Tue,  8 Sep 2020 09:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgIHHLY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Sep 2020 03:11:24 -0400
Received: from mail-am6eur05on2065.outbound.protection.outlook.com ([40.107.22.65]:5456
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728479AbgIHHLW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 8 Sep 2020 03:11:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S33HyKbKKUbs3VlTyzMn4/53KiiUntowgNZVrEQnS0x90bWmLzU54BQxxxcydMeOdhuW2EhQmzxgYsWXK7CKfy/UDAGy3VLboSQtFb6I2MMGNbhx17BfjKsQyf3od896cHxeJ+GHCNRHumuEK+dv834XAVeKixo5SvcvBu5/zjquLWFVMZJNu7NtfwIeXAPerWsVwF0B/A5uzjjyvOS/raCG6sHAS9LBFYaHiuCVBNAylM/oDb8cC9j3tow5pcEmlueOQBlJgcyP7TlZlDmTVDWKHnpThSW4/4PHKbEJR3kqsO6OJV4UCvadpNnZSWNb6LcEZLMh9sp7E8qCna2NkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mCavSSHrZXhXQj1GT7f55Cj1fYtnZLKa/afKzBq6iM=;
 b=bBLW7i/lT6O/f9kSUAQU4N7TQUq+UKS/iZokgnCoTAU9R6v0H952qRvbqegPHfeZU89StGeRQwZ2BP5LHzAekUjGsfAMH3G6WdJTbSTHo+cxFJVwLvphVvi2rEzPD0X/z8Zt4XO+Pq4Sf6NqHJQUWWIT9GS0YfCl+X28ldy4oRdpIFE++yfOVVykoLvxbGbdvM+LBGKsHtlJ/aqld8f031fDpo735l7wcKgsXYXAoSrFOI7UeJVQMXnO65WFy+A6mKliqvF5VTbtHrj2ixkJu7GzNtw8l2cKuKZ7k+LmgHtqTl64/Fmz0Ohjo8NR3A0g9sBAJFR/LJxLBsYcRu4+bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+mCavSSHrZXhXQj1GT7f55Cj1fYtnZLKa/afKzBq6iM=;
 b=ddAdRKiBbdhecxXPG6syDrTt/Tk3NmPuJTCHtnc1cgJBxuo8IIWA6+kJzS8Z7LdPjyN9FMBd6IBCbv/3u78/zj2mW+z2krIIYlhgiMNbk/GDq8hcUrr9WQa9q06ahHutwj7KOtlbuXkmLYq8y4pdu0PukLAZomOrTn9btIO0YyE=
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com (2603:10a6:20b:118::20)
 by AM6PR04MB4359.eurprd04.prod.outlook.com (2603:10a6:209:3f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.16; Tue, 8 Sep
 2020 07:11:19 +0000
Received: from AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1]) by AM7PR04MB7157.eurprd04.prod.outlook.com
 ([fe80::1023:be8d:40c:efe1%3]) with mapi id 15.20.3348.019; Tue, 8 Sep 2020
 07:11:19 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Subject: Re: [PATCH 1/8] usb: cdns3: gadget: using correct sg operations
Thread-Topic: [PATCH 1/8] usb: cdns3: gadget: using correct sg operations
Thread-Index: AQHWgDw8RiUIs3vfaU20ZC1KW2FsbqleT6cAgAAOPoA=
Date:   Tue, 8 Sep 2020 07:11:19 +0000
Message-ID: <20200908071051.GA17366@b29397-desktop>
References: <20200901084454.28649-1-peter.chen@nxp.com>
 <20200901084454.28649-2-peter.chen@nxp.com> <87imcon62f.fsf@kernel.org>
In-Reply-To: <87imcon62f.fsf@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5e348d25-86b8-47ab-f5ff-08d853c6625d
x-ms-traffictypediagnostic: AM6PR04MB4359:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB43595E1BFE493FD32187BEC38B290@AM6PR04MB4359.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WwrgUYf5DeNGBPCU6oh9wFw4ys9GOEHHIFWYiZQFBUfh8fPbPLm6uxCEVqu7wBy/lLoHaa9AdqTcL2yEgbq3OOVGVcogXIYtc9vnqaOW99XY8tjLwf5uhyBnedealnqfoQVJMhwLjYJEyRZAbffKJSHcY8TC9tw0YTGV9V1dTVWwakQh/uDuuKZwS5Ct55KsQwp3g4EUAnU+Kv4rYOmnxPNyXrHKl9c20JgWvb27mj4JweWw+CoCj/1QPY42xuK+4f0poAPExFpj2pB6hFiIT2KXwv7QVtdKvbYB8UbWYS2+uBw/iuzYKg8M3WcXZa35fzl7tyyKu78jiyu7c/Pglg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7157.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(66556008)(5660300002)(8936002)(33656002)(66946007)(54906003)(71200400001)(91956017)(4326008)(6512007)(9686003)(186003)(76116006)(6486002)(33716001)(66446008)(26005)(1076003)(66476007)(6916009)(478600001)(86362001)(64756008)(2906002)(8676002)(6506007)(4744005)(83380400001)(316002)(53546011)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: cYl6F6lzE4YdqMophL9dNe6nDTiuZsfOdAuWyYq/oJp0vboZNO8gnRPw4PYdwjLH4fatKJ9wbaTH8EFyum39LYB2cBoi43IMp0nL+Rmg6TKnlYs+8RkAdoMuPN6Ak5WupBmfPwxcxMp4kfp0cAdnW0DuTjHoaqxe3mWZ54/15dW3aJARti8y3/sTQFPEwbn4OiwNuzSn1LiWJGJBxO5dqzA5dzalAA6oLqk+5BM+33c39S/eXA6d+GwUvpPbARbX42r7xBf0E7BM9SpFjcjWOnL4nglSZEAiSD8JJ//iv2uOEmQFaNKA2hFtrz2qnjj91MAvuRSu0DE8ZE4hh2SZDT16Vn4qB0Ib/jI6RNvyZzc2lqLpSN23ynQansuNUzRTuabjOpEzaRYsnE/Db9q34H0Ej4XWZT1ZcIc6C6u3ThPCvZMgQ48Sf5x0ixC9gJ2F3XQ35dGSqd6oQQRyOiSwhEWqcAuL5Unm73k88Un3mL5pK894mqknlG9jaLHf42xLlhasZMVGq1B5mkvbXeuB7z0QeaVlJcbeAQovblUtJRXWDKUKQV5EhR3opTznoaH6P3Q2EksCHvy/IXaQkKE7O0dpvkRgnY0GBw4eTqBKzklsX1YxB5BMLfe7wwj2wfDkWozLpkMCqvPXLC0LzVxUJQ==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <6844F58EBF9788408286CC5A6AC75B8B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7157.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e348d25-86b8-47ab-f5ff-08d853c6625d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2020 07:11:19.0685
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iXUittOucqWxLEel4OlLhBCtSAPPFwgp29pfBRwDHln2UFE2eJxOxQ0xUxyopmdTN1USW8KZqUnx6gLjkXS2Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4359
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-08 09:19:52, Felipe Balbi wrote:
>=20
> Hi,
>=20
> Peter Chen <peter.chen@nxp.com> writes:
> > @@ -1162,22 +1164,24 @@ static int cdns3_ep_run_transfer(struct cdns3_e=
ndpoint *priv_ep,
> >  	if (priv_dev->dev_ver <=3D DEV_VER_V2)
> >  		togle_pcs =3D cdns3_wa1_update_guard(priv_ep, trb);
> > =20
> > +	if (sg_supported)
> > +		s =3D request->sg;
> > +
> >  	/* set incorrect Cycle Bit for first trb*/
> >  	control =3D priv_ep->pcs ? 0 : TRB_CYCLE;
> > -
>=20
> unnecessary change
>=20

Will change, thanks.

--=20

Thanks,
Peter Chen=
