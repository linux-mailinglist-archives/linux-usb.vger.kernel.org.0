Return-Path: <linux-usb+bounces-35264-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFqTF2TIvWkrBgMAu9opvQ
	(envelope-from <linux-usb+bounces-35264-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 23:21:24 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B252F2E1B67
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 23:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10CA3307FD60
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 22:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C77F135B138;
	Fri, 20 Mar 2026 22:17:02 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2160917A305
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 22:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045022; cv=none; b=IObfGH1ObDKY+hF7yWSGQoolFv47EdmRREYA52mAxFzT1iotS0ddHnX0IJCvv4eEnLXIgrMUMr0wt4BV1OP3wMtUI2jJarprsx5PO3HIpIE0bg7rhL9SJAbwV3fhq+9lw7aO4wgVYTlJR4Y/x0PThg+2U/s6eaxZHXdkXG6bN3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045022; c=relaxed/simple;
	bh=7vYKTDPh26Ky1mHIJT4t3pz0HEnpL7G9Sb0T2N9C0eI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxZ0oO/KqcEJLBJNcf4vIwRYOvxIR4i9+UpG9tM0MAcKWAZDLx2jcEgWYICtIGIEypJcEXgncf9dehKs84fxREeus9VZY/mPEdBkHAVX8gmnkKjqRBV9x3xDvEfxRAiQI5rFZBx5eppy4LL41CS5BugpgqrJ45wVV4750/ZkU5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3i95-0006ba-Rc; Fri, 20 Mar 2026 23:16:43 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3i95-001JBf-0g;
	Fri, 20 Mar 2026 23:16:43 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3i95-0000000Cwo8-0QsC;
	Fri, 20 Mar 2026 23:16:43 +0100
Date: Fri, 20 Mar 2026 23:16:43 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v5 1/4] usb: port: track the disabled state
Message-ID: <mavc4ului42mdozzfwxd6zfa5b664umlqe5dal2r6knnilbi5a@ubnxauwhnoue>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de>
 <2026031105-uptake-glucose-5b61@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031105-uptake-glucose-5b61@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35264-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B252F2E1B67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-11, Greg Kroah-Hartman wrote:
> On Mon, Feb 23, 2026 at 12:27:34PM +0100, Marco Felsch wrote:
> > The disable state isn't tracked at the moment, instead the state is
> > directly passed to the hub driver. Change this behavior to only trigger
> > the hub if a state change happened. Exit early in case of no state
> > changes but don't return an error.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

...

> >  #define to_usb_port(_dev) \
> > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > index 44e38f922bc553adee64b35c536dfd4154a42d8a..86e9d6d0c0f505782569565fde8e4a46b06b8b4d 100644
> > --- a/drivers/usb/core/port.c
> > +++ b/drivers/usb/core/port.c
> > @@ -117,6 +117,10 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
> >  	if (rc)
> >  		return rc;
> >  
> > +	/* Early quit if no change was detected */
> > +	if (port_dev->disabled == disabled)
> > +		return count;
> > +
> 
> This will change behavior where someone tells the port to be enabled
> again, when it already is.  Is that ok?

That's the whole purpose of this patch. Can you please elaborate why
someone wants to enable or disbale a port more than once in a row?

Regards,
  Marco

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

