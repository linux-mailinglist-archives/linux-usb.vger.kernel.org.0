Return-Path: <linux-usb+bounces-38244-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ED/GCAOEHWqcbQkAu9opvQ
	(envelope-from <linux-usb+bounces-38244-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:07:15 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2ED61FD25
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 15:07:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B493D303E21C
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 13:02:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B523750C4;
	Mon,  1 Jun 2026 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XtpQ8cmB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3067228C2BF
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780318974; cv=none; b=i/OkHwnmSUuJzZoWPwNQFmVr8GHtdq7h5YmJiUzkYFjgvheyXDKaKwsLy/gLgzB3uw+sAW8HAQ1bgcp1iVQP7N3tLJEa8aiL0NWTN9WEnWSC/VwHMNCl5tdLxqSeUSajUcEGURUZ8WY8/tNqLqwK3zIemOngPlDgqCLuPVlVU0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780318974; c=relaxed/simple;
	bh=NQjQ57qaKxjEd8hKIDO4THlVYuNX65sebc21lyi5Hv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=souLLNtrK0KgPhsTS1C4N/t9s4g+GFpa8jsgMH7ayHCj25A8+XITmikPp5Aa2I4bYEgj5ZZSxRNt+BrlgDG7yot+Zs+D6tUhX9zgKvH5Vy4mCkxeciGAHaQtzAEUpwEdAWFXbPF1MC5rFK7UpCRLRprf8njF07ME3lp9eHKNsoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XtpQ8cmB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1266436a91.3
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 06:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1780318972; x=1780923772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xMyEkIcXzB/UJtY4yzjUVEihrXhVFaVH+uBAHTkB/FA=;
        b=XtpQ8cmB0qYJjmqc6D0XWiDAL0sbuIbXz0GcKbeBgIsTAaWF0Y2/h5l6Pj9XjHHy22
         eCG5j/7VSLDy2piYtouQj6XG+XU+69lt3mdD5UKVx5ZfH8sXATwY2nrZNi8qask6J2CQ
         qbd8lSB28EPhkZrowV6VEY8FEFJ1XGZxhGXXZFmMwhsij8i8/xsMSfgOCIdaMVzZWqW0
         i26rjaClnpQVQKLn5cr8AUh3PK0BdkZLCz3GwIrRiWQQk2cYFV6YcfRaPC1TCUS1e4jn
         nTPVfM2MbYhVF8Hx75DqppWIIuMVFzgbt9lRBFRAREbqie8+EATRgCN7RhVThqimsSO+
         LUxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780318972; x=1780923772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMyEkIcXzB/UJtY4yzjUVEihrXhVFaVH+uBAHTkB/FA=;
        b=Eko1B1gkvSPzxmVzWcAEkUQDEzvu2FvCbpJah1ijHVrn5wAe253JavzEYjW8P+/Hu6
         CbWJyyibVJBTUgcm90VWHmw11mraMIko+AQCgc0dr1bHGUYLZ9EDLz6C49Vuqfp7RPWO
         dADE9gC7CEBZVsm/zxpWzDpmRfGzGg7vGQcx63aRfbOAPlPQ/qWuNOEjQ48fl33S7HBo
         VPCVfWPwtbt2H1clBmoIFwVHTbRkXKu/OUWiTBlE1m5KQfHUR8WnoSYQyaHa1TZzSHCh
         oZU1ltuXLNHuJJ7yBtNCVBidcqgP5TS6n99lxmkqT0e9EWpzvlURnSBDDSgvl4Tr8ks1
         gyww==
X-Forwarded-Encrypted: i=1; AFNElJ+asudWmmBWlxiQTaaxi88jJrCr8lwbFc/MumgBrg5R6xLyjJ60Jx4pLaNyCcdsWDAPrDWJSA836aE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOTjRXJlKmRVUz6ZTF/bFEzawTBELbQlrJHNKj4SUet4NuzYxh
	+HaMLJTejGfRHNjGqEZA9zWugZcJwTnkDgJ7YF+730MVw2x2pJLVVHqFPgSLbo5O5w==
X-Gm-Gg: Acq92OFIuwUtstEQvRlXaenXOP4aIV7SR5EG+1FNfoCpPKGM8LPPxASIuRNhleSso/f
	g9van3YM2g2zo7yPVpj+XlW+llYo+oR/iuB0LE6rptrFyinNdq7Qzeti1oArmqmN3E6JkY3nQv7
	F/t38HSiM2x73TENvg6RJ3olFgo7v1O4NSGjyavqR2HAczVg9kNMGQNiUAa6dBHpUo4d/Pn/Pp4
	DHwjsWBLcFwAEpTKHnDi2sGf1Pmw88rw27FlcYnZ1uu7Pr+ki7894JUAwYz59ecCEI/JlJ3q4lz
	/i2KNhfF/3jPiaNER8r2bkR1n+ez7QdhbYI42/u4+ZYzZaJUz8MGnpe4D9lC6iRgmyHhfixm0gn
	DYOPnO7dEQJVFbmMCye+qpZcJfHJX7iUCzj+e+pRy05A0BzPgvYQWTmpOnMsAGzs0AliOWFWinb
	OhPgXbPZzOOKYhhknGvX+HPLsJ/LQ/EQ1zSX9nW8w+HyvO48iMOAs/FA==
X-Received: by 2002:a17:90b:2b86:b0:36b:3ecd:88d2 with SMTP id 98e67ed59e1d1-36c4ff25b08mr10403064a91.3.1780318972202;
        Mon, 01 Jun 2026 06:02:52 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9153265d20csm999484485a.46.2026.06.01.06.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 06:02:50 -0700 (PDT)
Date: Mon, 1 Jun 2026 09:02:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, mathias.nyman@linux.intel.com,
	sakari.ailus@linux.intel.com, katieeliu@tencent.com,
	johannes.bruederl@gmail.com, kees@kernel.org, dengjie03@kylinos.cn,
	limiao@kylinos.cn, wse@tuxedocomputers.com, dev@a1rm4x.com,
	vahnenko2003@gmail.com, cs@tuxedo.de, lijiayi@kylinos.cn,
	oneukum@suse.com, bence98@sch.bme.hu, eeodqql09@gmail.com
Subject: Re: USB: Request for guidance investigating configuration descriptor
 enumeration failure
Message-ID: <ac297b18-4807-4913-a136-48a2e0a5fee4@rowland.harvard.edu>
References: <CAFgddh+JWdT4LLwMc5qjM8q_pBu-fRo2qADR5ovAKoGHWMQrRw@mail.gmail.com>
 <20260531101612.332151d8.michal.pecio@gmail.com>
 <CAFgddhLGHvTmRxWtguXTpgZV_Mq5ZW=CVK_ZkqbOgUF9Y5bCsA@mail.gmail.com>
 <20260531123843.736bd69a.michal.pecio@gmail.com>
 <3b79ba92-1c51-420b-a5d2-8a358cafdbf6@rowland.harvard.edu>
 <20260601084846.433bfc51.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601084846.433bfc51.michal.pecio@gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,linux.intel.com,tencent.com,kernel.org,kylinos.cn,tuxedocomputers.com,a1rm4x.com,tuxedo.de,suse.com,sch.bme.hu];
	TAGGED_FROM(0.00)[bounces-38244-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 8B2ED61FD25
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Jun 01, 2026 at 08:49:09AM +0200, Michal Pecio wrote:
> The thing to check would be how Windows enumerates any random device,
> since I expect that Microsoft designs their own peripherals to work in
> Windows out of the box without special quirks.
> 
> I have done a quick test with QEMU today. Launched it with
> 
>     -device qemu-xhci
> 
> booted Windows 10 22H2 and typed in QEMU monitor
> 
>     device_add usb-tablet,pcap=qemu-tablet-w10.pcap
> 
> The result is attached. The first device descriptor request uses
> wLength=64, followed by proper length, and the first configuration
> descriptor requests uses wLength=255.

Okay, that would be a good reason for changing the Linux code to match.

> Then there is some other stuff, and another request for the device
> descriptor followed by a 9 byte request for configuration. These may
> be the requests being logged by Wireshark, but I haven't installed
> Wireshark in this VM yet to confirm and correlate.

I suspect that the Windows kernel doesn't route packet information to 
sniffers like Wireshark until after device initialization has completed.  
This would mean that Wireshark never sees things like the initial 
request for the device descriptor and perhaps the config descriptor(s), 
as well as the Set-Address request (on non-xHCI hosts).

> So this is why I don't trust Wireshark on Windows very much.

I believe Wireshark on Windows is okay for transfers after the 
initialization, even if the results are a little idiosyncratic.  And 
I've never seen any explanation for why Windows asks for the various 
descriptors repeatedly, so many times.

> And yes, if more people can confirm that Windows behaves like that,
> I think that a quirk which mimics this exact behavior could prove more
> useful than a wLength=10 one.

I'll run a test when I have a chance.

> We don't know why the device behaves like that. Maybe it's a buffer
> overflow in its FW, maybe it fingerprints the host to automagically
> select "proper" mode of operation. Maybe the next such device will
> check for 255 bytes exactly.

If the bus analyzer confirms the first Get-Config-Descriptor request is 
for 255 bytes then I agree, we should do the same thing.  (But why does 
it use 255?  Wouldn't something like 64 -- a multiple of the maxpacket 
value -- make more sense?)  Also, it would be interesting to see what 
Mac OS X does and how the Xbox clones react.

Alan Stern

