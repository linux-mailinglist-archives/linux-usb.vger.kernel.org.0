Return-Path: <linux-usb+bounces-35109-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COZLILe6u2mtmwIAu9opvQ
	(envelope-from <linux-usb+bounces-35109-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:58:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C62C8316
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 09:58:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 619E231B7E9D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 08:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78C5E3AE701;
	Thu, 19 Mar 2026 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K9Iuf77G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DD83AEF27
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773910516; cv=none; b=bxWhcR7XEeg3LGP3yBweFNKC3dkACNUQ+vD+ozuGo3rhj1+jrd44FWqw29HhfIjm24TnJp+1YWRY8bHtQJTu6TfPbfhpOo+7SKbTDBpNVY3rshFa64xmcBA2/jC2ic3wcdzz4JESRAEwAPM4faoekH0S0pkxd53o87TS3uHa2Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773910516; c=relaxed/simple;
	bh=pt5AEOgnJaMVVC3MBMkMQnVvcMUAn1axpRTZ3q9g9R4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NXdXTaglL53Jg5n4qYXbnzk3JQMXQRnqic7/ud9wOPArz9Y/zPTDxUNLxOP3zg8TpEpasSI29zSQPF7T2wUmkM0IIqH4Al9tmIxrEElQrIj+EpGeum4ajYLrxKu8r9TUenyBvZCqmZOKdqxIS2OO2qYOjbBDP1pLEIEAhkWwBUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K9Iuf77G; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-65c4152313fso1049769a12.1
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 01:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773910513; x=1774515313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VhlTTa4lm/ZTlw781XjD3VuY5ClQbRaNwiCpOGPb7qI=;
        b=K9Iuf77GM0Az6ATwFACTmkZUCRBX0uhhC9KCWSzRnXQ5HKA+Qll6lNtT0NOBsFtHXz
         zqaxnHmKBqcdfetfP9HU7QHuciJYrHns5QXLsWEH6mzJna2B9sVby2Pekfv8OhfQlZUP
         P7LHCc23AwYgyfn12fnhMyKoeZrx5HFl25hQ88GNJ0/cBWwcX/mAKlK7SY63ycHmlH1M
         rgGYkK412kbXAeH2iHtYVHEB+qXke2tS5XIXpT/XkryPhTQah7qoqBSoeAYOeNDheB3w
         QtteKqpCkaTb+ZCAgMrp2e8ykxer4JFq45wRCc/Djad38XJGp5Ti59f+rJ7nqEzKz+VS
         5Ljw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773910513; x=1774515313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VhlTTa4lm/ZTlw781XjD3VuY5ClQbRaNwiCpOGPb7qI=;
        b=e/0ESyIa5qfKb2Ulpjd6Tioyi+aHm8m7sd6x+HW37vqHY2ZqNv+KlXB6ffcfmekwrt
         e66/D9hAeNpgrBxzAAkaXeMSYc62yutfIfhIIJsJzWfXr3iMiyMI875rdpJS4B2b2nuG
         MWoBjoqvpxwXEIUh7S4tiqQrjWsh5yK9k8kMNOqkRleg3TzFergQ7nEMs762LYjbhMX1
         Z9LSgCoZDqTO7WJ64ukIuyaa8Xd1IZ36bhoX2uDVgDZ5MeP9Ywx9g04E13b6v+1qpGmI
         AT7vF6BumzIZdd3CRN36iDJHuva4Wbro/DSv3w9U7sn6GEPyNQ7wfnYQSGjBc++7QENV
         1xbg==
X-Forwarded-Encrypted: i=1; AJvYcCWTQ4W0YczR46V748cdsjuJeV522cHEqL5xYkzEpJJan+PkDrGFWG3eXjb6tOV1A8qL+xacNoy/1fU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8H8NCLzBQnTkuARgv4yaRtEaHY90P2yKpYrXoF7ltKLtGn52r
	U6rwzH+/DW5WdC+coXoi6jaHJQPSUrRIjfnHyuCO1TzzdRO3IJFsR5tu
X-Gm-Gg: ATEYQzyuglEtgoCDVoxwxhpRQEyE5jJX2cLB2MVR2DqpaVCiKgEMwHZDZe1pw8hWe7k
	08G7fB0gXlfLckVwc2cSALlRsv/YFJV2GYk+KlLMNYenqEjREp5CWPDIk1VrOoSy9jNy/0+XM8/
	s3ERTwBtbx6sfvx895ZwOGvSeMAiyt3yU995Rl1/uk90Ia5Nhm7p2dSle+j0RDT9gtNz6+gG3Ob
	3dKJFOaeKpNb0Lej25kxEUm4iNQwX+EL2rnVYZkjCWJXIAs1dXd04xvW/yoobObxKu/v2XAE5D0
	ov+VC4VWW0TBuxe+XguOtTKPLwfeW5n0YaVKwKuIwi3cUlut4zBQ5H5iXuhWMvhQmg/S+hmv6A5
	ARinGrx8KWHNHKaJQ2XE2ekMy11OBLG1AeNr9q/+ZD5uVl26AGPsi8UWNGxO/SHMBwk3cI2iC7c
	i6pXQcrgmnx3Bv5IJzxDWaXJsBPdxvr+VFozY=
X-Received: by 2002:a05:6402:280c:b0:663:8be1:3649 with SMTP id 4fb4d7f45d1cf-667b214d6d7mr4228861a12.3.1773910512463;
        Thu, 19 Mar 2026 01:55:12 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667aecbcae2sm3881815a12.1.2026.03.19.01.55.10
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 19 Mar 2026 01:55:12 -0700 (PDT)
Date: Thu, 19 Mar 2026 09:55:06 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Oliver Neukum <oneukum@suse.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, =?UTF-8?B?QmrDuHJu?= Mork <bjorn@mork.no>, USB
 list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260319095506.4b1a6ac8.michal.pecio@gmail.com>
In-Reply-To: <4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
References: <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
	<0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
	<4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
	<d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
	<abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
	<87a692e2-559a-4765-8321-a422751d3589@suse.com>
	<4ada5d68-56f1-41b7-82d9-463901c927db@rowland.harvard.edu>
	<8a14fe29-0d92-4ce5-a7e2-2c084c710727@suse.com>
	<b0217cdc-f263-418c-b8b5-584520d0b1db@rowland.harvard.edu>
	<20260318223851.1f6d07d7.michal.pecio@gmail.com>
	<4a35e3dc-620a-4596-9bf3-783865f29e8f@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35109-lists,linux-usb=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1C5C62C8316
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 18 Mar 2026 21:56:27 -0400, Alan Stern wrote:
> On Wed, Mar 18, 2026 at 10:38:51PM +0100, Michal Pecio wrote:
> > If you get EPROTO reading from a Transaction Translator and the TT
> > discards the packet (because of timeout on Int or by explicit SW
> > request on Bulk) then not only is the particular packet lost
> > because the device got its ACK and moved on, but I suspect the next
> > packet will be dropped too due to toggle mismatch.  
>
> (Is it the TT that keeps track of the toggle state, or the host 
> controller?  I don't remember and I'm too lazy to look up the answer.)

Good question. I skimmed USB2 chapters about TT (11.14+) and haven't
seen this spelled out clearly. However,
- I don't remember ever reading about a requirement for TT to keep
  separate toggle state upstream and downstream
- there is nothing about what CSPLIT response to send after device IN
  packet was discarded due to wrong toggle
- we would need a separate request to clear TT toggle when we clear
  host and device toggle, no such request seems to exist

So I still suspect that TT is just a dumb forwarder and that we get
toggle mismatch when a packet is lost on the HS bus, which sets us up
to lose the next valid packet too.

> By "unusable", I meant that no more data could be transmitted through 
> that endpoint until some sort of recovery action had been carried out 
> (such as clear-halt, set-config, or device reset).
>
> Yes, data loss is sometimes inevitable, and we shouldn't worry too
> much about things we can't prevent.

But an EP which loses data is not as usable as we might wish for.
Doing usb_clear_halt() prevents at least that second loss, which may
occur in far future when we think the error has been solved already.

USB-IF doesn't seem to consider "pipes" a reliable transport and
expects class drivers to anticipate data loss and work around it.

HID, for example, appears to provide a mandatory control request to
poll for the current state of input controls. This could recover lost
data (except from mice) after resetting the pipe to avoid more loss.
 
> The major example showed up just a few weeks ago.  It was an old
> system where some component (the PCI bus?) apparently could become
> saturated at high load, leading to communication failures because the
> host controller couldn't access the data needed to keep up with its
> scheduled work.

I'm aware of this bug and it's an odd one, because I don't understand
why reducing retry delay seems to help.

> Just to be clear, are you saying there's no way for an xHC to restart
> a (host-side) halted non-SuperSpeed endpoint without setting the
> toggle back to 0?

To be clear, I'm saying that most xHCI people probably think so. You
have seen Thinh's reaction to my suggestion that we could do otherwise.

We need a Reset Endpoint command (xHCI 4.6.8) to clear the Halted flag
in xHC, otherwise it will refuse to run the endpoint to protect us from
race conditions (new submission while the error is being reported).

Clearing toggle/sequesce state is optional. If we don't clear it then
"the endpoint shall continue execution by retrying the last transaction
[after restart] if no other commands have been issued to the endpoint."

We can command it to move to the next URB (possibly not submitted yet)
and only then restart the endpoint. But this is another weird thing
that Linux does, possibly noboddy else does it, USB-IF doesn't expect
us to do it, and HW vendors may not test this edge case.

It's something that would have made sense to try 15 years ago, but
today I think you may meet resistance. Ask Mathias what he thinks.

Regards,
Michal

