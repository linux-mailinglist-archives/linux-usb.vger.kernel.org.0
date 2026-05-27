Return-Path: <linux-usb+bounces-38107-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBh/AzstF2rd7wcAu9opvQ
	(envelope-from <linux-usb+bounces-38107-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 19:43:23 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6F35E86B2
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 19:43:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5035D3031A1E
	for <lists+linux-usb@lfdr.de>; Wed, 27 May 2026 17:42:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C488E4534A4;
	Wed, 27 May 2026 17:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="YWwcELU9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9491453498;
	Wed, 27 May 2026 17:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779903747; cv=none; b=uaHdVEeEkAfQSR1NXloDqfkzzE5lRyR4fhJY9w5PxA0cGnbHSkXI25isy5nXalBcXbpsNQ+hd7AIjhXvbH+fcNZ+k2y+YWkU1nMmPfHydJjebbL6MOHYj/iNBUKPwA1AdLT/13TmWcTk0EMz/x6zOC4RP/pDe5dfdycb2We6Qjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779903747; c=relaxed/simple;
	bh=qDPnmO6n26zUyqGRYY9jO55c06DrJ1oerxzLPySgx0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FeG0KpzL48tEnO0ZQFpE546D8KYpTQWheN98UIcO+r/D4yBI8IPkAUqWbmkF6V/0FJaa/n2u3MfWIKMJHCZYGHknXvNgxQXUJRZsCDX4yaqchnSnJiCgzcYmtaUDt+kg/a3ayu71ETGA/mLKusAKqdEaaK11fztHMeyWaRXAXKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=YWwcELU9; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB471F000E9;
	Wed, 27 May 2026 17:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779903742;
	bh=IKN54VPAXWs5sF6ceJNmuHYcIYkUxjL/vSmM5J5IU/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YWwcELU9M4r41zdQPC6qERI7NXdLXgr43PuuvlJcUNR9EPObjH4P4FEO0GXC13nqf
	 EzW0fD89RHfmeyJv3YySA0EDrhdDg3r+qQzqjaTJePNY2hdPMeGI63sx7hxPEHBoyv
	 YES0VYGMOKF159sxKYnb1U1f/CZRlf++oHgyXNGo=
Date: Wed, 27 May 2026 19:41:30 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 00/12] arm64: mediatek: Add M.2 E-key slot on
 Chromebooks
Message-ID: <2026052710-flagship-unsmooth-ce82@gregkh>
References: <20260515090149.3169406-1-wenst@chromium.org>
 <CAMRc=MdnjRRMVzxPkkrPhQ4dz7rsK8-HKUp9cQ0z11apL3escQ@mail.gmail.com>
 <CAGXv+5HC3dqgcE3KnKzakHHWFHB6m_X42orOkNUvZvp=SL_O8g@mail.gmail.com>
 <CAMRc=Med-_0GSYzoFBRiwFzBCK0DZqJD8_SEBxi+zwR20GS-HA@mail.gmail.com>
 <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5GbW0bx3nKdZt2+tHuHyQ-J-1-Z79nMzHAwjmEPGKT02A@mail.gmail.com>
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38107-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,collabora.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 0F6F35E86B2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 27, 2026 at 06:21:00PM +0200, Chen-Yu Tsai wrote:
> On Tue, May 26, 2026 at 11:48 AM Bartosz Golaszewski <brgl@kernel.org> wrote:
> >
> > On Sun, May 24, 2026 at 10:06 AM Chen-Yu Tsai <wenst@chromium.org> wrote:
> > >
> > > > >
> > > > > I expect some discussion on this patch, because a) it adds some
> > > > > OF-specific code into an otherwise generic (core) driver, and
> > > > > b) it doesn't yet handle USB 2.0 / 3.x shared ports; it ends up powering
> > > > > on the port twice, which negates the port reset part.
> > > > >
> > > >
> > > > I understand that you do this because the port device has no OF node
> > > > assigned. If we wanted to call pwrseq_get() for the port device, is
> > > > there really no other way to associate it with the correct pwrseq
> > > > provider?
> > >
> > > I suppose we could tie the "port@X" node to the usb port device, but
> > > AFAIK no other subsystem does this so we would be introducing a new
> > > pattern.
> > >
> > > In the M.2 pwrseq driver, we would have to match by port node instead
> > > of its parent device node. We may end up with different behavior for
> > > the USB target vs the other targets.
> > >
> >
> > I imagine, we can check the bus type of the parent device to know if
> > this is USB?
> 
> The "bus type" type is probably not exported. However since the DT binding
> explicitly says which port on the M.2 slot is for which connection type,
> I think the matching can do a special case check for the USB port.
> The next obstacle is that the target string is not given to the provider
> match function.
> 
> > > Also, the "port@X" nodes only exist for the OF graph connections to
> > > connectors and/or muxes (this series doesn't deal with the latter).
> > > For directly connected devices, there is a "device@X" child node
> > > directly under the USB hub node. That node is what gets tied to the
> > > the USB device.
> > >
> >
> > Is this a problem? I don't think I understand what you're saying here.
> 
> It shouldn't be. I'm just saying there would be different behavior on
> the USB side for connectors vs onboard devices (like hubs) device nodes.
> 
> I talked to Greg earlier, and he said not to touch the hub driver; the
> hub driver should only deal with features from the USB spec. The
> "onboard USB devices" driver is what should be used. And this would
> be a proper case of adding an auxiliary device to the M.2 slot driver.
> 
> However this seems to completely decouple the power sequencing from the
> USB core. Take the USB A connector for example, it was recently added to
> the onboard USB devices driver. However the connector has a device node
> that is not a child node of any USB host controller or hub; it is connected
> through OF graph. At the same time, since it typically sits at the top
> level of the device tree, a platform device is directly created and the
> driver subsequently binds to that device. This is totally different from
> how the hub and other directly connected onboard USB devices work. In
> the onboard device case, the device node is a child node of the USB hub
> or controller, and the corresponding platform device only gets created
> when the USB hub driver probes, thereby sort of tying it into the USB
> device topology.

Hm, did we mess this up?  If so, we can always change it if you think
this should be done differently.

Hubs should be dealing with the power issues for their ports, so maybe
rethinking this might be wise.  I'm just loath to add hardware-specific
hacks to the hub common code for obvious reasons.  Anything we can do to
pull it out to a separate driver is best so it doesn't affect the 99% of
the users that don't have that crazy hardware :)

thanks,

greg k-h

