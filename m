Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A64CE5F971D
	for <lists+linux-usb@lfdr.de>; Mon, 10 Oct 2022 04:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbiJJCyJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Oct 2022 22:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbiJJCyG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 9 Oct 2022 22:54:06 -0400
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80055.outbound.protection.outlook.com [40.107.8.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33DC4D264
        for <linux-usb@vger.kernel.org>; Sun,  9 Oct 2022 19:54:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T+QBvQXejdNEQ6S2vophnD4/qRPOvTR31jORqBsPLQFXIyJismDsBxwz+agRHNdSKLbmS1+oEuzRxPyGfUc2/Y8fQ9ybaUMA5yqj4BayU0x1kRBiv6EOB0dK49DVvbYdADRt5QcDTLOvyjRNxNA3j2fQqCW9biurD+Zu15ZfDQySR4B91s/MjBKLB3gr5kmmQ5Wo3skwBR8pipxgwC3p+THYHyChJneSmJ2aqr97STi83ZaeYWvYkQZrnVHQIyXexDR8KYqH0nXnkLvIee39FE++4LwhmALP6kRGgGW1i7G+etDdxw5/jioRVPdwHw11uVf3FS6zEjSkV4y9SsU09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOacrpHgFtIkuc+vyRE27yseWoioluQzOxHFT+ypNbs=;
 b=Z+m6ZkiXw/N7O1AfzhVhbL8lBZ0aZradyqoKwHk6o6rFs5ISATZ6puaBzexMU+e+dZ96v7LxMXmnyWozU5upC6IXTtaNqa0T4wHqsdj67gVeC1X0G1a2eJcbHEwaO8xTANKZYeVpzVnwZn+hAW8VqKPmz0ER4JrcEbp66zmm8gdm+oK9rbQ4EvkOGJ8BEmDCfNFnAmhytjkQyUHdhNZlcQOtJtV5ipZII1dTwPoDANQbCCPIJh6lIefDbWS9ekQfVcqLc3ciPYoq/E2afFdC5C4+79eS5N/mtWiSmOzcjxtkU0ZYbs3x7s9tSgLJcRa7zH2mf7BMQWx/gpA14U3ANQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOacrpHgFtIkuc+vyRE27yseWoioluQzOxHFT+ypNbs=;
 b=EgLEgWmwZww3FCjVqRV5yGQrR26O3uvA0paqWdSLk3R888f3nIGacsjr12IprttJjcuHcMnWgqBShPjPKUHEZR8IzfvfGbL9Ryib1fiG6PqlvfWmp97y23N24mcfOcljmEhkO/L+2SLqGAp7fh5PyifGL6UjW50TILLOjKe2dqE=
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com (2603:10a6:102:20f::23)
 by AM8PR04MB8018.eurprd04.prod.outlook.com (2603:10a6:20b:236::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15; Mon, 10 Oct
 2022 02:54:02 +0000
Received: from PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be]) by PAXPR04MB8784.eurprd04.prod.outlook.com
 ([fe80::e9a7:fdfd:e80e:c6be%5]) with mapi id 15.20.5676.038; Mon, 10 Oct 2022
 02:54:02 +0000
From:   Xu Yang <xu.yang_2@nxp.com>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "peter.chen@kernel.org" <peter.chen@kernel.org>,
        Jun Li <jun.li@nxp.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: RE: [EXT] Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume
 support for host controller
Thread-Topic: [EXT] Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume
 support for host controller
Thread-Index: AQHY27X/1Bs50tGxcUiXHI6aOJ/z6K4GZGcAgAB8KwA=
Date:   Mon, 10 Oct 2022 02:54:02 +0000
Message-ID: <PAXPR04MB8784E2AE0AEE9ADB152E46E88C209@PAXPR04MB8784.eurprd04.prod.outlook.com>
References: <20221009160813.776829-1-xu.yang_2@nxp.com>
 <20221009160813.776829-4-xu.yang_2@nxp.com> <Y0MUdHsGa+UfaO2u@kroah.com>
In-Reply-To: <Y0MUdHsGa+UfaO2u@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8784:EE_|AM8PR04MB8018:EE_
x-ms-office365-filtering-correlation-id: 400a70f7-3ed6-4207-84af-08daaa6ab032
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8GMdY0p5e56j6Ky3RCPBbUnKJkAD8xFWfHaMp/dYCmv25dcVrEAv7B79heVlGvR/PW+FrC7cwPg+pjoXDi3y+kMa9rZ7WAgz9BKFA0rlaUp6ax3FHQrj4llA5afwsLulPk/L2UMi+aucWVdvifZ1u0bjsgggZ1rrhECKA2ZudwlnsfPwWk+lzgUd+iSaU/U1Bk70o4O2d1Lj1ALCCshErVO6Bphq7Y6+Xm46xeofGo0ALn5YEBh8n9rxWhAG0OzTyPViQ9EmE0ZeTEImilu9EBJZskotf03NmvL1gRg1ovEo4k9200V5ayWDbPmvMWKwKeLRsbX8Camgo/WaNq8HbPre+KNs6BiazAU8cVCyKUrZEAiNwPyDQjdMbNPR9t8CqN/dxbQwbMxBl2jO7OoWjdYA5sM6DMMKnTbpsqNIkk3WumHri7ck374vL4XunZJovExrTPXDzbO+V12PPwS+fS6f5AG0910dlv+luEQW+gFtJkzZBzIWiL7YcexsmcA/fUT1OnrdBJd3jQuOc1kqqMuoaDTXIT9a3Yjc6SPAKvmHCRx0zzVJppnkoRwl6m+Zli3tLtK6nVQ3utXfGb5+ZBtI0nOatUkjQF6GgLis2L12vctOAX0d7C1kEv7ENMFv3Z7ill4Pe1kKDBVehfOMwAB23Obb5hBfG63G5re39tQH48hcdtxd7K1Y8LOCpp/DxMEc6+yemaod55ld6BHkrrdBlXP3+Udmlzk9Tkad1yyo+nqj11WvT+IBR1R6AO87xPGoaWvKR2vcajG7qtC5Jw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8784.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(66556008)(7696005)(6506007)(53546011)(9686003)(26005)(83380400001)(186003)(2906002)(52536014)(5660300002)(15650500001)(41300700001)(71200400001)(54906003)(478600001)(316002)(8936002)(6916009)(4326008)(64756008)(8676002)(66446008)(66476007)(66946007)(76116006)(55016003)(122000001)(38100700002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hBYckuLQ4zq+xGw2s83s4GE0azL12RxpEl0k7m3GX6ofk/JjL5K/EVRVvoP7?=
 =?us-ascii?Q?RGsAhHqvvdEXlmK8ntnZnIoZT/AENUsev3YEvv469f+dEgxNTSE1GHLzpJdk?=
 =?us-ascii?Q?DZdrGnezAXRRTRZ5wHA+mSzktcNTl7JylbAiwyUxW9cAEvZuT4nw2q939niv?=
 =?us-ascii?Q?wWmgYCA3U9wqnRYCPgKX4kVzFQNN9m3vKFFjL50Qs05ud7rb4vwaIVxk8iJN?=
 =?us-ascii?Q?DVek0NkkMeWypJfx9bBnOC0BJsq9rQDOA95fQn2Kn2aXLO95f75WIUgGHKPs?=
 =?us-ascii?Q?Cw3tZkTRWhNmIs+R7nU84IZahGxHqVWM8ufZDmlPP1QOtJbkRJ5Dfuk3vibj?=
 =?us-ascii?Q?4IJUmrko/2gVLa6VEjqstJvPAzA89TOZcMBJjEwSFRtQrnvX9+3FR8iQfpom?=
 =?us-ascii?Q?9ahOqEo7A3FRMeGQ2HmKRJgEaL03yrcqkNpRfi4M2470Xs6ovZhAhae1+3Zx?=
 =?us-ascii?Q?e80Z4/05drL1LfgrgiOkOJaSZuOJqt79aZAjNlM0Aw5MrAPOezNGp2UB+HQD?=
 =?us-ascii?Q?kAFNlkSgdGs3hQGtXvJOGxxCl+gzLjfmrwD9tjK5KLS1On7Q792i3CA9Wqi+?=
 =?us-ascii?Q?8+MbB+ezY4UsiG1bBogfEXuA/c98GNs1V1Ew3CRggyOJSqZ8yW8utby2Qw3b?=
 =?us-ascii?Q?W1Db5hIVfdUqpBNTVo/MW6/2Eg9lnB5M/tDx9hsdw2TJ9CG5uALqN1IKDGa3?=
 =?us-ascii?Q?wP9pgq+dYpO5L2Dqo9gM68gb7pYI8lC4rHvHWeTd/nIDmU5T8Zwbmo550n6e?=
 =?us-ascii?Q?e8QShf5Ac8PKvB7oVZPm8NeLTgWFYBSUNkAXMwJ2PRwHNpdOJpAih2dcrJng?=
 =?us-ascii?Q?lAmvFDMIwqv16CFdCwnoFNacd2OkbhYv/sn9OxOS9TKuhpE8tmIWDoB5rVQL?=
 =?us-ascii?Q?oDTTi5OK8l1sbNaBmVwdkZyBmi7IvZXinCx5HS191n9o4hkRIM7FL+8zqptk?=
 =?us-ascii?Q?zLu0ssENB9gYKxt8xRr6yxpl4InuIFaSipvjGIQlwodKECiS3Cqc9HSiciCH?=
 =?us-ascii?Q?PQfaPazYnpaIMIuTRFhPxvEbVAcYgorii8MN4mI1zzz64NoI+hkwLPyaS8AP?=
 =?us-ascii?Q?YfKZ1InH+9w3Kr/qI1EZLlqb3fqAxwnEjNg/AmNR7/AjIGAFU/eHxSkM6aLk?=
 =?us-ascii?Q?+nT7m22SK0DqRQ2a1skvhZ/vXcApH7YMM58ZLSqsT8SfvddDY2eWdLZlydSN?=
 =?us-ascii?Q?3dLRMMlstu+vyMlv7GNwkvoaSHah2nsyUOgbXITRrZBgDUJHHfpcXuaQbrBO?=
 =?us-ascii?Q?KGuAZ9n68ug6r/QGSxUx0sLobUOvIxo/8F6A4zCjmsZAbR3ODbRVZTVRa74F?=
 =?us-ascii?Q?RUdD1yYN7pk3u8uA4ItCj4gvnLfbnKAKxVf0czanYTHA4td5knRdPpXXlmZV?=
 =?us-ascii?Q?sowX+le1keFzJrOvTLVb90oa8ynYwSVlQidnLBB63d9w7aT4EBkvVDyQAdqa?=
 =?us-ascii?Q?TIM/6RtquFFNHeBLnoCrFj5Wr54AhJfYvrkfVh392G3Ae13w+liIB+tM70JS?=
 =?us-ascii?Q?g2ohUZjuiEFjuOwZvZHv9S54tOEjwmunP/Mdfz2VovROsjXMmEWhB0ueuBfU?=
 =?us-ascii?Q?2chrxFDLUUa/0fRh+qU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8784.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 400a70f7-3ed6-4207-84af-08daaa6ab032
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2022 02:54:02.5546
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OLPq7oRh+nwsTgy3i4ap/9xhjcjRaZapKh/lLy/ey15zkrAFVfG3G0XehuEZm8y7X4jkPhQ6ZwKISDFfnwu4nQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8018
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Monday, October 10, 2022 2:36 AM
> To: Xu Yang <xu.yang_2@nxp.com>
> Cc: peter.chen@kernel.org; Jun Li <jun.li@nxp.com>; linux-usb@vger.kernel=
.org; dl-linux-imx <linux-imx@nxp.com>
> Subject: [EXT] Re: [PATCH 3/8] usb: chipidea: host: add suspend/resume su=
pport for host controller
>=20
> Caution: EXT Email
>=20
> On Mon, Oct 10, 2022 at 12:08:08AM +0800, Xu Yang wrote:
> > The controller's power may be powered off during system suspend. This
> > will add suspend/resume support when the controller suffers power lost.
> >
> > Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> > ---
> >  drivers/usb/chipidea/host.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >
> > diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
> > index bc3634a54c6b..dc033272c31e 100644
> > --- a/drivers/usb/chipidea/host.c
> > +++ b/drivers/usb/chipidea/host.c
> > @@ -459,6 +459,16 @@ static void ci_hdrc_unmap_urb_for_dma(struct usb_h=
cd *hcd, struct urb *urb)
> >       ci_hdrc_free_dma_aligned_buffer(urb);
> >  }
> >
> > +static void ci_hdrc_host_suspend(struct ci_hdrc *ci)
> > +{
> > +     ehci_suspend(ci->hcd, device_may_wakeup(ci->dev));
>=20
> Why is the chipidea driver somehow now tied to the ehci driver?

The chipidea host controller driver has been tied to ehci driver from the=20
beginning. Here, this patch will enhance the host controller by using ehci
suspend/resume functions.

>=20
> Are you sure you want this?  Why?  Is hcd always a ehci device?

As the host controller may suffer power lost after system suspend, there is
a need to restore it correctlly after system resume. ehci_suspend/resume()
will handle the generic parts of controller suspend/resume, at the same tim=
e,
ehci_resume() could handle power lost case by reporting this event to root
hub and reset host controller in a normal way. So it's exactly a good choic=
e
to use them.=20

As per chipidea RM: The USB 2.0 Controller is an instantiation of an=20
EHCI-compatible core which supports high-, full-, and low-speed operation.
So this hcd will be a ehci device all the time.

Thanks,
Xu Yang

>=20
> thanks,
>=20
> greg k-h
