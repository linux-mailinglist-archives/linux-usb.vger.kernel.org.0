Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6923675AE75
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 14:33:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229904AbjGTMcy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 08:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbjGTMcx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 08:32:53 -0400
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2057.outbound.protection.outlook.com [40.107.6.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E8E2D4E
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 05:32:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AycOVYX0O235jgYrOjAHU2GKePrgIqkrW597bzJ/+cKgTKSxsWKJxSLz8az+WAseJ6qDJjFIPuUHaEYfl3DzjzZo9Qa+zIEuo57y6gTkCjPuScdl3Y/ZLnDL075rYkqcx7CikxsUE7Fsx1zGP89pxqIKXsFQgvUYW7AOheRdmV+QTnEmC8zSh9IoBNEEdZSTBPLPfYwEbSDFNQak27At6EhrvUB7nsmPMcUSXL+g9qCL57p47Xgduc2l4kVh/LRxoL8xnXa4WX8zEZoyeyU8sjkhHBZaNrfjkWngqbNy2y/WRfE6jZ7+N+zXNuqv4YbV767WulKUnD4+rCN4aGY0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ChaonHFmP8kxjeXtgcMieRJExNr9Q8zwX/Xrm33XhJo=;
 b=PsHS5O2TBAd1rsRg2m2gSSnQ3HNboBbIhShhnlApubknE3rgpQ8EU4spAZDbAXkMgxSoHkcQokjVwIzMFapTbOxdvLDO/4VsFsw8+e3c2y9yLdQbHZZfmWgtwWeJfYY2d7lHFTEOJ264x5crRkbnrgCUFemGxRbQ/engw2OGWXkXfv0knf8VM7Uk265hiBYz/9Ym/EtOC9PscgWmNPK+ikoyfTcP2QwCeFQWOsJ9kOFMaLExZGpjeUeRukmFIzEOv6o0mcFJ5LwDNG0MorNB8TBqz9H6DROOzCwSZ7kvqlIdbdlCCDXeBlec6Tvb6Nz7M8bh3c0V1Mc0ku2kWXDYMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ChaonHFmP8kxjeXtgcMieRJExNr9Q8zwX/Xrm33XhJo=;
 b=n5y73AhPQmwEouJWX1akHDNQIWICJdOiWGAPH8ezMBFApE4egh03I/P/IY7vzUEZ0nplPe8kLto3EjCgN7r/lxutGoRPrubcab8/BVR8idB03aR9lRK7FxqsZscKbRzjniG8I5OAm62TuIiO7/M0rEFrrzk84WmtVjF7I1jfnCk=
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com (2603:10a6:208:12f::20)
 by VI1PR04MB9882.eurprd04.prod.outlook.com (2603:10a6:800:1da::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.35; Thu, 20 Jul
 2023 12:30:53 +0000
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687]) by AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687%6]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 12:30:53 +0000
From:   Martin Kohn <m.kohn@welotec.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Martin Kohn <m.kohn@welotec.com>
Subject: [PATCH] Quectel EM05G LTE Modem with new Product ID
Thread-Topic: [PATCH] Quectel EM05G LTE Modem with new Product ID
Thread-Index: Adm67dkv95M8c77iRo6Y7H+cUFKglAAF71LA
Date:   Thu, 20 Jul 2023 12:30:53 +0000
Message-ID: <AM0PR04MB5764EE9ECBEC5B8E00BBD84D973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
References: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB5764E9F944881E5B1FCE63F0973EA@AM0PR04MB5764.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5764:EE_|VI1PR04MB9882:EE_
x-ms-office365-filtering-correlation-id: 881bfb9e-3b29-450d-9b65-08db891d28c2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nVi4Y4Ky2WM4E7WqDTua0M/KhR/M54U5IwaqJAGkq7cgC/p+6AHSiOtjUujYD8owyqh92PRVKwEpiR8N1eQW3WnLXO0m5R6FBmv77lmMIAC665aExw6kjghPjMS1Nufu7sNAx+xijaWK8fkVBCK7zGn944IimmEmBFnzO+bLkF8vMJ54+m2bj4LNtXFkmBMx3thsFMu2ewFHmU+7YooJODSYcsy8PoADg/FEmqv2/kxT8lzyg62czOXnA8tn+Nu6LUUEbxo1TEKftvTDbvmqCpoQAfMZsL6Ck3IVwofKnH9Jk84J0uy9zPmHNdOTSbIucnUOeisQvMXELJqER8bzIAw/VtugJE704MxePfMuhxU7enna5lniZvmFzVtPs/GDjGWmPl98YE0C/0BsBxn67OZSLQetAKsK4tnrpJbvo5+Tgbod1uJhY5vOW6bURyxJF2iIiggIFPwvKHhK6EjjjKKHtzFmpjEd7Hi7owFCSBobQfDcSKoQ9oH1DxhToNvvlN1LEZhnIBIkNMfv4+h2mfIsg1nCGGhFM2/Ky5qgG5Y+CpMDZgFJpjcROI60pCFGz4jV46yziolWKk9a1VqeRNRfeT6B9/NZeC7lSBjPOymNzMFcZ/X253ByV3PsFWBW
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5764.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(39830400003)(396003)(376002)(366004)(136003)(451199021)(55016003)(478600001)(7696005)(6916009)(38070700005)(71200400001)(316002)(66556008)(66446008)(86362001)(66946007)(41300700001)(66476007)(4326008)(64756008)(76116006)(186003)(9686003)(122000001)(83380400001)(38100700002)(6506007)(8676002)(2906002)(8936002)(5660300002)(52536014)(107886003)(26005)(2940100002)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?v09A5qoZ7LQ1VUYiSsWQ/9wT2/PB/8VUbfQETCTO81wAPpkH+YYkcPU7BW?=
 =?iso-8859-1?Q?01KbYyBK6pj68lkkDQKFcuhwxfeVpCPWPNM5KOZW67xVzUkRlhT0FzXpLP?=
 =?iso-8859-1?Q?hkGFDUuo8OkSSvEImIodH5bpVFXERAFtxjlHJwGQ1SL3IP/AX5g2bZgHCO?=
 =?iso-8859-1?Q?MHG/xkcca1EzOflZgtwyQnnGP29OOzRrx6loKMVEoO7rdAYf5aGZAX6s2S?=
 =?iso-8859-1?Q?3TgBSmNmRNUUggd/ixWQpKlAKpUZA90m/8FCxKvqfEMaxQgIWKpvvxHgyJ?=
 =?iso-8859-1?Q?kFOU3ZzFegkoX4k7TZ0tbPv8lTSM7b4E3SH2H1oE7hnpd8qkvo2zpnhnm3?=
 =?iso-8859-1?Q?pv5THPBoRRr80owsTdwA7xP8zMOQ6tbrnE0MYwzYi0k5Hub8P0uMTxloSU?=
 =?iso-8859-1?Q?EWXBfJF6YQYgOQ41i1gHYqpl1rGUqECGw5Pq6U/W/CucyN+3Q9t1B9pwOm?=
 =?iso-8859-1?Q?tNwFLH9ggKKjM2xm/WIzpUjbXb/boJ6/2kSm5Qjb13dQrZWUy4PN/1LCmB?=
 =?iso-8859-1?Q?ExFTUgZvI6/YcnVo9LGW6eYK5JtzBYL7OLl4Atc4blenS17WjHoCHS5esv?=
 =?iso-8859-1?Q?Dt8NrepueiJs3LJzHs0S2t7VcEZhkqG03VheNdqERSsA0oNAUcImsVhcv8?=
 =?iso-8859-1?Q?i/35C6WG6yvbYpCW2DYA4YYEaSYusXm4yACdwpfeSsA/HY4szLEujqygeg?=
 =?iso-8859-1?Q?3EGRKgs/59Mp5d7wqM2sv/4qm8POGF/QLd37xS6j7XiK+GFcCeyWhUB3Jc?=
 =?iso-8859-1?Q?HRmW48X2VZO79xF62rYXieDqDfHlQuSVJCmlmWGg6MSdGVpW+vA3QBKYed?=
 =?iso-8859-1?Q?kC/DP7vADLb8tY2hV7i4rM/ArKexX/iGhRIKdon7xEyHOOkJQPThwYLOoY?=
 =?iso-8859-1?Q?ZIPafO+VIOYFSdxxvwJJjAdyTF3Mxm0MbExOnCt/mq+9tqWNqpYNAYpcqm?=
 =?iso-8859-1?Q?/866mm+kxvx1jEeOceD/f5hrKkOOyWbo+PtruXEa1+zC74ZCfNErvfk+0p?=
 =?iso-8859-1?Q?qRn5R8e1scMvI5FGVoZ2mMhZtlHxWFKo6V0Q+kozqEleS7B0t3PMCA1601?=
 =?iso-8859-1?Q?Uja4zothfb8N1PVNlVs4HZwfI2UWW3Az+PZzDBL/mlMSZQYDwZZ+EAbRqm?=
 =?iso-8859-1?Q?MqJEtLulFZkVhP7Vz7PQ0z0BbpOC24Btgw9NoewCJeCKcK1BLPM2NxpvmD?=
 =?iso-8859-1?Q?ljTmHRVt7HTIvYOIvfvdEc4wndDr8OS94BWIq7O+/beDXqkpAWkZql396H?=
 =?iso-8859-1?Q?nqsWKjPaG3d4nFDknA2sBrC5b8XGlYkujBl8DxqBIdkvT5xkWMZd6hXJHi?=
 =?iso-8859-1?Q?gtU0TVOvdLLk8M+S54L0+5N4/Yhlm6X1WIMz9qHhkvdjacbC1WWb1iQXZX?=
 =?iso-8859-1?Q?12nzt/PiaQaHkXCBTTbY8S3CwlzPPud1UAg2HdlzR0aAMp/G5JeL+NP4Ic?=
 =?iso-8859-1?Q?jlba+4Rtn8OeGdbipXs1xho5/DfnKCAFnW5DmqwbVhtUl972rYHmhuvnDo?=
 =?iso-8859-1?Q?FXDZxqchvgTZTG2oMyvfj3c9s0EkFDakMHiquvMPzp2TRHNn021BCqEs/H?=
 =?iso-8859-1?Q?JuDtOZslMuOLb8QNzoJzrfuj5GiriSpYuC8xzyANZ8KetDQNPsOPpot2uG?=
 =?iso-8859-1?Q?0WZgmD4a4gTpQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5764.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 881bfb9e-3b29-450d-9b65-08db891d28c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 12:30:53.3943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qSyGA6YS3gvUjhYC4FfbUQqL6gfrfbFssasXk9vDDpoUCjJXPTWOKkTyGbmBtNphduP6pHhtFHyVxdQQSYpv9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9882
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello everyone,

Quectel has changed the product ID for EM05G LTE Modem (global variant), he=
re my verified patch for it:

From 7a19d929aa07b3541f6a1205cb0ce3f0f5dc54a6 Mon Sep 17 00:00:00 2001
From: Martin Kohn mailto:m.kohn@welotec.com
Date: Wed, 19 Jul 2023 12:04:21 +0200
Subject: [PATCH] Quectel has changed the Product ID from 030a to 030e for t=
he
EM05G modem. Both versions must be supported in the future.

Signed-off-by: Martin Kohn mailto:m.kohn@welotec.com
---
drivers/usb/serial/option.c | 3 +++
1 file changed, 3 insertions(+)

diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
index 288a96a74266..64b1995b410d 100644
--- a/drivers/usb/serial/option.c
+++ b/drivers/usb/serial/option.c
@@ -256,6 +256,7 @@ static void option_instat_callback(struct urb *urb);
#define QUECTEL_PRODUCT_BG96=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0x0296
#define QUECTEL_PRODUCT_EP06=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 0x0306
#define QUECTEL_PRODUCT_EM05G=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x030a
+#define QUECTEL_PRODUCT_EM05GV2=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x030e
#define QUECTEL_PRODUCT_EM060K=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x030b
#define QUECTEL_PRODUCT_EM05G_CS=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x030c
#define QUECTEL_PRODUCT_EM05CN_SG=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 0x0310
@@ -1186,6 +1187,8 @@ static const struct usb_device_id option_ids[] =3D {
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0.driver_info =3D RSVD(6) |=
 ZLP },
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { USB_DEVICE_INTERFACE_CLASS(QUE=
CTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0xff),
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0.driver_info =3D RSVD(6) |=
 ZLP },
+=A0=A0=A0=A0=A0=A0=A0 { USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUEC=
TEL_PRODUCT_EM05GV2, 0xff),
+=A0=A0=A0=A0=A0=A0=A0=A0=A0 .driver_info =3D RSVD(6) | ZLP },
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { USB_DEVICE_INTERFACE_CLASS(QUE=
CTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS, 0xff),
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 =A0=A0.driver_info =3D RSVD(6) |=
 ZLP },
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 { USB_DEVICE_INTERFACE_CLASS(QUE=
CTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR, 0xff),
--=20
2.25.1

