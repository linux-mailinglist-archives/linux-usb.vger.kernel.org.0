Return-Path: <linux-usb+bounces-35265-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMJUD6HJvWkrBgMAu9opvQ
	(envelope-from <linux-usb+bounces-35265-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 23:26:41 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D74ED2E1C42
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 23:26:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 267F23024B06
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 22:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E83A36829D;
	Fri, 20 Mar 2026 22:26:39 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A4C32BF41
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 22:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774045598; cv=none; b=LdodGCBF4nKIih5DpDsIaxr0wuUGwxidhft9U3lfnJpHjiwah+9eEvzjjMoYI3QKWt823Q9+GAPkimZxh07TZcnAI9bgLZg+OY+K/4910nh5SbYH4v/lRTaPi2/C+9fcpzLRIR7grimgztoosa+3Z/7pei2CjHHCybfvxbpwSzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774045598; c=relaxed/simple;
	bh=FK1pbSj7tp+6dz4SihDf8FWNcyRCRO/fK7HZr2aR//o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=guRDaPEMQ/afvDO8Sr5DHVSM/iP2a0MrqEQSV7sUkcMo6EuSRjYz/SEh5KMAYT/UdvapPgMpSVFF5uhCoYiS8c28puqllaaiEusVWjJzA5lYr8gk6kQazU0AYEtaE+ST+J9ohpuwy6pD7FLKI/as66R4EY8fNba1Pa/DsDe5I+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3iIV-00081g-SE; Fri, 20 Mar 2026 23:26:27 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3iIV-001JCW-1F;
	Fri, 20 Mar 2026 23:26:27 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1w3iIV-0000000Cwq7-18eI;
	Fri, 20 Mar 2026 23:26:27 +0100
Date: Fri, 20 Mar 2026 23:26:27 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Matthias Kaehlcke <mka@chromium.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH v5 2/4] usb: hub: add infrastructure to pass onboard_dev
 port features
Message-ID: <pvgcyrpwzk5dnfjcozwfwcb2rxqvjrczeyn2y4ukvpsvdrdmz3@fquetrj7unub>
References: <20260223-v6-16-topic-usb-onboard-dev-v5-0-28d3018a8026@pengutronix.de>
 <20260223-v6-16-topic-usb-onboard-dev-v5-2-28d3018a8026@pengutronix.de>
 <2026031101-rut-storable-7def@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026031101-rut-storable-7def@gregkh>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-usb@vger.kernel.org
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35265-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,chromium.org,vger.kernel.org,pengutronix.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.felsch@pengutronix.de,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:email,pengutronix.de:url,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D74ED2E1C42
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 26-03-11, Greg Kroah-Hartman wrote:
> On Mon, Feb 23, 2026 at 12:27:35PM +0100, Marco Felsch wrote:
> > On board devices may require special handling for en-/disable port
> > features due to PCB design decisions e.g. enable/disable the VBUS power
> > on the port via a host controlled regulator or GPIO.
> > 
> > This commit adds the necessary infrastructure to prepare the common code
> > base for such use-cases.
> > 
> > Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> > ---
> >  drivers/usb/core/hub.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
> >  drivers/usb/core/hub.h |  2 ++
> >  include/linux/usb.h    |  3 +++
> >  3 files changed, 58 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 24960ba9caa915f12a4f5582269808fdebd1ee11..9fdfd2f0aacc9b1994cd3761330968e052167c67 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -453,9 +453,19 @@ static int clear_hub_feature(struct usb_device *hdev, int feature)
> >   */
> >  int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
> >  {
> > -	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> > +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> > +	int ret;
> > +
> > +	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> >  		USB_REQ_CLEAR_FEATURE, USB_RT_PORT, feature, port1,
> >  		NULL, 0, 1000);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hub->onboard_hub_clear_port_feature)
> > +		ret = hub->onboard_hub_clear_port_feature(hdev, feature, port1);
> > +
> > +	return ret;
> >  }
> >  
> >  /*
> > @@ -463,9 +473,19 @@ int usb_clear_port_feature(struct usb_device *hdev, int port1, int feature)
> >   */
> >  static int set_port_feature(struct usb_device *hdev, int port1, int feature)
> >  {
> > -	return usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> > +	struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
> > +	int ret;
> > +
> > +	ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
> >  		USB_REQ_SET_FEATURE, USB_RT_PORT, feature, port1,
> >  		NULL, 0, 1000);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hub->onboard_hub_set_port_feature)
> > +		ret = hub->onboard_hub_set_port_feature(hdev, feature, port1);
> > +
> > +	return ret;
> >  }
> >  
> >  static char *to_led_name(int selector)
> > @@ -6545,6 +6565,37 @@ void usb_hub_adjust_deviceremovable(struct usb_device *hdev,
> >  	}
> >  }
> >  
> > +/**
> > + * usb_hub_register_port_feature_hooks - Register port set/get feature hooks
> > + * @hdev: USB device belonging to the usb hub
> > + * @set_port_feature: set_feature hook which gets called by the hub core
> > + * @clear_port_feature: clear_feature hook which gets called by the hub core
> > + *
> > + * Register set/get_port_feature hooks for a onboard_dev hub.
> > + */
> > +void usb_hub_register_port_feature_hooks(struct usb_device *hdev,
> > +		int (*set_port_feature)(struct usb_device *, int, int),
> > +		int (*clear_port_feature)(struct usb_device *, int, int))
> 
> This should be a structure, don't force function pointers to be passed
> in a function, that way lies madness :)

Sure, do you have a proper struct name in mind already? How about:
 - usb_hub_hooks, or
 - usb_onboard_hub_hooks

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

