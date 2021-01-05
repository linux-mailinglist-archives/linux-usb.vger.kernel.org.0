Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32C872EA3F6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 04:38:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbhAEDid (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Jan 2021 22:38:33 -0500
Received: from mail-eopbgr30071.outbound.protection.outlook.com ([40.107.3.71]:16267
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726168AbhAEDid (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 4 Jan 2021 22:38:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PVowvSuhWuJW/gifpqRJwZE5u4K7+UiI0AsVncoXxoZStFsN+oiSXGcF3LYTbyLZC0LowlpLSPfmLxxQJuLt0HLQ4hpujW7Fq3yOh26rc6+gAMeUGmny6Grd8FVtn6N3bZ6vAzZ/eKJtYbYUJPeC4VD/QlVXFroFN0GsuXMduQp24fZhZkXMtnhbpTP5tyshH6Eou1ksW+p+kavyUD1m7Z2X/92QWC+lp2q3LTBhBO/M2lvkvpimYu8PV15p/Ao/SjHBpXUOoNkEdXaTNHGOX8Eo5tC+BE+Nj3CiP/+dagm4hYegmI1Gd1oUAzUUBaFTONfsTe3ZOC9JHvYmWMl7vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy28laPmgKUr7dfRonczYA+9Qhvls14JinRSiyGa+XA=;
 b=M599BYDYyou7RLAj2lhH3iM9OpqFxSDWO2Er1ppblrLRJwElRXXkg8Y/TTW0AVGA2lH6Ud0Ov+pg4B4Na+BoPygbOLNfY77Xuxbk/zkQAkz96du5F34jIvIV54YlHX4bA9RtPxmZ5REXfA66EBk/tvQmB0Bkug+j94mYN3Kkc8NG+8EDatTLePuqesvaMX2TIzh5c+tnWHfrrNYjHYWqKmhJ/Rrd0N6BYJGy+EplUKPx7q+jLo3AlaIk4uuNAzo6lZMtHXke+TJ0rfkhms3HTkZWkE3JxiG5I9Nz78x4UZHWSwuFT7+jR8XWd6LvmAXnajaaURxa3OXskGz8knuIIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dy28laPmgKUr7dfRonczYA+9Qhvls14JinRSiyGa+XA=;
 b=F+EWU35DRfRbscLEIIB7epLDn8FYOv1nQ1l1OKo9RRFq0Fhy/7newr9RImv/g/+Yi2KanmowGyIvimHQiIQPPczwpIKFxsTWCEhv2Ic8SnbKVPctpHzIgQ314wjGm6b7JXapHNXFG59t8bDD7d57hZGqmK5eIPXv378X06R8X08=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB6PR0401MB2373.eurprd04.prod.outlook.com (2603:10a6:4:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Tue, 5 Jan
 2021 03:37:43 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::89de:bd7c:7245:f139%5]) with mapi id 15.20.3721.024; Tue, 5 Jan 2021
 03:37:43 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@ti.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Frank Li <frank.li@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/2] of: platform: introduce platform data length for
 auxdata
Thread-Topic: [PATCH 1/2] of: platform: introduce platform data length for
 auxdata
Thread-Index: AQHWzvpRc1lpsn9SoEybCA1XxhexYqnwdyeAgACuF4CAJpFhgIAA04OA
Date:   Tue, 5 Jan 2021 03:37:43 +0000
Message-ID: <20210105033709.GA15296@b29397-desktop>
References: <20201210134215.20424-1-peter.chen@kernel.org>
 <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
 <20201211020155.GA490@b29397-desktop>
 <CAL_JsqKk1KBCnWp40XyLGAPMJP-R-qAdo9FRax+DgrowKhp1=g@mail.gmail.com>
In-Reply-To: <CAL_JsqKk1KBCnWp40XyLGAPMJP-R-qAdo9FRax+DgrowKhp1=g@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mutt/1.9.4 (2018-02-28)
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 71281746-ceea-409a-e578-08d8b12b430c
x-ms-traffictypediagnostic: DB6PR0401MB2373:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2373A0C27999DA4C2BD8D87A8BD10@DB6PR0401MB2373.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4dxgp/7JTIFKjCl8wgPWkVJ6oIU9SMYUVBLybuubmmo+IkCLtXjthK1rexbkQm2VgY3BPTzkUXyfdIZrYhPcN2FviveTmtuLX5gE9iqZ1Njv4cpnlOn8NkD01G7QXNsgnZYa+YdyLNjrTsEU3vv/AcxCe4MmzPp91SS3OrJnA4k/wQJMeeIm8Qj/Gnxjv1DYcypruvHL87NFL6qDgAiWarWXrwVoqFBfudyyxCKTb3P4+fxi9Mav9GAFUH2E1IAhZPjAWmyjlsm6S9stsNpNUvJBqm7fygeV8sNCxcvEwzvQCp9qbQxP6cJw0qSl4pZw5E+ZkJsI4nV6YDUNLTJuN8NK5A7pgekQEoU2weK9wunwoQZjquCHy/t3raqdavbPYMd0uPFh+bzDRNzs+d8VsA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(376002)(396003)(346002)(366004)(39860400002)(33656002)(66446008)(6506007)(1076003)(8676002)(9686003)(26005)(4326008)(6512007)(33716001)(2906002)(86362001)(83380400001)(71200400001)(186003)(6486002)(66556008)(53546011)(478600001)(91956017)(54906003)(64756008)(8936002)(66946007)(66476007)(76116006)(5660300002)(44832011)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?E16nX6rL9Wz7DwyLDbpU67UQYWC6akjd2es2nLvBAv5XYtKBq+l1FUSgAHJ7?=
 =?us-ascii?Q?1JvqvTcAK6OHnormtKUdnqaPDrrRMWWILA+vUWxSneLZOtGMO47TpTAtyelE?=
 =?us-ascii?Q?7f4/DOGxA66mKCJyDGjgXOiVQTBYGGtD+fnYyjwbe2rbzHawzIc9i2Xnnwrl?=
 =?us-ascii?Q?djnmeYbBtZBOH/K4KzxfzLUCxqNgzQiFyalwvfOXB2/g2GAuy6LX/dsQrWmp?=
 =?us-ascii?Q?gsmEZO/qP3qRlxJ/cm9jsqX1uzVYjoHTfwEdS3twnT2PPzJyDYBc5onQalOI?=
 =?us-ascii?Q?Sn7HpDNXrxKQ4zZrkCorgbq/7t+xIX+VJy1+2bIcX353jxcrc8J9EizXx263?=
 =?us-ascii?Q?jAz5Y3h+AU9Dq+DNRaJT4J/UvFl9Gccgfh3+qLiIAiVluj6wj80au8IWXI6K?=
 =?us-ascii?Q?O9fFtB4OnydHpbF2FJkZEUELc0jZAjDP3TU4VY5ZJCKUtyuYGWXhlh9VwQbu?=
 =?us-ascii?Q?de1I7XLWtDh/tDpT/fD/QA6nJUykn0KAsyhYmWp0XTuQWA2Bk96dV3t1rmnm?=
 =?us-ascii?Q?O0PpuJKJuGOc1Acvv0a1z5YNsbxQ7xaG/9iPmq7qsGOzuWJd0+PihiXAPaRa?=
 =?us-ascii?Q?kh6VgWqvFF2mz2GDFCfnjStuDNv4Q7lIEX5tVHJzJ6ZJi0PE0p0diZiZxjSX?=
 =?us-ascii?Q?3ooKIs5QnSJV6YL3aklHMyRLlYmYWZfWJ41Rc+cAM4nov4ldVgLKN00Fqqy9?=
 =?us-ascii?Q?g8zYwZpGjsDf6QOikHaZyMEb+hSgFeYBNwnHmetv0EjRt8T0sOBzDutpjCVp?=
 =?us-ascii?Q?KwWyfK3YB4Amo7b3XGHiSY2LATmR81inpBZPahQOtWEH88Re6C8Tn3sZe+GB?=
 =?us-ascii?Q?9AzAYix303pWHv6bJcP4BBqRV6FF0ZaslpLo2Uio7PUwBOLd3LEEOV8o47NS?=
 =?us-ascii?Q?iSSExT4F5kNTyFlHBTk32Tyj0zt8I7JM70hfOv/PBY/acbJCrQgx7PvbBWk0?=
 =?us-ascii?Q?WvUC7NFzAfKHvin+69Jn8PNIQwZ5/RWR9KewPg+OCmRyrsu044DtRB2kWy02?=
 =?us-ascii?Q?9qbG?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <58FCAC45D8D53B48A12FDE3C07907FC0@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71281746-ceea-409a-e578-08d8b12b430c
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jan 2021 03:37:43.8926
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oY0q5/4df6DCcbdT3Uq5A/1gSv6igJ2EScbsijskaN+ChBiyHj85m1mFWYS9oidkAn86p7uRcakf4qHzIkvahw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2373
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-01-04 08:00:07, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 7:02 PM Peter Chen <peter.chen@nxp.com> wrote:
> >
> > On 20-12-10 09:38:49, Rob Herring wrote:
> > > On Thu, Dec 10, 2020 at 7:42 AM Peter Chen <peter.chen@kernel.org> wr=
ote:
> > > >
> > > > From: Peter Chen <peter.chen@nxp.com>
> > > >
> > > > When a platform device is released, it frees the device platform_da=
ta
> > > > memory region using kfree, if the memory is not allocated by kmallo=
c,
> > > > it may run into trouble. See the below comments from kfree API.
> > > >
> > > >          * Don't free memory not originally allocated by kmalloc()
> > > >          * or you will run into trouble.
> > > >
> > > > For the device which is created dynamically using of_platform_popul=
ate,
> > > > if the platform_data is existed at of_dev_auxdata structure, the OF=
 code
> > > > simply assigns the platform_data pointer to newly created device, b=
ut
> > > > not using platform_device_add_data to allocate one. For most of pla=
tform
> > > > data region at device driver, which may not be allocated by kmalloc=
, they
> > > > are at global data region or at stack region at some situations.
> > >
> > > auxdata is a "temporary" thing for transitioning to DT which I want t=
o
> > > remove. So I don't really want to see it expanded nor new users. We'v=
e
> > > got about a dozen arm32 platforms and 5 cases under drivers/.
> > >
> >
> > How to handle the below user case:
> > Parent device creates child device through device tree node (eg, usb/dw=
c3,
> > usb/cdns3), there are some platform quirks at parent device(vendor glue
> > layer) need child device (core IP device) driver to handle. The quirks
> > are not limited to the hardware quirk, may include the callbacks, softw=
are
> > flag (eg: XHCI_DEFAULT_PM_RUNTIME_ALLOW/XHCI_SKIP_PHY_INIT, at
> > drivers/usb/host/xhci.h)
>=20
> The split of these between a platform specific driver and the core IP
> driver was just wrong to begin with. There should only be 1 driver
> with common 'library' functions like we do for every other case of
> common, licensed IP. Perhaps the core driver should stop pretending it
> is generic and figure out the quirks for itself by looking at the
> parent node.
>=20

Not only hardware quirks, but software quirks and callbacks which are imple=
mented
at platform specific driver and are called at core driver.

--=20

Thanks,
Peter Chen=
