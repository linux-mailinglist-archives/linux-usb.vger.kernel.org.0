Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC8049790E
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jan 2022 07:55:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235779AbiAXGzs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jan 2022 01:55:48 -0500
Received: from mail-dm6nam11on2051.outbound.protection.outlook.com ([40.107.223.51]:57569
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229788AbiAXGzr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 24 Jan 2022 01:55:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2xY/S+u7SqhHsUE+PLw3eivmh6VOx4bQOUWfYn5GIzzFlOFzL0hdXeeFIl92KjSRaMWQAXCh0d7YDZ59n/9UttwRXLEps9sbywRaGidbEvp5C1Rt8lDGYGrEkJQkO2G2GgTlduNu3ztVSUlTpu4T93d2OaYyu3h0KSJfJss9qHx0QchbdGX5IO9eQaEa+xwsDDyiuxb7s7buyWAcw3YN2Q3DP9qB9AdHWnp12NGM1ALWV6Zkn+hOnX4WugGIjs5kFqz5/TImTRACm/U9FpMhJfO57FFws07pkYU9amOtuqCcuFPcib6D3uKWg5i5gnLizqa0R5s3aoC2xrBINV3bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S6VBScJqHdG8AbWQoPUYTuTbnJXIgqVnDSINd5ujMVE=;
 b=CTGLFhfySqH3Q2Kjc1yYyMFpsSknZI4fJoZ2gPpYgLVaq2nJlgEAR6HLsK1o7BIWrK2yBI1qRNgaOpyN1T42KsxeXFbUqW6Qw1D3rjHLlUIEvkHgm2+5yl+kddV5x8CgiQZQRFVF1v9xcCJTdEHh5eAhz6j7E65jOh0Vw67/MCDTPO/5XPO0Nkg9swxkjZOPQ7gQfoI280iIi/EWn9VcirMyXF8HpqwNW1sqXbYCF6eDtnXQXrGAugS7igdJsDQJy6nh4gd8AoYuISFrq/diSbn80zADoVZ4/kyP2SMjHa+SuB8L4uDisijRt+f1V/97gXvwQkSOVaI71aIu7nd6rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S6VBScJqHdG8AbWQoPUYTuTbnJXIgqVnDSINd5ujMVE=;
 b=adr5tboFxMGN/YnMk5Y8D4J6E80zhS0SW7B2Mb9/aTHf3ELP2kImmef8AHbPhw2sq7sk9t3Y/qukQ2RFKRrbtpBodZWOxe8v3T3lBLPlMT002rs4ZP1l4KKKkqAOt/M62XWIjQI+PaA0aZhaUVxOLaDqUI0QRo6qeubD4Qz61QQ=
Received: from DM6PR02MB4235.namprd02.prod.outlook.com (2603:10b6:5:a0::24) by
 BN6PR02MB2513.namprd02.prod.outlook.com (2603:10b6:404:55::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4909.7; Mon, 24 Jan 2022 06:55:44 +0000
Received: from DM6PR02MB4235.namprd02.prod.outlook.com
 ([fe80::c9d1:b3bb:8a64:899d]) by DM6PR02MB4235.namprd02.prod.outlook.com
 ([fe80::c9d1:b3bb:8a64:899d%4]) with mapi id 15.20.4909.017; Mon, 24 Jan 2022
 06:55:44 +0000
From:   Manish Narani <MNARANI@xilinx.com>
To:     Robert Hancock <robert.hancock@calian.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Michal Simek <michals@xilinx.com>,
        "sean.anderson@seco.com" <sean.anderson@seco.com>
Subject: RE: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Topic: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for
 USB2.0 mode
Thread-Index: AQHYDvNjAmjuHbEM50maPkpIkWficqxxs3mg
Date:   Mon, 24 Jan 2022 06:55:44 +0000
Message-ID: <DM6PR02MB42352135D31E17ED63A95D64C15E9@DM6PR02MB4235.namprd02.prod.outlook.com>
References: <20220121181841.2331225-1-robert.hancock@calian.com>
 <20220121181841.2331225-2-robert.hancock@calian.com>
In-Reply-To: <20220121181841.2331225-2-robert.hancock@calian.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xilinx.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 50743cd0-5206-4adb-9f2f-08d9df068b34
x-ms-traffictypediagnostic: BN6PR02MB2513:EE_
x-microsoft-antispam-prvs: <BN6PR02MB2513CB0038FD1A22CB5E561BC15E9@BN6PR02MB2513.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jHLRuX0IaoaoxrfSd12IGuRXDAb106zE/NZfeIkESjSb3rBrGFV3cZQ6za/0LEJw+UkY7UbmTM9BEqI6/aijOkdNCP0l/a4x0k5OemGLG0FSGnGu5DDjsjVUbZ0FFl9LVC6a+zXx3H6rVEfYyaAdg0Q0nGZ20eboGQQ82xNo82jd7AHPjK+FIeFB5rBU06zNA72z1ZpL7r/OZ50/uO3pW05j6HDriEQJUm3m6Z6l2Sr9TjdhTDBb1mqCoBWO7D6Bl9nu1kCcN7uHDMwXq6DxhYIn13cm5SOSZNZCiMDmkJL4lRA9eMSfSF4ciHh7ocQDGWE5TSKfnrTRvGJY9sy03twjPO+zFiILWYwm+tT7a0JTl8O6CIDd6F0ycon6/q6nk3vUpjiLWn7NVZh3+gLZ9i7tvAugjZekZjYnf+aojW8YwtMIHiI5q0O6MQGIO/6iqMxjYTyV490GdVRP1Cbdvr9/MKDSIGlAV7IuvMeSpkzeJFar/iHdOlCBEMcbQzykmgZ0ujrcpfzQU3rsgNdfujPX7RicK5+sawmN0KPHVL5WWwoovkGX4R9f2kJPw9sPuOJ0c2eYx4nLeo0JEx6l77xaKIEWzaKiGsGa0bSxx4G7e3/BrPtVOnMhEjFeyHXbhq5HjjRONV9a3U5QbpktqtV8Rl7FV+gGHospOmxS0iq5GYaxUuXiLEOj694sT2iKw4SqMWnhUGggNqB2jfJ7+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR02MB4235.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66946007)(8676002)(4326008)(55016003)(33656002)(186003)(508600001)(44832011)(6506007)(66446008)(8936002)(64756008)(54906003)(66556008)(110136005)(316002)(7696005)(66476007)(76116006)(38070700005)(52536014)(71200400001)(53546011)(38100700002)(83380400001)(122000001)(5660300002)(2906002)(9686003)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/7wySLJBCL3EvcjM4rT8o+Nnx27jGvclw5BfGl7oqGePVt6ZjvQbnyl7VC8i?=
 =?us-ascii?Q?9+QVYDMeiaDK5cLbu6Fn2d2bK8zKZPsdxY0kuBvvjqQvf5M2kD3HjFKP1mLG?=
 =?us-ascii?Q?Fvjmgj8JkzGUNm2r2fzamGNf5Nrcq/AHFJpwt6g/YWgaDlysVoCt2BjBV9W1?=
 =?us-ascii?Q?gzOWW5JG3hy+/JiJZbfxGo3qqTw5Jzry8qLiPGXhJohx2VkQT8Ui1h2PrLtb?=
 =?us-ascii?Q?Sr9IVWm2VNdnVRISEjrk6dYNsxkQFboJ3w+PKqqAhrXxzHN/F/VCZWSwCxY0?=
 =?us-ascii?Q?SOb0se35n8rY3stW9Tjzxkms+oo4X56+t0h9Uat1DkNF65emBa6GsPMqCVZf?=
 =?us-ascii?Q?7pOiGL7CmOjI8zGaXeNjzDM6VsqN5welD56y91Nc6uP5ywuXoO5b0fL80J6+?=
 =?us-ascii?Q?yQxr43RmIto0ZHXjC+UHQog6CxNwMpQhymYbB8gIMpKSR/y9XqcunaX2P7+E?=
 =?us-ascii?Q?035dZV6OcoeiK6RH3Sq4WKxRoNIxcF4BntE76WRchF7Td5nwm12LmUQ42RWW?=
 =?us-ascii?Q?vSiyrUjyD52NYehtoMzA6C2a61nagsvwMd+DtIv+zY6ob83z4uQpEd+N1Q04?=
 =?us-ascii?Q?N0E1xeVfSjXmQveec+NIQocL9xe26CuU2V5gD8EkxswSujKTF1rXvEoGkRgz?=
 =?us-ascii?Q?4N+fA9Mf2mNtWUHas6uzQvMclS6UUuV+NzSX4XJiyPMZUoUT9ZyiPK2/yIIl?=
 =?us-ascii?Q?gEVsD3SU5PQEV0b6Oemb1x7GmnkIVAq626DtbR7vi+SZQ+U7XMFSQkU2WvwZ?=
 =?us-ascii?Q?aybxN3VRdQ21X/OAu5FLoi3dC8ycBG1OwNdWLq7OcctwJBCtjk83Wv5ZnZH1?=
 =?us-ascii?Q?BfQYK9G/WpNt/bOjn4fPJ6o0Il/QtsGYnvdpaf3Zx3hfxAfk3rFXJ3ICo11J?=
 =?us-ascii?Q?Ie1NZ1Rg7qkTJ5WBJCRwvkCv7H2veF8QVJkRItFWkRQhEi1PP4QqW4A1t+ow?=
 =?us-ascii?Q?WZ7ctqek3xT7F/kiXHnLPaNQsv7pZaigQ8wvQen3gvO5gRKYxVPgbnd/wdc8?=
 =?us-ascii?Q?zJYwecpXIE+10J6zn0StN4WdbJ3AboPGsvNrLBBySn78XGF2y2ne4Pag3bxA?=
 =?us-ascii?Q?Po5W4kEaEb5obGQs+iRj4i23KJdbSSY0R2XyJrxoXZkjoFDkuTqorC9IKuvp?=
 =?us-ascii?Q?z8xlP+jOyimZZdfgSxKeRzd0TwA8UFgz0YkNkJMTHWiABUNVR0PH8ewNDoK7?=
 =?us-ascii?Q?fufhSizJMOwbBO43iPpjaYP4O2kEJY7kurwdvmdycpY02AThIGc44+wZW3sO?=
 =?us-ascii?Q?Z4E+I2HcocbIzpFQCYENtQxD/jOvefubNHw27q5T6Om/GWemIQVwcvnjkIJE?=
 =?us-ascii?Q?GrLHWe5Z3VptvcdrNya/R8G5KeCP12DJgteVuIgXkMUO21oZ5Kq0k5P0kVMa?=
 =?us-ascii?Q?RGaOG/gyuQs26vGSxWcO1uW6uUzypNyGcBFkqWvhn9Cy9W2c/6yZtWnpI6xj?=
 =?us-ascii?Q?3ETbwX9hMv9ehIqT5jjaWTW3a/cxk9IFIhwtHmSQBVEmqZffoj4yu5Yb/Jbw?=
 =?us-ascii?Q?joUerUX4n1qT5j+8wCy6VkBnV0IpIdh5LqqGE3EztQ4DH0Sw1+Ev3OVKqzIK?=
 =?us-ascii?Q?LBOebe5qmnv5+pxZLD3hlyh93AsbsH5Y47ocu/ScZ3gTeBPFy4s9lx0NNUSs?=
 =?us-ascii?Q?UGcRO7wCEsZR4yTZpQypqQU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR02MB4235.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50743cd0-5206-4adb-9f2f-08d9df068b34
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2022 06:55:44.7290
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zLWqsEizaxGDCvz94O6nsnzCE8vnS6+xlFhYyD5Xvg9c2f+LR0pvd00WHkRr5P6oZb+IcrD5zIS7La6cMekpBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2513
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Robert,

Thanks for the patch! Please see my comments below inline!

> -----Original Message-----
> From: Robert Hancock <robert.hancock@calian.com>
> Sent: Friday, January 21, 2022 11:49 PM
> To: linux-usb@vger.kernel.org
> Cc: balbi@kernel.org; gregkh@linuxfoundation.org; Michal Simek
> <michals@xilinx.com>; Manish Narani <MNARANI@xilinx.com>;
> sean.anderson@seco.com; Robert Hancock <robert.hancock@calian.com>
> Subject: [PATCH v6 1/2] usb: dwc3: xilinx: Fix PIPE clock selection for U=
SB2.0
> mode
>=20
> It appears that the PIPE clock should not be selected when only USB 2.0
> is being used in the design and no USB 3.0 reference clock is used. Fix
> to set the correct value depending on whether a USB3 PHY is present.
>=20
> Fixes: 84770f028fab ("usb: dwc3: Add driver for Xilinx platforms")
> Signed-off-by: Robert Hancock <robert.hancock@calian.com>
> ---
>  drivers/usb/dwc3/dwc3-xilinx.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/usb/dwc3/dwc3-xilinx.c b/drivers/usb/dwc3/dwc3-xilin=
x.c
> index 9cc3ad701a29..dd6218d05159 100644
> --- a/drivers/usb/dwc3/dwc3-xilinx.c
> +++ b/drivers/usb/dwc3/dwc3-xilinx.c
> @@ -167,8 +167,12 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx
> *priv_data)
>  	/* Set PIPE Power Present signal in FPD Power Present Register*/
>  	writel(FPD_POWER_PRSNT_OPTION, priv_data->regs +
> XLNX_USB_FPD_POWER_PRSNT);
>=20
> -	/* Set the PIPE Clock Select bit in FPD PIPE Clock register */
> -	writel(PIPE_CLK_SELECT, priv_data->regs +
> XLNX_USB_FPD_PIPE_CLK);
> +	/*
> +	 * Set the PIPE Clock Select bit in FPD PIPE Clock register if a USB3
> +	 * PHY is in use, deselect otherwise
> +	 */
> +	writel(usb3_phy ? PIPE_CLK_SELECT : PIPE_CLK_DESELECT,
> +	       priv_data->regs + XLNX_USB_FPD_PIPE_CLK);

When USB3.0 is enabled in the design, FSBL will set this bit to PIPE_CLK_SE=
LECT
And it's state will be persistent till Linux stage. When this driver finds =
the usb3-phy property
In the device tree, it will again set this bit.
But in case if the usb3-phy is not present in the device tree and design ha=
s
USB3.0 enabled, then this will clear this bit and ultimately it will fail.

It will be better to skip touching that bit in case the device tree does no=
t have the usb3-phy property.
This will skip the whole sequence of PHY initialization (reset assert/deass=
ert are done in order to help initialize PHY).
Something like below should work.
---
        int                     ret;
        u32                     reg;
=20
-       usb3_phy =3D devm_phy_get(dev, "usb3-phy");
-       if (PTR_ERR(usb3_phy) =3D=3D -EPROBE_DEFER) {
-               ret =3D -EPROBE_DEFER;
+       usb3_phy =3D devm_phy_optional_get(dev, "usb3-phy");
+       if (IS_ERR(usb3_phy)) {
+               ret =3D PTR_ERR(usb3_phy);
+               dev_err_probe(dev, ret, "failed to get USB3 PHY\n");
                goto err;
-       } else if (IS_ERR(usb3_phy)) {
-               usb3_phy =3D NULL;
        }
=20
+       if (!usb3_phy)
+               goto skip_usb3_phy;
+
        crst =3D devm_reset_control_get_exclusive(dev, "usb_crst");
        if (IS_ERR(crst)) {
                ret =3D PTR_ERR(crst);
@@ -188,6 +190,7 @@ static int dwc3_xlnx_init_zynqmp(struct dwc3_xlnx *priv=
_data)
                goto err;
        }
=20
+skip_usb3_phy:
        /*
         * This routes the USB DMA traffic to go through FPD path instead
         * of reaching DDR directly. This traffic routing is needed to
---

Thanks,
Manish
