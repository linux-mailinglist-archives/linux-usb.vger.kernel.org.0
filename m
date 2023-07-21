Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B7BE75D15F
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jul 2023 20:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230445AbjGUS0a (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Jul 2023 14:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230404AbjGUS03 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Jul 2023 14:26:29 -0400
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on2073.outbound.protection.outlook.com [40.107.15.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C89172D71
        for <linux-usb@vger.kernel.org>; Fri, 21 Jul 2023 11:26:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jMY9vYyWMiiltlizq+mXaNKiUwtk2J5pK5BBlNbsffaUpSBABWz+GE1QDwPa9R5jyRgT+Ui9b6mR5m85txUCT+sfasXjUs2FzDJmnDhG5iwyPeIwYK+Viw+N+hujJVtlEyCDFhNJpnvivrXKiscc7e2U04yS4d+XAqDp7O3Icyqb+LzW9jVwmW/UGImwDl+YVg33VXPca1FaCqBumkYuWp92sOidoQw6Ne9goD7S8k6yksOB+yIjxvh1ULHBJJvFzR+YAwvaFoLAYAOC6aKSxHfpxlf80dpjYU7w3wf/0IvDtxwzmcS+HUAl5LhykZycAU3jugCC4EV1SSRRNHHW1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4GzqI2SMozCTL25KwrZpR68GKEhtRXM/je8vdUI1aI=;
 b=eZL6IJ8UNxYz/wW0MGD2VIzc/JerUD+0MIX1wl3IV5QU2aU0N6ThclBqgo+i2bc7jDyblBSxw443qCDu/s14+HSCEvVEjdibP3o2rRwsFJOA3b2jT8hBxSaHS2gXn0aphJOV5wEGkMF4dVG3vPaohGOoprvE1P4gR7JKtyxENAp4oqb0jq7218lj1j5h43gu6AuClNPlsnZyurpTgpcd2TZx9iwN6XJytaXjF4Z49TwADPOyjquq6JyDkmo6SQrMQDJHG8cdmpPpkAcupiy1em1JVzdkN3cUHgqNiU9v16PMtvvMRVcsO6IhU9rKXQDJRUX2iWotXMhkR6LekuWX/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4GzqI2SMozCTL25KwrZpR68GKEhtRXM/je8vdUI1aI=;
 b=RmPnfUK8jFvb/9SQeKV8nndqt83maLZINb+baHSFwcFJIuUTJTkKoQ7rPiy5n1GX8IEB68ipnKqK/Q+DyvRREmHZ4CR8SOpaKZ3e8XSBqx5Y/c+Ok5QOTZReOkNBWPrFeJTm23yL9TClHzdV/BB/qGfbteZhEsg7HchWm6WMwA4=
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com (2603:10a6:208:12f::20)
 by AS8PR04MB8593.eurprd04.prod.outlook.com (2603:10a6:20b:424::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 18:26:12 +0000
Received: from AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687]) by AM0PR04MB5764.eurprd04.prod.outlook.com
 ([fe80::176:d0d2:340f:7687%6]) with mapi id 15.20.6609.026; Fri, 21 Jul 2023
 18:26:11 +0000
From:   Martin Kohn <m.kohn@welotec.com>
To:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     Martin Kohn <m.kohn@welotec.com>
Subject: [PATCH] USB: serial: option: add Quectel EM05G module support with
 product ID 0x030e
Thread-Topic: [PATCH] USB: serial: option: add Quectel EM05G module support
 with product ID 0x030e
Thread-Index: AQHZvABp8GNR7A2gUkm75lXf72vIlQ==
Date:   Fri, 21 Jul 2023 18:26:11 +0000
Message-ID: <AM0PR04MB576480684AA0896B32D32975973FA@AM0PR04MB5764.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB5764:EE_|AS8PR04MB8593:EE_
x-ms-office365-filtering-correlation-id: 4cc2f488-c35b-496a-c865-08db8a17f5ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FCNbhOhT5hSGVNHrqSD05PlnRdlT7zDGLqUKsizQplKwrCD10JV/H5mYEElicYCiWiMwk08psI6g5o4uyyHUnsBAL9Pdasfrjsly7D9ia0E5CbAJM7X041XR/zAtuN8Vcj2AdTGYL2KyzhazFqX33FM6NI9shKcVl8YeHM+2L2EEyP0p4XSaQTloGizdbn2C2vMWNe2BJcQVLJNWVGv6KmiLxzjISwBNs+t4UaKX+vPy89IXvWvpx3HKffgHWy0n+5LzzhlnZ9HThJ8LMfqwXCprUigsyZQsWpsGO/qhK2F+2+LjBvOMMtGiJpyAqBZy8JbXnsNfX1lECyokWm66Ehp9PrLpz1KCFt7SXNB6qiiXZ8sRpybQRD/OWfA/vWTSuG4UwwHjBPwDn/V0Qb/j1e03SElv0oomMByw95nCHdCyPxmU2MFs5G25+7rdoY1wjhY+ePAFgdHdz9JMD0A+XHS/QEFuNqk9VHDggtZ0Kw7pzDkTNCI9G/kzPkprXqDomOBQMvKH6r3GpCkS1fBZik7XJt3tMYnjziExIs8vlaGvubqEpvPIjYt+P1YclBNH10hD/MSoGvNBlzMriqplqNhI1jrBHvCFGxQGgWMOE14wYPb9EWI5j+BWCRzW4F3Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5764.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(346002)(39840400004)(366004)(451199021)(55016003)(107886003)(6506007)(26005)(186003)(8936002)(8676002)(33656002)(52536014)(5660300002)(41300700001)(86362001)(2906002)(478600001)(4326008)(6916009)(38070700005)(76116006)(91956017)(64756008)(66556008)(66476007)(66946007)(316002)(38100700002)(66446008)(71200400001)(7696005)(9686003)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?hZLR09yEK0xUjbmnlnjulZBuP9dPtOeX45iQ+jokXVRFUxQHes/rO4MSkp?=
 =?iso-8859-1?Q?QaepMT2RbOzdz0BZT0wXxHHcqkdiE67xFauLH0W+rHOZNZNohAEvAn+yz3?=
 =?iso-8859-1?Q?n72RYunv17RyABIEXSrrDD3ff6OXKzffZVVHhfkKeT17v74Z1KQBbsticL?=
 =?iso-8859-1?Q?Ju6LXwLqdwRrEjV7zHOgeRQ20DRlXDovU/Ty6CUM9s2F48qc2qi1NneV1E?=
 =?iso-8859-1?Q?qNJoSSEKm8zVl0SH+n/IjJbWIviXM1DzxJqlMneRGo17bJ9XrGeV5avRuF?=
 =?iso-8859-1?Q?tL0XLEQQ1zEhywJ3+8lFJGUXafQ3Fk4oz3/aBPeWlDKnFx+dKXb1x2eeGo?=
 =?iso-8859-1?Q?QxERzUyfz4CGdckYh/j5T72PS0cf+EUPJhTXmRtuI8qD/P8U2M5RQM+OAq?=
 =?iso-8859-1?Q?ooNEm2+9mybJQWvP6m18HHHLaVL9ZNXp/aC1kPoAnh4pTcfMcxxsAwmSt4?=
 =?iso-8859-1?Q?wFLupjcDAudD6gOg1XSzVApbHuMNARrXSXoEwP9R4Uoo9ZEP58FTR57g69?=
 =?iso-8859-1?Q?50Rtz2D7GSvPrUpAL7TujkrRryIc0fVHexzQJHIwt/C/Igcu5xVrSPXPxN?=
 =?iso-8859-1?Q?jA4+vc/luuGQpMp5Ycz6C8uSYAHfVuCv8vEeyZG7kV3e76qy7z61+7X65e?=
 =?iso-8859-1?Q?a1y/u7gzjrDOC3ty1C0jBKVkPFFtZmUZfUWxq3qoXtbTQXiEBPYKPZPSmZ?=
 =?iso-8859-1?Q?4SyWTga7WqoDrHtbO2d9A41xUABmXS754tC6YJrirSOsCNs/EfC+hXruJ2?=
 =?iso-8859-1?Q?Hz3J7sCgrBuNHOojEQwsegjVm8uAI5d4cc5hCwXXTU4VP5jmOQKG4wiqQ2?=
 =?iso-8859-1?Q?CZd1fzhpaJKR5azfwzlU4EECnfUG5uSKYpmyoU6obtStBioYeS6SvDxCOl?=
 =?iso-8859-1?Q?dmx3VS+idBzT8AVVmMx12Yu0Etg0/9yhTD/5Spl1JSN5TsB5LC1krP1Eo8?=
 =?iso-8859-1?Q?TbRp/LMiSron7xVJhuoO3TFYNgrV2oALrc8RW60gmXMW00CjRXT2pPokSn?=
 =?iso-8859-1?Q?DnAtA7lUXumkQ/OXXcAsrB9okZKsNwE1z4KxRuW1SMWXO+Dt6nkRmw4h9o?=
 =?iso-8859-1?Q?YfAvMN7/Vtc0eIS0nD3K4hxUQf1Z9JWs4KKYRyjocXBbsg5KC+4igYTkLM?=
 =?iso-8859-1?Q?GjAxwjePz6VGRv0tioAoCHz2Ris4beWzXZSHyngUNM4TBOZpGM0FH7ss4z?=
 =?iso-8859-1?Q?b8tzaHazvq7t6/IQ1VdZW5bbxFw+qbmXuZZ2d4+0LZmn0W7E0162f6ryxv?=
 =?iso-8859-1?Q?3/zLdx1j8otM2g/tK4QF0nqaVQ541lLTDNZY0XkEbaHUsHKlNUDeLEtu91?=
 =?iso-8859-1?Q?ZXX2DmH9TFUGPEm876n72YF1nvPXBjNL7EC1ouIlSNMoPQqXpTghSvM5ZT?=
 =?iso-8859-1?Q?EK0GaongaWKU9nmzus1/QbUombKpZPAnvrSA8uDcJu9bq41anGFCGIS3ti?=
 =?iso-8859-1?Q?sA8pjxOegL+6FcpTtMS1v8Xmwrr2SX4z3ic/pdGFwgrIAAZi50CMFh2/XQ?=
 =?iso-8859-1?Q?KninC6rjY2VqIGZKYXbRwAwrT5j3+NJ9X0h8WsNBtBtsCuq9DIK+0Ha6uh?=
 =?iso-8859-1?Q?zSXr0f3WIh7YGUlJfGHIzwrci5Gr7+SmO1HXFFC2oYFzZPlro+NFc35ZyK?=
 =?iso-8859-1?Q?eGI0m3PPCvaw8=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5764.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc2f488-c35b-496a-c865-08db8a17f5ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2023 18:26:11.8665
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bRWjAFViV3NrDFBgkSoI5jYKvrW41HB5s/zi4awW1qFPv62gUHDnRseusJVF3XoNF/TyS7+fuQJnwY5XTw6pFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8593
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Add Quectel EM05G with product ID 0x030e=0A=
=0A=
T:  Bus=3D01 Lev=3D01 Prnt=3D01 Port=3D00 Cnt=3D01 Dev#=3D  8 Spd=3D480  Mx=
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
=3Doption=0A=
E:  Ad=3D89(I) Atr=3D03(Int.) MxPS=3D   8 Ivl=3D32ms=0A=
E:  Ad=3D88(I) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
E:  Ad=3D05(O) Atr=3D02(Bulk) MxPS=3D 512 Ivl=3D0ms=0A=
=0A=
=0A=
Signed-off-by: Martin Kohn <m.kohn@welotec.com>=0A=
---=0A=
 drivers/usb/serial/option.c | 3 +++=0A=
 1 file changed, 3 insertions(+)=0A=
=0A=
diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c=0A=
index 288a96a74266..cbe35c3db45a 100644=0A=
--- a/drivers/usb/serial/option.c=0A=
+++ b/drivers/usb/serial/option.c=0A=
@@ -256,6 +256,7 @@ static void option_instat_callback(struct urb *urb);=0A=
 #define QUECTEL_PRODUCT_BG96			0x0296=0A=
 #define QUECTEL_PRODUCT_EP06			0x0306=0A=
 #define QUECTEL_PRODUCT_EM05G			0x030a=0A=
+#define QUECTEL_PRODUCT_EM05GV2			0x030e=0A=
 #define QUECTEL_PRODUCT_EM060K			0x030b=0A=
 #define QUECTEL_PRODUCT_EM05G_CS		0x030c=0A=
 #define QUECTEL_PRODUCT_EM05CN_SG		0x0310=0A=
@@ -1186,6 +1187,8 @@ static const struct usb_device_id option_ids[] =3D {=
=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G, 0x=
ff),=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
+	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05GV2, =
0xff),=0A=
+	  .driver_info =3D RSVD(6) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_CS,=
 0xff),=0A=
 	  .driver_info =3D RSVD(6) | ZLP },=0A=
 	{ USB_DEVICE_INTERFACE_CLASS(QUECTEL_VENDOR_ID, QUECTEL_PRODUCT_EM05G_GR,=
 0xff),=0A=
-- =0A=
2.34.1=0A=
