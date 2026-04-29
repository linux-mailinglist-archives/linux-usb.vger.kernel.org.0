Return-Path: <linux-usb+bounces-36710-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DLKH35Y8mmbpwEAu9opvQ
	(envelope-from <linux-usb+bounces-36710-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:14:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C52F499929
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 21:14:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0DCCC30117DC
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 19:14:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB8D421F1F;
	Wed, 29 Apr 2026 19:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="IzQfhmiS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8CB410D02
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777490043; cv=none; b=YhhwE2EQ1yOTBzFgcCHZRj/a5VZzumiUSqo6Zb0yxEFagr3oadBE5mvsorL997JPmcb0QQexB48Cnk0crEiiKkQvp2u15TNhOtUvZGHYznpvEC9W55PoIFLamCjvnEzupZamhWwf0Zbbi+quCr8qiDvtbRvBYoISN15D9FmLLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777490043; c=relaxed/simple;
	bh=Sb5nJTG/Jrr6wKWPpfL/z0Xs/3ZCV3AFhIdRfEM9MGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdQH03utI4f5Ul+6UrKUJNOyyKPzs6tyk7z0uZeiL0+ZvagoTkTHzKe0LMynGjqak1aLQLbYQRgDVVWFLxz7uzJN+I7wtJxNiYMOzKmlz2WwW7r64vlz8O8UHAhGjLGCKveQ7meQEx/ukXbitYlis/XKD/TRVLdIgor/bRPllAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=IzQfhmiS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso1144775e9.0
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 12:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777490041; x=1778094841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r6Ddd14nNnJPYQ1joj/lUCZz4p3egx61quq7CAtkrps=;
        b=IzQfhmiSlTeKS+M0MBA5O6uFDeTF+vBB6J/3RHtOxjj47EWvjhHh2Sj3pOXJc9tny/
         RmrwLRqbZ2XMhueg+iF+Xl5tffBl6OHR3G6ZT+8ntkvbtHR6ilTYEgb7CjehKdyTBD4l
         Gt36FwtFVkHyZCFEw/7YujCW2NnjLRQqee7zDsaptYf4oO6ncRngOrAnLkheitsN4wE1
         786yLIbriIX5qCg6t4bbXfZq14f2yj8mLEEuE3Dz6upahtlai+LXJbdu1cPTEaU6yDp2
         QYtCOn4yZwx7sELMx/E9D6musdLAbfKSBF+si7e7hLqSfDt5L4vxw7XUfCmnPHIsCs1L
         I75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777490041; x=1778094841;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r6Ddd14nNnJPYQ1joj/lUCZz4p3egx61quq7CAtkrps=;
        b=di7HpQ0IwEabfWeQXyObPJIRLcvWQJ/oXkplhmFABjJG/XkguzN/h1j9K4cYJ2/5y/
         cu3pzcjODlv2Ot+3+FNe2QFBtLp7FWeBjCajegXjhCPRl1lhP+s1xNJXVRulLRr/tQOH
         T6EzJLeaBG9zuB2k20pFMitYP7e0klX54p/x8/LClzbxAmWNyvYwqQJXV8U2NTSEITPw
         aCprPhS09+6CPqBSP4PtCBIdFzBM6j10teCknT677Y5mrHiTFzUUzJSJqAGt4NjYpXhy
         mIEWMdLq7ICOXIEms0j1h7XbJQC50RMGvGC4NHC9J0SvH6olSyEHGkihAf7wZKzs+CiX
         Wd1w==
X-Gm-Message-State: AOJu0Yxz/xzFgab1GJKKHata5wZuLBE9JPR6zf0Ke1K2zJoep/wTab6l
	EnJMpgQhFHbiEEOABEkq/9QjYFNs3rflZyfynozJCgGMjjipfA8hc0OrdmINRA9vtLI=
X-Gm-Gg: AeBDietrX2424hIe45iyFw1eQYO6+mKu/DewAg5oae3rjqf7ZNmIA4HJtUC34zwVx1I
	A+309keR5VlCzXT1FnnlgQrgg16RrVKQas6xDNU07TPGBR9bGGK4ID/rmCjx+qYMplCbvAGhHB9
	jjGdTANH3126NyhDiZjyOrjWLo38UmSbppwF+fFdzADFlgy9vSscNmWqc5eYz7HxiyvnBEVmNdW
	sh0NEtw05tvQZjbq4o6zeFkYRL76esaa+4gP+dkKF47uZSdjzKV6A/YJL/lRHywahO/cghVJhMT
	sqItsv9LinubJ8D6uzEmd2s5rNVZsNBIaW9AXgD3bKu53lrCppHTrCDKJ1XeBRI2JzVAbUIauz8
	cuvvHeKU00tasYwMyY/LCCX3LHfgDee5tOrkgFmRo3A07sVsgy+nBpvveqz9CxhJrnSF/93u6VT
	VEuj9EtFoKrSLGR/Uyxm+GKuhTPONMZIQscK9Ul6Hrbt9Tk0/J+UkKX3svzwzyOy/ksc0Zl7zat
	zcVkHJm+/TxugWT
X-Received: by 2002:a05:600c:8595:b0:489:6c22:e081 with SMTP id 5b1f17b1804b1-48a7b4d5292mr62591585e9.0.1777490040610;
        Wed, 29 Apr 2026 12:14:00 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a6:c701:bf3c:e2f0:87b2:c525? ([2001:a61:13a6:c701:bf3c:e2f0:87b2:c525])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7c305371sm24363565e9.18.2026.04.29.12.14.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 12:14:00 -0700 (PDT)
Message-ID: <f579301d-75ce-4b72-991b-494201b7d1ef@suse.com>
Date: Wed, 29 Apr 2026 21:13:59 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: hcd: fix possible deadlock in rh control
 transfers
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: linux-usb@vger.kernel.org, tiwai@suse.com
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <20260429104209.19620-1-oneukum@suse.com>
 <f54a001b-1825-46a3-a16e-946d88be8ded@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <f54a001b-1825-46a3-a16e-946d88be8ded@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 1C52F499929
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36710-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]

On 29.04.26 21:04, Alan Stern wrote:

> Besides, even if a resume was necessary, wouldn't the same VM magic that
> works for the reset thread also work for the resume?  After all, they

They need not be the same thread. That is the point. usb_reset_device()
does a resume. However, it is possible for this to race with another thread
doing a resume or a suspend. In that case it will block and wait for
another thread. Hence we essentially get priority inversion more or
less.

	Regards
		Oliver




