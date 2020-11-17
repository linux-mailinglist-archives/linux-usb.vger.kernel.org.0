Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DBB22B5652
	for <lists+linux-usb@lfdr.de>; Tue, 17 Nov 2020 02:39:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgKQBjW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 20:39:22 -0500
Received: from mail-vi1eur05on2080.outbound.protection.outlook.com ([40.107.21.80]:61793
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725730AbgKQBjW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 20:39:22 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1HqNNUWDf8zNH4pBXy/bVOZLA0bWfZ/ck2cTSn5BNSH5TPqZo2Oo9wECh0QVNomDyYJY08fVfwLI0U72StPC6J0Qhw+vfHae/icKNTKzHWPQgh56AnsOHdrc0NpLy1tNPOHYQeiuENuJqEf4HwcHudrWp/3A6A3eJaQJtKFJoJG3rRTRlo0aYSXpBB1RAC5E7Y2CaEblP0hsRwyDp93t+EWrgK8BAm6NHzqxjmcWFEl6dZ6T50PR09URMtlFAYe2Ew0l7kRK6KHWLs5vbv4PwKwGebZ1ve0f9FmaVod1CvM/ZbeYGsYBQaZnprCLJGu3olHY+4IRImbhHd4ZzEo7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iYtTUXZ1O8KuZHuc4jOsxV6CvabkCBV3WHw9J25RZ0=;
 b=kxvJ2OILM3nJWQnvATCk9pByE7cgwFYWMVYSzawZ4TDGKp54lS6WLI8rZuFb6Hzi/9Ni1nE00U4/sE4S5wxPdnYmEO+ZAj8MtUPZbjZcaiql9fw5pGYgSwv4gcNvrU5mNEnVRS9rCdU++Fs7UwTj/YjWjnqE4PTHkG1ygB9Jzyb+AMKg/tE9nW6XTRfoCh4e0qHHWw2g88FCpjecetkCFKv1IgBMXFPSPWdeLAZQy7HDFfFWLEeVgbTRp3wyqa/SWkGG4NelS0yZOVAd7n8dRQ4DikGcsYj/VoNRBSunLva03BUgcNjov1CE9BDEvMEGo539BxEd8UbbMCYwCUCZeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iYtTUXZ1O8KuZHuc4jOsxV6CvabkCBV3WHw9J25RZ0=;
 b=g+aBPiYHaWpuA4a1D+VIoPN+xGmnVTAsJ6NmiwNm4g2B0/2DPs2v+tfsHvn+ROf98nn3wh1W2P/CV2kLkjAyWKKu6wCEZanIk6RnUmlKpKqJyQhX99tOEDwAS905RfeGDs3Iq+e/fNiAve04z7ixS1wdvCsvJvAJZOSMe73bjf0=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB8PR04MB7177.eurprd04.prod.outlook.com (2603:10a6:10:127::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Tue, 17 Nov
 2020 01:39:18 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3564.028; Tue, 17 Nov 2020
 01:39:18 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     "Neuenschwander, Bowe" <Bowe.Neuenschwander@garmin.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB Gadget EEM Suspend/Resume
Thread-Topic: USB Gadget EEM Suspend/Resume
Thread-Index: AQHWvG1JL2Kd5y1bZE+t7tgpTs7zZanLi/CA
Date:   Tue, 17 Nov 2020 01:39:18 +0000
Message-ID: <20201117013849.GA5967@b29397-desktop>
References: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>
In-Reply-To: <09f87aed186f4c8cb56aee1d2409ae65@garmin.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: garmin.com; dkim=none (message not signed)
 header.d=none;garmin.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 04a1d83b-1ac3-4af3-613b-08d88a999977
x-ms-traffictypediagnostic: DB8PR04MB7177:
x-microsoft-antispam-prvs: <DB8PR04MB71770759D16F0A57462C7EEF8BE20@DB8PR04MB7177.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PebfJtIphNW1YnNOMWR7Rk3vnkW6+1hE35Ae90HtSIhu07R0jx9Mxh6Wj+NnBj5r/UkFZPSpOks59TGOf2Hp9a14RRroaN9JKXSa52HHqVZAvm4eLt/WYool/xf5yaq/whjl862EzIGm7F1ZL09T8LtlHP1BZDf9SU3nrdDyhIdoXYUVw+HDqIxgNEIg6LGumjid/X8304iMi7Gz/Dx257kZy1sUMXi44GoZMVdg5af6K9xPK9raXnyNr35GSy34kQwoKU1yKfHCK21eZG3BKXLB6sdYXl4AAaN91IDgVHTlepdMlTRZ7jXiG1Ilq8nV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(86362001)(186003)(6512007)(6916009)(6506007)(53546011)(26005)(8936002)(8676002)(316002)(2906002)(33716001)(6486002)(15650500001)(4326008)(9686003)(83380400001)(71200400001)(5660300002)(1076003)(66556008)(66446008)(64756008)(76116006)(91956017)(66476007)(66946007)(33656002)(478600001)(44832011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +nlqO6R07sqA7AWAQDCDOwJEtcRDQRTJCDbwjmtaJ1kKoZXYPRyY7nMQ/r86QRXx8qiWI7HioC08O2KWeIHA58ruvnWo3ITdyW8kFMYJojgauFHF55HbIy48GPMxjQlIJOxwLEjx9Lq/tUB9XRa7yA5D/bKDqQE2IAAkCvShoJZirrcHuAv2369Q3MSG7t5kxxOohLFwGLo07qHfofS2Yx4IQMjnRRM+Xr+a28zX5HanErFfhXqDDJIY8Ps9q0cAOCqC9DhaDPNet30sUsZ/QHZSBk97lCUqEprXfmozdGrHgUyAnyJXtg1+2xhoFeegzwX+Da3WbrDYEdEvfDfOh4EHMCD/MjjTiEWKRtneJfyV5GhYJyjtuR3dzqlOwKulKWelJF2vmxDUK5kkQXihFVS1OzlBRkn2XNgpZQrDD1uoaIvdq+hs3LLmntDQmrTHeiKBSXz3Lc9UmQ1t9T5Be9P+Jx0I0jY+0VtHuFBCSVf7tOk9V6qApC5FLbAHft+ZM1V17bomEfWkip4ALKfs0jP8WSUBfGN+95lEgdETnij5MGg0eswd7Jb23NpicM2UP5QDybHp160Km/f4E42itagoO8osfu4FnkT2LWFqsQEFz6dIL5q+56QzVWDnLcutGNJy6bDTKRjasiMQfszbew==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <913A4FC07820D84AA38DF8466BFB2DF4@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a1d83b-1ac3-4af3-613b-08d88a999977
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2020 01:39:18.1117
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sbOIcRQM2GwWhr8jUV1KNy48zidN6U3UwChCBS6sk68gb6HdsEYfGANZLkR/KrfK8757m6+sB6RrJw9fyJ0RcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7177
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-16 23:11:20, Neuenschwander, Bowe wrote:
> Hello,
>=20
> I was hoping for some input  on how USB Ethernet Gadget drivers should ha=
ndle USB suspend/resume  events.=A0 We have a case where the USB suspend ho=
ok is being called for  an EEM Gadget; but since that hook is currently uni=
mplemented, the interface remains in an active/enabled state. =A0I have  at=
tached a patch that seems to fix this issue for EEM devices by  calling get=
her_disconnect() on suspend and gether_connect() on resume;  but I do not i=
f this is actually correct behavior, so I was looking for some advice on th=
at.=A0 It seems that since the gadget driver cannot send data until the USB=
 host resumes the USB link,  that the interface should be considered discon=
nected.
>=20

Please wrap up to 80 characters per line, that's easy for reading.
Would you please describe the real issue you have met? I have a simply
ping test for EEM, it could work after resume, the packet is pending
if host is suspended.


64 bytes from 192.168.1.1: icmp_seq=3D154 ttl=3D64 time=3D0.358 ms
64 bytes from 192.168.1.1: icmp_seq=3D155 ttl=3D64 time=3D0.375 ms
64 bytes from 192.168.1.1: icmp_seq=3D156 ttl=3D64 time=3D0.364 ms
64 bytes from 192.168.1.1: icmp_seq=3D157 ttl=3D64 time=3D0.359 ms
64 bytes from 192.168.1.1: icmp_seq=3D158 ttl=3D64 time=3D3223 ms
64 bytes from 192.168.1.1: icmp_seq=3D159 ttl=3D64 time=3D2199 ms
64 bytes from 192.168.1.1: icmp_seq=3D160 ttl=3D64 time=3D1175 ms
64 bytes from 192.168.1.1: icmp_seq=3D161 ttl=3D64 time=3D151 ms
64 bytes from 192.168.1.1: icmp_seq=3D162 ttl=3D64 time=3D0.407 ms
64 bytes from 192.168.1.1: icmp_seq=3D163 ttl=3D64 time=3D0.352 ms
64 bytes from 192.168.1.1: icmp_seq=3D164 ttl=3D64 time=3D0.351 ms
64 bytes from 192.168.1.1: icmp_seq=3D165 ttl=3D64 time=3D0.378 ms
64 bytes from 192.168.1.1: icmp_seq=3D166 ttl=3D64 time=3D0.351 ms

64 bytes from 192.168.1.1: icmp_seq=3D167 ttl=3D64 time=3D0.353 ms
fg
^C
--- 192.168.1.1 ping statistics ---
167 packets transmitted, 158 received, +9 errors, 5.38922% packet loss,
time 791ms
rtt min/avg/max/mdev =3D 0.330/1511.202/9886.157/2799.059 ms, pipe 10
root@imx8qmmek:~# dmesg -c
[ 1620.382457] configfs-gadget gadget: suspend
[ 1622.840007] configfs-gadget gadget: resume
[ 1631.275452] configfs-gadget gadget: suspend
[ 1633.839442] configfs-gadget gadget: resume
[ 1648.257668] configfs-gadget gadget: suspend
[ 1657.837955] configfs-gadget gadget: resume
[ 1669.252874] configfs-gadget gadget: suspend
[ 1679.836613] configfs-gadget gadget: resume
[ 1692.245250] configfs-gadget gadget: suspend
[ 1695.835642] configfs-gadget gadget: resume
[ 1711.255216] configfs-gadget gadget: suspend

Peter


> From 7cdc1cebe4092393e1de33f59fd2f1cd4355d494 Mon Sep 17 00:00:00 2001
> From: Bowe Neuenschwander <bowe.neuenschwander@garmin.com>
> Date: Tue, 10 Nov 2020 15:55:51 -0600
> Subject: [PATCH 1/2] usb: gadget: eem: Add suspend/resume handling
>=20
> Add suspend/resume handling to the USB Gadget EEM driver.  On suspend,
> disconnect the interface; on resume, attempt to reconnect the interface.
>=20
> Change-Id: I1c7a2bb1d68a99c774a415b13f6cdabb507ada92
> ---
>  drivers/usb/gadget/function/f_eem.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>=20
> diff --git a/drivers/usb/gadget/function/f_eem.c b/drivers/usb/gadget/fun=
ction/f_eem.c
> index cad35a502d3f..4fbdbb8ee295 100644
> --- a/drivers/usb/gadget/function/f_eem.c
> +++ b/drivers/usb/gadget/function/f_eem.c
> @@ -238,6 +238,33 @@ static void eem_disable(struct usb_function *f)
>  		gether_disconnect(&eem->port);
>  }
> =20
> +static void eem_suspend(struct usb_function *f)
> +{
> +	struct f_eem		*eem =3D func_to_eem(f);
> +	struct usb_composite_dev *cdev =3D f->config->cdev;
> +
> +	DBG(cdev, "eem suspended\n");
> +
> +	if (eem->port.in_ep->enabled)
> +		gether_disconnect(&eem->port);
> +}
> +
> +static void eem_resume(struct usb_function *f)
> +{
> +	struct f_eem		*eem =3D func_to_eem(f);
> +	struct usb_composite_dev *cdev =3D f->config->cdev;
> +	struct net_device	*net;
> +
> +	DBG(cdev, "eem resumed\n");
> +
> +	if (!eem->port.in_ep->enabled) {
> +		net =3D gether_connect(&eem->port);
> +		if (IS_ERR(net))
> +			ERROR(cdev, "%s: eem resume failed, err %d\n",
> +			      f->name, PTR_ERR(net));
> +	}
> +}
> +
>  /*----------------------------------------------------------------------=
---*/
> =20
>  /* EEM function driver setup/binding */
> @@ -636,6 +663,8 @@ static struct usb_function *eem_alloc(struct usb_func=
tion_instance *fi)
>  	eem->port.func.set_alt =3D eem_set_alt;
>  	eem->port.func.setup =3D eem_setup;
>  	eem->port.func.disable =3D eem_disable;
> +	eem->port.func.suspend =3D eem_suspend;
> +	eem->port.func.resume =3D eem_resume;
>  	eem->port.func.free_func =3D eem_free;
>  	eem->port.wrap =3D eem_wrap;
>  	eem->port.unwrap =3D eem_unwrap;
> --=20
> 2.29.2
>=20


--=20

Thanks,
Peter Chen=
