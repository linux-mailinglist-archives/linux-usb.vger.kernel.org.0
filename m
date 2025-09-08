Return-Path: <linux-usb+bounces-27717-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 03114B4927E
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 17:07:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7416B188ACDF
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 15:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 540D42EFD86;
	Mon,  8 Sep 2025 15:06:19 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E9C4690
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 15:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757343979; cv=none; b=VPUDWisVIalHCIv+cyBDNJv+Sj+iEDnFR045iugUfyV9VFOIQydFBRo9Ouau8814UKUU09rND26q0RpvkiDrjinGHtxyUQTRnmGlaK48FJSMN+YyaPRJOWyYVojjR8ypydkDouM7Sfco9J0KyEozOEIsx5GGXoPDABepWfaSg7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757343979; c=relaxed/simple;
	bh=09VlF5sGc7EFG1okH0ns2V7M1MUaEroH+JoHebHI1RE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjcMQxKVIrTYrjw2ZRx+PVMEhaMhwYPE5O9qbTlOWEeZxZhDZ+xqU4gBWefeW5JNo8AlD9BYoaFPgorlOYT3gpmkClXYP/rcuMOkywxZsdltUnr/jOJkSZNXnglTa0bvQAcen4lOSmlTR/H9gvOqDd7hBBlx3gZbje7xdO74ymE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uvdQO-0001XM-Si; Mon, 08 Sep 2025 17:04:56 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uvdQL-000Gju-1h;
	Mon, 08 Sep 2025 17:04:53 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uvdQL-001K7X-1N;
	Mon, 08 Sep 2025 17:04:53 +0200
Message-ID: <4d46f4997e1c73aa5b10bdb61dec6760c30fa2f1.camel@pengutronix.de>
Subject: Re: [PATCH v2 18/22] phy: apple: Add Apple Type-C PHY
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sven Peter <sven@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Felipe
 Balbi <balbi@kernel.org>,  Janne Grunau <j@jannau.net>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Thinh
 Nguyen <Thinh.Nguyen@synopsys.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, Frank Li <Frank.Li@nxp.com>, Ran Wang
 <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Hector
	Martin <marcan@marcan.st>
Date: Mon, 08 Sep 2025 17:04:53 +0200
In-Reply-To: <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
	 <20250906-atcphy-6-17-v2-18-52c348623ef6@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

Hi Sven,

On Sa, 2025-09-06 at 15:43 +0000, Sven Peter wrote:
> The Apple Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon SoC=
s.
> The PHY handles muxing between these different protocols and also provide=
s
> the reset controller for the attached dwc3 USB controller.
>=20
> There is no documentation available for this PHY and the entire sequence
> of MMIO pokes has been figured out by tracing all MMIO access of Apple's
> driver under a thin hypervisor and correlating the register reads/writes
> to their kernel's debug output to find their names. Deviations from this
> sequence generally results in the port not working or, especially when
> the mode is switched to USB4 or Thunderbolt, to some watchdog resetting
> the entire SoC.
>=20
> This initial commit already introduces support for Display Port and
> USB4/Thunderbolt but the drivers for these are not ready. We cannot
> control the alternate mode negotiation and are stuck with whatever Apple'=
s
> firmware decides such that any DisplayPort or USB4/Thunderbolt device wil=
l
> result in a correctly setup PHY but not be usable until the other drivers
> are upstreamed as well.
>=20
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  MAINTAINERS                |    1 +
>  drivers/phy/Kconfig        |    1 +
>  drivers/phy/Makefile       |    1 +
>  drivers/phy/apple/Kconfig  |   14 +
>  drivers/phy/apple/Makefile |    4 +
>  drivers/phy/apple/atc.c    | 2214 ++++++++++++++++++++++++++++++++++++++=
++++++
>  6 files changed, 2235 insertions(+)
>=20
[...]
> diff --git a/drivers/phy/apple/atc.c b/drivers/phy/apple/atc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..9213485234873fcaafeb1d1d9=
de3ddf07767d552
> --- /dev/null
> +++ b/drivers/phy/apple/atc.c
> @@ -0,0 +1,2214 @@
[...]
> +struct apple_atcphy {
[...]
> +	struct reset_controller_dev rcdev;
> +	struct typec_switch *sw;
> +	struct typec_mux *mux;
> +
> +	struct mutex lock;

Consider documenting the purpose of this lock to make 'checkpatch.pl --
strict' happy.

[...]
> +static int atcphy_dp_configure(struct apple_atcphy *atcphy, enum atcphy_=
dp_link_rate lr)
> +{
> +	const struct atcphy_dp_link_rate_configuration *cfg =3D &dp_lr_config[l=
r];
> +	const struct atcphy_mode_configuration *mode_cfg;
> +	int ret;
> +	u32 reg;

This function does a lot of register read-modify-writes.

	lockdep_assert_held(&atcphy->lock);

maybe? Or you could move the 'guard(mutex)(&atcphy->lock);' from
atcphy_dpphy_configure() in here.

[...]
> +static int atcphy_dpphy_configure(struct phy *phy, union phy_configure_o=
pts *opts_)
> +{
> +	struct phy_configure_opts_dp *opts =3D &opts_->dp;
> +	struct apple_atcphy *atcphy =3D phy_get_drvdata(phy);
> +	enum atcphy_dp_link_rate link_rate;
> +
> +	if (opts->set_voltages)
> +		return -EINVAL;
> +	if (opts->set_lanes)
> +		return -EINVAL;
> +
> +	if (opts->set_rate) {
> +		guard(mutex)(&atcphy->lock);
> +
> +		switch (opts->link_rate) {
> +		case 1620:
> +			link_rate =3D ATCPHY_DP_LINK_RATE_RBR;
> +			break;
> +		case 2700:
> +			link_rate =3D ATCPHY_DP_LINK_RATE_HBR;
> +			break;
> +		case 5400:
> +			link_rate =3D ATCPHY_DP_LINK_RATE_HBR2;
> +			break;
> +		case 8100:
> +			link_rate =3D ATCPHY_DP_LINK_RATE_HBR3;
> +			break;
> +		case 0:
> +			return 0;
> +		default:
> +			dev_err(atcphy->dev, "Unsupported link rate: %d\n", opts->link_rate);
> +			return -EINVAL;
> +		}

Seems to me like this switch(){} doesn't need to be under guard.

> +
> +		return atcphy_dp_configure(atcphy, link_rate);
> +	}
> +
> +	return 0;
> +}
[...]
> +static void _atcphy_dwc3_reset_assert(struct apple_atcphy *atcphy)
> +{
> +	lockdep_assert_held(&atcphy->lock);
> +
> +	clear32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN, PIPEHANDLER_AON=
_GEN_DWC3_RESET_N);
> +	set32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
> +	      PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN);
> +}
> +
> +static int atcphy_dwc3_reset_assert(struct reset_controller_dev *rcdev, =
unsigned long id)
> +{
> +	struct apple_atcphy *atcphy =3D container_of(rcdev, struct apple_atcphy=
, rcdev);
> +	int ret;
> +
> +	guard(mutex)(&atcphy->lock);
> +
> +	_atcphy_dwc3_reset_assert(atcphy);
> +
> +	if (atcphy->pipehandler_up) {
> +		ret =3D atcphy_configure_pipehandler_dummy(atcphy);
> +		if (ret)
> +			dev_warn(atcphy->dev, "Failed to switch PIPE to dummy: %d\n", ret);
> +		else
> +			atcphy->pipehandler_up =3D false;
> +	}
> +
> +	atcphy_usb2_power_off(atcphy);
> +
> +	atcphy->dwc3_running =3D false;
> +
> +	return 0;
> +}
> +
> +static int atcphy_dwc3_reset_deassert(struct reset_controller_dev *rcdev=
, unsigned long id)
> +{
> +	struct apple_atcphy *atcphy =3D container_of(rcdev, struct apple_atcphy=
, rcdev);
> +
> +	guard(mutex)(&atcphy->lock);
> +
> +	clear32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN,
> +		PIPEHANDLER_AON_GEN_DWC3_FORCE_CLAMP_EN);
> +	set32(atcphy->regs.pipehandler + PIPEHANDLER_AON_GEN, PIPEHANDLER_AON_G=
EN_DWC3_RESET_N);
> +
> +	atcphy->dwc3_running =3D true;
> +
> +	return 0;
> +}
> +
> +const struct reset_control_ops atcphy_dwc3_reset_ops =3D {
> +	.assert =3D atcphy_dwc3_reset_assert,
> +	.deassert =3D atcphy_dwc3_reset_deassert,
> +};
> +
> +static int atcphy_reset_xlate(struct reset_controller_dev *rcdev,
> +			      const struct of_phandle_args *reset_spec)
> +{
> +	return 0;
> +}
> +
> +static int atcphy_probe_rcdev(struct apple_atcphy *atcphy)
> +{
> +	atcphy->rcdev.owner =3D THIS_MODULE;
> +	atcphy->rcdev.nr_resets =3D 1;
> +	atcphy->rcdev.ops =3D &atcphy_dwc3_reset_ops;
> +	atcphy->rcdev.of_node =3D atcphy->dev->of_node;
> +	atcphy->rcdev.of_reset_n_cells =3D 0;
> +	atcphy->rcdev.of_xlate =3D atcphy_reset_xlate;
> +
> +	return devm_reset_controller_register(atcphy->dev, &atcphy->rcdev);
> +}

For the reset controller part,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

