Return-Path: <linux-usb+bounces-33769-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAgnF8YdoWlhqQQAu9opvQ
	(envelope-from <linux-usb+bounces-33769-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 05:29:58 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5E71B2B50
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 05:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 73B463073DBF
	for <lists+linux-usb@lfdr.de>; Fri, 27 Feb 2026 04:29:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C77348457;
	Fri, 27 Feb 2026 04:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DgiXu6QP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB1532A3C8
	for <linux-usb@vger.kernel.org>; Fri, 27 Feb 2026 04:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772166594; cv=none; b=n9oV3ezkBisj7NlK4x2OIXWHmVQ+Tn7B5rpoPkKmhHyPMO9yfc5JRKlB+IcKFMdtO9jML2k1JPvEmf+DF9Q9xQFNoxlJRvrPOk/DYEfy+hZSOYAPP+qWjcaty0LLbFnc6yvJSB9nq/AMRSShqOf5GsOthfDsb05t6Z+n3aRMbKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772166594; c=relaxed/simple;
	bh=CzxqOeq7vmy3iLuwkGUtmwYzq6nhR2cUTexijQLMdLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdSkMGKgENyDNnza/UUDz7AnUvYtGKpEvY0fpKOmNoQhqQv6qrY+WllSJxzS0so0sq1edtQVu9jM5HHusy/P0z2xPnGDAkep+aVa1oDMrQplNy6P0Yc5EBFIPjFM4EzELaAhhDbr0OFPIYisPcZg5MlS6W+mIAVWUJecNVwBf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DgiXu6QP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EC41C116C6;
	Fri, 27 Feb 2026 04:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1772166593;
	bh=CzxqOeq7vmy3iLuwkGUtmwYzq6nhR2cUTexijQLMdLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgiXu6QPyhRE57KWGtt6WXDOmDE4BJsifX6k0oN7eVlBQ13xqDQ3by2VRhKywdrkG
	 1Dr7RSNT1cSWQ9y42fTC29/SrEcxIF8jixIBkHrs1XLOuJ4fv/p1ZeSTWiQNZMwrve
	 K4xaQL4V+UlSrwS06A2o35J6nfkPi1xLUwb4ZlHk=
Date: Thu, 26 Feb 2026 20:29:45 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Nicholas Carlini <npc@anthropic.com>,
	linux-usb@vger.kernel.org
Subject: Re: Stack buffer overflow (write) in kvaser_usb_leaf_wait_cmd via
 malicious USB
Message-ID: <2026022617-disengage-spinning-c6bd@gregkh>
References: <CAOt5ifARcQqqGc65hHXR2JNTDg0hT0cF55Kb-6USEsqjEPM1nA@mail.gmail.com>
 <2026021847-acclaim-coil-fe7a@gregkh>
 <a38ccefc-6233-4be4-bbae-0ae0d4f4499b@suse.com>
 <eb96e0e4-b02a-48e5-ae07-bc31584f0855@rowland.harvard.edu>
 <e63ee746-dee7-4b3c-9360-95e96fadb765@suse.com>
 <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <862abc70-18ce-422c-bdf2-f02b984193c0@rowland.harvard.edu>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.34 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33769-lists,linux-usb=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_RCPT(0.00)[linux-usb];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CA5E71B2B50
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 01:43:24PM -0500, Alan Stern wrote:
> On Tue, Feb 24, 2026 at 05:04:28PM +0100, Oliver Neukum wrote:
> > 
> > 
> > On 24.02.26 16:52, Alan Stern wrote:
> > > On Tue, Feb 24, 2026 at 09:44:35AM +0100, Oliver Neukum wrote:
> > 
> > > > What is the logic behind that? If we can trust that a device
> > > > is what it claims to be and operates like it is supposed to
> > > > be, why do we verify?
> > > 
> > > Greg said that we trust the hardware once a driver is bound to the
> > > device.  However, the endpoint-verification tests occur before the
> > > binding is complete.  At this point we do not yet fully trust the
> > > hardware.
> > 
> > Why? If we do not trust the hardware, we cannot depend on it
> > telling the truth about itself, can we?
> 
> The purpose of the endpoint testing is to avoid warnings triggered by 
> driver submitting URBs to endpoints that are known not to exist.  Such 
> submissions are generally considered to be signs of a bug in the driver, 
> not of a deception by the device.
> 
> Legitimate example: A new revision of a device uses different endpoint 
> numbers from the original version, but the driver isn't aware of this 
> and doesn't check.  The problem would then lie in the driver, not in the 
> revised device firmware.
> 
> Even if a device lies about itself, the tests will prevent these 
> warnings from triggering.  (The endpoint in question might not in fact 
> exist on the device, but as long as the device's descriptors claim that 
> the endpoint does exist, usbcore won't know any better and so won't 
> issue a warning.)
> 
> Of course we can't detect all cases in which a device lies about itself.  
> The hope is that drivers will be robust enough to handle devices that do 
> not behave as expected...
> 
> > > While it's always possible that some real device somewhere will fail
> > > these tests, a much more likely reason for a failure is because the
> > > driver is being fuzzed.  We do know that these fuzzing tests occur in
> > > real life and that they will crash the kernel being tested if the tests
> > > aren't present.
> > 
> > Now, if we are looking at regular hardware, we need to ask ourselves:
> > Is it likelier that some devices are different from all others,
> > or may they have a race condition with a small window that leads
> > to faulty data packages rarely being generated?
> 
> ... such as by occasionally generating faulty data packets.  Drivers 
> should be able to handle such things gracefully, without crashing the 
> kernel.

Given that I have to answer this type of question about every other week
these days given the fuzzing reports we get sent to the
security@kernel.org alias, I think I need to just write up a "here is
the Linux USB threat model that we currently support" document to
describe what the state is.

We can then work from there, either agreeing that we need to "move" the
level of interaction for which we trust / do not trust a device in the
lifecycle of a USB device, or just be happy with where it currently is.

That should work better with some groups that I know are working to do
stuff to "harden" the USB device stack for some specific use cases,
hopefully just using the existing user api that we have today that
USBGuard uses, or possibly adding to that to handle some missing areas
that we have not previously considered.

thanks,

greg k-h

