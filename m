Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3AC2CE4FF
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 16:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbfJGOTK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 10:19:10 -0400
Received: from mail-eopbgr1410091.outbound.protection.outlook.com ([40.107.141.91]:59392
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726334AbfJGOTJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 7 Oct 2019 10:19:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OUlc4qnpAEQJplKoupHS3JuqyEM8bLYpgUIt4JJPIYHImuvbZnFrrKCsoMcrOpwflzTn/e2YsM2eW9QQC7ioO6wtWRP7nwvAxWIvVCE7C5xgaoykkX59UWNwvabZypsa1z2jcN6ZHqGZoKEwwFpUQ1+onTZOVK2MArtWvuAJJcRWmuCWdegQCRkAm9CVSJqZL8swF+0zjtvL0B+ZsvvUV9Wmjh58kUSfaN+HTcj0aNaDOH7Pd4to+ZkqX+yofbz6j+Ct2hH013bmca4ia12DixE/Boq1frKsaWAzaPw7ZrJ2Dfqq6zWwXda3uKbbdxYZcGdRagiMrtszoF70IcPvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P8Zm51ZPMKUeT3Tq0Wtb/hwBRkQxnhl0LRlvw8dfy8=;
 b=DzyNV50Vw42aIrGBCgzrsxEJuKxORYSPhVXikePeDYRwwT6/j/KJAF/v/H2ygWPr4lqpL5KaF8ktza9FLNpeCSmNPQhcnakgqzB/fqqIkp2KY0K8aEwzB/5qtHQ70W5bm721CWYZdCuNsv/WjOLDW0NHF2QgB2bKUctb8xv+49Kg9OL3Cg3Gao1yQoQHN+Ft6SZB28Xdrn7snud1c6K2sf10uAChetyhhzfyiPWYDeCOhHhJd+hHS9FBPqQ7TW5zh9WhNKY+OGJRWPlIBBTyVekIdVEpyLIwr4JFZ6a1waXA969yCaUijY2rt4b6BerwMKBUwDMsoJoMUsYWRnWAsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4P8Zm51ZPMKUeT3Tq0Wtb/hwBRkQxnhl0LRlvw8dfy8=;
 b=b7J/wLmXH2EQ6S2LGDRA66OWxdAFK+jjHuIVCOluOPAal2rBClVGRqTFyfFSOawVjOVkKI0BvSXrEKSxHgtzEXilJj3isC7XL4BHdf6q+Y70zdDp4EReESOmOGjp3BPwbKy6fTRix8lrFmv0pOv711kP4rrKdu/03GRda+DgIcM=
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com (52.134.242.17) by
 OSBPR01MB2902.jpnprd01.prod.outlook.com (52.134.255.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Mon, 7 Oct 2019 14:19:05 +0000
Received: from OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f]) by OSBPR01MB2103.jpnprd01.prod.outlook.com
 ([fe80::d5a0:9756:da13:2d6f%7]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 14:19:05 +0000
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
Thread-Index: AQHVfQKKzx1YhFpN20WRiJwATvKHXadPD5HQgAAZf4CAAA/KMA==
Date:   Mon, 7 Oct 2019 14:19:05 +0000
Message-ID: <OSBPR01MB2103FEAFF4E52D3E881179C7B89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <20191007112939.GG21515@kadam>
 <OSBPR01MB2103ECC1BA7A7A0D9ABA15CBB89B0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
 <20191007131717.GJ21515@kadam>
In-Reply-To: <20191007131717.GJ21515@kadam>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=biju.das@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3923cca9-b411-45f4-6142-08d74b314f86
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: OSBPR01MB2902:
x-microsoft-antispam-prvs: <OSBPR01MB2902719C600D8DD8E4378C8BB89B0@OSBPR01MB2902.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(4636009)(346002)(39860400002)(366004)(396003)(136003)(376002)(51914003)(199004)(189003)(99286004)(8676002)(26005)(14454004)(76176011)(8936002)(11346002)(316002)(55016002)(6916009)(305945005)(446003)(33656002)(6116002)(3846002)(5660300002)(81156014)(81166006)(7736002)(6506007)(52536014)(102836004)(4326008)(7696005)(66066001)(229853002)(2906002)(66556008)(256004)(44832011)(71190400001)(76116006)(54906003)(64756008)(486006)(6436002)(6246003)(476003)(478600001)(66946007)(71200400001)(186003)(66446008)(14444005)(25786009)(86362001)(9686003)(74316002)(66476007);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2902;H:OSBPR01MB2103.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cnv3yIN0Fo68fpvRnKtOqJIBIDQGwQ8I6San0Bandt2/4cCVnW02xgBhp1PCDLl9X8r1lvuxkUeYX7UkOM1Ysr9Pg/7qOCCj2W7QOLd04EvULTQ/mOkRBIKW69xheygm0cT3zhoBq2GrnBCO7B9Wfo5yeDffGaMUOKE7q+Iiha58mJxyIECAc2OmSz4aUrB9R2aD5Qchj7IdCVj1brcd7CUvJo+okBI4vVsr1ZXymYsZWgOUrWvIiY9YYy1AaPMqGtpZ4XhevczY3MCO68+i0KxaAgsTa8lt01h5f9XJYpzZRgIkqvL8Jbmjkycegsv3yxp9HEVSNOVhOiIBRaCdwHU1LdE5D9qGND4Mjo6XKQyTac+m1WMqhTClong0OEoylvdQkCFheWQOvCikVzgQfmy87cCwgZK9irxd9smEgSc=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3923cca9-b411-45f4-6142-08d74b314f86
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 14:19:05.1764
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bWDWzHOQqtnb30a4CWV7vKZPFHM2efu9Pwe6W6GrlAu+nmwaBah/UvYMZHux3hPsLPt2o0QQl38FrYHGDkRioA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2902
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hu Dan Carpenter,

Thanks for the feedback.

> drivers/usb/typec/hd3ss3220.c:182 hd3ss3220_probe() warn: passing zero to
> 'PTR_ERR'
>=20
> On Mon, Oct 07, 2019 at 12:36:10PM +0000, Biju Das wrote:
> > > err_unreg_port:
> > > 	typec_unregister_port(hd3ss3220->port);
> > > err_put_role:
> > > 	usb_role_switch_put(hd3ss3220->role_sw);
> > > err_put_handle:
> > > 	fwnode_handle_put(foo bar);
> > >
> > > 	return ret;
> > > The rule behind this style of error handling is that you just have
> > > to keep track of the most recently allocated resource and at the
> > > bottom you free them in the reverse order from how you allocated
> > > them.  Here we had allocated -
> > > >role_sw but the typec_register_port() so we do goto free_role_sw;
> > > >Now
> > > people can guess what the goto does because the name is descriptive
> > > and since it matches the most recently allocated resource that means =
it's
> okay.
> >
> > Yes I agree. But In this case, only one error label is sufficient.
>=20
> Yes.  You could fix the leak by passing an invalid pointer to
> typec_unregister_port() but that way is asking for trouble in the future.=
..
> These are the kinds of bugs I fix all the time because I'm working with s=
tatic
> analysis.  Clearly defined error labels are more readable and less bug pr=
one.

OK.  Are you ok with the below changes?

@@ -178,7 +178,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
=20
        hd3ss3220->role_sw =3D fwnode_usb_role_switch_get(connector);
        fwnode_handle_put(connector);
-       if (IS_ERR_OR_NULL(hd3ss3220->role_sw))
+       if (IS_ERR(hd3ss3220->role_sw))
                return PTR_ERR(hd3ss3220->role_sw);
=20
        hd3ss3220->typec_cap.prefer_role =3D TYPEC_NO_PREFERRED_ROLE;
@@ -188,20 +188,22 @@ static int hd3ss3220_probe(struct i2c_client *client,
=20
        hd3ss3220->port =3D typec_register_port(&client->dev,
                                              &hd3ss3220->typec_cap);
-       if (IS_ERR(hd3ss3220->port))
+       if (IS_ERR(hd3ss3220->port)) {
+               usb_role_switch_put(hd3ss3220->role_sw);
                return PTR_ERR(hd3ss3220->port);
+       }
=20
        hd3ss3220_set_role(hd3ss3220);
        ret =3D regmap_read(hd3ss3220->regmap, HD3SS3220_REG_CN_STAT_CTRL, =
&data);
        if (ret < 0)
-               goto error;
+               goto err_unreg_port;
=20
        if (data & HD3SS3220_REG_CN_STAT_CTRL_INT_STATUS) {
                ret =3D regmap_write(hd3ss3220->regmap,
                                HD3SS3220_REG_CN_STAT_CTRL,
                                data | HD3SS3220_REG_CN_STAT_CTRL_INT_STATU=
S);
                if (ret < 0)
-                       goto error;
+                       goto err_unreg_port;
        }
=20
        if (client->irq > 0) {
@@ -210,7 +212,7 @@ static int hd3ss3220_probe(struct i2c_client *client,
                                        IRQF_TRIGGER_FALLING | IRQF_ONESHOT=
,
                                        "hd3ss3220", &client->dev);
                if (ret)
-                       goto error;
+                       goto err_unreg_port;
        }
=20
        ret =3D i2c_smbus_read_byte_data(client, HD3SS3220_REG_DEV_REV);
@@ -220,8 +222,9 @@ static int hd3ss3220_probe(struct i2c_client *client,
        dev_info(&client->dev, "probed revision=3D0x%x\n", ret);
=20
        return 0;
-error:
+err_unreg_port:
        typec_unregister_port(hd3ss3220->port);
+err_put_role:
        usb_role_switch_put(hd3ss3220->role_sw);
=20
        return ret;

regards,
Biju
