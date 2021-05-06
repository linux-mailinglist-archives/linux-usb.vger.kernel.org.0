Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0CB0375308
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 13:29:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234665AbhEFLaA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 07:30:00 -0400
Received: from mail-eopbgr80070.outbound.protection.outlook.com ([40.107.8.70]:45447
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234645AbhEFL37 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 07:29:59 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQPAHqFgDlq8+uu/JlxM3Lm/Y9ciy47p1LPTrQEOS9WfX+xlyB1RfAMPmE8PI0w7AeBqiqOWlVCuFst2uUpq4tp83AaWF6WRnZ50ht6X0516WtID3gi6MOkFHS/wMKsk1euVbWb4GRpaHhZ5IbbHpxkrEkWuGMPV3vbmuFKfCRKVcNLBOnaIu+QXa7UKX6sjsaqE7hQA1WGgxLePknCSbch1I8X+CxtAPyUXXj7xj2x2TE9xmIGxhaMKmpdKq9diS/rWBsokYDPNYiV/i/M39dkL+siJSmJIPNO6ZM7WEQpuLgzq1S3IfEz7PHV8x7o+VwH12//pmIQ/bIdNGGmNoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd+51YvOH2/NzGwgtY5bhI+JJm2AwrVqehpaF1eKXzk=;
 b=ZwozIwnEpWpxP488Uw76b6wVdUHkQW2LzqZNG50eZnuccZoQtd1BqFaim2ukwYtntZjduxcChjyAw7ogUHcPejU/ITL6lgD4AGin0XoDPtqHfaIwfEasVjRnwbuj1AH4MqKNBxIdUf0Py1aPjF/76kWAG1QJII3PZ2sFg7WYeMn/lxbo2FrEuLWA3e3ueQTlG1qLToH3qjYaLE79LW1o3kw2E+GmiNaw5uEJLC60z5CDqSQqFlimvCkSB13hcVM3lsSp46ZXsd8fMT5WGGpx6iq8q8UwC0CypVdAxlW5ZlR2YeFoRVThds6q7tUcoMNyXpIz3y5fvpR+OkKjg2ip3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jd+51YvOH2/NzGwgtY5bhI+JJm2AwrVqehpaF1eKXzk=;
 b=ZXCtwVhCwU7y9Ze2WiEUcCHX5iGkkrNiMvI4cWI/v/Il0FURi8AoWNMhTD+7W+iPdQQIO17gQMO3NDH/QNlOf1cgcdUJqFQA78vK+mSBG5AxqHXW9Pg+kLjYVz2zJdrPqHB2feKL60Ks2m+IPI+q/A7s/VVmLiQna8HVlIkMNlk=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4783.eurprd04.prod.outlook.com (2603:10a6:803:5e::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Thu, 6 May
 2021 11:28:57 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4087.044; Thu, 6 May 2021
 11:28:57 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexCAAA1OAIAJgi+A
Date:   Thu, 6 May 2021 11:28:56 +0000
Message-ID: <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
In-Reply-To: <87r1ishz2t.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 58d26926-57d3-4a21-495b-08d910822334
x-ms-traffictypediagnostic: VI1PR04MB4783:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB478362B05A2BDA145C8E228789589@VI1PR04MB4783.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 10iBhaWkIvJFl+XFsKYDxs30yPu13av+dq4Qz/DvoT9eakcUGIblVAZR6f5vRxs9TsSuGstMU1rElwfAtox8nWFrcKP67r44vn8xjp0Xt+hBzy4jdLmZo+xtKkyuELFvoHFDpS5ftlf0sjelOyhK6zI8U8JxHGV3J/eiJWjEaYTYgZkHzFEZWWibELIFOHkS3HVZaQIVoz1R9oE/xsXN6iseoOpb5FdL3j+DCjX7ab5xOBgO3piiJfpmQeOVaIhkDsFEcaUT6TsezOJ7JEr3QqY474GmuffzjtE0dllizJhJZ92TY+u4IWF1lMxIQg0PNr9VIKFpJmNLZJahzjsmDlQu+r6A4gVpZQvqKrFNczJ7Hh9yUFSi9wgv+cXHGlDWsGYvqatqzDQ6vY4JUsl5v+zScwo+2eluCJgt5hYWPe/+BZyFljlEBfhg/pXS0fUmppPTTOMkVi8TP4giwXL5HmSmGyGtDDIbhsn/84Z/k2/Td0XHMxcgH90qNBw+Ihg3QZJnbYNQtxknU0Rf2FqUngg3lJy+LRZVYr2ay/QkgmyMjs9CRy7DpF6YnMUMnCjahrkfbMlErphqaO9Jz4i61etynwh+e36Vq2vDaZ3l/0VFVTzh5oA6X+gGRMv2pCb2rIwiQGceD/ci94cbaUGi6w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39850400004)(366004)(346002)(376002)(66556008)(64756008)(86362001)(66476007)(8676002)(5660300002)(110136005)(71200400001)(66946007)(54906003)(83380400001)(316002)(8936002)(55016002)(2906002)(76116006)(4326008)(122000001)(26005)(478600001)(186003)(44832011)(53546011)(38100700002)(7696005)(66446008)(9686003)(52536014)(6506007)(33656002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?cFpiK0qKBlhS6aBMkjrTrCbQf0QLOZz3WDTdbFE5R6NCkwhuNbat43kh5ZrM?=
 =?us-ascii?Q?+d67XbVjqmhkC9ssNEqxTGMJ89qCJu3Qk4HZNXqOHMX1DEz0wnIalqxrj8rT?=
 =?us-ascii?Q?jkEjGOkgeYNDDypXaENy/+9WT7wgMPrpCCaN9MLk3BVCE4ywIH42A45ll8Mk?=
 =?us-ascii?Q?ICV+RtjcDR3Be3G+AL7TSJWsXLqMpYLSOc7PqhQ7cH8KdM6/rYRpJVkNIKQl?=
 =?us-ascii?Q?Dl3dOAjtvnj1QAtv8h+PyoBbrcAdqf/8p5dCkpwM3d6khdwnQKtYK5hXH5Yi?=
 =?us-ascii?Q?UUqYeMdDZpH73P57PUm5k/Zq6IsPtdP6Um8YnwBDZ9mbQkhCgaBhJQdjSioK?=
 =?us-ascii?Q?e8mAPA2o4Nt+DN2tmWRO+kP6KQqJs6QXvKc0zndeZ3hkSDk4BMv/cW0uP0Jv?=
 =?us-ascii?Q?emgyBvNpHazQU07kDPtds2zfEEHNw88kaJLU3b8PMMIyvmzqqa+X5RTIjga3?=
 =?us-ascii?Q?GZxghtaF0ZPHplMDM4AE65NM3JoRG3Q18/SOGN4w8jyipoNYM4ZV3+reJH/j?=
 =?us-ascii?Q?qhfz1KIHk8XQG3D/D7HboaT93ne2IdiEEK/bOmnKmyEOwr3TNMWCYnEu7FJU?=
 =?us-ascii?Q?d6QdsFo6L4rmIb9JhIUqN1vvoV715AT4es9vb8ahQ8zdYhJM5adLHEj1zivH?=
 =?us-ascii?Q?1mwqcmd6XggrbCd3NpnElfXqXX4SYdRH9ew3y1pqgK01XRy+FuohXsylcvf5?=
 =?us-ascii?Q?Cd+cqZciyelFxENpFyQQ9SOUUT5NfX30RcHlPHhivqEvBBCsPU8zPHTklgXS?=
 =?us-ascii?Q?ezlIIHc/ZjcKyvNRAEgNFdymnJntT2B+Dd00a10563hSMmkYdGVn7UpbbD7E?=
 =?us-ascii?Q?SreiV1/C/HaM4Kr0AoQI4ZtNXEdpdCJODFT/sZViMh9JZl9IjW13M1zncuiF?=
 =?us-ascii?Q?2LwWWPjmuaiI4AIqXl1ZbBbkAflFEaluOVvJEVeLonaidkAIzzTD24uoVB7N?=
 =?us-ascii?Q?pAwBm46/CMs7UZU+ktkIqUZLzkn9GvY+qt3CMGZx8pD20jWL4W0YTCnuv7lS?=
 =?us-ascii?Q?hd4iwzcHIFNAkkcVORfWs3IrFCugbZO4ENPNpTzG6Tf7Pa7jilq+G+judYXb?=
 =?us-ascii?Q?70tFG9qlrT2qNb++X6aRO1Pftl4h/hxfx7mp4KpZ22FLR3WqC/iOpdqVxF16?=
 =?us-ascii?Q?k/o4S0Elr7h22++yKcuERLYbfcUrWt2g+jV2hvWkwhcLpnT0BShZ6ydkQF3U?=
 =?us-ascii?Q?FDUw7SMCjYCytpYrhMT5687h2jwVaZM+ABGQn9I/5JGoRzaifPs7Nmhhrszt?=
 =?us-ascii?Q?KQZYgTClzpZEozhU3AJ9IDkBgB6Mq7WUzDZqYmspyCb/fJHf6GiaSR0fPV7j?=
 =?us-ascii?Q?wMJggVl0S4rNF4B9gAtoSTCb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d26926-57d3-4a21-495b-08d910822334
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2021 11:28:57.0398
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aSNbWEC3KXKr1w7gx8wk7ZV6M+l+eyc9+y9RmAS7aR6jV8K+MV8IxliTrwRCOImH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4783
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Friday, April 30, 2021 6:00 PM
> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
> Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compati=
ble
> string
>=20
>=20
> Hi,
>=20
> Jun Li <jun.li@nxp.com> writes:
> >> -----Original Message-----
> >> From: Felipe Balbi <balbi@kernel.org>
> >> Sent: Friday, April 30, 2021 4:24 PM
> >> To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
> >> Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> >> thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> >> Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via
> >> compatible string
> >>
> >> Li Jun <jun.li@nxp.com> writes:
> >>
> >> > New schema of usb controller DT-node should be named with prefix
> >> > "^usb(@.*)?", dt changed the node name, but missed counter part
> >> > change in driver, fix it by switching to use compatible string as
> >> > the dwc3 core compatible string keeps "snps,dwc3" in all dt.
> >> >
> >> > Fixes: d1689cd3c0f4 ("arm64: dts: imx8mp: Use the correct name for
> >> > child node "snps, dwc3"")
> >> > Signed-off-by: Li Jun <jun.li@nxp.com>
> >>
> >>
> >> Nice fix :-) It may break down if we have two dwc3 nodes as child of
> >> a single parent, but I guess that's very unlikely anyway.
> >>
> >> Acked-by: Felipe Balbi <balbi@kernel.org>
> >>
> >> That being said, why do need to keep a pointer to the child? I had a
> >> quick look at the driver and it doesn't seem like the pointer is neces=
sary
> at all.
> >
> > I need keep the child pointer(dwc3 core platform device) to find the
> > dwc3 core instance struct(struct dwc3), the wakeup setting need check
> > the dwc3 core's current_dr_role and do runtime resume based on the chil=
d's
> dev.
>=20
> Right, you're talking about the code below. Some suggestions inline:
>=20
> > static void dwc3_imx8mp_wakeup_enable(struct dwc3_imx8mp *dwc3_imx) {
> > 	struct dwc3	*dwc3 =3D platform_get_drvdata(dwc3_imx->dwc3);
> > 	u32		val;
> >
> > 	if (!dwc3)
> > 		return;
>=20
> I don't think you need to care if dwc3 has probed or not here.

Yes if there is other way to know current role.
=20
>=20
> > 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> >
> > 	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->xhci=
)
> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> > 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> > 	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> > 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
>=20
> for this, you could register a listener to the extcon notifier and update
> these bits accordingly. With that, you would already *know* that
> dwc3 is probed.

With usb role switch class, there no extcon provider, so I think this way
can't work for me.

>=20
> > static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) {
> > 	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
> > 	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> >
> > 	if (!dwc3_imx->pm_suspended)
> > 		return IRQ_HANDLED;
> >
> > 	disable_irq_nosync(dwc3_imx->irq);
> > 	dwc3_imx->wakeup_pending =3D true;
> >
> > 	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhci)
> > 		pm_runtime_resume(&dwc->xhci->dev);
> > 	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> > 		pm_runtime_get(dwc->dev);
> >
> > 	return IRQ_HANDLED;
> > }
>=20
> for this, maybe you need to teach dwc3 core about wakeup irqs instead. Ha=
ve
> a look dev_pm_set_dedicated_wake_irq().

Good suggestion, but if extcon notifier listener can't work for me,=20
my understanding is this *teach* in glue layer driver still need
access dwc3 core instance struct, right?

>=20
> That would clean things up, I think ;)

Yes, I may use dev_pm_set_dedicated_wake_irq() to attach the wakeup irq
to dwc->dev and &dwc->xhci->dev for device and host mode, which will
clean things up.

thanks
Li Jun
>=20
> --
> balbi
