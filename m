Return-Path: <linux-usb+bounces-34954-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOCKGo9/uWmxHAIAu9opvQ
	(envelope-from <linux-usb+bounces-34954-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:21:35 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DB52ADD8A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 70887303BFB7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 16:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0736330FC30;
	Tue, 17 Mar 2026 16:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XCNb/djl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256512DB7AE
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773764441; cv=none; b=WYDB4hNSEgxmbNPTZfCv9gFFxv/a6ElXFXEoSQyuxsQb/bgKhdu4cBuGpgJV5rOZwRMUAFnGDcqJzf4M4CUNSQw4DkkDxa2i7Un9APyXsfAiOKz0bct0EiqBYLt8SoWpBnEulNbnV2sYLAPqWUcXr/YbWf9YZVNjVPG12MSVfX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773764441; c=relaxed/simple;
	bh=DLq9AmRl0iJU8ppToHBERXSXtsnT+8oJ5cwtuQORosA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TSoM9m39NydxmdW5UYVK0bhYYVj+rDuz8sbutvYeLAnMSXXYVMqLQFgzZ0M62fexHijLUOmcv0w5gT3A0Ou9Qu1lQ1KGtHPKtaMYJn9794xReH2W3yFSuDTsn3Fp5H6bCeSWeqtjEWS4ZYxh+UwymRi40djdr1fVyEmxw7XkCXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XCNb/djl; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-43b3d9d0695so49920f8f.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 09:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773764438; x=1774369238; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tnisd7TlY1Gy9kT9XohrLS2B8rMojeL6Ho3R0x1SVWA=;
        b=XCNb/djlv66XHIJswmEgXY5Mt0mInBtFuYbG/jDvH25Ij9VwEJ4BUheMjAjEtS5lu+
         CQQX1HTLFD+iinfZl7CU98FhMy6IkX3aAzUJ4WrARXkTg8sRPG8GoJM108jfPlsbhhWw
         gr6OZEdRTUNtvLGCEHPGsM+WlvtI/qbu5cH9w2XT6ELyTd13l/7tg2Wlv+saaLh24WFc
         0jk9hwHDmdU6dj941ynkI6KIaFeqSr739uRY87BOfwBMfKAsk8JhZb8HzlG9RT/KHvnc
         uwXq6fWQy4Y7TVqU3PgHBEfv7AQQB9ydpcU153wPKAtCcSvYB/qb5djzR0AFJ/4VXXCa
         EXHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773764438; x=1774369238;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnisd7TlY1Gy9kT9XohrLS2B8rMojeL6Ho3R0x1SVWA=;
        b=nD6F2n9K0vGhgTp65rTGtlvHGiYNOP+2xEECldujzPvIRKMNfo2waIUoPoytEruAGF
         9XGOXpiw4+FvC95uD+em2nv925uhxC/T9iea+iz7FZQYnFanvFpjVnf+dqBkzJLVepHk
         BxJ4NCrZmHESHViWSJR/op0eMARusAJQP1QM0c/i1GUrK9wIFGDMA6YlYBvVrMY4xkxM
         k/l8VEdyjoziDiSgL36vo00vPsD1xBMHuiHzpc4EFXhEFpCzxJcfjuqo6QxmskyYCWtR
         dzdhY0ADdt95ToJ7gs8DpwgEIWlLgJeo41bE8EbnxsaPYaQUvxOAo5UeAPWIZo5MeGOo
         6nkw==
X-Forwarded-Encrypted: i=1; AJvYcCUEXojD5G4DR+hKSmThOQ2nlEu1F/MpDrNjyHuI7HXLnQG3NCOaM8R3I8z+Jtw9xg6J8PmKg4aHqjI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym5UCkSQHIcbf6N90hldcuBwq1+IXFA2Eht4sqZXbqdc95aGhZ
	BRB2Z2xEjigy9mZRT1sMBwMcw1EJT83PNjZ0eZ3pKd3/ogOBXYOjpokQQ9Wk5JQ1ZXQ=
X-Gm-Gg: ATEYQzwKcCbcQlmADGp8lF1p0ARWJk4P2b1+fQQz5OvIoIUxd09tfKlKWzxVj/6dYRu
	T6kWrH7EfAy8Pom1jkQkNDKIo/qbUBvY0y/DoUeL54Yml7PS3oGZEYjlWCCgh/JxZFZKyUYYorD
	hQSY9sktZmmtKxzlpwueAouqYcA7dmoaVfxAdy/5STSPiBvzWy78ERKICDf0cDUswiSsrOA7DjX
	LRlAb1J9+T3C4HCNQiBNxnF+JVqqAv/TYDjtRpeg8sZjcDmaGaf3wJaMP5OGhaZTLxMcScdJwmz
	kP3Vq+gmeBb7Yx5oNh3fGpWjiMXgXsdURp1zC2m2agar4CG8NuqX9sUGluZpdWBaFygVRvl43iE
	3wKM978pXAudEOPNNxhnfSXvlupmBLY/rOTsLvh01zz5W9M8RKrHtU1IvocVjGKVPE8GknJ/7jD
	zdBu7GPhC8Kn42YrNomVN/sfzMia7xw0PVn9lBCVnZpCIE7gYgj8B1qOOV/Ozd2cJZzGw=
X-Received: by 2002:a05:6000:1886:b0:43b:4352:1bf6 with SMTP id ffacd0b85a97d-43b4981e507mr7576218f8f.13.1773764438380;
        Tue, 17 Mar 2026 09:20:38 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ea:b101:88d5:cd46:69d7:10e4? ([2001:a61:13ea:b101:88d5:cd46:69d7:10e4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b51852097sm487439f8f.9.2026.03.17.09.20.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 09:20:37 -0700 (PDT)
Message-ID: <87a692e2-559a-4765-8321-a422751d3589@suse.com>
Date: Tue, 17 Mar 2026 17:20:37 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: correctly handling EPROTO
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Michal Pecio <michal.pecio@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, USB list <linux-usb@vger.kernel.org>
References: <20260313085354.71a6dbf1.michal.pecio@gmail.com>
 <12567c7d-0a17-46a0-8acf-3158c2d9011a@suse.com>
 <9da0ac4f-12bf-4270-af6f-e08b5a89611b@rowland.harvard.edu>
 <20260313224528.dp6utjqzbdguwlbf@synopsys.com>
 <a6934c14-aeb5-40d0-865c-14199943e2a2@rowland.harvard.edu>
 <3028610a-f05a-4bc8-9037-cca152e46c52@suse.com>
 <437037d6-3fe1-4f81-b74a-21bea00725e0@rowland.harvard.edu>
 <0b45d0e4-53f8-4960-b41c-63639b496dac@suse.com>
 <4f8b9942-307b-4c31-86f3-1b7b20b34a16@rowland.harvard.edu>
 <d1674f98-cbbf-4a16-8c76-996a0494d931@suse.com>
 <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <abcd2076-c2d4-403d-8ab8-af747b335075@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[synopsys.com,gmail.com,mork.no,vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-34954-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,suse.com:dkim,suse.com:mid]
X-Rspamd-Queue-Id: 14DB52ADD8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 17.03.26 15:31, Alan Stern wrote:
> On Mon, Mar 16, 2026 at 08:32:59PM +0100, Oliver Neukum wrote:

> If this happens, it's a bug in the host controller driver.  All bulk and
> interrupt endpoint queues are supposed to stop when a transaction error
> occurs.  This is mentioned explicitly in the kerneldoc.

Good.
  
> Think about what needs to happen from the driver's point of view.  An
> URB completes with a -EPROTO (or similar) error.  We need to unlink all
> URBs queued to the same endpoint, wait for them to complete, and then
> try to recover from the error.  How should a core library routine handle
> this?

I am not sure.

> Luckily the core manages an URB queue for each endpoint (see
> usb_hcd_link_urb_to_ep()), so the routine will know what URBs need to be
> unlinked.  How will the driver's completion handler know to ignore these
> URBs when they complete?
> 
> Following the clear-halt, the URBs need to be resubmitted.  Should this
> be done by the driver or by the library routine?

My preference would be by the driver, because it is not clear whether
simply repeating the IO is the action the driver wants to take. The IO
may have become obsolete for example.
Yet the endpoint must be made usable again.

> When the library finishes its work, it needs to tell the driver either
> to start running again or to give up.  Presumably by means of some
> callback.

Yes, but we cannot assume that a full device reset is always the next
stage. Nor, and that really hurts, can we assume that only a single driver
of the device is involved.
  
> How will the library keep track of recent error recovery attempts?  It
> needs to know when to stop doing clear-halts & retries and instead issue
> a reset.  How will this reset interact with the driver's recovery
> mechanism?

In principle we know how a reset is handled, don't we?
Again, we cannot know whether a driver is the first, let alone only, driver
to request error handling.
If we decide to reset there is no point in clearing a halt and resubmitting
URBs would be wrong.

> It's a good deal of reasonably complex code, which should not be copied
> to every other USB driver.  While the approach is sound, the problem is
> finding a reasonable way to implement it.

How else would you handle errors of this kind. It seems to me that we
need to make the delays and number of retries tunable, but other than that
what can you do generically?

	Regards
		Oliver



