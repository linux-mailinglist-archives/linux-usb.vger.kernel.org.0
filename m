Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD26F552CFF
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 10:29:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348138AbiFUI2O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 04:28:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348180AbiFUI2N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 04:28:13 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2107.outbound.protection.outlook.com [40.107.113.107])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F20C13D5D
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0TFudEtRsJ3XZ7zQ6p9Vd/bcVN86ZuW7u7eI1DlURJQIQvOQP2hE+tOqXSbCiesTea9UTFMYn9JBvhgpYYS2Le0Wb+GcaErXqkLnu0mHnovDKnz7BoTyxfFoe24OTH2TDmJjwcfdRAOYTlmd4hCzwR6a/CDD5LPBjNaN5tPffwo24OzfAQi1l0tyYMuNGOy2vpT/0tLIdsg5x9E7lB/6pUOkmzp3b/lV6w7PS1SdHAT8gNmqQozMoAMXKTOgn3R2hmMj9GYZTvO4Sy2hw5t8wBBjPEaSoJHD+8OV0vb1/5TGLjUKvq1PrL0CGzMI1Z4B4CU8juRsbEZZ132xQ0NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=186fQzVoWltkSvXDmUTM/gVZefkdDqWavUlZoZu4R+E=;
 b=fKuB9nJDrXVJndvgG++JXRE/CUdrks8yzF67QGWvWY795J0xq9VjFoqeMVyB7xbhY7NmNqladriqRwk+940WCWJk/+SdqcPqp4xEtcB26/Y6DP+eMloQ05Y05etVdbmlh10EZgnCVCG0IFQdbE4H/2E0oCs+w1iu3GEJ/5mP/KcYuaXV55JFY9vvRze4H0x+cpxew07rm/lP0UVS0Q+kNpeJFUP5T3bcBKBzLJCMMrUuSwkbC1LdeTB0d0G7v2euFOqgyar8sdBIRSaC6rEvA2uieRspv4J0MwPrhqQ5u/ctWjLHmpBaYszsUw7bNC1L6IORN0KTJlfhn79tr6l7+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=186fQzVoWltkSvXDmUTM/gVZefkdDqWavUlZoZu4R+E=;
 b=GWvoDM2W/L4nV85Eas+tfG8nd0Jqx3ZBva71b7WTbJEZmOPxDsflvilTx7Ifu+ZokkXnNLsWJPY0dRXs/xHs2o5ghb1XPXPRcFQwRcW54Vnx3AJ15nUtyQvoPj/JpSYodIpndJ9NFsKKDNoNmc1f50Y7sw0x1lOeIq7yzRXLKyo=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TYCPR01MB8111.jpnprd01.prod.outlook.com (2603:1096:400:100::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Tue, 21 Jun
 2022 08:28:07 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 08:28:07 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Biju Das <biju.das.jz@bp.renesas.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Topic: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Index: AdiEhAzZltzmXO17RG6ECtRMxS4cIgAu8D6AAAH9XqA=
Date:   Tue, 21 Jun 2022 08:28:07 +0000
Message-ID: <TYYPR01MB7086A377DAC14011066C239BF5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
In-Reply-To: <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad6dde3e-b940-4c43-7d30-08da535ff7d3
x-ms-traffictypediagnostic: TYCPR01MB8111:EE_
x-microsoft-antispam-prvs: <TYCPR01MB8111E327C98389DFC9F4F409F5B39@TYCPR01MB8111.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VJMakVwK1TmWJYrGlcdGAjTxo83n8hzRJMarxwZNhSff+jxALjbk6HHlXgSM+pcJ67sCkjVy/xRgEIFHQjg0rJHrf1+7KgmoXoUwacfOhQgurc2bmWxUPD+eEPCRw77YmIlMm2tlPhB447pE1uzu7fCFoU0IfEfEVMuLpsHYS2UJpE/8KRN+Vp5ItvReUHCxHr/IcWtJXhu78okEbQylqe5oNQ9NMSFyZiTdRWiETYTNs/q0CQ464/j7oLKiaBSGysEt3iIggJGQFOPbToETUHV7T8Plh5DyZUy/jKCbuxmpza1uBBYYgRPRpuACL8OKBsnA7V5WNUGcec7LRGv56cSo7+3EeohdKKaky2DpUOuismK03dGi+5gFXj4s8th/l3+F89C8CQlt2M4vZ9wVz+tnlgexIHj2UFMDZf2S9O9rz8idpoMLzy92QmhaJypHVWdp6QZJEqdQzlKEZonNFdCBlkTPuDwDlzVQ7veMLVvhzOzyHiO6Rq7r5/gSuYzJWCUb+sxJ0Ma0OlPSPMg43imz4icqGcpOoozEHimmMxq7+HmiS0Yr8MGgMGjTpsEgiycvH0MzCxvKBalujaAkEAKulYA6NqBMEEwRTItmwC1gkqmuVi9tBjSsLt9GgC/E6Mb9UDfsfyrkIggQ64gVlFe5ImKe/o8t0vMYhfXMpRLtLa9KqeZK0Uqul8iejibn+ouwjO1i1dkyo82+aVEFLr30fFkJtVy0+SPiRvemiCxdvgW1h7sUnblWo3GIikYwit29VV0MDYXnwLKqSF+IapXd/Vw4IK2RELqJBSG2opA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(366004)(376002)(186003)(6506007)(9686003)(26005)(478600001)(53546011)(41300700001)(38100700002)(8936002)(7696005)(122000001)(86362001)(38070700005)(55016003)(33656002)(76116006)(5660300002)(2906002)(966005)(83380400001)(316002)(64756008)(66946007)(66556008)(66446008)(66476007)(71200400001)(44832011)(8676002)(4326008)(6916009)(54906003)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8pgGdMvbTBZDVkKXGmi+/5oRRRnIQvdqvk5b+e8s4SsDrzJ5bTfEdUMfc937?=
 =?us-ascii?Q?jQDe6ktUuwJ+dFhMRSqssvyv63ghhlBtf9pzwlPrbQNm8MNBEJgrb2Blb7p7?=
 =?us-ascii?Q?jTGw+Nu9wl6NsaMjNgYA5YHPKMHtlIBZyGwt3Fl7aHyPuTzfNdlLY8vmuUGW?=
 =?us-ascii?Q?ye2/yq6NOQZumVfh91ScdQ2mQVw0EMH+H0hdeIu/NrH7CsfmNe3yV4lpO6EV?=
 =?us-ascii?Q?RgdZU0yZiWTa2sO4SjNOMQsCPqVJ1bgrNZRpM4Qmw90QQARTKAs//bkfKSU+?=
 =?us-ascii?Q?0zoIJCYfGgBTN3CBaOmrz0Y1vqUgMEV/KNLwXakwieUtcbHvRHVpq8Ib01Ay?=
 =?us-ascii?Q?TKOWtrP8h0Ag3EvScrQEurSQodbtUExEggZklnkILl3gQLeJMx4q0Hdodes5?=
 =?us-ascii?Q?mXblMK8BCVfaN50vm0kjxsIMnCQ84qhKTcGLQkv2dcMntD9sM5MDvxWDFZqO?=
 =?us-ascii?Q?6qtFcYDhEPb9N1gW0T69j407whN3SU4m30lMy9siJ7Hw5Q2ihFiiSOmD6cgd?=
 =?us-ascii?Q?TdR4cDT6pqa0wTSTL59sLdUxVcVzIXwLVNPzPciRQc6IXnVFLv4hG99h5ai7?=
 =?us-ascii?Q?yTkXA4mPBcp13SdBMOZo0OrNn3Jen2wtyocCGSJ7dTyoW+Bw79aArr2yw6q6?=
 =?us-ascii?Q?dLiuaP9z5X0BhQTJOePeXZ44M1tT4ldUbOeNn9cXDDjXWqKf5lg4KkUiTJyA?=
 =?us-ascii?Q?ResPK//COzXBP6HE9dTXkCpVCvUChCJINCMOAEWDaIWEseY9y4QUqWSz7wFz?=
 =?us-ascii?Q?u6gaQXtWvhUO0CBIHGAU8zqeqBhENX7icsJ9JFIwC0j6V0vemvID1PV/X3+H?=
 =?us-ascii?Q?TyKgx4tm2jw8XWkK5/rfkbP1SWrF5YyUEJ6WeV3uvJyjm/zcK4N0X9nOgzEV?=
 =?us-ascii?Q?i1MvqoqsZr9vdcnqgVXBKtq90J9P7NyAsiyZaIb/tya1OH4VNOdzjAS1BLmm?=
 =?us-ascii?Q?R+iSrJO608pYGDFXNwEmPNoDVALUwkgiswIsekK+3CIN5C49gJBwavhlJRKq?=
 =?us-ascii?Q?d2NSvtLI8N0ZI/OZN1gpv+JXUyTWyPtorVLeadXWq0YRFYZUQTc5Qb+/JKYR?=
 =?us-ascii?Q?6rRfOJh/iPo5W0L36d1lK3K3KPZC6yoUxASrS5Uw4F0yVBarKtic9vDA4Mm4?=
 =?us-ascii?Q?HFPGUILfaF27mfXplsae+o57+BMohgkiwXDPALILSPlSh5cZi92pGrvFflOz?=
 =?us-ascii?Q?pnC6fymPanpzcktfMvii+2ngzBv2txSL+trQRDZPXF6A2A9/Qiqi9dMN5piy?=
 =?us-ascii?Q?3Cy/USpUPbVeRDjvHdRgVKJcmRlJ2XqJpBG7uyJNGGu/WtG2P7DEeIZaQ7VU?=
 =?us-ascii?Q?EG7ay6cQAMCxXMRMEAQdJBo7/NQbbV4IFkSxeEoL4fQdbRaVedLyfR2aSxXv?=
 =?us-ascii?Q?xYYsKKQ18D36WfTE6XIjBixjSYeERN+70CoL/eROkmQ+IRVOEs1oMqi0VRHL?=
 =?us-ascii?Q?TVkYzrUx2179W15YkYaviKH4E3bJYsidIO3cW84jwfAGU51V/BX8A0gi5QgT?=
 =?us-ascii?Q?bsfDJO1dYse/GPHFMbOV/jdQwNjMa2p7HgmzVIlLjKmtwQuPe2WipRIajDGL?=
 =?us-ascii?Q?MKVythKzlQrnnpFbYW3oucK611ygCYgP9paEKN5QjxWeTDpKgrzRfC4RkyL7?=
 =?us-ascii?Q?HmAnVXBQhyUo18+FIlzhWlDjc251Z0thZ/IyyQah3gLOKoEg7Cy3rSS5JUZt?=
 =?us-ascii?Q?zYpsAGCTENIL7SnOcWtxC/O435164AgpRTk0A8RNR5Vp05Q/HENO+k/i3F1C?=
 =?us-ascii?Q?V6zS/PHnPk/olbHjc3nRY1NOT87LdqY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad6dde3e-b940-4c43-7d30-08da535ff7d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 08:28:07.1021
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +9vM4E39QGOQB+cqYx9mZjTXy+xZ1gPHigohXtrNZntZl/gib9y8Ttylx6XfbgFYP15RfvwHuniHdB+nB9zhA7SlvxE7Z4/odfsda6ddn2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8111
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

On 21 June 2022 08:23 Heikki Krogerus wrote:
> On Mon, Jun 20, 2022 at 09:04:10AM +0000, Phil Edworthy wrote:
> > Hi Heikki,
> >
> > I have a board that uses the TI HD3SS3220 USB Type-C DRP port
> > controller [1], however it doesn't have the interrupt line
> > connected. How would you recommend I handle this? Should I get
> > the driver to poll the i2c registers?
> >
> > [1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
tree/drivers/usb/typec/hd3ss3220.c?h=3Dv5.19-rc3
>=20
> If you have some other way of detecting connections on your system,
> then we probable could consider some kind of notifier, but as a
> general solution for the lack of interrupt, I think polling is the
> only way.
Thanks for your comments.

I wonder if this is a problem that affects quite a few drivers, where
a generic polling solution can be used instead of interrupts. This
would require a driver-specific function that can detect when an
interrupt would have occurred, e.g. by reading a register via i2c.
This is already done like that for ethernet PHY interrupts.

> I'll add the list, and Aswath and Roger. Aswath and Roger were looking
> at the same problem with the tps6598x (tipd) driver.

Thanks
Phil
