Return-Path: <linux-usb+bounces-33554-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cIUiGuQ6nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33554-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:32:52 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D55BE1758E1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:32:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DA11B305BFC1
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E9ED361655;
	Mon, 23 Feb 2026 11:30:10 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEB83612FC
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846209; cv=none; b=NxA4b3XhIE7NBYd8JZ71af11hI8wUzOanSQG7NTrq0VBhq5izM62y/1E7mpUIdWlF21V/yvWYdjc4AQ4AW14qPjnyUOueCRqhH3/q5D555jU35bN2a8CAOvaXtffwqQ6HV5zWS3lNuiHD0uBgr6DVgIfR5rO8oRy2kp2LkTFEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846209; c=relaxed/simple;
	bh=8YjvCCTJQThSHSl4/WosfSZfGfAST0lh4/3Iw7AHNkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qata0DJButXgKrqc6/luktyd7JofeVDO8OJNLFckoD+g/lpFFxM1TJ6CXLYZsaZ0FEmk8J9GN95dbt32A5OK2Xnx7Ej9koJIskYrHyK0QC1om6h1DObnjkqYaTMcoqx9Iycy91dUmVtbE7tjk17uPJVV6nFmzrr/qgj/lXdHFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU8O-00083k-Eb; Mon, 23 Feb 2026 12:29:52 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU8M-002DlM-1b;
	Mon, 23 Feb 2026 12:29:51 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vuU8N-000000017m6-34xD;
	Mon, 23 Feb 2026 12:29:51 +0100
Date: Mon, 23 Feb 2026 12:29:51 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ze Huang <huang.ze@linux.dev>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v4 0/5] Add onboard-dev USB hub host managed vbus
 handling support
Message-ID: <j2iusfyu5fcblqoxssfgxb2fjdbsz44jgihxpdnppfthehliw3@oap6bppobogb>
References: <20250911-v6-16-topic-usb-onboard-dev-v4-0-1af288125d74@pengutronix.de>
 <DGB2E17NBWO2.544ZZ15AEBLC@linux.dev>
 <20260210123228.wmtyf3ezwratne5k@pengutronix.de>
 <2026021026-unaired-freebie-718a@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026021026-unaired-freebie-718a@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-33554-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pengutronix.de:url]
X-Rspamd-Queue-Id: D55BE1758E1
X-Rspamd-Action: no action

On 26-02-10, Greg Kroah-Hartman wrote:
> On Tue, Feb 10, 2026 at 01:32:28PM +0100, Marco Felsch wrote:
> > Hi,
> > 
> > On 26-02-10, Ze Huang wrote:
> > > On Fri Sep 12, 2025 at 4:22 AM CST, Marco Felsch wrote:
> > > > Hi,
> > > >
> > > > the whole purpose of this series is to make it possible to control the
> > > > USB VBUS regulators of an USB hub via host managed regulators.
> > > >
> > > > Regards,
> > > >   Marco
> > > >
> > > > ---
> > > > Changes in v4:
> > > > - dt-bindings: change to vbus-supply and shift doc to usb-device.yaml
> > > > - onboard_dev: make use of new regulator API to parse child device
> > > >                regulators.
> > > > - onboard_dev: drop hard coded downstream port number and make it more
> > > >                dynamic
> > > > - onboard_dev: drop limiting support to SMSC hubs
> > > > - Link to v3: https://lore.kernel.org/r/20250821-v6-16-topic-usb-onboard-dev-v3-0-6d2b38a5d818@pengutronix.de
> > > >
> > > > Changes in v3:
> > > > - fix dt-bindings issues
> > > > - Link to v2: https://lore.kernel.org/all/20250327172803.3404615-1-m.felsch@pengutronix.de/
> > > >
> > > > Changes in v2:
> > > > - fix compile time errors in case the module builds
> > > > - Link to v1: https://lore.kernel.org/all/20240807-b4-v6-10-topic-usb-onboard-dev-v1-0-f33ce21353c9@pengutronix.de/
> > > >
> > > > ---
> > > > Marco Felsch (5):
> > > >       usb: port: track the disabled state
> > > >       usb: hub: add infrastructure to pass onboard_dev port features
> > > >       dt-bindings: usb: usb-device: add usb hub port vbus-supply suppport
> > > >       dt-bindings: usb: microchip,usb2514: add vbus-supply example
> > > >       usb: misc: onboard_dev: add hub downstream port host vbus-supply handling
> > > >
> > > >  .../devicetree/bindings/usb/microchip,usb2514.yaml |   7 ++
> > > >  .../devicetree/bindings/usb/usb-device.yaml        |   6 ++
> > > >  drivers/usb/core/hub.c                             |  55 +++++++++-
> > > >  drivers/usb/core/hub.h                             |   4 +
> > > >  drivers/usb/core/port.c                            |   6 ++
> > > >  drivers/usb/misc/onboard_usb_dev.c                 | 117 +++++++++++++++++++++
> > > >  include/linux/usb.h                                |   3 +
> > > >  7 files changed, 196 insertions(+), 2 deletions(-)
> > > > ---
> > > > base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
> > > > change-id: 20250821-v6-16-topic-usb-onboard-dev-b8d4d1d8a086
> > > >
> > > > Best regards,
> > > 
> > > Hi Marco,
> > > 
> > > I'm checking in to ask about the status of this patch series.
> > > 
> > > We are currently working on the Spacemit K1 SoC and we have a use case
> > > that requires onboard_dev to manage the USB VBUS regulator. This series
> > > would be very helpful for us :)
> > 
> > :)
> > 
> > > Link: https://lore.kernel.org/all/DG8QBWSJ79MP.2MVIHFRBX3WXX@linux.dev/
> > 
> > Regarding the status of this series. Rob provided his r-b tag once I
> > fixed the minor typo. I also need to fix bug [1] which is triggered by
> > the asix binding. I could move the 'vbus-supply' example to the
> > usb-device.yaml.
> > 
> > @Greg, @USB-maintainers
> > Are the driver changes OK?
> 
> I have no idea, this thread was from a very long time ago.  Please
> resubmit after rebasing on 7.0-rc1 when it is out as we can't do
> anything with any new patches until then anyway.

Done.

Regards,
  Marco

> 
> thanks,
> 
> greg k-h
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

