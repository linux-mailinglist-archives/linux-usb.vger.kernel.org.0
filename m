Return-Path: <linux-usb+bounces-37771-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCVqNrqVDWoMzwUAu9opvQ
	(envelope-from <linux-usb+bounces-37771-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:06:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222F58C1BF
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 13:06:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9D636303DA96
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 11:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6C8F3DA5B7;
	Wed, 20 May 2026 11:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="RYBTev16"
X-Original-To: linux-usb@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5CF3D6465;
	Wed, 20 May 2026 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779275011; cv=none; b=MWjfUVSv3afCJV/RzbWhRiPK+VUWA9mi36ooLhWVByJcADWooA1tMGphr0FwRBHhEdRD3xdT/mOUrceFu60Ja1bzIGqDGxBOGblWrmvfKLeeeEuSZBfr21ewbM145I2SImaf508FuIqrhO//DR/jgdp8e8xjU0bQ4ZWdbLUMsmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779275011; c=relaxed/simple;
	bh=QnDCM7xAlCAkIXGCnMd9mUnAUFCYybLAWsbrLk9JNW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GdgTN0WZue+gbS277GvAuu+lqYcVZ3lGowv1xiAQxw8qYMt6J2GE/WfYE1EKqPBpFGv6mO5Vck6EStoa6ZxBLRpr3fIvH1mPfKhOXF5CUUwVxn82wDScgSUrK85Pi3+IT4eHPc+WbVoCp1IRtbT0cwW+1mI2k1bQD4o/fnHk7ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=RYBTev16; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=0pSVK+9EQxqVMM7Yjv49ZmJRac0skbNKar4/N2MFVSo=; b=RYBTev16Cq3YvXNlWCcs0wFF69
	eDsv+adZLd1yT5ULefQtKo+X44tNcAfUl7t5o/+u1cHreJ/abr4bRZAV5wiboCua7jRg8cb4PKW8+
	iV8dK9Iwn/0DzGNqFo9QYDao4UtZXXZN4gEdvRcrawQmjOn4gaeea5dZino47REa62XIqncgRRbG4
	WHmyxcV/KDsnFDUSbfsKoZ3kLMCN6lQS9L3ky99UPpD9mHwBimd7B0+XIZPHeACsIgJ/cfmCa5MJ6
	rVJ/9tdrUlRY+PFZTbKHebAYyizsnFaclzUbWe2lc3+DVt34ghHvhSYC3+iRF3wrpIix+IcQ+vHFc
	9xKGG2CQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Chaoyi Chen <kernel@airkyi.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>, Hugh Cole-Baker <sigmaris@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v15 0/9] Add Type-C DP support for RK3399 EVB IND board
Date: Wed, 20 May 2026 13:03:00 +0200
Message-ID: <4958503.687JKscXgg@phil>
In-Reply-To: <c0bc4796-afe5-40ff-8816-9605a6114d23@rock-chips.com>
References:
 <20260304094152.92-1-kernel@airkyi.com> <agxo8ic94e81nQRx@kuha>
 <c0bc4796-afe5-40ff-8816-9605a6114d23@rock-chips.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[sntech.de:s=gloria202408];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37771-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[40];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[sntech.de:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heiko@sntech.de,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[airkyi.com,linuxfoundation.org,gmail.com,kernel.org,rock-chips.com,intel.com,ideasonboard.com,kwiboo.se,linux.intel.com,suse.de,ffwll.ch,google.com,manjaro.org,cknow.org,vger.kernel.org,lists.infradead.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sntech.de:dkim,rock-chips.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 4222F58C1BF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

Am Mittwoch, 20. Mai 2026, 03:13:25 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Chaoyi Chen:
> Hello Heikki,
>=20
> On 5/19/2026 9:43 PM, Heikki Krogerus wrote:
> > Hi,
> >=20
> > On Wed, Mar 04, 2026 at 05:41:43PM +0800, Chaoyi Chen wrote:
> >> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> >>
> >> This series focuses on adding Type-C DP support for USBDP PHY and DP
> >> driver. The USBDP PHY and DP will perceive the changes in cable status
> >> based on the USB PD and Type-C state machines provided by TCPM. Before
> >> this, the USBDP PHY and DP controller of RK3399 sensed cable state
> >> changes through extcon, and devices such as the RK3399 Gru-Chromebook
> >> rely on them. This series should not break them.
> >=20
> > What's the status with this series?
> > Are these inteded to go via the DRM tree?
> >=20
> > thanks,
> >=20
>=20
> Thank you very much for your continued attention to this series.
> The maintainers seem quite busy... Despite there being no further review
> comments, this series have yet to be merged into the DRM tree.=20
>=20
> And some of my other patches are in the same situation.=20
> Do you happen to know what the next steps should be? Thank you.

=46or this series, I would think it'd be best to split it a bit.

=2D Make patches 1, 2, 5-7 its own series
  * patch 5 _should_ be included here, needs an Ack from the phy-maintainer
    to go through the drm-tree. It does look independent from the other
    phy changes (code changes themself), but needs the function from patch =
2.

=2D Make patches 3+4 its own series, so that phy maintainers notice
  The code-changes themself seem independent of the rest
  * Reference the drm-series and explicity note that the phy-patch in it
    needs an Ack from the phy maintainer to through the drm-tree
    Hopefully helps to get that
  * patch 1 has a Reviewed-by from the type-c side, but needs someone
    knowing drm-bridge internals to agree

=2D Makes patches 8+9 its own series, reference both series from above
  as dependencies.


That would be my take here, to have the right maintainers notice they
should do something.


Heiko



