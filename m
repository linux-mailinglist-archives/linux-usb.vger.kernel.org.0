Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 436596467AE
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 04:28:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbiLHD2E (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Dec 2022 22:28:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiLHD2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Dec 2022 22:28:02 -0500
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2055.outbound.protection.outlook.com [40.107.249.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 695B031353
        for <linux-usb@vger.kernel.org>; Wed,  7 Dec 2022 19:28:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rdypr/Wg+NG/BJZk+bK+WEwv/oOzPTfigUU/p/Bycs9sWmmjMX6B68h5ymLoR7/kcVOT743NyQVq1tPEGNJrMQgSlg45I+jLQMvX+g0D/9LGw1bJsTioXSsb9GGa7BgHio1eEDY9rCACWv9FSfx1V66kpelR4dzBIWkjiXccCtxS5Q+fV2Jy3XCP11XAm1xaNU6K9raLSGlvDKpnx4PvRtq0LJH91NXmSmzBFF+q+nQU5Zhpd5Q3+VQhnCz+3I63PH6dO7bLSyF/J6ZtrgH9NGJh5aOmOlWtoDI73k2N+/HZCiL7smrsrdZ1oGqzI/J4+DaFARl/fZvJr7uWUqfUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XrK+USbz2XKQlK04T8cn8S1My/SfwxIoXr1SOlhkvA=;
 b=gZYpDStfZ0ggGumr0TDhWsc/0yts28zdwB1XkCiHFdVUw52m2KtO+vqfJuXRw3CfKycqu9lb9Oc6WPbVgTs8uhnQQzWYi2f2JvonjYm4h/8ZyD4m5K+8jrkX3sqMVyi9kweXVPDoMJXJnmc2sTIRksuQ6cK/+ouGMxql+KrpcyBMAM7R2+Ru9xnEeesJVjk11wJ1OLuOHekhL8UtGCkuFubrLbzzAQZKQvaaz5Z4wd8TLs0GXPEM8Aef2kztAICpwQeo63U7mEVELznaYmgLwcj9OcNA7rS+DLwtFCzU4o5yrsx5zdlN37HfwZvSRiPrDGiNzMLgnK7b9Qgecw5bNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XrK+USbz2XKQlK04T8cn8S1My/SfwxIoXr1SOlhkvA=;
 b=Ji5aOMToNHl0QqnqQ9AbNAcchs8uSfbrRucItXHVe5HX1nXuIpmhAEMvmfUjU+Y2hE4C4Cfl1DkL03JrTlj3wzZxwt/3zuQr7+bXrVtxEWdC1cG2U3jiJAc4zhAK8JM4xgFWpGGkGT00io1UJRKdI3rcelXDxE7gZ6pEsAIU2Fo=
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com (2603:10a6:102:270::18)
 by DB9PR04MB8219.eurprd04.prod.outlook.com (2603:10a6:10:24d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Thu, 8 Dec
 2022 03:27:59 +0000
Received: from PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493]) by PA4PR04MB9591.eurprd04.prod.outlook.com
 ([fe80::8184:d5e2:3c61:b493%6]) with mapi id 15.20.5880.014; Thu, 8 Dec 2022
 03:27:59 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "peter.chen@kernel.org" <peter.chen@kernel.org>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [PATCH] usb: chipidea: otg: handle vbus change for udc iff it's
 in device mode
Thread-Topic: [PATCH] usb: chipidea: otg: handle vbus change for udc iff it's
 in device mode
Thread-Index: AQHZCeoA/4OFgtdyQUW9P16vuLC1dq5jVQ4g
Date:   Thu, 8 Dec 2022 03:27:58 +0000
Message-ID: <PA4PR04MB9591D7729CE2F0F7134A09B28C1D9@PA4PR04MB9591.eurprd04.prod.outlook.com>
References: <20221207031448.336080-1-xu.yang_2@nxp.com>
In-Reply-To: <20221207031448.336080-1-xu.yang_2@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PA4PR04MB9591:EE_|DB9PR04MB8219:EE_
x-ms-office365-filtering-correlation-id: 4bb9b122-6943-49e6-faa8-08dad8cc3460
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pZFP6FaEjlpm7nSTCuLtF4KAlb+qIJxqZwCvx+vRADdpCzFacOnpSu8S+Ror/sT2FTPcp7xLpCBtE5RP4MEXEMiZT9lFO0EZRCw+1v0AiOBk2pPi6ZxpffjEvzoIKO/D02H69E1UEgr3VAVxzfGwaTEG7UtViK6/fhI9CW1bvq2Kc6sXF2umGh4G/9HQTUFr29IXTcn5Ar2Vq+T+/sUr0dXAnwxceeOXQKwMnxnAsyu0JsbJqYWdFtj/1n0Xwi0Tpl4F9QbrtBtxEKZjzubH58p14mGuQMfPblSfJt69z212q08NN/6mUHxs4DQpJboQoGHF1NT2htYTusjvwr06A+RkLisNSDHCTwsaUgDCTTKSr2U9w6PFaTrkku1etgh3k+J3Nh+wnqmN510N8iFjVROm/cN3D5eaWdmJ47sbe0fkcmMckiNV+0qMVJfwyZuF3TpAVm9J0RKiniHejh2lxVj38aGcWmKsJvUqno3rwfvttPb4Q2sm3DrFiXCLGrGTHroZjDTAG321pB7DVb8WUQE+9u7uP0rYKv0ibZMLUN3ZF06tFwJFVMZryLUyvZUj4XtwCSOye64HNVOqs/m7YTLEQY8+9D4syLdQUn/CiZy6Vt27UAbuN40rOIkO7+fjpJF6ULHiDiatHCvEVprtII6bIIj0oQyM++lhpCQTk7TmD5DTb/oGKrrPPLUcGFZT
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9591.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199015)(7696005)(186003)(83380400001)(52536014)(2906002)(41300700001)(122000001)(55016003)(33656002)(86362001)(5660300002)(8936002)(38070700005)(316002)(6506007)(26005)(9686003)(38100700002)(53546011)(478600001)(54906003)(64756008)(6916009)(8676002)(66446008)(4326008)(66476007)(66556008)(71200400001)(66946007)(76116006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?KmWt9iNUzj6jE3hFJTjweUCzNEJMxkXw4jsiAZv/t/WCOEvwpVZSPodaQ4Qp?=
 =?us-ascii?Q?yb2aOv+YVGdyXH0qnzySAUmWux9JETCipwYoh2iaIJQNr4ectpaKFx4FaNQ3?=
 =?us-ascii?Q?5sjrC+/aLIs3JFlcN1ClYTpHpqOJ7X57qhJ+KmPTb8RW9xMInEpqN/Fc0KgY?=
 =?us-ascii?Q?7uZgU4KgyOTGFUasHe7Y4CTjwoNQcDF5VQXeWEVlUrNp17BBAZ1an6VTs1sP?=
 =?us-ascii?Q?Qwgxs+LiwXIiv7OyWgo3nGyuIRQOSyAcnNtf9hWRt8+pTDurCh1ja0bfqxrL?=
 =?us-ascii?Q?ARjLL2jAQxvPJuQnej8LBMmi58LWVewaXWAHpRap2+CoH/GnPmzGmZfvUElu?=
 =?us-ascii?Q?zUQqUMekDbqfWooZxolABlSQ/Nq4mWa5mpmO54XuDtu3Uzy7aPFRT2VW3wcy?=
 =?us-ascii?Q?o0m4vhOZcB17IM3GdcKuiFAlkWvACQsJI2dhCFxFcSexr9EBxxdjm898wha1?=
 =?us-ascii?Q?H7gNuP4pdCfDOhIILZSJxHj3gThHwXzp3BbjL2RB/1kgcEKOSlPCMImInfZ/?=
 =?us-ascii?Q?BpIzSQC5FG0dhZ2g4ZxTYqOxzUyk5VTUFZzBojRgthnEEunfHyNaBT4xqHVz?=
 =?us-ascii?Q?lQ1KvxI0d9vJg1LzHGp68d5vR1g9mJ2EEeeQvQg8acyNYgX5advCJsGifTtF?=
 =?us-ascii?Q?p+Mo9sY67GbIYg5L9z7dMJ/I/16+r7vegDAYt5eZnEhqgVqhDanKjGp7n8IH?=
 =?us-ascii?Q?/VskQfKoHcT6+N4aQmBeMSNSdjTAZWO2XLut8ihQ6xdal/03LCxUeHAVemoV?=
 =?us-ascii?Q?uHUw+NPTTWCgVN4dQ+gtUBhs8edspmWAE6KCBBEVIXAuZ/lHbM6GHa2gAZOn?=
 =?us-ascii?Q?mDnJb0cD+fNoJSHwMCkKTK9Cy6QuEqJ3qNGXEI5vn+6sLRVxzKhyuEztCSRh?=
 =?us-ascii?Q?Hfv4vDXL4q2s5wy83cGPm/cMi1W4a7qh8RNjE1gv7COJSZomM7AZDYH4A4Qi?=
 =?us-ascii?Q?O7cv6fDYRub1t2WpYK6wabdQ4simU47BS7WW2HGxhy6sGHkLgidclDw5wfx4?=
 =?us-ascii?Q?2czbOlKz3PPGDgQc1K0cQPT4OJJFeXDk2SU9lJto9C6zyGypu1e/Q1e1vtrj?=
 =?us-ascii?Q?8gRzx/xOiw6i2Yj0GOg7jYUlkLrZDirCmLfwJgfxByza0U0exNEeTyfe1JOJ?=
 =?us-ascii?Q?NoutKM2E+PcX7LA14F20LW+m3BgVyS0oihQjLOhFOvw9x97iDypkEJVA+vOJ?=
 =?us-ascii?Q?TGfUd6Ibpms0QjCIIqMJMMZPkQ/cbZ2QUrLUeetUdkBt2MIH6qTnSs4l7PLc?=
 =?us-ascii?Q?KD92gvyC5QqXThIn96LISg1Jt/C6igbsJzhHFh7lWZQOocKRZo4i8tl582if?=
 =?us-ascii?Q?Kd5p14DLCKKwdKjSs/L6XSXHTFXzDZ0dtnRWbiisvV8Xx0HOP/Av39eg2bAS?=
 =?us-ascii?Q?7PxSkubERv2b4iTw5iv4SypiYMKKqwWfG+QtPlU8kaXjbGbh24vYZo5aCa6y?=
 =?us-ascii?Q?N6JyLH34WgW3eefDQQc8ximvFN0GM862cSqzwofo+JcuJm39GbaohIXudpfE?=
 =?us-ascii?Q?Y6azL02afE+3YKkBsvuRaBE03Rkbgy9Jpr9fkltkXwdy90aGX6e3gUV7TuVx?=
 =?us-ascii?Q?uLZ2ISAOPLysbjOoXp4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9591.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bb9b122-6943-49e6-faa8-08dad8cc3460
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2022 03:27:58.9576
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MQUDMMriWSToofca+eoOwXbkVZ5+Xmm6EeY9LnF+2a1fX+xPa32EJqCxz0DQ7y0bFs671QYsQbZXxU6qIOFJuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8219
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

After double check for this issue, the logic seems wrong.
Please ignore this patch and sorry for inconvenience in advance.

Best Regard,
Xu Yang

> -----Original Message-----
> From: Xu Yang
> Sent: Wednesday, December 7, 2022 11:14 AM
> To: peter.chen@kernel.org
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx <=
linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>;
> Xu Yang <xu.yang_2@nxp.com>
> Subject: [PATCH] usb: chipidea: otg: handle vbus change for udc iff it's =
in device mode
>=20
> When in device mode at first (BSVIE is set),  OTGSC will assert both
> BSVIS and IDIS bit if changed to host mode. ID event will be handled
> in the first interrupt. Depends on whether BSVIE is cleared when call
> ci_role_stop() for udc, the 2rd interrupt may be asserted after a
> specific interrupt period (BSVIE and BSVIS is still 1). If it is, the
> driver will continue to handle VBUS change for udc. We should avoid
> this manner since the controller is not in device mode and the worser
> is gadget related code may be executed if a gadget driver is attached.
>=20
> Fixes: a107f8c505cd ("usb: chipidea: add vbus interrupt handler")
> cc: <stable@vger.kernel.org>
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> ---
>  drivers/usb/chipidea/otg.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/usb/chipidea/otg.c b/drivers/usb/chipidea/otg.c
> index f5490f2a5b6b..31c38a3ab990 100644
> --- a/drivers/usb/chipidea/otg.c
> +++ b/drivers/usb/chipidea/otg.c
> @@ -133,6 +133,9 @@ void ci_handle_vbus_change(struct ci_hdrc *ci)
>  	if (!ci->is_otg)
>  		return;
>=20
> +	if (ci_otg_role(ci) !=3D CI_ROLE_GADGET)
> +		return;
> +
>  	if (hw_read_otgsc(ci, OTGSC_BSV) && !ci->vbus_active)
>  		usb_gadget_vbus_connect(&ci->gadget);
>  	else if (!hw_read_otgsc(ci, OTGSC_BSV) && ci->vbus_active)
> --
> 2.34.1

