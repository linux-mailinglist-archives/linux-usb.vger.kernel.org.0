Return-Path: <linux-usb+bounces-4422-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1764981A06B
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 14:58:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BA0A1F21CDD
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 13:58:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1916037171;
	Wed, 20 Dec 2023 13:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=actisense.onmicrosoft.com header.i=@actisense.onmicrosoft.com header.b="yxsU+9MY"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04on2095.outbound.protection.outlook.com [40.107.6.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614233B2AB
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 13:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=actisense.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actisense.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aCU1038ezFAE5hEDezG/ryHWgfLMgU6N11oAnqi4rJGt+HQ7Y/35fB/bhxGckMaROrlp3I1Cs0yjLajN75/tbasE7o0mYF0Axj5m1JwXm++//QYlOOExQ8cEB+iimRwmtA6IsxrO001WiS68jouBH1U3uT0a1BWd0nXQE00UaAYELYXxkjNwv8WsdyUs2ye/YhxlSq71q9TwhsEdeYbjYVEj6yiZIUhN7TmwsPJPs3FJVlelupR3v88qfN3aS1xPS7sGuIilJ3K+rZfnSCS0zTevNvRo6hLu91sTMlL0wodsnod9e+XSk/j9TUqJWtd1NuMtxgLcSUAnkM9zc2N7Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wNBKZzHyfQjBYop0nNFpu/sVY5YZ40NWQk0sUn7+65I=;
 b=Cr8UH0qfyTH6yXSL4ZLXUNMDg5YKS+qIThngh2b6NTKTs3Qaz57eXG578VyqBaM1w7JacQVYYP4eZJpDnDWCgqHqnf4lPS46or0G+P8qy8Cbe/piAf5xEv7gAWlpTH3dh66rcuZwXXO8N029D76LudmE4X5SL0JvHK4DEGusIl+BEBxsBABzcCEnju4HOU2oU/aaBF7FXwygYAk5U14qv+Pn+0emU0M0lCABQWUJlSn7aC9OcdgyMpOAOE8XTI9m1FXLHNs2oG7x4SZDsHiTqwzMCEFtbUb+MKbaMiQqbDZa6S7yK2++YrRFwEAO5LWFzSkLSzzIRMECuhTUGREU8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=actisense.com; dmarc=pass action=none
 header.from=actisense.com; dkim=pass header.d=actisense.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=actisense.onmicrosoft.com; s=selector2-actisense-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wNBKZzHyfQjBYop0nNFpu/sVY5YZ40NWQk0sUn7+65I=;
 b=yxsU+9MYodOx5y+FhtsgQ3pdn8r+2DGrMiaj2siTOeKgYOpqICCSipORLufqbZ7Ph4c6x3EvImz/2+9KrK1Ds2yKg/b1Xc6z9eTPmE72jUuRjefFUWquGCeVSODe5+25SWEVQqLoldDEPcjOJNNMvDeHzJ5t8gvP05WRRhf1mGY=
Received: from AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::6)
 by DB9PR10MB6667.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 13:57:40 +0000
Received: from AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ea84:8fee:bbb:868b]) by AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ea84:8fee:bbb:868b%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 13:57:40 +0000
From: Mark Glover <mark.glover@actisense.com>
To: Johan Hovold <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: ftdi_sio: Actisense PIDs constant Names
Thread-Topic: ftdi_sio: Actisense PIDs constant Names
Thread-Index: AQHaMzYlKO7OwOQBsESI8DdUDR1xbbCyMeaQ
Disposition-Notification-To: Mark Glover <mark.glover@actisense.com>
Date: Wed, 20 Dec 2023 13:57:40 +0000
Message-ID:
 <AS8PR10MB4424408E2BFBD055150629C9FA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AS8PR10MB4424F3366DA20492BA9B1605FABAA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZWB5VtdzyGsROpuO@hovoldconsulting.com>
 <AS8PR10MB442424BD43EE4AECDDC93F1EFA8EA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZXq4A-Uht67KcJNV@hovoldconsulting.com>
 <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To:
 <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=actisense.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB4424:EE_|DB9PR10MB6667:EE_
x-ms-office365-filtering-correlation-id: 22c9ef43-9f43-4dcf-f913-08dc0163a169
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 /kp0PwdU20dcCeGyI+MjYx7kdhO3oBu9Q/xnrjP39LClEOgb2Vw75xh8LDYUpTiGNsm53wnok6qvBukrgfe8IeFZH7WFpDdT2GRv4vImIVQKh4TfA4nlRyNUnhiINAZ+Zca+DBgICJ5HvJeeKTBD1Lan2VpSciLACWqYhJh+fKQxzzttGUSkzy5osvYINsgMqN9PU1fwL7nO69sWx4r1Azv2rjiHi8lGs3QlvsCnqulapRUOkUGYgMm4y9pAKDgtbXKsvhinH+3yZGumhdTkNAIccsElHLEtlDFlv8ytN+8dRUas1sVWnq5oTbp61Dfa9QLj/zq7fdjBxlvHtM9wbcCeiOuoHNUvZob3kkIcEBq3AVTs9pspuwsO2H9tq30WsVxK/BIHR/NRdeGB+2HRJ5zCJm9nfNlhS0mWqV1HmIW8zTPB3HsIKbB3syQ1Su/CUVxJEWx2HJF6P+4sL3pMp+Od3hxFYeGL27w8U4YlMeCjMZWs32DXLWV7rkL+wEfPEzGvitc197M1v2w0God0rinKdAB0w5RxI33GkvLD3CsLbGRY1o1YQkTfDX5TN/3fHD/FVuDIPYdd46wDzqE3IfLBxq8CGkm0Q70oAqLKHwwOAOO5IaHijRJeQ7X6a2NK
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39840400004)(396003)(346002)(376002)(366004)(136003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(26005)(9686003)(86362001)(6506007)(7696005)(478600001)(2940100002)(6916009)(316002)(66556008)(66446008)(66476007)(66946007)(52536014)(44832011)(64756008)(76116006)(33656002)(38100700002)(122000001)(71200400001)(5660300002)(4001150100001)(2906002)(4326008)(8676002)(8936002)(38070700009)(55016003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?zYqUdQFkbeaZm3xmKHvcqtbk+1C64e3Vdy22X4RAhpAmkEVyEkwPdrkWVgfK?=
 =?us-ascii?Q?lq0m7vxSohlG3OiPCbroJ+UHqLGLLC0Yf4AR9Gqzi3UlloCDxY64brqydSg4?=
 =?us-ascii?Q?ztWmRtSzAjKcnsjT4sJjhA8LcxFl6YhEDVs0G5G1xw8Pl9RF93q7qyKItKQF?=
 =?us-ascii?Q?BdJuphD240CKCVmf9TzLFpeiB16rEZRHk4iZwp9hmDGlisyUNobL83ptSS7f?=
 =?us-ascii?Q?9nykuFK6DkELy6AmTlHOkTMy4bL5qGED0GKK2ti3NwuBRlTWnviphLBXuK7u?=
 =?us-ascii?Q?lUJB1lFipHhbIlc0l8lC0RSy6kfXzTTYuUDLzSrAxeQgnyf/2FiofBniWK0H?=
 =?us-ascii?Q?0p8pqNSZbJkPkdAefVd3TAgMFucSZSDyyDowb6VTah/0L0UlJQx9Qwmhl0xd?=
 =?us-ascii?Q?RynKgzxXeEgxej60l+4WuuhTfPHH9v7pXCJPX+i7thLPTimEiHgoux2vG4R7?=
 =?us-ascii?Q?rECAEHcjqciT2p+NGJVp6ANDjOxoQ6NBOxEYpaZAWyE4CB2PzJ1X4DfgrtqC?=
 =?us-ascii?Q?wpK9EGtwVEhNb+2+K29sEI59qv3xwlDNb07x06IrcWYOBNy+JF0jH3OsliAM?=
 =?us-ascii?Q?ZiJIE/JgtOoinQuhcDAQzTrWDOZkjP7FkJZbSaKUmMsqX+7wqU5iu9CXSPn7?=
 =?us-ascii?Q?mxGKnzRauIYzCwYsezbvgCv438zrCHxw3g9a5LsTieUbgk/nI+zVG5wU7lAf?=
 =?us-ascii?Q?WMyliFX/88u91p9lESMOgqeBdhlECbyh25mrzn29SyHNbYXtPBQ3xzGuYo8g?=
 =?us-ascii?Q?F4RQ16WOCObbo2GLoMsvCqsQ44xrY55CXeTa6XabbgEpSQQogIdvEbxmHqXu?=
 =?us-ascii?Q?TwXAEr+zsgZCOWuissFmqqwVQ2BArCPCFXxSmK2oDbkMTOgGxQk3l07MKAkx?=
 =?us-ascii?Q?kDsSoRevTqf01f0x9F7zWXNA7thmoL2Xlfw7vWI9fO4iWg0lnuaULPgeupCF?=
 =?us-ascii?Q?dxYSRCCKzrdBlh6uvzfwjh5P8+sP14uSUqW+CwOSL8gMnPtVegjI5l7FOF04?=
 =?us-ascii?Q?S7PFIs8fk88hShsEB8FaHmF8MsfXgSADTbX2rJNFA1/7sgdrUqrPfNPaIrbw?=
 =?us-ascii?Q?KrPswZaKHXkh22lFbi1JcjbdFzL1K+lkAn3ltTYoXynmvyQSQCo3M05Gl9fb?=
 =?us-ascii?Q?bD5adNQ7zufb8hnXNRS9uZL3t39eTFzES5Y949ce4NntA9Kri87XdVJf0rex?=
 =?us-ascii?Q?wQpNH3sIQvFKo74ma3f8I1h/avAsM31gsR3p4lPzTEP1wElwYaxRhYD4HbU2?=
 =?us-ascii?Q?0INEhyS9DokYt+4cuWS/QfO1ULTbTkpmtMBksYCTXR+sRQ2g2AWASrhRsMHQ?=
 =?us-ascii?Q?43MrJH4NvcGTNAZb+Dvs8CqDuQntXGyiZ/6GLA9Or22lh611W3W5ShyxudFq?=
 =?us-ascii?Q?LI5/EWW/Xb3KtGn6H6Du9lbnDqF0OiFknJLcBdIsC+LciOiCknf2Nbf9WP15?=
 =?us-ascii?Q?1RmwJROCUrTrDhqiKM5B1KrW7pOrK6A5L8UsFjPeh1Z2TT47QvgAyKUfx8KR?=
 =?us-ascii?Q?2GSMLV9r6u6DlpPpdYaEeSFfz4jYbPak3yR2mAH2GUTPS8B/eb1elIdE7B14?=
 =?us-ascii?Q?OyB5j/cQ2JZMe3vlr2PfAz58LmiJ8q6esI4IIh7N?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: actisense.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c9ef43-9f43-4dcf-f913-08dc0163a169
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 13:57:40.0956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba4e7f32-2b48-491a-a6ad-52aca4e693c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fqCdVXmzIVfiRZIBIZQhjr3fXpgqlu7iNo+NGy4ZDPRka+A04EIdX20f6wLQF/wzWvifCi2u5amkyGmK6DVjwyet/+T7xWF/1CQb611yMK8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB6667

This changes the constant names for unused USB PIDs (product identifiers)
to reflect the new products now using the PIDs.

Signed-off-by: Mark Glover <mark.glover@actisense.com>

diff -urN linux-6.6.4/drivers/usb/serial/ftdi_sio.c linux/drivers/usb/seria=
l/ftdi_sio.c
--- linux-6.6.4/drivers/usb/serial/ftdi_sio.c	2023-12-03 06:33:10.000000000=
 +0000
+++ linux/drivers/usb/serial/ftdi_sio.c	2023-12-12 10:39:51.157327241 +0000
@@ -1033,9 +1033,9 @@
 	{ USB_DEVICE(FTDI_VID, ACTISENSE_USG_PID) },
 	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGT_PID) },
 	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGW_PID) },
-	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AC_PID) },
-	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AD_PID) },
-	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AE_PID) },
+	{ USB_DEVICE(FTDI_VID, ACTISENSE_UID_PID) },
+	{ USB_DEVICE(FTDI_VID, ACTISENSE_USA_PID) },
+	{ USB_DEVICE(FTDI_VID, ACTISENSE_NGX_PID) },
 	{ USB_DEVICE(FTDI_VID, ACTISENSE_D9AF_PID) },
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEAGAUGE_PID) },
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEASWITCH_PID) },=20

diff -urN linux-6.6.4/drivers/usb/serial/ftdi_sio_ids.h linux/drivers/usb/s=
erial/ftdi_sio_ids.h
--- linux-6.6.4/drivers/usb/serial/ftdi_sio_ids.h	2023-12-03 06:33:10.00000=
0000 +0000
+++ linux/drivers/usb/serial/ftdi_sio_ids.h	2023-12-12 10:36:37.295990528 +=
0000
@@ -1568,9 +1568,9 @@
 #define ACTISENSE_USG_PID		0xD9A9 /* USG USB Serial Adapter */
 #define ACTISENSE_NGT_PID		0xD9AA /* NGT NMEA2000 Interface */
 #define ACTISENSE_NGW_PID		0xD9AB /* NGW NMEA2000 Gateway */
-#define ACTISENSE_D9AC_PID		0xD9AC /* Actisense Reserved */
-#define ACTISENSE_D9AD_PID		0xD9AD /* Actisense Reserved */
-#define ACTISENSE_D9AE_PID		0xD9AE /* Actisense Reserved */
+#define ACTISENSE_UID_PID		0xD9AC /* USB Isolating Device */
+#define ACTISENSE_USA_PID		0xD9AD /* USB to Serial Adapter */
+#define ACTISENSE_NGX_PID		0xD9AE /* NGX NMEA2000 Gateway */
 #define ACTISENSE_D9AF_PID		0xD9AF /* Actisense Reserved */
 #define CHETCO_SEAGAUGE_PID		0xA548 /* SeaGauge USB Adapter */
 #define CHETCO_SEASWITCH_PID		0xA549 /* SeaSwitch USB Adapter */


