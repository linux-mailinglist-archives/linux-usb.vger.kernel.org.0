Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0819DCE5E8
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 16:51:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728516AbfJGOvO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 10:51:14 -0400
Received: from mail-eopbgr1410109.outbound.protection.outlook.com ([40.107.141.109]:27150
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727490AbfJGOvN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 10:51:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiR4XhKC/YyzjotK8MOqFEgyv2S5gTNzTcWu3COtHv+CLGXRo0eqPGlRIe/dm0q+Cwx0yEktnaMn80+DZRs5bdJQjgRxP3mJnPV42SmOYo7NHDdiOH1O1P8RXcFNRcswztR7i5HRsHEim+HBPMylqjgmagxjOwGM+8416+TF3Y+jhTiRQF7PjH3TuahBoJYFYaJ11ThW3J/NupyrbZKVW54tHiqLn6SNCYM2zkqOe1WU64AxAJOfC1lY0XGQjFO0dYQt/vgf9wwDI8oCsg+R/+iU/RYS+AjdBPx6cyZ7NluAEzyJnZvT6f12b6lPE3kuqMLM115ZkhMHSg4B4iUGiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaSyEjC/c7BGKeFG72P1C3uXbfxjKs/0bXjM7QtCDy8=;
 b=ebLXiJzJJOJwApMN/hXnLVi9zmIbzY3U/e0LwXxRLMD8WvsWhUAeTfWlnBeY/ELPL122FDfkI9wcG21gXU3tKPQGC4RhgeCvdgyCdx9Umj2PyuHjVj4ChkDPS9ypDf/Ova8AqrFgi6SiDQLMgcwtWUWkRNS5E7AADnmQqYa9s8JrEjvW9doRYRvOY7DrRo0nEzeqrOR8e58oMZkrOrXE1uwir9Wh8HPpFV00gtCHzBmStVFofIkP/577QJ4mERkuvF8bq+rXcNMqxgDeQuotCepEcHUo/ETNCsmVa7+c86hfif1Z3bHzfSbciUeo+IR94A+dMAMb80E3Oc6VxmzKxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaSyEjC/c7BGKeFG72P1C3uXbfxjKs/0bXjM7QtCDy8=;
 b=ioaCqZcCvmz9ykJfsM6bqd99hCgcyf9wZ448Dy7tmpwmJaj+9eKzAQbYjGBxoRt+7aOJuDGtcJ2hg7ZD1WkuNSEnoH7pEa1YVRnj9blRHh0YvgRl19bDt6A9qSoCrgms8hIObrgP5ovM2i0/w+iLCaD5snNlNxowLS2UPYHx4PQ=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB4725.jpnprd01.prod.outlook.com (20.179.182.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 14:51:11 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 14:51:10 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
CC:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "kbuild@01.org" <kbuild@01.org>,
        "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Thread-Topic: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Thread-Index: AQHVfQKKzx1YhFpN20WRiJwATvKHXadPD5HQgAAZf4CAAA/KMIAABWkAgAACi+A=
Date:   Mon, 7 Oct 2019 14:51:10 +0000
Message-ID: <OSBPR01MB2103144776347204E9676246B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20191007112939.GG21515@kadam>
 <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20191007131717.GJ21515@kadam>
 <OSBPR01MB2103FEAFF4E52D3E881179C7B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20191007143310.GK21515@kadam>
In-Reply-To: <20191007143310.GK21515@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 12b1e1e5-f75b-4f13-b480-08d74b35cb22
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB4725:
x-microsoft-antispam-prvs: <OSBPR01MB472535461D7E7388D644D9D1B89B0@OSBPR01MB4725.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(51914003)(476003)(478600001)(446003)(11346002)(486006)(55016002)(71200400001)(71190400001)(33656002)(14444005)(256004)(86362001)(44832011)(25786009)(9686003)(6436002)(6246003)(4326008)(14454004)(2906002)(99286004)(229853002)(8676002)(8936002)(81156014)(6916009)(7736002)(81166006)(5660300002)(305945005)(52536014)(3846002)(6116002)(74316002)(102836004)(66446008)(64756008)(66946007)(26005)(66556008)(66476007)(76116006)(6506007)(186003)(316002)(54906003)(66066001)(7696005)(76176011);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB4725;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EE9W6qBo3wEUTEklZ1FZd/h1OgCKz9eWcLSoO9Ibstl7a7JsecAmGsdtn4muyQaLtcjKrCl8e57cqqenzSuISsElJesNL1AwE9S2PmQFFskLXDQQ5Ga3lF2NAAouZDRc8hwGIVi4W8HmAtN6RPQSD+tYEdS688bhMwIxWQ5wKvrzj+WxyAu4zRF/Bv9YKQ1PLjE2eeb5OpYFa39xywnUx40c9z/P8BqMce7fip/BdoX1Ln+JVqeoaGdUus+SyY8rvLxAHaRDmhBS7xax9MR3/+Uxyj/eKoGiff6e/030jUzM4Fjjgj/T5JwoNliC6Pvvf2vZhJZG9OaOPfOR29PxXwuBx15HY2u7KvZ6YN85VKMpkdR/c4P84c6aGgzSN8hEJbhVL8+Wf1iBbA+Q9vbsd7RhUz/BbZZjS7O+0dgwVGA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b1e1e5-f75b-4f13-b480-08d74b35cb22
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:51:10.8394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ch1Ss24Z9OhnMsh7aSfzPwSiMT21RKf/xm+d3LtFvYrdO5i/LK0D9dpo91abv/0o7d/9+xfh69v4E3no2RLrMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4725
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Dan Carpenter,

Thanks for the feedback.

> drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to
> 'PTR_ERR'
>=20
> On Mon, Oct 07, 2019 at 02:19:05PM +0000, Biju Das wrote:
> > OK.  Are you ok with the below changes?
> >
>=20
> It will generate a compile warning so no...  :P
>=20
> > @@ -178,7 +178,7 @@ static int hd3ss3220_probe(struct i2c_client
> > *client,
> >
> >         hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
> >         fwnode_handle_put(connector);
> > -       if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> > +       if (IS_ERR(hd3ss3220->role_sw))
> >                 return PTR_ERR(hd3ss3220->role_sw);
> >
> >         hd3ss3220->typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> @@
> > -188,20 +188,22 @@ static int hd3ss3220_probe(struct i2c_client
> > *client,
> >
> >         hd3ss3220->port =3D typec_register_port(&client->dev,
> >                                               &hd3ss3220->typec_cap);
> > -       if (IS_ERR(hd3ss3220->port))
> > +       if (IS_ERR(hd3ss3220->port)) {
> > +               usb_role_switch_put(hd3ss3220->role_sw);
> >                 return PTR_ERR(hd3ss3220->port);
>=20
> 		ret =3D PTR_ERR(hd3ss3220->port);
> 		goto err_put_role

Got it. Will send a patch to  fix this.

Regards,
Biju

> > +       }
>=20
> Otherwise I think it's the right thing.  Thanks!
>=20
> regards,
> dan carpenter

