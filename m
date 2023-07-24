Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D08D075EF0E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 11:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231509AbjGXJYl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 05:24:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230263AbjGXJYk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 05:24:40 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BE44FD
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 02:24:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eFjdsXhuLzhIizLNiPmVdOUaZawZOZ5mtriJDDioBP6iDdmt346/uqNl6Irgegkj4BpSgjeGhn1D+9KPGVwiqcQsiLAu5k7raTlxt0UBtgJHY2dz1F4JiNl6udJGad5Ye7u1B7cjLYxpzU96xFhFLgkjGGoId1371xfXw51KoCg/UUj55RCm0X6t/VuUhtAV/pNIjMrzmDEydUJzpAI+koTm51z4BkVTnugmD4vqYpX0sPkxix4JrwbnrvUQfBtw4MZaJSVRJUgurb67SpQjgNW6BbRVWUifLkKEtggjvK9UUIxEw4MVI0f7PE2j0l0YKy2fCORe4nkV8GTaMTY92A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PMvCkRmz+UruKEDVvd9UCpAMSZzzfzaYGNM6i1f39F8=;
 b=VZL+cMltj2JGck5vDqnsUxGmDdNHh4/wId480wPVf8y+UypVHRdML+eX1K/8GYFV4FLgrVLApgw9LQoaFIQcall2KdSag1JPdpenSVCOu9x8eYYUX9T6x/CEGwXpCPArNYme1Kpu7vgt/5CtaL9xOhVoasykRUd73YHpe0qgYbKtPMyx5/gNzly43cy+/KPVGaW72bPpWWJMGo2CYN9+wYqBEwG5NFef1J4RgoYZasbyHjV3uPVkMJ9dV0gOW/r/xiuyxsEmq5u5fR5qxQMe5KkfJ+6Ha8uIH48HQVt8vUvQTO3GfVCg3dhO4EtLr6KQQWuSXd8Dog5ou633mnS9pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PMvCkRmz+UruKEDVvd9UCpAMSZzzfzaYGNM6i1f39F8=;
 b=2BBmZbq693yd8Z/wLNGx31H3+c1vfOW8osSfkk9OT/n6bbg8hY0RmYc7nrGaQdEVu771zqO/aFvCrWf/YYcSkK2GbiF9k1ejuDjOr/cDyJlhfuYqr1J3hjggNkjuzbL/Hme9hnBIM3bsjb+KhzY56I9oEv+eQS8GHVXtEgDC70Q=
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com (2603:10a6:208:12f::20)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Mon, 24 Jul
 2023 09:24:35 +0000
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687]) by AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 09:24:34 +0000
From:   Martin Kohn <m.kohn@welotec.com>
To:     Johan Hovold <johan@kernel.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: [PATCH] Quectel EM05G LTE Modem with new Product ID
Thread-Topic: [PATCH] Quectel EM05G LTE Modem with new Product ID
Thread-Index: Adm67dkv95M8c77iRo6Y7H+cUFKglAAF71LAAAOLXYAAvVRH0A==
Date:   Mon, 24 Jul 2023 09:24:34 +0000
Message-ID: <AM0PR04MB5764A20ECDD077042E6D768F9702A@AM0PR04MB5764.eurprd04.prod.outlook.com>
References: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
 <ZLlACymhpmIx59UX@hovoldconsulting.com>
In-Reply-To: <ZLlACymhpmIx59UX@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5764:EE_|AM8PR04MB7938:EE_
x-ms-office365-filtering-correlation-id: fb8f2786-bc17-4908-77eb-08db8c27cb1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4fpY657QPc49D3m0LG05uJU/uyuqmrQcFWaOeX/wcxdddA+P0eXdeayGQ68CEKiIMoPah5Fx5d+ZoPrY71kfjkiFqDLuDXeMT06U9FL94Keh1akZITxSqFu9unT9VMD1kE9tS+MDu3frWjIYDeOiPO7p9QS02Bmsz+HrfJMTmMZY4iW8ibW341gHylMQLfEI1k5XvJZS5oIhz/Z+r/N5FFOc5v0oDMdY/J+bEEXpig5ekSn4wXLZT5Z83sLokzcVjLf+oPW4enkI67hoUy9eCgGavsBsf0YC4gN4kpUY+tmA+IXORkwgGYjz9s4wCu9WJZPPEJ9/uzc+i9vp2lXgFgC2yoK1GD96iaqpOzDhJ3g9PS88TeSx13KvqUYcLwfIScvuv0TsYavGVqwcSIhBXmUW56/+dKM5yfp+dvgqzVfRMutkdGS8sPL3iG2J9CY2DV21RumBG7ekCdrDznPdI+HsJwPdhSYRNfjC6pMwyHNb8bzZ5VhUpAh0MWruLTWwZSF6n3kxU2YoA8Evxh7EBzpB1AFvOyp7RZDJDiGZ5DVYwXJtpCaivkyOEFFDfXBIzbbtnfN/SPykwBt4lk2dxMXrwUSPSVVAVlm+X6lX8ow=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5764.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(39840400004)(376002)(136003)(366004)(451199021)(38100700002)(122000001)(55016003)(53546011)(83380400001)(8676002)(5660300002)(52536014)(8936002)(478600001)(64756008)(66446008)(66556008)(6916009)(4326008)(66476007)(66946007)(316002)(76116006)(41300700001)(186003)(26005)(6506007)(71200400001)(45080400002)(966005)(9686003)(7696005)(2906002)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ea2Ki2sczbBi6wjksiGyS8bQX5RPwRzxNKl/dIWyZ/UXKbdJgb1Oq2JIEX?=
 =?iso-8859-1?Q?o04u5kh1bHIDI+TJIMGWOZkYABbzFkTAh1EwVzenY0zmDzZZL5Ed8WUV/o?=
 =?iso-8859-1?Q?YEjFAT/xvxESk/Sjm6tbdhyARwDK7bt8yZ3rlx/gfbIrn5R35l9eG4Pcvf?=
 =?iso-8859-1?Q?oFcipq4mAFJkTazOh4VnQIHlxO5hHWjm8qIy63KmgyLd3QV4x4gqEZ0qvo?=
 =?iso-8859-1?Q?5lT4F8Vlp9mIP4qKYg5TKEU2QVX6riOB/ISYZDvkD0hchkpLQemGhRW2Oi?=
 =?iso-8859-1?Q?VQdBc0qqk6U/VcCSC6agYnETeCA+UkvloxxP4+oJZxcQPLHHGEnr29ZKyT?=
 =?iso-8859-1?Q?89UFcrS+YbBHNNSYw+HjJAQ72d4e2qsoRoXzS9s/4Kcl2QaYcrdszNtBME?=
 =?iso-8859-1?Q?Ig2VeBZ3Q869vYgnPXLW54sRv/gYMt6nL3Sdbs/8OJwTi4zvBlCVlaoxbQ?=
 =?iso-8859-1?Q?WlG1jwNdTeaOQGCTaU35071EM4nHTPuyiRrcH8bDLPSwZFI/1IZF9QgAdD?=
 =?iso-8859-1?Q?IVNOXYcH20Ni7ONOblshrkxEXDHJup+xhWex6KMFY5B2RptezVCcLbTESe?=
 =?iso-8859-1?Q?KicXQXc22FqKWeFusOEy8mRVFj0PDbSsgY2IzQvBRuMwP5tktvCZw0c7UA?=
 =?iso-8859-1?Q?WvXCz0OalRcJ8T3odekilAwm4gxlqnOBVbrqEX9GrHjmHlZbbL8PbJVw/a?=
 =?iso-8859-1?Q?/UJ+ep5Ma3lv2sMpUZIisTz36CI8klRFV3k5IbFYvwzabw+0qE8p3bYVpw?=
 =?iso-8859-1?Q?4Z6YrSHy4m0cIPObFUSsCZn6S8odH7X+Zab0oM2b5iHELXGqzPnKM/LSgQ?=
 =?iso-8859-1?Q?6cYj50zgbeDeCMnV0rKl8zaUc4nmwtKd6sBxtHmndg0jn3rrJ445U1KPZg?=
 =?iso-8859-1?Q?x0fINQCCDWs8SSVspKls3VCpIx5tTKEK/y4dnspUduDe/RBbWxG2O96ART?=
 =?iso-8859-1?Q?q5guazbiU+mgUV6Epyd5WMA9xiVeKbUTVie+2LQeHSW+31h5D5YOXlq5Vp?=
 =?iso-8859-1?Q?MY4QKhu4pWEvPjk9kgbPq15iGqBfAs43TfMLk9MuS0MWFoMcXb62WvJWCR?=
 =?iso-8859-1?Q?sELNHnY4bTxcHsGQwsU6Rqq7gCCgeQB3c0AxuoKNMi7UvLQMref1+buNv/?=
 =?iso-8859-1?Q?b63rkDcO6kyKAy3K1Ei08EU7CGZG9V4zOrbDFH5/wBPl69oVVjcvO6UvV6?=
 =?iso-8859-1?Q?jb1pJW3BNAAnRWG6ftBcLEw+8osdCFrwDZnxVGHlTMTdb1aFpZSoI+YSa8?=
 =?iso-8859-1?Q?euluUlcXij1D7EqOy1ZELyI+knp4qO2+AuGcEwjAGm0FUj+Fif3w8RX25N?=
 =?iso-8859-1?Q?X6XkYwk7+pysaikDlu8HqhsIrtdrhoW/cND14eqGL1gBGN8shsrByM1R3k?=
 =?iso-8859-1?Q?O6whfEqd3ap37rq4UWK8JPJTi80RftZ018yy8jPg+ASpBHxpIc8PruYKLw?=
 =?iso-8859-1?Q?e5LZjlLQbAKh3xSA9VWF1mjupKocYvb/jALmb+QgQMXkx2jyPQmwvfpayB?=
 =?iso-8859-1?Q?NbmcmOwHRrXR9nWe2a46zk1JyhfxOfUjSbR6Ije6k5R4okJ1I3OytoXpvY?=
 =?iso-8859-1?Q?B047OC4BYAIcaJe4tndAqyy+kYwLG6n4QloeY/NAgPXHH3bkpPfwPeJRJ1?=
 =?iso-8859-1?Q?oI/nlrWuYsdzE=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5764.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8f2786-bc17-4908-77eb-08db8c27cb1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2023 09:24:34.2316
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LBTJ2uIrx4iM9lQw9felrvJC4rbi6Lafw04Rb2FjwgayJRYrFWtGFiAAsvaD/pjaIzYcejisZ0/jtp0vCcXeLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Johan,

Could you please point me to what I did exactly wrong, now I tried second t=
ime and as I'm new here, I honestly do not know what I did wrong?
I did run checkpatch and applied it back to my repository and everything is=
 fine on my side.

-Martin Kohn

-----Original Message-----
From: Johan Hovold <johan@kernel.org>
Sent: Thursday, July 20, 2023 4:09 PM
To: Martin Kohn <m.kohn@welotec.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] Quectel EM05G LTE Modem with new Product ID

On Thu, Jul 20, 2023 at 12:30:53PM +0000, Martin Kohn wrote:
> Hello everyone,
>
> Quectel has changed the product ID for EM05G LTE Modem (global variant), =
here my verified patch for it:
>
> From 7a19d929aa07b3541f6a1205cb0ce3f0f5dc54a6 Mon Sep 17 00:00:00 2001
> From: Martin Kohn mailto:m.kohn@welotec.com
> Date: Wed, 19 Jul 2023 12:04:21 +0200
> Subject: [PATCH] Quectel has changed the Product ID from 030a to 030e
> for the EM05G modem. Both versions must be supported in the future.
>
> Signed-off-by: Martin Kohn mailto:m.kohn@welotec.com
> ---
> drivers/usb/serial/option.c | 3 +++
> 1 file changed, 3 insertions(+)
>
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index 288a96a74266..64b1995b410d 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -256,6 +256,7 @@ static void option_instat_callback(struct urb
> *urb); #define QUECTEL_PRODUCT_BG96
> 0x0296 #define QUECTEL_PRODUCT_EP06
> 0x0306 #define QUECTEL_PRODUCT_EM05G
> 0x030a
> +#define QUECTEL_PRODUCT_EM05GV2                              0x030e
> #define QUECTEL_PRODUCT_EM060K
> 0x030b #define QUECTEL_PRODUCT_EM05G_CS
> 0x030c #define QUECTEL_PRODUCT_EM05CN_SG
> 0x0310 @@ -1186,6 +1187,8 @@ static const struct usb_device_id
> option_ids[] =3D {
>                  .driver_info =3D RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID,
> QUECTEL_PRODUCT_EM05G, 0xff),
>                  .driver_info =3D RSVD(6) | ZLP },
> +        { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID,
> +QUECTEL_PRODUCT_EM05GV2, 0xff),
> +          .driver_info =3D RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID,
> QUECTEL_PRODUCT_EM05G_CS, 0xff),
>                  .driver_info =3D RSVD(6) | ZLP },
>                { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID,
> QUECTEL_PRODUCT_EM05G_GR, 0xff),

Your patch is corrupt (e.g. tabs replaced by spaces) and cannot be applied.=
 It also lacks proper commit summary (Subject) and commit message.

Take a look at

        https://lore.kernel.org/all/20230710075218.8895-1-moh53n@moh53n.ir/

for a recent example of what this should look like.

Also make sure to send the patch to yourself first and run checkpatch on it=
 to make sure it's not damaged in transport.

Johan
