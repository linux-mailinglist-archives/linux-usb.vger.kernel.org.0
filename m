Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB424587BD5
	for <lists+linux-usb@lfdr.de>; Tue,  2 Aug 2022 13:55:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234056AbiHBLz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Aug 2022 07:55:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231208AbiHBLzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Aug 2022 07:55:25 -0400
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20084.outbound.protection.outlook.com [40.107.2.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D05EF65AA
        for <linux-usb@vger.kernel.org>; Tue,  2 Aug 2022 04:55:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c/ohaiAetR+5KDfLf9WbCeE7G0nUvPJ4bl43N1tJtC/aVZ/W7tkQdQutgWTPmEEZxRSWyN97cGzCzqiLksyMG9acNJ74ajTAJJ4LfBjRFM5dcCmEoNZnfn4X3t1rAD063x8nRBNeDRdBC8WvptNuscJpEz9gY3XY08e0CwpZIGr0Ur8tu/TejeI/TB3XcMVOfP0Prcxc8MIB43XcFCp67Y70lPzJllT0AdLvURRLe3tEzbeTLNdanBTR7snSqFbeY9JDjpU3199y1Fp3+jZKxrdvnwujj84g22ytmUhmTcSIpy44D7ExTG67KRNpF8LI7MDIgHLTKA1fIFvakXGhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oJPU+oxXX43YDNTsK2rWYmhKxehkoNdG9tz2GS05+G8=;
 b=mQ4CUqqNcKLfnHN/Sn2i6kSjO8yiqPGDGBpayy0qd4t5zfpJU36IB/I3LAjmmv3ctrVf7d2HlMFmiruz2JPBEZbMUT/q4L4/HeOekg+0pQ9JZrdCtUlMgeiDMBPNnBRcT8x18wnvV9IDJ2WHZlG2+EGKezQdWg9IwjVY56BfmVRfyNXm1a2np+4BsayE8f0aSGYxIdPslbD3X18Nx0sef24xqhpphcYmTOlGa5lKo1xDO3cT8J6lYQ0nVtgKrTmjP21LfYWMCGZlw7TEd4nwTzOo6QGiakWZWjPY0rBCHba7Z2VDOI7/diBZcN5Yf5T15xFjIAq9nQOe6GDr+8uDfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oJPU+oxXX43YDNTsK2rWYmhKxehkoNdG9tz2GS05+G8=;
 b=ftUxpm0GQBVJQCAPTVrDRndQlb2Bc30Kj46qsN2ARpxgFVPWKGq1QjvxRv+OWCGhe7ShUfPDYsPRQzZ8bzyYhRyx2QNQQap+kC/REHXo5F8UpGgAaLfDtEdsOq9NwfYqzFUf8QLcADQB86KnNNobk0kxNbpUVK6UpL0es51h7bs=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by DU2PR04MB8757.eurprd04.prod.outlook.com (2603:10a6:10:2e0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.16; Tue, 2 Aug
 2022 11:55:20 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15%5]) with mapi id 15.20.5482.016; Tue, 2 Aug 2022
 11:55:20 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Nico Orlando <nico.orlando@dave.eu>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "badhri@google.com" <badhri@google.com>,
        "michele.gaiarin@dave.eu" <michele.gaiarin@dave.eu>,
        "daniele.piccini@dave.eu" <daniele.piccini@dave.eu>,
        "rosario.borsellino@dave.eu" <rosario.borsellino@dave.eu>,
        Andrea Marson <andrea.marson@dave.eu>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Xu Yang <xu.yang_2@nxp.com>
Subject: RE: Power Delivery Driver Vsafe
Thread-Topic: Power Delivery Driver Vsafe
Thread-Index: AQHYpb6WJ3NaBPtkS02Cq5KMrwtywa2aQLeAgAE5i2A=
Date:   Tue, 2 Aug 2022 11:55:20 +0000
Message-ID: <PA4PR04MB9640CA479DBA96E737D082ED899D9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <883632a9-d4e2-6985-6be2-b7482f551533@dave.eu>
 <b09aea15-a6eb-1847-46a5-64970a30a06d@dave.eu>
In-Reply-To: <b09aea15-a6eb-1847-46a5-64970a30a06d@dave.eu>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 313df0e1-8c39-4ba7-1777-08da747de011
x-ms-traffictypediagnostic: DU2PR04MB8757:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JmRELPpt0lV2AK3/crAakIoj8caH+BWmWmvyzE1l+U3+yCY1sJoPlvvvMkcWE178sdb6Bk228sbCJiwzb++j1ew9Dilap+9JaelrevYPmds1KcCsoin1u9AhLYwmhyzPHXN7+xUEYDbCCw6wweyT+tycCtNTdgvrDx1ocBkPqSbpNi68f0Ko+WIPRsfdr5wyFm4Xk94+Yr7MY7tLyPDm8+h9ZIzE3gawWTYzwXkiAjmpC6g3BvN4Qt3yS//o4aPnwy3M2nlekkYtFoab/NePrCrfdi1Bh6Zri71f9yNNKPsujMYGbSPu6pBU1srTklqzAW9QNLgSiAZNzbtWZ5bpshA+ZzrnBM4DuLwvGs9DVe3Q4ks5G434GmyTmpY8DOvA+4wP8vdSfJg3PW5D7lrJFr8ZrH69O2dRrOhkP6Kgq9wHLku0UVDAn69cEMl5uTUkQllzPVD3x1i6f2w/Oa6CCOVVIA9qXdrtHJAVfFjhs39WtXx6wUvLcfO0r3dwv1CaWompc1h7xrHUqKlIUcD3UJps1AeZmBGtg9W9nC9p+QpUAwDs8XKQh5KxZY9om4XnvMUsCGpCk/lM4NUsZHVTsvrt1GKcQJp+l/omNwGUJCCCMfSuEKmdAcf7/VOxMz7cLeMrzHQ1dWpZYlA0oPTgtw9PLtuWebQnr+FQqcLErg/00t0F2dCEYdxDiWqxz6A8199xsZlpk6v5bCCa4rv6JlSCux+MuJR7VAyd8bUYrak17JVb0POXOAHQ4Tjs7qCxmyXDeC9PdJkuIGlipVAAfL1vgzQl9qYw/ixn42fnjoBH/CaVXRJw4DTogYK41MmA
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(396003)(136003)(346002)(366004)(39860400002)(41300700001)(2906002)(5660300002)(7416002)(83380400001)(71200400001)(478600001)(122000001)(53546011)(110136005)(6506007)(54906003)(33656002)(8936002)(38100700002)(44832011)(7696005)(64756008)(186003)(38070700005)(316002)(52536014)(4326008)(66476007)(66556008)(3480700007)(8676002)(66446008)(76116006)(66946007)(26005)(9686003)(55016003)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cBVRPCku5quJmXIsU88Ftz2O3aW8Q9h1CdgjQIyKamy7Dz+hFN1kWs6+ijV8?=
 =?us-ascii?Q?+D56AesoX2mNIDFcj9A4rbFgJ+gY1zWD/7JpMds6lliga3GuJ55Q/s1IIeNN?=
 =?us-ascii?Q?uCSFdE6rjtL+CCO89WzC5d8KqyQK20nPu7ST3r7kmlwFjiZm42py5UyhxqfU?=
 =?us-ascii?Q?1RfmDo9trQO0Z7hWvlHLtN/VYHesWqsX3dC8tjnW64+3Gk3FooLqqUYMIIZ/?=
 =?us-ascii?Q?2FbmMSlSVmaZ74gZqoki8Uv2O2320d8OIUsrcHHTyCzFCe1ynE3lEMxR5PrW?=
 =?us-ascii?Q?kvNSSR4rqkrkwKXqPSmb7sRDmT6tCmWOfP6Q1GUKHAtHbcemoHvbjOXFjG/S?=
 =?us-ascii?Q?TiAQeBPEt45+7+8qd8ILHdMqAV2Fbi/uUcbKx1M/CWRC4sDds6AJqLRnFdxH?=
 =?us-ascii?Q?ApNDBTFdV0Rukt5eWGmHMLsXz8SlmJ5nA6ai+PA8xzxZ25kzDLDW9FIQmr28?=
 =?us-ascii?Q?8/UKXJcFbLBtablzIxxerPnyXF9ir7Kr7+Wi+2CxQMll1eMfeYlIClgytDsT?=
 =?us-ascii?Q?51ywwrpRoGFaLlkn2+S28Aq8aHzP1pjDx4sd7cLOORwL+P6QL6ZtcJnGsjLs?=
 =?us-ascii?Q?muHsUobwlVI7VxpuUCOO70WCLGt1wFYUXkERt1UsyZ6Z18rXitWa2MiEMv4E?=
 =?us-ascii?Q?aSIVgumxGg/6y0bMMKkuHvshSshCVobdVnAnRXAD3GY7SL+9Im5BBHZbDttY?=
 =?us-ascii?Q?hhQhNCqxAtyEcukmFB1tYsVYNpbUbqvfoiOiAouNPFBC4ET4WRnJ+81icZkU?=
 =?us-ascii?Q?NDhmkdV+krEMzDb4grghC9ab1CPmYNBpP8Vfz/lY04MBHsNgGVTnTAq+w04n?=
 =?us-ascii?Q?22BCkWbyQSZIBcxvpDKh0PanucuM4fkzNoL4X7zv16eU6o2BYGcA9zMYo1dY?=
 =?us-ascii?Q?U4+liBzYxefJJZ+79B5SbYIL5YMxb7GkckFfTERIsPt8jRa4i3iY2JTVmbYZ?=
 =?us-ascii?Q?zvSSfTw7ddPCKqC+sPhygKHSSqGHW5PhGQ3p4sviZnONoOEIJD1Jm3Owov7R?=
 =?us-ascii?Q?3IS50IsQ7hNs2uoI87n7niDuEFwmm49dKVNl6g4eLrCB78c502WgBDYOrqnV?=
 =?us-ascii?Q?1pyXkK3I7fWYeZSqoBC1DUVmSOh0Btl/rTJpBg0TcbEFQ7qXySkhJq4we+vH?=
 =?us-ascii?Q?ICTLhYgK3gnaXZ61Hh0fxl05t5ZvYyAN+brrTOL8ENt7LYp2NJjV84PX+MHM?=
 =?us-ascii?Q?oGMLRFnWC5nSjaE9qxskZhwyKBTkB54dIFvow33lirV3rsfrqRO+p3s5oIMp?=
 =?us-ascii?Q?wX8k3iej6SKQ8RY6+NJR4MoA6p839USHs8eprdse6R8le3HGc1WmMq31k/zE?=
 =?us-ascii?Q?bWt/jN3S+4kCQxoA0D8WgH6drpVp7DW8Zmej680weWff5gL9SxCU8z0kvRlp?=
 =?us-ascii?Q?G3N/MnOrN8K82ygz7zQTD1P+YYmKQxPoBScKyG3yjaTeLMDCvi7GKYWa69ph?=
 =?us-ascii?Q?JejL6KtICT5GVzBDeFfZpb9HtCoh5XfiIIfKj7kVHkvrqDvMhXw72MCGSg6f?=
 =?us-ascii?Q?d/HKetNRFqYwUTv+UhK7JdtsaQLVn11ATixyb7Vv8d8K3olaDTuOU/eCL0BY?=
 =?us-ascii?Q?jeq5KtXHukP+Y9dH5UM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 313df0e1-8c39-4ba7-1777-08da747de011
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2022 11:55:20.5140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5clEwDLwJtkF4gMIgq8/FPZ2LPb5JAmDu4zGhd8Bp24h9zvVMhJePcb/0F0+bIne
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8757
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Plain text please.

> From: Nico Orlando <nico.orlando@dave.eu>
> Sent: Tuesday, August 2, 2022 12:45 AM
> To: linux-usb@vger.kernel.org
> Cc: badhri@google.com; michele.gaiarin@dave.eu; daniele.piccini@dave.eu;
> rosario.borsellino@dave.eu; Andrea Marson <andrea.marson@dave.eu>;
> heikki.krogerus@linux.intel.com; gregkh@linuxfoundation.org;
> linux@roeck-us.net; Jun Li <jun.li@nxp.com>
> Subject: Re: Power Delivery Driver Vsafe
>=20
>=20
> Il 01/08/2022 17:51, Nico Orlando ha scritto:
> Hi Jun,
> I am writing to you for the driver, TCPM, at Commit 31a04b55,

hash length 12+ chars

>=20
>=20
> which you developed for the 5.4 kernel for NXP. I turn more generally to
> those who have contributed to the creation of the USBC driver who deals w=
ith
> power renegotiate with the power delivery.
>=20
> I hope you can help me.
>=20
> By studying the driver you wrote, I notice that if you set a value greate=
r
> than 5V for the power voltage, then the driver produces an error and you
> cannot make the probe. In fact, the error I get from dmesg is tcpci: prob=
e
> of 2-0050 failed with error -22. Seeing the driver, this seems correct to
> me since explicit limits have been inserted to the 5V supply voltage, but
> why did these limits have been inserted? How can I act these limits in su=
ch
> a way as to provide a 12V power voltage without the driver fails the prob=
e?
> The DTS I set up is of this type. If I try to change the Sink-Pdos bindin=
g
> then I have an error and the driver is not taken.
>         usb_con: connector {
>                         compatible =3D "usb-c-connector";
>                         label =3D "USB-C";
>                         power-role =3D "dual";
>                         data-role =3D "dual";
>                         try-power-role =3D "sink";
>                         source-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)>;
>                         sink-pdos =3D <PDO_FIXED(5000, 3000,
> PDO_FIXED_USB_COMM)
>                                      PDO_VAR(5000, 12000, 3000)>;
>                         op-sink-microwatt =3D <15000000>;
>                         self-powered;

I do not understand what exact the limits is, or you your problem,
you mean the above dts settings you show here is generating a probe
failure error -22? on which kernel version?

>=20
> I would like to understand why this choice. For me it is important to und=
erstand
> what changes I have to apply to the DTS in order to change the 12V power
> voltage.

The final negotiation result depends on both sides,=20
the sink side of your board should be configured via dts to say 12V is OK,
like the above dts you shown, means the sink can support voltage range
is (5V, 12V), so max voltage is 12V;
the source side should support the exact 12V PDO(if only fixed PDO supporte=
d).

>=20
> In this circumstance, I use a USB C port to apply the Power Delivery, but
> the board that power supply through this USBC port needs 12V and not 5V.
> In other words, I would like to do what a PC is made by a USBC, certainly
> its voltage is power supply will not be 5v.
>=20
> If I do not apply this change, the renegotiate between the power delivery
> and the board fails and consequently this restarts from boot again.

What's "this change"? what your dts config before this change?

Li Jun

>=20
> I am sure that you need to change some parameters in the DTS, but which
> parameter must be changed, it is difficult to understand since as soon as
> I change a parameter on the DTS the driver does not make the probe and
> consequently is not taken.
>=20
> I hope you can help me. I hope I was clear, otherwise let me know.
> Regards,
> N
> --
>=20
>=20
> Nico ORLANDO
