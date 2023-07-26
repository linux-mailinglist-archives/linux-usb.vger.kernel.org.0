Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B829762A9A
	for <lists+linux-usb@lfdr.de>; Wed, 26 Jul 2023 07:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjGZFKY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Jul 2023 01:10:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjGZFKX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Jul 2023 01:10:23 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2074.outbound.protection.outlook.com [40.107.249.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B470C13E
        for <linux-usb@vger.kernel.org>; Tue, 25 Jul 2023 22:10:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrNHvRY8edkT8+FrurVfCDhKxdQIrbcqdv9aV/YcrIo6mBcZWPXviMVe5klIwqvn9g1p84Nj6yA1fJzZ2i2vqYuu+uDitGsgu+RWIhW8ZoB3/l0CxbAUvAXiNzuq8KJOEiv5yDlD92HQzp/82wyeUz/YgfqfUEHPICKjGtXwltlgF6o6Iae9cs2mtaHLBDcVCLw2Ign58XgpuY3ucxsBAgGSblZab+oGw2ZqllEY6Gho85F+SouEiJuUfgwwR7JOV3P77TuoXB2XO/7hsg5CWS+vzTj9gAT3IVaIxRIK8nE7kpPEzW0VVCBbYVwHn6TNgre/x0b28WHx38fJO7tC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN3nKPxlRIlu2T0qFOAepvVFslQGWyySgjnSkb4iYf8=;
 b=ltVJ9JstjjLbHERjZae1PQVukDfi/SYtynUd7FoHeGhWzXC7tN+zr9E5acMAUihDyAsBDk8W2cpqTrjg2+2MNCBsv4Q7GzDX5VM24wnkN/5dH0Ui3tVhaCmrXJEB1EvUtjOD14yVjhZ2dU6xzuobRcpE4c+FNK+96byulXkQbxPFIE3rF9PhNpI2SO/ZraSrtz5lwwhzUTshRJ8CNSaEGNBd+zNNih0m8GmVVl9q6+Cr53MEYz9cXOxlL+BMFAw4wI55SWLovSmhJeHhC/JC/Mfa0Nm+1DO/zmXNXDHKVVi7+khkB6r+5C161Dfo/Nd3cSVq/PJ5jupkteoQx29s0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN3nKPxlRIlu2T0qFOAepvVFslQGWyySgjnSkb4iYf8=;
 b=ClyEaG1jWDBoboN2kNcWZXQV8afGD58BFu4b7GAWrH3MZhXul6BJpx6njLdDk+DRbL1IlP1UCRqnDUmvaS4GDeVqDvM+ndUU3M20WLqBJXohowFa2L2iStZ3tlrLt7+NRBlLowOFIk/IjpJBWGUbpZ5vvtZIT3NBFdP0Sc0oFSI=
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com (2603:10a6:5:39::26) by
 AS8PR04MB7671.eurprd04.prod.outlook.com (2603:10a6:20b:299::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6631.29; Wed, 26 Jul 2023 05:10:19 +0000
Received: from DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab]) by DB7PR04MB4505.eurprd04.prod.outlook.com
 ([fe80::473a:28:1d98:10ab%5]) with mapi id 15.20.6631.026; Wed, 26 Jul 2023
 05:10:18 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
CC:     "heghedus.razvan@gmail.com" <heghedus.razvan@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: RE: [EXT] Re: [PATCH] usb: misc: ehset: fix wrong if condition
Thread-Topic: [EXT] Re: [PATCH] usb: misc: ehset: fix wrong if condition
Thread-Index: AQHZryXt7ONMO208O0uU14qd1PDJ3q/LaaWggAAixwCAAA9RgA==
Date:   Wed, 26 Jul 2023 05:10:18 +0000
Message-ID: <DB7PR04MB4505C63E457F22567D6783208C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
References: <20230705095231.457860-1-xu.yang_2@nxp.com>
 <DB7PR04MB45050DD873B70F1A0F41D0CB8C00A@DB7PR04MB4505.eurprd04.prod.outlook.com>
 <2023072629-referable-enchilada-16aa@gregkh>
In-Reply-To: <2023072629-referable-enchilada-16aa@gregkh>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB7PR04MB4505:EE_|AS8PR04MB7671:EE_
x-ms-office365-filtering-correlation-id: 00ecbc67-9713-46a1-5166-08db8d969b02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t+LKfRDQjHTqCuzmAJ59Gy0GT+X0uNg0q95alPRuCCqhxqc6Mm53Uo1SFcw2vjz/cJExo0ZJc3t24T/dtAjE47ikaRcrHMJx5f84coTxEe0GEwlAOkjzKiyifEg5aM2Q/Ps7LWLfZ4cVt8owpaPee4Zj4p/xsAzwnSwOVbpc2cqDFr1frVtdp3BJFemW/ag3AUbMXKFhvHpQzb//ytd/5GYUgdLXHK/2wSJYPJ2c5kvMfntbHdfaRknomN79T2+Mb/eYUQv0XGFsWx3/3Jcr4GP2G63ecozDMmR5j9l4CLARv1wLLVV9omOfdNr45wCKacZp5KFK6QtoskkyCQ3yf0FFhZ8Vt8Di2GJjL9Il/Kym9shLdKWH98LXhFzFqFMyXJ2OVPyf/gC0zp0BQlPfjAsfAmg4j0Uy8ZTusDsNWm+TFxSYvUfi86oXM2MhLd8XcW4zd0jw9RtnWkgOV9LXGHRZeEb/h1HlaaxXjZxeG/fdSn526CUPFI/yOIpWZHC6r43ZQfs+5MDalpo8FP/az6Zdk/W/W4QA3DuYn1o0EZJiEwHDMiN0tzUpt9kQVp5ms81+ulsyHa9Rr5dvVC8UI77sMDzoHZFFHiFaXBbCKMLdQUt/kjZGJqFWZwcwbE2z
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4505.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(376002)(346002)(366004)(39860400002)(451199021)(9686003)(54906003)(7696005)(478600001)(71200400001)(66446008)(26005)(186003)(6506007)(2906002)(66476007)(66556008)(4326008)(66946007)(316002)(6916009)(76116006)(8936002)(41300700001)(8676002)(5660300002)(52536014)(64756008)(122000001)(38100700002)(33656002)(86362001)(55016003)(38070700005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ngwuNCULJiasckAsO7lbDaJ3OfsfOZFCtRoW9BV6WIs6aKzcjraZWAOarzJg?=
 =?us-ascii?Q?6ni1dtvggpImUOJrsgsi0xSWTCTouilaw8AQenSDI47GqvI7EDQ7mD2v49hu?=
 =?us-ascii?Q?1dghgB6YCF8T3LlQQuWlQycpctAh8e0uVjX0Huww21wRzZ2zpJMoyBGkGjkK?=
 =?us-ascii?Q?wX92/kxZ6mpWK1VQWml82SSKH3KxG6PgMI8Q4XTz1QiUSpbLUDDeNpHIlUUr?=
 =?us-ascii?Q?jILD2/DQu80AYqKFCzxVng99u6tpbNdPa0PFDOVfP/9dG2Onu/cKGEfmwSHX?=
 =?us-ascii?Q?qZnruCyisaa0nOAOdwj7+0UOGzlKglO0M8VZIWO64xyCiD6zhDXMUZO4WLuE?=
 =?us-ascii?Q?dMQjze/XjNM3MBntaK++ptG1N7Krf1Qc4YqKz8a/W5PyuAA8hqiNbIoAX4Gc?=
 =?us-ascii?Q?mGPGtoRy0PQCQV+Yng2Heev9zZLPla64ZLWWVWjUXyzoRRNhl8hgPM4lVJrk?=
 =?us-ascii?Q?OZRv2bhityVDUK6GKrzuujr4tdYTDMN/BTLDFQ3n02rcGSFp3U+EVFlez3uX?=
 =?us-ascii?Q?ys4QHcPkJd9TcVb+vfAFATuliKN9lwLZBLuqTqVPQw6PunYq4Rq7JYeqxvKo?=
 =?us-ascii?Q?u26WGcAJ0trwIdBbdhpL6Ga+Xncc4mr8L7NU/aIHljSqQ5QIg81KvnGoklNS?=
 =?us-ascii?Q?8HP2RxTfWjOKvE7gp2/5m4Z+V1n5+N3Mobfe4XDDD46MucwMoCjakGv0RAjr?=
 =?us-ascii?Q?aPe0KcBngJ5EejIOl/OuuSPdiVUvggHzOKECf6YJnXNtP0wkJLAaRpfLZN7h?=
 =?us-ascii?Q?h5xSLIYCIv6HBzOPSYN9jsWp7Poz6Ud1njJUGDecarZcEACkn4+ENSr755wS?=
 =?us-ascii?Q?hsXSSdpUj6ypfs3gQ7wWTdCaka0M16K4z32ZI7s2/bsqMRiWzDFz97jK1pgH?=
 =?us-ascii?Q?GaTOsGyeLMhpUPBcGYEZntKY/7wUhz/YATM/9RC6210EpBu1w3AcaZsC4cAx?=
 =?us-ascii?Q?A8EADXYhTvV1eKl2moJqCo5QzALI3BYUQDJ5g5A/yVeKVGtiEoVnEyPFZEaK?=
 =?us-ascii?Q?BDqpoFx33z/QRUA0uX30qlEUNxPt6TMg7CQpbYEYubWPHECZzV/dSrRf0l7G?=
 =?us-ascii?Q?cy0w+CNYmoUYWUPrRTEl0Q6eSvruVH8faK0I6DPGe5LB1ddpEiPFPHe7jzae?=
 =?us-ascii?Q?QEaWgbgh4gDVbCOfUvhB0LKL+EwIkBrES/ZRgmsBKHZzRQfsQ6OaD9o9m9G9?=
 =?us-ascii?Q?4jHkXR0tIYo/SG14RgBWAd0S10p3MgoumOCSz6ZSfIcMwL4Pvxul3mbaFGDJ?=
 =?us-ascii?Q?fLFRCD0KBbQE2BGhIEXjNj7U32smnnS6ulbrO7PAUeSNQ1vhYN3tg52dJOl/?=
 =?us-ascii?Q?UVieSsFQfDnqbbICQRs61MF5cbaLe+4rvMMBscyGuj1JCP4pSeSENilQysP+?=
 =?us-ascii?Q?K0HNFBR/GyipJzXNKyKEf1vTjlPEQvSVOxmwq8vh0ctzZs9rZujcJy2Y7mMb?=
 =?us-ascii?Q?6LQCEYt2LQP0AZ9bH+gJoU+7zgyzsQBhKUXylH8/+mCrQjXHTrwHKUDSWNTO?=
 =?us-ascii?Q?C9Zstmc3TRKAR29Rq1/mLeadjgF3+p47khurRszTYnIluTNZxZOPfB13vH4b?=
 =?us-ascii?Q?btEoKCoGdBR/a2tpmB8=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4505.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ecbc67-9713-46a1-5166-08db8d969b02
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 05:10:18.7799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: htSey1XyBsNTQaPSUuL+kB172NdTNfSYLAwC3NlUzeyjqxltmJxwLejY4c2wQGi9vxGsQJ4kahkphtCRE0e0Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7671
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> On Wed, Jul 26, 2023 at 01:54:15AM +0000, Xu Yang wrote:
> > > -----Original Message-----
> > >
> > > A negative number from ret means the host controller had failed to se=
nd
> > > usb message and 0 means succeed. Therefore, the if logic is wrong her=
e
> > > and this patch will fix it.
> > >
> > > Fixes: f2b42379c576 ("usb: misc: ehset: Rework test mode entry")
> > > cc: <stable@vger.kernel.org>
> > > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > > ---
> > >  drivers/usb/misc/ehset.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/usb/misc/ehset.c b/drivers/usb/misc/ehset.c
> > > index 986d6589f053..36b6e9fa7ffb 100644
> > > --- a/drivers/usb/misc/ehset.c
> > > +++ b/drivers/usb/misc/ehset.c
> > > @@ -77,7 +77,7 @@ static int ehset_probe(struct usb_interface *intf,
> > >     switch (test_pid) {
> > >     case TEST_SE0_NAK_PID:
> > >             ret =3D ehset_prepare_port_for_testing(hub_udev, portnum)=
;
> > > -           if (!ret)
> > > +           if (ret < 0)
> > >                     break;
> > >             ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEA=
TURE,
> > >                                        USB_RT_PORT, USB_PORT_FEAT_TES=
T,
> > > @@ -86,7 +86,7 @@ static int ehset_probe(struct usb_interface *intf,
> > >             break;
> > >     case TEST_J_PID:
> > >             ret =3D ehset_prepare_port_for_testing(hub_udev, portnum)=
;
> > > -           if (!ret)
> > > +           if (ret < 0)
> > >                     break;
> > >             ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEA=
TURE,
> > >                                        USB_RT_PORT, USB_PORT_FEAT_TES=
T,
> > > @@ -95,7 +95,7 @@ static int ehset_probe(struct usb_interface *intf,
> > >             break;
> > >     case TEST_K_PID:
> > >             ret =3D ehset_prepare_port_for_testing(hub_udev, portnum)=
;
> > > -           if (!ret)
> > > +           if (ret < 0)
> > >                     break;
> > >             ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEA=
TURE,
> > >                                        USB_RT_PORT, USB_PORT_FEAT_TES=
T,
> > > @@ -104,7 +104,7 @@ static int ehset_probe(struct usb_interface *intf=
,
> > >             break;
> > >     case TEST_PACKET_PID:
> > >             ret =3D ehset_prepare_port_for_testing(hub_udev, portnum)=
;
> > > -           if (!ret)
> > > +           if (ret < 0)
> > >                     break;
> > >             ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_FEA=
TURE,
> > >                                        USB_RT_PORT, USB_PORT_FEAT_TES=
T,
> > > --
> > > 2.34.1
> >
> > A gentle ping.
>=20
> Have you teted this?  It feels odd that the code could be that broken,
> how did it ever work in the first place?

Yes, I tested this patch and it works. If without this patch , the driver w=
ill skip
sending USB_PORT_FEAT_TEST packet even though USB_PORT_FEAT_SUSPEND
packet is successful.=20

You can also check the original handling of TEST_HS_HOST_PORT_SUSPEND_RESUM=
E:

114         case TEST_HS_HOST_PORT_SUSPEND_RESUME:
115                 /* Test: wait for 15secs -> suspend -> 15secs delay -> =
resume */
116                 msleep(15 * 1000);
117                 ret =3D usb_control_msg_send(hub_udev, 0, USB_REQ_SET_F=
EATURE,
118                                            USB_RT_PORT, USB_PORT_FEAT_S=
USPEND,
119                                            portnum, NULL, 0, 1000, GFP_=
KERNEL);
120                 if (ret < 0)
121                         break;

This patch will align to this if condition. I also wonder why no one report=
 this issue.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
