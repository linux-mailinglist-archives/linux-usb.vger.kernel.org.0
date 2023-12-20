Return-Path: <linux-usb+bounces-4416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 683C3819DCD
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 12:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 88DF21C25C31
	for <lists+linux-usb@lfdr.de>; Wed, 20 Dec 2023 11:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92D9121346;
	Wed, 20 Dec 2023 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=actisense.onmicrosoft.com header.i=@actisense.onmicrosoft.com header.b="B3opdUQR"
X-Original-To: linux-usb@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2091.outbound.protection.outlook.com [40.107.241.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E226F21345
	for <linux-usb@vger.kernel.org>; Wed, 20 Dec 2023 11:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=actisense.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=actisense.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lF9IaonXah8xaECxy1Ct/HfzWmOGpIOrzVg9Cz3S0QLneQ5jpCsPMSSQMLjvuowrDilJfj1Nq6VhWlZSmBSmq+dD+eo042dEqBoz0OyzlM7wP65m2d2601LeMPz3++9kz6EtEoDwFTXOERJLnZRCKU4aQjZJihW0d/HWMvW+iB7fzWM87fr5XiWZhNhbuB5VD0ilGMzO3F43BSCwhhuN4R/LwY0GCbWpq12GAOfKP+hE3Hyo2ONwDsW0NpXvOwdW+6D1P+Gh0yGjBFCIICK4Ftym/ZEhBo8f095bxH/umbB/HHFxsO9wrTb3w7/BoObfwNnljoNK02rfQ+J6hkruwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ENplFTUHYPyLdTR/D4kaCmf9mitqCkYYiKNilFg/uwY=;
 b=mPiietW8k3R3Ark+HY2vfevvSliWXiG3wctvNWQpg9VjEHBBLPl6E5yYxyD/cw5xo3ETtrpj7CtuRiGX/WhIhWmeeDfk3yK0vJSd2hPkn2uLn2xMoBxfcSKBxZpNjQ4QqUHwWpgQx50TyNZ4ORYRBwATRaoi7GUKL80m4X++djcnjSxJtY+lSPo12IBJfHGyt/InWg3pxzo/K5HmDAWVLH4nm/+3EJIA1xGqe6G0Ro87YYQ+c+NVD8wGtwzljcbTKau6731SpMkFJwOeXsd1MzQalegdfYYVI92TquxfQyRZLRmBG2vmLR89CBc8NS9zPZdZ+YyP87vEZjYzRvdi1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=actisense.com; dmarc=pass action=none
 header.from=actisense.com; dkim=pass header.d=actisense.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=actisense.onmicrosoft.com; s=selector2-actisense-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ENplFTUHYPyLdTR/D4kaCmf9mitqCkYYiKNilFg/uwY=;
 b=B3opdUQRMTJYk4Mh50AflhWAP3+1oYUB/9BUk9l9CiLAvvahiM46Z+Rh1VIvInViH5MSkgIyBmSbM3Gk8NgXvpPxfKxdiD+xfHkTd4EeXLOrBbs6JzimVXU8keBUKXehK6USuvM3YX2RP2+CgPI2WKuvm5dQdlZkJKDYlNI0nJQ=
Received: from AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:2e7::6)
 by PAXPR10MB5280.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:277::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 11:17:40 +0000
Received: from AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ea84:8fee:bbb:868b]) by AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ea84:8fee:bbb:868b%4]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 11:17:40 +0000
From: Mark Glover <mark.glover@actisense.com>
To: Johan Hovold <johan@kernel.org>
CC: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: USB: ftdi_sio: Actisense PIDs constant Names
Thread-Topic: ftdi_sio: Actisense PIDs constant Names
Thread-Index: AQHaMzYlKO7OwOQBsESI8DdUDR1xbQ==
Disposition-Notification-To: Mark Glover <mark.glover@actisense.com>
Date: Wed, 20 Dec 2023 11:17:40 +0000
Message-ID:
 <AS8PR10MB4424F8DB8AE222C7075514FAFA96A@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
References:
 <AS8PR10MB4424F3366DA20492BA9B1605FABAA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZWB5VtdzyGsROpuO@hovoldconsulting.com>
 <AS8PR10MB442424BD43EE4AECDDC93F1EFA8EA@AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM>
 <ZXq4A-Uht67KcJNV@hovoldconsulting.com>
In-Reply-To: <ZXq4A-Uht67KcJNV@hovoldconsulting.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=actisense.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB4424:EE_|PAXPR10MB5280:EE_
x-ms-office365-filtering-correlation-id: 891bd569-b887-474f-bcfb-08dc014d479b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 InsmmdZ4IIIsCtAvRtVeWDSE20cvnVueMzL/SS9c4PDvTcWmuagyeMaFElZ3gtQMRX7Gv7fW80BEK16S0CNgyQIYYsCP2NememUXcQTkl8mKhrQ75BxbMYumAjt2f4OJjrv+8rffOAc9xMtheAvgShhzoICyWC1t6RqO50FNwY8DzZQLJh3teovZFONj3wsAWF0wXGj8UGPMWrC4vTleo+QP69TLEwR228L+pMn5sYVlro+DE8kQUhhz3p9S945gNWjBN046aD2ILcMnO8mGldSa6yoioUFO+0yijxoux1WTyPG1XnmURjPvoxiWS30hczbBuzF/YU7CVcDC6oGGnsbM3DQNEtMW6Kqysef0SkeycK9GLPs7CLIaHEPcJElOxog3ZT7nrJdI5DwHemICGUVnj4+1qZwChyyYptRcItqqBht7K0uOLXkFIQhBGx9lqSZ72ULMTxqqJRbDGyQuyI3msG8c11CPNxzvZalS/UFaUWV3WjNjwvqWfPjmw2Dic5hX17anCo+dcyQLNgfB8+9PBYFhCb9Dm1tnbdQ1lDuwvWE6vsVSJnYVvWfeU3q+JPbkrpSHUpqHi8I1G1963xxOkhm9y+HO/x7Pra2QXbDl+X21Yf1APKgxT6JcPygU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB4424.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(39830400003)(346002)(396003)(366004)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38100700002)(38070700009)(71200400001)(5660300002)(8676002)(8936002)(4326008)(26005)(52536014)(44832011)(2906002)(4001150100001)(478600001)(66476007)(66446008)(9686003)(66556008)(66946007)(6916009)(64756008)(316002)(76116006)(6506007)(7696005)(122000001)(41300700001)(86362001)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?YSeDmKYVnsvtIWiZnO6z5vgh2lH4OgTeayQWRhszXFaQ2EORuo7U4mTPYIno?=
 =?us-ascii?Q?sRMBSYfvGiPpdb7tMLiHGIyel2WXlahAxfnf3xTvcrGpU3muzLUC+ONAxjjl?=
 =?us-ascii?Q?wMjYBIcxuNovLTDOsnFFZNqeQChlXepdnYotkRLsZAigKeS4Dtok64vZf3TH?=
 =?us-ascii?Q?M0h8MUHM23eHvJsLmQCRXVv8IeL2wWMQsdY9RzbPuGUDfuvQA75XvkjPdyyd?=
 =?us-ascii?Q?5sEpNuCR1oHNWNIf5kKZ/bb41nqFtaJ2qb/wl5PAaRV4oYUdEaikIMhavulh?=
 =?us-ascii?Q?IxrdcYFqd+Vgu+7GS6fYXr9eXjI+k5XyTzoBAsZ4Hmu1ypWXa9hhWbAjUJ/l?=
 =?us-ascii?Q?QI66e1fiNyPigtjviCa1AqGXFnlW07J1i6z+T3ZBO7TovRJsxpCOkWGIaPbp?=
 =?us-ascii?Q?7BV2I+ePOdbLM8FpfsfIAASLrHLLA+Vzo4A2g1AIjOx2H0w32e50X00LTeaR?=
 =?us-ascii?Q?6w6Cf1MDIHDHYhmWrc3S8kGoeWm/SUXC1RN/vJ1bv1mYXOzCIl+QxZPKg5nh?=
 =?us-ascii?Q?alLxwZufxDohCtRmBejvou/22ZFUEwSFPoHkHvkmdx6ldMPdDBUJKte1s28H?=
 =?us-ascii?Q?6BtHofN68bAVsGlCvXXu0Vafv8dCqpcaZVVIDe/BzCvDXeLoAXvSifWOof/M?=
 =?us-ascii?Q?Sb20Txwu3C1yjgYu+YLWMp9s/wk6JtZV6a+eMPpX7+Hkh+Mn96ilvg8o+ghP?=
 =?us-ascii?Q?09qamz6bI7G1cxxkp9q3cidm8clq7DE/OrRF2Z5joqvbplIjxlRFgzvB8EDQ?=
 =?us-ascii?Q?5CgAF0MUl5Pgbn5lZJlgt48EsHX7k3jFK96CsPkYLMDR0YPVWIlJ7a3kuGB9?=
 =?us-ascii?Q?NbWgETntxqjyO+b0B0db29SpgAp6r+AuMridmgzVHHiIUxMDgfUKcGokGH/I?=
 =?us-ascii?Q?WWOTrxo2e4dpYSInV7w3UQjXfSNahE7szFcajQYVG1VVuyI4+K8vkX7RX64G?=
 =?us-ascii?Q?2lDL5MlIjEw8/5RS8fKk5FsuXAQnu4lYtv3byArWoppfFGOFCh/zm7Ik2Ri6?=
 =?us-ascii?Q?zXZccBJlMyDDtAGEHsb8cfD9cjvYTYpci7gq2JMxenXT/u7tm0sAMfrKRKFP?=
 =?us-ascii?Q?GyyzWfsK01dcpOc1hKcucIw85OoD6QmTRDKewAL6HAKxE17cmuTsYuReMDLR?=
 =?us-ascii?Q?jnjHOAao9WWdxrP5X+HN2m8eASOZy04yvp6Th+owEzalnekXLTxODJiFyNVq?=
 =?us-ascii?Q?VynoBflFeBASHnbbY3+EZ/G0EgIYaADkB8SG3zjHT/rc/mkzz0SmZX/20ICj?=
 =?us-ascii?Q?BPQ7TlWxmN6arV6pmS2ohWGcOfwwUJiwx5Ws8D98D2mKRqYs4GKJlOHmp2Be?=
 =?us-ascii?Q?1CgvWT+dtQYDc/d160Dz2ue2HDqHIUpfPBC8y9/Hv18wXrYCKLy6r2Ukt7yZ?=
 =?us-ascii?Q?gwqwzXuO/VoWgUrUhjji7ybPw9sTzIKlL4mLnZE1cuND3mIZkVdMYf/i/Tx8?=
 =?us-ascii?Q?w19U0pvYHCSRkOiY6wRU/tNw0PmgGNO/zVLvf0qlIk8vGTw6xprDEm1unyiZ?=
 =?us-ascii?Q?TXQMrgew5VGcHYm9LdPN7FcgCQDqzKxqYPVf1fQ9qwjHabtBvbOxbUQqDH2r?=
 =?us-ascii?Q?Zu/R0Lawd74gEfovKYgT9HUf9gEQ/QI/mzUW+aBz?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 891bd569-b887-474f-bcfb-08dc014d479b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2023 11:17:40.5135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: ba4e7f32-2b48-491a-a6ad-52aca4e693c5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LqwhHHqstnCpPH8nz5vhWGZZq3OTh7VnXcPw98WqD1FJC1ZDaG5mwlXmrdVNiaiefTsTvlPqP52XT9r9Nb7jDDkqJa1w2nURWdXawJrcSSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5280

[This patch] changes the constant names for unused USB PIDs (product identi=
fiers) to reflect the new products now using the PIDs.

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
 	{ USB_DEVICE(FTDI_VID, CHETCO_SEASWITCH_PID) },
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


