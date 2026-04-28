Return-Path: <linux-usb+bounces-36657-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HWJMMsx8WkgegEAu9opvQ
	(envelope-from <linux-usb+bounces-36657-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 00:16:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C648C844
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 00:16:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A800430338A3
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 22:16:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6D2347500;
	Tue, 28 Apr 2026 22:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIGgBD17"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF8521CA02
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 22:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777414595; cv=none; b=LzLu9CTzOBTwxHh2LZ3a1w20mbhaJ0mRn9RLA3ovI8w9++SenmRuVb6h9rmJVwBiqeSgNxds3YvoKMtdFNM3dIp7txBYC0lmGgRQzoTg3xIT5d5FJtHO6DwvqsJxaYTrCDNBO1RcBYie65EHyay+qBhq1N4B/z+GI9kM5HPH2qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777414595; c=relaxed/simple;
	bh=zutEqipAXy30WvagOv6LdOcoZcFCcGn0PRgag/sheCk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZR8UU0+1lFYcvyZdldjq3zyAP4fcU6Rn3Bhypan4ND6KokJzncmKz4NhFmskJjp2xIY4M3+4W9ZPcBt7yrcrLcus2a8zmNAywyVrCOJlCAQJ69kI5ZEW/mBkne6LtVMwS6olXBsn7VvpBenxx4Three6O0Pf267vS6xaheo9Ypo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIGgBD17; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a4113ab355so12951826e87.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 15:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777414592; x=1778019392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YbCXFZ6lSLfvvF1eaUf3LQFQLtDBatPhoQY3ddj37NE=;
        b=RIGgBD17y/YP2ax/xfmx5/tEUnj/kQj86QXpMKt7LoPBLZWUi5/hj9MDrxdQXqCyaz
         wzZMyOzcMEdEntCz6TGwzj0MxKuL25cLFEFJMu+kzEss4Huqpm9HgDZSrRPlLl4kXG59
         nuEzk1CC2fbXJ8Drc0TuTI2/FfbIrVsTd8nlEOMX13LfWwF5MacLGROOQsVGFq27IlXg
         gujP72D0lZYreyh+Ioa5ReEdcZ/RsXElK1E2C3wmNIZxafqfU8Qa7T92Sd55G+KYk6qR
         9mMydFakK1FC4V1U+9eA9/KEbDjyBgIOpTgci87BhLkhjcs+ybe0+VZhk19J3it4Hmr/
         WC9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777414592; x=1778019392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbCXFZ6lSLfvvF1eaUf3LQFQLtDBatPhoQY3ddj37NE=;
        b=sZ8Uzwmm+3gqYu1K7urpPKIPo5fY6nW+mgvXIZfzuG1cNMvArYxjj2x29F7MG7Lj53
         Fb35MYyKOoKl18npAQe8HvL5bKn3qvFKLO95I7hBuCmgU66SMjBHKUgIiMICE6GslJbh
         9CCDYvck6zao8CYQaPsABIbMelkiGzzKjEqvHhepltovDuXE0xw7aGxZ+T9ft35zenX/
         YoYFKTIoxyVLF+WIWANmsLF7qy4pYCYg4YKW4oGlANRdkohAECoVV/ZSNKw8aTIf3ynW
         DZZMHO+vPyB4Eg4fW1bIv+LubiDGVu57ZU6XFiL/MNYsUvqg1v43AuBdclgy2dZuOnkh
         VImg==
X-Forwarded-Encrypted: i=1; AFNElJ9YF3GY7KRXbsnunhYyBtmdcMPKkMuXy44Q4vGtvDMFHUAa1DMbR3TAem9jXcJoH81tlis8zH9br9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqckoFB+ZL9jonylruP9z/uaxlrvQUMZRp5yl6cgf69v8H21zK
	njsZwclwYLW2NxSfIxE6fsb8hFwWXpKYHSZ775FaPV9o+Ps9LdmW+0CwvKTOjg==
X-Gm-Gg: AeBDietsTkjKBwn9B5SGTNY+ITl2Pw4362H3LBOFL0QBGCPy6e4idkEr4GpEKYDELsp
	NEOI4AXdr2PA2/ppv9+1SVGK3w/rC3xyMA1uKHlDtqd2Nva109olwmdqKuTk7+u7u+IfemigGKp
	LXk3I73Tndq5lS8uZr/nJY6nL8F8oAmjxLqJfWtmJR2tYQXwv+WZJmqzcFCsrzYg05dpXXc5Hof
	Uh/loQfChbDn+hfU3B/15sCtctsuGL86nyj6INUXnmIaUrasphi43OutfdQTdpdFueB72+YXo5V
	cDyRGmB1l9gz+Uk+7hRCbYMt/vQi17ybwtepkPVrub/IU8LrGtrOKIlTJsvNB3gmDU0bZoyxVON
	1acXqEYIanSymhzqi4dy5LsOG+lkspbRKj6UJfR9itzepgg+/X6hCW/wVsgPpCH54zLDle+rmkk
	jyCSBFTkswYhjtfkhLdqoE2O0iZ+veDkVYL4Rt3lOtQs49DUv6lObJWg==
X-Received: by 2002:a05:6512:3194:b0:5a3:ffd1:fbcf with SMTP id 2adb3069b0e04-5a74640ecf9mr2210824e87.17.1777414592231;
        Tue, 28 Apr 2026 15:16:32 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a74a7627f4sm60251e87.56.2026.04.28.15.16.29
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 28 Apr 2026 15:16:31 -0700 (PDT)
Date: Wed, 29 Apr 2026 00:16:26 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: "Heitor Alves de Siqueira" <halves@igalia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <kernel-dev@igalia.com>,
 <syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com>,
 <stable@kernel.org>
Subject: Re: [PATCH v2] usb: usbtmc: reject invalid interrupt endpoints
Message-ID: <20260429001626.2f08b991.michal.pecio@gmail.com>
In-Reply-To: <DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
References: <20260423-usbtmc-iin-size-v2-1-31afa4874f71@igalia.com>
	<20260424002839.5ad25517.michal.pecio@gmail.com>
	<DI51WD2C7TJF.1X6B12NO0OO4@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3D2C648C844
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36657-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[appspotmail.com:email,igalia.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,syzkaller.appspot.com:url,msgid.link:url]

On Tue, 28 Apr 2026 16:55:58 -0300, Heitor Alves de Siqueira wrote:
> On Thu Apr 23, 2026 at 7:28 PM -03, Michal Pecio wrote:
> > On Thu, 23 Apr 2026 15:04:38 -0300, Heitor Alves de Siqueira wrote:  
> >> The USBTMC driver allocates the Interrupt-IN buffer according to the
> >> wMaxPacketSize value obtained from the USB endpoint. If a USB device
> >> advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
> >> or an endpoint constructed by syzbot), the buffer will not have enough
> >> space for the mandatory headers and will trigger an out-of-bounds read.
> >> 
> >> Fix by rejecting devices advertising interrupt endpoints that don't fit
> >> at least the mandatory headers (bNotify1 and bNotify2).
> >> 
> >> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
> >> Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
> >> Cc: stable@kernel.org
> >> Suggested-by: Michal Pecio <michal.pecio@gmail.com>
> >> Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
> >> ---
> >> Changes in v2:
> >> - Instead of ensuring buffer size, reject devices that advertise illegal/invalid interrupt endpoints
> >> - Link to v1: https://patch.msgid.link/20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com  
> >
> > On second thought, this may be not enough. A wMaxPacketSize == 2 device
> > can still send only 1 byte (or even 0) and cause unititialized read.
> > Better check if the URB completed with expected actual_length before
> > trying to parse the message.  
> 
> You're right, although I think these are two separate issues. There
> are indeed no checks for actual_length in usbtmc_interrupt(), and I'd
> be happy to include those in a v3 (or a separate patch) if you agree
> with this approach. For these cases though, I wonder if we can just
> ignore the URB, as actual_length<2 would imply that either the headers
> are missing, or the payload length is 0.

I'm completely unfamiliar with this class, but my understanding of
USBTMC spec is that bNotify1 is mandatory while bNotify2 may have
any length, likely including zero, though it's a bit imprecise.

The driver only supports notifications defined in the separate USB488
spec and for these, bNotify2 should be one byte. It also warns on
every unrecognized notification.

I think a minimal fix which mostly preserves existing behavior would
be adding "urb->actual_length == 2" as a requirement for all USB488
notifications. Then any truncated message will be ignored and logged.

wMaxPacketSize is a separate issue indeed and it seems that a USB488
device could legally set it to 1, though it would be crazy. Your v1
patch would probably make such devices work, if anyone cares.

> > And by the way, an interrupt transfer may span multiple intervals
> > and exceed wMaxPacketSize, USBTMC spec alludes to it.
> > Theoretically, even wMaxPacketSize == 1 seems possible, though it
> > would be crazy and likely no such HW exists because nobody
> > complains that it doesn't work.  
> 
> Yes, but aren't such cases already handled as long as we validate the
> bNotify headers? USBTMC interrupt payloads must include at least two
> bytes for bNotify1 and bNotify2, so URBs that don't fit those should
> be considered invalid, right?

Not entirely sure what you mean, but obviously a notification which
doesn't even have bNotify1 is bogus, as is one where bNotify2 is
shorter than requiredy by particular value of bNotify1 and protocol.

> Even if the payload is split between multiple transfers, these
> headers should be present in individual URBs. Checking if
> actual_length fits both bNotify headers should be sufficient, as data
> buffers will have enough space for at least wMaxPacketSize, and the
> overflow case is already handled in usbtmc_interrupt().

Not sure what you mean, and I'm not sure if a long multi-packet
vendor notification must have bNotify1 header in every packet.
I think it doesn't, note that transfer != transaction. A device
actually sending such messages could be painful to handle.
But that's yet another separate issue, if such HW even exists.

Regards,
Michal

