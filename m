Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4C6B2AED4F
	for <lists+linux-usb@lfdr.de>; Wed, 11 Nov 2020 10:19:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726160AbgKKJSw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Nov 2020 04:18:52 -0500
Received: from mail-eopbgr80045.outbound.protection.outlook.com ([40.107.8.45]:23003
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725986AbgKKJSv (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Nov 2020 04:18:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHzP72uuBXiXc95cBxbgqKJpgzF6xb98MMJmTqWQLj2bUyJJJePmY2cI5KEq7bCbS1XN7n94SMyxHliba2sWfcqC6b5vbsSvvst2Vnn1rMoLyl0jb/BvW7u+h2NPkTe988E9yGNGGtII4/PbVZzk1CFGF3PYt+D4zdWgxGcRaM4iiclb0eERsbrYR8MCYzOlYOeVYi+bsz2ezPEKpGlfqGsEE5sf+zkB1ybMkPI0nL4lDXq6Y84/ZHGJp6F6lYOj4DZECVM0crNsWu5dlQtbF8R9HEVHcAF7NwR9tWeYE3FEfEweSvEvCCuQJogGmHbrLN4B5sUJwRemBpYqWAdIdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSMvjHfOSxeqTqxhfu8SvM5qpEKPbVPElF60wf30sB4=;
 b=QLaSNeM4tbMrvz37v2X8bvij1pw0mdgrp9Ir+kcB7M8laISETQHGq+LPAtUmH0mVAiNI1vZSPLJQXHD7kxqr5DoC9JObOzxu8F4IPQkYfBQwUwb/RIuR2ch1MONQn+A8XqaYal//Af1ewiOkt0AJX+yAhwOKdFKALg0ajyZ2aMKCzoCFTM2yJyLgPrWIrxrlTG0WyfpvOE/Q71+Hj9y0NA31MWlvQ9XwoTz6g08PClt762WpSO5ImNg0E1TD4qlxhMSwgWmC9SN+i7zDVMogRSH+9UaSGsJM4MZvjpp7U6lCo4LDQxTfj3Vo6fOHWP7pR+Cvw27i2nR/oFlxcYoN0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSMvjHfOSxeqTqxhfu8SvM5qpEKPbVPElF60wf30sB4=;
 b=YymgS1OUkQyn1y0dgAiZ/M8kKWNjpQQ3ivAx91OUqfPvQ0Gkjer9juVhesTPs4fDyvc8ZfL3MYt4eO/D+JWgNqB0in0usDdJ0jRa21lo+xChfjnXgHwLDJoN7wJe5A95FsXFms9gFtlS7ktMO0f53DsoCWqww+y16OqoZLTKpZI=
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com (2603:10a6:10:1ec::9)
 by DB7PR04MB5082.eurprd04.prod.outlook.com (2603:10a6:10:14::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.22; Wed, 11 Nov
 2020 09:18:45 +0000
Received: from DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c]) by DBBPR04MB7979.eurprd04.prod.outlook.com
 ([fe80::c8c:888f:3e0c:8d5c%5]) with mapi id 15.20.3541.025; Wed, 11 Nov 2020
 09:18:45 +0000
From:   Peter Chen <peter.chen@nxp.com>
To:     Ruslan Bilovol <ruslan.bilovol@gmail.com>
CC:     "balbi@kernel.org" <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "gschmottlach@gmail.com" <gschmottlach@gmail.com>
Subject: Re: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for
 capture
Thread-Topic: [PATCH 2/3] usb: gadget: f_uac2: add adaptive sync support for
 capture
Thread-Index: AQHWtWS2tM9dlHuETUqIB+WyEJexLqnCrGMA
Date:   Wed, 11 Nov 2020 09:18:45 +0000
Message-ID: <20201111091816.GH14896@b29397-desktop>
References: <1604794711-8661-1-git-send-email-ruslan.bilovol@gmail.com>
 <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com>
In-Reply-To: <1604794711-8661-3-git-send-email-ruslan.bilovol@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc818ee0-7c6f-4bfb-841c-08d88622ca6f
x-ms-traffictypediagnostic: DB7PR04MB5082:
x-microsoft-antispam-prvs: <DB7PR04MB5082DB30694A62A5D8DD6DC48BE80@DB7PR04MB5082.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vd6ADS4W0U9sQyJCkPTxoQI2CrNxWEEk2Pj1wko4IJr0UMJBWbcKhrXE3QJD/uhHGSUXqAhlzIdHFHcCv1NB/My32EzTeM1HgTKtJdqupPPCPLYX3RZ/OkTaMSOgYqh70R25zOHy/Eus6N4VRRnS8B88m8rz5YpKQvnou1sQPI9dwaPgu71zWh3DZGNXOsa5+HslGqq9UGVaEEnBCduYv+kFQsN1wbAY4T772MaHYPzPniECj6G1AGX7F24L/qIno5srWW1kwpmyH2kL6rabxXcgkrmbufqrRP77ZANVnxbCFrAEGbsHMiT4OxOXaJbz
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR04MB7979.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(6486002)(8676002)(6916009)(186003)(71200400001)(4326008)(8936002)(83380400001)(478600001)(1076003)(5660300002)(2906002)(26005)(6506007)(33656002)(76116006)(91956017)(86362001)(66446008)(66946007)(66476007)(316002)(64756008)(66556008)(53546011)(33716001)(6512007)(54906003)(44832011)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +gHEFnjHvzrcpX/5XMXJZHETQOd8Eez6+AMj+JPfJFTSL7Tn2iGpiWWqN4cJ4Y9npJWcFJs104qGZNTz3lpwVEXIaZBGGiEc1dAjhHWjY36JpbyH4IIKM6pJ+Hvb40bWFCs2l/94oxLaRwie8azhLY+BCxVdurHJ+Sij4V6HyvDKEHvRWCdY2WXWaDeQtWs0KSXjE6tj4HnPzmj+b3DUnX+kmHkL0V3V5zqfxq2BxyhkvLgcnSpCBicuY1u3hlCLEIJBHxLZXjw5o5BFJpG16BeThGuYU3ewzvUcUyimTAZddTcFOOlTBbMjwg6gUmPxAMnIDWcOQYH0B44lTEinc/1fV8KIlGAv7DuGA+wVSsQ2omSaji1Q5Unad3AmYn955x6BRMgAPYqxe4Z8VrOJhRHABFo6XmeZp64edDiAxaWnB0yDElohw8imi0sYhUxqFKa2+Kwl0R+KlZl6XYVUTq85ijIqEOPfhqV8m89tF1xvioZ2UR6actDNXuO/RQt8zG5I7dyj4r/s1EBdQ730e4fC+HHajy9nk7Lu9gaUYCHrIpwIEgbt1CUBn0PKOnWfBRhUozGqltv+5zxohWwf4wiDS/9IWvIrA3w1+Ds9nbMS/UxS1MApc4N0O+HYThXuTzOTSUoOiGNBypScqLekVQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <918785806ADE1F4CA5A85DB7E538FB8C@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DBBPR04MB7979.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc818ee0-7c6f-4bfb-841c-08d88622ca6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2020 09:18:45.4966
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TnEBjxIgTtX0YmfO6FYaxT4R1oJ9P5suSIUxPVJCQxmhn3CKkmp/ij6KvbaUtMfIa3jM1ZiuErqs7MLw+RqCww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5082
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-11-08 02:18:30, Ruslan Bilovol wrote:
> Current f_uac2 USB OUT (aka 'capture') synchronization
> implements 'ASYNC' scenario which means USB Gadget has
> it's own freerunning clock and can update Host about
> real clock frequency through feedback endpoint so Host
> can align number of samples sent to the USB gadget to
> prevent overruns/underruns
>=20
> In case if Gadget can has no it's internal clock and
> can consume audio samples at any rate (for example,
> on the Gadget side someone records audio directly to
> a file, or audio samples are played through an
> external DAC as soon as they arrive), UAC2 spec
> suggests 'ADAPTIVE' synchronization type.
>=20
> Change UAC2 driver to make it configurable through
> additional 'c_sync' configfs file.
>=20
> Default remains 'asynchronous' with possibility to
> switch it to 'adaptive'
>=20
> Signed-off-by: Ruslan Bilovol <ruslan.bilovol@gmail.com>
> ---
>  Documentation/ABI/testing/configfs-usb-gadget-uac2 |  1 +
>  Documentation/usb/gadget-testing.rst               |  1 +
>  drivers/usb/gadget/function/f_uac2.c               | 96 ++++++++++++++++=
++++--
>  drivers/usb/gadget/function/u_uac2.h               |  2 +
>  4 files changed, 91 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/ABI/testing/configfs-usb-gadget-uac2 b/Documen=
tation/ABI/testing/configfs-usb-gadget-uac2
> index 2bfdd4e..4fbff96 100644
> --- a/Documentation/ABI/testing/configfs-usb-gadget-uac2
> +++ b/Documentation/ABI/testing/configfs-usb-gadget-uac2
> @@ -7,6 +7,7 @@ Description:
>  		c_chmask - capture channel mask
>  		c_srate - capture sampling rate
>  		c_ssize - capture sample size (bytes)
> +		c_sync - capture synchronization type (async/adaptive)

Can't apply it based on the latest code, this file has changed.

>  		p_chmask - playback channel mask
>  		p_srate - playback sampling rate
>  		p_ssize - playback sample size (bytes)
> diff --git a/Documentation/usb/gadget-testing.rst b/Documentation/usb/gad=
get-testing.rst
> index 2eeb3e9..360a7ca 100644
> --- a/Documentation/usb/gadget-testing.rst
> +++ b/Documentation/usb/gadget-testing.rst
> @@ -728,6 +728,7 @@ The uac2 function provides these attributes in its fu=
nction directory:
>  	c_chmask	capture channel mask
>  	c_srate		capture sampling rate
>  	c_ssize		capture sample size (bytes)
> +	c_sync		capture synchronization type (async/adaptive)
>  	p_chmask	playback channel mask
>  	p_srate		playback sampling rate
>  	p_ssize		playback sample size (bytes)
> diff --git a/drivers/usb/gadget/function/f_uac2.c b/drivers/usb/gadget/fu=
nction/f_uac2.c
> index a57bf77..3187ad3 100644
> --- a/drivers/usb/gadget/function/f_uac2.c
> +++ b/drivers/usb/gadget/function/f_uac2.c
> @@ -41,6 +41,7 @@
> =20
>  #define EPIN_EN(_opts) ((_opts)->p_chmask !=3D 0)
>  #define EPOUT_EN(_opts) ((_opts)->c_chmask !=3D 0)
> +#define EPOUT_FBACK_IN_EN(_opts) ((_opts)->c_sync =3D=3D USB_ENDPOINT_SY=
NC_ASYNC)
> =20
>  struct f_uac2 {
>  	struct g_audio g_audio;
> @@ -237,7 +238,7 @@ enum {
>  	.bDescriptorType =3D USB_DT_INTERFACE,
> =20
>  	.bAlternateSetting =3D 1,
> -	.bNumEndpoints =3D 2,
> +	.bNumEndpoints =3D 1,
>  	.bInterfaceClass =3D USB_CLASS_AUDIO,
>  	.bInterfaceSubClass =3D USB_SUBCLASS_AUDIOSTREAMING,
>  	.bInterfaceProtocol =3D UAC_VERSION_2,
> @@ -270,7 +271,7 @@ enum {
>  	.bDescriptorType =3D USB_DT_ENDPOINT,
> =20
>  	.bEndpointAddress =3D USB_DIR_OUT,
> -	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC,
>  	.wMaxPacketSize =3D cpu_to_le16(1023),
>  	.bInterval =3D 1,
>  };
> @@ -279,7 +280,7 @@ enum {
>  	.bLength =3D USB_DT_ENDPOINT_SIZE,
>  	.bDescriptorType =3D USB_DT_ENDPOINT,
> =20
> -	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC | USB_ENDPOINT_SYNC_ASYNC,
> +	.bmAttributes =3D USB_ENDPOINT_XFER_ISOC,
>  	.wMaxPacketSize =3D cpu_to_le16(1024),
>  	.bInterval =3D 1,
>  };
> @@ -540,6 +541,19 @@ static void setup_descriptor(struct f_uac2_opts *opt=
s)
>  		len +=3D sizeof(io_out_ot_desc);
>  		ac_hdr_desc.wTotalLength =3D cpu_to_le16(len);
>  		iad_desc.bInterfaceCount++;
> +
> +		if (EPOUT_FBACK_IN_EN(opts)) {
> +			fs_epout_desc.bmAttributes |=3D
> +						USB_ENDPOINT_SYNC_ASYNC;
> +			hs_epout_desc.bmAttributes |=3D
> +						USB_ENDPOINT_SYNC_ASYNC;
> +			std_as_out_if1_desc.bNumEndpoints++;
> +		} else {
> +			fs_epout_desc.bmAttributes |=3D
> +						USB_ENDPOINT_SYNC_ADAPTIVE;
> +			hs_epout_desc.bmAttributes |=3D
> +						USB_ENDPOINT_SYNC_ADAPTIVE;
> +		}
>  	}
> =20
>  	i =3D 0;
> @@ -564,7 +578,8 @@ static void setup_descriptor(struct f_uac2_opts *opts=
)
>  		fs_audio_desc[i++] =3D USBDHDR(&as_out_fmt1_desc);
>  		fs_audio_desc[i++] =3D USBDHDR(&fs_epout_desc);
>  		fs_audio_desc[i++] =3D USBDHDR(&as_iso_out_desc);
> -		fs_audio_desc[i++] =3D USBDHDR(&fs_epin_fback_desc);
> +		if (EPOUT_FBACK_IN_EN(opts))
> +			fs_audio_desc[i++] =3D USBDHDR(&fs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		fs_audio_desc[i++] =3D USBDHDR(&std_as_in_if0_desc);
> @@ -598,7 +613,8 @@ static void setup_descriptor(struct f_uac2_opts *opts=
)
>  		hs_audio_desc[i++] =3D USBDHDR(&as_out_fmt1_desc);
>  		hs_audio_desc[i++] =3D USBDHDR(&hs_epout_desc);
>  		hs_audio_desc[i++] =3D USBDHDR(&as_iso_out_desc);
> -		hs_audio_desc[i++] =3D USBDHDR(&hs_epin_fback_desc);
> +		if (EPOUT_FBACK_IN_EN(opts))
> +			hs_audio_desc[i++] =3D USBDHDR(&hs_epin_fback_desc);
>  	}
>  	if (EPIN_EN(opts)) {
>  		hs_audio_desc[i++] =3D USBDHDR(&std_as_in_if0_desc);
> @@ -706,11 +722,14 @@ static void setup_descriptor(struct f_uac2_opts *op=
ts)
>  			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
>  			return -ENODEV;
>  		}
> -		agdev->in_ep_fback =3D usb_ep_autoconfig(gadget,
> +		if (EPOUT_FBACK_IN_EN(uac2_opts)) {
> +			agdev->in_ep_fback =3D usb_ep_autoconfig(gadget,
>  						       &fs_epin_fback_desc);
> -		if (!agdev->in_ep_fback) {
> -			dev_err(dev, "%s:%d Error!\n", __func__, __LINE__);
> -			return -ENODEV;
> +			if (!agdev->in_ep_fback) {
> +				dev_err(dev, "%s:%d Error!\n",
> +					__func__, __LINE__);
> +				return -ENODEV;
> +			}
>  		}
>  	}
> =20
> @@ -1057,11 +1076,68 @@ static void f_uac2_attr_release(struct config_ite=
m *item)
>  									\
>  CONFIGFS_ATTR(f_uac2_opts_, name)
> =20
> +#define UAC2_ATTRIBUTE_SYNC(name)					\
> +static ssize_t f_uac2_opts_##name##_show(struct config_item *item,	\
> +					 char *page)			\
> +{									\
> +	struct f_uac2_opts *opts =3D to_f_uac2_opts(item);		\
> +	int result;							\
> +	char *str;							\
> +									\
> +	mutex_lock(&opts->lock);					\
> +	switch (opts->name) {						\
> +	case USB_ENDPOINT_SYNC_ASYNC:					\
> +		str =3D "async";						\
> +		break;							\
> +	case USB_ENDPOINT_SYNC_ADAPTIVE:				\
> +		str =3D "adaptive";					\
> +		break;							\
> +	default:							\
> +		str =3D "unknown";					\
> +		break;							\
> +	}								\
> +	result =3D sprintf(page, "%s\n", str);				\
> +	mutex_unlock(&opts->lock);					\
> +									\
> +	return result;							\
> +}									\
> +									\
> +static ssize_t f_uac2_opts_##name##_store(struct config_item *item,	\
> +					  const char *page, size_t len)	\
> +{									\
> +	struct f_uac2_opts *opts =3D to_f_uac2_opts(item);		\
> +	int ret =3D 0;							\
> +									\
> +	mutex_lock(&opts->lock);					\
> +	if (opts->refcnt) {						\
> +		ret =3D -EBUSY;						\
> +		goto end;						\
> +	}								\
> +									\
> +	if (!strncmp(page, "async", 5))					\
> +		opts->name =3D USB_ENDPOINT_SYNC_ASYNC;			\
> +	else if (!strncmp(page, "adaptive", 8))				\
> +		opts->name =3D USB_ENDPOINT_SYNC_ADAPTIVE;		\
> +	else {								\
> +		ret =3D -EINVAL;						\
> +		goto end;						\
> +	}								\
> +									\
> +	ret =3D len;							\
> +									\
> +end:									\
> +	mutex_unlock(&opts->lock);					\
> +	return ret;							\
> +}									\
> +									\
> +CONFIGFS_ATTR(f_uac2_opts_, name)
> +
>  UAC2_ATTRIBUTE(p_chmask);
>  UAC2_ATTRIBUTE(p_srate);
>  UAC2_ATTRIBUTE(p_ssize);
>  UAC2_ATTRIBUTE(c_chmask);
>  UAC2_ATTRIBUTE(c_srate);
> +UAC2_ATTRIBUTE_SYNC(c_sync);
>  UAC2_ATTRIBUTE(c_ssize);
>  UAC2_ATTRIBUTE(req_number);
> =20
> @@ -1072,6 +1148,7 @@ static void f_uac2_attr_release(struct config_item =
*item)
>  	&f_uac2_opts_attr_c_chmask,
>  	&f_uac2_opts_attr_c_srate,
>  	&f_uac2_opts_attr_c_ssize,
> +	&f_uac2_opts_attr_c_sync,
>  	&f_uac2_opts_attr_req_number,
>  	NULL,
>  };
> @@ -1110,6 +1187,7 @@ static struct usb_function_instance *afunc_alloc_in=
st(void)
>  	opts->c_chmask =3D UAC2_DEF_CCHMASK;
>  	opts->c_srate =3D UAC2_DEF_CSRATE;
>  	opts->c_ssize =3D UAC2_DEF_CSSIZE;
> +	opts->c_sync =3D UAC2_DEF_CSYNC;
>  	opts->req_number =3D UAC2_DEF_REQ_NUM;
>  	return &opts->func_inst;
>  }
> diff --git a/drivers/usb/gadget/function/u_uac2.h b/drivers/usb/gadget/fu=
nction/u_uac2.h
> index b503571..13589c3 100644
> --- a/drivers/usb/gadget/function/u_uac2.h
> +++ b/drivers/usb/gadget/function/u_uac2.h
> @@ -21,6 +21,7 @@
>  #define UAC2_DEF_CCHMASK 0x3
>  #define UAC2_DEF_CSRATE 64000
>  #define UAC2_DEF_CSSIZE 2
> +#define UAC2_DEF_CSYNC		USB_ENDPOINT_SYNC_ASYNC
>  #define UAC2_DEF_REQ_NUM 2
> =20
>  struct f_uac2_opts {
> @@ -31,6 +32,7 @@ struct f_uac2_opts {
>  	int				c_chmask;
>  	int				c_srate;
>  	int				c_ssize;
> +	int				c_sync;
>  	int				req_number;
>  	bool				bound;
> =20
> --=20
> 1.9.1
>=20

--=20

Thanks,
Peter Chen=
