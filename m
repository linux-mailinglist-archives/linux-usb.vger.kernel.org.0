Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4455112B0
	for <lists+linux-usb@lfdr.de>; Wed, 27 Apr 2022 09:39:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358959AbiD0HmH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Apr 2022 03:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349001AbiD0HmE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Apr 2022 03:42:04 -0400
Received: from CHE01-ZR0-obe.outbound.protection.outlook.com (mail-zr0che01on2127.outbound.protection.outlook.com [40.107.24.127])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38430E1276;
        Wed, 27 Apr 2022 00:38:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuytbTgIkus9+izS5gLHXBEZFwWTGKa1+dC3mpZ55kpOEQBUZdimkQRZVF9lDQB0Nfo4GNpxHhGtsd4fASPUkFc42qVMPoruazAKy0Yjar/PaZkQTCSmwgVEj57pV7ba+cFZtSHBjzIzx9I14oN9VeE/gqW4uG87liEVZzNQRfZsaL2QlUa5SIQTd5iMzcc0cwH7atMWbzLjvILOM8hDFl7LJwoRYOIgrBG9khyOX29KDugiFBkskGssieib/LZEn1ZusbAo8vuPMEJmLkUx7676DjbTSSE/tH13T59dIWg5NGMJHrW9fmncBHVOMhbUpQ6fw9JJtrmU6MkwVFOB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o6JVatuINtWJ+jvVlqXYvu3WsoHQJuv7zNN6y6/KReE=;
 b=R3DjX+8Z6fXL/aGUJQiPrjldlmX1qQVTgdpMmZvImNRlbmgHkuQG+b6kuBnyLeZ8MZwqnQ0QVNT51D7yXh/+SYeW9jLAo/0OnP3BxyDBI0zIPb8EcR2rPv6EwlzLx7CUnjPONwqiUTa8gYxktsafoT581PyoOlCSbhENrX+EdneKhm00wgLIfcoktnGNE1U84NNerm6qIB5x0+m2epDJcV1ANElSP6QsU/ycosBQq2DsYf/Yum7l+I5Enbl8YfBc6lyOvub43oSchi8twyLSZ0ynXblGdOhCS0kDEryjip730H5sJK0Myv7X4hSaGbHk1Cwny7U2qJ5MZvHLPf0eoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o6JVatuINtWJ+jvVlqXYvu3WsoHQJuv7zNN6y6/KReE=;
 b=Bc7MmFmOmkdzP9UmjuTZrLUkffVRy4snqw4MyYgpyx2N4y9PtOpJjUCdY7scHsN0pIWQmtx4jcz4Ou/tcmkMahzKAUL2kYN2PVeiFPB7m8U581yNfYlxMyLhhrknn0xNzLrQ4AGXoeq0in5WQ6Zeipoo0Rn4Ikx7omor54JsDJYB8MttOkv0jd4Ceq9llLwnxGzDGo/BrIVo88zLTVeZcwljBVCfw7EqDRqnbi7U5jgosh3Kr4mgrXEUB4xw08d1bmq8unaUI6DC5D2o/J0lxyOm9aqekhxaElslWvjQs12HTi7LjfanTM7/JNSTJcqpk6Ig4ZaGyrKwFf4I6N/mZg==
Received: from ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:4c::12)
 by GV0P278MB0401.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:2d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Wed, 27 Apr
 2022 07:38:51 +0000
Received: from ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f4a7:62d3:f7d7:9920]) by ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
 ([fe80::f4a7:62d3:f7d7:9920%4]) with mapi id 15.20.5186.021; Wed, 27 Apr 2022
 07:38:51 +0000
From:   Richard Leitner - SKIDATA <Richard.Leitner@skidata.com>
To:     Daniels Umanovskis <du@axentia.se>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] usb: usb251xb: make power-up reset delay configurable
 in device tree
Thread-Topic: [PATCH 2/2] usb: usb251xb: make power-up reset delay
 configurable in device tree
Thread-Index: AQHYWWnzV+IHso3f+ESn6dFHR5gEIq0DYNmA
Date:   Wed, 27 Apr 2022 07:38:51 +0000
Message-ID: <YmjzCyRM3xIWpOXx@ltleri2>
References: <20220426123329.775-1-du@axentia.se>
 <20220426123329.775-3-du@axentia.se>
In-Reply-To: <20220426123329.775-3-du@axentia.se>
Accept-Language: en-AT, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c1a96bdf-8627-4093-eae6-08da2820f996
x-ms-traffictypediagnostic: GV0P278MB0401:EE_
x-microsoft-antispam-prvs: <GV0P278MB04014BB59907F8D1912F0830F0FA9@GV0P278MB0401.CHEP278.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0ZCc9IPN6r1GE1iigkJvi9W9hbAu487OvdvY/qmQ9iZzSwmqBvT3on3GG52vNZpZQFwxRK84EYpHTgtICfl+nlzj6EWrJ8jNhKDjP9sOQ4Y4f19ivfPYhUZYEIKb+wLVqw/eQuQYNWYURxCXnQQjL8EyBv7+EV9Oxaal5kV5Ljvlx1aF/yuc3ikLZ2rCST41D6Rj37LQ6W8YOCKOjEqXirChdMJQCkY9xEXk+7KhWX+UsBTgix1bWT9Iwlcvcu9ofDH/+wkbl/uvzSTki4BK/26Jvu4qlpxExJNeYR3SNpJUmVcBOtASdqCGztwn1TOzpOjJ7y0cbvcE2gqWAZ1NSZs5zECQ1iTxMlL8DdjgyKbLFFyayLZQSBSG2ytZ8Zke6m8kwiDwzQBqyXf7dcWyMrQdC9O5CpHwY9SUfD99RowX4TCWKADRVmHT4IfbSkGtfHR3EgDrG3boO8tB6UpiWxrFtNpWzMxa9DLB9h+zodjRO73CcT8NoxUrSVhhJeH5HzUhHSsrzuwFl2mKr75xtcxqVRC67hKyDKJrK9FtBxDl8y0dYzyRXMvxBKxiNnCLhkyf8JeV4bfK58F/b0RWMu3AMMS3Xzfq9o26uw4xT0yJAQDrWbf1pveHNCr/c39tMJxhOAe9AU/0J61KnyfpVtKTNcFu5Gg7Skighqe1zHDLEx/CY+VWJNS3mMeMjeNihknhRO+QdqsKjNF4Bn1XA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(9686003)(66446008)(83380400001)(186003)(26005)(6506007)(122000001)(38100700002)(38070700005)(66476007)(6916009)(316002)(54906003)(2906002)(64756008)(8676002)(4326008)(33716001)(5660300002)(66556008)(8936002)(76116006)(66946007)(91956017)(508600001)(71200400001)(6486002)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?TBRx2pmVpDwcIo2szvyYo1IO/QEf6fQ+yEcal0zqlqVDG/zhHFIVNT0IVqmo?=
 =?us-ascii?Q?Za2ARsTBD8JcL3CBvBRxbVzUoglEw2HEictgNcIMFjRpkRst0/Oscq1gNdA0?=
 =?us-ascii?Q?tDhn5M2gcHyWWHnu1EvBtzxvPo6kNNfXYAUZs22g4MaIUTxIPXS3ceLR4lSl?=
 =?us-ascii?Q?9iEpNecHGnozaE/D2pGqFANaPEcXMhUMhKdcn/THb0Zj+rbLD0YQriKNdHzQ?=
 =?us-ascii?Q?95tA8RjNmdV1M90Ql80BU1JaO+hFgs+WmO+MzEXHhaXCoLM1kmfAaPP+2qFy?=
 =?us-ascii?Q?uiga2CfQi2/NKJn+e8OfwPcgN2IHG1KNG1+sKPsi0rL0WzTrr2Z1RE25hO3w?=
 =?us-ascii?Q?Eayc5YepmecHubfWXJPSiPoU/owBaD31iPiolLs52Ycr0uXC4S/Pi9ovKS3Y?=
 =?us-ascii?Q?meZPYPXAkCLyPVHw00ngLE/WXjLkzLFtA8lgX2lt0eSdOtJ29yj630Xm15hs?=
 =?us-ascii?Q?LyPBNjs9pNrYyOqyPGPFgWzGPVNcjry1q3V/dDhyORR46wBeWXhB3U0hNJSm?=
 =?us-ascii?Q?zIk8OydX1FwusO+Lt2zXJyz5vP2b+TpmyTN5/4CwEQgRmVb50ZFT8OYmi686?=
 =?us-ascii?Q?VWzVTlk843PQDnfnQbTcvNLv8yNCzXVzEH1KTwkbNjestPq6TcCr86CjCUqs?=
 =?us-ascii?Q?O9Z1Lccgz4p6tHvdg18RG4Patdbz2GoFI3ih/TKJQxr2W/NBuz+kq595d95p?=
 =?us-ascii?Q?GZcKxhLwjXFQVBSnzhepE/qQcq+nBKFjL7Bz+lp+DuGmMhgftcNEKJiyWLOY?=
 =?us-ascii?Q?43fVDCBkVLXUvDGB7fxhDx5GlmeydeKKsD9onddiFAbstHN/3aaH1s86uJWV?=
 =?us-ascii?Q?ZoIK79t88MJB9xIkSf4/cFxbhLde8xTqNcpQzIUSs78DHJTKnmjvwDFXKj3t?=
 =?us-ascii?Q?OkEwhNK4VxR/XEkLshvXmJkzHxcBojCoDi1iuRL6AZMJHkseSGCz19C/AfOF?=
 =?us-ascii?Q?Lh47Ou1X9lT4e6ZB/QLLOtppwb7utncY0z0q9NRSw/4TlPa8ZbTIwfyrWneY?=
 =?us-ascii?Q?5fM8ufXDZ42BpJrK52hUjJ0mNt4u3gA5pIZGXnnjdgxRpYzNv8YhTY6CthMC?=
 =?us-ascii?Q?clDBxyas8ZbrUJ9HjaM8VH1x+T3yBO1+mnfQFN2Y+jAb17Zh7AgQpQiMmnSS?=
 =?us-ascii?Q?Wa3CoqdEKhT5DsTvQ0fe/ocvU1vt6vfJDbd2SvCK5jrbERBrJb8C2W+KsrPZ?=
 =?us-ascii?Q?3RXrpS48EiyS0KbFS1fPoPCbLD4v/QJgsac70vEMB2+QwFpxr+wVu9dIYHYG?=
 =?us-ascii?Q?s8Z/FbBXSsnxCXsnaMhDDKa4ndQL6EpVudfYTEgFBuaue96+5pq+XV5HEsa3?=
 =?us-ascii?Q?98wMV0HC+FL0Wh0R/DeAzUE1401pOfChfFFIdJwIx63BFrrPScGaOkt4aoRl?=
 =?us-ascii?Q?tbY3YzBh77BXcQQIIhltEaENIAdXAoJqBGkFYY95l4tKFmFooPQx1X3Gv0Za?=
 =?us-ascii?Q?Jdbfd6kesfXUmqASn4xHD1Mk6dWBdAcVXckg2B53Lrfv1BlnraJQcxuGNDiC?=
 =?us-ascii?Q?+8HRngTn7agjtQCdcrRy3Y+U97Yat0ZuFp58NCclcrAWHzvjjwe/7n7dmZiA?=
 =?us-ascii?Q?gsJ+llHzpWiK1Y4/hPanQyxcPS2wwZMdMGklUo+xWP3TwP/N9lO5t8lFqXi0?=
 =?us-ascii?Q?remJN96HYwT5Dd96AbjV3tUk07mrxdF6I3aq6mPc3iC83+h4auhB0Oo8Z3uW?=
 =?us-ascii?Q?FUcMiodRSXT7DJZ3GKRHddlMBkUCfbNii4ViNBPCesw7AMyUyM/B2xJWKbsI?=
 =?us-ascii?Q?fUsJXcqC2tPclrWl0ahEiKoHyGo/vSwz2dbX1yoOso1dzhlaHl2i?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <8255C32C38A2784A8FA155EC71DDFF3B@CHEP278.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZRAP278MB0801.CHEP278.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c1a96bdf-8627-4093-eae6-08da2820f996
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Apr 2022 07:38:51.7359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vuro4+X+Q6jkN6EOU2ZuFvC6d98VIl/bBVyDbANXxA37wK74RQmr+0sVKFpr2rvS4dcL+1aIJDHfOVXbSRi3YpKCJ0mzrxqp422xPFFNv7Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV0P278MB0401
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 26, 2022 at 12:34:13PM +0000, Daniels Umanovskis wrote:
> According to the datasheet, the hub should be operational 500us after
> the reset has been deasserted. Some individual circuits have been
> observed not to reset within the specified 500us and require a longer
> wait for subsequent configuration to succeed.
>=20
> Signed-off-by: Daniels Umanovskis <du@axentia.se>

LGTM.

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>

> ---
>  drivers/usb/misc/usb251xb.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/usb/misc/usb251xb.c b/drivers/usb/misc/usb251xb.c
> index 04c4e3fed094..e287e241ef96 100644
> --- a/drivers/usb/misc/usb251xb.c
> +++ b/drivers/usb/misc/usb251xb.c
> @@ -115,6 +115,7 @@ struct usb251xb {
>  	struct regulator *vdd;
>  	u8 skip_config;
>  	struct gpio_desc *gpio_reset;
> +	u32 reset_delay_us;
>  	u16 vendor_id;
>  	u16 product_id;
>  	u16 device_id;
> @@ -278,7 +279,7 @@ static void usb251xb_reset(struct usb251xb *hub)
>  	gpiod_set_value_cansleep(hub->gpio_reset, 0);
> =20
>  	/* wait for hub recovery/stabilization */
> -	usleep_range(500, 750);	/* >=3D500us after RESET_N deasserted */
> +	fsleep(hub->reset_delay_us);
> =20
>  	i2c_unlock_bus(hub->i2c->adapter, I2C_LOCK_SEGMENT);
>  }
> @@ -424,6 +425,9 @@ static int usb251xb_get_ofdata(struct usb251xb *hub,
>  		return err;
>  	}
> =20
> +	if (of_property_read_u32(np, "reset-delay-us", &hub->reset_delay_us))
> +		hub->reset_delay_us =3D 500;
> +
>  	if (of_property_read_u16_array(np, "vendor-id", &hub->vendor_id, 1))
>  		hub->vendor_id =3D USB251XB_DEF_VENDOR_ID;
> =20
> --=20
> 2.30.2
> =
