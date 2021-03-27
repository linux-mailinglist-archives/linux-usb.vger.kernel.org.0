Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2158634B81A
	for <lists+linux-usb@lfdr.de>; Sat, 27 Mar 2021 17:08:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbhC0QHm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Mar 2021 12:07:42 -0400
Received: from mail-vi1eur05on2068.outbound.protection.outlook.com ([40.107.21.68]:10624
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229582AbhC0QHK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 27 Mar 2021 12:07:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jw77aTyvp6q1Co2FZDcHH3U2CHWcya6bAnjqR6OTZH1M+3PMtXtyxQhxfO/vJVREUSdolOvNxqTvicw6xEYPC7Vj+u/Qd7fcIi0JDtBOGTgneNmV75UL05Ir9HojzFHxUmpH2fuKZyjbQolJOKjjRMq4UQvQRlmBsJkqMzjZjeId2Jag641I+6vYyQZVH3CRyKivwKL5sZEgDnTyANTiaKkU1XpDuzLQ7KoFeiG3Egq/yVVjqPqtSpxgErnFbYaPCNNxZGUa1LUIYwSXEy9IwIOjILgN/dXLmIl7HKZSkUI8pPPjfKmqG8hKzmLjonsAcnN7Fd8XN2POJMNNEf5+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdAhxVifS2RJhooZ66V+4B0geOLn9p/ptG55/ANMfcs=;
 b=DL5X4un1qCvuO054GMpXoij6LUbiYPxbl9yuRSyeR5JIxpGeuKqF4MwK836RgG8RwK6t8nDy1vqwve7956hjTANc02ko/Oles2jsXCfJJ18L9Yv4x8fyRrqP8pza5DG9H0b/edOAt1jGKN823tJbSKmbS2Sn4SFJ/TAAXiYUR4VFR8TJQ069iSVgC5ECPUR7PIAQcJ7mcWKD6JNsz7fW9TpiZMlWNb8SpMDYTGkJX4q5s75eyhOp2BZToZti3DkPFqfVsKVouKLwG7hmvz3YcwO7U5gYmBtftArAdwYALUR39jN2C9a4841j7gS6UVd1EYMF3xc95Zd+JHoNeVK4rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdAhxVifS2RJhooZ66V+4B0geOLn9p/ptG55/ANMfcs=;
 b=JMG5xKnof3LJrwZqvFAJft0On27fW36eri9EdT5S6Fn+UuthH5DO7hQO2oldC3r4xYlPZ5TP1RNkpV73TeeGSkGBFnNxcXfH5CKTWHA9jWO0FeGpgoYc5FQyoSDK1fv1CVOVS3isMUz02ElOzX5CYrQ9CDykEBrlBR8PwXm//fM=
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com (2603:10a6:803:e9::17)
 by VI1PR04MB4992.eurprd04.prod.outlook.com (2603:10a6:803:51::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Sat, 27 Mar
 2021 16:07:08 +0000
Received: from VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12]) by VI1PR04MB5935.eurprd04.prod.outlook.com
 ([fe80::801f:563a:65e:8d12%6]) with mapi id 15.20.3977.032; Sat, 27 Mar 2021
 16:07:07 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH v2] usb: dwc3: core: don't enable wakeup for runtime PM
Thread-Topic: [PATCH v2] usb: dwc3: core: don't enable wakeup for runtime PM
Thread-Index: AQHXIG8IH0srsoG/+kClWlMAdvR6V6qWScqAgAGxoAA=
Date:   Sat, 27 Mar 2021 16:07:07 +0000
Message-ID: <VI1PR04MB593561F8C60824BFEE65FD9189609@VI1PR04MB5935.eurprd04.prod.outlook.com>
References: <1616563105-28565-1-git-send-email-jun.li@nxp.com>
 <YF3j3/FEJ2/iFCBJ@kroah.com>
In-Reply-To: <YF3j3/FEJ2/iFCBJ@kroah.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=nxp.com;
x-originating-ip: [92.121.64.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 1ac0ee17-3eb9-4efc-03a7-08d8f13a5f14
x-ms-traffictypediagnostic: VI1PR04MB4992:
x-microsoft-antispam-prvs: <VI1PR04MB499220337AF1E8CA9F63632389609@VI1PR04MB4992.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3WpVsUZklzm2aelofQoUP3a2iqVATpM82DUhadai1TnfuGf98tvtz2W+Z3NGxLbCANUpZtUIs3j/73mshnXTOdnpniTTBdkDESGWQW5/vnhr21xUOBur7u4gm+pjvdLeuNz47APLT7nuEU+0utesQDObkdWhiikfHliyLUjhFfOmerYTM8QiqY5sIcIVp0R9yitRGhs8yXU4qWc1SJ+G0OjCiauwGlfU20apdSdmuoE2XWmL0OrKFDTAHXjG7Igd25JG3dPqC7J4wwYoP2ydgQX1cP5lf+aN6WGbjHD8yYyS6whO06YHwzPIqpOFCYTovWHSkjSXp9JtBo9AdtuRXGumYxqFEVqGKey3ID+nlg8Syv8T4QM0QL/kkh/u6Vu7LHRAXf7S3vkl9VXQhuoJxTAN359d9zdclCGYYK65dJ5WwCTa0TMyxnvPh+eRjomv/owzUCs1lQO4YYA4YD/IwqSB+u0wdnPUsDO0G3/NJGYzrPAUwWSRhaAZaF4CKt60po0WgpENUKvnpeJp5EdPnlfbZ98GgSTdiIrpzQgmjm/2MmEKnRXXFEFXhFrBX4fgD38QBZla/ldXdxQTWUobO/fmhXixS+DyFu/y3r4+tJ6JSylPuPtL4Smh9/cIclXDpZ77f4ofwxkE/07mjutErNp4J+coJt3sjUJGG0kdyEo=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5935.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(136003)(366004)(376002)(66446008)(55016002)(8676002)(26005)(316002)(71200400001)(52536014)(6916009)(64756008)(2906002)(76116006)(66946007)(4326008)(66476007)(186003)(54906003)(86362001)(8936002)(478600001)(33656002)(38100700001)(53546011)(6506007)(44832011)(83380400001)(66556008)(5660300002)(9686003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?5Gn3gSLtrCFvpviNUG0V01DOMEczdyY2VN3sfklgEFFzfOl7DynhrQhGInju?=
 =?us-ascii?Q?anQbK/0zUurG1A84cIa+z3ETldOWWqgWw2dWrkzdoSv0Lsa+o9aE7zl0QLjJ?=
 =?us-ascii?Q?kGIFXNIwUrc2wRgsG4Lf9fY/mT0vrdSNbCCNoQoCECK/z9YrlN8hWifN+Uun?=
 =?us-ascii?Q?aoub2WoxpH6UBFt7nIQiddeBMr3gjJ1Nq/tWGTiQdrLnWo20MHlwcvdriF8A?=
 =?us-ascii?Q?8h9Pl+/UB3hl3Vk4oPKRzfSdCk2ZjfClc79u0NBjm9Us6usIGC9JSXqwuNQi?=
 =?us-ascii?Q?/yV6mwDf5kAYQBkGJke4QChnRXmEIwD+GrboVBbFGuWA4sQ9SIgEb8FVmuHb?=
 =?us-ascii?Q?pntOMu7dYhqStoS3My7DxLiZdj2lMZ3i4Q4YUEAHp6l9fsrEHcuGxEXLAVSF?=
 =?us-ascii?Q?0FkT6RcnO9tU7PY96//e1jIiXkXuaiqaaqPj+Iu45fvwcXkXSx8bKnWHwLWP?=
 =?us-ascii?Q?k57TfBLILTlE7W8XmzwaQ4lvWIfSXZQSRsTLkixRmZnPdHIzqoLkQvuka0ix?=
 =?us-ascii?Q?8vriBBR69TSOImQNukOevXGgMnmRQA9eAagTgkz7RH8nZuy09HfFo7l2F73r?=
 =?us-ascii?Q?8rTY2QiffVFXqmJyIsChXwV1q2z6Dl+qnCwl3PIhZg3BcSqMCZ/uRdN6RS9c?=
 =?us-ascii?Q?AslD369IsTWu/tZb3xF/2pIKbuP8VAXI1dIKggujw+bfih/d9BAw9QlA1CJ8?=
 =?us-ascii?Q?85gBXFfxAsjqaI3lOiInfcVipfOxfH4QkgInzkExDTA/loUm583/0LpjwNZ+?=
 =?us-ascii?Q?N0EY5KMLKN7Ff3OgkPyIlvAtWv8P/I02KXDWf3/RSjQmgYwAMRQtOSxkPiBm?=
 =?us-ascii?Q?/RIJPvfN0vX09Mj+is/0BsV5+2x377Q7lc898Cm492t45IZayRF+W8pgyO6p?=
 =?us-ascii?Q?b828hE1H/C2iRDW/l7dWWG71LvSny1N07km8diSl3UtawD3d7C4wYufsJGey?=
 =?us-ascii?Q?TjHxspwcKIYQdR0YXtZZgCDSLHCPZ/Szl/nmlmkaFj7hK+1Ly7HhefaSjXZg?=
 =?us-ascii?Q?F2amuHC36wRu/5CCWYk+t9SwVSaprLAU1NyPvmYsuaYt4ONXCEhviBDOzgRr?=
 =?us-ascii?Q?ndcx2YQDqVGwxWZ7jadkVwkm0cvO5Hch7FD7OCIa615l99nsTrF6ncgakhuF?=
 =?us-ascii?Q?OK5zHF6CJg8B4s1pf86TPAkDXmQQ0qSSJK0/RpRhv1gt45MnLpbW00u1Mx5t?=
 =?us-ascii?Q?qVE8pgfKKlvv60+As2S3YArfc7gGGuwaMhxPFj7BI1BjmtMVLzEBWb8kWzih?=
 =?us-ascii?Q?TWBaIGtFBkdCEjnd90c/o6hennp7Ne83f8LE/vF2HQTClLHM8MCxCLCSH40A?=
 =?us-ascii?Q?+YtVoJ01x9T0kUIuV9utFAlN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5935.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ac0ee17-3eb9-4efc-03a7-08d8f13a5f14
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2021 16:07:07.7010
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HxqDgjSgi/WLclZh11HZ5gHdtnesvTvuhZZwtf5iNrm5L5noUPoJo8PTPoikIwQa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4992
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Friday, March 26, 2021 9:39 PM
> To: Jun Li <jun.li@nxp.com>
> Cc: balbi@kernel.org; linux-usb@vger.kernel.org
> Subject: Re: [PATCH v2] usb: dwc3: core: don't enable wakeup for runtime
> PM
>=20
> On Wed, Mar 24, 2021 at 01:18:25PM +0800, Li Jun wrote:
> > Don't enable dwc3 core to wakeup system by default if runtime
> > suspended, this will make the power domain of dwc3 core or its parent
> > device can't be off while system sleep even system wakeup by usb is not
> required.
> >
> > Fixes: fc8bb91bc83e ("usb: dwc3: implement runtime PM")
> > Cc: <Stable@vger.kernel.org>
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> > ---
> > Change for v2:
> > - Add fix tag and cc to stable kernel.
> >
> >  drivers/usb/dwc3/core.c | 4 ----
> >  1 file changed, 4 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c index
> > 94fdbe502ce9..0bba5c21de56 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -1840,8 +1840,6 @@ static int dwc3_runtime_suspend(struct device *de=
v)
> >  	if (ret)
> >  		return ret;
> >
> > -	device_init_wakeup(dev, true);
> > -
> >  	return 0;
> >  }
> >
> > @@ -1850,8 +1848,6 @@ static int dwc3_runtime_resume(struct device *dev=
)
> >  	struct dwc3     *dwc =3D dev_get_drvdata(dev);
> >  	int		ret;
> >
> > -	device_init_wakeup(dev, false);
> > -
> >  	ret =3D dwc3_resume_common(dwc, PMSG_AUTO_RESUME);
> >  	if (ret)
> >  		return ret;
> > --
> > 2.25.1
> >
>=20
> Can I get some verification by other users of this driver that this
> actually fixes something?  I find it odd it's not shown up yet to anyone
> else...

This is not a common case for dwc3 users, I guess only a few users
support runtime PM as it's disabled by default, even with runtime PM
supported and enabled in my case, system sleeping with dwc3 core wakeup
enabled does not break any function, it's just leave the power domain
(attached to dwc3 core's parent device) _on_ even I don't need any
usb remote wakeup, so it's trying to "fix" a power waste.

Thanks
Li Jun
>=20
> thanks,
>=20
> greg k-h
