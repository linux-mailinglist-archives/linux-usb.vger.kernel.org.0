Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 864E937A378
	for <lists+linux-usb@lfdr.de>; Tue, 11 May 2021 11:23:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231297AbhEKJYu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 May 2021 05:24:50 -0400
Received: from mail-eopbgr80042.outbound.protection.outlook.com ([40.107.8.42]:6291
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231364AbhEKJYs (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 11 May 2021 05:24:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kWUBlYxFsKhFh3SBET+6JxkWA1qD8E/XX9w0gDRVS550Oarz6Cw8I0yW4dFGQpZmIxXtQpJqxANWpP67n0vfkS4svbs0czm+Bj6EVAGPoCvC1saxJcAoIi7TTV37kqdYHEYjFFsnQAbYZUCvzHcdrv7MgSTODBCw+AcSTyCMhwsTOUTAhNyS3ZNKkythSDmmiNystw/nO/MvsM2dkwJBxo0X/ebMlrUj6G2O1UWOUbar4Qh6ne1Ri5J1wOmNOC75V/aC8vGXWM41yLNuQotjDOIcURW2iP71jgt0YtjoOBRA3/jtdGkao7pIgmuI+6E6cMW1rdkrXh+V2hezZ808Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICQAz3E3K6zi7vD2VJDRpMeNpeS0iLWNGxFGsgQhPi4=;
 b=RKHVjCS9npAUu0MoQvRDFaqwasrOHeDoB7drrI2fJ+lfV4KB7vuP1Crp5ePc5nS2hl8zR/laQSfVOMRMP8F3PN9RKQM5Zvi0DciGXp2Pk/fv9VJnwKX0EhHTzTNCS99RSuP3cOlTFpi/HYKN2AeQAZlZ7MrOcANhTE6lILcYlxy53UCuplbVcxru/KpIrn7/glsTe3EgKAbDPh2rOaQgE/LRfxO3PURlRgzZwCh7xw1OsFi2qXG47XMV21XyAKbACqAehYSv+EQ8hvm3uUXh5L5g2w37+Zd3MYXuNArCnFBZLRQ8UsT2r7zvza4tBbfaxAP5Id4BpEFZmgPWwXdI+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICQAz3E3K6zi7vD2VJDRpMeNpeS0iLWNGxFGsgQhPi4=;
 b=NkfM1YnNa94mtjqHiw8rcJhlWPXfQI3BKqg5Wg+lla4BllJWuD1mksXCgvCryO6ceYcb6QHrhwXBOKgowCMFYzWxtNeRhtmN18Wj+qsK5Br1/F2f1c79G6LREGOV7mLubDSCK85fNc/NyJmmS17rfYyIuJP+RvfQ49KzcSE3l8Q=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB5790.eurprd04.prod.outlook.com (2603:10a6:803:e7::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Tue, 11 May
 2021 09:23:40 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::ddf7:8cd0:3132:7dbe%7]) with mapi id 15.20.4129.025; Tue, 11 May 2021
 09:23:40 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
CC:     Felipe Balbi <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "thunder.leizhen@huawei.com" <thunder.leizhen@huawei.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Topic: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compatible
 string
Thread-Index: AQHXPZBCXEuCoO+pyECjB5N281Vfw6rMuUwAgAANexCAAA1OAIAJgi+AgAA3u4CAAQ3rcIAGYAEAgAANUVA=
Date:   Tue, 11 May 2021 09:23:40 +0000
Message-ID: <VI1PR04MB5935DE5731476311DE94009A89539@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1619765836-20387-1-git-send-email-jun.li@nxp.com>
 <8735v8ji31.fsf@kernel.org>
 <VI1PR04MB5935F1D26E1F281B7273993F895E9@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87r1ishz2t.fsf@kernel.org>
 <VI1PR04MB5935825AD977B4180894541589589@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <87h7jggch0.fsf@kernel.org>
 <VI1PR04MB59354B7D5843B612D50937B589579@VI1PR04MB5935.eurprd04.prod.outlook.com>
 <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
In-Reply-To: <YJo5Tl7SDuv4Yu6D@kuha.fi.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc701d9c-c5da-470a-32d2-08d9145e76ec
x-ms-traffictypediagnostic: VI1PR04MB5790:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB579023A20F602F391BB09A6B89539@VI1PR04MB5790.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mt+qH0AiWpgypNroC9GYjD1mmCHyFw4LzcpdS79e6HFAG3Dxa38un+ajeov4hT3Y9fJ9aPEhCCKm0AbQh9zz3bsGoejQtCRv1hrNSACzP+R4epkqKWmfQ42R+i2hcsfuXWTx8mA2eDcMxoiaXT1AJxRGBzpqBkIbfgXDrA/sj81MBef2RhoFXKDIb5tvTsWff7R8/+K5QQT9K4VP8UqKMpiL3/Tqvb2LJcnaDATk5WPC5GqBU5MNykAnyj4PqqzV2yPmKk2Mshgu8clAOwjTNjvOC1ecdhSLxD8NqriTojJCrQpQNUCKk9vKbKp3aKRVCvEJhg/SQ9iEFkmQO3iroZRwWHFItnt04TAW0uuNUFuM5v3x3Q4j8rL46GSJYx6XQRORV2noniYBW2xxYddIwbzlj6HB9NRLz7IprsjlaCfx+qo3STDy5E0UTYUpQMBq2YnmvJk4G5Dr1FOyEui2D6BiywIOqV/nIXDvmL71gFbm/sgNk7UfTAOqlCdgfiXsBuh/Mjh5WOSyLhhJawCIUCOcjlppD3gnbjELvD//LCQnx29e4/4bKjNvhBNrkGLOpYhjjX/Fxz4PrUAwmszfc/3il5Aj4XYXA+ad5LSZKYlPMVyX3m/9Q1+PIMGk9CX16yM2cEvp4cvOcE/DnozXrxys/X0OlpryXuSp/lr7wOtzjwQiRYBxipK06aFI+NyyEYMNEMcW9OnhRPnz/00Snbew8eijHWeUxM+CiSN3wa0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(346002)(366004)(44832011)(76116006)(186003)(122000001)(53546011)(26005)(33656002)(316002)(86362001)(71200400001)(8936002)(7696005)(6506007)(52536014)(66946007)(9686003)(2906002)(966005)(6916009)(5660300002)(8676002)(4326008)(54906003)(66446008)(45080400002)(55016002)(83380400001)(66556008)(64756008)(478600001)(66476007)(38100700002)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?G+h8b1+Ja4xVf4FG9p9MPgjeXXoH6xVMUrbkfBYXOIi2vdIoS3LZf1H06CoQ?=
 =?us-ascii?Q?6YOZyUJS5Syeho8e2wyfX5lNpk0m7+i73UUGFuJmfzAnS56kfpJGFDPqWv5Z?=
 =?us-ascii?Q?q4hmN755QyOLsQBAbbCW3pWExhTWdrI11bVE/nJ6MTYIuBcKz39Xk1TL+z5V?=
 =?us-ascii?Q?th14dJnAN1F/GId9O+JXIQ2G33eW0tfvRpx38ProKQu6N1npCWObo5eP24u5?=
 =?us-ascii?Q?6IPcZQVyR/kyzn9WCaEgAMBrDtWN8GIptQdfvbv23UXHTu/FFv+opUg165wG?=
 =?us-ascii?Q?zIIXL7LYNcARZb2oXSrcorEnQZadNM/aJnTTXJV9/PGCwX3UKLVuw6/4VHlA?=
 =?us-ascii?Q?37HcyRh+kug8jwPZcxFcVq0P4ZSrHyRvD1UGrfI2m9xwj2xQWGevgDb8+FPI?=
 =?us-ascii?Q?Kqh57fK8UKVXAV+HQwD53S48OVgsbl/Nphe5OoP/DWvA9W7EUleGiRu2/4Sl?=
 =?us-ascii?Q?Llg5i+c3kuc52jiYP+662xJ8j8G4YI+wBAynarXwFny1/X+sTfa6B3tLCZtZ?=
 =?us-ascii?Q?DrOZ2t8mbGoklSldp0vAEfAIOqRUwwWk6EHUhJJVFZXj5a3QBvH5x4+g1qsB?=
 =?us-ascii?Q?4hiLll0gwZBvj8oedNUbJepA9h089wFxtv2bq0B8hmwi3FzqDL16Ubr9pXhx?=
 =?us-ascii?Q?Is6d4hpRkWgpL9FHjJqZbKKNWHG2omaUxkm07a5jSejOVVEa/lOGyywlPH9i?=
 =?us-ascii?Q?64r8rpBReR/mCf/0cA/hoGkuYCoOh/1K3pKMdqxqfNN6HmGAat0D/RZDA8bU?=
 =?us-ascii?Q?RrAJ3YVW50ZBofTQOn3zw7XhxhvKTHIUwA7ZXMaWYSR15HDkRo5zSWxfMZxT?=
 =?us-ascii?Q?zpi6hUbRmvGC94DULkvp9y8h//e0c8AfK6qQE7sBllxryUPeGUhtOYz03QsI?=
 =?us-ascii?Q?4tnvT8Q9zgMDfqrnd89GSeLrwbu8p0sfD+AdsX7CefYfPqFoma7V/6XPDT78?=
 =?us-ascii?Q?m9pCU0Ns0ye1Fx3KfhmC8/RPIL2R70eZ1ZpN8nblBHimK0Pvft//mtj6sVYN?=
 =?us-ascii?Q?id+H1AXTKVNBYoANgSTLzI6KSrq0QKByhCEmtmxvE13b69FJga+pN3wWuG45?=
 =?us-ascii?Q?gU05mSzhQ9BW19ulkbRRPIzkz6kfp32uZPA8/m8ynwD/aAkKjV6h0+HovK1h?=
 =?us-ascii?Q?xz+/T3/nWlA/wy8hnB6B+Qr6cCTucIVMcZhgFZjFH8dyAgWXWt22/tQAM6jg?=
 =?us-ascii?Q?Jck2YUkMFFSOAlmnjz3Ujuvq76PdRBGt/TJkokAz8/C6SHJsfDiaKu7y3N+m?=
 =?us-ascii?Q?Aq/qUT5rz2WrmJqMIGeq9uRWm7uOauwbVJ7tSGNSkBixcOb922+6aL81yltH?=
 =?us-ascii?Q?1VJo8E4mF1M/6SDc7UhqMeVD?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc701d9c-c5da-470a-32d2-08d9145e76ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 09:23:40.3138
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lEqhBeYLdRgV0LR9kV1XAY0I5ramjx/lhfWw445XMKKIdwKdLJZTqfVhmyeITg5Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5790
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,
> -----Original Message-----
> From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Sent: Tuesday, May 11, 2021 3:59 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: Felipe Balbi <balbi@kernel.org>; gregkh@linuxfoundation.org;
> shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> Subject: Re: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via compati=
ble
> string
>=20
> Hi guys,
>=20
> On Fri, May 07, 2021 at 07:31:43AM +0000, Jun Li wrote:
> > Hi
> >
> > > -----Original Message-----
> > > From: Felipe Balbi <balbi@kernel.org>
> > > Sent: Thursday, May 6, 2021 10:32 PM
> > > To: Jun Li <jun.li@nxp.com>; gregkh@linuxfoundation.org
> > > Cc: shawnguo@kernel.org; dl-linux-imx <linux-imx@nxp.com>;
> > > thunder.leizhen@huawei.com; linux-usb@vger.kernel.org
> > > Subject: RE: [PATCH] usb: dwc3: imx8mp: detect dwc3 core node via
> > > compatible string
> > >
> > >
> > > Hi,
> > >
> > > Jun Li <jun.li@nxp.com> writes:
> > > >> > 	val =3D readl(dwc3_imx->glue_base + USB_WAKEUP_CTRL);
> > > >> >
> > > >> > 	if ((dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) &&
> dwc3->xhci)
> > > >> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_SS_CONN |
> > > >> > 		       USB_WAKEUP_U3_EN | USB_WAKEUP_DPDM_EN;
> > > >> > 	else if (dwc3->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> > > >> > 		val |=3D USB_WAKEUP_EN | USB_WAKEUP_VBUS_EN |
> > > >> > 		       USB_WAKEUP_VBUS_SRC_SESS_VAL;
> > > >>
> > > >> for this, you could register a listener to the extcon notifier
> > > >> and update these bits accordingly. With that, you would already
> > > >> *know* that
> > > >> dwc3 is probed.
> > > >
> > > > With usb role switch class, there no extcon provider, so I think
> > > > this way can't work for me.
> > >
> > > perhaps role switch class could learn about notifiers ;-)
> > >
> > > >> > static irqreturn_t dwc3_imx8mp_interrupt(int irq, void *_dwc3_im=
x)
> {
> > > >> > 	struct dwc3_imx8mp	*dwc3_imx =3D _dwc3_imx;
> > > >> > 	struct dwc3		*dwc =3D platform_get_drvdata(dwc3_imx->dwc3);
> > > >> >
> > > >> > 	if (!dwc3_imx->pm_suspended)
> > > >> > 		return IRQ_HANDLED;
> > > >> >
> > > >> > 	disable_irq_nosync(dwc3_imx->irq);
> > > >> > 	dwc3_imx->wakeup_pending =3D true;
> > > >> >
> > > >> > 	if ((dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST) &&
> dwc->xhci)
> > > >> > 		pm_runtime_resume(&dwc->xhci->dev);
> > > >> > 	else if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_DEVICE)
> > > >> > 		pm_runtime_get(dwc->dev);
> > > >> >
> > > >> > 	return IRQ_HANDLED;
> > > >> > }
> > > >>
> > > >> for this, maybe you need to teach dwc3 core about wakeup irqs
> > > >> instead. Have a look dev_pm_set_dedicated_wake_irq().
> > > >
> > > > Good suggestion, but if extcon notifier listener can't work for
> > > > me, my understanding is this *teach* in glue layer driver still
> > > > need access
> > > > dwc3 core instance struct, right?
> > >
> > > for now, maybe. But it may be better to implement a notifier method
> > > in role switch class.
> >
> > I am not sure if introduce notifier in role switch class is a good
> > idea, I had the impression extcon is not encouraged to use if possible.
>=20
> I'm not against role switch notifiers. They were proposed before already
> couple of years ago, but at that time there just were no users them notif=
ier,
> so the patch was just dropped from the series [1].
> But I don't think anybody was against the idea. Please feel free to add t=
hem
> to the class if you have use for them.

So I had the incorrect impression.

Yes, that's the Felipe was referring to, I think.

I will pick up [1] and improve my driver as Felipe suggested.

Thanks
Li Jun

>=20
> Or, are we talking about some other notifier here?
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.
> kernel.org%2Flinux-usb%2F20191002231617.3670-3-john.stultz%40linaro.org
> %2F&amp;data=3D04%7C01%7Cjun.li%40nxp.com%7C9479f8f61e1a47245c2e08d91452a
> dd6%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637563167667138204%7CU
> nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW
> wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DEhSPBC1sGeH65EPuFV22pEcVS6nDeRNPdN9Z1
> 3lPPYg%3D&amp;reserved=3D0
>=20
>=20
> thanks,
>=20
> --
> heikki
