Return-Path: <linux-usb+bounces-14961-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F40DF9759DF
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 20:03:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4A51F242B2
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2024 18:03:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C723F1B142E;
	Wed, 11 Sep 2024 18:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="aaSKblFw"
X-Original-To: linux-usb@vger.kernel.org
Received: from 008.lax.mailroute.net (008.lax.mailroute.net [199.89.1.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD01A2EAE5
	for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 18:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077799; cv=none; b=nVD0PjalJ7YnzDKP7XgI+2q3vvds2BzQdMWc81/0YFIj3C3zAg/sAN95Ci7Tos3Fo99PcRgm3vcRkLJy045PIbbT/hyP/M8/DPYf8dz8JBhjyhGlsNDNWO+NjtpqBQHQt8ZyF1pYuPuG3p7Ar+lVsuQZYVcEKM75XRWzyn6MpfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077799; c=relaxed/simple;
	bh=PG+qKQYMIgNQK7DxMVy+Isa/87GSFduVnbXPEig0kjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4mnjDEZtfVd+MjwojbyiKvmGItwUGeTYVDv+5vWT6FG55Ek9VAVpqQmOK98ypuEHcYjeJN/joswWo7IDpA2v47jjgoDi4lKjFpSO4DRiGtfGEFrNhn/h6JRROhaEClAOtZJ/i9cHS+C3w2SsEupfSX9PgtvnvLMSMOtZlmQhAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=aaSKblFw; arc=none smtp.client-ip=199.89.1.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Received: from localhost (localhost [127.0.0.1])
	by 008.lax.mailroute.net (Postfix) with ESMTP id 4X3pMg46rRz6ClY9S;
	Wed, 11 Sep 2024 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1726077787; x=1728669788; bh=1ManA1WjnnLn5YviY+MrWlEP
	Hesfqe0hd8uZWMu3HlU=; b=aaSKblFwF4eKtGeXmqDFQ76xGet8X6jCxqZGbGZK
	LaIT9b5EkQo7IoaQ1XnmfdLy2OYkRyiZTusnGhckY8VARu7k2qulD7l5B57xQGvF
	9zOVJkDvhjEZHiyASehne+/M84XjfDBcvukk9OxM6tlKSp9Zzw9VjN0ALLuMe/OW
	ToXT7H0cwGmDqFL4KxEtALA6Mcxwqnu5ozV1VmcspaxBEsSJSIFr04NAJqe1lEN3
	amq0GCwADjZ6L1CCioQZXBhoxjOJZnjvWr9Px/PCWL1hCifPM36w16DfxUp1czka
	RNYp0XwRV9h6VZx7KTNUX/GpbffCq0pf9Ja+w7Skp8vc9Q==
X-Virus-Scanned: by MailRoute
Received: from 008.lax.mailroute.net ([127.0.0.1])
 by localhost (008.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vnvvPappUYIH; Wed, 11 Sep 2024 18:03:07 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 008.lax.mailroute.net (Postfix) with ESMTPSA id 4X3pMY6vhMz6ClY9R;
	Wed, 11 Sep 2024 18:03:05 +0000 (UTC)
Message-ID: <10b5b9c9-016c-4d38-850a-63dfe9f3e9ed@acm.org>
Date: Wed, 11 Sep 2024 11:03:03 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Fix a lockdep complaint related to USB role
 switching
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Amit Sunil Dhamne <amitsd@google.com>
References: <20240905204709.556577-1-bvanassche@acm.org>
 <2024091144-throwing-stucco-65f1@gregkh>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <2024091144-throwing-stucco-65f1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/11/24 6:41 AM, Greg Kroah-Hartman wrote:
> On Thu, Sep 05, 2024 at 01:47:06PM -0700, Bart Van Assche wrote:
>> This patch series suppresses a lockdep complaint about recursive locking
>> that is triggered by switching USB roles. Please consider this patch series
>> for the next merge window.
> 
> I already took this commit into my tree for -rc1:
> 	https://lore.kernel.org/r/20240822223717.253433-1-amitsd@google.com
> 
> It's almost identical to yours, but you are messing with mutex states
> here, why?

What does "messing with mutex states" mean in this context? My patch 3/3
does not modify the mutex lock class key at runtime. Instead, it
sets the mutex lock class key when the mutex is initialized. I think
this is a cleaner approach than modifying the lock class key at runtime.

> I'll be glad to take a series on top of that one if you can
> describe why this one is "more correct" that that one.

I will rebase my patch series on top of your for-next branch. I think
there is agreement that the approach of patch 3/3 in this series is
slightly better than the approach of the patch that has already been
queued.

Thanks,

Bart.


