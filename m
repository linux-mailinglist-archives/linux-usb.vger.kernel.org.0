Return-Path: <linux-usb+bounces-35668-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id APYSC2J5ymnk9AUAu9opvQ
	(envelope-from <linux-usb+bounces-35668-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:23:46 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B1C35BDC5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 15:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5412C30A585B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 13:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF353D3CEE;
	Mon, 30 Mar 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MneS+9H3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144DF3CB2C1;
	Mon, 30 Mar 2026 13:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774876522; cv=none; b=QPlbhSpkYmJpGMq4xqAMKWLyi4P9DMMaNgNHEmiHMPD/pv7e0CwBJdmG2/DnNvYLzEERAUH8HEfCU2giaUMGyp2yZNZsqgwuIJ1c0lEeB0NnS66PHnStQb8D4nOX8cF5ICYkJbfFo3fC1b4rYDVd+SLJ+VcLickhhRJxmojrFNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774876522; c=relaxed/simple;
	bh=b1haNmzh5GBu/xqCNhbwf9cQMSb0Kbt+fAjPReEkhGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rbFa5N0rLrnVIM4F5yy7xlWDLpD7AI0hFDmT5/CysfbfJbpCnJ6CJ9him65R9RQzymn/26Fw/joar/wGtipmFJwZsjT69eg0SnxWMeUvr5H3VcU2RMi8IIeDIKkg7jgPW+vmiODMr4xP2VCXfFA5hbYCCRJQ9pn2ZQOqbNkeO7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MneS+9H3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24BBDC4CEF7;
	Mon, 30 Mar 2026 13:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1774876521;
	bh=b1haNmzh5GBu/xqCNhbwf9cQMSb0Kbt+fAjPReEkhGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MneS+9H3YIhbaR1Cnk/kcZy7hXMELM+aGTZ6lmJBo5q/Kp3SahX68xyx4Zn9iX8z7
	 SX0oZwi3eaVpSvnaaA8p2U7+VZTQMqL/S1wkp8RIkCpKvPAa2593mDJwYN5bEIYrOj
	 zHchgJDuFu88lVdLCb8Bf6lXLDMEIBuBOT7YLBfs=
Date: Mon, 30 Mar 2026 15:15:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Kaehlcke <mka@chromium.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	kernel@pengutronix.de
Subject: Re: [PATCH v5 1/4] usb: port: track the disabled state
Message-ID: <2026033002-cyclist-onslaught-30ee@gregkh>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-1-28d3018a8026@pengutronix.de>
 <2026031105-uptake-glucose-5b61@gregkh>
 <mavc4ului42mdozzfwxd6zfa5b664umlqe5dal2r6knnilbi5a@ubnxauwhnoue>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <mavc4ului42mdozzfwxd6zfa5b664umlqe5dal2r6knnilbi5a@ubnxauwhnoue>
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35668-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linuxfoundation.org:dkim,pengutronix.de:email]
X-Rspamd-Queue-Id: 93B1C35BDC5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 20, 2026 at 11:16:43PM +0100, Marco Felsch wrote:
> On 26-03-11, Greg Kroah-Hartman wrote:
> > On Mon, Feb 23, 2026 at 12:27:34PM +0100, Marco Felsch wrote:
> > > The disable state isn't tracked at the moment, instead the state is
> > > directly passed to the hub driver. Change this behavior to only trigger
> > > the hub if a state change happened. Exit early in case of no state
> > > changes but don't return an error.
> > > 
> > > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> 
> ...
> 
> > >  #define to_usb_port(_dev) \
> > > diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
> > > index 44e38f922bc553adee64b35c536dfd4154a42d8a..86e9d6d0c0f505782569565fde8e4a46b06b8b4d 100644
> > > --- a/drivers/usb/core/port.c
> > > +++ b/drivers/usb/core/port.c
> > > @@ -117,6 +117,10 @@ static ssize_t disable_store(struct device *dev, struct device_attribute *attr,
> > >  	if (rc)
> > >  		return rc;
> > >  
> > > +	/* Early quit if no change was detected */
> > > +	if (port_dev->disabled == disabled)
> > > +		return count;
> > > +
> > 
> > This will change behavior where someone tells the port to be enabled
> > again, when it already is.  Is that ok?
> 
> That's the whole purpose of this patch. Can you please elaborate why
> someone wants to enable or disbale a port more than once in a row?

I have given up trying to understand why users do what users do :)

