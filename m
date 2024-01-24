Return-Path: <linux-usb+bounces-5458-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E126283AA7D
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 14:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8226D1F2A43C
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jan 2024 13:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDB17A704;
	Wed, 24 Jan 2024 12:57:50 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FB477F36
	for <linux-usb@vger.kernel.org>; Wed, 24 Jan 2024 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706101070; cv=none; b=rTpPG9L0YBM8r/FbatM01+TxgsgAKWZ5gQ2CkKzKnwjdw2wdZLPNhRcEhAItgGGTY+cqvlCXv1rwjzbq3+iL3KeubSqUlMJp+alj/t05HBV7Qxsmv8G1+5g0+JqgkyjgKv8rp27ZDAg+W9fLUGkN+yJjep29mBwHG0wFqprtyQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706101070; c=relaxed/simple;
	bh=tJ+470kAh1XcjBObyL4GrXop5Kek18ea66H3lxd7KMc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rfB9qfzW6MQzH1pzqe7tsV3DNo8HNubh8D1CrRPAQCKYNeb5qI9R55Ghk6voyzzDzJhQ+v/je9d/Wqzsi0JCK88VttIBgelVzgscuxlg6cG3bCKKxEVsyEvM0Fak3UXYWyEFc1c2KurmVG/VaPMstTiAkr00Rg4IfLYX/ydz8Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rScp6-0002i4-Oi; Wed, 24 Jan 2024 13:57:44 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rScp5-00243g-Ry; Wed, 24 Jan 2024 13:57:43 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rScp0-000BVW-2V;
	Wed, 24 Jan 2024 13:57:38 +0100
Message-ID: <7b85f1490b990ef881b07b1dde32b94e43e427c0.camel@pengutronix.de>
Subject: Re: [PATCH] usb: dwc3-of-simple: Stop using
 of_reset_control_array_get() directly
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Neil Armstrong
 <neil.armstrong@linaro.org>,  Felipe Balbi <balbi@kernel.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 24 Jan 2024 13:57:38 +0100
In-Reply-To: <2024012441-gender-crock-016c@gregkh>
References: 
	<20240124-dwc3-of-simple-reset-control-array-fix-v1-1-808182cc3f0e@pengutronix.de>
	 <2024012441-gender-crock-016c@gregkh>
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

On Mi, 2024-01-24 at 04:39 -0800, Greg Kroah-Hartman wrote:
> On Wed, Jan 24, 2024 at 12:26:20PM +0100, Philipp Zabel wrote:
> > Use of_reset_control_array_get_optional_exclusive() instead, it is
> > implemented as:
> >=20
> >   static inline struct reset_control *
> >   of_reset_control_array_get_optional_exclusive(struct device_node *nod=
e)
> >   {
> >           return of_reset_control_array_get(node, false, true, true);
> >   }
> >=20
> > This makes the code easier to understand and removes the last remaining
> > direct use of of_reset_control_array_get(). No functional changes.
>=20
> Does this mean the function should be removed or made static now?

I consider "hiding" it from general use by renaming it to
__of_reset_control_array_get().

There are other, indirect users of this function, but it is always
called via a more self-explanatory static inline function:

drivers/amba/bus.c:
	of_reset_control_array_get_optional_shared()

drivers/net/dsa/lantiq_gswip.c:
	of_reset_control_array_get_exclusive()

drivers/phy/cadence/phy-cadence-sierra.c:
	of_reset_control_array_get_exclusive()

drivers/phy/cadence/phy-cadence-torrent.c:
	of_reset_control_array_get_exclusive()

drivers/soc/tegra/pmc.c:
	of_reset_control_array_get_exclusive_released()

drivers/usb/dwc3/dwc3-of-simple.c:
	of_reset_control_array_get()

I would like to eventually replace the use of multiple boolean
parameters for configuration. It is hard to read and errors have
slipped through in the past (e.g. a57f68ddc886, "reset: Fix devm bulk
optional exclusive control getter").

regards
Philipp

