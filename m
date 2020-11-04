Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C3612A6128
	for <lists+linux-usb@lfdr.de>; Wed,  4 Nov 2020 11:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728839AbgKDKFr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Nov 2020 05:05:47 -0500
Received: from mail-eopbgr140045.outbound.protection.outlook.com ([40.107.14.45]:13703
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728066AbgKDKFq (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Nov 2020 05:05:46 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AVvb6TmV2Qc7m/IDhSYWyWm1VdzPtASv1tgBdIr51B16hp7jJ/nizzXIWxUMNOAj2Zj403tqZHm556ieGJQP0FXlD4BmWZZgzOUwl3HWW3LOOFFmTzmGWLgoH9D+PzR/2Bg2jhqTIpEPiFpAlkzfUuVOvnYPD2JX51yZuH54xg32OTV9pBnqLunXHNWCNKOCkuFOi2fB3B1/lLcXBq2yFhLo+O3DMNLckQcKXolNb0B7Up+A8rRAihIKNGEO8xkhSgsb7eAnxCUsVjm+F+2BsV+xYTLtAJFD4jRWFgRYr3GFJTuYoUfhU6Hj7LFMSkftOw0hmzJGhHXxUHJKDarKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhuiAMwFEtK/sNlOaWiEwhY6Jl5tQ2xRez2DiQWB1AA=;
 b=PyF/eYZGCTrPX2ZXdmRj87mNDhcXjJxDUJRiFBVZxIWWeCseFR/p8L0PjzhKalbAiZoPImz6cfVMlHcB9HOjggAvvhmadq21usIdSBVaS1YBEuRouGkAxz8hpdcrRKIGq7DRx9b47U1o30XLX5eLdGP8hU2zA1DcMQURRlQHxkR8j83vu/2XGx76PsXqdmxhv+lBP/7IH1qMFOUOH3ciYGPiKC8eyD1Q3408SJLxeNamwuJVpa2hmQYigXDi8U9ZSogriEWMEFiS9RVTMxLoTXBRKly7JGgNHQF2L8g96qcHAex0Nn1zBYIKWR5rFdJM6W04OhXsaQLVEk/YkVR5xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhuiAMwFEtK/sNlOaWiEwhY6Jl5tQ2xRez2DiQWB1AA=;
 b=B45aMYnb3FEAjDkJjrhD5COIkHjo5pHJRETq6Pqx3OTHavIOzseP9tj/MkGvPTZrVuVxhaY1UMc9me3tdzfK/YoBUn+eB2DBjU2oOePdV4ooSTPTQGhASs+/TRrxYDlpalIntlcmirkWEdGEpsDUYITeCgKQoNsy+uSnPXp0QGA=
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com (2603:10a6:20b:1c7::12)
 by AM0PR04MB4356.eurprd04.prod.outlook.com (2603:10a6:208:5c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 4 Nov
 2020 10:05:40 +0000
Received: from AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2]) by AM8PR04MB7300.eurprd04.prod.outlook.com
 ([fe80::b902:6be0:622b:26c2%4]) with mapi id 15.20.3499.032; Wed, 4 Nov 2020
 10:05:40 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Sriharsha Allenki <sallenki@codeaurora.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: Re: strange call stack when running uvc-gadget application
Thread-Topic: strange call stack when running uvc-gadget application
Thread-Index: AQHWsP2KqDDTmfpLkEq9OY9yxv5Fe6m18NCAgAHRK4A=
Date:   Wed, 4 Nov 2020 10:05:40 +0000
Message-ID: <20201104100511.GA16946@b29397-desktop>
References: <20201102094936.GA29581@b29397-desktop>
 <af78c723-0836-95aa-80fe-a914d708eeb6@codeaurora.org>
In-Reply-To: <af78c723-0836-95aa-80fe-a914d708eeb6@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e3647b58-0eab-4b49-dadf-08d880a92f40
x-ms-traffictypediagnostic: AM0PR04MB4356:
x-microsoft-antispam-prvs: <AM0PR04MB435671FCEEBF6DC8E13D16928BEF0@AM0PR04MB4356.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: u/rQbht7VVMyMFYy0CPobdAEiHVrz+WCLVuRFGEETPfD6g8C9NVYCSwzXbmUd2W071boKrcJqNzo7Ob7AGyo8bViZstj1SVCNeTYBWTU52RXZQ61pu7KuycDDO+Ad54i8w7Fp5OGBUfyM81KHiOMTo7eKqGHPWvLqBXrlSE/X2NTea328ZpfdWQOCYwQfsJjAjkhbS9h2lH6cXHwDX5kyfVeN9h/54/oiPvYoVP9OYQj/AIdTGXhzSd5Ui1CQN7/kHJxshUcxKaAfLV1bb7PEJwatDhb73B/NlQdOb+rGlWU5Q+41c3WXfoLH+PoSWHr7b3hKzTZPJGN5OOFWW4zY2IXK71mtaVqTSXpc8kwT4jfrq/TNbgVT5qTtBdzdUVfGXamVuCephjPPkHU8XoymQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7300.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(39860400002)(346002)(396003)(136003)(376002)(366004)(8676002)(4326008)(1076003)(53546011)(2906002)(33656002)(478600001)(44832011)(5660300002)(6506007)(6916009)(86362001)(186003)(83380400001)(64756008)(26005)(33716001)(6486002)(91956017)(66476007)(9686003)(8936002)(66446008)(54906003)(6512007)(316002)(71200400001)(76116006)(966005)(66946007)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: domFp+pdSSE/IwK0XeMaF3AK9SADs+8o+i5BVBoeQzRbGYafN0HdWNs/k0YgJxr3OGMCi+OTUxiihXKQrTVUDO6FRsw4xtQR7zHGeuYL7S9EFm6ZMdZa1YgyCslT4qcKVwtDxe8qWAnzBhHuhF0iHGZZE4VpBiWdfGDMLDIfWzJ/DOL3P4vJUJHIe7i5eJ71ZunvuHfXo0PokI/e/9g1C55COyinZalXLcHTwxzXAfLFvVpsLq4ai6JPBQnF1MTWS86XQxFk8mFfu9nN2GvS/vHt49m+540iC1TfEF0InJE9fJKI/bT01EpQ/2Pb9cSQ3Ms5sxK4jAKaqVJ68SAv/mXsKOKfispO7LUhHAoCBC+UwxWST1qL+KL9QWdCv+X5ShpA5iTLumrr5uqLSca7c5EMn/IhGo0Vej7y7rIVtdG2bKeb4PD29SBH2Flc3h0pibv033zgXWyO4q8krGbXlNB/tV0b1XEHWI6xYDrJ4OGfSau2JUcoEjP6YS0oK5eFqQhbKQ7XesAqsfvoRl35mjxhrnRz7oDDZISmW4/KFqbCyaNtlatQlkXegQRQ9sn+dEmS6QsaEpOtoljMxRYWbXTd1N2nd4Mv9tpNiQxOmoTlAV4j25KqOJn+FWLekeHdH9NUpaxzCAMYiQm4XsOyBw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <902F59188604C348B7FFD801610BD0AC@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7300.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3647b58-0eab-4b49-dadf-08d880a92f40
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2020 10:05:40.2378
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A2zhOPlTqvDWZam/F8+qET9Qm2Nv/3qK6szkfrHeWegjpc7ivVhtxoMZbEdTxpGsaEeyaCd64KrHrepA4233Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4356
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-03 11:50:17, Sriharsha Allenki wrote:
> Hi Peter,
>=20
> On 11/2/2020 3:20 PM, Peter Chen wrote:
> > Hi all,
> >
> > When running run uvc-gadget application at HS using dwc3 gadget at Linu=
x
> > v5.10-rc1, the video stream will be stopped after 1-2 minutes running. =
The
> > trace log like below, I wonder how _raw_spin_lock_irqsave calls __switc=
h_to?
> > Any hints? Thanks.
> >
> > usb_test# [ 4757.322728] configfs-gadget gadget: uvc: VS request comple=
ted with status -18.
> > [ 4757.329971] configfs-gadget gadget: uvc: VS request completed with s=
tatus -18.
> > UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBU=
F
> >
> > usb_test# [ 4812.376465] check_interval: 37 callbacks suppressed
> > [ 4825.307665] configfs-gadget gadget: uvc: VS request completed with s=
tatus -18.
> > [ 4825.314912] configfs-gadget gadget: uvc: VS request completed with s=
tatus -18.
> > UVC: Possible USB shutdown requested from Host, seen during VIDIOC_DQBU=
F
> > [ 4826.231392] check_interval: 3 callbacks suppressed
> > select timeout
> > [ 4827.336088] dwc3 38100000.dwc3: request 0000000080ebefd3 was not que=
ued to ep2in
> > [ 4827.343547] dwc3 38100000.dwc3: request 00000000b578605c was not que=
ued to ep2in
> > [ 4827.350989] dwc3 38100000.dwc3: request 00000000c6d191cd was not que=
ued to ep2in
> > [ 4827.358422] dwc3 38100000.dwc3: request 0000000085205409 was not que=
ued to ep2in
> > UVC: Stopping video stream.
> >
> > [ 4848.381718] rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
> > [ 4848.387824] rcu:     3-...0: (1 GPs behind) idle=3D162/1/0x400000000=
0000000 softirq=3D10819/10819 fqs=3D2356
> > [ 4848.396956]  (detected by 2, t=3D5252 jiffies, g=3D20129, q=3D3770)
> > [ 4848.396959] Task dump for CPU 3:
> > [ 4848.405925] task:uvc-gadget_wlhe state:R  running task     stack:   =
 0 pid:  674 ppid:   636 flags:0x00000202
> > [ 4848.415842] Call trace:
> > [ 4848.418294]  __switch_to+0xc0/0x170
> > [ 4848.421785]  _raw_spin_lock_irqsave+0x84/0xb0
> > [ 4848.426143]  composite_disconnect+0x28/0x78
> > [ 4848.430327]  configfs_composite_disconnect+0x68/0x70
> > [ 4848.435290]  usb_gadget_disconnect+0x10c/0x128
> > [ 4848.439733]  usb_gadget_deactivate+0xd4/0x108
> > [ 4848.444089]  usb_function_deactivate+0x6c/0x80
> > [ 4848.448534]  uvc_function_disconnect+0x20/0x58
> > [ 4848.452976]  uvc_v4l2_release+0x30/0x88
> > [ 4848.456812]  v4l2_release+0xbc/0xf0
> > [ 4848.460301]  __fput+0x7c/0x230
> > [ 4848.463353]  ____fput+0x14/0x20
> > [ 4848.466495]  task_work_run+0x88/0x140
> > [ 4848.470157]  do_notify_resume+0x240/0x6f0
> > [ 4848.474166]  work_pending+0x8/0x200
> The reason for this seems to be that the usb_gadget_deactivate is being c=
alled with
> spinlock held from the usb_function_deactivate and the same lock is being=
 used
> in the composite_disconnect (&cdev->lock).
>=20
> This should be able to resolve it.
>=20
> diff --git a/drivers/usb/gadget/composite.c b/drivers/usb/gadget/composit=
e.c
> index 05b176c82cc5..5fced737e4ef 100644
> --- a/drivers/usb/gadget/composite.c
> +++ b/drivers/usb/gadget/composite.c
> @@ -392,8 +392,11 @@ int usb_function_deactivate(struct usb_function *fun=
ction)
>=20
> =A0=A0=A0=A0=A0=A0=A0 spin_lock_irqsave(&cdev->lock, flags);
>=20
> -=A0=A0=A0=A0=A0=A0 if (cdev->deactivations =3D=3D 0)
> +=A0=A0=A0=A0=A0=A0 if (cdev->deactivations =3D=3D 0) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_unlock_irqrestore(&cdev-=
>lock, flags);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D usb_gadget_deact=
ivate(cdev->gadget);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock_irqsave(&cdev->lock=
, flags);
> +=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 if (status =3D=3D 0)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cdev->deactivations++;
>=20
> @@ -424,8 +427,11 @@ int usb_function_activate(struct usb_function *funct=
ion)
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 status =3D -EINVAL;
> =A0=A0=A0=A0=A0=A0=A0 else {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 cdev->deactivations--;
> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cdev->deactivations =3D=
=3D 0)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 if (cdev->deactivations =3D=
=3D 0) {
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_=
unlock_irqrestore(&cdev->lock, flags);
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 sta=
tus =3D usb_gadget_activate(cdev->gadget);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_=
lock_irqsave(&cdev->lock, flags);
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 }
> =A0=A0=A0=A0=A0=A0=A0 }
>=20
> =A0=A0=A0=A0=A0=A0=A0 spin_unlock_irqrestore(&cdev->lock, flags);
>=20

Thanks, Sriharsha. It fixed the kernel dump after video stream has
stopped, I did not check the whole trace carefully, and not found this
spin recursion issue. You could add my Tested-by for it. Meanwhile,
this issue was reported before, and unlock at usb_function_activate
could also fix the possible sleep at atomic context issue for dwc3.

https://lore.kernel.org/linux-usb/20191115070122.GF30608@b29397-desktop/T/

--=20

Thanks,
Peter Chen=
