Return-Path: <linux-usb+bounces-36622-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDpfBZic8GmGVwEAu9opvQ
	(envelope-from <linux-usb+bounces-36622-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 13:40:08 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C729B484039
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 13:40:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 90E36304D604
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2026 11:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0EA23ACA6A;
	Tue, 28 Apr 2026 11:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CGj8P96u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0102935DA41
	for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 11:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376010; cv=none; b=ZQj0kEAx4wWwOGiKf6BepPCzHoZHkOc/7xDM1o+jPEV353k3RNpWmngR8CYlVbKXzi8b43PyNmvqwr6wkZoUvu++uroR/1Veh4Lkwm252tvyz4ChJAA2cmd5ZwCur0P9XdMw35Cy3PlgA5lmIsjpLqoVqFx7Y2ZLgEy77CsZY0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376010; c=relaxed/simple;
	bh=g8nUliw/hWQbN5M0FZl75SElbuDa2QholzG3VSRW7O4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J2YexYDzOjho4DsnG4zT6X1h1j/prIlE7ujw6G3HvzYa4+ABs+2nGl7PMl1HJNk0grTBLqPGGnQcS5v2zmVWkHrYrthITAvmZevtOcplcPU4WGt3I5YSt6l3k7iN/nUDqNQasJoT4UsHLY+1vn6k5s92XFqEkYIZKQafRyW7KXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CGj8P96u; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43d75312379so8060898f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 28 Apr 2026 04:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1777376007; x=1777980807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=10W4QpEE/WuLK6YZDLyMPAJfJraP2DAdC3O6Ax3ih1E=;
        b=CGj8P96uZkrOrdvuYzAd2x7a/oyg57aStG8vBE1AU3LGb9S4h1NkLrV8UZlES1M44Z
         x+X2JaupPdwFGG852Ichd7RWMcX51Dxe6TVes4vVDZjHCHPWI3zFRjB4FDfpkXZ4ZGv/
         LXXdMd6y6W2XmalLPKt1iRe53f4/XPxQebDSD6DAGtadPWp2qcuZAhZ7byCqgZ7ba9w4
         RjuV0sbEZdWqK7LxIl/TjJLSHWLiNoF+Ab6MKntXXKA4PGD+soEYmLY+r0t/B3lPORo/
         9gZAadWP0DLsI+NZ2xzFHFMtJCNIVHF+mJHc5JaoOqVFjVG8NxwWtEsrr1vTyebAqsMm
         bHsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376007; x=1777980807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10W4QpEE/WuLK6YZDLyMPAJfJraP2DAdC3O6Ax3ih1E=;
        b=IqxdLEsGq1WzmINJWLb0DGkYRC7/J1Qy5aGKUVX+YICysBFlOJKki7a6zxkcovZQXG
         9/vHZzWHtYbXAVE8dq9NVr8YxNCuut63KoSvAyzmCTtwPdrRCL/7Y9tEdARJsxJQViqX
         ONM/IQr3UMSmO57jL1dlDs3SjZa3XIHN6xCwjfB/WfdNBN/5iuOBJzcxrFhv+I1Qi+Hm
         XYQ7J83zBt1IzhhUJcB2GCQZrF4YPOK+wOgAaeDkcfGEM0Q8umY5rdEO04It7qROb6YY
         4/LFBHNYe3u25OJ8/u3pvzDTPKyuC65B/5huF0U0wIbf0dsFo5nSMEk5e1lYIdlqpu5y
         j+Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+pyj3t6Jvii11sEVVywDQIGtf2wcxpSdwDrwcEbyZouGRuN0GZCuBn+Z6a9DWvnZ5IibC/9x8htLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcyb0g3OaQBR2UH45HcvxKMGGeFCOVz/0ceMrW0hzDFGNolprw
	FDeT2/7JDWjp+TrAYsEVKVtM2sXdJxwCUOVxbEgSzx5bfHsscPUlRyly5RdN1CB/sck=
X-Gm-Gg: AeBDiesdnkg5ZF1z6rgqCSeDmJ47A2JlG5LkOcflkoV3IUbKsIpTjHHLfXVJMsMQEZL
	Jj4sPW8h0cDXEmMEV4M303qZmu7NBeV+1Luq0Mhi2yW6uV/d+9NyfyFX7t7WAxhFVFf4/dHtl69
	9zFQoC9VUe13CB7+VzzxbuSoUM95uAB7Nz+XII6w+m/d+GHiLf1tAi7bkCoO0xTwTN3aTiC8F+O
	rP0/nSzN4bceapvTz6lfpjXqN98WzV13yd4fPvW0irIwzd3pvjrHxeP5kMnVboNWNJdOSn7vyks
	DeEQPh8RTOWA1aza5vOe2LLh4t5UZ2sLMKUsRIZEpBvXho8Oovh246PTrGEXr7zPmAb115X6k99
	FpYGgh2efwiMeli/FpOBarCBfXbxiGuIT22Jd8hfyCPbH0FqxPN15y0tMII1iidpR5X1xvu79ws
	Nws7rt9om16lUrFM6nDYzQy9VoIPch/OJQXiEsI3ndcu7EoEyWjFp16ETkos226whzjPGuHtiuD
	Is=
X-Received: by 2002:a05:600c:a08b:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48a78a536acmr31307515e9.14.1777376007300;
        Tue, 28 Apr 2026 04:33:27 -0700 (PDT)
Received: from ?IPV6:2001:a61:1399:ff01:bd7:b9d5:f4ba:1161? ([2001:a61:1399:ff01:bd7:b9d5:f4ba:1161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a773b9b5dsm54235445e9.7.2026.04.28.04.33.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 04:33:26 -0700 (PDT)
Message-ID: <5c8e6c36-e8e5-4e88-b789-0f46614cb03e@suse.com>
Date: Tue, 28 Apr 2026 13:33:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] memory leak in hub_event (4)
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+2afd7e71155c7e241560@syzkaller.appspotmail.com>,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <69ec231a.a00a0220.7773.000c.GAE@google.com>
 <9fea44a5-83de-41ed-9531-11e5d471dca4@suse.com>
 <bb39abcf-aefd-42f6-b9e3-e576dbb5fc37@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bb39abcf-aefd-42f6-b9e3-e576dbb5fc37@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: C729B484039
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36622-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,2afd7e71155c7e241560];
	SUBJECT_HAS_QUESTION(0.00)[]



On 27.04.26 16:19, Alan Stern wrote:
  
> This is not needed.  dev->rawdescriptors and dev->config are deallocated
> in usb_destroy_configuration(), which gets called when the usb_device
> structure is released.
> 
> The memory leak must have a different cause.

You are correct. Yet I can see no way for usb_destroy_configuration()
to not run. Hence we must be overlooking something.

	Regards
		Oliver


