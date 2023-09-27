Return-Path: <linux-usb+bounces-648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E857B0747
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 16:48:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id B659F281DBA
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:48:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78150328A2;
	Wed, 27 Sep 2023 14:48:41 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0A51846;
	Wed, 27 Sep 2023 14:48:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C22C433C8;
	Wed, 27 Sep 2023 14:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695826120;
	bh=pQlzDx9sfW0GlC0Y7pgv64nygCPa6BrlC7JafprNCP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bl5pzRPnJbn8R69RlzfxLZsYLcd7bTy1erhWrWzkefed4ZNBTLwDoHhh3WI0s9vrY
	 oIGJeKsnfzGw1V9RLFU84iSr4AysVaJkKBkfCg3djJbCKLYujzkeUHWpUNEibblIwF
	 AhiCXdjtdl1G9XVJPhAHzmg/+FuNmQGcLLJjjCLbbgAqseR8+IF9OAcvFti512XX1S
	 BLEUruF09UdAUW6p73Z9AS6VgWopRMFvXDNn92qKCbif34HVcf7blJ+RRFjOG/L+Uz
	 kzLwNt+jJXC4Ue+Fx5W15WqIetwGZopLjfLVzMa49uc8cTDXowTcDde6Yp+lUOHtQz
	 5yQAI5beGRmzQ==
Date: Wed, 27 Sep 2023 16:48:37 +0200
From: Mark Brown <broonie@kernel.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, srinivas.kandagatla@linaro.org,
	bgoswami@quicinc.com, Thinh.Nguyen@synopsys.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 06/33] ASoC: Add SOC USB APIs for adding an USB backend
Message-ID: <ZRRAxSlk8uvsfMcx@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-7-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euZKnYeBKaUErfx5"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-7-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.


--euZKnYeBKaUErfx5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 02:48:16PM -0700, Wesley Cheng wrote:

> +static struct device_node *snd_soc_find_phandle(struct device *dev)
> +{
> +	struct device_node *node;
> +
> +	node = of_parse_phandle(dev->of_node, "usb-soc-be", 0);

Very nitpicky but this function possibly wants a _usb_ in the name, not
that it *super* matters with it being static.  Or it could just be
inlined into the only user and not worry about the naming at all.

> +/**
> + * snd_soc_usb_get_priv_data() - Retrieve private data stored
> + * @dev: device reference
> + *
> + * Fetch the private data stored in the USB SND SOC structure.
> + *
> + */
> +void *snd_soc_usb_get_priv_data(struct device *dev)
> +{
> +	struct snd_soc_usb *ctx;
> +
> +	ctx = snd_soc_find_usb_ctx(dev);
> +	if (!ctx) {
> +		/* Check if backend device */
> +		mutex_lock(&ctx_mutex);
> +		list_for_each_entry(ctx, &usb_ctx_list, list) {
> +			if (dev->of_node == ctx->dev->of_node) {
> +				mutex_unlock(&ctx_mutex);
> +				goto out;
> +			}
> +		}
> +		mutex_unlock(&ctx_mutex);
> +		ctx = NULL;
> +	}

This seems a lot more expensive than I'd expect for a get_priv_data
operation, usually it's just a container_of() or other constant time
pulling out of a pointer rather than a linked list walk - the sort of
thing that people put at the start of functions and do all the time.
If we need this I think it needs a name that's more clearly tied to the
use case.

I didn't actually find the user of this though?

--euZKnYeBKaUErfx5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUQMIACgkQJNaLcl1U
h9ARZgf8CYja41GdW3VT31//3OXBmHhA+ZyVnUHKPoAk+sVGUSPuWSMWqTuOh8kX
TrPKgwMNXXxoCx9OHwju1RHbawvVqk3u5JcUJbhjoeUJNznxWjlECqzrHh6WyGdL
LRJOl1vyLQKE32a3HCj23yHvD5RSwBDS+v8xLFxT6CH3EUtQ/ss0km0l6jI/6vWy
Q+UxN1Vtn0gbDY7OVRq+wayHhCIypY6Sh/R2NUIzyD/NN3ba8i06y9q571xtInTm
wSpg2pU5eZSPYzP0MUi1thWllS5odon7x41CuVkGn873YXonnOqMuzUb4p9DmAZf
zD42mQwXGJPd5pQUPBGV7mTmP52Gqg==
=q3ep
-----END PGP SIGNATURE-----

--euZKnYeBKaUErfx5--

