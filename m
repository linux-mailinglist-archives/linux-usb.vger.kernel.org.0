Return-Path: <linux-usb+bounces-36686-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGCLEinm8WlZlAEAu9opvQ
	(envelope-from <linux-usb+bounces-36686-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 13:06:17 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CF723493558
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 13:06:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C963E3030D4D
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2026 11:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E2A351C24;
	Wed, 29 Apr 2026 11:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ImSCa42d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B45E1A6800
	for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 11:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777460758; cv=none; b=El+NVjh3qd/vaI+LnEWyaRQD8F9W8HijFG86OInR7aUOVvWy2HCgH0+7/OFO8e/wj6f56OIrzwZNxgRobvoxI/iGBuyA16uVHMUd/BgnvbScFP9U0K/A+wiOeJePz0fe8MH1UNHNtjDIMimAcyZKvdVTbf/nrVq+UFWcEJ9+Kus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777460758; c=relaxed/simple;
	bh=v9BnFQmwFTgqXQlnE02I5N6wHvuu4bnKD3tbl877ThI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fUia+bG1zazR17U5QtqmoyAKH6XvvjG7bLLGL/TLPzEI++dinAe33TcHv1nTrui5DnhYXhH4cwAD6gN21AEJ/wxoKcYHTZYtwHT/8rf0ZQvq30GXXyax7J3gFI3XztyirM9SqeAjJ19Umcxx3hSm2EMbxJGbO4o1STCROC/eDBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ImSCa42d; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488a9033b2cso130107515e9.2
        for <linux-usb@vger.kernel.org>; Wed, 29 Apr 2026 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777460756; x=1778065556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRVzgal7eZpLJ1Yie5YPU5GHSytDuYEeVoJoPrcXLu0=;
        b=ImSCa42dKj5Py8JZTdezkdhV972l+BrG33/5ISKbCP78bk1q6K5ihjfLJT0clnCOsm
         J0fR4OxRaIGbJqrS3xCHEoqVAGs8AiKs4q2qV8L+yAN4cQxWmbe0RA5OlpaQSM3/kZae
         4Zu7Qm0nPWaR1JlcyyIbK3ppWgL6wHgqUDMIiXmATD6RBHlqNnJFaJvyBNEUq8IP6but
         N7+HI1i8TDXkyZZaQ4dUXqL0jBWWQBvAcXhblDaEh0lZ0FraRKk6TYZIiOqVq9Vsn/bz
         m/Nk41fO+J2yv3cv3fBiv5ZYOSW8Dor7P+WZXzuTRzrYHSD4ARA9y0HbyWkl47JTE3um
         PDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777460756; x=1778065556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zRVzgal7eZpLJ1Yie5YPU5GHSytDuYEeVoJoPrcXLu0=;
        b=Ge9Oou/u9H43cLMppsRHYBraK9KfUcrU3oD19eghzZcExwaKuTeIHGl8pbpDftZtu9
         edPV6/TOV87hSmLptcaVHJNO2zddmHLiiRWYx8klveinOeRRhM9W0uIhdYPCcQ3vhFU7
         9aKej9EdwyZmnVvVT4ekJm1+T7nD/r4nN/fEc0y2J99AsL9WZg09JDyo+XFg9f1lVWCQ
         rEvMvdvBCnJ5AdevlkfACTTsy8sTDBdswZkxhT4Kvl4Si339lsluVRjdNt/nM3QAwnyb
         jb9TMjnrX1aWk+oC6J/HqBoRTcgEiCTTuZblGW7KUfQL0ef7gT+UOBpELlYPh874qvsC
         dpFQ==
X-Forwarded-Encrypted: i=1; AFNElJ/ycM4Stgqc2fJUYD7gLmYaQL/MFQ3D4+iqwM0wFG+Yx14Zsx8tqnvrWnXeSxC5UC8S5bl7NnQfwok=@vger.kernel.org
X-Gm-Message-State: AOJu0YyC//dg4cAs4BUn5Ksvc+krPWN7W1g5pbiHqH3x4rrQl9wOsOMg
	p7A++V32joO/+nt/NereSDq1QJqHaEhwHrPp5ibhbd/D6JXOc7+g4FcGGKgWKMEx6/k=
X-Gm-Gg: AeBDiesU57FLWyAM0P2ddUdTC6lPqPgHHso0xcISBncptOw1nww0LvRh48ZnoMUlFmO
	/bDt1G2IHzXzYcJdOSPRB3MI8Yf2vQZvqkc/izbnYZpP67dLdGhzoZPuQs1a4vN/I6UMQdfb8J5
	MW2itxgdtRllmq/VZZMANc2IW7tWDXqerw+FhHpxypAQziD0tCWUtcxnADBHxwPzw/jHGKhGkWw
	Hz2goV4WjTGus+tQjgRKn1X2MEYl3QQ8iFxf6gFD95hiYV16xq0sAN7j3eF3ODE+Az8WAmttW5a
	MQzeRxcjRzLA9SM8wzH8NuRyyA+8sOWnaycXobh4/yAGE8Yz4PpikGjJR7INtkxG0FmAhp5PnvY
	6rvAaeMiUHAxPZP6VZV+RfhfNdtBGYmQ4N8wWs46MTY7dMqRw3jiZkhqZxvrlHgHqWSurBf7Woy
	wGyubAFQXXrvJ/FZQU5OcIoheB3zCffWpWmY5HM4nBm0g4Wvuw1TQIgFI6EzFtupa+NDkmIzNbX
	WN/cw==
X-Received: by 2002:a05:600c:8b54:b0:48a:5339:ef0e with SMTP id 5b1f17b1804b1-48a77ae5405mr123927545e9.3.1777460755694;
        Wed, 29 Apr 2026 04:05:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a6:c701:bf3c:e2f0:87b2:c525? ([2001:a61:13a6:c701:bf3c:e2f0:87b2:c525])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc12bcbsm79585275e9.1.2026.04.29.04.05.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 04:05:55 -0700 (PDT)
Message-ID: <53355559-faa9-4386-b6f4-390fb1409ef3@suse.com>
Date: Wed, 29 Apr 2026 13:05:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] sound: usb: caiaq: fix reference leak in probe error
To: Takashi Iwai <tiwai@suse.de>, Oliver Neukum <oneukum@suse.com>
Cc: syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com,
 linux-usb@vger.kernel.org, tiwai@suse.com
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <20260429104527.19927-1-oneukum@suse.com> <87se8eox4r.wl-tiwai@suse.de>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <87se8eox4r.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: CF723493558
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36686-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,suse.com:email,suse.com:dkim,suse.com:mid]



On 29.04.26 12:53, Takashi Iwai wrote:
> On Wed, 29 Apr 2026 12:45:24 +0200,
> Oliver Neukum wrote:
>>
>> If probing a device fails early a reference to a device
>> is leaked.
>>
>> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> 
> Thanks, but I believe it's been already fixed in my tree for 7.1-rc2:
> 7a5f1cd22d47f8ca4b760b6334378ae42c1bd24b
>      ALSA: caiaq: fix usb_dev refcount leak on probe failure
> 
> Also, there are a couple of fixes for caiaq queued for 7.1-rc2, too.

Very good. Such things happen.

	Regards
		Oliver


