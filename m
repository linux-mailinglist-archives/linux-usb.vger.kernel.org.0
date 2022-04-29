Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79AE7513FC6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Apr 2022 02:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348580AbiD2At6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Apr 2022 20:49:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353570AbiD2At5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Apr 2022 20:49:57 -0400
Received: from esa.hc3962-90.iphmx.com (esa.hc3962-90.iphmx.com [216.71.140.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0DB1887AD
        for <linux-usb@vger.kernel.org>; Thu, 28 Apr 2022 17:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qccesdkim1;
  t=1651193194; x=1651797994;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=vbTfHe5nJVI2mckH7+dgpM/9NZwH9xT1/+NFkuokQBM=;
  b=TjpXSikUAD6/a/XgdnY8nXvIN+nK2XgeBxEypconEPKVC78RmsD4JQN/
   V+zFcUeak2JPn4H5DkwZ+Ow5XIUs8FpSi+bxogHKH8YESVQcV0vbg1M6W
   +xP6+nZjLTi28L8i8Gxm/4lNMmux5xTjuvfurgjSPHu6BoWmaJmk709X1
   c=;
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
  by ob1.hc3962-90.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2022 00:46:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H4Eh6ZS4l0YJg8cqHFC+KUnCkS4qvLH8Dc2IlIqaYhOa252MfRzbgzeT/IQL3K818dcal4mQpgCfSKZIDk5veJ5NDvS7Ijyl7sm8qka1Bcx4Ug/4qpynLLdXxVUch/1UWK0ktfvhwUrQmoYhr+pKZppgG3NndMEbzbGRVnUoC2BKCG/wo62LV1PK2sAzUf8/Lp5ueHNmmiF3/LLOZuHBOp3y1xP5JB5kz+yWQZXJHcnqTqo0vWQO4sptgWWdTobr/eV1vq+Prvjov/X+/vkaXyGcnZA3Hv/bK2VsY8uDs6hK2HyZSiDIwoA+115bx8RxpqRgXZZOGgKIuVLh78FUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vbTfHe5nJVI2mckH7+dgpM/9NZwH9xT1/+NFkuokQBM=;
 b=Jn3RN2mzLFhzKSF3clYToDgoMTe/+I2ZNSFA8YDPVYLgXTB2L2xc4UguUp1SXZBIP2EFSYVsPnvZ2qgYKKSEbaaNsN/uNfCr+nderZulErdRcr5SRT8BCv6j5bF3ZJ/WfVgJ0Ovg6JfhOR5bAqcfKwBEGKgBf7jYl1vnwEDdts0Vvmz2scFINtxZXKiJiLd0KUB2IO2Q2BC/AhFoEVMkxo2Mo6FuC/Bb3utUyaHBB58cxkVRX4y9nkATNNZLgfOBvBnNiHSQcLSMACEcQMm+rrZRKfFmIg3GtqHo+D9HUaI5DsSj6n1YeJo1dgbew4wSdBtwK6bJq+GAPsVSvzXglg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=quicinc.com; dmarc=pass action=none header.from=quicinc.com;
 dkim=pass header.d=quicinc.com; arc=none
Received: from DM8PR02MB8198.namprd02.prod.outlook.com (2603:10b6:8:4::7) by
 BYAPR02MB4408.namprd02.prod.outlook.com (2603:10b6:a03:56::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.14; Fri, 29 Apr 2022 00:46:31 +0000
Received: from DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad]) by DM8PR02MB8198.namprd02.prod.outlook.com
 ([fe80::15d6:317e:e736:e9ad%5]) with mapi id 15.20.5186.025; Fri, 29 Apr 2022
 00:46:30 +0000
From:   "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Linyu Yuan (QUIC)" <quic_linyyuan@quicinc.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "Jack Pham (QUIC)" <quic_jackp@quicinc.com>
Subject: RE: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Thread-Topic: [PATCH v6 0/5] usb: gadget: configfs: new trace events
Thread-Index: AQHYSh6zKbuIXYzOWUGz2E/+TjoP7az8KvOA//+NvYCAAK4nAIAJycOQ
Date:   Fri, 29 Apr 2022 00:46:30 +0000
Message-ID: <DM8PR02MB8198FED331CD0750F475935BE3FC9@DM8PR02MB8198.namprd02.prod.outlook.com>
References: <1649294865-4388-1-git-send-email-quic_linyyuan@quicinc.com>
 <YmJqfzmz5N0I3n87@kroah.com>
 <DM8PR02MB81988A02C692B0760A73AF23E3F79@DM8PR02MB8198.namprd02.prod.outlook.com>
 <YmKcvKTQ/UP7VQas@kroah.com>
In-Reply-To: <YmKcvKTQ/UP7VQas@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=quicinc.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d2067be5-99ac-40b2-8f20-08da2979b3b6
x-ms-traffictypediagnostic: BYAPR02MB4408:EE_
x-ld-processed: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d,ExtAddr
x-microsoft-antispam-prvs: <BYAPR02MB4408E7196D275A53BFC196879FFC9@BYAPR02MB4408.namprd02.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aqxcoTtpGROnlSqEwi2XgD/lVg0Yrh75yCAfC4W3UARylZQ781v8oHUPvl6lUQ6YecOOIaXTC6T6yhqD9fNk68ikapuw2EncJTW7Y8x+sWUa1L2IMDVVn7h2IBZjWo4mt2TKA8A+ORP05U2msFIe7JBl3AQ/Tt5FagRsaz2KL3wOs+U9aM6tCdoCUVlOpBnMpEmi9JLb8I2H59GDgM9bX3NaUWP3MJACs3mJ+WltF03KlKmvcNsrTNat7R24T5sJuZdsRNJJVj5s02Xc7KT18MUJayHLaSnVvdl84XXQQogQjfyxsTy8PW42njpakeM8ItNU1l5a04znAhdAW0ovFrZSoKSpUfo+/C0JxmG3+Ovislx4LH34sbXEGbosm+gowj6mYSIwfohVdQqgChKm+32njnKDmKCj+2g0Tsz9qmFPV8A2OkhH7JfnoEiXI4ByfWlxHYnUSi+f86oE0DLHNXBqDTJuudve0Ylj48Yng/s4DQggnzPgM+MgjYxoanE8PkqHOqK9lGFN4ohsfl2rcN9Bhn4CFyxLaKpWeZTIYtKzoj9zihKvghTowMGwezLthYIy/QNbSRKbmD+OWY44lCJZUSRQ2PH22eqnSOtEo9A6mzjxDI/EQse1Uneure3rP55CGIB3DagsFj8x9cw+Nc433V4Y0Ne294yuF/fSEwOY0UEm8DGJFsluSpVAAWHv3DLHo0/LeG+lX25Et6Ww6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR02MB8198.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(9686003)(53546011)(26005)(186003)(110136005)(71200400001)(7696005)(54906003)(6506007)(33656002)(55016003)(508600001)(38100700002)(86362001)(107886003)(5660300002)(2906002)(316002)(52536014)(8676002)(4326008)(8936002)(64756008)(122000001)(38070700005)(66946007)(66476007)(66556008)(76116006)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?+yHPRNs45BywF3ZPGremsiR5NhSGBewINDi3FxKx9OAA01Saw+OBzFSyW/Lh?=
 =?us-ascii?Q?9pwdMds5Yr0meptbWQwr5x0ZNTT39JYCmdakHh5+JWSx6E8cv8EnGoVY/yLL?=
 =?us-ascii?Q?AZRyDSpC1TNT3//18f6cROTROZp+nWwo8QjxNyTKK2BTXrt0NeQAk4UEWLW2?=
 =?us-ascii?Q?pPMXM+t0gY+7wtBR8cmeafEiO9EvHyIR7r0MogYQZBL2umJD/3dm8yPaH8SP?=
 =?us-ascii?Q?nwDMOvB8hEgc3ou2pPv/g/mXccjlD2qz7r6MTiLyHheu3mdYzK00lcwUP+xT?=
 =?us-ascii?Q?jjjsuH0s0yUd+zFTcSqu4BMD6CjWpeyBkZmPbMimnJNkScf/y/jhtirFRm77?=
 =?us-ascii?Q?OBAU3ePqwRDhCmR0rRozuZN953F8z0bQsoGdG9wAaRkhjp0giRx/96UL8cmY?=
 =?us-ascii?Q?qJLsTYrcZFDTjtWOVlRHjVMMRa89LQPTiBFNtZLh8yJG8BD4qJVnVpFIB179?=
 =?us-ascii?Q?xkfCPfzI6MgFKr7Kpeo/7QDEWihN+92qt2De23t+cxmzwCTs3F4dmNWMZWDa?=
 =?us-ascii?Q?JwMX/Q4n+6QT5a4+qtAjxIZ+Kptnj9PT+uugCMslODBOgvMqoDJybQZwewBt?=
 =?us-ascii?Q?HvwtkBElR++YV8C1jz8UfC/Z+uuqaaCFi7dCo5bsKbmaaInAPNnmIeeqGK5j?=
 =?us-ascii?Q?aWOMN/SQzqtiLRdolao6aaLJlhRlMWdPeleP40PGFG30W/XyAzIkGLSiEDuW?=
 =?us-ascii?Q?UrnDdmrqQvzYGpN2jF3TAszpxicOghisjNMDr0lBAMd66ML9Qyd2NUlHYhF4?=
 =?us-ascii?Q?1CHcKeZBNsWg+I/7usobRsmJxCjyC5wQqdfuptJbbcKfvds6hv5FteqtyQ+U?=
 =?us-ascii?Q?cPLxZ5til8z/pbzdbhhOxuE5ZdnCCING8LOkbVqTC/hEUzh7sd/9T26FA2Iv?=
 =?us-ascii?Q?nXZNTLcCnEJswBY7yETOSX1i4SaCi+erVhMQRkfytQxxtVYN9JhkubqbhCbx?=
 =?us-ascii?Q?96CXZY4flI4or4lH52GyFcF01iTHeVf0RzI6esVcJXVAce4S5/VkDWDWxHZ/?=
 =?us-ascii?Q?zGuQNBED3c0i2NEIlaxo/HSfIgiZkx5Ot4+exR+gu3//+Cx+LT1dZUauaR4M?=
 =?us-ascii?Q?yeICaaKkGDrbTWJxOGY/5rsk1tAWggM5J54W3geXjM8S13k9oSkqrtf1emFI?=
 =?us-ascii?Q?6/MBR2j+34cMfPfvxKak+NjFadPWl0Ak1LeKScBO0+LH7MFp1JDlLXTy77da?=
 =?us-ascii?Q?Icb/tDj04rM49VOh6lCBnsB8bh5r47cORnJZx3jOj6+wXTcV2f5YLDtRMYNA?=
 =?us-ascii?Q?Qdz95Nw/eBgIMb6yOyt75guC8Zhb5UVEUyElc72kPEFr4+4MkCuUNIBvpRpi?=
 =?us-ascii?Q?HaOaxzlsEF6FHRRULWy4Q5HXaPuVUieJDJEFRp0+2eE+OFJfausddegHWR4B?=
 =?us-ascii?Q?WfcQRBeIfFEOtV7zYLhMdfMGvVtIM9mZKzvDlx4pGm1+iMsK39m+kkWQO4Ym?=
 =?us-ascii?Q?dGK5KD/uVOO6L4aJkY/Y2Vm3NN33XChAecMN83XzXpc/qopWzYyJiAvq1ydm?=
 =?us-ascii?Q?Xixok2eG0zYlYkKDr1baTg1/L6RTluGq6YJ4S2QcyNfvQph6qO0GRuKvGNls?=
 =?us-ascii?Q?26Tyk7i6oUp63zuxlMWjxcT1LcAo4lBBHGnSsK2SDEks16yQwMyZ7JTrS0W8?=
 =?us-ascii?Q?/z2+z5TX/FYB/jQeUwumFkEy4dd19C6XV4m9t38MzLGTRy9dGo3zdOlZ3E6t?=
 =?us-ascii?Q?mM8q61YuSpiu7OYs/UN7pFC9ktCJavsBPP2wMtgrHxI8AuWqcpc3UKTVXNKp?=
 =?us-ascii?Q?osjy9ecqHA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: quicinc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR02MB8198.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2067be5-99ac-40b2-8f20-08da2979b3b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2022 00:46:30.8589
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZDW7gokJoSGsjJQpe4q0k3pp5ES1a5hDbC8IKpbJ9k2MTqic/Tu1roAz2DIdoxJ3GohNPQB5mjYh3WW7J7/unHhooP+RnchMYYZ7GN+Oyik=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4408
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Sent: Friday, April 22, 2022 8:17 PM
> To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack Pham
> (QUIC) <quic_jackp@quicinc.com>
> Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
>=20
> On Fri, Apr 22, 2022 at 09:01:13AM +0000, Linyu Yuan (QUIC) wrote:
> > > From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Sent: Friday, April 22, 2022 4:43 PM
> > > To: Linyu Yuan (QUIC) <quic_linyyuan@quicinc.com>
> > > Cc: Felipe Balbi <balbi@kernel.org>; linux-usb@vger.kernel.org; Jack
> Pham
> > > (QUIC) <quic_jackp@quicinc.com>
> > > Subject: Re: [PATCH v6 0/5] usb: gadget: configfs: new trace events
> > >
> > > On Thu, Apr 07, 2022 at 09:27:40AM +0800, Linyu Yuan wrote:
> > > > Last year I try to add trace event support for usb gadget configfs =
[1],
> > > > this time the idea is change a lot, the purpose is trace all user s=
pace
> > > > operation to gadget configuration, include gadget and it's function=
.
> > >
> > > But why?  Who will use this, and what for?
> >
> > Thanks for review it.
> > It is not used by user space, just for kernel gadget issue debugging.
>=20
> So you use it in userspace?  How can you use a tracepoint from somewhere
> else in the kernel?
>=20
> > Like android, the user space is complicate to kernel developers,
> > With this trace events, kernel development will understand
> > What is simplified action happen from user space.
>=20
> They do not need this, they can just use ftrace today.  Most of these
> tracepoints you are putting in here are just for a "got to this
> function!" type of thing, which ftrace can show you already.
>=20
> What is the added benefit of these over ftrace?

Thanks, please discard this changes,   will use kprobe event.

>=20
> thanks,
>=20
> greg k-h
