Return-Path: <linux-usb+bounces-29372-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8337CBE2EC9
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 12:50:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAAF93A6FD7
	for <lists+linux-usb@lfdr.de>; Thu, 16 Oct 2025 10:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4746033EAF9;
	Thu, 16 Oct 2025 10:45:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8094333EAE1
	for <linux-usb@vger.kernel.org>; Thu, 16 Oct 2025 10:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760611520; cv=none; b=uluyRlZQWzRPeyd9dQnk+HdeiR7ycwkIHTJN0t0VFffI15uye2xBzz388OutB6TqVyh+6IuxA1yOP0CaEKNNaONO84FWTnGo9yFKJyRan4mReA8LKPi2ZYLN6UGi3iK3rxhYfLYbm9zvGoHz/tSVLelXUIDyGNLlkIRNFyA6TS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760611520; c=relaxed/simple;
	bh=hrYJDosjd+/ob7cWB21JMK3xipvvovksinPUtE1sN0w=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VhNjUlf0c6uAY5BkloFJBthYJql8drTDa1jgMtDgqVARYXxN5bW7GJhipw7+9yiXIxg01gtmo2xQ91Jy10RSBQil4c7p0gIDulmEbDnWeXme/RVyiQM08eY+Kg2XnzotLN4fXNpl9I/GjwpMak5KV16a7WoDHXRzilcCD/+9JU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTW-0003LT-FW; Thu, 16 Oct 2025 12:44:50 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTV-003sP0-11;
	Thu, 16 Oct 2025 12:44:49 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v9LTV-000000006MN-0w7x;
	Thu, 16 Oct 2025 12:44:49 +0200
Message-ID: <47112ace39ea096242e68659d67a401e931abf3a.camel@pengutronix.de>
Subject: Re: [PATCH usb-next v2 5/5] usb: dwc3: Add Apple Silicon DWC3 glue
 layer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa	
 <neal@gompa.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 16 Oct 2025 12:44:49 +0200
In-Reply-To: <20251015-b4-aplpe-dwc3-v2-5-cbd65a2d511a@kernel.org>
References: <20251015-b4-aplpe-dwc3-v2-0-cbd65a2d511a@kernel.org>
	 <20251015-b4-aplpe-dwc3-v2-5-cbd65a2d511a@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

On Mi, 2025-10-15 at 15:40 +0000, Sven Peter wrote:
> The dwc3 controller present on Apple Silicon SoCs like the M1 requires
> a specific order of operations synchronized between its PHY and its
> Type-C controller. Specifically, the PHY first has to go through initial
> bringup (which requires knowledge of the lane mode and orientation)
> before dwc3 itself can be brought up and can then finalize the PHY
> configuration.
> Additionally, dwc3 has to be teared down and re-initialized whenever
> the cable is changed due to hardware quirks that prevent a new device
> from being recognized and due to the PHY being unable to switch lane
> mode or orientation while dwc3 is up and running.
>=20
> These controllers also have a Apple-specific MMIO region after the
> common dwc3 region where some controls have to be updated. PHY bringup
> and shutdown also requires SUSPHY to be enabled for the ports to work
> correctly.
>=20
> In the future, this driver will also gain support for USB3-via-USB4
> tunneling which will require additional tweaks.
>=20
> Add a glue driver that takes of all of these constraints.
>=20
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/usb/dwc3/Kconfig      |  11 +
>  drivers/usb/dwc3/Makefile     |   1 +
>  drivers/usb/dwc3/dwc3-apple.c | 489 ++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 502 insertions(+)
>=20
[...]
> diff --git a/drivers/usb/dwc3/dwc3-apple.c b/drivers/usb/dwc3/dwc3-apple.=
c
> new file mode 100644
> index 0000000000000000000000000000000000000000..6e41bd0e34f461b0c3db9b8a6=
46116458ff816b6
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-apple.c
> @@ -0,0 +1,489 @@
[...]
> +static int dwc3_apple_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct dwc3_apple *appledwc;
> +	int ret;
> +
> +	appledwc =3D devm_kzalloc(&pdev->dev, sizeof(*appledwc), GFP_KERNEL);
> +	if (!appledwc)
> +		return -ENOMEM;
> +
> +	appledwc->dev =3D &pdev->dev;
> +	mutex_init(&appledwc->lock);
> +
> +	appledwc->resets =3D devm_reset_control_array_get_exclusive(dev);

Why is this using an array? The bindings say there is only a single
reset.

regards
Philipp

