Return-Path: <linux-usb+bounces-36309-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cfFHHjlN42mgEgEAu9opvQ
	(envelope-from <linux-usb+bounces-36309-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 11:22:01 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1114208C1
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 11:22:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01BF43028F5C
	for <lists+linux-usb@lfdr.de>; Sat, 18 Apr 2026 09:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63809332610;
	Sat, 18 Apr 2026 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6OWFDKW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7D15687D
	for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776504115; cv=none; b=LXGl9/pPWnYy3PvbcBGM3KAYI15P8hG06DYSW22IWiYeeTO09WNt++p5qVDFA1BDdT+krhyflAL77gOu/96uj2Z1HhqS48+QEpz/7ldX7w26Y5RypheL3/RAzPfMz/eyx+pOyO0j/MeenyNqfxKdUAD9FbpRPA2AUIkN5A+JOV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776504115; c=relaxed/simple;
	bh=pYakLwD3myC3DThRrfjzfIYZFjg7fj7FEp4hjTaV6Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jEXNQD0Niu/enP5DDReQpMJ/1aeZH3CroTElr0gysuVCAeiK1lh0VVv80TcrZ/K1rl5DiE8QJ6qaDuXLnyNJzFEpWTZoxJAYvntvYXRVRttS3pRY5QzKM1XDzoT/MFm15mguLrjSCbxHGqktWTBuTQN/cBJg0yG71XH3AMSJ0lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6OWFDKW; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c7427ad9so1498014e87.1
        for <linux-usb@vger.kernel.org>; Sat, 18 Apr 2026 02:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776504112; x=1777108912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+r2puGmgiHoTOu/R0hhpZ2zLxigJWBKLgmduat9CRS4=;
        b=s6OWFDKWIZHIm0d5KJlSYi60k0kCKsiLt2m16fDgNqmjbj4TsQ9kY0kEmf3Uk1avS0
         PHnNbZPP1pfAJrKlBTpDbQ92K1e5ScUy8GK7ZWShsTQt8JCxwzvdKQnSxWXhazJn2K7V
         +iIiK18u0BW9zJm407fVI0N7a8xnCzf/HzM5Rricz/F8yzYfshw6TS/aOqWkuT0m5CvX
         orrZdzQa7oexQurSjVNGKFQLRFRFVrXiibos+suuqCzAzrA1Ngqxe/ero41i+wZtMuPJ
         P8mN3UWJ/F/ni+WjljMP8O2pm5uWFXaI8SoYDqmgwSBall+VxIOM3Xi5D8tC6yrhvdBq
         5nYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776504112; x=1777108912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+r2puGmgiHoTOu/R0hhpZ2zLxigJWBKLgmduat9CRS4=;
        b=KDuX5gQzpkT02uxKRzr6cPsQVkZGVxHs+mcM5L2vGHk0PaCeGN11B90wEo4GWxjw8y
         KPwXMlDv+AhjtohF6n3UnahMCDwqueWqlrzKBkS8Ks8y1W4xVKoYEf0qYcur7je+JcyL
         tvFIqmWSLGgcbfBmnKUJZMijtFIIFSBCaEnblPLKIkxpSclODpKs7Zuq22sIpP1u5o0c
         zfj/OJsYO7AzudsyMhqrJT1L1Rf7qeFuER6qyXVvr4nR6rmeKm3nvZDlLVzkPEWl+EQZ
         Z1DRv13R+e0EzG5hvdYO7IdwaSkm5zmoEMVn26DZzhtjo2t25SwYQaocEJhiH0pVH9ab
         gRDA==
X-Forwarded-Encrypted: i=1; AFNElJ+qVQ9WZG1eLt3qvcXopLhQ/U8nmjYwwmpHTO26AnQ2560BTDE2Qbq//dna9jx0vIzmIsdDrvflIJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxopmz4EcvM/xKz7eTIZS9ZdMZqkXk6NI3PVEikWJlnpGBwcGZd
	5gWKuwsTazjiafFtdJEIVkv0hdPykAKU4UQjxMMihGkR7cPJOk8wV9DjRuaLhw==
X-Gm-Gg: AeBDieucKyaudV/myQ2+OwQFiN7BLh93nJp266FuDozL3IV99zTm3WpQUwHbfrg/JR2
	SMIj/LwPNbs7OaBRdVxVpXaQ1WHqtD6BYVw+ja5pjDy1VODV8DNSi8I395oq9p/s/Ua53wBbjv/
	uLLVJF/pImnm9P5KBrtDeuYDn+UWHc3vg3uVgErUMkFgdA/nsd6sIAoUHDvPVzSeqVFVfq8FwmB
	oRZoBop5MEuHRqfTdg54NflhOZOTa5gjIfuJN5s1kRZ9Nlio/Y6TWa9hHpj32pUbLF8TSPLbn4L
	ck+2z2MlpHn1FIBSOpzKoRuc8pcxiJbNX2AAU5uDxq8FOON414uaW0V8NADjEClrkeS71lalcul
	ww4m2We+zF6JHNIfOGc5B8SXl1aq4h0qKrzh4+bwdBfZQPhvIt7YRY7gc7pyeUwLQhuqvwqwfN3
	ZMTreGM5J+aZq7ubRvUYdenESA10tMAnhgIV5t7f/Ks0tAUA==
X-Received: by 2002:a05:6512:31d6:b0:5a3:cd67:9e25 with SMTP id 2adb3069b0e04-5a4172e31a2mr2038889e87.45.1776504111235;
        Sat, 18 Apr 2026 02:21:51 -0700 (PDT)
Received: from foxbook (bfi125.neoplus.adsl.tpnet.pl. [83.28.46.125])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm1198689e87.1.2026.04.18.02.21.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 18 Apr 2026 02:21:50 -0700 (PDT)
Date: Sat, 18 Apr 2026 11:21:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "oneukum@suse.com" <oneukum@suse.com>,
 "niklas.neronin@linux.intel.com" <niklas.neronin@linux.intel.com>
Subject: Re: [RFC PATCH 1/2] xhci: prevent automatic endpoint restart after
 stall or error
Message-ID: <20260418112146.3ae60b58.michal.pecio@gmail.com>
In-Reply-To: <e89a6683-4570-4ca6-95ea-0e9932614974@rowland.harvard.edu>
References: <20260404204133.3mcizeeokw3ln5r4@synopsys.com>
	<243af5f2-3925-4960-be7b-8d0c273ae629@rowland.harvard.edu>
	<20260404221533.woepax7jxwefy3fq@synopsys.com>
	<20260404222818.t5y52gnd2gvalvp5@synopsys.com>
	<b4e2edd9-2616-4cfe-90a5-438fb6625706@rowland.harvard.edu>
	<20260405030954.32jbg3fphi5xdla3@synopsys.com>
	<74ac9ea2-34d1-4999-9048-c03a0f978b5d@rowland.harvard.edu>
	<65682e07-e18c-4674-bfa7-2cc27abb5ede@linux.intel.com>
	<4a484a89-f52a-48c2-af43-c0029878ddaf@rowland.harvard.edu>
	<20260417234846.41a24089.michal.pecio@gmail.com>
	<e89a6683-4570-4ca6-95ea-0e9932614974@rowland.harvard.edu>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36309-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CE1114208C1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, 17 Apr 2026 22:34:58 -0400, Alan Stern wrote:
> Okay, good, we'll require all HCDs to reset control endpoints 
> automatically after every error and stall.

Are they not doing it?

Say that something like lsusb encounters protocol stall while another
URB from the class driver is pending, will the other URB time out just
because host endpoint halted on an earlier one?

> > Currently, by the time the URB is given back, its endpoint is
> > already in a "stopped but runnable" state and its sequence state is
> > zeroed. And it may have already been restarted if there are more
> > pending URBs.  
> 
> Ah, I was going to ask about that.  This will be different from the
> way bulk and interrupt endpoints will behave, but I think it is
> acceptable. Control endpoints aren't used for anything that requires
> high throughput; if a driver wants an error to prevent later
> transfers from starting right away then it can simply avoid
> submitting those later transfers until the earlier ones have
> completed.

Or it could unlink if the async giveback race is fixed with a new
callback separate from endpoint_reset(), but IDK if any demand exists.

Same thing with "chain unlinking" - unlink one URB and expect others
not to execute so that unlink completion can unlink them later. Looks
odd, but it's guaranteed by kerneldocs. And currently broken.

> > > Recovery from a transaction error on a bulk or interrupt endpoint 
> > > involves sending a Clear-Halt request to the device.  But if the
> > > error was caused by some sort of transient interference that
> > > hasn't ended yet, the Clear-Halt might itself fail with the same
> > > error. To handle this, we should retry the Clear-Halt at
> > > increasing time intervals. At what point should the core give up?
> > 
> > Good question, I don't know. One thing I noticed is that Windows
> > does tend to lose patience with completely unresponsive devices and
> > kicks them out, but I don't know the exact criteria.  
> 
> Two reasonable possibilities are 250 ms (because that's about how
> long an intermediate hub might take to notify the core about a
> disconnect) or 5 seconds (the normal timeout for control transfers).
> Of course, 5 seconds is an awfully long time to wait for a mouse or
> keyboard to recover, so maybe something in between would be best.

What happens after giving up? If control requests don't work, most
likely nothing works anyway. Reset may work, or not if it's bad cable.

Retrying too long may cause class drivers to time out on pending URBs,
not sure if it matters. Drivers may have no way to distinguish this
from any other timeout, not sure if this matters either.

> I will set things up so that an extraneous clear-halt (such as one 
> submitted by the driver) will prevent the core from doing its own.
> This leaves the possibility of the core clearing the halt and
> restarting the endpoint and then the driver doing it again, while the
> endpoint is running and the queue is nonempty.  Hopefully drivers
> avoid doing this.

Yes, that's just dodgy, what would such driver even expect to happen?
An URB may be in progress and then what? On xHCI we would need to throw
out this URB, so it simply isn't supported.

> But if it helps, I could print a warning if usb_clear_halt() is
> called for an endpoint that isn't stopped and has a nonempty queue.

Not sure what core considers a "stopped" endpoint. FYI, xhci-hcd
logs dev_err() when reset is attempted while URBs are running.

> > A related issue is clearing TT buffers. AFAIK this has no retries,
> > it fails silently and leaves the endpoint potentially broken, and
> > it is waited for to complete in case of usb_set_interface().  
> 
> Is there anything we can do besides calling usb_clear_halt() and 
> usb_reset_endpoint()?  If not, and data loss is unavoidable, then so
> be it.

If this "clear-halt by usbcore" materializes and survives confrotation
with the real world, it could make sense to look into combining TT
clearing with it. It's a similar thing, but tracked separately now.

One thing that could reduce data loss is never giving up on those
control requests, or resetting/disconnecting the device if giving up.
It's a general problem that control requests can fail and nobody has
much idea what to do then. Some drivers ignore errors. If the device
returns to operation, it may end up running in an unknown state.

This is apparently rare enough that nobody complains, though on
low- and full-speed it's relatively easy to produce artificially with
a particularly defective cable.

Regards,
Michal

