Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B5C552D43
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jun 2022 10:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346652AbiFUIn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jun 2022 04:43:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348623AbiFUInu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jun 2022 04:43:50 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2124.outbound.protection.outlook.com [40.107.113.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF9C523150
        for <linux-usb@vger.kernel.org>; Tue, 21 Jun 2022 01:43:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jF53GnTsZnGAa1z3cJgIDvO/0g8K8hE5eAELEz4zBlMy8UZSKUg/sZIwrVpOD8Y+pG5olysyqI3GdomkSLgdwPYHuqv/FrdAnDlNQub0A0ijEeLB340pnpAT2CetuTHfeOuGSzAuGoOikQDrVZ+yQsmBxr4+XtckN7js1REfnDVSli2i8PFqcyFpEg4JK3Lo5+bBMnK5mYCb8Ii7ep9/r71A3j9XoS0wHguMmPNHVoA6OhW1lw3S9poiCFzO0Y7/PpLbFXJBr7febkmIkylS9b1zR+txXXTNZS8PKQR1aJC3UkBE1KZ/wM/uCPpRvqKlsDTfT5VKD2D3RwCYn2PQlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/1q2BcX7OwZLXCditTrpPuZrKSogM6JFk7hPyrohcWw=;
 b=hykh06Y+edMF8R7WDpp1PpOGPfVt2EGo7nN2liz2L1jjpuPd+moqTlEcMDbzu4qAwt1rJKk2e0N8UhGHF/ooxGI9y8NrcqGj0U38mRkxbzMTVLnKCOdBzyD+cQPA4VXBnAUByPEjSOwkb0hbw2ivfvuIN4VdHzXeDoN5zNy5JcuLKcQ4cCLwNKNkrliXF5VNQrBcpXRbrgmaMxL1MxFDpOTj1c6S/AET/jBVlQqkMGtWzompPFVkkIFdNG5LSPr9s8n6moE/HOMTjY0ZFmiDPGBJLFOL0Th+xlQLxz9227GjHnETQ0UqdxMv+wVrMU91Dx28uI2tYbXb/uceME8ZeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/1q2BcX7OwZLXCditTrpPuZrKSogM6JFk7hPyrohcWw=;
 b=UkKIlVQLTmS1PmxnOZnjKxp4/eZ6EeEmWLhe2/c0t3rxsiS9PAbtFMPs9tbhYXUcjPtWO9wXCMQTeacxqzD5HXPtuVs2v3MUx+EbTUX28pP1xNzGMcwXf2Bfjz/QU5ulKRRHbmMwb3xxk5gtQrxWKjrzyTJIm0fCiS82/OHyzjw=
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com (2603:1096:400:de::11)
 by TY2PR01MB3210.jpnprd01.prod.outlook.com (2603:1096:404:74::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Tue, 21 Jun
 2022 08:43:43 +0000
Received: from TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244]) by TYYPR01MB7086.jpnprd01.prod.outlook.com
 ([fe80::e180:5c8b:8ddf:7244%7]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 08:43:43 +0000
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Aswath Govindraju <a-govindraju@ti.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Topic: usb: typec: driver for TI HD3SS3220 USB Type-C DRP port
 controller question
Thread-Index: AdiEhAzZltzmXO17RG6ECtRMxS4cIgAu8D6AAAH9XqAAAFU9UAAAa+Cw
Date:   Tue, 21 Jun 2022 08:43:43 +0000
Message-ID: <TYYPR01MB7086E0BFBDF4D8447BB80746F5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
References: <TYYPR01MB70867A4B8CEBD6450A239D45F5B09@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <YrFx8RFYgF6RWckE@kuha.fi.intel.com>
 <TYYPR01MB7086A377DAC14011066C239BF5B39@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYCPR01MB59333B58174461B2F414D74E86B39@TYCPR01MB5933.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB59333B58174461B2F414D74E86B39@TYCPR01MB5933.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 605e95ee-8796-4ef5-d8f6-08da536225e7
x-ms-traffictypediagnostic: TY2PR01MB3210:EE_
x-microsoft-antispam-prvs: <TY2PR01MB3210DF8160B5C01C35E64B6CF5B39@TY2PR01MB3210.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iVsqZ9X45h0c7RJUzUQLToZk0KuwXBTlUuWcEmY74Fd4fBcxoWS2r9LcHKsHuCT5L4qB7G9bPrIQrNiyQDLHvZg5T622PxUtswf401bJ7wp/uvlYPsLdcMDyDRgORamAfp+oKby7c9vi6cf2wWa3NzSvgIqf2Bwhjj9QDDDjM7aQ4lqf9ZP66ir66NOx+eJ28MSkZXp5iecK8+kR883PzZrHD7zyevzweEFygc0bGDN+WTeLoj0qwit6yjxEbewOWj9X1wfnh9Wy2F8/PF3m6XPoTVMSiC7wXQBUoK6RTWOb3WQIBt3Bdcsn70jxDTCVqR3obiIEm5lIeZdlgr1pOKBIjKBysB+QUeI6wBBk+uwqHCgUkkpkMIyJngU9VtD6ZU2CoffWFo+74uOirA1LBtRp7ZaqOslyvSXxx68b5ZY1Yu0RQINB1yuEjrKqMFxVg/zj/nmkSI92JhFK9GQeNKuyePEWdsiAXqInrlOjLydG3dzDOzhvXK2OiQtjbZzV4HvtMq3BM2cv8Ayvzw4Qo3xjX+sEtmk8ywhDEhAabQtjd0igiWVQxd3oAc+v4Z0bZwjslgYER+XO9WcqL4Y2QkFjEHtRkfPYYEnEaunT35URE0+CSH7JBPz45GeDbo/LMvVa2ZFJn4jAXxh0PmRJ4Az+s3ejjCI8BHq4DIsI/84f6UyHG0P6NpHDgpcdABzPN3/WMileckcDOAfXiGoVF6xF6wJyAnHwuLmNMOVJvh4ypoKLTQ40tuhS/+GFM4RU91u5B6tyuqyo/ZhucVysmiqPYn7RsUTf8b8AZwE4z5E=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7086.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(38070700005)(8936002)(86362001)(5660300002)(44832011)(38100700002)(52536014)(122000001)(2906002)(9686003)(54906003)(26005)(6506007)(110136005)(33656002)(186003)(966005)(41300700001)(55016003)(53546011)(71200400001)(7696005)(316002)(66946007)(66556008)(66476007)(64756008)(66446008)(478600001)(76116006)(83380400001)(4326008)(8676002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GycUTdOSfjrNo/ece+Y6s9dPUvr5uYg0G96j5ar2lg95TYoF93r41CLxPTwC?=
 =?us-ascii?Q?9T9+yn9yKZADOudgFdPyKkACtysQLW588gwDvBXV02yK4njewY8paEjjBKul?=
 =?us-ascii?Q?4MjBMZkjBb42kOHNynOviIzE5ScehuoGTYUO8U4Ylj4kj9Nloy0dMt+TgiB4?=
 =?us-ascii?Q?Z2DBnDJbdBMejjkj57kTMLLbnftd04ekHNtbOwJj+5oIR2lbniVrWiRBgYd7?=
 =?us-ascii?Q?KF7JnBqkLA3nWrLPgiA4z6b170KmqmsLLOFhqlTgBQfWO6GqRxTGYJyPMA3E?=
 =?us-ascii?Q?zq/JYf320tdnz0y6mu4UUGdqSMkvlVb2WEhd0hueav9+m6s+N3iL+w7LNBNd?=
 =?us-ascii?Q?tp3/7irr77qs51VZbd18P+erZFtDF9LeQ1tdD6Hho6QmgRf+bnDm0o8KZJW2?=
 =?us-ascii?Q?cK3dfxEL+1icesfBYs2deqlrWtDor/nk8OdBu0RQk35WhjL77jlGKrpe/YHi?=
 =?us-ascii?Q?QVkCdHXJ/h2lUtztHkyAip16aGJ/MTvLYp0thuHAFCWTDmIOnrqkpi528Uuo?=
 =?us-ascii?Q?ga82Ck4WOByLsOr4dXTkPqGCZ8jIRvPGQeVerwRpHHsLIQacS7rvu3PiKv7L?=
 =?us-ascii?Q?XOxSChAL160rlGkBkG7C+QNe0KrViQF0t7mLb/K0FL2pMuBO7eiHmbE+J1G6?=
 =?us-ascii?Q?6n47fW5IZizFfePAKV5tHwE70rJCOHcOf0w4IAVswr8tJMsknYxTBJ9fSUsf?=
 =?us-ascii?Q?/BfT6WazkTUNJRibfzqrozyt8Vx53NPKp4Mu9pM+XQgUaj/Bep209sZnF21C?=
 =?us-ascii?Q?iYsGt09WDfR6OLFyDqhoug4zpd4jDNdO3g4RlZ4NTd1Vz0BXRQfPHAnNCFgQ?=
 =?us-ascii?Q?UywDzgXv/1Vv13Gb742zfRLBhcFQ+puyMNdBhLt8bDJnpg6ivK/B2pUQLqcU?=
 =?us-ascii?Q?zFkqp1gKP8EyA8h2qvphDhTrC9nKuUHCk4tQxDmdr0dRsQnEna4fp0xHJ9xt?=
 =?us-ascii?Q?KF7WVqNubkxOz0lkomGJYNRq+O+rFCBAc5HKh1CXwOE7wL1S7Bl1TAXO1x07?=
 =?us-ascii?Q?4LdO2tnGVy2ffb/bCB2XukzTr8QZUyR3g55lz2aVI8+2rij0nSUeNCT4cDfv?=
 =?us-ascii?Q?EDEWs5erZpBR4ue8EkCPTFQU337aBB90WEKNpm/HX1SB2Aj0kMvMZUV6AT0z?=
 =?us-ascii?Q?AA0riuFaPV+te25PPaQ5mtlrPjk1aQMl8fRi1Qmv5/Ja+hFbIPdmJtDpzWrB?=
 =?us-ascii?Q?i93qI/NEvIdwP5i1/1LBZPaCVSwST7Ppk2VK7bQh+/23TkJETX1uYzR5I120?=
 =?us-ascii?Q?2L5wEFZLvyJhYKWDG+bc9jtaoP4zfJTPoHH1GRZhIvxSHCBugNxT+T5SGSwi?=
 =?us-ascii?Q?EwOLEZLfivixn+Er01plqGKfxRd1tPk3xi1ZVzKKKm7CyG+KF8KjkEoHnpm4?=
 =?us-ascii?Q?c4SFOLOjMCBJnTxyQ/Eb+betlSLqCKMk9Ekc4j+N0HE4nPdSFBIU3QwaTvtL?=
 =?us-ascii?Q?Cwsb9FkdqRO+0ZWcO50R7xMBOY0XrVo8lQm79Kl2umUThSAoFWHSs9875hxC?=
 =?us-ascii?Q?k1QaZKpIALXnCMAnOJHgrT8V7rrigAvt8lFGOoZfaYCACicV7xIISddbY/5b?=
 =?us-ascii?Q?5V9oJuuE8qMKw82hAMEDSOlJpUxbUCk2KlW9TOYCiCBpLwfPKSCa0EDJbqhk?=
 =?us-ascii?Q?2scxTHoH6KGQdSMq6mXPQGAMfch3hd9M4M7jn3CsMbnnYo0Q8yp4Yf3kkCjW?=
 =?us-ascii?Q?PX1eBOwpvLZeqUrVTfhVKE64L7kKcEVS75zfxgq4Qpqe5nT5fu2j3UsGRzx7?=
 =?us-ascii?Q?ATdDlscX++/2FWCXKztDV+qMvM3+cRE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7086.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605e95ee-8796-4ef5-d8f6-08da536225e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jun 2022 08:43:43.3885
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZSHG4J5E1MUNJ3/SMhzQ13tLsV63jGCM3Ibx41pOS/yNxtoKL9odibnmE4y0/jrJL4SLLTH4bGYkbwRwGFqZbtrcjuD9vZ9uNnBy7lrTCgo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB3210
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Biju,

On 21 June 2022 09:40 Biju Das wrote:
> > On 21 June 2022 08:23 Heikki Krogerus wrote:
> > > On Mon, Jun 20, 2022 at 09:04:10AM +0000, Phil Edworthy wrote:
> > > > Hi Heikki,
> > > >
> > > > I have a board that uses the TI HD3SS3220 USB Type-C DRP port
> > > > controller [1], however it doesn't have the interrupt line
> > > > connected. How would you recommend I handle this? Should I get the
> > > > driver to poll the i2c registers?
> > > >
> > > > [1]
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/=
t
> > > > ree/drivers/usb/typec/hd3ss3220.c?h=3Dv5.19-rc3
> > >
> > > If you have some other way of detecting connections on your system,
> > > then we probable could consider some kind of notifier, but as a
> > > general solution for the lack of interrupt, I think polling is the
> > > only way.
> > Thanks for your comments.
> >
> > I wonder if this is a problem that affects quite a few drivers, where a
> > generic polling solution can be used instead of interrupts. This would
> > require a driver-specific function that can detect when an interrupt
> > would have occurred, e.g. by reading a register via i2c.
> > This is already done like that for ethernet PHY interrupts.
>=20
> You mean like PHY at subsystem level, check IRQ is present in dt or not?,
> if present use IRQ otherwise
> Use polling.
Indeed, but something that could be used for _all_ i2c devices.
=20
Thanks
Phil
