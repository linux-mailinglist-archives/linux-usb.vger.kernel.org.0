Return-Path: <linux-usb+bounces-36655-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HmuB1Qk8WnGdwEAu9opvQ
	(envelope-from <linux-usb+bounces-36655-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 23:19:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30548C475
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 23:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 89D25301ED25
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A93983B95F6;
	Tue, 28 Apr 2026 21:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SyKpaI7b"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88AE53B5319
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 21:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777411147; cv=none; b=L/BeL9zAdzDfzgaddTcuCH2ur0n4OW9phR7FuYsdJq32g0p7WrEbcJGAyR4WJhkfvnrW/tKDLfnfFqolD2LLsRiWMMnBo/iKFJIqW3qSTAtUx0iEEi9yVkQcUgdP8Q+ic91a9f2ZV0J4TlccpaNnzkdGVmAgilJg28SfpYCzScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777411147; c=relaxed/simple;
	bh=HnSh+a7USxcR6QCqB442JXboZOZ7xNCeCOCaxq1hjYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RYg3tAWBZEJj0/glt88DP63WT2dUnZECsmw05bK8A6PhabbOXV09KAwF8YhMR3MMBvCg6iXgxaYicB6IN2Uakq7EahrBClFynBm8AnaDswFNrzezhqIUA/xaSYAqYXdGUSqYmCRnDBCd4KuBvGhZqKFu2U6SDUC8qSP3RHVJ7iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SyKpaI7b; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8cb38e86cf2so1075066585a.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 14:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1777411144; x=1778015944; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aPiXZzRE+2Fzm5CPmKMJs41LQj3MRdKCD4PuApZRndw=;
        b=SyKpaI7bGSHjc2cQ9CvRvUdgpQ43iLyE5td+OclNhxpGqUwxEJ4VCbQ89MTJIDuBt+
         6RoJrL6rWXOpdUpKzWSlFA+Zyj7U0rCS/pmGrFrjMhl7d+73AiLxzh+WzbDoeKpV89Px
         iTWa/iXtsHBOJQdZxleaE9ljpSXjBqJgb3lWr5ywKmLCNWsTnnbjOnrB5lHGtVPkjggy
         Wu+H+hISJDESSlpQXYuUM8OubWRY9rEF4RY2hXbptnNKcdEZERRJ6t+zaNDE6+hV9T0e
         4ffZDCLjBA62/v+vUyfpgVyONGa8Ze6OHauFNiWB9U2OL28K/6Flby6ext56zA4OU3gc
         6VLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777411144; x=1778015944;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPiXZzRE+2Fzm5CPmKMJs41LQj3MRdKCD4PuApZRndw=;
        b=QHCVuFU7eTb4nDH/+puXV7m6TVnUMwYVablKvnV+tS6TVqHDOyc3wvVCkBtxCwAz3d
         igNANO3HX/zQQYRFFzmO2KhfB1LZjnXwNqh5zTnKFq7Shm6zz3ghmcxxKfS9g7R4pY1q
         ozRYE0LsCLkFLz3S5MYDzAaKSxCgb6gGqmbSHLeP8uSAPIROGIkGJUU7MmCD2ra/+qWx
         OY5wz4PTZoPdV32t8oxwji9z+SYXLlXM69QeoPpqy4DPQl9Bv/J3KBLC9eyoq2XoCuPA
         IKNFmk/LNE4fP7MR0JxeJDkKJO2Qpj5yB3E3knZsPbWlTgV8q9oQALV+3DwPQ/MoXFei
         VrJw==
X-Gm-Message-State: AOJu0YzthSx69ScN0Q/bKfvXTzDR5PtnME0hyadOhJpQxetlte7/YJKN
	ZMUYWN3Glw7uJSKgXz1gM3hpY6U4UwHm6o/j1gjIW5EuPY3gZV33+O7R7JLTCEyVjbUF0/CUQzC
	GMdY=
X-Gm-Gg: AeBDieuc3FipeSIJc7ZGQzoPlPBTmGjxsXQN4kIuiK0fkdry9o2jJNGBUudXC72qZKV
	FVa43xDdOJ9PlEtQmeKCT8tsXFGGbl2PGzFm5ftou/BZmGtmpN8y1FlctYNjMRFH7k9NvLrylax
	7YDusPXt+d+HAS+sQYnGy/vaW0/rrzhWzCXl9pDBaPegRa7oEjhXmw2SykVEx0QTlAUk4kSkhPJ
	kWhaQyf6OayVCs4Cv5DiPqGs7GK8YjEbgFu7IlN7lhAvNalgCfDpcbho33wBTzAxmN40yHwntj5
	wV1ZMn2Fh/adoVV10QMEszOnsqwMhsS6P5RGDGjBXqk53Z92sim6DZ9KzmI8febZJu3gMHMFCxJ
	kxOdZeoYTPPrbUH6Iq05O1wT+MdhznhOl+g8rTXcZPc8BK/+wKjdkMUGv6Kr8a2nn+2O/rTfKhz
	DOMiSoE1TFUvXQ7fDWZn+n10g3TvLEhhmHAz0=
X-Received: by 2002:a05:620a:4612:b0:8eb:605f:6ccf with SMTP id af79cd13be357-8f7d7542384mr681075085a.17.1777411144298;
        Tue, 28 Apr 2026 14:19:04 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::a0bd])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f93f58333esm8737285a.28.2026.04.28.14.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 14:19:03 -0700 (PDT)
Date: Tue, 28 Apr 2026 17:19:01 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Brent Page <brentfpage@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: TT budgeting for EHCI; =?utf-8?Q?accom?=
 =?utf-8?Q?modate_1023-byte_full-speed_isochronous=E2=80=93in?= endpoints
Message-ID: <32291bf6-0c9d-4fd9-9dd7-489f7e1c9f02@rowland.harvard.edu>
References: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B66AE752-B09C-49B3-A829-F7ABB36FB250@gmail.com>
X-Rspamd-Queue-Id: BD30548C475
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36655-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,marc.info:url,lkml.org:url,rowland.harvard.edu:dkim,rowland.harvard.edu:mid]

In the future, please tell your email client to wrap text lines after 72 
columns or thereabouts.  Single-line paragraphs are hard to deal with.

On Mon, Apr 27, 2026 at 06:24:58PM -0700, Brent Page wrote:
> Hello,
> 
> I recently encountered the ENOSPC error mentioned here (https://lkml.org/lkml/2013/2/19/482) when trying to communicate with a full-speed peripheral with one isochronous–in endpoint with a wMaxPacketSize of 1023.  N.b., that patch was reverted (https://lkml.org/lkml/2013/6/18/458).  I think it should be tried again with a different approach.  Namely, I propose multiplying the max_tt_usecs values in ehci-sched.c by the worst-case bit-stuffing multiplier, 7/6, making them
> - max_tt_usecs[] = { 125, 125, 125, 125, 125, 125, 30, 0 };
> + max_tt_usecs[] = { 145, 145, 145, 145, 145, 145, 35, 0 };
> After I make this simple change, along with a few other 125->145 substitutions in ehci-sched.c, my linux tablet is able to establish a steady data link with my 1023-byte-endpoint peripheral.
> Obviously, 145 us is longer than a microframe, so this best-case budget will often not reflect the times when transactions occur.  But, this situation is consistent with the best-case budget in section 11.18.1 of the USB-2 spec, in which 1157 data-bytes are scheduled to occur as though no bit-stuffing necessary (i.e., the 188 bytes = 12 megabits/second * (1 byte/8 bits)* 0.125 ms that can run on the full-speed bus in a microframe are all taken taken be data-bytes).  So, after the patch, max_tt_usecs is the same as the spec's best-case budget but is just scaled by (125 us / 188 bytes) = 1/(12 megabits/s) and by the 7/6 bit-stuffing multiplier to reflect the fact that the scheduling code works in bit-stuffing-inclusive bus-time instead of data-bytes.

Section 11.18.1 is a marvel of inconsistency.  The text and the figure 
caption say that the estimate assumes no bit-stuffing, but the formula 
clearly includes a 6/7 bit-stuffing factor.

I think what it means is that the maximum number of periodic data bytes 
that can be scheduled for one frame on a full-speed bus is 1157, since 
transaction scheduling does have to take bit-stuffing into account.  See 
the formulas in section 5.11.3.  Even that value is an overestimate, 
because it does not reserve time for packet headers and other forms of 
overhead.  Figure 11-60 shows the budgeting estimate for those 1157 
bytes, under the assumption that they do not need to be bit-stuffed.

Since the value of stream->ps.tt_usecs calculated in iso_stream_init() 
does include the 7/6 bit-stuffing factor, it makes sense to adjust the 
us-per-uframe values to reverse that effect for purposes of budgeting.  
It would be more in the spirit of the spec to do the budgeting in terms 
of bytes rather than microseconds, but since it's all estimates anyway 
this shouldn't matter.

> To try to further dispel concerns stemming from 145 > 125, I'll point out that, if a given microframe is budgeted close to 145 us of TT time using the calculations in ehci-sched.c, it will sometimes be the case that the associated transactions take less than 125 us, so they will run successfully within the microframe.  In particular, this will happen if the transactions require very little bit stuffing.

That's not a consideration.  Although the spec doesn't say so 
explicitly, it's clear that the budgeting calculations are only 
estimates and full-speed bus transactions may actually start as much as 
two microframes after their budgeted start time.

> Previous EHCI scheduling work has also noted that obeying the spec entails the possibility of overcommitting the TT.  See the comments below from https://marc.info/?l=linux-usb-devel&m=115933214319141&w=4
> 
> +/* Because EHCI cannot issue ssplits in uframe 7 and USB 2.0 does not
> +   allow ssplits in uframe 6, EHCI can only generate an efficient FS
> +   frame by scheduling according to best-case (not worst-case) bit
> +   stuffing.  Thus we purposely 'overcommit' the FS frame budget
> +   within the buffering ability of the TT to buffer, and within the
> +   limits of the 90/10 rule.  The TT will catch up in the microframes
> +   where we cannot issue start splits.
> +*/
> 
> "/* Scheduling through a TT is done by byte counting, not usec
> +	  counting.  Because we cannot issue a FS/LS start split in
> +	  uFrame 6 or 7, the only way to get anywhere near a full 90%
> +	  of a FS frame for periodic transactions is to 'overcommit'
> +	  the FS scheduling of each microframe [when considered by
> +	  usecs needed for the transfer].  This is not actually
> +	  overcommitting as the TT will buffer the 'excess' from any
> +	  uFrame and schedule it to transmit in a later uFrame. USB
> +	  2.0 11.18.4: "Scheduling of split transactions is done by
> +	  the host (typically in software) based on a best-case
> +	  estimate of how the full-/low-speed transacitons can be run
> +	  on the downstream facing bus." */"

We cannot take these quotations seriously.  They are 20 years old, and 
they refer to code that was never accepted into the kernel.

Nevertheless, overall this is a good suggestion.  Please post your patch 
for further review.

Alan Stern

