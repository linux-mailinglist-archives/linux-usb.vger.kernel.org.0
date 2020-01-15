Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD64713B74E
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 02:58:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728883AbgAOB6T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jan 2020 20:58:19 -0500
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]:15968
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728882AbgAOB6S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jan 2020 20:58:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdcZ1vtzY83d63ANEqETNfn274vmQXcJzsPZ/u3TXGFzCG5L0Fj73i1PKGkUIZdmMu7/VERK5cst8PPeT9NjElBytMStLEvB1nFiXc1p6fyF2hWjCLSxXNdwTj5zwWwAgYyWx6OZdgDdcZJl3yTkOivNxKrIgzWlyvplpZLOadVmFzsPxqcH7/PY4LrgvaNlSSJhOSfTrfQD8LuzaoYqM00l21iwndWlGq0V/TUNa52f6SJlEY15HiH29csewR4z983PCRXiGS3W7hfXTKaH6wuJ5dUSsaiM2WLkiI8Yy07+D+rKPLTEI7GUdJMMc6WmcLN5u2h08S/nncpYKzIj8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFvnTGrxXEyGEKPsxPasrOkfHwnIfU9Up40xFTipMAc=;
 b=DAx/xUrIh0mJHEPUfc2nKV9GM/V8XQPIt/DUFdCljRFZS8WOQ4ZFJGhsm7mbHAWCXn9XUkxhPn4L5XfKA2v8pN8agpMKCj1ZPqPngJK5ueJOsNU6awB48HNUvamLKjNX7awH7jxPyn9gy31ZDpIEVNXN7FQfsNOaw8nptsg/YuuNpFJipf28YIWGyJjbAc7/DrKM9udRbwno3XIoXXMClT22LHbR9fulZk0l4sLJPUKPKbbYEXBqWY3L2SA/HuSQ9B+JNPTOJyASwApAbXh29NhfguUQO7YQod4qB+DlfIBamI2HCjPBxHW+9mnbjSqJbQTGqdkZ167f63hgCnpw/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFvnTGrxXEyGEKPsxPasrOkfHwnIfU9Up40xFTipMAc=;
 b=svqG6/k6IO3K03dGztp8qo4Nml4N6GgXrH0pc+dkOq3d21jgBOnYBVCOe6cs3TGfC8wuOu5DpzWtcaMY57qLNLiC7YNaUUjCqOmQcoh7Yo3ZG5Kx4utxxqqxIqzB3XwL6gxR0/L1lMJMJ69otFgccV7ozWrQAtQMpvybBWiIzj4=
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com (20.177.51.23) by
 VI1PR04MB4528.eurprd04.prod.outlook.com (20.177.55.212) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Wed, 15 Jan 2020 01:58:14 +0000
Received: from VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e]) by VI1PR04MB5327.eurprd04.prod.outlook.com
 ([fe80::c7d:58a2:7265:407e%6]) with mapi id 15.20.2644.015; Wed, 15 Jan 2020
 01:58:14 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH v3 2/2] Doc: ABI: add usb charger uevent
Thread-Topic: [PATCH v3 2/2] Doc: ABI: add usb charger uevent
Thread-Index: AQHVyr8F+sEVUKbMukuOOQ7FlBh6Gqfp6fuAgAEPAgA=
Date:   Wed, 15 Jan 2020 01:58:14 +0000
Message-ID: <20200115015812.GA19938@b29397-desktop>
References: <1578994738-8872-1-git-send-email-peter.chen@nxp.com>
 <1578994738-8872-2-git-send-email-peter.chen@nxp.com>
 <20200114094813.GB1422952@kroah.com>
In-Reply-To: <20200114094813.GB1422952@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peter.chen@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b3563d3-7701-4dd6-3d26-08d7995e61fb
x-ms-traffictypediagnostic: VI1PR04MB4528:|VI1PR04MB4528:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB452829F685E477D6048821958B370@VI1PR04MB4528.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 02830F0362
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(7916004)(4636009)(396003)(376002)(136003)(366004)(39860400002)(346002)(199004)(189003)(316002)(54906003)(44832011)(33716001)(2906002)(1076003)(6916009)(478600001)(71200400001)(5660300002)(8936002)(53546011)(26005)(6512007)(4326008)(81156014)(9686003)(6506007)(33656002)(86362001)(6486002)(186003)(66476007)(64756008)(66556008)(66946007)(66446008)(91956017)(76116006)(81166006)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4528;H:VI1PR04MB5327.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: znAlMRTQfo04fQrw35LkVPyxcgj5xr7kTIQs/4KUPddkBT8arCAXTJMaGHcygKB8TaatAljtZUUF92Oa90NIHshAfjccKzkgLbdnHsdOLT2OyUa+St0mYvEscG9idVL069Rgd26SFIay6/Xat6c5yIKSROmeLvZehKcII3kxhRyP8hdprDWrE75OCXL/J6gEPbGmNVuOF/8DeIQake7YSpOI+a6HpozlK7Px++eDfLHfLlHQkJjx0ECM/1c+SkpQgobC3T819+Y7LWwJaJg3zIuN7sJZG1x7GRTvIxbItTFRkCHtflowFpe+9aBp/L8sbILNeDozbJkkalY2eA2nClPbuQDRbKMgg7E/HIOqElrjqQAlyQXa/F8yx3a00WBUipGrxgQGrB0+T4EmmBCra7vjhlHQbHpO2vVcqAiYlGsKPobICvRLuXniXYmRG9A+
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9A4E729512F357499F331596289D2468@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3563d3-7701-4dd6-3d26-08d7995e61fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2020 01:58:14.4915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uyn9VZWr/A2w6pZDX/kpB24Big4qiow44Jukm4LTSTQBfZQoriE0+9BPCXPFFiI/d2Cb5vZ5szCxza8vqmLidA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4528
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-01-14 10:48:13, Greg KH wrote:
> On Tue, Jan 14, 2020 at 05:38:58PM +0800, Peter Chen wrote:
> > When the USB charger is inserted or removed, the users could get
> > USB charger state and type through the uevent.
> >=20
> > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> > ---
> > Changes for v3:
> > - Change kernel version for 5.6, and delete the kernel printk time
> >=20
> >  Documentation/ABI/testing/usb-charger-uevent | 45 ++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/usb-charger-uevent
> >=20
> > diff --git a/Documentation/ABI/testing/usb-charger-uevent b/Documentati=
on/ABI/testing/usb-charger-uevent
> > new file mode 100644
> > index 000000000000..94ab16768e49
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/usb-charger-uevent
> > @@ -0,0 +1,45 @@
> > +What:		Raise a uevent when a USB charger is inserted or removed
> > +Date:		2020-01-14
> > +KernelVersion:	5.6
> > +Contact:	linux-usb@vger.kernel.org
> > +Description:	There are two USB charger states:
> > +		USB_CHARGER_ABSENT
> > +		USB_CHARGER_PRESENT
> > +		There are five USB charger types:
> > +		USB_CHARGER_UNKNOWN_TYPE
> > +		USB_CHARGER_SDP_TYPE
> > +		USB_CHARGER_CDP_TYPE
> > +		USB_CHARGER_DCP_TYPE
> > +		USB_CHARGER_ACA_TYPE
>=20
> Any explaination for what these different types really are?  What is a
> "CDP"?  "ACA"?  where would one find that information out?

I will add explanation for it, thanks.

--=20

Thanks,
Peter Chen=
