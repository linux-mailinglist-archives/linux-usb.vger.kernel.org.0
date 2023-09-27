Return-Path: <linux-usb+bounces-649-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 244677B0749
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 16:50:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id DB74E282352
	for <lists+linux-usb@lfdr.de>; Wed, 27 Sep 2023 14:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C4BF33982;
	Wed, 27 Sep 2023 14:50:13 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5D1C1846;
	Wed, 27 Sep 2023 14:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43D4C433C7;
	Wed, 27 Sep 2023 14:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695826212;
	bh=S3t6WfkBtrlDPyuQRQNCERHweGiWYZNq6In/oIlqkrY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xqxl9YtfF6gBWEWkIBqKeC00ViFsurxit8aICZyKBgxLkzQoi3sNactgDQgsQQnLv
	 M/g88sOmrJaThi22O6njdm/mYIzheuoxffYc0hYtqL7HMoLB+8XJ9kSLofzNbW8/Oe
	 TycmM4/lWZKFT1/C64CKzRK8G1w/Yr1mjU/BZi3Rj8QECEh+FQ/NTHxeFVnxwpK2E2
	 j6cmNrD0z6R/jlTDbqOSGXX09wxZeq9QU+3IGq6ehOSy+sFAPa9EJ5W9VRJCK3QTFg
	 iuxAe4AmbO4cZA/iEEAacM4CnYJ8D/q9UsycbydPntdakXXnAP+rERnjji24AVVDb7
	 dANP334bOgQEg==
Date: Wed, 27 Sep 2023 16:50:09 +0200
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
Subject: Re: [PATCH v7 09/33] ASoC: qdsp6: q6afe: Increase APR timeout
Message-ID: <ZRRBIa+bVSqTHprO@finisterre.sirena.org.uk>
References: <20230921214843.18450-1-quic_wcheng@quicinc.com>
 <20230921214843.18450-10-quic_wcheng@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68PF2jVZjsLysHnC"
Content-Disposition: inline
In-Reply-To: <20230921214843.18450-10-quic_wcheng@quicinc.com>
X-Cookie: Save energy:  Drive a smaller shell.


--68PF2jVZjsLysHnC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 21, 2023 at 02:48:19PM -0700, Wesley Cheng wrote:
> For USB offloading situations, the AFE port start command will result in a
> QMI handshake between the Q6DSP and the main processor.  Depending on if
> the USB bus is suspended, this routine would require more time to complete,
> as resuming the USB bus has some overhead associated with it.  Increase the
> timeout to 3s to allow for sufficient time for the USB QMI stream enable
> handshake to complete.

...

> -#define TIMEOUT_MS 1000
> +#define TIMEOUT_MS 3000

That seems worryingly large but if it's what the hardware/firmware needs
I guess there's nothing doing - even the 1s that's being replaced would
be nasty if we ever actually hit it.

--68PF2jVZjsLysHnC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmUUQSAACgkQJNaLcl1U
h9BZgAf/cEFWzCSLaDAf1NhbSXiH8O1hyl3xIAiZQXxybdY1U6/Tveia8sc7xRZq
ZMFhARjaEtXLKPUh5UH3IpUKdSWAo7Tf/4tF5Z6H40kY0j9WYhzeM7ciaxZc8LC9
Ftmj8/TB2CZ+AQj3At+M2lO/LL39vyBdhBntF94GF8jcnti2PbW86dvm9swf01hx
JOKfMH3zsHDKBw9/0SoDVR7Db1ZfXbgzePottCPmleVVNqVT0NTzQmadCVyfsZk0
8dJWSynhbPUGoCy7ujs9wtWPEgNHCqjsj75W+4pDSA1x8fOAyPmRsWEqlwaX7fSr
tKy9Yo3pp0eL9YD7mwrpBHUe4OjDrg==
=SlIC
-----END PGP SIGNATURE-----

--68PF2jVZjsLysHnC--

