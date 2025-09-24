Return-Path: <linux-usb+bounces-28593-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3470B996C0
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 12:25:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20C8D1711F2
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 10:25:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D9552DEA94;
	Wed, 24 Sep 2025 10:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kb1tmWjY"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D082DE6EE
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758709526; cv=none; b=DQS0t8N3MvRKX6OmbjpXtka27hCyktrdmGJ4Z1iTfh/x5VZT4Gw0QdXslVoZnFxmlDfuduoidZYf7Uk4ZoMOlDCjWy5ngPf/4JqUsZYhwwLn8kixAlK7D+dXrtDCSUg6OKPPdfujzskZXufXwwzxrsEzAXmbkmDaxP/gm6uBHnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758709526; c=relaxed/simple;
	bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B7Dl0zH1/TDreinRWT0los+aEyS8Dz1th4PdO2y4EJSRlMktwiFs81Hl89deOBLzNo4cpGHbZW08H8JAY68xst8ClMrCz3/mlArL4hW5oym7I+jWp5KIuembHYW9PnB6iEXVuceZrwoHAIkcQWHYI2G4RwilWH5OZJidmza818w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kb1tmWjY; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-62105d21297so12051833a12.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 03:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758709519; x=1759314319; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
        b=kb1tmWjYAxZHv1lEtKs53N0IKcqh5YZzGspNXeX//gkxLfgZyusc8wk+0qFHOItw38
         S86jENoqHKOS81W2wGHd6TTkCGehE+p4vf94nilorxKiWUMJt4eZ7/RR5/jfJ+JFvjTa
         n0795byLhWLF0n3lEGyBUbde3qRLhEou8OsZ8l+i0GvYZD7pi5/i2ustfabxeIDY1fPQ
         lf+XOX1z2eYQw8cvm7PgUk8ctP2KVi0dvFgGgBV5eVqrBTz3uoYR63xOvRLusRlRJfdl
         /S7AQ1TIGnVdpywQdcDjeQXGOynu6kX3oP/DQx2FWMTF07vdCANYW5B+o8lfhLpIUpY+
         EGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709519; x=1759314319;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQ8E927A4tX2ZNYrTzlCctAB5m47ibJs+IG1u3p+hbo=;
        b=e1T+WiMvKRYN0MiwQE8zumEWCWts9avnaWmF4LaizCTsJsOvN1TEzOXXs3gFRP+JcN
         clALTE2lugqDuHLppmP/++UL1wlMsva4gWWDnjvNcli4mLj1lQFhGsQ733KK+k4olBka
         24p5yxDEb/42FsBSr/9+wypF+oHa1l86MsTboNk4Q1zYiszxcb6W43mInhk44HRbbRaZ
         SjiqqdJRNM6LDlqxzc4EGw5Xt05tHdJO+sUg317j6GCOeCnHXqzMMncSCyySHzogTwap
         f8bPTmR9rqPBNyYiNuUTk2nBit/LtgnrYq4a+x5m+cNT9a6BUen+Q852gR9wxfNDevbu
         adlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWstMWUOPMK3AewP74TMeODvhpL+MZpwcjZbKOVgIrnODplkvgI3BF+CjpkbLMfa4lnVrNpbI0r61c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoKPo6LHH3lburzL4aAkm0Fea2DgIE4+F7ullStIHZ5M4iQr9w
	Vpk0rfNcabf+HMgXrEA7HVJBeWVFxjhcCi7dn4dwXGogohqdv1ix3fizg/4ubYU3Q53IX0lutng
	/Rswl1PjfpAYHLoHzORukigsW3rVgKrU=
X-Gm-Gg: ASbGncuGRnly4SJaQbCBMkJ7xTPc14o4Ol7gOPejnIodSygkvKlb1m4NdHBpiJBluP/
	47c7LyQ/8qWKjZRxyIKkbxcMekyULrynQlysUjklFJIHZ7zo1wVWXrrABWadRB7GQbMsuFoZxLj
	9dSgxjgTSZXAKu27dPK8mI50ulOiS9+mh5T80qcENBj3JJGI8Bow+DwLMi/DZ5YOS0tnJkSRsWf
	BJmw4DyKri5pdhfESKUuTab1Yo+3jpuLnNtTZL/NrB+GrVAyA0+Zg==
X-Google-Smtp-Source: AGHT+IE12lCZ7Wl/ftwQJZ/gaWQP8iDkebbGgJsyR1xTOQTAeL+WLTgk8+fgJ+TjcKwHn6/rpkz17KvFRLGM6maxk9E=
X-Received: by 2002:a17:907:3f95:b0:b07:b782:51cc with SMTP id
 a640c23a62f3a-b302cebc948mr516277766b.64.1758709519082; Wed, 24 Sep 2025
 03:25:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <83171a57-cb40-4c97-b736-0e62930b9e5c@lunn.ch> <20250920181852.18164-1-viswanathiyyappan@gmail.com>
 <20250924094741.65e12028.michal.pecio@gmail.com> <CAPrAcgMrowvfGeOqdWAo4uCZBdUztFY-WEmpwLyp-QthgYYx7A@mail.gmail.com>
 <20250924113653.5dad5e50.michal.pecio@gmail.com>
In-Reply-To: <20250924113653.5dad5e50.michal.pecio@gmail.com>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Wed, 24 Sep 2025 15:55:07 +0530
X-Gm-Features: AS18NWAdKXxMmFRzk01TMU60U3Xy0PNKUuld4uhrZt1ayU1Hp7kGVqqNqefl328
Message-ID: <CAPrAcgMhphs1U88_POpxAeAp0KzNCH6-xuvNiSBa5dn7ceSU4w@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Michal Pecio <michal.pecio@gmail.com>
Cc: andrew@lunn.ch, andrew+netdev@lunn.ch, davem@davemloft.net, 
	david.hunter.linux@gmail.com, edumazet@google.com, kuba@kernel.org, 
	linux-kernel-mentees@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, pabeni@redhat.com, 
	petkan@nucleusys.com, skhan@linuxfoundation.org, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Sept 2025 at 15:06, Michal Pecio <michal.pecio@gmail.com> wrote:
>
> I think yes, usually in USB-speak "completion" is when the URB is
> finished for any reason, including error or unlink/cancellation.
> "Free" could suggest usb_free_urb().
>
> But I see your point. Maybe "finish execution" is less ambiguous?
>

I will use completion if it's the standard terminology

> I think it's an irrelevant detail which CPU executed which function.
> It could all happen sequentially on a single core and it's still the
> same bug.
>
> In fact, I just reproduced it with all CPUs offlined except one.

My bad, I see it now. I keep forgetting the actual urb execution
is asynchronous

Thanks
Viswanath

