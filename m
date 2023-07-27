Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB51765F48
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jul 2023 00:23:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231383AbjG0WXJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 18:23:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbjG0WXH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 18:23:07 -0400
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01on0608.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::608])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FE8F0
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 15:23:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuUa9Jp4cvf4MNqWxmJ5CCUPTUzLQA8KCllrMntB0H61i9rVJqxzGj2XxTJPqjUi904ARqKZHL/P9r1CxKHNwPEwTsywf7TzHEgMKjU8g+k1mkbPw0sGYc/QYKMsLSvNA/vaqMGiJt8reSz2T7N2hGaUewVXZjwD8kUxvRk+SBVlneWaBbK7ZauV6xrY0Kp+bluxv1T4xkq325OiJKzGRF4XDQF4CS6eGQGqV2C34Bt0Srp8Ut2830TTBqFgTwRQhVoJlZNAlgNwJkmYU51oMpKw8s3Ut3kn4ugsbJxTRrpgtaff6V0nr8unkXzOxTz3E+Q8dHLiezt3uwmHemJnVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3RxeaYznqW5dMNjMB6w0NSnCCHydjUZV1qrgtoL0HXQ=;
 b=dNwKDPCe6Y1FLMWal24WeEBVt93lPPj5cCjtTFjiBfpU/nLw6n1u+1+5jQQACauT6RUKaGvqwItqMxUlJ1YhV6z9TkZwAL+aBF1N2X5+AE/1LddJ6q37EHJkqJl5EXGB/OpmmbYstnfNTFsiJ35LzgD4P3KbVrG16xMpfaubVf4/SDkCc/gt4KHcGzFBAcrveFeDglDTuqwaBo9eJMrJeZhkqEmm2jm6cO5REXsIsu86E0XL2zDkEffr8wS+6iMfNn9qIy6vNbjHH/7a2usOqVkNzA6XzJjaFxPThIm+myUWAw9G8MWu/fz9v4yHFtVJRZgvV4ZUIySMkgc/3LMe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3RxeaYznqW5dMNjMB6w0NSnCCHydjUZV1qrgtoL0HXQ=;
 b=OLezitH8pZjEcB0DnkiSPi+UD4yjs8NDEXKWWwnCn1aU/vW6rdlgpWjjqrHFRoUkUTyQ/W9i3KvuSv2EKxzR9faBC255IjVG/oxNv0L3wqM3Fd9lx8M2bPVz+BMObYHPkV/2MbpROA2ED4aAV/E2/S/Kttc3XqpFTTa1Q5ugICQ=
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com (2603:10a6:208:12f::20)
 by AS1PR04MB9263.eurprd04.prod.outlook.com (2603:10a6:20b:4c5::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Thu, 27 Jul
 2023 22:23:00 +0000
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687]) by AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687%6]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 22:23:00 +0000
From:   Martin Kohn <m.kohn@welotec.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Martin Kohn <m.kohn@welotec.com>
Subject: [PATCH V2] USB: serial: option: add Quectel EM05G module support with
 product ID 0x030e
Thread-Topic: [PATCH V2] USB: serial: option: add Quectel EM05G module support
 with product ID 0x030e
Thread-Index: AQHZwNivXXbqn91jjEm51kOyXzwZzA==
Date:   Thu, 27 Jul 2023 22:23:00 +0000
Message-ID: <AM0PR04MB57646CBE67FD409F62BF0EF79701A@AM0PR04MB5764.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5764:EE_|AS1PR04MB9263:EE_
x-ms-office365-filtering-correlation-id: 73e48c5f-1a12-42b8-ad5f-08db8ef00963
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ix/HFJbvw6xdW4hUZwykCVNeoG0KMIkG3EOdIcqw/Z8p7tzcjarYM04Fv1XhFENn2nCHVzD5bP5vAFh2Yl86paQdcyMp+QePVPD9/GBKBngRKs45J6FgDlplGH2Pe/Mwmf4UsoR0BN+aY1eSZB9cwV+ZqGW8wzjoGymXEHc2dIWmwzBwIK+WXvimKf2wNj52gYl1tPp+1PiP2V+BimqY7Sn47L67LR5ECYiGC7aiKZUzjk9Xo6tijb6U5NNp/PZdHVoPLmE5PSnngdwuq8vw2pvHCsrJTeDX3ZIth2CTa1wbFJnpGNtI8AUnNaSjnrxzDy+ICmGgo6sAV/NwzhF3tXscVhWRXg5NRF9EPY5X85Z8Pr02YnRJSeG62XoOBazAwrqQ5TvAH1gclH2YGcbgiqxW/gZhMQmP0FyVqNYhzsaWrhkMCOs8wz4GIqGdOCp1aQoBgBS/ymxrIrHvjz0x5FEHkExk8Cxndxr9dmlbrwOI9Iv1zZ2/PxKpPLHBZO8bae6GqfG36HIcEx1GS8vHPjHP5aUB1pMSMqsQ2LqqEChfMWCJcKtPthRg5oWR3g+ZneEd02ZehdAI82J+r1fAFUJZQLtB+NmDQRpEB4v+oo6zEUOqW/ZL/RpbH0YvXEW1qF9l4Exwib/0T5HqP5t1iQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5764.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39840400004)(396003)(376002)(136003)(366004)(346002)(451199021)(107886003)(38100700002)(55016003)(26005)(71200400001)(186003)(8936002)(43170500006)(6506007)(66476007)(9686003)(64756008)(66446008)(66556008)(4326008)(66946007)(316002)(7696005)(6916009)(91956017)(8676002)(5660300002)(76116006)(41300700001)(52536014)(478600001)(2906002)(122000001)(33656002)(86362001)(38070700005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?soxNVO47Oc1MsWde7cEX59gVOng0cXwtDHwGqU3Z5gknPah9GJ9TCc20MB?=
 =?iso-8859-1?Q?2NMQ5lvlS1ZwP7IXy05/JrXZO/1YyhZ9hxdVa0GMtBzMIBXWvWI/Fueno9?=
 =?iso-8859-1?Q?y75BHV8WLfJ+CBlTVw6k6Wsz9oC9wgUak95lqNo/zmZHyXfadGfG9YKHxj?=
 =?iso-8859-1?Q?8uV0IwfoqgB9wbENtK11K3WRl6TvyPeZmNHU/QQkYNqxIjCHTWTSO0gXcd?=
 =?iso-8859-1?Q?pErEFq9T+aGd3SrXr4cNdXYMv6BnrQWQuiAxjVgCsYaSH/jfuVgBocmIZQ?=
 =?iso-8859-1?Q?nG6aYgR8WOvJZEOHcsKW2dNyHzGJ01Wbv4W55gDJnOEuWCB/TAxC8e8fin?=
 =?iso-8859-1?Q?hsyFyZoNit70WtyO0v9cN+Gn1M+iD/bKt4QEGveg08HC1rKo8qK/HGre4X?=
 =?iso-8859-1?Q?OTIlFgAwAEqh5h3IqTs3AZLjR0ZYaKCzBHxLlrNuIma4kHE7WFVJqeANGR?=
 =?iso-8859-1?Q?9fQNBjbUdp9AV3F4Elv4DRk+p+FzSZmzSswtTQgrUKl8wUVmtnQHfE5Cl1?=
 =?iso-8859-1?Q?V5llF8R/MArIQWpmWDIgLWAsdv75Y9MgZaVLoAnfdOk1RBFP0l953rnp1v?=
 =?iso-8859-1?Q?8fI9t0PjWd/2fDjPkeRbOw24C3pBuHOzfec3lY/A3O5/TalKSOLTWJsnky?=
 =?iso-8859-1?Q?8lCYZ5GBHXkXVW/TunFvyS+bWbQ+ypZ4jqBfruJr89IiZKyLLhJ3z2MP7W?=
 =?iso-8859-1?Q?8s0KxbD4EHbEfEWo1pU4WyPwKfeAPiUFb+fwxOjWcrQUPCgsm6BZZQRNum?=
 =?iso-8859-1?Q?XIdPVvVIxSllauofPW6M1HyVya/mV6hthtCUHUWU4vfeNYnbE35yeVYg4L?=
 =?iso-8859-1?Q?GCSgubGRju7taUfwqAc0gGNh2Wd42FYKNZDd/5WU9cJArYVjXTHHtoEfmh?=
 =?iso-8859-1?Q?MEMlFy3cdpOQLVOtPBp4RBzqs0uc+qHSpU8B2a2ailVDhfNuicD/ksWyEC?=
 =?iso-8859-1?Q?uIALBiZn17r6bXO4q3n2FcxijpqU7vofT9TYr27q0FbsLY0dfWnKJTv8s7?=
 =?iso-8859-1?Q?LIZHjoCB/2o+eOo6ZCFB2gLsjaV8OL0KEZ4cVNWplAQtxgObI1aHz7P24F?=
 =?iso-8859-1?Q?APhYhTtRyVkCgIvp8lkM6NO0g+VgS49EnlLAo67k057nWL4om90iUW70d9?=
 =?iso-8859-1?Q?XxieTdT8tmgwJtXoX7hKHqajF3zvLgVSmOIUjyINUeewY4AbByCT9nVEgQ?=
 =?iso-8859-1?Q?0SHY97guTZCC6QdREFb59ynLuMqu39sivD3rWTbbA5nGXy78OotR6R4/aw?=
 =?iso-8859-1?Q?5OtFoo45xd0WyW7i8NwPBTWWCl0IlFTCL4W9+mH71nshqoqJ7/1zputY+l?=
 =?iso-8859-1?Q?xyXGZO29Ls9u3XtU3ggIWjL/D66BM4+HbsHyYQE6d5Do9/PfmlRm51p+Li?=
 =?iso-8859-1?Q?POlAgp0aFioORu3BwJA0k1zVRSjk+QxuHxopoPk7e/7TYwojAZEgxjQlhK?=
 =?iso-8859-1?Q?Fy40ajUUiSSsKC6sHC77JhfqHb22zCHNIFJScr7pX0/+yAR6SrHh7D4Y4w?=
 =?iso-8859-1?Q?JUJuMP9Nrt0cqWc7cnwsv527zun1/AwhFuAwWD6Nh0xARIorxGtIVJrszX?=
 =?iso-8859-1?Q?6iEdSlNWvaUyH2lNE8Z/6B42AMqBojItpg1qfQGnGx18F/NPq+clSUhgCY?=
 =?iso-8859-1?Q?EAGFGj12/Huak=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5764.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73e48c5f-1a12-42b8-ad5f-08db8ef00963
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jul 2023 22:23:00.3759
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6x8EP97E9EbyjlSzSVgGPBMDHfzdwD4slZ5W6LvH0Q5VgNWC63Tfbfq6+ClU3kSe/p4wJNJjS69GOASIAWjyPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9263
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add Quectel EM05G with product ID 0x030e=0A=
Interface 4 is used for qmi.=0A=
Patch for qmi was also send to netdev mailing list.=0A=
=0A=
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  2 Spd=3D480  Mx=
Ch=3D 0=0A=
D:  Ver=3D 2.00 Cls=3Def(misc ) Sub=3D02 Prot=3D01 MxPS=3D64 #Cfgs=3D  1=0A=
P:  Vendor=3D2c7c ProdID=3D030e Rev=3D 3.18=0A=
S:  Manufacturer=3DQuectel=0A=
S:  Product=3DQuectel EM05-G=0A=
C:* #Ifs=3D 5 Cfg#=3D 1 Atr=3Da0 MxPwr=3D500mA=0A=
I:* If#=3D 0 Alt=3D 0 #EPs=3D 2 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Doption=0A=
E:  Ad=3D81(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D01(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
I:* If#=3D 1 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption=0A=
E:  Ad=3D83(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms=0A=
E:  Ad=3D82(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D02(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
I:* If#=3D 2 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption=0A=
E:  Ad=3D85(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms=0A=
E:  Ad=3D84(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D03(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
I:* If#=3D 3 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3D00 Prot=3D00 Driver=
=3Doption=0A=
E:  Ad=3D87(I) Atr=3D03(Int.) MxPS=3D  10 Ivl=3D32ms=0A=
E:  Ad=3D86(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D04(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
I:* If#=3D 4 Alt=3D 0 #EPs=3D 3 Cls=3Dff(vend.) Sub=3Dff Prot=3Dff Driver=
=3Dqmi_wwan=0A=
E:  Ad=3D89(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms=0A=
E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
=0A=
Signed-off-by: Martin Kohn <m.kohn@welotec.com>=0A=
---=0A=
=0A=
V1->V2: correct number of interfaces and reserve interface 4 for qmi.=0A=
=0A=
 drivers/usb/serial/option.c | 3 +++=0A=
 1 file changed, 3 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c=0A=
index 288a96a74266..2b0d77c7ee43 100644=0A=
--- a/drivers/usb/serial/option.c=0A=
+++ b/drivers/usb/serial/option.c=0A=
@@ -258,6 +258,7 @@ static void option_instat_callback(struct urb *urb);=0A=
 #define QUECTEL_PRODUCT_EM05G			0x030a=0A=
 #define QUECTEL_PRODUCT_EM060K			0x030b=0A=
 #define QUECTEL_PRODUCT_EM05G_CS		0x030c=0A=
+#define QUECTEL_PRODUCT_EM05GV2			0x030e=0A=
 #define QUECTEL_PRODUCT_EM05CN_SG		0x0310=0A=
 #define QUECTEL_PRODUCT_EM05G_SG		0x0311=0A=
 #define QUECTEL_PRODUCT_EM05CN			0x0312=0A=
@@ -1186,6 +1187,8 @@ static const struct usb_device_id option_ids[] =3D {=
=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0x=
ff),=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
+	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05GV2, =
0xff),=0A=
+	  .driver_info =3D RSVD(4) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS,=
 0xff),=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR,=
 0xff),=0A=
-- =0A=
2.34.1=0A=
