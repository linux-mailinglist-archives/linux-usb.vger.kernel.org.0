Return-Path: <linux-usb+bounces-34232-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MXYI2qUrWlH4gEAu9opvQ
	(envelope-from <linux-usb+bounces-34232-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:23:22 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EC966230EFD
	for <lists+linux-usb@lfdr.de>; Sun, 08 Mar 2026 16:23:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6AA85305857B
	for <lists+linux-usb@lfdr.de>; Sun,  8 Mar 2026 15:19:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D503629B8E8;
	Sun,  8 Mar 2026 15:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Esxr09eC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA781F4181
	for <linux-usb@vger.kernel.org>; Sun,  8 Mar 2026 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772983188; cv=none; b=CQMuPtjGURMHptBpfASTvatZuXGfVlDwYCURN9o1eG3QI+d3b4j4vXhexXy8Vrwouek1RZdQQtswXFq89O5DSKzhHtG6zS6tXafU/y7rBz2Jke0kcWz1kTLzRaDYOpTSIl/w+AC5rRRrsW9VV+55fFERNyKm0C7lDDJ5KvdqwQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772983188; c=relaxed/simple;
	bh=tKeS3fZ5eXGVdj5qMTsvi4Cpz133x8YuRzhP69hH6P0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E0TDFsInCzZgzcpPTIDk4v3fENsQBx0loqyWFrZmPvGL4oDAtKCHlWODfSViCygwK891BNoqkg+p3YiKPPK4VQyTQkoVw/y4Jr2jlOrhQv7T4FW9HAsge5FN9l3kTIfH+XkscEkLiInrcCPaUdHokvHl+mtyEvdUFl80jtkhX0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Esxr09eC; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cbb6d5f780so1092089385a.1
        for <linux-usb@vger.kernel.org>; Sun, 08 Mar 2026 08:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772983186; x=1773587986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A637omd0+l72zT22T4XwpP9C6X9vAt20cQZu6voj2uw=;
        b=Esxr09eCWpOT3TZ3Ixma9McbCe5eSq8tDZ4Ld9+ED6A4IdP0kAXdHFX5ChaqOc/e1O
         Xhl/Y3ytnLKgkkpEDoVHdJf8inHc3Se6LZ5LDyG1Vo/kCrPV9WyUzj9uyLPtRn9oQZ1w
         OPk1bEOfX2HSrMliY0wrO11LZnIR0YSWlwra5Plx5SRvoxfUE0epvUtEGP7j7fAKFfxq
         YGZFfQcOzjbVXF79vfBfBhQTewn5bN273xPqy8Z2p+75J4LfFCo4ETXvzmJtAxw2vzyE
         hnWpF8iT6piDEzQjMnAI5hVQyAAlpjxUEpUqwrV2RTAsRqzid3cQVJfJwIsA3txXo9+6
         lcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772983186; x=1773587986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A637omd0+l72zT22T4XwpP9C6X9vAt20cQZu6voj2uw=;
        b=c9V1gZ6iPQ1bbsm4/gNTTRU1FQzlnXcb2X/GwQF0sRj/qUakOUcDoc9si3n2WILJ4k
         ia2jcq7FofI7W2YLx1oWHk+5az7inLZtEYiHKa9y0dOgf4kXFfRmAXFe71BDY+fAtbAW
         fEp5vlSJyTyXDGw+CQ01RIymcX+lPT9QzFaMCLrsXKo2anYF8zaWN34hrtjSJZLD7a+e
         o+i4V7eUvJXIzKPHt+1vMvIWnLlT+Fo646ex8++0lBKDNaL/d56UFVlB6lZtsveFsUqf
         xBd37XKutBW1Wm75TRz6rwW0MfW9lRIxaOb23IjoXbc99QW7IOAjnEMG/6pPZ0U3xcYE
         w6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCVkVYfCzEww92yqJHIdKZzMGxh/j3gbR53yQLwKvBtvXdDRpUhhFPtHOM+hXMl4BUIJyZwXVqL+xHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhM0+dvrasypuYu3eXkAuJaQU8rxzT45NtymUpKzGq/GxLrRlC
	c1K5mRwpRMd4TVLeooURTL9Vf6eqf0QrrPg9mUZPflc9J+413UaNk5HaY0hzmaGkdFyl1lMOLkn
	4qTA=
X-Gm-Gg: ATEYQzzkG+VaI4H/XwH7S0sDWzZYCtrkw6J7sqOF5+SvXS3p9XCpkJrKmeshrhDjAfQ
	IH7xmvLXj3NwjdCZLLfKrwrWSlupkX6t+HcGCp/biwJH9YkuFK9kMhyDtKlxUbV9ufSULWonfHq
	AHtZ9i+qs22iqvcLrA2Un557Ad7rNmVdAmqsKPWZIGc51PV1zTDLFpkU24d6ViJiaD/LNo9406a
	eB2ndcxbzGtMGHXMmRmrVnsOnkErsTkJeUw+AARQ6pFneubLBS5G46Ugjk98JL7Mrr1uLrBYNrB
	NQBP4QhTEd8FqImfBr3LCqXo1fsF8VpyA+EynU/dlIUOSJ1s0bqNVDmJH7U3IwgP9VO4t0UEKhb
	z5bcLVlfZlnaIkxuJE6oYGbq+AoATOzmqmdee8v5WE/5VJTht0l/G8pKs/SMdGt1If7qRa+tbx3
	1wxgQfvJiz526toxdwikYz5TDR
X-Received: by 2002:a05:620a:f10:b0:8cb:b0f1:cf29 with SMTP id af79cd13be357-8cd6d4fb264mr1093152085a.37.1772983186026;
        Sun, 08 Mar 2026 08:19:46 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cd8641d344sm69812185a.31.2026.03.08.08.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 08:19:45 -0700 (PDT)
Date: Sun, 8 Mar 2026 11:19:42 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Liam Mitchell <mitchell.liam@gmail.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usbhid: tolerate intermittent errors
Message-ID: <85909b1e-2aaf-4fab-b691-6c82612d3238@rowland.harvard.edu>
References: <20260307-usbhid-eproto-v2-1-e5a8abce4652@gmail.com>
 <6cbc6c70-8252-43d0-8701-e1613ddc769f@rowland.harvard.edu>
 <CAOQ1CL6GcPUDw+wriKtqq05ywkuhjyi-ujp7WwFpSWgY1fV1zg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOQ1CL6GcPUDw+wriKtqq05ywkuhjyi-ujp7WwFpSWgY1fV1zg@mail.gmail.com>
X-Rspamd-Queue-Id: EC966230EFD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34232-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.939];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rowland.harvard.edu:dkim,rowland.harvard.edu:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 02:48:42PM +0100, Liam Mitchell wrote:
> On Sat, 7 Mar 2026 at 23:53, Alan Stern <stern@rowland.harvard.edu> wrote:
> > Do you think a better approach might be to reduce the 13-ms delay to
> > just 1 or 2 ms, and perform a reset only there has been no successful
> > communication for about one second?  This might perhaps be _too_ lenient
> > sometimes, but I don't think such situations will arise in practice.
> 
> I would prefer to have at least the first error resubmit immediately.
> I want to reduce device downtime and missed events. From that
> perspective, I want to assume the error is intermittent unless we see
> evidence otherwise.

Okay; a single immediate resubmission won't cause any problems.

> The current reset logic "reset only if there has been no successful
> communication for one second" is problematic because there is no sign
> of successful communication if the user isn't pressing keys or moving
> the mouse. Two EPROTO errors 1.4 seconds apart will trigger device
> reset and 100-200ms of downtime when ideally URBs would be immediately
> resubmitted with only a few ms of downtime.
> 
> Can we infer from not receiving errors that we have successful
> communication? That might change the equation. If we don't receive
> errors for say 10x the polling interval, can we assume it is working?

Pretty much, yes.  If the communication is not working at all (for 
example, if the device was unplugged) then an interrupt URB will fail 
within three polling intervals.  10 intervals seems like a reasonable 
limit.

> Ideally the reset is only triggered when we are very sure the device
> is not working and needs it.

Agreed.  I don't know how frequently the bad states that HID devices get 
into can be fixed by a reset, but I suspect it's not very frequent at 
all.

> > The reason for having at least a small delay is to avoid getting into a
> > tight resubmit/error loop in cases where the device has been unplugged.
> >
> > Alan Stern
> 
> This patch would only allow one immediate resubmission per window
> (500ms). How costly is a URB submission? I was assuming they are
> relatively cheap and even one per 100ms wouldn't cause problems.

This problem mainly shows up in syzbot testing.  Submission isn't all 
that expensive, but in the virtual environment used by syzbot, failure 
occurs during or shortly after submission.  If resubmission is then 
immediate after failure, the whole thing becomes an unending tight loop 
executing mostly in atomic context, which ties up a CPU long enough to 
trigger a warning about a possible kernel hang.

Alan Stern

