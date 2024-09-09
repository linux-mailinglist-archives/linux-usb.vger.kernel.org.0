Return-Path: <linux-usb+bounces-14844-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F259711C9
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 10:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 815E91F230C8
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 08:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 183501B1431;
	Mon,  9 Sep 2024 08:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkxL2XoY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0138E1AF4DB
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 08:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725870136; cv=none; b=us7TrCm99Pq/VAkJjpTU73UG0yclzJa/z87+YT8tih4tLmF1Sy4qVNtr7VudqBh3VLBtFOMjrDqNE29gRLuqPhq7+rFqdBTwjteVQ5/tAegiJrAwvjfJNeF/qSwnpn+HvKAd7b93IVqKX6HlE0/QzLeAdHJJRAaMYMQbDAzkeMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725870136; c=relaxed/simple;
	bh=5SV9BncNsCwdDRsJKDW7QHWdqlrduHaqsSp2Nj0m8y0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tihuD0X2Q0decN677+bbSAp1qHflI52pn0+mA5Yo07cN6iI8s2i+Aj+JTzQ0Y/XcJ2bSkG0nhCKXrwHLf1sbCMI2atdocaPwlM18G7iu+oTxD1a2Q1ziVc3Oje34YDjw+439+LQ/r24a2amoX8eWmtlwckAah0sWcQ/lImRrGkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkxL2XoY; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5c260b19f71so4026757a12.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Sep 2024 01:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725870133; x=1726474933; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gdM+QCwg/ntiYysKTHm+SMSy3bdTTXjM4KfjMorhyeE=;
        b=HkxL2XoYggZK9Re5aQB2QRFxgR1MFAWN9Bp2shAGwMHCX9qudJT+TVg5uXPaAWHPLj
         YsR73K3e4sA63O7XN6+nIy8fefrd0MCiQLQzbe577fXL87kNlgjk/ihTKI2Za1ov+0nF
         42EjoYJFy2gmzOYkW9mx4QbIiLTpBkZ4eily3ZpznHiyWxG5/3RLsE7/XGOYhJIiFxca
         Lzg8LeMrPxcOAyxfm8JC/26pea6h+SznEokV0uhMTrO+7MFlcZ9MrmxEdU0x3MBz40kA
         /sZibTvNZu7whgrYOC3NLRTdz7WtsLcgN90kH/M5SIqMYHqpdIhunsiq2shiqieK18yr
         RU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725870133; x=1726474933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gdM+QCwg/ntiYysKTHm+SMSy3bdTTXjM4KfjMorhyeE=;
        b=GKlS/PqkYg57qMMFHRnNGMDtMWJQY/X6EcTkweGpmFEpFxqXRNHGs2G6tDtSylkd5q
         IpsMd5VQLuLU75blEkLh/wc9vOczNgZH9VH2uEKSwS/kHWAbU6uNN3rcr14TdOZSgDKx
         535Jd8M0wVqrw4v9pJZHU7Rhz5zlM7rPwvUE6BgXFNqb+rgpuZ/52UjKRX4OV+HtRq8P
         /jXwDyWzjEf2xJMoC2/wW1aBJnpon1ULIqrgtwhSO+SwcHEHBke56ZQHd5Yv+3Q0Kvu3
         UNdH8lqDDg02u4H1AcPv9qTEaPPOApAiFmVfIOBBUSAA/54UXXizEzYJ5ooZDuAXiDsA
         bBow==
X-Forwarded-Encrypted: i=1; AJvYcCXfj/RG/n4sCy3FDy0bGeTqyQRl3RWt9uLPXGM26bHcSI/F+V5/fJC0a9PZe5MzwJ9CEs4+2JXNuzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YylpZr5ncamGH9DWRRlBXSywKNg7GFYsUk42swQ1gCfmNQaudds
	6ZGdpz2mbyY0RE/VkUM6TI+bOl1wZ6Mc+dWJMeqwcTBB+2Euk7x9
X-Google-Smtp-Source: AGHT+IHS059AWdBgvSGL/JaqIIw+DViYBcjAj68f/qe6hc5Sk60hlXPMybjGjs1RDrcPQc5z26I3iA==
X-Received: by 2002:a17:907:930e:b0:a8a:3ece:d073 with SMTP id a640c23a62f3a-a8a885bfdbfmr806943166b.10.1725870132954;
        Mon, 09 Sep 2024 01:22:12 -0700 (PDT)
Received: from foxbook (bip230.neoplus.adsl.tpnet.pl. [83.28.131.230])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25cec12esm303830966b.156.2024.09.09.01.22.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 09 Sep 2024 01:22:12 -0700 (PDT)
Date: Mon, 9 Sep 2024 10:22:08 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Neronin, Niklas" <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org
Subject: Re: [PATCH 10/12] usb: xhci: adjust empty TD list handling in
 handle_tx_event()
Message-ID: <20240909102208.490eb0ed@foxbook>
In-Reply-To: <1ae67893-fc97-4210-9e5d-74af158d5422@linux.intel.com>
References: <20240906142316.3b00e4f1@foxbook>
	<1ae67893-fc97-4210-9e5d-74af158d5422@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

> > This used to get the empty list warning, but now it's mere
> > xhci_dbg(). Throwing out all queued TDs is not the common case and
> > it may easily be a bug. Indeed, I can readily name two cases when
> > it is a bug today:
> > 
> > 1. Force Stopped Event on a NOP or Link following the missed TD.
> > Then trb_in_td() doesn't match subsequent TD and the rest is
> > trashed.
> > 
> > Actually, this is a v6.11 regression since d56b0b2ab1429. Although
> > past behavior was bad and broken too, it was broken differently.
> > 
> > 2. Ring Underrun/Overrun if new TDs were queued before we handled
> > it. If ep_trb_dma is NULL, nothing ever matches and everything goes
> > out.
> > 
> > Arguably, these are rare events and I haven't observed them yet.
> > And one more problem that I don't think currently exists, but:
> > 
> > 3. If you ever find yourself doing it on an ordinary event (Success,
> > Transaction Error, Babble, etc.) then, seriously, WTF?
> > 
> > Bottom line, empty list is a very suspicious thing to see here. I
> > can only think of two legitimate cases:
> > 
> > 1. Ring X-run, only if nothing new was queued since it occurred.
> > 2. FSE outside transfer TDs, if no transfer TDs existed after it.  
> 
> I can change it from a debug to a warning. Then the edge case should
> be more visible.

Actually, I'm no longer sure. If that ever happens, the user will next
see "WARN list empty" or "ERROR TRB not part of current TD" and this
will show there is a problem, so dyndbg will be enabled to investigate.

I would still like to see more comp_codes printed in those messages,
because on isoc there are some "weird" codes like Missed Service or
Underrun, which have a very different meaning from the usual ones and
are a source of bugs. But I would have to think about which cases it
is useful for, particularly after this change.

Lastly, I'm not sure if this change is worthwile. Over the weekend,
I have produced a fairly simple but dramatic simplification of this
whole code. The 'empty list' branch that your patch deals with can
be completely removed, because it duplicates functionality of other
code. The skipping loop is reduced down to 8 lines of code, as it
should have always been in the first place.

I will try to clean those patches up and send them out today. They
received varying degree of testing (some are two weeks old) and have
not caused any regression so far. They are simple and revieable IMO.

Regards,
Michal

