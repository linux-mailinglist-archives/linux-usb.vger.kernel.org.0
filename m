Return-Path: <linux-usb+bounces-17798-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B18FD9D5E6D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 12:54:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1D84BB21D4A
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 11:54:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EEA61DAC93;
	Fri, 22 Nov 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ak1dypEQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518511CCB50
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 11:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732276452; cv=none; b=S1OWnEb+7p+FE3GS+wRyvS17Ezi48svhPHAFLIKlPkvkmwfo2mEOureFAwAZQf4b9qpadFLuQHrTgU/EvoLq3GnLD814jW3qgjMust9DGqStUaKkOuIbReYub0ByMvRZ0VmnfQnkSB3zlHRYFbStdOEh3U1YMSWogdNWpxihwF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732276452; c=relaxed/simple;
	bh=Wn+Vo56nUiw5vzDgmbZbwT/ECAUfmnjsTeklaJwjSoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MmjId1fdzpudGnlvXM/k9QDqS/WUdQcMAL5D9e2561SQI0s1QZMBW26rWc90L85tGUTNZueJDOOhICY5AfvdC61ZXFr0oFUS+BFllnyB3jr5DiEjwU+cq072CpKNbbxNqTDC+btbwtzRIwmzJ0CP3YcWtvnW9zjYn3/PzVHJlIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ak1dypEQ; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb388e64b0so24272481fa.0
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 03:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732276447; x=1732881247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iyF5xCFVBZg+c3sNSuVNFHmgMY7o5lHSGiOpYmGe4vI=;
        b=ak1dypEQlSLdVBRgct3urlBdeJOD/DASSLu+0yAWt7x84ylNfKNsFT5frDiSpN9xAJ
         JP3s+udzVpHnUyoIVVbTkDxCN/yw5n/Db07H/IxdUmmKirOTL5eZikMNxnQ3A2u5Nt1/
         QqNtjcHaYlUM4pth5BUhd1rA2PntcOKrrwlHcXRHh++tsWWDfm5LmRk/2RYDwMBrGxGC
         wPabp0UsfkLEtcRW2dh5uEBEf52hjk9kHSMffAB7n/0KxeL6kPJXUXTmpEWLNuN52hw8
         wBwZT1Xjf0wVVWa3NQy4EZF6IttWG5cox23eJvcNDWIxkTrPkg0HktT5p28f7+Z8vBh+
         eGhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732276447; x=1732881247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iyF5xCFVBZg+c3sNSuVNFHmgMY7o5lHSGiOpYmGe4vI=;
        b=ReDgqVXSOgyW+oHewHSyoeI1/C67ynIY93Xe+4wQ/7T4YefhHAG8WDsMaqPSvwLKn9
         1xHr//zcixQwy9w1PgDn5ZIg+Rfm238lfKL7mP885yV2hLbWY0QMYiYbdf7yVQoFnXBT
         VP5E9x4vH8qrfG545yWaClhZ6CBVV22rOJqzus6iGV2/MpuajuUuaqeYpN8sFtoKwBo7
         duD68ATEfT17in8AmmpYfs0xNDGrwmhogNWHCKHDOdB4Dfa/2BXNEMk/1pwd/P6SrKTr
         b+wGJHaecF2+mQMJHSUkXQ3I5QWeJTgHDHJuH2l2eS9Hs+M7Adm7FqzaIDU5RLfa0F1O
         ujyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvTWM7oaDAOkuyAAi+riBsndR4kpYCbQkNJxRKy7tFpQtvojuRrJ4LoI3lIy5+ELzrlOjhDn3Cks0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIs2PbE6gzBG+PgrklQ6y2gnG9752JnBGUWcrk+wC4+Tjf79QQ
	40eCytUwMinybUuNnBnOK/CF/eoie/TguUgsLJlrIJTboAYwTIkYUWzgDA==
X-Gm-Gg: ASbGncuU/82nsKjuTx59ErSw+dpTVsW7SJSjEXgmuhVs6cxXuIQe0hd4qbFzOZs3h2E
	BrSXX6/a3Y/ddO+b5Y5TCKIzZLuuI5OsDdcPzTMY2dZBa7udn+oRcDPVMngR0/B7JU5nEHxP1Sd
	EgtlKmMBHHEeuT4RuaL13myd5kdtaC8Q8D3PllTzg+orSL6AVzvPLa6monvg/idFbDVD/b4VbCE
	A10LhtdunEERuuCuEMZarCf4X4lHbkzVn1gOTPW4kebs/tzHWIWZxkMtA==
X-Google-Smtp-Source: AGHT+IEhGEUf/+HOwdWhkfX8PG8t4z1dsVsHbBlDAFPPhmmc33c3tGT27TzIYYPXuIG2Urb/tlPamA==
X-Received: by 2002:a2e:bea1:0:b0:2fb:556c:fe0b with SMTP id 38308e7fff4ca-2ffa716cf21mr16087231fa.26.1732276447102;
        Fri, 22 Nov 2024 03:54:07 -0800 (PST)
Received: from foxbook (bfd3.neoplus.adsl.tpnet.pl. [83.28.41.3])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa538e783sm3135111fa.96.2024.11.22.03.54.04
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Nov 2024 03:54:05 -0800 (PST)
Date: Fri, 22 Nov 2024 12:54:01 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Thinh Nguyen
 <Thinh.Nguyen@synopsys.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <20241122125401.65e0b10f@foxbook>
In-Reply-To: <f5a2d3f8-b895-4617-b11e-cc134e3922c3@linux.intel.com>
References: <20241121001138.23a45f6c@foxbook>
	<20241121000216.kif557p3p6xyahax@synopsys.com>
	<b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
	<20241121112653.06ba4ee5@foxbook>
	<f5a2d3f8-b895-4617-b11e-cc134e3922c3@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 21 Nov 2024 16:08:15 +0200, Mathias Nyman wrote:
> "xHC shall halt an endpoint with a USB Transaction Error after CErr
> retries have been performed. The USB device is not aware that the xHC
> has halted the endpoint, and will be waiting for another retry, so a
> Soft Retry may be used to perform additional retries and recover from
> an error which has caused the xHC to halt an endpoint."

That's why it would be "nice to have" the ability to allow class
drivers to perform further "soft retries" by killing all URBs and
submitting them (together with the failed one) again. Or by some
other means, as this is a rather crude API.

I imagine it would be the most sensible option for some devices like
serial, although I don't know if any driver currently attempts it.

If this is to work reliably, the sequence state apparently needs
to be preserved on both sides and not reset, regardless of what the
USB spec says. So it would take a TSP=1 reset on -EPROTO and full
reset on -EPIPE (no other choice here), each followed by Set Deq.

If xHCI wants or needs to keep doing full reset on -EPROTO then
CLEAR_FEATURE(ENDPOINT_HALT) seems like a good addition. It does
have the "double delivery after missing ACK" problem with class
drivers unable or unwilling to determine the true state of their
device, but avoids guaranteed toggle mismatch half the time.

> >>>> On the HCD side, xHCI will:
> >>>> - give back the current URB with -EPROTO/-EPIPE status
> >>>> - reset the host side endpoint, clearing its toggle state
> >>>> - point the HC at the next URB if one exist
> >>>> - restart the endpoint without waiting for hcd->endpoint_reset()
> 
> Intention was not to restart the endpoint, but turns out we end up
> doing it.
> 
> Basically we should not ring the doorbell  when 'Set TR Deq' command
> completes for a bulk or interrupt endpoint in case the command was
> queued to resolve a Stall Error.

According to Alan's kerneldoc, also for -EPROTO and ordinary unlink().
So practically always. Apparently, no endpoint stopped for any reason
is supposed to restart with any complete() callbacks still pending.

I imagine going back to direct giveback in cases of unlink/halt might
be an option, maybe even more reliable than waiting for a new URB. 

> >>>> - ignore one subsequent call to hcd->endpoint_reset()

It's also a bug that EP_HARD_CLEAR_TOGGLE isn't cleared when a new
URB is queued on the endpoint. Toggle state becomes unknown then.
 
> Using a BH also means class driver may queue a new URB to xhci after
> xhci has cleared its internal endpoint halt condition, but before
> class driver is aware that endpoint halted.

In fact, they can do even more. Network drivers with a simple complete-
resubmit loop can schedule a work to resubmit later if their GFP_ATOMIC
allocation of a fresh data buffer fails. More generally, drivers are
under no obligation to only resubmit URBs from complete() callbacks.

I suppose the combination of BH giveback and restarting on a new URB
is fundamentally unable to provide documented guarantees, on EHCI too.

> +               /* Try to restart the endpoint if all is done */
> +               ring_doorbell_for_active_rings(xhci, slot_id, ep_index);
> +               /* Start giving back any TDs invalidated above */
> +               xhci_giveback_invalidated_tds(ep);
>
> I don't think your patch makes the existing issue worse in any
> significant way.

Currently, it's just a sub-microsecond differenece in an existing race.
But if we are to eliminate the race, this code needs reordering.

Regards,
Michal

