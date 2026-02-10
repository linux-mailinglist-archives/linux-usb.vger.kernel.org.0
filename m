Return-Path: <linux-usb+bounces-33259-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEncIpcwi2kFRgAAu9opvQ
	(envelope-from <linux-usb+bounces-33259-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 14:20:23 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C2F11B2BD
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 14:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D4A56300D0B4
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 13:20:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35378329C48;
	Tue, 10 Feb 2026 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YPpChklP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0253207A32;
	Tue, 10 Feb 2026 13:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770729612; cv=none; b=iL0V0U+6JVCE3Og/4STvpemwgJ2yzB/1ypz2m9oJ1Z8MgWvib2n23xA6DUfr1YuX2FwQE+zw/Znd0hC93kFHO4sL/BUtwPPmGMLVAcTeSb3R0Tzy7XYgtNRHnVfjivgLKN1Ln2qQvSmI3lr9pTnCHSs5MjZPLhyY5/Ql5f7016k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770729612; c=relaxed/simple;
	bh=toSC5s+ubaUUQaH7VZ/GqRFBz3eGQyNTwdjaeHc2VOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kkehz5VFS5WT+dwzdV4nMfmCQ1HRn8mae5Y+jsUXkscCzOgdsxhtGdDwHZYZiDJ7UfqPC8wTJDw3OiCGvsOGEBgGjIWZEgUiooLmJCSKVtfsEy0nrGY/0KD27RBo+UC4boqucvM1txzQGU0kvmhjTA4x1ySachoajsF9vFH2mbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YPpChklP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B412C116C6;
	Tue, 10 Feb 2026 13:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770729612;
	bh=toSC5s+ubaUUQaH7VZ/GqRFBz3eGQyNTwdjaeHc2VOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPpChklPzlPeYgA7aSDANV1jRvt8+tIXhuhKwJkglgOWOtG/5xoCWuiGxbY68H6+I
	 xZwnBO7rSMcAvIZKz+sLlXkh+JFL3Aa9b+UWRpE0byrqziu4vSb5oUMU497IHVvko3
	 bzTs3A/BLQfn5YvT1QfyudoHMhWhAzYRkX9cuaRM=
Date: Tue, 10 Feb 2026 14:20:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v4 0/5] Add onboard-dev USB hub host managed vbus
 handling support
Message-ID: <2026021026-unaired-freebie-718a@gregkh>
References: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
 <DGB2E17NBWO2.544ZZ15AEBLC@linux.dev>
 <20260210123228.wmtyf3ezwratne5k@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210123228.wmtyf3ezwratne5k@pengutronix.de>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33259-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[13];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5C2F11B2BD
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 01:32:28PM +0100, Marco Felsch wrote:
> Hi,
> 
> On 26-02-10, Ze Huang wrote:
> > On Fri Sep 12, 2025 at 4:22 AM CST, Marco Felsch wrote:
> > > Hi,
> > >
> > > the whole purpose of this series is to make it possible to control the
> > > USB VBUS regulators of an USB hub via host managed regulators.
> > >
> > > Regards,
> > >   Marco
> > >
> > > ---
> > > Changes in v4:
> > > - dt-bindings: change to vbus-supply and shift doc to usb-device.yaml
> > > - onboard_dev: make use of new regulator API to parse child device
> > >                regulators.
> > > - onboard_dev: drop hard coded downstream port number and make it more
> > >                dynamic
> > > - onboard_dev: drop limiting support to SMSC hubs
> > > - Link to v3: https://lore.kernel.org/r/20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de
> > >
> > > Changes in v3:
> > > - fix dt-bindings issues
> > > - Link to v2: https://lore.kernel.org/all/20250327172803.3404615-1-m.felsch@pengutronix.de/
> > >
> > > Changes in v2:
> > > - fix compile time errors in case the module builds
> > > - Link to v1: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/
> > >
> > > ---
> > > Marco Felsch (5):
> > >       usb: port: track the disabled state
> > >       usb: hub: add infrastructure to pass onboard_dev port features
> > >       dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
> > >       dt-bindings: usb: microchip,usb2514: add vbus-supply example
> > >       usb: misc: onboard_dev: add hub downstream port host vbus-supply handling
> > >
> > >  .../devicetree/bindings/usb/microchip,usb2514.yaml |   7 ++
> > >  .../devicetree/bindings/usb/usb-device.yaml        |   6 ++
> > >  drivers/usb/core/hub.c                             |  55 +++++++++-
> > >  drivers/usb/core/hub.h                             |   4 +
> > >  drivers/usb/core/port.c                            |   6 ++
> > >  drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++++++++
> > >  include/linux/usb.h                                |   3 +
> > >  7 files changed, 196 insertions(+), 2 deletions(-)
> > > ---
> > > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > > change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086
> > >
> > > Best regards,
> > 
> > Hi Marco,
> > 
> > I'm checking in to ask about the status of this patch series.
> > 
> > We are currently working on the Spacemit K1 SoC and we have a use case
> > that requires onboard_dev to manage the USB VBUS regulator. This series
> > would be very helpful for us :)
> 
> :)
> 
> > Link: https://lore.kernel.org/all/DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev/
> 
> Regarding the status of this series. Rob provided his r-b tag once I
> fixed the minor typo. I also need to fix bug [1] which is triggered by
> the asix binding. I could move the 'vbus-supply' example to the
> usb-device.yaml.
> 
> @Greg, @USB-maintainers
> Are the driver changes OK?

I have no idea, this thread was from a very long time ago.  Please
resubmit after rebasing on 7.0-rc1 when it is out as we can't do
anything with any new patches until then anyway.

thanks,

greg k-h

