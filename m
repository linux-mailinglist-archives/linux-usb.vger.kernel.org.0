Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1165FBD7D
	for <lists+linux-usb@lfdr.de>; Thu, 14 Nov 2019 02:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfKNBa4 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 13 Nov 2019 20:30:56 -0500
Received: from mail-oln040092064099.outbound.protection.outlook.com ([40.92.64.99]:24846
        "EHLO EUR01-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726392AbfKNBa4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 13 Nov 2019 20:30:56 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S7pdwyAfSrq/Azt6sdDqCKYsLqSX+DwZIBcDAT4ckhgQQjIfiN1hsBUWaCyBq1sPRWeaEUS+R4ZqCWTUI7hADYjpUF04FZQGoOFqgnOgti+ckizAd/PAHN1PT5zpZ8RSd3ZdbfwGj5trKtgFySWIk5igTqg13hkWBWHleyAWolFMzQlBFrz63Sq+ikQkiCO6rk+cXZenpBdTI60DlalmIMYOlq7KVH7cEzqljgL01ybQTHL+A1hNR+oH1iW4U7T4zUB8k5AYdBHibRKv3SFO3vaSBXv3SWkYtUf+KcoJSLYgcx4xViK+l/ShkL9HFoPXoOXZnthThvi6/iEOhs+Huw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i53ELt+kjpcwDbQkwXQGp0JwHlsFVNtxm2qHKvbaRos=;
 b=F2OfXNVyIy5nRy4CIKNeVL+KVCRfCNxXf3zEMxnQqkV3IOAabWA6oMk+T7PUJTuk6BTsAc+gqh3B6tt5Hqn7LmhFGFSBJ4xocBVIUa6Je/RECMdIWyGvT/SptjHkp6DyYTGMQZE+uFmZJ7gF9uwP0+r3vtVrBFVjnsFhJaAorAtv62NrEFMjFpAMSM9Y3dhaNUuQCQSkLeuICoWqLKji2aRRiOz/79xSAMFDloGuEZIF0tmgku5yivYwvI1bhaDY7MWPmS8emCt1y4mM6dUo+0Z8rQMJhjLs8yRassvAXX2KLwobkLswgCF8IlQuG1Ui8OsFjuhvG653wnPWpcJYiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR01FT029.eop-EUR01.prod.protection.outlook.com
 (10.152.4.60) by DB5EUR01HT146.eop-EUR01.prod.protection.outlook.com
 (10.152.5.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2451.23; Thu, 14 Nov
 2019 01:30:53 +0000
Received: from AM6PR0202MB3430.eurprd02.prod.outlook.com (10.152.4.54) by
 DB5EUR01FT029.mail.protection.outlook.com (10.152.4.241) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23 via Frontend Transport; Thu, 14 Nov 2019 01:30:53 +0000
Received: from AM6PR0202MB3430.eurprd02.prod.outlook.com
 ([fe80::a8bc:7569:5727:c55]) by AM6PR0202MB3430.eurprd02.prod.outlook.com
 ([fe80::a8bc:7569:5727:c55%6]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 01:30:53 +0000
From:   Fabio D'Urso <fabiodurso@hotmail.it>
To:     Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Fabio D'Urso <fabiodurso@hotmail.it>
Subject: [PATCH] USB: serial: ftdi_sio: add device IDs for U-Blox C099-F9P
Thread-Topic: [PATCH] USB: serial: ftdi_sio: add device IDs for U-Blox
 C099-F9P
Thread-Index: AQHVmosnMOweMhKPZEih1ha9Hq3fnQ==
Date:   Thu, 14 Nov 2019 01:30:53 +0000
Message-ID: <AM6PR0202MB3430B966BCDA378E9F2D68ACAF710@AM6PR0202MB3430.eurprd02.prod.outlook.com>
Accept-Language: it-IT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0194.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1f::14) To AM6PR0202MB3430.eurprd02.prod.outlook.com
 (2603:10a6:209:25::13)
x-incomingtopheadermarker: OriginalChecksum:D39D103F85C05F64E4E4C96E52A9137E2548C15531CE6FB3239B47563B379678;UpperCasedChecksum:794131448070CD13CC5C2B4AEC79ADBBDEC25E2E17213238B949A378DB7C6D70;SizeAsReceived:7271;Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-tmn:  [/gj7hmaDvm/EpXhz9fWWpVdrzY+gyERQ]
x-microsoft-original-message-id: <20191114012916.41904-1-fabiodurso@hotmail.it>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: abd31bfa-e09e-4ccd-004d-08d768a24a29
x-ms-exchange-slblob-mailprops: =?iso-8859-1?Q?yWRSDCO040Cu91HGqe+X7QZtf8IbwIDPpGZKdjHcAKlRWO4mZTeOi2w9Ub?=
 =?iso-8859-1?Q?YCs+5T4gXVOM1H+rvc9eLnCoKGprG9I2UrmVAgHNff9eH+A6KhLYK4mQGC?=
 =?iso-8859-1?Q?qyjNrt1Y/MQ4rVmBcvROJbbxsG1zel+tvQi9WBpvU3JflcKO6BSr58cic3?=
 =?iso-8859-1?Q?A5HkX5zC8BX5cjE5xqA7MJv+IknGVut14N8pTeWnf6769tG1vTJa53YeCN?=
 =?iso-8859-1?Q?3yWfW8rTGbyAEdlnfD+bPFA47c4TDsZPuMBhyWU7kb4mwuv+ORzY3dUqLo?=
 =?iso-8859-1?Q?8huZZA3i9xbBHJnhTpijgM9IL9BK58TZjTV5j/xImNbp/dHkhu8kVQIlce?=
 =?iso-8859-1?Q?38zWRtQl6PQ76P6xMiMX0L3XNdqnXIUaCdx7VF5gtcJznDhgAu6EBZdMD9?=
 =?iso-8859-1?Q?19JEUzPhbMagKeoCk/9jjVESBkAuSoCWgdWJcWHZKiN7F3680anrGPYzVg?=
 =?iso-8859-1?Q?fj9eaPkNZ585CQYjz6Sp5nvjYqn/9XoeU4MiIzxZuxcFg+VkJGh6i/pewf?=
 =?iso-8859-1?Q?JvNXPX8F9HosPC/lqsQ4AYAEj1PVDoExcOdY62zu1GymxL+hPdxhMmMc4W?=
 =?iso-8859-1?Q?f9Ulp6vXKzBaSFOhebL68x+b4N7IIH6gE/mLciwro6vbRyLoSHliK0NSpc?=
 =?iso-8859-1?Q?hl6rQl1bxw1t8qFUOORiTXl3IsqnG/bkxhBA4UtPss3Y6wRbAF+or+TzPJ?=
 =?iso-8859-1?Q?6tVnNU9jRtkt8zIyV7JElcmD4nqhvUl1iTFXHzt0SnKuE7MGcmV5WOA1Vp?=
 =?iso-8859-1?Q?5E4VMje3ArF18E6QtmtvDFvSKWYlMS6JRmN+eiohw7HovWSxLf4MXmKkzq?=
 =?iso-8859-1?Q?G0kU/qucCvGbRtlLQ6kMePerrP5cHGpH9XrgOTel25MO9nVd5AcSZrM9QN?=
 =?iso-8859-1?Q?JIi8+GbBHfWWYrmnsR0L7lRYfxUVhUH3IrgR35Rmb4GOwll8HPSxl5wohZ?=
 =?iso-8859-1?Q?vJHmPOFnGPB0QxcIziNcB0KbASsW426KeIlAIn35RL4=3D?=
x-ms-traffictypediagnostic: DB5EUR01HT146:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YdboPv2E6mSEflVwLer6QBv7lHQuB/9joJUiXlY0b2xZeO51wmeX6YqjsuzJWoQ67BshsgrUGJeUPnjJkripxBg014RvVirlfXo/vSff2po8XeKN33WgqJE63Axs5uD+/Slc4FWCqnF0z9qNrBHiakc7EPlilM5bPJIwszvTldaOgvshh/fRxxzYfvyVBoKT
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: abd31bfa-e09e-4ccd-004d-08d768a24a29
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 01:30:53.7774
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT146
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

This device presents itself as a USB hub with three attached devices:
 - An ACM serial port connected to the GPS module (not affected by this
   commit)
 - An FTDI serial port connected to the GPS module (1546:0502)
 - Another FTDI serial port connected to the ODIN-W2 radio module
   (1546:0503)

This commit registers U-Blox's VID and the PIDs of the second and third
devices.

Datasheet: https://www.u-blox.com/sites/default/files/C099-F9P-AppBoard-Mbed-OS3-FW_UserGuide_%28UBX-18063024%29.pdf

Signed-off-by: Fabio D'Urso <fabiodurso@hotmail.it>
---
 drivers/usb/serial/ftdi_sio.c     | 3 +++
 drivers/usb/serial/ftdi_sio_ids.h | 7 +++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
index 25e81faf4c24..9ad44a96dfe3 100644
--- a/drivers/usb/serial/ftdi_sio.c
+++ b/drivers/usb/serial/ftdi_sio.c
@@ -1033,6 +1033,9 @@ static const struct usb_device_id id_table_combined[] = {
 	/* Sienna devices */
 	{ USB_DEVICE(FTDI_VID, FTDI_SIENNA_PID) },
 	{ USB_DEVICE(ECHELON_VID, ECHELON_U20_PID) },
+	/* U-Blox devices */
+	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ZED_PID) },
+	{ USB_DEVICE(UBLOX_VID, UBLOX_C099F9P_ODIN_PID) },
 	{ }					/* Terminating entry */
 };
 
diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
index 22d66217cb41..e8373528264c 100644
--- a/drivers/usb/serial/ftdi_sio_ids.h
+++ b/drivers/usb/serial/ftdi_sio_ids.h
@@ -1558,3 +1558,10 @@
  */
 #define UNJO_VID			0x22B7
 #define UNJO_ISODEBUG_V1_PID		0x150D
+
+/*
+ * U-Blox products (http://www.u-blox.com).
+ */
+#define UBLOX_VID			0x1546
+#define UBLOX_C099F9P_ZED_PID		0x0502
+#define UBLOX_C099F9P_ODIN_PID		0x0503
-- 
2.23.0

