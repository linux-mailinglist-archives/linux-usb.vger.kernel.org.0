Return-Path: <linux-usb+bounces-14161-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510BD960157
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 08:10:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 952C5B219F3
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 06:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9FCF7604F;
	Tue, 27 Aug 2024 06:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="dYPFQOXe"
X-Original-To: linux-usb@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6F20E6
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 06:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724739013; cv=fail; b=mWW/noXAuBtij4Sg6FaMm9eiffEC7zMDM+8jqfNp2RxJsFwhiek9Ee/8rQH0S1cEMwwXBf7+VDYGPO1YxGO5QuHyYqriNbVNmMaGd/IcPYmtoe1+7KSWIVl0FJw7gRlMqfJdlbmFmw2PhjbzkLEqEScZqw5zXFgfnU8JZw6QAtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724739013; c=relaxed/simple;
	bh=Nm0Mk8tkV+82wzscpGDea3RC2/jNu6ULYIFt3t2R9G8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aSAMtZ9jUBOUijQ07XTxIR5Ep8qdmFFZQPudQW8KprcPp9/spWgDdGgPtplri66ilblNrXy+r/EikP7tIBY0j2seFbtdXHiYVVAOI6vlrckEU1MQuceK8HAtA9GhSl90+wg0VOAv0nC7CTtvhQbHglgKRpo4dDpfZC6dNzxgwl4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=dYPFQOXe; arc=fail smtp.client-ip=40.107.243.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEMElMoI68/eDHD8d2yGkgTQEE4WyKUW0lIcvPAAmnvUPq4L0ZdMRPA6B5mOGwBCFIc1OFXGWyyil9aVxV5hXAwUq5wRK2qKO4tbL/VzQiQIqyRFMW6WRQstTCUid7hT7JVhc4EffB4vMBUTqdU+HhM9e/EpnwdKliBQP6oaBSPvMvtauhTSkQcdXimI6dfTW5AQnLnud/NkwffuL9CLmZZ7Pk0xlgqFhiHkr8tKz4ocz5Go1C2NyVLRh/n+P+CcwAiLZeVm0m960UJ5hp4Vzw/uGKiSJMm6Kwie95V7qDwmjQInWq9YhhO3BvezPIg6b6s8+EyTITuhiFQwY2aerg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5w9oiK9XRdepHjpNdaCUTsfb9xOkRq0Q/be+9lCH+w=;
 b=VKliOhQva0MK02/dvYJHr8NcOj4tjVKsH/FlDoIrgKkokCIuO5CMWRjzwcZjYX7C3DXYGWhAoyCAwz64uoBTmMmnGvBmuf9panga2EIXyL0kfGyZ8Z/4vPt3ZaMd8PgAs/MgMd6tWeRqmB1qgC+cxLPiZGKRP291U1q9UQwDsF8Pf6PNlHQJ0aCLSF2+lerBzm2UuirMHvNIainCQ5tfN8UDpKpJUM7et3crUOMBe6VYr8DAf2mvLnWfKLSgPJe0tdLClGB80gB/U4nDWyugDRivP6H3dh2a1e1Nnf/alWcYSLkVUfAbeYQvk9IFBx7v1J9xqipBE5sWTZGGOZJj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=gehealthcare.com; dmarc=pass action=none
 header.from=gehealthcare.com; dkim=pass header.d=gehealthcare.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5w9oiK9XRdepHjpNdaCUTsfb9xOkRq0Q/be+9lCH+w=;
 b=dYPFQOXeQrWucgQ07uMGexOwmuW6ObHerMqx57BWn6Nxa+Br4geDlkQ7hiVwLCb86qFo9RRd3hlMt2zSx0FzugPQNAor3qfxklVUKv/ShHQaZiT/QnT9A2L6H9uUb6g1j/6Ol7kStAD3qK/XejqfzXYJdb5ytxr+LjdVRspAYSuN4e+TcWpD9dM8er5JtWs1sBBUWItteQmN3MxDqe9EhEX8mNrs/Qs1kOYFakKUqFFdY275hPM7Bw6oyIC+gk9fHzwCVrM9KocqZjyx/kFIyj05vXz7VrDQbBdCgA+eko3Q50WGUZ5M+n2hwFziqkV+B5ArHEYvbp0+atP3rMp41A==
Received: from PH0PR22MB3884.namprd22.prod.outlook.com (2603:10b6:510:2a1::22)
 by PH0PR22MB3521.namprd22.prod.outlook.com (2603:10b6:510:16c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 06:10:09 +0000
Received: from PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4]) by PH0PR22MB3884.namprd22.prod.outlook.com
 ([fe80::d41a:c85c:91fb:d6a4%6]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 06:10:09 +0000
From: "Pu, Hui" <Hui.Pu@gehealthcare.com>
To: Xu Yang <xu.yang_2@nxp.com>, "peter.chen@kernel.org"
	<peter.chen@kernel.org>, "gregkh@linuxfoundation.org"
	<gregkh@linuxfoundation.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC: "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com"
	<festevam@gmail.com>, "linux-imx@nxp.com" <linux-imx@nxp.com>, "balbi@ti.com"
	<balbi@ti.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"jun.li@nxp.com" <jun.li@nxp.com>, "Ray, Ian" <ian.ray@gehealthcare.com>
Subject: RE: [PATCH 1/3] usb: chipidea: add USB PHY event
Thread-Topic: [PATCH 1/3] usb: chipidea: add USB PHY event
Thread-Index: AQJsAbGey8FVoTBfQHlZknJ9RZlU4rEYh8pA
Date: Tue, 27 Aug 2024 06:10:09 +0000
Message-ID:
 <PH0PR22MB3884EF3CBE887E4CF59654CFE1942@PH0PR22MB3884.namprd22.prod.outlook.com>
References: <20230627110353.1879477-1-xu.yang_2@nxp.com>
In-Reply-To: <20230627110353.1879477-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gehealthcare.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR22MB3884:EE_|PH0PR22MB3521:EE_
x-ms-office365-filtering-correlation-id: 1d85ba88-9413-4ebc-960c-08dcc65ee77a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?T4RzhYH8kMh5p1XpV3JAbsACJUGIpxP0XZ+uRAWP2xq3IQEDtAyScUtK91jR?=
 =?us-ascii?Q?F52lJF/TZN95MolTpsY/xqCNPS1gwx0LRzHveKjoCdZEBDznfgikU+OkvSi9?=
 =?us-ascii?Q?6ka79MuXQTPpqB32pFZs8SzsVLRc385fy1Jg91ZKbNgDJb8Zu7po+sOyAL5V?=
 =?us-ascii?Q?ENDabgOurDxGlFBRXp0+sh1BC6l2Bq6q233DqA/JGdhKzN437hi0WsCTUOlF?=
 =?us-ascii?Q?KG+dHlqGuF8SDJyN2PcFBW/lrlMJWQFK2PqpR6p5COAtnWkJDkmopeJ55HFv?=
 =?us-ascii?Q?hKb5RJGiLFbmrnG0AOzMWDS/R6lkNe0Jt6q+IlG61AagNgRl0o/v/+Zsb/ht?=
 =?us-ascii?Q?kW5qkUKHQlrlg3KE22RZKHkmpvq+FyRjnmI28MY1jLkj7LR19/GgYRPRuupl?=
 =?us-ascii?Q?uT+FJGfKuR0DTxKt5y6RnvFAbIQFSb5VSGmmIEaH2ixg4OBIJjTFc67XllIP?=
 =?us-ascii?Q?ER7OCSoPTGVaGVcM6cyokMvc7CVIGMmYX6W0QxIaAiUWoY8q+CYiCihHELBR?=
 =?us-ascii?Q?N6AWuTLNKrUJfWUaSoshSpMQQ7y0jWvnRtWVIiXkoZKZLR3zYZJaZx90VIkl?=
 =?us-ascii?Q?vKvt/dPFQj9QUlcSxn25jQUimCzvG23eNjMjkihjo7ieYtVqzpe14dsSrxGx?=
 =?us-ascii?Q?0Fbhzy0aK6Bo0TJ1+IYHymuJ+7Ro58/Kj8Ua5oeOKepf1YOHjmrKU2XZf2/R?=
 =?us-ascii?Q?dYZOYrXXqQO62ILRl1ilAo9xr3ABklGUuLUhsfBMQvgx82jvu1A/KdySduOW?=
 =?us-ascii?Q?8eempS+F4kEtIDopX1HJ2pKrawzsIDds+E/PFwFOQIcH7kdqJKHyX9Fb4h+V?=
 =?us-ascii?Q?xqmR++YEcxAIqDTVjfGjNy9XraN4iCgcZ0uqFV7Rlk7rbiL0inKYrcPgdVrq?=
 =?us-ascii?Q?TmuQpzVLKRbp7nKBS58ZoIm1+2v6aVeDROKGuyUaDIm9dmW6GBcnhhyR0lTq?=
 =?us-ascii?Q?Lv77rUWhFh0pwdeQzdg6eBunbVNaAKjRSgTT6T1u6fVQCa3AJFpirqdsB1LU?=
 =?us-ascii?Q?JA/SHhzmXSsb4Ypu/LQ53Uvwv54JO49cF1vxmQ0CQps5IC6YHHxhV14Pivfh?=
 =?us-ascii?Q?dg010Wn2JvV0R0OJ26C48eQ0ELY/qEpMOhBnSQMa2ICwG08yhL9BE7woqJm4?=
 =?us-ascii?Q?78fL65KtmdfIkcv4i3YRyu8Wix18Lheh4K5UT0gsErYblvUbmySorhYkpf/F?=
 =?us-ascii?Q?Zh2jj0vRFLQxhRrOrBSGRh+dsDOeYrSOXTXIxMZQJGgX4t8ZhWYQJ/P6l+WV?=
 =?us-ascii?Q?rcmDKpPAH1PKQpBWoxlwPHFfQWHdCFqJa1IZRHXJPHOhY6e+tE8bDBehE16S?=
 =?us-ascii?Q?wAiW56U/CbbdgO1eVLJSgf/oi36J1DKf4hSDjHBs/oo2XRVVEmLCqxywmNHZ?=
 =?us-ascii?Q?cNe/AhsfIqSJuycytCD9Fy+BlzxfuGY6IcWqKolO3bC/KFV82A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR22MB3884.namprd22.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gh06yh9li8TEEA2cpLzuX8tNU/p6iIUYeaGU2YRjEnSA/QOwfvCHnLvWvsok?=
 =?us-ascii?Q?cjy1ZC0pqsHBiqU9B7HbAlWwZvDNqsGzm2mkLA6o2ndpp27g4giqMYhD1eap?=
 =?us-ascii?Q?2YNdwbANvFAEN30ir624mg2fjaixLVNQwL+nCC4W2eqmPtLDqjvhVl++Mp7T?=
 =?us-ascii?Q?R/MUFSoFpSfab3TmLdDGn/0W/iDwOQ3uyUd6ARA7EUZ7ZVH1uZLonadnuYeJ?=
 =?us-ascii?Q?2LkLwVntalpKJ2TkdcYauRgehzK7L/c9La8LHWaGAmEZE0WgjSNk0XLN8iwU?=
 =?us-ascii?Q?zbRuppwOJoug2vO7hThiKoopBNfMIANuCvwDomVMjXQ822rapBJWWZzozybd?=
 =?us-ascii?Q?tKzVtf7g3yg1Xwvq4Lu1X40T5lLMBx/NTiVm9nrebon+klMIrsnKypNZ2ptH?=
 =?us-ascii?Q?6yMq0CcW7+LNGj0wB9P4l3TFkSUEz9XEbhW0CwMF5u84Em5MBMvvd/2JQ+4I?=
 =?us-ascii?Q?DXPjBVvr/NM084a+/8Jp6ng69Q1kDP1RsvlRwPOMQ7WMt0yYlzyQqIPnYHez?=
 =?us-ascii?Q?EH+PBVIS52YUkpj1Jy4uZbVwuijRogRbz0fY0+gzY295fDLA8ctnuLb5RKSo?=
 =?us-ascii?Q?yPpDV6ssaoWBPId1D5d8+nbnUZEIzbIEwMKmyckcmNwCWs2CCanG6XWFlTRB?=
 =?us-ascii?Q?OysdKUNmjacALb0DHwY2yKzyyp68o+9zYmKxQXhXRHWeuQIK03+UfN8Ur43o?=
 =?us-ascii?Q?Xgfp9qrQUp3IvRHjHIt3S7CoBuABLW7YMtdSQSexukdAwfvqQyiEk9mzUXIS?=
 =?us-ascii?Q?EZkUmxE5uWBEIYWg8s4SYUkY0dvYKCH3CpVCdBStyGGQOEue/eLiLASAu9sX?=
 =?us-ascii?Q?fNaIQO9AS1oKuoPIZrcwfjv0jStcVNOzX9LMZJMrAT8Oh5zvwOaMiYotO/Ct?=
 =?us-ascii?Q?/7dtkoKjVIHd8Gi6eBnYbZk1tg6vWgrsU1wqMEt6X9wugljH31KyKduYe5zO?=
 =?us-ascii?Q?SrZ5xQj2U9TzQ+s/OiLsaypc0ajlkv9yao4Eq/KoXajAe/GNW221kfv9zAVb?=
 =?us-ascii?Q?Wl3yL2aF1mC4vnfkHX0jSQJi4LD7TUbQTymnJcPMV4KsXxxWh0ZvxHvyX6wp?=
 =?us-ascii?Q?8MI5odTc+i/Q6rzti9SyRUvLtohtTbA4aJqIZcqZ0MztNMEo1ctDGJedOk4j?=
 =?us-ascii?Q?NhgPt0dZlzmKAfQPyzV22WK44z9vkS5dh8SgXCTgQsYkVxVWrOChnN9nvGh3?=
 =?us-ascii?Q?ztwEU3VNpuJpIAkBQCQTt4pae6hUGqXmBgkUuDVhLbDkmCjWiQMr0F+RZVd0?=
 =?us-ascii?Q?Ta6t2b6M15ReJt+9uyu/CV8v37VcrmpLG+ITK2m5d6VSGIhtNYtlNEMQTouZ?=
 =?us-ascii?Q?5B4pf/saQMVY68FryP8WAiYIRsoqDYo2qxNa+4iaw5C9a/TKVnhFigMMUrdD?=
 =?us-ascii?Q?Vtf4781ZjRL7j0D7EymNgAnmH1rlaRBEpq1scHCt5WcKSexHZBSvh+T7+b+W?=
 =?us-ascii?Q?yX4cJpyVm840pJ6WQObQXIwP0oTtFnIjdfSRZndYuJXDZpEHUIHqxZdC/6Hr?=
 =?us-ascii?Q?SKhbNX2wFle9levs/SvpGWO3hmfb1+qHQGoUZMPgnCHyRuo91NMXf3koqxRV?=
 =?us-ascii?Q?B7ticWq70mS0BkWt5VIp+xLD8Z5LurH5h8pfh2GK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR22MB3884.namprd22.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d85ba88-9413-4ebc-960c-08dcc65ee77a
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2024 06:10:09.2456
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zHPRwwY4n5aR9S5+s/yO0dws4p82VHLXi5RKhTQj/punRoUE1m+mAT62u0bOkNWiPguM49+IyLlkhsifnSFDvz6qgYVxxWYHGjo6T2Yt1qw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR22MB3521

> Add USB PHY event for below situation:
> - usb role changed
> - vbus connect
> - vbus disconnect
> - gadget driver is enumerated
>=20
> USB PHY driver can get the last event after above situation occurs and de=
al with
> different situations.
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/ci.h  | 18 ++++++++++++++++--
> drivers/usb/chipidea/udc.c | 10 ++++++++++
>  2 files changed, 26 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/chipidea/ci.h b/drivers/usb/chipidea/ci.h index
> f210b7489fd5..d262b9df7b3d 100644
> --- a/drivers/usb/chipidea/ci.h
> +++ b/drivers/usb/chipidea/ci.h
> @@ -281,8 +281,19 @@ static inline int ci_role_start(struct ci_hdrc *ci, =
enum
> ci_role role)
>  		return -ENXIO;
>=20
>  	ret =3D ci->roles[role]->start(ci);
> -	if (!ret)
> -		ci->role =3D role;
> +	if (ret)
> +		return ret;
> +
> +	ci->role =3D role;
> +
> +	if (ci->usb_phy) {
> +		if (role =3D=3D CI_ROLE_HOST)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_ID);
> +		else
> +			/* in device mode but vbus is invalid*/
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	return ret;
>  }
>=20
> @@ -296,6 +307,9 @@ static inline void ci_role_stop(struct ci_hdrc *ci)
>  	ci->role =3D CI_ROLE_END;
>=20
>  	ci->roles[role]->stop(ci);
> +
> +	if (ci->usb_phy)
> +		usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
>  }
>=20
>  static inline enum usb_role ci_role_to_usb_role(struct ci_hdrc *ci) diff=
 --git
> a/drivers/usb/chipidea/udc.c b/drivers/usb/chipidea/udc.c index
> 54c09245ad05..d58355427eeb 100644
> --- a/drivers/usb/chipidea/udc.c
> +++ b/drivers/usb/chipidea/udc.c
> @@ -1718,6 +1718,13 @@ static int ci_udc_vbus_session(struct usb_gadget
> *_gadget, int is_active)
>  		ret =3D ci->platdata->notify_event(ci,
>  				CI_HDRC_CONTROLLER_VBUS_EVENT);
>=20
> +	if (ci->usb_phy) {
> +		if (is_active)
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_VBUS);
> +		else
> +			usb_phy_set_event(ci->usb_phy, USB_EVENT_NONE);
> +	}
> +
>  	if (ci->driver)
>  		ci_hdrc_gadget_connect(_gadget, is_active);
>=20
> @@ -2034,6 +2041,9 @@ static irqreturn_t udc_irq(struct ci_hdrc *ci)
>  		if (USBi_PCI & intr) {
>  			ci->gadget.speed =3D hw_port_is_high_speed(ci) ?
>  				USB_SPEED_HIGH : USB_SPEED_FULL;
> +			if (ci->usb_phy)
> +				usb_phy_set_event(ci->usb_phy,
> +					USB_EVENT_ENUMERATED);
>  			if (ci->suspended) {
>  				if (ci->driver->resume) {
>  					spin_unlock(&ci->lock);
> --
> 2.34.1


Hi guys,

I'm not sure if I'm replying correctly, please correct me if any mistake.
(I didn't find the cover letter in this thread.)

This patchset has been merged on master branch, but only the 2/3 patch on l=
inux-5.15.y and linux-6.1.y.
So, on 5.15.y and 6.1.y, there's a degradation on the i.MX6 devices that th=
e usb hub cannot work well.

- Paul

