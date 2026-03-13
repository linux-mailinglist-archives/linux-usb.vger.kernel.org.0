Return-Path: <linux-usb+bounces-34726-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABweFp7Cs2mEagAAu9opvQ
	(envelope-from <linux-usb+bounces-34726-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:54:06 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E52C127F065
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 08:54:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5657930244C6
	for <lists+linux-usb@lfdr.de>; Fri, 13 Mar 2026 07:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CAB367F40;
	Fri, 13 Mar 2026 07:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JEwnnfS0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6C366DB6
	for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 07:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388443; cv=none; b=MMp/MI5ECu30PuW1Zi0l0rmFW0AMiJmF0J+SXbI4knhrWb9DLxvSGWyWi8JEwGalIrkffQYMxWv0UtfcX0DszKoClWtiURDEjyzuCAtlqeeVTAK+SRNoc1YR1SyRkGbpnroU5n0d30FQeQgKix1tUtml02V+SsAsy6ag1D23YOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388443; c=relaxed/simple;
	bh=jt7Q0YpozVFU2JYLN1Tv5tTOW2OIJzmJp2og6qiZZMk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4bAjVGcsJtlm4SYRYQAZJOlllcT6vgDeYacVQiMXiJM5ob5yi4BU4g3GPueSVtYZk6yxdnYkZ5keGzzCxrGS565/Ksz/DyFV54HNiQJvJ5E3XpeCZ4b8BsJBQy82zy/hBHodufg3LXby8mtV/LVWCQBeusf8mDEseZPZsZQPBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JEwnnfS0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so14881715e9.0
        for <linux-usb@vger.kernel.org>; Fri, 13 Mar 2026 00:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773388441; x=1773993241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PWX5LJR5kknKR2IQrdXLResO507A+WELR7cdP2AxW7c=;
        b=JEwnnfS0qSNPfy3GtJYESBoiv5hfH70y0eDuRu/OxJrDGSvL/T+97HA8htVyYJyNkk
         xTa5XSi8DeBNnPz2rZh5kjVjfYCT3OtUSa4SnE7CzqbLPiSwZAdNsNaWUmkoUWAO6TA8
         VcUY5yWZfR7t8rIHIk2K1zKo2ODaSHYL9RQvzsKMmMX3plSaXpG+ggbPBfz6jlHOvo2m
         u6HhatbMM3mbnpn3w94a0ZDISjx3L2xJ6lOwAWsGyQ9HftA8DyA/BMjC4RYJzFDuc+XY
         fDrMIra5FZhMID/9KcPcL/aIgarQXoHSmFXc7f+xD7qYBzqUhutSnTI9ENQE86OIddbl
         5otw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773388441; x=1773993241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PWX5LJR5kknKR2IQrdXLResO507A+WELR7cdP2AxW7c=;
        b=guBFkok+mA2vudCIWWTkfGEen00aFcSKA0OUuqwOtmeKuLrOnoClcTjU9TKoDK0NR0
         t1BAewbs+cCqXr1FPajdJKGYUGuLway/z8Gwphm+bst1QviYoCxAX/nM2ySrXgjPF3Yt
         CtC2Fc6RkF9gOBlB9Ax+D2Wt81mDe0Y8oBSGr9ogyDfB2aysa7R1x7AHNF1lXwkrmE1D
         IdhjC2BeGrWwyP8qaPJ55ysmdqlL3TfTxRYoPrqbqg9YZWwX/3YFmSJGsHlwD/LeSzuL
         FKRlB18xVv9p3qvoPRlhEcHW1y0q9dAOhQi/L+ngUzkA3ZqL9UrkA8f90QKwl2aTtmMb
         0LPA==
X-Forwarded-Encrypted: i=1; AJvYcCU3Z5brmxFl3abGrT0HN/LbO3/xJ8K/ZzMUBsiCYltjkANDtBJ8VutLGCFHuepJlLrBhSW9V0lgbLA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4L1uh6vTqMRkWfpSh/9jCQBt34IioEnRGw37ykQ+4xwCcY6D2
	aT/OMX7zy9ART4yi++qMtK4f5pyiKzN+M8/WGkpdbKeIB5b8x1Wfqr30
X-Gm-Gg: ATEYQzwKoKzwG/jzOr6Fzp86DRk3gZBkn+b44kj0zrTJPHa/QaC2S6X3LwOJyE8altc
	uxGH/imVwtWRHFJh5NpSfkyH/nA9PK49fjiL4oCgLxDnAp9O/fPjh+F0WaYAamkaQKPR26Y/lmH
	jzarpWqPf9HoCeGK8BktOyVCkjKNOaXSxrdmHG331w8Qn3mKggpv4J2nNVOh0/7vjiI/VBshV1B
	nK1+dJlNoZVcrMbcEA1+G9KBrqu1kWhaKzMbBzwVgGdFNDIF7+J1NAfHBozd5fCAaCk7sqDftOz
	7+01gKoQoc6GgDfBXlLwOgu36yDGSf0LKiZmxbrp8BNKXV59UMiaHwWJxIev4EaSbXPGXDFcN/C
	Q9y33mncf+WvkvLqkQel404j3Y+DO5IjWlL9pgTyy1EEye5iJBJmVIrDbFk7j6oe7dHJ2an5Km8
	Agps9PGLlN7h4UaV6lm35fkGKuTxOA8tDJfmA=
X-Received: by 2002:a05:600c:1e8c:b0:483:7783:537b with SMTP id 5b1f17b1804b1-4855670b73cmr33567595e9.24.1773388440633;
        Fri, 13 Mar 2026 00:54:00 -0700 (PDT)
Received: from foxbook (bfk214.neoplus.adsl.tpnet.pl. [83.28.48.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a738easm18210045e9.16.2026.03.13.00.53.59
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 13 Mar 2026 00:54:00 -0700 (PDT)
Date: Fri, 13 Mar 2026 08:53:54 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Oliver Neukum <oneukum@suse.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?B?QmrDuHJu?= Mork
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
Subject: Re: correctly handling EPROTO
Message-ID: <20260313085354.71a6dbf1.michal.pecio@gmail.com>
In-Reply-To: <64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
References: <261996a8-7ad4-4df2-a469-f6602da71255@suse.com>
	<4f85311c-bdfe-46a4-a310-4a74a3c56b3e@rowland.harvard.edu>
	<64dc9c5d-d662-41e3-898f-71587b940a2c@suse.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-34726-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: E52C127F065
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 12 Mar 2026 16:57:18 +0100, Oliver Neukum wrote:
> On 12.03.26 15:21, Alan Stern wrote:
>   
> > There's a discussion about the same issue here:
> > 
> > 	https://bugzilla.kernel.org/show_bug.cgi?id=221184
> > 
> > See especially the later parts, starting with comment #28.  
> 
> Well, that is fascinating, but not necessarily in a comfortable
> way. It seems to me that for all drivers to care about the
> exact details of getting which toggle back into sync is not
> a viable strategy. This I'd say, when in doubt, clear a halt.

The official USB philosophy appears to be:
- remove any remaining URBs from the endpoint
- clear halt (even if not halted)
- use class control requests to bring the HW and SW to a valid state
- submit new URBs

Some thoughts:

1. Giving up on EPROTO may be overly pessimistic. Bit flips happen.

   But EPROTO may also mean disconnection. Parent hub should notice,
   then disconnect() will be called at some point and usb_submit_urb()
   will begin returning ENODEV.

   Some cable failures cause persistent EPROTO without disconnection
   being detected, e.g. D+ or D- discontinuity at low or full speed.

2. The idea that a driver can retry a transfer by resubmitting the
   failed URB encounters certain problems.

 a Resubmitting a multi-packet URB is tricky - part of it may have
   already been transferred, so the URB may need to be modified.

 b With transaction translators (LS/FS behind a HS hub) one IN packet
   may already be lost forever when you see the first EPROTO. The
   interrupt case seems impossible to fix due to HW timings. Fixing the
   bulk case would take actions different than ordinary URB submission.
   No API nor EHCI support seems to exist, xHCI can't do it at all.

   Note: even a high-speed capable device may sometimes work like that.

 c If you usb_clear_halt() before resubmitting, a previously delivered
   packet may be resent and accepted again (if its ACK was lost). Both
   IN and OUT seem potentially affected. Some classe may not care.

3. EHCI/OHCI/UHCI can do proper retries, except case 2b, simply by
   resubmitting while minding points 2a and 2c (so no clear halt).

   The same action on xHCI currently results in 50% chance of the next
   packet being dropped by HW and the URB waiting for another packet.

   Tricking xHCI to behave like EHCI is uncharted territory. It seems
   to stray away from offical USB recommendations.

4. xHCI can support retries cleanly and painlessly (except for the
   impossible case of TT) if the URB isn't given back or is given back
   with the understanding that it is still present in the HW queue and
   can only be unlinked or resumed at the point it got stuck. Issues:

 a No API exists for either option. However, a few retries are already
   made before completing with EPROTO status (except for TT).

 b This doesn't work 100% right and is disabled on some controllers.

5. If you have more URBs queued in advance, you may encounter bugs due
   to race conditions (or outright broken logic in case of xHCI).


Summary:

Retrying may or may not be productive - see 1.

Drivers written for EHCI encounter problems on xHCI - see 3.

Existing API is awkward/insufficient for retries - see 2a and 4.

In certain cases retries are impossible anyway - see 2b and 4b.
Extra work by class specific means is inevitable. See "USB philosophy".

Regards,
Michal



