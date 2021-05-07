Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B845037612A
	for <lists+linux-usb@lfdr.de>; Fri,  7 May 2021 09:31:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233271AbhEGHcq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 May 2021 03:32:46 -0400
Received: from mail-vi1eur05on2057.outbound.protection.outlook.com ([40.107.21.57]:37376
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232268AbhEGHcp (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 May 2021 03:32:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCQiAt9f/ik7lpwofWd06iQqomMP+bkYnNCAMkrrKrMhbjmaeMZABYu5Z0kPSuI/guPvcFblz/bg+bC3o8obwFfM8IdeFFAlZJhRqLE6xdtxHv0EuqY+HwQmGanmdw2iaecMvYns/9xcqoU1vTn5aucnf02Pptharvu7BcONgJGacx0QMLOl5QAJ8cdu56bVzeNVCNS8sgoM25WUORg/HqB/ErMQ1ZsItj1g3ki8Lr0nECIRzUNUrjl+McQks/zymx4wIO+kV6gXgXn1uRCOODbZCXMMd7sgoU4J5e9bavb9WOyrZIx4ZFNUTvg5UkkAD1xpndQWQVBHxZFaXYs8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdNSB/x07uy3xqPKTWyCykMoMrXsFWrUZobiXQLmWLY=;
 b=nz4zPKVAuG9lVWgJg8p+U3YF5+Y4cY9ieDt2a9/YSTX1YrT0gMfgpHCzqb+s1uEUGTZrpVj5BYLqEoghM8SpGh6moCPIf/XWTNIBjRS8V7d/U4zsPmVs40xgLKvBiFjMcFFI1h45GepEnbmeCES5fzSGCCXn23mfJ47vK3/SKyNsIC91/0poJu4Dj+Te/SzCFTZG3eX5DYEJ7rk/ePDVgHckVrubf95714RUgSHqUQ1fGsIsxGALW/Ven6t+DUyJ00kfe+aWimDWH++d0926HNRL9zaw5J3w3+HVmhaN6YZnCnqqSbqllE0urCqTpwZl98qTZfDlTgh7FHPB1mAS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PdNSB/x07uy3xqPKTWyCykMoMrXsFWrUZobiXQLmWLY=;
 b=fjkGLu7sUNxB8zah/INeywg5oW4qoqnWnzuMCAuCrIEmjy+4jPa7Hv83Xp/xI+jQEO6fGIF/mNjBBG/UGzvJAuRcOcq4Z7ByI2Qa2D0guhc6XZL6qtR0NT3T0NO5mb5lkNczzsHGLQwAIbcLbCtv9FCKJZB0RLfb0e48N23nwRk=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR0401MB2639.eurprd04.prod.outlook.com (2603:10a6:800:58::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Fri, 7 May
 2021 07:31:43 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4108.029; Fri, 7 May 2021
 07:31:43 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Felipe Balbi <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexCAAA1OAIAJgi+AgAA3u4CAAQ3rcA==
Date:   Fri, 7 May 2021 07:31:43 +0000
Message-ID: <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
In-Reply-To: <87h7jggch0.fsf@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ebadde96-522a-455f-98d9-08d9112a2986
x-ms-traffictypediagnostic: VI1PR0401MB2639:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0401MB2639E1DB7747EFDFFB03D33989579@VI1PR0401MB2639.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8yGnfnuuWlZ3ghkvo/JpEQA9wcS6o1bBeocQkxtYPkOLCzi6V5w/I3+Kldq3e7WVaqIXx4RhshGJfQG0PogGcbwmVrgQmkn97K3O1/A9OBAXG3/Emq5SnSqOuapMAvZdfvfNYa1WcfpsraW/qRAB7LOYXi4GsPFte7SMXI2J5k1L/5bpjrjJPhsbz7jcwRD3xVMmuK3+2mEZ6wVOXT3cGkkJ+ASHeb1LQg6HZMxEcCbHD6xhArcf9baJwbThIl5xSxCzeWy5PfIAKafvKm8yrXAA2MkkyXOsNtesC69YAphMsStIlEZDgALqQCQ9MXRzJwOMVr5D0XZ/LYIi8l+pYew+oh+BombTkxUW3igj2POvKtP1+GmFsKQoE1MRmAS1rA26Cw1VC96CNGS4BZhAHAaj/ufoArmt0a6098LGbkPYUTaNARsrs82hf2UxCzbTJvelxATNYe/u9I2IFGD1ChS9v8soAAMKDX/8tHwYYBohD1YFFhn9HNjD6wAxYyOj9tptF+X4LEZM5zrM2WO8YUthWOWjnfmaR7FWVgYkLKHPsifEsLcXIcCo1ZGx60LnkD20BMc04WKsuSsCndVxO9/ZPMbwx8iSITBwa+RvYhAmxHTfuQNUTTSMOZkh0aIl4K/IHAb/64o7HQHIThc/6A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(2906002)(38100700002)(122000001)(316002)(86362001)(52536014)(6506007)(83380400001)(8676002)(186003)(8936002)(5660300002)(4326008)(66446008)(66946007)(9686003)(110136005)(55016002)(33656002)(7696005)(76116006)(71200400001)(26005)(64756008)(66556008)(44832011)(66476007)(478600001)(54906003)(53546011)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?/cNFy/8EN/LHsfmpnr0zmXvI68oP2042QluBdW1pHGh9aUHL6wkwwlb9tjo0?=
 =?us-ascii?Q?mjh7hmtpYJXKsWXwa8sBH6KydU17jUdNlfG5DNDdLez+VjhcDm/RuQ1d1D7C?=
 =?us-ascii?Q?1PAqN12x7d5rCzs6YGeBC5gMtS32TbQ/CMkO1NlqiA+2jb0sPo5wDc+ypRkx?=
 =?us-ascii?Q?n9jCzof9gpydae9efSC20o89wOnyf0u8Qj6iQSYydKy94N3mgFbETVc6CRSt?=
 =?us-ascii?Q?y7TkIUC+sd9SkVNGS+R/yNLKOU8tU5THtj4d/R9EuzV82bw3IrjGDLHsBlvi?=
 =?us-ascii?Q?tAdaC6e/9Pb0vogwx2IxcfkVozGpHUX+4NAlwnQZ4dqbZ1+2eRZ7tu48Smvl?=
 =?us-ascii?Q?viw+bPEdLD+2Jr1K0X7Opw10O28IUtQWbapfMF8Z1aZQuECj5GgbfD3uYMoy?=
 =?us-ascii?Q?SggYuvwVbWSD3w5LOyOsGIWLRcMB1ZED7z3N5mcwb2rk/UbFIYwaD5X38dPN?=
 =?us-ascii?Q?hBLT4ERLk9QnjagSgo0Y4932AHCl/21oHyaiAXP6Fjln5730hEsG+I6Z3SNw?=
 =?us-ascii?Q?jp+t1SFhK9uojfrgScg/w8a/MSC0d4v+acEWwDA5rfZ4mNfsMLMrXkHoTq8x?=
 =?us-ascii?Q?1N0i8JlWZuh/ujFipETXE8N73E2qwOT+UTKMXkmIgZIiYHBv3GHmRsLXhVov?=
 =?us-ascii?Q?GqF3ugcp4lHexQCXEDxG/YKI7uMiH1VPdajzROQ1oej3HzmYsy46AKlA+123?=
 =?us-ascii?Q?L9Fzhy58MR1x3O18YbCC0xSAgTfbBiewWmBurXqo0r2FXuAhrYa5zi/j/ljc?=
 =?us-ascii?Q?YWMb5k21amsM7b3dZAgXCBjSKS0b12a3EZkYPk408bdJvEbcCV7FpchDR+wK?=
 =?us-ascii?Q?NMF2vrckIFeZAoHTGBUkRN3L5S3nn1A+1aQvdf4kQTs8iIfV6t3xrX+cal2M?=
 =?us-ascii?Q?3GgbhvCybp1Ndw/GA7KLDuodKkF5KsbMitbmPRZZaQ0a/tcKT6SHfyOgyyt+?=
 =?us-ascii?Q?s5cfMOLXvxU6/yBgZ1vQsjH0lVFfcQ3+X3FFzmfWRAzcDLkZizbzsgF9YZsS?=
 =?us-ascii?Q?SzkCljouFjioKamHc8Y0U54/OqFWYV3LofsRU1wwngoY33HHyb507Ch/JzD7?=
 =?us-ascii?Q?IgDZ68gV+SGAQc3MfLcpVO/8K+eih1YhFyJ2oNH7/Yna/E1u0/pJu2UpEWmR?=
 =?us-ascii?Q?OK0l9VtkNjEzR12C6CIFHCyuhDQxsYxuHeoUAggVm0NHrMGTShEcxPVt01dm?=
 =?us-ascii?Q?J5jjaxjjNyrNVJWfJKrU5JxBcU3max8ysdwlxSw/7kgtOq8GRBDtvqHdF9Ge?=
 =?us-ascii?Q?nBtQaCMCokUi6BmcIl9V5oDhnd1UO9wFdq+wXEw+zFBYRUxJ8ecB7hftcpKn?=
 =?us-ascii?Q?zO4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebadde96-522a-455f-98d9-08d9112a2986
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2021 07:31:43.1451
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KY3PrSfkQjJo7q6M2gQrZ5IeaX54Ew78GPu+SAnzCyFazLRiufFR3Z4oo2WahHbv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2639
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi

> -----Original Message-----
> From: Felipe Balbi <balbi@kernel.org>
> Sent: Thursday, May 6, 2021 10:32 PM
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
> >> > 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> >> >
> >> > 	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc3->x=
hci)
> >> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> >> > 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> >> > 	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> >> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> >> > 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> >>
> >> for this, you could register a listener to the extcon notifier and
> >> update these bits accordingly. With that, you would already *know*
> >> that
> >> dwc3 is probed.
> >
> > With usb role switch class, there no extcon provider, so I think this
> > way can't work for me.
>=20
> perhaps role switch class could learn about notifiers ;-)
>=20
> >> > static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_imx) {
> >> > 	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
> >> > 	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> >> >
> >> > 	if (!dwc3_imx->pm_suspended)
> >> > 		return IRQ_HANDLED;
> >> >
> >> > 	disable_irq_nosync(dwc3_imx->irq);
> >> > 	dwc3_imx->wakeup_pending =3D true;
> >> >
> >> > 	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) && dwc->xhc=
i)
> >> > 		pm_runtime_resume(&dwc->xhci->dev);
> >> > 	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> >> > 		pm_runtime_get(dwc->dev);
> >> >
> >> > 	return IRQ_HANDLED;
> >> > }
> >>
> >> for this, maybe you need to teach dwc3 core about wakeup irqs
> >> instead. Have a look dev_pm_set_dedicated_wake_irq().
> >
> > Good suggestion, but if extcon notifier listener can't work for me, my
> > understanding is this *teach* in glue layer driver still need access
> > dwc3 core instance struct, right?
>=20
> for now, maybe. But it may be better to implement a notifier method in ro=
le
> switch class.

I am not sure if introduce notifier in role switch class is a good idea,
I had the impression extcon is not encouraged to use if possible.

+ Heikki

Thanks
Li Jun

>=20
> --
> balbi
