Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B20921E15E
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 22:26:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbgGMU0p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 16:26:45 -0400
Received: from mail-dm6nam10on2085.outbound.protection.outlook.com ([40.107.93.85]:5561
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726321AbgGMU0o (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jul 2020 16:26:44 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cwbo2KUS8yckXSCzWib+jXUd7rP5Ilvmq15LBwRHtLtFLXpcgzC91zcJAir2BdEBRPH4eEflCnKBdQ01Rfkhm3PF+YMtoliFwDPJi1+R8B8cpMF73CDhQyBWS7HAvUKlcD4/FkRxnfp9vhYs0NbgDknRXZW8nC7v/Cd16BxVXbdGDC48pN1/N9J+q6yXkdnquz/GKKVnyRG5IEUY2K1t32qqzNK0nsZ07/LZy9i3tNArsgJ6zFQS9p87J+XSv9IjPc85h9lpCHWgXXGGrw92gP0xrRT4Pxq/TM4aQID2oddjdVUosseDpY0C5wkUopRmmo1OSs75UW9uRd4JHgyLRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVJL3zB1r14idqo/k9+5YOEHx7UWZqfcISXBfk05VEg=;
 b=TqaQ3jDua+yJyIHwgTYz6P4+Un1S+h9WHzdk6h7P1zYvJDCYFK8NPHtyxUzPyk5kdnED6ennujlYOXunWHCK3xqN+2cyx4SbSHujj7wZxOTefVqVYwDWe33eLxSxT1rq+LidUAFE4uRAARhhONJpUd06qu3aeFUGPiHcgR9LyIRFPw9PiPuo2DJLJHxusUV7lHCx3vLMziW2NBVqUGdO/k288uEBf3hZN+/DosqwCR2D47ZiaSPlk22wwgNq1r7b3oCE2ncvMKFH14ln1GNQ46DBGSw94CgAJ+LewI2kcpLrLJryCTCCtRLZ9LJ97yzLgvNnr5X+n63lMGhwtkIwLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hVJL3zB1r14idqo/k9+5YOEHx7UWZqfcISXBfk05VEg=;
 b=d/yzPovLNn+Z/tfzyFkBStUFfxcy1ovo2HXYW0f2r3OFuPcBIJh8efxxy37h+dBQREqfSraIygFgc2sgscY5V7XeCXsHMApZe6kwqetyXPRjqvBPaEk0+3+xGk6YD3voPnA4uo3OCfla5zCaJln6a2OXeLAQAF/Lo1MNTe0JkxM=
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 (2603:10b6:301:2e::20) by MWHPR1001MB2224.namprd10.prod.outlook.com
 (2603:10b6:301:2e::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.21; Mon, 13 Jul
 2020 20:26:41 +0000
Received: from MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1]) by MWHPR1001MB2190.namprd10.prod.outlook.com
 ([fe80::b439:ba0:98d6:c2d1%5]) with mapi id 15.20.3174.025; Mon, 13 Jul 2020
 20:26:41 +0000
From:   Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To:     "oneukum@suse.de" <oneukum@suse.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] cdc-acm: acm_init: Set initial BAUD to B0
Thread-Topic: [PATCH] cdc-acm: acm_init: Set initial BAUD to B0
Thread-Index: AQHWVp10AvhYW+hsHEuT/7Zwfc2fs6kFTgWAgACsk4A=
Date:   Mon, 13 Jul 2020 20:26:40 +0000
Message-ID: <0180a0cae3ff2772df0f6cea93739ae2deb52b24.camel@infinera.com>
References: <20200710093518.22272-1-joakim.tjernlund@infinera.com>
         <1594634939.2541.3.camel@suse.de>
In-Reply-To: <1594634939.2541.3.camel@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.37.3 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=infinera.com;
x-originating-ip: [62.109.37.155]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 574cffc2-44d6-4734-0fb0-08d8276b0d3f
x-ms-traffictypediagnostic: MWHPR1001MB2224:
x-microsoft-antispam-prvs: <MWHPR1001MB222477C9FBBC4C4E246AF29FF4600@MWHPR1001MB2224.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UKu3wtPNVKkq0LU9KUXoM1GFo95Rf2wdr0tOoK3vxe36djFulLdlaapNwT9D1JJ6KUQOI+iDoSxwX1UQ+bLTJG2Ug24kg0aPW8UIZgcLcICK4110IyxNlmGBqQYte8/SvsUL4eNi7d2YTnlv9C73d/m0y3BVwH2Ac2Cv66V/a0uMSxVefMgLi1O7IkN8N7cOOaukuMcSfDU4kE0pXdIWmE2SkfaN9TasQLCpuTyEx5uQneqIl3Xn1+oErnvUbKPERVdnnk+nbtHNGlYptUPHNcxL3KXzD878CRfOiex+wuuRybcg0APA1QoMfAeiNacy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2190.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(376002)(346002)(136003)(39850400004)(366004)(8936002)(83380400001)(64756008)(66446008)(66946007)(66556008)(66476007)(36756003)(110136005)(86362001)(26005)(5660300002)(2616005)(71200400001)(2906002)(186003)(76116006)(316002)(6506007)(6486002)(6512007)(8676002)(478600001)(91956017);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: r5BejuVb94MMVAMwV5VZX1KY6t8T3xdHcZPoYLnOOH+lzR/MM7/Eces4rHkfvmeXS6theFJPAO1intmRweZj8ZQADbOaChnAg824oXzjK3nDydZpcfwhYNafze4uNKy9kkVcBo3VtLIeVYjOjh4BCypWTR4OSZ1j5FQ/DsLBovU8gNSaAC6OI6gRRBPkJuM9aSCXfTDFgISUBhQa+2GH0Ol5kVAFqerE3gW0IeXZWbfxYTIG3z8/MYCyxdejIsjc0NAMSaD2SoujdePGWeRA11DkC5/zNdMry8pl4oQTqNA3rWXPgKQbjdwUxSEih+9FuwRMrwryyxxwRpWvUkQs/yeuRHdi+DQDnUz3MCMNtVy5oYIA88c/mu7o/r7Z21D0IENzlKuWUTo80HKsodwwZiigicMCkniHKprGUjN5nuSSlYFHCWULh+d9sSh9LOYvsccfkUAMkXx9z5NLcf1CF8/WlOOuqjNL6V1CSvKYEi0=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-15"
Content-ID: <AEA79026B2E39449AB4A8EAF2E32C7AA@namprd10.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2190.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 574cffc2-44d6-4734-0fb0-08d8276b0d3f
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2020 20:26:40.8586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FVLys0BbHvr9QKFCgr1rgtNErPCHRX/6eOTp1ts59CFLrMB6LjBiRgBCUEZJN4zzzSzPK6n/SUJgZN1rDybsHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2224
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2020-07-13 at 12:08 +0200, Oliver Neukum wrote:
>=20
> Am Freitag, den 10.07.2020, 11:35 +0200 schrieb Joakim Tjernlund:
> >=20
>=20
>=20
> Hi,
>=20
> > --- a/drivers/usb/class/cdc-acm.c
> > +++ b/drivers/usb/class/cdc-acm.c
> > @@ -1999,19 +1999,19 @@ static int __init acm_init(void)
> > =A0=A0=A0=A0=A0=A0acm_tty_driver->subtype =3D SERIAL_TYPE_NORMAL,
> > =A0=A0=A0=A0=A0=A0acm_tty_driver->flags =3D TTY_DRIVER_REAL_RAW |
> > TTY_DRIVER_DYNAMIC_DEV;
> > =A0=A0=A0=A0=A0=A0acm_tty_driver->init_termios =3D tty_std_termios;
> > -     acm_tty_driver->init_termios.c_cflag =3D B9600 | CS8 | CREAD |
> > +     acm_tty_driver->init_termios.c_cflag =3D B0 | CS8 | CREAD |
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0HUPCL
> > | CLOCAL;
> > =A0=A0=A0=A0=A0=A0tty_set_operations(acm_tty_driver, &acm_ops);
> >=20
> > -     retval =3D tty_register_driver(acm_tty_driver);
> > +     retval =3D usb_register(&acm_driver);
>=20
>=20
> No,
>=20
> you cannot do that. This means that probe() is now live.
> Probe() in turn does this:
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0tty_dev =3D tty_port_register_device(&acm->port,
> acm_tty_driver, minor,
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0&=
control_interface->dev);
> =A0=A0=A0=A0=A0=A0=A0=A0if (IS_ERR(tty_dev)) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0rv =3D PTR_ERR(tty_dev);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto alloc_fail6;
> =A0=A0=A0=A0=A0=A0=A0=A0}
>=20
>=20
> That is just not a good idea when the tty is not already registered.
> You are opening up a race.
>=20

OK, but it is strange that init_termios.c_cflag does not take/do
anything unless I change order. Perhaps termios should move to probe
instead?

Also, the handling of DTR came up. It seems to me that ACM
deassert DTR until open time which is fine/good.
!DTR signals to the other end that ACM is not ready and don't
want input but ACM still accepts input if received.

Would it make sense to actually enforce DTR locally too?
If input is unwanted, don't accept any either.

 Jocke
