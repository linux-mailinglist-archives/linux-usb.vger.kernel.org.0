Return-Path: <linux-usb+bounces-35075-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBAZNXkbu2k+fAIAu9opvQ
	(envelope-from <linux-usb+bounces-35075-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:39:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 409C62C318A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 22:39:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9160D301DEC9
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 21:39:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92F2438944D;
	Wed, 18 Mar 2026 21:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/VeEBQw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B2033121E
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 21:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773869939; cv=none; b=Tw0/+8MBE/HNkTURe7W2iL0Vtkwucp916y7Sm1piV31m+4pfnsFkcj/oPNil2rxsOe8k/CNis4/TI90D+A57LBm1q37Seo9PU8hjrQ8JO3fb0mId7leothrES9zxd9zmKBJI7BcY4/EJgmMDoPwzv7jbflKoXoj+Eg6rLc2p4C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773869939; c=relaxed/simple;
	bh=7xHKWV5i7GmMMl5Tndi7nZMwAPSoXhuCYmtydDBY5iM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RNnVsrUquf+ztFkROeZWJwnKm8E1nN+YbldPOLY+nJqd3WxFEnOncnA/TWRWnPPguuooEK3pTRjt54mqzeBhcBLSd3Hwab8iXMeEXrD2HUhHnrpKUtf7+u/wdPqKy+gKXYFAjAEIOJBp8C3mfg8DP5QapyjYeW0VCdt2kwZC8Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/VeEBQw; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-667cc4ec065so665346a12.1
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 14:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773869936; x=1774474736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W130VUJDJizIXm31y/fCiZ9jz3FQWHVyVVncG2vL5dQ=;
        b=G/VeEBQwiDI4DvPDh7dzeCkNpg6NycPCLA7EgOSPnzXSywZW4TgCTHaZokDxlsAq0u
         N1o+yR/PXkLJQut23zwyloexSz2QkAMRAXIt2WHrPIeiuoK6Ascz9oYqRpxQwfx6nDa0
         T+tt3tWZxp0d6y87yE9WLqtiHIIvwqGy5Su1BD9t78dgvFpY8XLZo1NV1oAtyO0Z0cB0
         ORiRT5VAW1vnxafPAVJdYvxUwcKESIJ+nA8y0VMpHbeUG6n3AVWpRKQzT/Ys46HjmhEQ
         dVoIZtFPbcvlSaFuoLTxjnp/jEBJ/SKb0GrLxt9y9+PPB/XqPAJ/eZDr71Eqs4udVdjh
         kdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773869936; x=1774474736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W130VUJDJizIXm31y/fCiZ9jz3FQWHVyVVncG2vL5dQ=;
        b=RM6vPsIqXN91g1tnoNRBC9Iw0f1cE3F4jjlMBEctnSkYx0E8pRiUDqQY5mINJDPHxx
         4reXnjlzg0MTOgvIUXljPjicLtereRmcEIcF0urSSKL05e6of8AS1FwXt5s83Dj0TIy1
         sxufsvTX9T7KkDwuv1WYphDr+vSpiwfppr1BzPFhblbvkobZ5QkGmdkOMf0gYQEIxfat
         1VDqboL3o9j/qH/tYaZtIQj/kbxzDUg93kAv8GWf7d5/AWgaWVmSG3z0l3zbmR0mhCbu
         0vNO5UseviQdStv4ixntCWPJ4EYubSGsU3vHnCvEMRKeBdeaiIjJ3rxhvvz72/WDrX9o
         l2bA==
X-Forwarded-Encrypted: i=1; AJvYcCV+murGKvui7pRBjZHk0z3PKCHSeb34L8AGwq3ncwwXXFFD6bpZqoR7Dq17Su0nhATMNDRj4kIg1hU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1nRtx+fhWJg3zfH5QV12dd5jnWi4wMPlYKpZEzO6XoyrzKvuG
	fKh74gs8nRkiJSAlbay9O9VnJjCEgIRRIo2oMp631JYs3aWkTqNdwhW8
X-Gm-Gg: ATEYQzx4FM9LjpkY5qlNN9PWPPJXGuV11p3IlRgj9NtPzXm9NDoIx/s4HjlIMpilEBq
	iHb7mq141Msupbo1cxt3yHF+1ATuZJHYQHJH1ycjadcXGWd0PhVzY1IJ8fbRKjfceSKTNzZAj8g
	M/pEuPobfCKCAzL6Bf1/PRb233SbG4CtJVLmqAG8X/ZhMz5LWjeB8VVb47z2C4/3YG6qCsWnLiS
	3oFPwmXuprM4AQKkpgu/PWvt12AStE19yNrKnRNPsx+kBHujp4nAuR7yXaMkzRyvRmA5a2skdmU
	LBrzNN8MQ1m9Oq6XBDPCdCDGk3Iw8bLio6CL54sW6lvccZS8lslvp9wu0T4bDCcL0WKoGg/Pet/
	EqwPYNo79zUG8psYEjlmt1Q+BDnJw8ffItC3jSZpa8zKd2Zl3avBsLgeMSfct3yQDTbez+ieOQg
	GX6xdaUkYYQ0owtyAVOJ29H3wN1fe7Pm+Qcro=
X-Received: by 2002:a17:907:d853:b0:b97:b9ff:f2f with SMTP id a640c23a62f3a-b97f4808e2fmr278890866b.20.1773869935795;
        Wed, 18 Mar 2026 14:38:55 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f1689e66sm302898866b.36.2026.03.18.14.38.54
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 18 Mar 2026 14:38:55 -0700 (PDT)
Date: Wed, 18 Mar 2026 22:38:51 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB
 list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260318223851.1f6d07d7.michal.pecio@gmail.com>
In-Reply-To: <b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
References: <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
	<3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
	<437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
	<0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
	<4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
	<d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
	<abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
	<87a692e2-559a-4765-8321-a422751d3589@suse.com>
	<4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
	<8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
	<b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35075-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 409C62C318A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 13:46:26 -0400, Alan Stern wrote:
> On Wed, Mar 18, 2026 at 10:54:20AM +0100, Oliver Neukum wrote:
> > On 17.03.26 19:03, Alan Stern wrote:
> > > You know, with a USB-2 host controller, transaction errors don't
> > > make an endpoint unusable, and clear-halt isn't necessary.

Depends on what you mean by "usable". If you get EPROTO reading from
a Transaction Translator and the TT discards the packet (because of
timeout on Int or by explicit SW request on Bulk) then not only is the
particular packet lost because the device got its ACK and moved on, but
I suspect the next packet will be dropped too due to toggle mismatch.

Granted, EPROTO outside of disconnections is apparently rare enough
that a horde of users demanging this to be fixed hasn't materialized.

I found simple ways to produce recoverable EPROTO at low/full speed,
but no such luck with higher speeds so far. It would be helpful.

> > > I wonder if xhci-hcd couldn't be adjusted to behave the same way
> > > (issuing its own clear-halt internally, if that is needed). That
> > > would make things simpler.
> > 
> > It could be. But do you want a HCD to generate requests to endpoint
> > 0 on its own without coordination with usbcore or drivers bound to
> > interfaces of the device?

I believe the intent is to maintain the illusion that drivers can just
resubmit the failed URB and have that become a proper retry.

It likely could be done, but it's still not the same thing as old HCDs
are doing because it opens the possibility of double delivery, while
closing the possibility of further packet loss speculated about above.

Question is if this illusion is worth fighting for, when
1. it hasn't been 100% reliable since at least USB 2.0 and TTs
2. USB-IF keeps creating problems for software trying to be like that
3. xhci-hcd has been this mess for 15 years without loud complaints

What should an HCD do if such request fails? Just refuse URBs?

> Michal should be the person to answer these questions.  I guess that
> a clear-halt is necessary for synchronizing an xHCI host controller
> with the device's endpoint after an error, but I don't really know.
> Maybe it's necessary only for USB-3 devices?

Strictly, it's the opposite - synchronize the device with the host
having already zeroed its toggle or SuperSpeed sequence number.

Such toggle mismatch at USB2 speeds results in loss of next packet.

AFAIU, SuperSpeed sequence mismatch is covered by USB3 8.11, which says
"discard with no response", so maybe we would keep getting EPROTO due
to timeouts while wrong number is being retried, but not sure.

Resetting host sequence state is not mandatory, but the alternative is
intended for retrying the same URB, not another identical one. That
would be an edge case possibly exercised by no SW other than Linux.

Regards,
Michal

