Return-Path: <linux-usb+bounces-31684-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69212CD6C79
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 18:13:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9325B303EB9D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Dec 2025 17:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FCB133A6E0;
	Mon, 22 Dec 2025 17:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="pT7rqi7w"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34661339875
	for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 17:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766423033; cv=none; b=hHmM/YSDSjxlBQTl0ERQlXlaLpESb19GAiGaE2d6q2bkJ3mlNjbHHj3Of7YRWQnUCZhuJoGQ9rKztN24iwc4aw0tOcm62tv3WxvXwpb7ZYH5wqGge3JNxsevk1lQ60oPJUzd0S14r72a5ePhvoYNpeYQRblgmF5K7tvLG4pzSLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766423033; c=relaxed/simple;
	bh=PreRh/E/obhZD+jtxkDTAYjmzBvb/0qD8dDJfYIHQfs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpCjWJhkuQ2rXzwVbzDVyO6spqV6M05qZ6bnye0ZrlpTzxCYNi5kl4fXzGGi6PwaOzR68KkdZSlTkjpWb5n6XJSisYlW0lU/It+yGQ4fxe01TeBHeabFyiM5joVbOZSa7s6ZE6eXE+ALPnGxCLW9hlEaDAhrOK9JbYRr2VFbzR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=pT7rqi7w; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2dec4d115so419293185a.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Dec 2025 09:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1766423029; x=1767027829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mMWLwab/VM0T/jEP1lIIrd/OSzx0lIr3fnZ5bGVANlA=;
        b=pT7rqi7wcxwUFVtwFgyXP0MVvpX2x8VwpMBr9IEpNKj4XqKmQNuy0bAmvPfJakTwl9
         jAQMIM//imm+OOORytyE+Hx6Y0yOSnjJZZfDCF/j+pU58i4rQ2+0VeHbM1VJam+BSu2V
         d9AZg2n9UxxBe9tDhbnygIO7KQUAdz9r86rS4iYbs4V7aFsePoTkeaEweTlc1eDWN0ph
         wHZJHhEE7kXZKhmNmyoeupWMKHxtWSD8Bo9BHxbX3HJLqKpwcKDVkvXB7tIBit4fWWBx
         0qpsBPAmllI+sqI7TgZa1pWH01G6NMIhbhJ1LuB5i2iW91B/MVDnHgZtqJwHXrdDIwir
         POhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423029; x=1767027829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mMWLwab/VM0T/jEP1lIIrd/OSzx0lIr3fnZ5bGVANlA=;
        b=QIwlQe3jtNsPPtlumDi3jrC5nx+mWPI8TpVSDSyQ39zs/j/XGbdr4Q6TeyPcO+sk3O
         fVMAWwMMfwDqqeLmGwkCWFFarWZq1Mr2fv+hOk5q2FIMbooFR24y3LYPdOwGKecVgRV/
         DpmwxI2duR+nKWz/yiM/V6gPEuKlthoe+Eg7dhkLApny/jnheT2rkjEU63ug7wD8ZJHu
         1/GSHloq+CxQXUsPdELGgrQiXpMG9xOTSnO8ghjwH7eWScILGw4AKgwW4+TN4bP5ByHt
         wLmXRi1RRUAUZFbQLTt/f/SLB+i4/T/CPoJt+Tr0d0XuLfjdU8IB/wuwhvTcIlbIfrVs
         Ao6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUr+9VxxYO2lbRDIS4WkP76WEgiubGOLN+KBQtBmQJpHigo4maA+puzeWYF0iu6TkhSFprj2b8PReo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81H7oVjGcHU1qyyVMQWXwOUANX3IVGlfNBkd/X/LugsCo/4+W
	muGoe7T4/vpyOw4Lu1NzuvdnjpfuLCPBoi2uoEBzH0Yob9b9obZ+dIHXVq0DEFdvFA==
X-Gm-Gg: AY/fxX4cIbiJDfZ6r30YdZsUIhd0Jtt3QqcJwthzj60XbMGJSvN7ca1GnDFI0pAkY9F
	u2PngNtKK7SKsWedcF2fNmZ6rViYe/s+UiVIZPapjg4alUeamsjRiwEwU06bsRpYFzp2gCOjAJ2
	xzo+TYPQLxLhXtNLYpePoTcjiISMApv9uGuon4fd5PGEbWAkdrfR/qdZYl7ywIzCRtsSm4J/2v4
	2pbNj7W/HYLFFL2A7SQZNXJNNuYmHMDQXjTHSUdC3NNWxl9z/GpzaG9EArZCelgn0Zgn9YXTdex
	Qen1qE7y263uLhBeiI4fotX2v4NDuLlSyOR9dD92lH8KWKVWEZkg9E4NSomkL8srRT5DsfNQEwF
	5NzfKUYcFY3cnE0NGdbsvDw1QGVxPYMAy8dUrP2hOqBaEYY7imEOxoEhZ6ynb66tzKmcFXy3clB
	TaEDYiHvUv/9LR
X-Google-Smtp-Source: AGHT+IFKyIsQ68cKllVJRyTjR7pmspM8N/rd0mwuVTfvHx7leUFcU6gGlvxeCPGPXFRscfzcoOBC0w==
X-Received: by 2002:a05:620a:1996:b0:862:f354:ec3b with SMTP id af79cd13be357-8c08fab9c87mr1711377285a.61.1766423029295;
        Mon, 22 Dec 2025 09:03:49 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7e72])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c0975eec8fsm886724885a.54.2025.12.22.09.03.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:03:48 -0800 (PST)
Date: Mon, 22 Dec 2025 12:03:45 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: =?utf-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Mathias Nyman <mathias.nyman@intel.com>,
	Sarah Sharp <sarah.a.sharp@linux.intel.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: xhci: check Null pointer in segment alloc
Message-ID: <38822950-6d69-4ad6-be28-fb8f328c8ae5@rowland.harvard.edu>
References: <TYUPR06MB6217F5AA7DA1E43A567CBA04D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <4935bdf5-4d36-45c3-9bcd-9d14606dd54e@linux.intel.com>
 <TYUPR06MB6217AC2CE5431DC9B3956FE7D2A9A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20251220141510.1bc1ef19.michal.pecio@gmail.com>
 <20251222064252.GA1196800@google.com>
 <2025122253-stopper-tweed-6e68@gregkh>
 <20251222085543.4d7430d5.michal.pecio@gmail.com>
 <TYUPR06MB6217CB438F21763401A93E6ED2B4A@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <eb5715b5-613a-4610-9852-1a6ae67b4153@rowland.harvard.edu>
 <20251222174934.4c9b62d2.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222174934.4c9b62d2.michal.pecio@gmail.com>

On Mon, Dec 22, 2025 at 05:49:34PM +0100, Michal Pecio wrote:
> That's not the situation here. The problematic resume is that of the
> host controller itself, it's the only place I see which is expected to
> destroy the segment pool at runtime (other than stop()) and possibly
> cause the reported NULL derefence.

Well, there are two resumes in question: The problematic resume of the 
xhci-hcd device (which you deduce happened because the segment pool was 
destroyed) and the resume of the sound device (which caused the crash by 
trying to add a new endpoint).

> It is not expected that anyone will add endpoints (and probably do
> anything) while the HC is resuming. No sanity checks for that either,
> the driver just does stupid things. It likely does stupid things too
> if you try to manipulate devices while the HC is suspended.

By the time the sound device's resume routine runs, the HC should be 
fully resumed.  That's why I wrote earlier that it would help to get 
logs showing exactly when all the suspends and resumes take place.

> And it looks like somebody found a way of doing just that, by calling
> snd_usb_autoresume() at inappropriate time for some reason. The export
> was added by Wesley Chang, so I guess it was part of "audio offload".
> IDK if offload uses it correctly. Somebody uses it incorrectly.

There's not supposed to be an inappropriate time for doing an 
autoresume.  But I haven't specifically checked the code in 
snd_usb_autoresume().

> Resuming some USB device wouldn't destroy the segment pool and cause
> this crash. Here, device resume tries to add an endpoint and crashes
> because something else has destroyed the pool.

Exactly.  It would be nice to know just what that something else was.

Alan Stern

