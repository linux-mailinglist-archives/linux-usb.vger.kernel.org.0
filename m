Return-Path: <linux-usb+bounces-1730-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E677CC073
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 12:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 879422819AB
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F1C4174C;
	Tue, 17 Oct 2023 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tksSqKua"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F3F3F4D8
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 10:17:52 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 058BA173C
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 03:17:47 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9a58dbd5daeso892195666b.2
        for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 03:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697537865; x=1698142665; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dc8PnUEJdZximeupuAGdt2IG+xNVTQN+dzjyBxNus3s=;
        b=tksSqKuaL6hDrgwRBWYH7bH6PzHG2fWfpfJcYG0NEk8/86y+Tr3r8jpkRDAriykQby
         ayRUIFyCk1P37aBI8N8Z7iaBEpgYFR/f5LSUvb6eMs3VLpPlHVTZWa5JSkWATAtPpbWP
         tnQmvx6kiKBqCwWC3jrLTwVeDznngbRsEy/S7IfAq1xWCY3CHVMja15UqwyPb7LDDW69
         TMDyKHSLzmyZlibVzbHllDWZ9cn8otOv9MX0ImzotCTTwaRQ7B5jlc0GTEINgeODVf3h
         SpGKrNH2Jii81/q+c1ijXUASgLU/ldXwwlGV+io1fMN3oCtfR7iI7fEVqXQneXqx+N66
         GL0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537865; x=1698142665;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dc8PnUEJdZximeupuAGdt2IG+xNVTQN+dzjyBxNus3s=;
        b=iLENWPTSad7aFTdebKyVtMZyLVT3DAMO/ckyJMs2AX+4bx0MCihcDhb5+JMsMW+E3a
         lX/xnrJHyeINWTFhZrHkmLOFo9jD0OFLf1Bs3BSw9DNHlbB3WvdyPciRXOiNjvc3MPLw
         2hrmYn1d3b9h0glus5dT6dlqXvPg6NY55kxdz+MKVwF+VnjHcCB/JZLbujfgmYzkpUW8
         nxA6oWFgvwBgfC5WdCovNOxQv7NuiN/NPzYz0K8Osc8Nv151nibsnsvNJCzOyQJhBgN9
         bfLRSGHpg3t+9E3J/2zgK17WcrfzIJWTiEkFGctXIBQTV3GmhWM2TcMj1LhPQGtxQBjC
         ybnA==
X-Gm-Message-State: AOJu0Yxbj+HcFKLWRhJ/eEHf1FyzAPm8y1renqtnL60nkn5ccCX5FEPG
	D1ZCY7oaTpFmIpyatBRGbOpmCA==
X-Google-Smtp-Source: AGHT+IHZzjaVteQg/Y1z/vuVlirIJmSNKoXLZZrpp7xeh/QcTJt7ihApaXnWdj/IEQYWzvcRY2iAsg==
X-Received: by 2002:a17:907:9496:b0:9b7:1e26:e2ea with SMTP id dm22-20020a170907949600b009b71e26e2eamr1274750ejc.41.1697537865326;
        Tue, 17 Oct 2023 03:17:45 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id n26-20020a17090673da00b009ad8796a6aesm967462ejl.56.2023.10.17.03.17.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 03:17:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Oct 2023 12:17:42 +0200
Message-Id: <CWAMY8EP9RN1.VPH5E7Z1T7JN@fairphone.com>
Subject: Re: [PATCH 2/3] usb: typec: fsa4480: Add support to swap SBU
 orientation
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Heikki Krogerus" <heikki.krogerus@linux.intel.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231013-fsa4480-swap-v1-0-b877f62046cc@fairphone.com>
 <20231013-fsa4480-swap-v1-2-b877f62046cc@fairphone.com>
 <ZS5NV43MhD3YNeDX@kuha.fi.intel.com>
In-Reply-To: <ZS5NV43MhD3YNeDX@kuha.fi.intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Tue Oct 17, 2023 at 11:01 AM CEST, Heikki Krogerus wrote:
> Hi Luca,
>
> On Fri, Oct 13, 2023 at 01:38:06PM +0200, Luca Weiss wrote:
> > On some hardware designs the AUX+/- lanes are connected reversed to
> > SBU1/2 compared to the expected design by FSA4480.
> >=20
> > Made more complicated, the otherwise compatible Orient-Chip OCP96011
> > expects the lanes to be connected reversed compared to FSA4480.
> >=20
> > * FSA4480 block diagram shows AUX+ connected to SBU2 and AUX- to SBU1.
> > * OCP96011 block diagram shows AUX+ connected to SBU1 and AUX- to SBU2.
> >=20
> > So if OCP96011 is used as drop-in for FSA4480 then the orientation
> > handling in the driver needs to be reversed to match the expectation of
> > the OCP96011 hardware.
> >=20
> > Support parsing the data-lanes parameter in the endpoint node to swap
> > this in the driver.
> >=20
> > The parse_data_lanes_mapping function is mostly taken from nb7vpq904m.c=
.
> >=20
> > Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> > ---
> >  drivers/usb/typec/mux/fsa4480.c | 81 +++++++++++++++++++++++++++++++++=
++++++++
> >  1 file changed, 81 insertions(+)
> >=20
> > diff --git a/drivers/usb/typec/mux/fsa4480.c b/drivers/usb/typec/mux/fs=
a4480.c
> > index e0ee1f621abb..6ee467c96fb6 100644
> > --- a/drivers/usb/typec/mux/fsa4480.c
> > +++ b/drivers/usb/typec/mux/fsa4480.c
> > @@ -9,6 +9,7 @@
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> >  #include <linux/mutex.h>
> > +#include <linux/of_graph.h>
>
> If you don't mind, let's keep this driver ready for ACPI, just in
> case...

I'm quite clueless about any details about ACPI but makes sense to use
the generic APIs.

>
> >  #include <linux/regmap.h>
> >  #include <linux/usb/typec_dp.h>
> >  #include <linux/usb/typec_mux.h>
> > @@ -60,6 +61,7 @@ struct fsa4480 {
> >  	unsigned int svid;
> > =20
> >  	u8 cur_enable;
> > +	bool swap_sbu_lanes;
> >  };
> > =20
> >  static const struct regmap_config fsa4480_regmap_config =3D {
> > @@ -76,6 +78,9 @@ static int fsa4480_set(struct fsa4480 *fsa)
> >  	u8 enable =3D FSA4480_ENABLE_DEVICE;
> >  	u8 sel =3D 0;
> > =20
> > +	if (fsa->swap_sbu_lanes)
> > +		reverse =3D !reverse;
> > +
> >  	/* USB Mode */
> >  	if (fsa->mode < TYPEC_STATE_MODAL ||
> >  	    (!fsa->svid && (fsa->mode =3D=3D TYPEC_MODE_USB2 ||
> > @@ -179,12 +184,84 @@ static int fsa4480_mux_set(struct typec_mux_dev *=
mux, struct typec_mux_state *st
> >  	return ret;
> >  }
> > =20
> > +enum {
> > +	NORMAL_LANE_MAPPING,
> > +	INVERT_LANE_MAPPING,
> > +};
> > +
> > +#define DATA_LANES_COUNT	2
> > +
> > +static const int supported_data_lane_mapping[][DATA_LANES_COUNT] =3D {
> > +	[NORMAL_LANE_MAPPING] =3D { 0, 1 },
> > +	[INVERT_LANE_MAPPING] =3D { 1, 0 },
> > +};
> > +
> > +static int fsa4480_parse_data_lanes_mapping(struct fsa4480 *fsa)
> > +{
> > +	struct device_node *ep;
>
>         struct fwnode_handle *ep;
>
> > +	u32 data_lanes[DATA_LANES_COUNT];
> > +	int ret, i, j;
> > +
> > +	ep =3D of_graph_get_next_endpoint(fsa->client->dev.of_node, NULL);
>
> Shouldn't you loop through the endpoints? In any case:
>
>         ep =3D fwnode_graph_get_next_endpoint(dev_fwnode(&fsa->client->de=
v, NULL));

The docs only mention one endpoint so I'm assuming just next_endpoint is
fine?

>
> > +	if (!ep)
> > +		return 0;
> > +
> > +	ret =3D of_property_count_u32_elems(ep, "data-lanes");
>
>         ret =3D fwnode_property_count_u32(ep, "data-lanes");
>
> But is this necessary at all in this case - why not just read the
> array since you expect a fixed size for it (if the read fails it fails)?

Hm yeah that should be okay.. Will check the docs
of_property_read_u32_array (or well fwnode_property_read_u32_array) to
see if there's any gotchas if there's less or more elements provided.

Regards
Luca

>
> > +	if (ret =3D=3D -EINVAL)
> > +		/* Property isn't here, consider default mapping */
> > +		goto out_done;
> > +	if (ret < 0)
> > +		goto out_error;
> > +
> > +	if (ret !=3D DATA_LANES_COUNT) {
> > +		dev_err(&fsa->client->dev, "expected 2 data lanes\n");
> > +		ret =3D -EINVAL;
> > +		goto out_error;
> > +	}
> > +
> > +	ret =3D of_property_read_u32_array(ep, "data-lanes", data_lanes, DATA=
_LANES_COUNT);
>
>         ret =3D fwnode_property_read_u32_array(ep, "data-lanes", data_lan=
es, DATA_LANES_COUNT);
>
> > +	if (ret)
> > +		goto out_error;
> > +
> > +	for (i =3D 0; i < ARRAY_SIZE(supported_data_lane_mapping); i++) {
> > +		for (j =3D 0; j < DATA_LANES_COUNT; j++) {
> > +			if (data_lanes[j] !=3D supported_data_lane_mapping[i][j])
> > +				break;
> > +		}
> > +
> > +		if (j =3D=3D DATA_LANES_COUNT)
> > +			break;
> > +	}
> > +
> > +	switch (i) {
> > +	case NORMAL_LANE_MAPPING:
> > +		break;
> > +	case INVERT_LANE_MAPPING:
> > +		fsa->swap_sbu_lanes =3D true;
> > +		dev_info(&fsa->client->dev, "using inverted data lanes mapping\n");
>
> That is just noise. Please drop it.
>
> > +		break;
> > +	default:
> > +		dev_err(&fsa->client->dev, "invalid data lanes mapping\n");
> > +		ret =3D -EINVAL;
> > +		goto out_error;
> > +	}
> > +
> > +out_done:
> > +	ret =3D 0;
> > +
> > +out_error:
> > +	of_node_put(ep);
> > +
> > +	return ret;
> > +}
> > +
> >  static int fsa4480_probe(struct i2c_client *client)
> >  {
> >  	struct device *dev =3D &client->dev;
> >  	struct typec_switch_desc sw_desc =3D { };
> >  	struct typec_mux_desc mux_desc =3D { };
> >  	struct fsa4480 *fsa;
> > +	int ret;
> > =20
> >  	fsa =3D devm_kzalloc(dev, sizeof(*fsa), GFP_KERNEL);
> >  	if (!fsa)
> > @@ -193,6 +270,10 @@ static int fsa4480_probe(struct i2c_client *client=
)
> >  	fsa->client =3D client;
> >  	mutex_init(&fsa->lock);
> > =20
> > +	ret =3D fsa4480_parse_data_lanes_mapping(fsa);
> > +	if (ret)
> > +		return ret;
> > +
> >  	fsa->regmap =3D devm_regmap_init_i2c(client, &fsa4480_regmap_config);
> >  	if (IS_ERR(fsa->regmap))
> >  		return dev_err_probe(dev, PTR_ERR(fsa->regmap), "failed to initializ=
e regmap\n");
> >=20
> > --=20
> > 2.42.0


