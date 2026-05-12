Return-Path: <linux-usb+bounces-37304-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oBaoCirvAmryygEAu9opvQ
	(envelope-from <linux-usb+bounces-37304-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:13:14 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0F51D65B
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 11:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 33FEC30A5E7E
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 09:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1C447D934;
	Tue, 12 May 2026 09:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4n8dDbD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECF33B2FF9
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 09:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778576902; cv=none; b=XWxomVdE8kReX46liDeasbwbt1DCSjcenHjiNomOnXTdkWo6zydNSy1uP3QaUu2/JUkR/QarMdXwGKm0zqIfddKK7kOfRsScdQEL2xALZXXAuG5VrZguWffrqWHJW8kP0d9RWg7OLhGMdCq89JWwRS/d+5kwJm6ziMaLZaio3Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778576902; c=relaxed/simple;
	bh=b/wdx0JxdFNZBaoe+Gd90TYwoBjNXJvGdzKNOxKIGpE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GjvIKITxSylRG/H5iXr3cU0/wAVn3ajsbdSCKea2Mz675aeirtqyQAKg9tSiX9CNKhPLFwfYcuJSKXbjXU3klu14ucDHEh9NwfWVqfTR4xTxDS00x0OFnKZox+hY4gOooey10KrgDyYIkj4yksZMqFQWlGaQelK6807pTwc5AQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4n8dDbD; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a8eb07ec4aso28435e87.2
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778576897; x=1779181697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4NOACufZRVzknvCTO/8uD8YEvDVaqas8vkavouO0fTk=;
        b=L4n8dDbDQM5WmP+nX3XKsrEGp4+eW0TxgRmBQyOMheT1UfX7JQD+XmUIMq1LbXea26
         igwRnO1HxvmpBJbkEtU9wg5r5MrGrpCSD0xW5qc9g8aKF57WlpkSO3Zdc/bA01z00NMQ
         F8g0x0iKwq3uaFblskvzPb4AMFQyTIpHJ1vAFH/LMGwyQK/GSGid4NNKkMEZ+i53V0d4
         qWRH3MYNFflkZ0yJXUgGxTYyE+6igsZYM9J6LZ/G54USf6mmGL4poDPldgmziZlPYeVr
         GmnMJoC6+pMwQpOnjaxA2Bp8ASu0qWtxJfdfRDssrE4Sh9lFVv67yZVx9jub78WPvkBd
         Ji7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778576897; x=1779181697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4NOACufZRVzknvCTO/8uD8YEvDVaqas8vkavouO0fTk=;
        b=Wu/+OnhGmdd/ITUXXnsQ/9D1MvR71N90VN09it8OxpydZq1u7Y2avjPKEKn4hkDQoq
         fgZrE+G5AVBmCmaDlB+r/8Jr9Glctd194pps8UxjK215qY5BeMxTwTyJdzrrB63bGXx2
         6qxoq7OAS88WaqksNokjK/trjbfyEbD3+9lc+cBSK1TLzHVCcO+xbKc9H7p+Z/4WsG4R
         hHJKros+rlvg7mq/eledvhamqXUnyE3In6k0OJd3iERlB/zK9Lr4uP6j3lZBrJnlmVJe
         B8VQFdJCyXUUVoifFn0rfr+90xh0Zy9mp3B3XWhVjox8W12Ar8IvKuVwgSy0Z8QYbr/P
         gipA==
X-Forwarded-Encrypted: i=1; AFNElJ8WbmCPz2AoIaW5gfQyZkvQPOd1PG/1YRaFOTUA5HtnKNrjmLyReDRfN1KwGGJ4XAbMby6AJmigrnk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfeuWc8YnjdClzIS+fpYQdQtIugUGCo5lhV5usX1S0P5GYyeiZ
	YiL7YTqXG35+Ijx6ou53LKF5TQORjZc2HvKeP+1lNDVxTxDRCl/wheFP
X-Gm-Gg: Acq92OFt8B52tzZYJdfbCSc7u6cUnmLst4G/yBGoDtCCyH96OxQkVJUcHnGAXkeiJkm
	V4CQym7eWURYwJwLky8PvaiB+sgNk30YrfWoWfBn+h9V7hX8a08SQbdlcJPkmwDqbMIa6Du/Bes
	r1gEdHe0COPJ1Vc8Ep6gH2sJ98Q/iolqn3HXrDP5YPSB4ePNqv8O8VDkr4texJVOjjyxrpKgM3E
	g/EdlFhXah8qoblBcmi5+cYkUhQ4xtBhf83WYuYFsyHyoKz+XbNroviGlsHMx70fIfk3B8ofMFi
	ksBmte6pY0wmbSsQsCo3mCyliLDEtM3CXtXxTSF+R8hAWQZ2r1wJR1eKPsZc2/uSgRpALlW7vIZ
	tvHxVG7dkEEmqchPFx/oGmtOlYMeias7ajolMylulfkBN8cORL3NqLXm8o9/+KiqtHU7qCEsZP0
	e/DDyE2AoQNLLQ4diyMQL4thdUdtE+ywMlEDTbALo1y3g=
X-Received: by 2002:a05:6512:3409:b0:5a8:9c2f:56fe with SMTP id 2adb3069b0e04-5a8e31f21f9mr837944e87.35.1778576896369;
        Tue, 12 May 2026 02:08:16 -0700 (PDT)
Received: from foxbook (bgw15.neoplus.adsl.tpnet.pl. [83.28.86.15])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8bdd67998sm2101259e87.15.2026.05.12.02.08.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 May 2026 02:08:15 -0700 (PDT)
Date: Tue, 12 May 2026 11:08:10 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: dylan_robinson@motu.com, linux-usb@vger.kernel.org,
 mathias.nyman@intel.com, stern@rowland.harvard.edu
Subject: Re: [RFT PATCH] xhci: fix frame id calculation for isoc transfer
Message-ID: <20260512110810.17fbde0a.michal.pecio@gmail.com>
In-Reply-To: <20260511192105.3756809-1-mathias.nyman@linux.intel.com>
References: <CA+Df+jeoj_QL6XNzUyP963HF7ngCWoAs0MjqQXPr3Fa6VW3rXw@mail.gmail.com>
	<20260511192105.3756809-1-mathias.nyman@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 8EC0F51D65B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-37304-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 11 May 2026 22:21:05 +0300, Mathias Nyman wrote:
> Always calculate estimated start frame, and set urb->start_frame

This may cause driver developers lots of grey hair when running on old
(non-CFC, xHCI 1.0, USB 3.0, "gen 1") HCs where nothing is done to
enforce frame number correctness so far.

Writing obviously bogus urb->start_frame at least was obvious :)

> Fix valid frame window start and end calculation to match xhci
> spec 4.11.2.5
> 
> Don't inclease frame id with 1 if a URB mod transfer is queued late.
> Queue it with next expected frame ID but print a message if URB is
> next expected frame id does not fir valid frame window range (URB mid
> transfer is queued late)

Failing to meet the IST is not the same as violating the 895ms limit.
The former may (or may not) cause the TD to complete with MSE instead
of Success in its interval. The latter is apparently supposed to cause
MSE completion when the HC reads the TD, even though the IST was met.

A particularly fascinating case is period > 895ms; it seems that xHCI
only allows submitting shortly before interval boundary, or "SIA".

Another nice one is ESIT >= 4096ms - exceeding MFINDEX limit.

That being said, I found that validating end_frame_id before enqueuing
doesn't take more effort than generating these warnings, and I think it
would be more productive - drivers know that their submission is lost
cause, instead of getting bizarre completions later.

As for ignoring the IST, my ASMedia chips seem to take it well. And
they specify absurdly long IST of 2ms, while actually running with
3x0.5ms URBs or less. The "less" tends to be glitchy, but I'm not yet
sure if it's xHCI problem or snd-usb-audio / other software problem.

For example, I noticed that snd-usb-audio running with 2 URBs sometimes
only resubmits when both are completed, an obviously bad idea, while at
other times it runs well for a long time. Still don't know why.

Regards,
Michal

