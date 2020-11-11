Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917542AED9E
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 10:26:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgKKJ03 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 04:26:29 -0500
Received: from mail-am6eur05on2059.outbound.protection.outlook.com ([40.107.22.59]:50564
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726176AbgKKJ00 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 04:26:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H/FzfYGodGdMDR75O62QfpLtN1bKTaOkLJycEV0du+LorCiJ0yDX/fKewyUV0pmAzDvZ0ATLkQMVqiJ4OGMv9fY0vCyckllBLIRdMrdoDpycOx8us9kRrI1uuSXCymfm+SCLEn8SpqB4rjunb9bJiX1kuGCV+uyj98xNE2YCbrN5c/fMk6XGvQJ36gNmw8LVh4Wi3oMyLdfYDZUgGK0x3K0INfUtLvEsXVvqDFoaVOG4UYy72YHCKhA9J8hyoKmyWklbx1vD885+4kIglCm1ReK7yR8nWHk/d4MmnXwbdi4T0B04KxE2xqPji3fy11Fg1oH8iYUEFH0ZJnehySSp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXlE5EMtHjgWIGx0jABfqS4k2KszdcqgfK7QVKv4pA0=;
 b=aHDnz9sQHnm+nGPYDTxPfpt8hRAhFpzdFwo6sJpGZBOeL5Q8IGZ/AHEw5NwVxpCt6e28Kr5wuec+Sp1FU6tw3lVkbo8DgcWFrtGlcMnmBZccPcxbQYW2AcZZqnY+yOGNFlr3cIjkF4kRTqZY5r9GzmYZJzFo+ZuEAdV/w+susmyNYp/XuZZ9ej6LQLsn46aOEpG/Bw5RNlB7EhQJCjuw8nsuaasKdL6C2Xk+OWHH+3HyXWMnsj5yChRil1/Vg8BhFo/4wqGiaDCl2TbKsL4/sdb83B15H0sffV1Vsa72dS69Z0VoeaXXoBXZCBONYwIJ7zZSdPyewqFZScQjH3+aow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXlE5EMtHjgWIGx0jABfqS4k2KszdcqgfK7QVKv4pA0=;
 b=M7jPXfQKm2eRy4xMDJPUaYS4ZJQ+b/GzWsN8p0ZA0WUGCElgyLcdVoPMPRYTTn9di+0GlgSZ0HH4KoGRVpWslFRWJmvEhUbJnTn5Rv0US4CuWh1GaK9Rhhz6q+fHUPN30+QkHia0BQB0XrzZfIKWSpsbRFoR7z+FEhnUyxwh2CE=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5082.eurprd04.prod.outlook.com (2603:10a6:10:14::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 09:26:21 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 09:26:21 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gschmottlach@gmail.com" <gschmottlach@gmail.com>
Subject: Re: [PATCH 1/3] usb: gadget: f_uac2/u_audio: add feedback endpoint
 support
Thread-Topic: [PATCH 1/3] usb: gadget: f_uac2/u_audio: add feedback endpoint
 support
Thread-Index: AQHWtWS1CDQUN74rS0C7o+THUqXCZqnCroIA
Date:   Wed, 11 Nov 2020 09:26:21 +0000
Message-ID: <20201111092552.GI14896@b29397-desktop>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-2-git-send-email-ruslan.bilovol@gmail.com>
In-Reply-To: <1604794711-8661-2-git-send-email-ruslan.bilovol@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f229eed8-4191-41c6-b55c-08d88623d9f1
x-ms-traffictypediagnostic: DB7PR04MB5082:
x-microsoft-antispam-prvs: <DB7PR04MB5082ABFED49E620456A7F8C28BE80@DB7PR04MB5082.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:580;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0hyLIJDL+QJPpv0tb7fzq1bMsu9mM/hF8MGIa81fxYTNnSOlk/UJw+0xmUXREhnW2DUbOjdXzoNy4PNq5pXEQB4FqLZj1CwDgccZ1iuKWBWc6bEvCgFkwWbY8TgoOUr4ScmInLkx3iHKAB9I0/qcmzeqn5bWUR2O2XseRDOUne8ObfdiTKLRxZ81gAwHjXd4nji3IlQ/FAn8V3wsKMtSR4E7CpOA8P2DxpmD0FVzomaD+TzkucZShyWkVKBKPvZceqgEKZWHyoOD1s27cknWUDR8NPPvv4kFTal9NpI22r16dkdIyzM02BXg7aTT9Cp5Ph8kFuwH7RXvgKgEgEgMc16Mfi6jI56WYC53GN10ME5LXkko16kThuzNb4qALC8NAga6Li1sjvjthtw/lUmw4g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(396003)(376002)(136003)(346002)(366004)(39860400002)(30864003)(66446008)(66946007)(53546011)(66556008)(66476007)(316002)(64756008)(33656002)(91956017)(86362001)(966005)(76116006)(54906003)(44832011)(9686003)(33716001)(6512007)(71200400001)(6486002)(8676002)(6916009)(186003)(1076003)(5660300002)(2906002)(26005)(6506007)(8936002)(83380400001)(4326008)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: E79/o9hwRMaD2MjXVIap9hyVApLiFNJWDaca9yvjGyuXxj31z29Z3tcQGGuSkHtpbZycgun2g1lTvfsEOnPx8mNuCPBmetSqKUAWXtTwOLiLw1VOhqarDTcZXcwoLTZWxZaQnqnZVWkh+N6gB3hNGaNtV4Ql79Qcb2BsyQkDWRNkpTT32z7h7Y/ESEl+Ar+sgDWd+ps4XVcIA0nnHeE7AfHh1l7jQHCiP3EOtyiQEoy/3NmxwDYzMrBI1FvQOxUMHDivcs6sifGmE3W1sekaythEbuJnWNj1BfzOM3evWdo+6cIsH9gl/ZHL4NJQ5R9ORTMGoI+6eTqKr2aLVXXw2AX7HFD/oCcWE+XEf7pSYExXdh4km31F+82pUiIjMHXOvtJK8rTvdYC/ce4Mz6y2lG9Ym1kTGj1dCIGSiA/SI07/ajShZIYXe/G9oAF1kmLvlRra4sslPzyuD2aKf2Fk9ZuAV5oMr+jtBRsLCnB+c5ldzX3aDi1UgX6Wjw+Fjf58xApPsUR5w4QeLndHvMhQSvHhMnyS6Ox3Gcz9hywDSdIdM27A6y24IX3Y0BpOeBDENIQDqnza4jxrJ0oirA5M66bzVJZlMShTc9HUtgR9Rhd7dHttQyYJEHRbRgfELjWhH31exvq7UJ52EvdW8X3x+w==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2F774F4661346845B53E53067929540B@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f229eed8-4191-41c6-b55c-08d88623d9f1
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 09:26:21.0871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /JWCcWsdSSsn/4AdkwU1EXixsoX1trcIh/xE057qb6F4InW//4Qws/PsM22cqPQUaAvsZ8Sr9dIwkl2wGfj0Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5082
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-08 02:18:29, Ruslan Bilovol wrote:
> As per USB and UAC2 specs, asynchronous audio sink endpoint
> requires explicit synchronization mechanism (Isochronous
> Feedback Endpoint)
>=20
> Implement feedback companion endpoint for ISO OUT endpoint
>=20
> This patch adds all required infrastructure and USB requests
> handling for feedback endpoint. Syncrhonization itself is
> still dummy (feedback ep always reports 'nomimal frequency'
>  e.g. no adjustement is needed). This satisfies hosts that
> require feedback endpoint (like Win10) and poll it periodically
>=20
> Actual synchronization mechanism should be implemented
> separately
>=20
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  drivers/usb/gadget/function/f_uac2.c  |  34 +++++++++-
>  drivers/usb/gadget/function/u_audio.c | 124 ++++++++++++++++++++++++++++=
+++++-
>  drivers/usb/gadget/function/u_audio.h |   3 +
>  3 files changed, 158 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/fu=
nction/f_uac2.c
> index fb9b875..a57bf77 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -237,7 +237,7 @@ enum {
>  	.bDescriptorType =3D USB_DT_INTERFACE,
> =20
>  	.bAlternateSetting =3D 1,
> -	.bNumEndpoints =3D 1,
> +	.bNumEndpoints =3D 2,
>  	.bInterfaceClass =3D USB_CLASS_AUDIO,
>  	.bInterfaceSubClass =3D USB_SUBCLASS_AUDIOSTREAMING,
>  	.bInterfaceProtocol =3D UAC_VERSION_2,
> @@ -296,6 +296,27 @@ enum {
>  	.wLockDelay =3D 0,
>  };
> =20
> +/* STD AS ISO IN Feedback Endpoint */
> +static struct usb_endpoint_descriptor fs_epin_fback_desc =3D {
> +	.bLength =3D USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D USB_DT_ENDPOINT,
> +
> +	.bEndpointAddress =3D USB_DIR_IN,
> +	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
> +	.wMaxPacketSize =3D cpu_to_le16(3),
> +	.bInterval =3D 1,
> +};
> +
> +static struct usb_endpoint_descriptor hs_epin_fback_desc =3D {
> +	.bLength =3D USB_DT_ENDPOINT_SIZE,
> +	.bDescriptorType =3D USB_DT_ENDPOINT,
> +
> +	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_USAGE_FEEDBACK,
> +	.wMaxPacketSize =3D cpu_to_le16(4),
> +	.bInterval =3D 4,
> +};
> +
> +
>  /* Audio Streaming IN Interface - Alt0 */
>  static struct usb_interface_descriptor std_as_in_if0_desc =3D {
>  	.bLength =3D sizeof std_as_in_if0_desc,
> @@ -392,6 +413,7 @@ enum {
>  	(struct usb_descriptor_header *)&as_out_fmt1_desc,
>  	(struct usb_descriptor_header *)&fs_epout_desc,
>  	(struct usb_descriptor_header *)&as_iso_out_desc,
> +	(struct usb_descriptor_header *)&fs_epin_fback_desc,
> =20
>  	(struct usb_descriptor_header *)&std_as_in_if0_desc,
>  	(struct usb_descriptor_header *)&std_as_in_if1_desc,
> @@ -422,6 +444,7 @@ enum {
>  	(struct usb_descriptor_header *)&as_out_fmt1_desc,
>  	(struct usb_descriptor_header *)&hs_epout_desc,
>  	(struct usb_descriptor_header *)&as_iso_out_desc,
> +	(struct usb_descriptor_header *)&hs_epin_fback_desc,
> =20
>  	(struct usb_descriptor_header *)&std_as_in_if0_desc,
>  	(struct usb_descriptor_header *)&std_as_in_if1_desc,
> @@ -541,6 +564,7 @@ static void setup_descriptor(struct f_uac2_opts *opts=
)
>  		fs_audio_desc[i++] =3D USBDHDR(&as_out_fmt1_desc);
>  		fs_audio_desc[i++] =3D USBDHDR(&fs_epout_desc);
>  		fs_audio_desc[i++] =3D USBDHDR(&as_iso_out_desc);
> +		fs_audio_desc[i++] =3D USBDHDR(&fs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		fs_audio_desc[i++] =3D USBDHDR(&std_as_in_if0_desc);
> @@ -574,6 +598,7 @@ static void setup_descriptor(struct f_uac2_opts *opts=
)
>  		hs_audio_desc[i++] =3D USBDHDR(&as_out_fmt1_desc);
>  		hs_audio_desc[i++] =3D USBDHDR(&hs_epout_desc);
>  		hs_audio_desc[i++] =3D USBDHDR(&as_iso_out_desc);
> +		hs_audio_desc[i++] =3D USBDHDR(&hs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		hs_audio_desc[i++] =3D USBDHDR(&std_as_in_if0_desc);
> @@ -681,6 +706,12 @@ static void setup_descriptor(struct f_uac2_opts *opt=
s)
>  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
>  			return -ENODEV;
>  		}
> +		agdev->in_ep_fback =3D usb_ep_autoconfig(gadget,
> +						       &fs_epin_fback_desc);
> +		if (!agdev->in_ep_fback) {
> +			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> +			return -ENODEV;
> +		}
>  	}
> =20
>  	if (EPIN_EN(uac2_opts)) {
> @@ -699,6 +730,7 @@ static void setup_descriptor(struct f_uac2_opts *opts=
)
>  				le16_to_cpu(hs_epout_desc.wMaxPacketSize));
> =20
>  	hs_epout_desc.bEndpointAddress =3D fs_epout_desc.bEndpointAddress;
> +	hs_epin_fback_desc.bEndpointAddress =3D fs_epin_fback_desc.bEndpointAdd=
ress;
>  	hs_epin_desc.bEndpointAddress =3D fs_epin_desc.bEndpointAddress;
> =20
>  	setup_descriptor(uac2_opts);
> diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/f=
unction/u_audio.c
> index e6d32c5..33c9288 100644
> --- a/drivers/usb/gadget/function/u_audio.c
> +++ b/drivers/usb/gadget/function/u_audio.c
> @@ -43,6 +43,10 @@ struct uac_rtd_params {
>  	unsigned int max_psize;	/* MaxPacketSize of endpoint */
>  	struct uac_req *ureq;
> =20
> +	struct usb_request *req_fback; /* Feedback endpoint request */
> +	unsigned int ffback; /* Real frequency reported by feedback endpoint */
> +	bool fb_ep_enabled; /* if the ep is enabled */
> +
>  	spinlock_t lock;
>  };
> =20
> @@ -76,6 +80,35 @@ struct snd_uac_chip {
>  	.periods_min =3D MIN_PERIODS,
>  };
> =20
> +static void u_audio_set_fback_frequency(enum usb_device_speed speed,
> +					unsigned int freq, void *buf)
> +{
> +	u32 ff =3D 0;
> +
> +	if (speed =3D=3D USB_SPEED_FULL) {
> +		/*
> +		 * Full-speed feedback endpoints report frequency
> +		 * in samples/microframe
> +		 * Format is encoded in Q10.10 left-justified in the 24 bits,
> +		 * so that it has a Q10.14 format.
> +		 */
> +		ff =3D DIV_ROUND_UP((freq << 14), 1000);
> +	} else {
> +		/*
> +		 * High-speed feedback endpoints report frequency
> +		 * in samples/microframe.
> +		 * Format is encoded in Q12.13 fitted into four bytes so that
> +		 * the binary point is located between the second and the third
> +		 * byte fromat (that is Q16.16)
> +		 *
> +		 * Prevent integer overflow by calculating in Q12.13 fromat and
> +		 * then shifting to Q16.16
> +		 */
> +		ff =3D DIV_ROUND_UP((freq << 13), (8*1000)) << 3;
> +	}
> +	*(__le32 *)buf =3D cpu_to_le32(ff);
> +}
> +
>  static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *=
req)
>  {
>  	unsigned int pending;
> @@ -182,6 +215,36 @@ static void u_audio_iso_complete(struct usb_ep *ep, =
struct usb_request *req)
>  		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
>  }
> =20
> +static void u_audio_iso_fback_complete(struct usb_ep *ep,
> +				       struct usb_request *req)
> +{
> +	struct uac_rtd_params *prm =3D req->context;
> +	struct snd_uac_chip *uac =3D prm->uac;
> +	struct g_audio *audio_dev =3D uac->audio_dev;
> +	int status =3D req->status;
> +	unsigned long flags;
> +
> +	/* i/f shutting down */
> +	if (!prm->fb_ep_enabled || req->status =3D=3D -ESHUTDOWN)
> +		return;
> +
> +	/*
> +	 * We can't really do much about bad xfers.
> +	 * Afterall, the ISOCH xfers could fail legitimately.
> +	 */
> +	if (status)
> +		pr_debug("%s: iso_complete status(%d) %d/%d\n",
> +			__func__, status, req->actual, req->length);
> +
> +	spin_lock_irqsave(&prm->lock, flags);
> +	u_audio_set_fback_frequency(audio_dev->gadget->speed,
> +				    prm->ffback, req->buf);
> +	spin_unlock_irqrestore(&prm->lock, flags);
> +
> +	if (usb_ep_queue(ep, req, GFP_ATOMIC))
> +		dev_err(uac->card->dev, "%d Error!\n", __LINE__);
> +}
> +
>  static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  {
>  	struct snd_uac_chip *uac =3D snd_pcm_substream_chip(substream);
> @@ -346,14 +409,33 @@ static inline void free_ep(struct uac_rtd_params *p=
rm, struct usb_ep *ep)
>  		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
>  }
> =20
> +static inline void free_ep_fback(struct uac_rtd_params *prm, struct usb_=
ep *ep)
> +{
> +	struct snd_uac_chip *uac =3D prm->uac;
> +
> +	if (!prm->fb_ep_enabled)
> +		return;
> +
> +	prm->fb_ep_enabled =3D false;
> +
> +	if (prm->req_fback) {
> +		usb_ep_dequeue(ep, prm->req_fback);
> +		kfree(prm->req_fback->buf);

You may need to free buf at completion, Jack Pham found a use-after-free
bug at dwc3 controller due to async execution for usb_ep_dequeue.

https://www.spinics.net/lists/linux-usb/msg203782.html

> +		usb_ep_free_request(ep, prm->req_fback);
> +		prm->req_fback =3D NULL;
> +	}
> +
> +	if (usb_ep_disable(ep))
> +		dev_err(uac->card->dev, "%s:%d Error!\n", __func__, __LINE__);
> +}
> =20
>  int u_audio_start_capture(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac =3D audio_dev->uac;
>  	struct usb_gadget *gadget =3D audio_dev->gadget;
>  	struct device *dev =3D &gadget->dev;
> -	struct usb_request *req;
> -	struct usb_ep *ep;
> +	struct usb_request *req, *req_fback;
> +	struct usb_ep *ep, *ep_fback;
>  	struct uac_rtd_params *prm;
>  	struct uac_params *params =3D &audio_dev->params;
>  	int req_len, i;
> @@ -386,6 +468,42 @@ int u_audio_start_capture(struct g_audio *audio_dev)
>  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
>  	}
> =20
> +	ep_fback =3D audio_dev->in_ep_fback;
> +	if (!ep_fback)
> +		return 0;
> +
> +	/* Setup feedback endpoint */
> +	config_ep_by_speed(gadget, &audio_dev->func, ep_fback);
> +	prm->fb_ep_enabled =3D true;
> +	usb_ep_enable(ep_fback);
> +	req_len =3D ep_fback->maxpacket;
> +
> +	req_fback =3D usb_ep_alloc_request(ep_fback, GFP_ATOMIC);
> +	if (req_fback =3D=3D NULL)
> +		return -ENOMEM;
> +
> +	prm->req_fback =3D req_fback;
> +	req_fback->zero =3D 0;
> +	req_fback->context =3D prm;
> +	req_fback->length =3D req_len;
> +	req_fback->complete =3D u_audio_iso_fback_complete;
> +
> +	req_fback->buf =3D kzalloc(req_len, GFP_ATOMIC);
> +	if (!req_fback->buf)
> +		return -ENOMEM;
> +
> +	/*
> +	 * Configure the feedback endpoint's reported frequency.
> +	 * Always start with original frequency since its deviation can't
> +	 * be meauserd at start of playback

%s/meauserd/measured

> +	 */
> +	prm->ffback =3D params->c_srate;
> +	u_audio_set_fback_frequency(audio_dev->gadget->speed,
> +				    prm->ffback, req_fback->buf);
> +
> +	if (usb_ep_queue(ep_fback, req_fback, GFP_ATOMIC))
> +		dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> +
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(u_audio_start_capture);
> @@ -394,6 +512,8 @@ void u_audio_stop_capture(struct g_audio *audio_dev)
>  {
>  	struct snd_uac_chip *uac =3D audio_dev->uac;
> =20
> +	if (audio_dev->in_ep_fback)
> +		free_ep_fback(&uac->c_prm, audio_dev->in_ep_fback);
>  	free_ep(&uac->c_prm, audio_dev->out_ep);
>  }
>  EXPORT_SYMBOL_GPL(u_audio_stop_capture);
> diff --git a/drivers/usb/gadget/function/u_audio.h b/drivers/usb/gadget/f=
unction/u_audio.h
> index 5ea6b86..53e6baf 100644
> --- a/drivers/usb/gadget/function/u_audio.h
> +++ b/drivers/usb/gadget/function/u_audio.h
> @@ -30,7 +30,10 @@ struct g_audio {
>  	struct usb_gadget *gadget;
> =20
>  	struct usb_ep *in_ep;
> +
>  	struct usb_ep *out_ep;
> +	/* feedback IN endpoint corresponding to out_ep */
> +	struct usb_ep *in_ep_fback;
> =20
>  	/* Max packet size for all in_ep possible speeds */
>  	unsigned int in_ep_maxpsize;
> --=20
> 1.9.1
>=20

--=20

Thanks,
Peter Chen=
