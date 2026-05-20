Return-Path: <linux-usb+bounces-37774-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG4qHWiXDWoMzwUAu9opvQ
	(envelope-from <linux-usb+bounces-37774-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:13:44 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633758C2A9
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 61ABB302FC3C
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CEE3DB30B;
	Wed, 20 May 2026 11:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="UIMfPi0n"
X-Original-To: linux-usb@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6CE93D7D9E;
	Wed, 20 May 2026 11:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275612; cv=none; b=czRRWWA2y9ezmJMaW02VH9Hiz1WtODnYrprXkv9RqpjfU2rAAEITIlufIrSCcutGmeRArpDC0q57TeWMu5SqbKL6/J08OgobXcxF93h6coahXADEZhOYxBjNVvsMs3fhXm/NA2BbKlEoi7yF/ctgu6uSTPKEZ/vWOLBn8wWfVhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275612; c=relaxed/simple;
	bh=JRJUo4PXuYN1XhJVP15C+J6R1n1WzcWxMs+6lKcGyXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GnOu/2lB6/l5BBG4titUuNsvHqU8YgV5xd3DxnyUuGJESR5Xy1nJ2mlecE/3W7mqHGgCqpiRHTbUOoqhRAIWDCwmyhPU+j3skvTvx3VOv/Muh5whLeXk/3t0G4XCAGXa0nlsoaqkOYPhTOtWoQu+bDwRAzfydqGd5Qo7uRHfExM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=UIMfPi0n; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JRJUo4PXuYN1XhJVP15C+J6R1n1WzcWxMs+6lKcGyXw=; b=UIMfPi0n+2sixL8bSd9VaSky4K
	RHWEU0+Im4DinWDobN+TIklEhd6YinjY5ra47zGedlGtmCK3VcLA4SdnC/T9Wz+xbv787uc9NCmur
	oE/Pb9YEfcxcHLNfgJgespEqEWtw4n5OmHUUJpLH4OusgknEWNuQPRuBNqljFKhUo5+wDF9F6HKDp
	7be2MVHEYOcgda44vWIrGG8KrxbAhoTugxFAOK6tqo9T6Y/e1aUu/oa9ixbiz6AQcrrmBIpaKFezU
	Ywj+BMGYYbwcxGr5YO+NvKrymVGhCxN9ndMlH+BhpCaopR6UWjmoW1Bez1Zy8MLmFiEb1e5C3LRV6
	xx0+IXow==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 Chaoyi Chen <kernel@airkyi.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject:
 Re: [PATCH v15 7/9] drm/rockchip: cdn-dp: Add multiple bridges to support PHY
 port selection
Date: Wed, 20 May 2026 13:12:49 +0200
Message-ID: <12511061.0AQdONaE2F@phil>
In-Reply-To: <20260304094152.92-8-kernel@airkyi.com>
References:
 <20260304094152.92-1-kernel@airkyi.com>
 <20260304094152.92-8-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[sntech.de,quarantine];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,linuxfoundation.org,oss.qualcomm.com,gmail.com,bootlin.com,kernel.org,rock-chips.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,airkyi.com];
	RCPT_COUNT_TWELVE(0.00)[40];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-37774-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[sntech.de:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-usb@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rock-chips.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5633758C2A9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Am Mittwoch, 4. M=C3=A4rz 2026, 10:41:50 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Chaoyi Chen:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>=20
> The RK3399 has two USB/DP combo PHY and one CDN-DP controller. And
> the CDN-DP can be switched to output to one of the PHYs. If both ports
> are plugged into DP, DP will select the first port for output.
>=20
> This patch adds support for multiple bridges, enabling users to flexibly
> select the output port. For each PHY port, a separate encoder and bridge
> are registered.
>=20
> The change is based on the DRM AUX HPD bridge, rather than the
> extcon approach. This requires the DT to correctly describe the
> connections between the first bridge in bridge chain and DP
> controller. For example, the bridge chain may be like this:
>=20
> PHY aux birdge -> fsa4480 analog audio switch bridge ->
> onnn,nb7vpq904m USB reminder bridge -> USB-C controller AUX HPD bridge
>=20
> In this case, the connection relationships among the PHY aux bridge
> and the DP contorller need to be described in DT.
>=20
> In addition, the cdn_dp_parse_next_bridge_dt() will parses it and
> determines whether to register one or two bridges.
>=20
> Since there is only one DP controller, only one of the PHY ports can
> output at a time. The key is how to switch between different PHYs,
> which is handled by cdn_dp_switch_port() and cdn_dp_enable().
>=20
> There are two cases:
>=20
> 1. Neither bridge is enabled. In this case, both bridges can
> independently read the EDID, and the PHY port may switch before
> reading the EDID.
>=20
> 2. One bridge is already enabled. In this case, other bridges are not
> allowed to read the EDID. So we will try to return the cached EDID.
>=20
> Since the scenario of two ports plug in at the same time is rare,
> I don't have a board which support two TypeC connector to test this.
> Therefore, I tested forced switching on a single PHY port, as well as
> output using a fake PHY port alongside a real PHY port.
>=20
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



