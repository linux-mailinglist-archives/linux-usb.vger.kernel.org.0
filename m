Return-Path: <linux-usb+bounces-21256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8936FA4BC06
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 11:26:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA5D4188DB76
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 10:26:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9949D1F2B88;
	Mon,  3 Mar 2025 10:26:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40FA01F1905
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740997561; cv=none; b=uiknUlYA5GexWyc3E1yyzK4h/uSaP0JhbN8m0WUkcxxiiYLKan9dCqEa1b0ab3C+LoLt3Xdd5JAkbyRKwRuU8askwe0MKCh5KRWPidPXx1YcdtOmgZw039f2qmSY4npvwkYdS1mFfBuvqlRPhIec/34htLkb+8FD0Q66CIxjNAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740997561; c=relaxed/simple;
	bh=4ybMusj+3erW2An8KjCkmALT3RbeQvIrvwKF/FIQxHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LzlzrCV9BwdT3g7ve+GgrBI1EL98ujCQSOkZSLVEsJadIXN0NJfv4klaA/BxaUXt4bLpuQafSQW7SeKqIxhQuIvNQ+Xanp77IS0ClGAUMt3k99Ki3SGGOx+7iOosGq2Z5ctahLjbZulVycJrg673ri4uFu0jCrSmGlVvegSfl2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp2zX-0005YR-DZ; Mon, 03 Mar 2025 11:25:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp2zW-003mIZ-0w;
	Mon, 03 Mar 2025 11:25:42 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1tp2zW-00AhSx-0W;
	Mon, 03 Mar 2025 11:25:42 +0100
Date: Mon, 3 Mar 2025 11:25:42 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Junzhong Pan <panjunzhong@outlook.com>
Cc: broonie@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	festevam@gmail.com, gregkh@linuxfoundation.org,
	kernel@pengutronix.de, krzk@kernel.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	lkp@intel.com, matthias@kaehlcke.net, mka@chromium.org,
	oe-kbuild-all@lists.linux.dev, robh@kernel.org
Subject: Re: [PATCH 1/3] usb: hub: add infrastructure to pass onboard_dev
 port features
Message-ID: <20250303102542.gbzhvnygj5ve5qrf@pengutronix.de>
References: <20241028214956.gmefpvcvm3zrfout@pengutronix.de>
 <ME0P300MB055370E97AB98D221B2E0782A60A2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
 <20250106065202.d2qdd7zmwk4h645h@pengutronix.de>
 <ME0P300MB055308B1FC5F1544F906B72DA61C2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ME0P300MB055308B1FC5F1544F906B72DA61C2@ME0P300MB0553.AUSP300.PROD.OUTLOOK.COM>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org

Hi,

sorry for the late response...

On 25-01-10, Junzhong Pan wrote:
> Hi Marco,
> 
> Thank you for your reply!
> 
> On 2025/1/6 14:52, Marco Felsch Wrote:
> > On 24-12-31, Junzhong Pan wrote:
> > > 
> > > I recently encountered some kind of platforms using an existing onboard
> > > hub yet their HW don't utilize the USBPE port power control feature
> > > while the hub support it.
> > > Instead, we have another GPIO for controlling the vbus of those ports
> > > to cut the cost.
> > 
> > That's exactly our use-case too.
> > 
> > > Wonder any idea could use this driver considering the limitation of
> > > the usb compatible set the properties of onboard_dev_pdata hard coded?
> > 
> > Sorry but I don't get this.
> If the hub have 4 ports, but board only have one gpio to controll all those
> vbus at once, implemented as some kind of gang mode.
> 
> In this case, the onboard_dev driver may not respond to the
> USB_PORT_FEAT_POWER, but keep the supply always on except for the suspend
> states.
> 
> Do you have any idea how we handle this?

I can think of one crude workaround. Adding 4-regulators which use the
same shared gpio. This requires the gpio to be requested as shared if
that is possible.

Regards,
  Marco

