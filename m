Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCD31253AE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2019 21:41:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727872AbfLRUky (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Dec 2019 15:40:54 -0500
Received: from mail-dm6nam11on2087.outbound.protection.outlook.com ([40.107.223.87]:49088
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727722AbfLRUkx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Dec 2019 15:40:53 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7DPzU5TqXF15Y81Z4isJwo90N9MOpxOvmi1Rgr9zJBu4tiw/hpG6ikpGmJtZSnH7abl5FuZ3/dTlUni3OTXGu9k5yIy8DtqaDqPkc9xhboE50pj5JWVaPRo9LiZiQUgMURA5IcOaH68a6tCqr1qIstSpBTaTgOSS3KxBZMpuoAbsfCWhYev8YFx78ZDlcNgnerOlxh13+76CiSKgrLdMiobLlisKIexubuCCLmseUphANOYtpAPwDiK8NtiuSDGlhqM0X7tBz5WTVW+tsk5a2MdFgzr3j8T+thcuy54cbCLYmxAkIzHF/zoev0AZbyqetMpLzDqJH3C0+R9PS34kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDljiyG+zsio7lawlntEr2WiAGxlOrPQkptR1d3zu14=;
 b=It0YkypB/KQsPi0ZKPCHMTWDUD7+Y9dwdQKD/HP0fYBxpi/eEH14/ekAkk092EZyGMnqyZFflJjfh5HX8x0k80HweUAa3wpJ/Xkbz5an8o+oA2pVhfu5cpli8WPVaPt0iPJpB5j5qUt1lR/ZwLKbcCQif9P9Iw48LBRVoCIliaZBPglwb6vFfyowLPmWJFwnceWnRcGfoBCEqCF/EYORpLp6nC6plSSyT2hU+lKNoHfm2ypemeLASmgoeGpn6fdOKkMz2K299rWme7s7UjloQjSUw6hAV8xRUlTDnBm6/NbeMWE655bo+sSnUnzQZaYtVGxrthJDQk/Clis0vXGq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=silabs.com; dmarc=pass action=none header.from=silabs.com;
 dkim=pass header.d=silabs.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=silabs.onmicrosoft.com; s=selector2-silabs-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vDljiyG+zsio7lawlntEr2WiAGxlOrPQkptR1d3zu14=;
 b=jXODHwTrZKD/d7nAp5pLrztCPq1P0YTHG2nWBmhzuvnpE91OmMqKS1t1GkU0qjKrlIft6lDKPSOTvoeyZzPrpl1mAM3rxlyydk4sJZxzE2S9ThMThbtpLzhgLabPSh4SxzdhF+mi7GoaaKReKESdm7lgX9utEjjlOqvOFi0DUOg=
Received: from SN6PR11MB3312.namprd11.prod.outlook.com (52.135.113.78) by
 SN6PR11MB2576.namprd11.prod.outlook.com (52.135.93.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.13; Wed, 18 Dec 2019 20:40:51 +0000
Received: from SN6PR11MB3312.namprd11.prod.outlook.com
 ([fe80::ada0:e35e:7c5e:58d]) by SN6PR11MB3312.namprd11.prod.outlook.com
 ([fe80::ada0:e35e:7c5e:58d%5]) with mapi id 15.20.2538.019; Wed, 18 Dec 2019
 20:40:50 +0000
From:   Brant Merryman <Brant.Merryman@silabs.com>
To:     Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     Brant Merryman <Brant.Merryman@silabs.com>,
        Richard Hendricks <Richard.Hendricks@silabs.com>
Subject: [PATCH] Proper RTS control when buffers fill
Thread-Topic: [PATCH] Proper RTS control when buffers fill
Thread-Index: AQHVteNtIKJnOYRoCk2oBIRSFXPZ0A==
Date:   Wed, 18 Dec 2019 20:40:48 +0000
Message-ID: <4C7B31CD-2DD2-4824-AE67-9280199703BE@silabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brant.Merryman@silabs.com; 
x-originating-ip: [207.207.39.84]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57d467c1-7506-4acd-2052-08d783fa9176
x-ms-traffictypediagnostic: SN6PR11MB2576:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB257614BE9F7666073955C518E5530@SN6PR11MB2576.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:901;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(39850400004)(366004)(346002)(136003)(376002)(199004)(189003)(478600001)(81156014)(26005)(5660300002)(107886003)(76116006)(81166006)(2906002)(8676002)(186003)(66476007)(64756008)(36756003)(4326008)(316002)(66946007)(66446008)(66556008)(6506007)(86362001)(8936002)(6486002)(6512007)(2616005)(110136005)(54906003)(71200400001)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6PR11MB2576;H:SN6PR11MB3312.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: silabs.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7dPhjSPHbYuG1OlmD823ULDI9vf+xUYG11QFFm6au8ZsYOQuNpD0P9W6LNQ6Zls33aPf4uB4sGFqe00qWIZkgffG7NaREi934ReGFMueqRra8ibzoVVaIp0D19PNDfwytSybwq/rSkiskRczxFlVlDabaghbbTrtAl5CILAjCDS7mD8234qgQeDBcGzAwb4eYrBRpgSq3JggrmR0FfPsM3sB1DP8RuKUtMjNhTBD/vm+v4yEwtl5/TKIFvuxvbnAkBNzu+fdb6T58GOZAtvBeCGDPY3VEiEfOFn7Y+mNgOJA5XM3dYAupK6w6k4bia+dwAOl7vTc+rBLTWAO699pHQoYyLnDDKyCjSxwDo/kcHFLDCbW56hw/HjC9x0wkl5KqDTw7Wwqpd+UYdYnDcp1xMhTPqLlqMKcXxpHfPPmbKRAMI7gE3KXGU/z7trE7lER
Content-Type: text/plain; charset="us-ascii"
Content-ID: <633E45CD50DD5B4D9AA2CB359EB2FF23@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: silabs.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d467c1-7506-4acd-2052-08d783fa9176
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 20:40:49.5208
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 54dbd822-5231-4b20-944d-6f4abcd541fb
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XFhfI2OgbcQdwnNfLVg2t4RoPS0iuO8M0lHQ2GRl4zq+NaYe9AiZDTzABLhnj16zpox9qw2mRBStgPvol4p4jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2576
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CP210x hardware disables auto-RTS but leaves auto-CTS when
in hardware flow control mode and UART on cp210x hardware
is disabled. This allows data to flow out, but new data
will not come into the port. When re-opening the port, if
auto-CTS is enabled on the cp210x, then auto-RTS must be
re-enabled in the driver.

Signed-off-by: Brant Merryman <brant.merryman@silabs.com>
---
 drivers/usb/serial/cp210x.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
index bcceb4ad8be0..74c9f3822bd2 100644
--- a/drivers/usb/serial/cp210x.c
+++ b/drivers/usb/serial/cp210x.c
@@ -917,6 +917,7 @@ static void cp210x_get_termios_port(struct usb_serial_p=
ort *port,
 	u32 baud;
 	u16 bits;
 	u32 ctl_hs;
+	u32 flow_repl;
=20
 	cp210x_read_u32_reg(port, CP210X_GET_BAUDRATE, &baud);
=20
@@ -1015,8 +1016,24 @@ static void cp210x_get_termios_port(struct usb_seria=
l_port *port,
 	cp210x_read_reg_block(port, CP210X_GET_FLOW, &flow_ctl,
 			sizeof(flow_ctl));
 	ctl_hs =3D le32_to_cpu(flow_ctl.ulControlHandshake);
+	flow_repl =3D le32_to_cpu(flow_ctl.ulFlowReplace);
 	if (ctl_hs & CP210X_SERIAL_CTS_HANDSHAKE) {
 		dev_dbg(dev, "%s - flow control =3D CRTSCTS\n", __func__);
+		/*
+		 * CP210x hardware disables auto-RTS but leaves auto-CTS when
+		 * in hardware flow control mode and UART on cp210x hardware
+		 * is disabled. This allows data to flow out, but new data
+		 * will not come into the port. When re-opening the port, if
+		 * auto-CTS is enabled on the cp210x, then auto-RTS must be
+		 * re-enabled in the driver.
+		 */
+		flow_repl &=3D ~CP210X_SERIAL_RTS_MASK;
+		flow_repl |=3D CP210X_SERIAL_RTS_SHIFT(CP210X_SERIAL_RTS_FLOW_CTL);
+
+		flow_ctl.ulControlHandshake =3D cpu_to_le32(ctl_hs);
+		flow_ctl.ulFlowReplace =3D cpu_to_le32(flow_repl);
+		cp210x_write_reg_block(port, CP210X_SET_FLOW, &flow_ctl, sizeof(flow_ctl=
));
+
 		cflag |=3D CRTSCTS;
 	} else {
 		dev_dbg(dev, "%s - flow control =3D NONE\n", __func__);
-- =
