Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF3AB2D6DF4
	for <lists+linux-usb@lfdr.de>; Fri, 11 Dec 2020 03:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387518AbgLKCDo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 21:03:44 -0500
Received: from mail-eopbgr00059.outbound.protection.outlook.com ([40.107.0.59]:60157
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387863AbgLKCDO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 21:03:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=no03bfEC+yPzlv/kF+T7jk4ifZJPl07tdnDun7o93bas78/jZhYevenAChewzzlEwfF3mJpcVSkgkYcDdXuz38ghxRc2jUWyRabaReDo3na3yAEvYxI89t1RtX8EmcM9/IvBmN44bq9YQdnTx7L7RGwkjl5OPgnKBwLY0OiLq+SFeCFWP0Gw/LsR01g/kARthARj8pZwUk5sZ6K0NvgfqU67edmHKAvWdA1khtdnqLq31+gSL6jaracffbbytrwiHacF4KtbMsW9biE9em1TTDO2ZbhTNIyCGeb9phiiiEpnndMSB/zB5INugZrFpmUXWWAnayYWsujs8G4/lJPtVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuzQAQukgBafLFLHfhGbMgHcrCiAUqDR7PTfw1KV7U8=;
 b=ZM7VKznWgck2L2WCuJrBInuxWjsUJHF1WCkJ7YJooJsiYQrFkdT3AeSlx9I7wCv2mXMB+QKLVqxDDsdlIwhVvtvPcl83ql3iOae6kipOxOJzoex5vhfX5a/k4oEVHXmy5MmhYPB/GOPGKPl1mkg3O/2FI2jjkuA5rIiT4zpgyVkW+rnHAeIOmpYPCj8ZYWWofhqBUNUxZa5RWBGU9pEjYNEWRTIctIPqgYOsAjoOdCqaP5L/YMbaDbivAH7LRNXvBpQyJ84lFTcexHpuKfs2AZQkTIaFv3kfUMf8LRxJhY/5yx6XlRqr4We0lLG/xVxYeQrRxISzubrU3M0KNpXHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iuzQAQukgBafLFLHfhGbMgHcrCiAUqDR7PTfw1KV7U8=;
 b=D7QLhnIEKPT0FO2GVeadLwD0ckh4AvY1JMbw3S7Qsi2wv2/w6uMDHCCRmf0jmB1F922q8mHDSCSJRenNjzxHaCuacCYxmowtefIYL82UzN8Bie3XCIskpD/+24FSRcEttVkeZfPqBj6S3eyJie7O5bJZnPPk1ttgOzF9k0O0zaM=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5466.eurprd04.prod.outlook.com (2603:10a6:10:8a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.13; Fri, 11 Dec
 2020 02:02:24 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3632.023; Fri, 11 Dec 2020
 02:02:24 +0000
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
Thread-Index: AQHWzvpRc1lpsn9SoEybCA1XxhexYqnwdyeAgACuF4A=
Date:   Fri, 11 Dec 2020 02:02:24 +0000
Message-ID: <20201211020155.GA490@b29397-desktop>
References: <20201210134215.20424-1-peter.chen@kernel.org>
 <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
In-Reply-To: <CAL_JsqKxcWjdxVHSSHKKRtshwOXeodjQWCYt6G7asJYjjuoWQQ@mail.gmail.com>
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
x-ms-office365-filtering-correlation-id: 9672251a-2e0e-4456-a0b3-08d89d78cdc0
x-ms-traffictypediagnostic: DB7PR04MB5466:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR04MB5466C5AC4E377FA9C07A0EC18BCA0@DB7PR04MB5466.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MM/yC43uZ4iRmTZp6PGqzafNf7GhfbqQk6Ux9rozQKwaLjuTPWFORg4uQkEgRtCkoFYnmHxHVyFgCEcZ0P34InuK0E+g4zdUdTpUka9qu+MPotSkFxUrmvVY18VnGrlLBlDVdhZr/u9yZbZUO1R6383BtInljlTodOOW6oejvlJ88rJql/Z9gApAyT942pE/TlmMSbrNNke1g/pQ6FkFdRdY5031pP8MTO00YrT6LTdYB9uTNRlvEheq9mG7rlhcPNiXXzVb7iTShSYQ9cfyh4AjYHn+Hz4yhbBNvlnExeb9nammG3qCRkRsHZubZlAfVulfN5ThdQMfWWflCjapGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(396003)(346002)(39860400002)(366004)(376002)(136003)(2906002)(64756008)(71200400001)(33716001)(66446008)(66556008)(26005)(33656002)(83380400001)(66946007)(8676002)(8936002)(53546011)(316002)(478600001)(86362001)(4326008)(66476007)(54906003)(9686003)(5660300002)(186003)(6512007)(91956017)(1076003)(6486002)(6506007)(76116006)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?oPmzo+7hdarXn2oQkNDt0dtbbDTxr+RXh5Oz2aBcLcJY5ps8RXJA33OhifkF?=
 =?us-ascii?Q?Px6BoCrZcdiw6W8bhj3jN/sXBugOeSwIhzEOrv8dQuRSI3aMVNvX8iYVbRvs?=
 =?us-ascii?Q?8WLM85rtuKM0BW/da0u/PRZvcEN43UTgP8uMgTcK73JXpUOtpyJkUFlP8Vfh?=
 =?us-ascii?Q?fCEoEUknVgYDgUiwiKImjtPNUX5/SsZJLwE7hr6OnOX2BAODUN9XVUK9nKif?=
 =?us-ascii?Q?jGkGzPn1W7M2EvrD9luQma4aG2dgiGiRweZ7Vmpbsrq1TlI0c0Fl43Aglbbq?=
 =?us-ascii?Q?nifEAVlyKUfEzH67K2C6mqYzNSxUUJrYaU2sv+KJ050EzTJokp9k/oZ5/rgo?=
 =?us-ascii?Q?xw/MXBl7fiV7QlmtbKqOKBoH3ePM5Fi+iwzlPYEzPgrioOPpz+rnnoLVmS5E?=
 =?us-ascii?Q?g45R3/ijHUsdGWGlGrSHs8IxJvG8CgBWEAECwNXXVkBBykZitAW4YbxZbg+W?=
 =?us-ascii?Q?TSdRxhDFEk/mR1E1zaPGwMbdkPoF47/eXmfvpewst1amdk/gBBMJBWndxXdx?=
 =?us-ascii?Q?P0xBvjmR6FHZ+EgtpYKzqljrceKWUjLRy/zjtsVsqsBvjbXnorbOxm/FySFE?=
 =?us-ascii?Q?L5dj0DMOAQsFPrVnPxM/5wG1617AdleTiGk5BWXPVf3ng7z37rBP2aTzpJ7H?=
 =?us-ascii?Q?gdumgHbOOv6mikk3LmcvhvIpsUuV5RHjraKNZ+n+JA+oEopgUi1Cz+X6oIqZ?=
 =?us-ascii?Q?aFdRC++RWVnQET7FPzRkj9i+2azHI2u/fCG16XA4DH5jqHZ6G148f1jS1prC?=
 =?us-ascii?Q?xIpG5x8iCSeiAfGYjQoK5SuOnfSuT50ZKB5EYJQrzDxlOh2dUO7NY8ScJzIA?=
 =?us-ascii?Q?X/8GgpygNwHzM1VZ1ItT8nY02JI4vcr3czfHjd+spYJd+Q/Onb3r8LNwKwuD?=
 =?us-ascii?Q?VboIYMmGf5Gi0BZBOij0hAzRlvBFODBXQotWIX5WXCRBzYbsLXr+Sk+x+tQo?=
 =?us-ascii?Q?RlMEn9c7en652PTSzpDjXYadzzGypeMUB81T9PviRKpXmpkqxh9/xwuY10WS?=
 =?us-ascii?Q?koqv?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0DC099B68591524AAEC715A51BD63F3E@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9672251a-2e0e-4456-a0b3-08d89d78cdc0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Dec 2020 02:02:24.5190
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tRVi3TjKJa2lECU0HlFEqXKFTk4U+dGt9TSkcN4ZRW62Ve7Ox4yJ6ihUWrGy97Km7fNPKwV3C+xADIGQ4BxHgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5466
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-12-10 09:38:49, Rob Herring wrote:
> On Thu, Dec 10, 2020 at 7:42 AM Peter Chen <peter.chen@kernel.org> wrote:
> >
> > From: Peter Chen <peter.chen@nxp.com>
> >
> > When a platform device is released, it frees the device platform_data
> > memory region using kfree, if the memory is not allocated by kmalloc,
> > it may run into trouble. See the below comments from kfree API.
> >
> >          * Don't free memory not originally allocated by kmalloc()
> >          * or you will run into trouble.
> >
> > For the device which is created dynamically using of_platform_populate,
> > if the platform_data is existed at of_dev_auxdata structure, the OF cod=
e
> > simply assigns the platform_data pointer to newly created device, but
> > not using platform_device_add_data to allocate one. For most of platfor=
m
> > data region at device driver, which may not be allocated by kmalloc, th=
ey
> > are at global data region or at stack region at some situations.
>=20
> auxdata is a "temporary" thing for transitioning to DT which I want to
> remove. So I don't really want to see it expanded nor new users. We've
> got about a dozen arm32 platforms and 5 cases under drivers/.
>=20

How to handle the below user case:
Parent device creates child device through device tree node (eg, usb/dwc3,
usb/cdns3), there are some platform quirks at parent device(vendor glue
layer) need child device (core IP device) driver to handle. The quirks
are not limited to the hardware quirk, may include the callbacks, software
flag (eg: XHCI_DEFAULT_PM_RUNTIME_ALLOW/XHCI_SKIP_PHY_INIT, at
drivers/usb/host/xhci.h)

> > +       int platform_data_length =3D 0;
> >         int rc =3D 0;
> >
> >         /* Make sure it has a compatible property */
> > @@ -378,6 +387,9 @@ static int of_platform_bus_create(struct device_nod=
e *bus,
> >         if (auxdata) {
> >                 bus_id =3D auxdata->name;
> >                 platform_data =3D auxdata->platform_data;
> > +               platform_data_length =3D auxdata->platform_data_length;
> > +               if (platform_data && !platform_data_length)
> > +                       pr_warn("Make sure platform_data is allocated b=
y kmalloc\n");
>=20
> Isn't this going to warn on the majority of users as static data is the n=
orm.

This warning only triggers at the cases which driver defines auxdata and
platform_data pointer is in it. Besides, directly assign the address
of static data to device platfrom_data pointer is wrong thing, this region
will be freed using kfree at platform_device_release. Using platform_device=
_add_data
API is the correct thing to do that.

--=20

Thanks,
Peter Chen=
