Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8C759AE9B
	for <lists+linux-usb@lfdr.de>; Sat, 20 Aug 2022 16:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345944AbiHTOFm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 20 Aug 2022 10:05:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344493AbiHTOFl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 20 Aug 2022 10:05:41 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2058.outbound.protection.outlook.com [40.107.20.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEB984DB7B
        for <linux-usb@vger.kernel.org>; Sat, 20 Aug 2022 07:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWrrobWunJNIEouR+Dz+t8NPYikixoIKTK70nWVXHdS54dR/x88uGqwD/qGqPL+ZnZDolIysv1gW92+TpyOAsuhX+jTLemSrX5pNeHXq96urLk+/ymTzaFHA02dIo38IedxrnGabci5bI8l1d3yIO/JDxu21CcVdE6anLck10GtZ2ahmosvQqz7HqJHPh0iHTo1BUO0Sd0sk617Nn+b3H9akZmOKd/QPuUCtb8i58WTPB6ibs/SpIJGyU6RgNz7SrJMPHlq7VLTbrZC/IHspJgRnyqv0rJ+ekoIM+DaFozMX+Trzvt5VtsTuR3vp909TgY5mVeNQzwqddAFTR5u87Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/AZcY5HAIBr2dXfwT87/tHbBHaLMnKe/0tVNxmH3sw=;
 b=XkAtmCVT8o6aWtzQrF9qDNckFHY5R3EorAPJ8sl13BjjxCnjvAJVv9TJT+3Z2i6wWDXa61IHHeGT67/aP2/bgQQE96x5GEk6KRt46okaPu7YyedksaFo1/KQ+WxgxIvd0PbmZ/EoHR6A5VzQnf7V0BfLTYLSOta66AxHAqQevNDNvq7oG3HEyybmDmhA74lNdYQCHIz957wsKJnN9VAFkB4W4IQMHahD1z6/pHS7rtGc9fsq/1GgV3kXC0mXUFUDtfeLpYRLrC0Dwr8dr+2nQh3zo34NmYGHthoeEueVkauBcuTQNdkqSxzHhqYBb1hTos0D8kvy1s45CT+Dailxpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/AZcY5HAIBr2dXfwT87/tHbBHaLMnKe/0tVNxmH3sw=;
 b=SQQbWkrGfauzUK/XekmNI3i7s35diz53rBtwUD9uMyE09MaZ1reyNpUp0LJC6up5XaAe82P6gwMo5IYtuFrfwGkBUdFeHNKYOJ2eC211x1VeNPJy5bLbrReWTz3VeHcdKquEQzm50DUm4+biSDvzvusUUXbqpKxgqAGHT59xN2Y=
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com (2603:10a6:102:261::21)
 by AM0PR0402MB3380.eurprd04.prod.outlook.com (2603:10a6:208:19::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Sat, 20 Aug
 2022 14:05:37 +0000
Received: from PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15]) by PA4PR04MB9640.eurprd04.prod.outlook.com
 ([fe80::1c65:f6a7:bc4:eb15%6]) with mapi id 15.20.5546.016; Sat, 20 Aug 2022
 14:05:37 +0000
From:   Jun Li <jun.li@nxp.com>
To:     Peter Chen <peter.chen@kernel.org>, Xu Yang <xu.yang_2@nxp.com>
CC:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [PATCH] usb: chipidea: core: complement wakeup support for usb
 role switch
Thread-Topic: [PATCH] usb: chipidea: core: complement wakeup support for usb
 role switch
Thread-Index: AQHYrjrfqxRzi728UEKdqfd+Kmuh1621S1IAgAKSpzA=
Date:   Sat, 20 Aug 2022 14:05:37 +0000
Message-ID: <PA4PR04MB96407D9F3E05D51BC62A70C2896F9@PA4PR04MB9640.eurprd04.prod.outlook.com>
References: <20220812105719.143556-1-xu.yang_2@nxp.com>
 <20220818224310.GA237083@Peter>
In-Reply-To: <20220818224310.GA237083@Peter>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c0042f63-460e-49af-dd00-08da82b50ea7
x-ms-traffictypediagnostic: AM0PR0402MB3380:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Alm8Xwed3HmZ09MeAg6YgZB19qt1C4hTEWE8A7/E7kdg7NPQlwYTi+uIAE0eMfe8drjDq1Cgv1AQ1oKvay+08Th34TVa4FfzBCaWLhZ5eUeEKgbyfR+s/NJ6gv9+7iKNjyVQpzGJfY3sN8Ra9SJAfQHalMdISp8VA2LcGa7ZxVCtlnZDr9AXZIw5rKeiRdhYQ9MqJxjx3RaAJ3p0SSAvMOLfsrqzklWzASqDtcyA2Q08qD50e/61EvX4V+NGTR3X4MBaV74kbFdgBegZZ6ou35UZk1irubx0WoJfVBkCRgqpcQNj4RXE0PeuS/T4SNCJ5sAhavFUCv3LhQ7+G3aXqX9NaDXIFW6royfmOmUjak8dV2H2w7QKasBwNSxp2SLaZUSXR1CN/B+nOZZxLsZYaoed2hazz10ffTyNgd18lV5XV2iOCPRzmveoX2EdW1Qvqhhp99viKlFnwSO5Rn59p6mKDuquDxLGKCJFmArbA1FUkSPScNm5XfxMCYeqrEBbBMqOsWRwx1AT8N2tFgdPJhd28VT6H8Shyix+02zJ2lMFagL1eXg9teSJPDLFWoie0WJshlFeV2NPY+wg+Erhi7ZAp8UnUDqI+lt/+nQstLLPWmAeto9mCOZQVRPjpeendDaNYq/za94TF8w6m/vtXR5nMJvPZVYLBh0ME4HKLk/GTQC7TZujGPZ36qlFnxCtf/UrsEafnr2d4nbiT7WRnvwE/kZ2+cj5RDceKTeNs56zRrDLNOODocUNOkGRMdYFmMP6vtY8oX1oANbx0ntwgg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9640.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(396003)(39860400002)(346002)(376002)(136003)(8676002)(71200400001)(52536014)(5660300002)(26005)(53546011)(44832011)(41300700001)(9686003)(2906002)(54906003)(55016003)(110136005)(478600001)(6636002)(7696005)(8936002)(6506007)(186003)(38070700005)(86362001)(76116006)(66946007)(66476007)(316002)(38100700002)(66556008)(4326008)(122000001)(66446008)(64756008)(83380400001)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?d04yutIHzTxQzNCvBlJDRaBOW5xIUlmZWicTfznz9b8qM2dQRUP1O8UA2etq?=
 =?us-ascii?Q?REIqAAT4kJQWwBSTpQ+Yq9KIqwo/PhCdWS8BFhyd7UFv7GnQOtrYdaBO+3tD?=
 =?us-ascii?Q?vb4taFO4ssznvXLJaVk294a0gzwFSwBLLgkmkn4HNkgj+p7Gl6EVPQZnude6?=
 =?us-ascii?Q?5w1wv4cy5SfJpYOhwbbcV45OycmfQpbHE6Ir+c4W58hLn9M6cpT5y8eSKU6B?=
 =?us-ascii?Q?pc1hQmHFQ+tlubLHF5ED6f+SCRVHIweNXZdYQ5Y1aDAwgNxXhQkrFeF4NqOc?=
 =?us-ascii?Q?1P0fdvzg8x5fn5Akxb+1pYSh+wZm264YBIqqLucF4MPaCShydtk15oGzZnPE?=
 =?us-ascii?Q?B3YzDT79LPtjaGclGHW7xuzFNsZRJvNNgF0m57yxS/G3vTn27GtgZX6f2WHq?=
 =?us-ascii?Q?WRX8XvzQwiEsNm8+tm5tkAAbKsGr13esE/Ep2zphDSJZdpJi0imUgIjMaVow?=
 =?us-ascii?Q?9heg8Kwz1OvtIo7a5EuY81Nxuzsc0zvsIb0ZbV8+6HwF6lOPpXWZEvLlIuj1?=
 =?us-ascii?Q?k8O+OXufRur3XeFGi4p9ybDKN3iWMAUwfK6YlswboSB0guvYov4rGnzkIhUe?=
 =?us-ascii?Q?Rug+dxmPTCQO3HOEL4kZKV/zJdPACEq0C+G81naUjpnoQ921du7SXoxg/PPN?=
 =?us-ascii?Q?g0jzFDCrVRBVr3BILgtpPiY0cM6fkMyOdxgDPwIfttWilDjfvDRdbHpVgMQj?=
 =?us-ascii?Q?udQ5Y+apPGSnR90aHqgc2zL9t8U9Yx2TGSzih1NNCjoTBGad1tEEI6Vs+v7y?=
 =?us-ascii?Q?0TXO83q3/xEPfwLP1KimoUj8aZMTfCTCL7cudISpD8TzCkRKH31hdg1wTF1c?=
 =?us-ascii?Q?AnNsZ9sTfaSatZXws5uxbOu3VplavHwG+NxwAs7ymfhONwC+LacZFnuj4P/e?=
 =?us-ascii?Q?dTZ/tfYIArMveDC+wktav9GjVJ+/2R3wqZ6j9FktlgumTBw/INpDJhwmXk9u?=
 =?us-ascii?Q?FYZDy7Vc878nJ/BJbrT+TZIxI8WnxJW8/Q8BVzdSf4JEOysz8yodrwSfjSAW?=
 =?us-ascii?Q?4UM2YmapVB2RZtkbajTn/Ip1Ja62kAH4YRErbVhjUZjoKFs68jC/iFrh+KUi?=
 =?us-ascii?Q?oFdEomwByk9va6zktKwdf1VX+cMecRP+MfrfLzJVIuqm10hCKCq4+SoV4Hki?=
 =?us-ascii?Q?vqjyjgXhayVbrUKdS6UTz6GbwxMmrXDlGigAYHTsHpZNrGLsg9L0g76SZyR8?=
 =?us-ascii?Q?guKhl/TYe1UILlP9X2zprjFf9ZrnWDOjTvaGeVjpK288wAyqWzVZ4JSeW3Ib?=
 =?us-ascii?Q?SQNiShB5veRnA0BL+HhUP+FfgfMpmT6hmF5/kALQ24wvAPEYu7mQ4JO3ctzh?=
 =?us-ascii?Q?8QFGAQeYMfNrOFQNwscfZHjxmY1msEXZ/CgJdg1HkRI75vCDOpeyoC2g9y7X?=
 =?us-ascii?Q?BLv4ZXjNTu3PbdNNdUHMSBJGZrwzEEou5+x+G04oKoDvNSestIQDfh+ouU4G?=
 =?us-ascii?Q?nsSHm0IkdndHrduGz7jIq/2ecadkvUVEJZ/YwzFXJmh4Aamh748U2F+o4FRo?=
 =?us-ascii?Q?brs9qfL3RO+9ps7i1lWw/hGeM+5kA16RhOLQQQsLrSxnQyNuFL9yQUJV4tOK?=
 =?us-ascii?Q?RzjmmFUkn3pSJLSZ5Nw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9640.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0042f63-460e-49af-dd00-08da82b50ea7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2022 14:05:37.2295
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p77AdyTZhRndpMti1qmrT+WdfR9Fmc5+ojVzPpV9NVVO+gGtisYxv732qBaiNVXE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3380
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

> -----Original Message-----
> From: Peter Chen <peter.chen@kernel.org>
> Sent: Friday, August 19, 2022 6:43 AM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: gregkh@linuxfoundation.org; linux-usb@vger.kernel.org; dl-linux-imx
> <linux-imx@nxp.com>; Jun Li <jun.li@nxp.com>
> Subject: Re: [PATCH] usb: chipidea: core: complement wakeup support for u=
sb
> role switch
>=20
> On 22-08-12 18:57:19, Xu Yang wrote:
> > In current design, ci_usb_role_switch_set() will call
> > pm_runtime_get_sync() firstly, then handle role switch events. But
> > pm_runtime_get_sync() may fail to resume controller sometimes. This
> > may happen when doing system suspend and enabled typec wakeup source as
> below:
> >   1. starting system suspend, controller is suspended by runtime pm bef=
ore.
> >   2. somehow controller get resumed by runtime pm.
> >   3. ci_suspend() is called. runtime_status =3D RPM_ACTIVE now.
> >   4. ci_usb_role_switch_set() is called due to role switch events.
> >   5. pm_runtime_get_sync() return 1.
> >
> > This is because pm.runtime_status is still RPM_ACTIVE after ci_suspend(=
).
> > Then the driver execute wakeup operations in ci_irq(). So there is a
> > need to call ci_irq() again like extcon do.
>=20
> You mean role switch happens after ci_lpm is 1, you need to execute ci_ir=
q
> twice? I have not run chipidea platform these years, could @Jun Li help r=
eview
> this patch first?

I do see role switch class cannot simply reuse the extcon solution in this =
case,
I had a talk with Xu and I think he will send out v2.

Thanks
Li Jun
>=20
> >
> > Fixes: 876d4e1e8298 ("usb: chipidea: core: add wakeup support for
> > extcon")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/core.c | 10 ++++++----
> >  1 file changed, 6 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
> > index 6330fa911792..886b68e45826 100644
> > --- a/drivers/usb/chipidea/core.c
> > +++ b/drivers/usb/chipidea/core.c
> > @@ -1305,12 +1305,14 @@ static void ci_extcon_wakeup_int(struct ci_hdrc
> *ci)
> >  	cable_id =3D &ci->platdata->id_extcon;
> >  	cable_vbus =3D &ci->platdata->vbus_extcon;
> >
> > -	if (!IS_ERR(cable_id->edev) && ci->is_otg &&
> > -		(otgsc & OTGSC_IDIE) && (otgsc & OTGSC_IDIS))
> > +	if ((!IS_ERR(cable_id->edev) || !IS_ERR(ci->role_switch))
> > +		&& ci->is_otg && (otgsc & OTGSC_IDIE)
> > +		&& (otgsc & OTGSC_IDIS))
> >  		ci_irq(ci);
> >
> > -	if (!IS_ERR(cable_vbus->edev) && ci->is_otg &&
> > -		(otgsc & OTGSC_BSVIE) && (otgsc & OTGSC_BSVIS))
> > +	if ((!IS_ERR(cable_vbus->edev) || !IS_ERR(ci->role_switch))
> > +		&& ci->is_otg && (otgsc & OTGSC_BSVIE)
> > +		&& (otgsc & OTGSC_BSVIS))
> >  		ci_irq(ci);
> >  }
>=20
> With your change, ci_irq needs to execute every time at role-switch case
> every time, please confirm it is expected
>=20
> --
>=20
> Thanks,
> Peter Chen

