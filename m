Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1CFC5552DD4
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 11:05:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348597AbiFUJFH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 05:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348557AbiFUJFD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 05:05:03 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2103.outbound.protection.outlook.com [40.107.113.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 753251D320
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 02:04:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CTL2crWArbsvB9b8QAIJVmYNgDC53EpFS+S1rRSo+a2wDZ2Sy14PMdJjwZNflj9F/Xkxg2kiYgVkl0AOa6CLShcNHbEhCmbMhKEgfOOnQiZUPgo2dwsWol4x9CgLiwmaVO8IomyrxRfxLf/lALB6EL9I0E8XfhI5WyUzk6smrWxvDMN2boWYddb3ggtLJX1J/cD/UcdQ1yeWsh7R/nCGQM3X/XtqOXikhwt0zeiexEkm+tmBHca4vxEsKrQKWWAwTXMLfyfhNXPQxmpbNWmeVhNHNKSOXYFqvzsqLC8O4cBsqkeqMlMGkTUSdGk3rXrcrDFems5KAG7zuYEpWZXJIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EaGnCC9z5rbd/TPKSWxMNvyWF1wxv32Vn1sBB9SERbE=;
 b=Qvn1RB/fkc1TflKjVeK2/Q0hCGNgBKhX1S5eDIVJ9l5MKuH8SGWZ7rnD+JwO0qNtA+ChfPHBDsc981KV2Tmt2V381rczB3SPAr2Y3qKhwwKcFtBP3s8KFxsgavV6srg1CBxoej77zI4Sarbk6OV16u8qcFB6ny4wxig5azB5ZJK80uNnbboKYbv2DCw6h1lJ7i1G0m8cwoPxp3KaVQxLhOCHMVeSVhxjvU0hQHxJW2HvgPExYVnuNRAGFEOPKNmbXFxGhOdZCKDKVCjBQ+7aFCzThzQBdFQ+Y1PbVsMlH87+T9gu9oM7XTdNvXn7Kj4kmWiRG+VdAiVDBNaZzmt/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EaGnCC9z5rbd/TPKSWxMNvyWF1wxv32Vn1sBB9SERbE=;
 b=GAMHA2XL4kVCmS5YmGq/Ga98ba9lkI/Jy8Sk/cvUwoSeXMLvOvHoKI3uCNx/yw4S+XQ5mJ2CSYMo8W227V5fAVSORyHxj29thXUWZqQqncqhtiE4qq3KXLKfKFUEKTnYDUxinHUDyj9tUXuvbZXaAvQB5eV2n3tCv5QhynX2228=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OSBPR01MB1928.jpnprd01.prod.outlook.com (2603:1096:603:23::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Tue, 21 Jun
 2022 09:04:47 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::51a:bf36:d36f:c043]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::51a:bf36:d36f:c043%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 09:04:47 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Aswath Govindraju <a-govindraju@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Topic: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Index: AdiEhAzZltzmXO17RG6ECtRMxS4cIgAu8D6AAAH9XqAAAFU9UAAAa+CwAAB4oPA=
Date:   Tue, 21 Jun 2022 09:04:47 +0000
Message-ID: <TYCPR01MB5933BC8792DC04EB921DF5D486B39@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
 <TYYPR01MB7086A377DAC14011066C239BF5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYCPR01MB59333B58174461B2F414D74E86B39@TYCPR01MB5933.jpnprd01.prod.outlook.com>
 <TYYPR01MB7086E0BFBDF4D8447BB80746F5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086E0BFBDF4D8447BB80746F5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b2b8b574-f8ce-4064-78b0-08da53651788
x-ms-traffictypediagnostic: OSBPR01MB1928:EE_
x-microsoft-antispam-prvs: <OSBPR01MB1928D90D0F4F677FB0A8728586B39@OSBPR01MB1928.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mdkF/raebP2BMj0AdtrBg8AlD6EGOoImACzvnG4JgyXufwGwGdw4o5fuL5mzHImThSochIvv3bLr64ezrM94bYVhtPbfM94NwJm4aAtB9kHcZ14piVnCOgPC+/+p1okIFVvvO+WrkVBHM209Yr8hkvNt8V159pfH4Cqg92wzbtzaBtglWuHenwSnJFwpG6ER/jE/eGNQ8IugoXPcCMB0zPJtSUfDU+72SkoSKpfTfZsiWSQysGzkMKPCG7t64UjvZvb1IQDZtoixjXj1Y9JkRxM1A+euVXo/oOPZ5SmB+JyBpUXRUREacF7ii1aDovtbI5M7IRsClQzNjooe+sQQL0+a1P+qgoSOI6A1ndjkZLKpW/1pCb0jdhLSz9bDfil7kuueOzBTdqo7ZxJTgcpzGaMfBpJ54glrUQhSw5z7CoPW1bPchRw9oVKZiD3dwhaJBW72XweNPjesfTWiDb7BImH2td3h6Zji9GGgdDpfMfubP+LJGPQN79cKfFEs+V8c91s2tiiRl6xc6RbmrnQwrMHD7ylcR+/Malnrj6SHfeBF0Wpz9oQslQcLXMNfsgglsjqvlTSLGBduiqMhpa+1iL69Yu9CKcTcsODEFYbY0JReLJneyLlf/o4RwCWVqEoHaZ4HIfDR2BJLkV0LrPz776JBV+WK1oW4wi1ze277OXzsTEyTgRv9OnqbaXSvtopMHAZye8oUJbsj99u3/TVHF8OhgkJ1AaP0GbMuyLaiIALxjzun1SiVh/Hgej39021mCw7PrQJaj6V8JIhW6UtFFS90son/plfVwI4WZPVu0t8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(66946007)(66556008)(9686003)(71200400001)(76116006)(64756008)(186003)(966005)(66446008)(66476007)(53546011)(316002)(26005)(33656002)(8676002)(4326008)(6506007)(2906002)(86362001)(55016003)(83380400001)(41300700001)(54906003)(7696005)(8936002)(110136005)(478600001)(122000001)(38100700002)(38070700005)(5660300002)(52536014);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?R4WIo6oMh4gMuciij6uw1KFP3JzuDGtpMYD7KpZi5SXaIdBLVB/Rks16lLSZ?=
 =?us-ascii?Q?pg0meJYEHQAnGF2km9sRdoLkwkUjJvT7JM91Hvw504HLdBEiQQ7oHD+pZ3R/?=
 =?us-ascii?Q?zyS/XRWrmfKH/5mMlYNbSI/aFKGZKHKzOPfkPtOHbcHHuEbPtJabzhJbLPy1?=
 =?us-ascii?Q?sdRJUv5n56jX5mWrSpQlx9Szw8w/+TcGSThsz7QxHq351WlgpaFyhC51wyNg?=
 =?us-ascii?Q?Ew6/pXXahBfDjRdxI4jQcjQSMBdKzzI39JYl0MXWu9pBo4g6ynd2kg5wsfzW?=
 =?us-ascii?Q?Wd4TtHMS3d65ix0sKfw0fR65X29F7aylWrFshhS4Y+heIPNUNDVifWLnpSTt?=
 =?us-ascii?Q?5W/cgYW0Yn4W0k+veLK+e1Aq07EC3OLtA4MrW7oTaEqcEWekeD0qzQH6QBpf?=
 =?us-ascii?Q?eThLubIof/5sy4rU6jWzP333hhmnYe7cJoyGgITITuDkCE62GsqEhcJLKw1u?=
 =?us-ascii?Q?mnufr02pRUVhgnOs+QLf+n97AKPWTO2U/IzW7ERt11+CF4qX65E3s7QVuZAj?=
 =?us-ascii?Q?Sk9S8OtoGPZlVkwKK52+1hNieTBw/I/cVvvKcO7J6DTP1cCqS9CadSwwGxwe?=
 =?us-ascii?Q?poX4sOFfD0GWyY2DyAXeEk+3MAVh3aYxiv7ObdEYUynaid9RrdHIzfmgOk6T?=
 =?us-ascii?Q?bPFCg6sohn1dwgPzAARPve0jUQ//i1VE0Wm8TN/w/ny9AICv2tHwaM18KaAl?=
 =?us-ascii?Q?bKhuHouHlRVhWfZO16spj79AMu8NAbq4GiZhfHHWbwA8r9+3M213GuehrCzf?=
 =?us-ascii?Q?lICCUMBlV0NwuJSzUEGfov/Wdgtek+acbQbjNo0oWOuzR27GaxMK/7Ou5hhI?=
 =?us-ascii?Q?QNbFvXxuzROiu5nqRf/cdmj+J11JaF/kq7AJdoLHkgTlHheho7P/81o60nuw?=
 =?us-ascii?Q?z4yBoEuawwUBJSltlsG6QqZZGvj1W0uMARQf/+oD4eta44iSA5KzYP0HdBFN?=
 =?us-ascii?Q?ILc5Pf5wPZ/miEQiTA2Manq6oWhLe9UDNU9ws6f0ZxzG4fP426WiLxOm7PMT?=
 =?us-ascii?Q?1eOiwbJd1KsuG5MJ5uci2Y2Y+by/FMRXhIZdyRNwxVtxk7GQxcliwX0yP9oi?=
 =?us-ascii?Q?0BihvAEGvpg8BZRE79vZd5h6ky8RUtx5khhjeViKBDTt56SVqcua9CKuaKwJ?=
 =?us-ascii?Q?Ex/H352OE8QFlKtP3ah3U7hVohgI+xJIwnh7L4ihq+boAxxP6/MOqd5DHefO?=
 =?us-ascii?Q?Z5nqCi2gM3GCcmtYuwOAHTMrBftFS9wRqFuj41FT6qYdSK5LKg28DIBDyX5y?=
 =?us-ascii?Q?IFrCiiDFFqJOb/VA02BD1ZFnBjHs66OBc6vIednJ+iSs2dDJu/Ahak0xnI2n?=
 =?us-ascii?Q?1a7hpzaFgszwlNpmFF4l8MFCttM9znb9GY8CDrlxlyvrp/p+wkeNjfxaaulG?=
 =?us-ascii?Q?I92Cgq2ycmaou9H3grkZ1xClGyRXpVZDxy+/JzlnSEh9glOiDOYWhO07HWG9?=
 =?us-ascii?Q?p5vHnYHWG5rancZ1UYrqb8nUaarW6MTW2+Lx2Cs7ymiiWDZIHR3DsDJakbro?=
 =?us-ascii?Q?osHhVZQIk9puW6xnnBppvnAC1nwLJlkrfCZpqs/eQ82BOXHWChZOKnHZAicX?=
 =?us-ascii?Q?O80gbAPkT7iE4bo7TVBhiwUJ4qyUUKEMbGVdwUkPV6xUITn+DEnNZ6GMt6FF?=
 =?us-ascii?Q?Gba06Jndpw2+5LgD0b1P8aRrbpnaUeRuHjblkJo84c+r9UOCF0zpqgkIePw0?=
 =?us-ascii?Q?flcMdq66268iL3SrNkOZeCDOhw9KWzx1TpeT6Ymr85EmcgFx6IFJiT7V7asx?=
 =?us-ascii?Q?+ySgIiNWNLvoJi3NYRC/MXKBxtgyb5w=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2b8b574-f8ce-4064-78b0-08da53651788
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 09:04:47.7812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RLbwc1W6K+DyUAYu+qiwn9dF/s+SVHvt8iAz7P5z38GS9IxpmK7Q6oEWLKeFZ1176u45UMaGcRWL+dQ+zIW/1PVLnZtE4yUGq10csujUyMI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1928
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Phil,

> Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
> controller question
>=20
> Hi Biju,
>=20
> On 21 June 2022 09:40 Biju Das wrote:
> > > On 21 June 2022 08:23 Heikki Krogerus wrote:
> > > > On Mon, Jun 20, 2022 at 09:04:10AM +0000, Phil Edworthy wrote:
> > > > > Hi Heikki,
> > > > >
> > > > > I have a board that uses the TI HD3SS3220 USB Type-C DRP port
> > > > > controller [1], however it doesn't have the interrupt line
> > > > > connected. How would you recommend I handle this? Should I get
> > > > > the driver to poll the i2c registers?
> > > > >
> > > > > [1]
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g
> > > > > it/t
> > > > > ree/drivers/usb/typec/hd3ss3220.c?h=3Dv5.19-rc3
> > > >
> > > > If you have some other way of detecting connections on your
> > > > system, then we probable could consider some kind of notifier, but
> > > > as a general solution for the lack of interrupt, I think polling
> > > > is the only way.
> > > Thanks for your comments.
> > >
> > > I wonder if this is a problem that affects quite a few drivers,
> > > where a generic polling solution can be used instead of interrupts.
> > > This would require a driver-specific function that can detect when
> > > an interrupt would have occurred, e.g. by reading a register via
> i2c.
> > > This is already done like that for ethernet PHY interrupts.
> >
> > You mean like PHY at subsystem level, check IRQ is present in dt or
> > not?, if present use IRQ otherwise Use polling.
> Indeed, but something that could be used for _all_ i2c devices.

It is not only limited to i2c devices right? It is based on the port contro=
ller
devices(eg:-hd3ss20) on various systems. The device info from dt parsed at =
framework level
and determines which method(IRQ or POLL) needs to be used by the system??

Cheers,
Biju

