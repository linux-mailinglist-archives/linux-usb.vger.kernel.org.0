Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 21217CE1D7
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 14:36:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727715AbfJGMgQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 08:36:16 -0400
Received: from mail-eopbgr1400103.outbound.protection.outlook.com ([40.107.140.103]:51264
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727467AbfJGMgP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 08:36:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GYHzANodsPpIFFVlf+sIGR5j8LUInXcfpe5zvfoLiykbHmmWmx8Jcc2HV5FOflPIXye6cQBOIRuhiTzRZKNjJLwn6XgAlTvCJMIzxjzgpm+U44ExpqBniBa73u5R+qTO5afJTJ8Wiv8zSLULIa5wRzse/PaOjKbFZDKc8nZ2gqrfam4zy3VFwxoRktXR9KCLK8mngJlCAlxC/7LVQUp+lpg+7Uaf9aqcs05Z+0jGT6yy6KhndQRHD2FpIHT8KKsNhXTCooR86A/e+ulXKeJq+6J8Jrr6fSQKCk+WbDNNAxcTKnzEI5HUA9oYaMiToQ1P+jp34NARplzpaO1oYx0IBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdVULn1nEKiscB54x3FXuUpE7LRF8o6+oh70/VPs2Rg=;
 b=fI2RTAXQEatTYcrBbSnBcpC+kxmAgHxFNTz3q2Fmht66Vwj298Be1qPwAwVCDsq1XOmISkdIsoUB2JYroJ6RG8fN44awlFrphWd8rsP+bXN7TMCv1K6IdpFg3VCTkqk6IYBnf5kOWOLCedFTQzorEx2nQ5qiSeDAnu4gYCf6xOtBI1v9JGq+mwCM+5z2WwvFGLf226Wap1z9nHs8/xYj5LcTlJTTriYzr5eMQC33lnNj6abk/LPBnTLSUuatvGRsqtV1bsooiGclwZ3KuAgZwVWahDBx3FQmwVMxsvj99M8JL6crO4uGMZoSxNcPcKp8bSDvdUB4sfMCLcS9PoTfNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cdVULn1nEKiscB54x3FXuUpE7LRF8o6+oh70/VPs2Rg=;
 b=WzxhkUC56TMkig0OZZrBdRDiz+04lMoO8WunhR+GOZ3KpLKN7MK5RmqLfrYMNCM30ShzRUqG7tE1lhc6T7Hl3werVJVHz1Cw7H6ZsY9h2UcY+MUho4MBH3TJxSU2rocjA1yRxh5u1ELRY7WrHvgbtgsEKNNVbALbphNdNPrBLbM=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB3046.jpnprd01.prod.outlook.com (52.134.254.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.24; Mon, 7 Oct 2019 12:36:11 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 12:36:11 +0000
From:   Biju Das <biju.das@bp.renesas.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "kbuild@01.org" <kbuild@01.org>
CC:     "kbuild-all@01.org" <kbuild-all@01.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: RE: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Thread-Topic: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
 hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
Thread-Index: AQHVfQKKzx1YhFpN20WRiJwATvKHXadPD5HQ
Date:   Mon, 7 Oct 2019 12:36:10 +0000
Message-ID: <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20191007112939.GG21515@kadam>
In-Reply-To: <20191007112939.GG21515@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78dfede3-d3dc-4028-3cb6-08d74b22ef53
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB3046:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <OSBPR01MB30464E250B8C8F467CC18BCBB89B0@OSBPR01MB3046.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(366004)(39860400002)(396003)(136003)(346002)(376002)(51914003)(189003)(13464003)(199004)(478600001)(52536014)(76176011)(7696005)(966005)(446003)(33656002)(99286004)(14454004)(11346002)(476003)(486006)(2501003)(44832011)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(305945005)(7736002)(74316002)(5660300002)(86362001)(66066001)(6506007)(102836004)(26005)(81166006)(81156014)(6246003)(186003)(110136005)(8676002)(71190400001)(316002)(229853002)(71200400001)(3846002)(6116002)(2906002)(14444005)(54906003)(256004)(4326008)(6436002)(9686003)(6306002)(55016002)(25786009)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB3046;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:0;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: G+7OLvuNKkhPtetOonJEAD5WFvTPFzxsJN0GC9TKgkXPXwXJctUYoQ0cvKnzFYCHWQGtmldVx5chh64qTFk0tVevlo+zyzHymVCUp8/j1iNJxX1Bg4pW1YgwAQrDyTUnEdReL7IkdEIpp22nZbTTlAoAogp8Nb1YqWFu+ulLY+fuLca7j9E1oOb0ebL6RivgH0fk3SJ5gSOmT4Hnn/FsbcVQ5ss2n1NwpDGoQpBhwZh05wwvY1Yo8jI/BjggnpppCvxRKllMw3g6LrFvMr+oIooybcZagLl4wRLsaX9rNX4SZV8roJICNBMveyL2lOyjO+F+uH3zybpMtxvGiTZyxE/9n0wnDjjl6a1FKqChuJxLgjhihQP2HJYPOpFQm/uYoGIgz/ARFI6cm53Q0B5E7rfo8Tqn5IjpLIzDtvpTSOB7cbTFqlpZFrdHDnlvG13E1T8Xr5ccVFTdOIi5cubXUg==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78dfede3-d3dc-4028-3cb6-08d74b22ef53
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 12:36:11.0696
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VRr198cfi71zlyoUCYH+kx5kAeLZoOdGxNp1/kxBs/L1g0cbLqlN4cu/DfqC3ubmT0FRLGdMjqnB3NYIHLNEqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3046
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Dan,

Thanks for the feedback.

> -----Original Message-----
> Subject: [kbuild] [usb:usb-next 32/38] drivers/usb/typec/hd3ss3220.c:182
> hd3ss3220_probe() warn: passing zero to 'PTR_ERR'
>=20
> [ Resending with Fixed email headers - dan ]
>=20
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git us=
b-
> next
> head:   dd3fd317e2beb899cbffcf364de049b9f9a02db5
> commit: 1c48c759ef4bb9031b3347277f04484e07e27d97 [32/38] usb: typec:
> driver for TI HD3SS3220 USB Type-C DRP port controller
>=20
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> smatch warnings:
> drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to
> 'PTR_ERR'
>=20
> #
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git/commit/?id=
=3D
> 1c48c759ef4bb9031b3347277f04484e07e27d97
> git remote add usb
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
> git remote update usb
> git checkout 1c48c759ef4bb9031b3347277f04484e07e27d97
> vim +/PTR_ERR +182 drivers/usb/typec/hd3ss3220.c
>=20
> 1c48c759ef4bb9 Biju Das 2019-09-04  152

> 1c48c759ef4bb9 Biju Das 2019-09-04  178
> 1c48c759ef4bb9 Biju Das 2019-09-04  179  	hd3ss3220->role_sw =3D
> fwnode_usb_role_switch_get(connector);
> 1c48c759ef4bb9 Biju Das 2019-09-04  180
> 	fwnode_handle_put(connector);
> 1c48c759ef4bb9 Biju Das 2019-09-04  181  	if
> (IS_ERR_OR_NULL(hd3ss3220->role_sw))
> 1c48c759ef4bb9 Biju Das 2019-09-04 @182  		return
> PTR_ERR(hd3ss3220->role_sw);
>=20
> When fwnode_usb_role_switch_get() returns NULL then we return success
> here.  It seems like a bug.

OK.  I will change the check condition from (IS_ERR_OR_NULL(hd3ss3220->role=
_sw))
to IS_ERR(hd3ss3220->role_sw)).=20

> When function returns a mix of NULL and error pointers then NULL is a
> special case of success.  For example, a module tries to request a featur=
e but
> that feature is deliberately turned off.  It's not an error so we can't r=
eturn an
> error pointer, but at same time we can't return a valid pointer because t=
he
> feature is disabled.
>=20
> For fwnode_usb_role_switch_get() it is a bit unclear to me what NULL mean=
s
> in that context, and there are no comments to explain it...  The
> fwnode_connection_find_match() is the same way where it mixes NULL and
> error pointers, doesn't have a comment, and it really seems like NULL is =
an
> error, not a special case of success like it's supposed to be.  I have ad=
ded
> Heikki Krogerus to the CC list.
>=20
> 1c48c759ef4bb9 Biju Das 2019-09-04  183
> 1c48c759ef4bb9 Biju Das 2019-09-04  184  	hd3ss3220-
> >typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
> 1c48c759ef4bb9 Biju Das 2019-09-04  185  	hd3ss3220-
> >typec_cap.dr_set =3D hd3ss3220_dr_set;
> 1c48c759ef4bb9 Biju Das 2019-09-04  186  	hd3ss3220->typec_cap.type =3D
> TYPEC_PORT_DRP;
> 1c48c759ef4bb9 Biju Das 2019-09-04  187  	hd3ss3220->typec_cap.data =3D
> TYPEC_PORT_DRD;
> 1c48c759ef4bb9 Biju Das 2019-09-04  188
> 1c48c759ef4bb9 Biju Das 2019-09-04  189  	hd3ss3220->port =3D
> typec_register_port(&client->dev,
> 1c48c759ef4bb9 Biju Das 2019-09-04  190
> 	      &hd3ss3220->typec_cap);
> 1c48c759ef4bb9 Biju Das 2019-09-04  191  	if (IS_ERR(hd3ss3220->port))
> 1c48c759ef4bb9 Biju Das 2019-09-04  192  		return
> PTR_ERR(hd3ss3220->port);
>=20
> This error path should call usb_role_switch_put(hd3ss3220->role_sw) and
> probably a fwnode_handle_put() as well?

I agree, We need to have  usb_role_switch_put(hd3ss3220->role_sw) on the er=
ror path.
But not the  "fwnode_handle_put. "

Basically it used to find the role switch associated with connector device.
The usage of "connector "  is done with below code and "typec_register_port=
"
comes after that.

175         connector =3D device_get_named_child_node(hd3ss3220->dev, "conn=
ector");   =20
176         if (IS_ERR(connector))                                         =
         =20
177                 return PTR_ERR(connector);                             =
         =20
178                                                                        =
         =20
179         hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);  =
           =20
180         fwnode_handle_put(connector); =20
.......
........
........
hd3ss3220->port =3D typec_register_port(&client->dev,                     =
=20
190                                               &hd3ss3220->typec_cap);


> I noticed this because I scrolled to the bottom of the fucntion and notic=
ed
> that there was only one error label.  When you see a single error label l=
ike
> that, it's normally a red flag that the error handling is buggy.  Error l=
abels
> should have descriptive names which say what they do.  I suggest somethin=
g
> like:

> err_unreg_port:
> 	typec_unregister_port(hd3ss3220->port);
> err_put_role:
> 	usb_role_switch_put(hd3ss3220->role_sw);
> err_put_handle:
> 	fwnode_handle_put(foo bar);
>
> 	return ret;
> The rule behind this style of error handling is that you just have to kee=
p track
> of the most recently allocated resource and at the bottom you free them i=
n
> the reverse order from how you allocated them.  Here we had allocated -
> >role_sw but the typec_register_port() so we do goto free_role_sw;  Now
> people can guess what the goto does because the name is descriptive and
> since it matches the most recently allocated resource that means it's oka=
y.

Yes I agree. But In this case, only one error label is sufficient.

Regards,
Biju
