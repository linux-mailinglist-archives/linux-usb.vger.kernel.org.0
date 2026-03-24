Return-Path: <linux-usb+bounces-35375-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wL2JJZtiwmmecAQAu9opvQ
	(envelope-from <linux-usb+bounces-35375-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:08:27 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 042B430636D
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 11:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 71689309BEEC
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A7B13DFC73;
	Tue, 24 Mar 2026 10:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b="F/fT5a0h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E823DC4DD
	for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 10:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346422; cv=none; b=s60yIyCzWE7NtBHulrBvOci+S2lf/QZsPgWBBhqZTU3XZFS+cA4etCJbxStxsCg6MxgtpBpP/1jXN5nEmvq7zOCJARMhTd34Ozbpttj1MzApuHPC4/N0NzObgihQ3Rah1+LtORsLCaWE6crBjcxhfSv3+E3i+JLZV8RmzwfYDS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346422; c=relaxed/simple;
	bh=ooI/of6iIMhwaolVmJe5QzF+o2UFAwjUsunBuba/CCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pbyBapSgPiSZxgioWvFzIJQzbHHi5ohbnKdBLzD7kR6dLqx+yzGhq/94w6Y0lBRkymIhRmUW7bqCK7RIooVRNc1K2SYtOwQwpfuRtLZPLCYEWtGtvhvtNfYtKRX2fH/qJY6qAOU3Hw2ASFQF7ShsLi7LEY4f2aJWEf4Aw4pvBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name; spf=pass smtp.mailfrom=scala.name; dkim=pass (2048-bit key) header.d=scala.name header.i=@scala.name header.b=F/fT5a0h; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scala.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scala.name
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-486fe36cfabso20312185e9.1
        for <linux-usb@vger.kernel.org>; Tue, 24 Mar 2026 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=scala.name; s=google; t=1774346418; x=1774951218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ARWJUu+jLsllsfljpa6yVCzZESL08EDSZQKX0WUAal0=;
        b=F/fT5a0hDk8kbb6098Lo2hEjM1XpeDUpdi4gtl277L4eEAthW3PPtjt+ur6u1wMt7P
         Y/sRHFRwtzfoZ5fijT7AhLHSA9m2UfST8naAd6DN8gRTuewKXcntSEfnHVWAc1cyOJlI
         B6LGeiXqqQOI9cIqqlAXosUIuvrD//uabQkBkI4/ZKsFujFbzpCB4WTY0ccNU+ncnkma
         ks80Aib3uH7QiCEEtUjuTlcu7yEQO/P/60cPhnuv+if7lijX3s6NGZFUemdPCqPMGxx3
         2WAQU9rrDCD2iFHJs6fW8FbAxOoukwbQz/btxwctGxMsuWWl+jJtK0tQoHwPm+g+CjRU
         GExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774346418; x=1774951218;
        h=content-transfer-encoding:in-reply-to:from:reply-to
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARWJUu+jLsllsfljpa6yVCzZESL08EDSZQKX0WUAal0=;
        b=kfuOQiW/W9VgCV2hEzi0Kto4EIm2bFL4ePgAm5jt4MyeDpV/rjxSsVuj5phbZTcGc4
         ePpzOJboULHgtpLMfhUrOeq9gd1itIA5GJMg9WO4MBX5JmyfhWPrecR1YojrHou2g6lp
         msB3tdwednIhK3CKsdFyqVyrUDkfcgZTJpHh3QNvnHodfMezZ+hOxGZFPm9YtDlwbFUQ
         vX1g26Mr2UwpPowfTilEKIafrtjpzbRsngisU6cNSRZ0e4bxTvLwrQZC3hOk4SjMLR0I
         6T70iFcoX+DJGQsIN83jaKjMALDVcOQ1o+omWuC4HWXNRKdssibNiO4VXm2bV2vH+8nQ
         drgA==
X-Gm-Message-State: AOJu0Yxx9vht7uCH6FgQ5s0//HshWJ4F/8hvkPU9OzWfaF40fTZOOyvm
	H5Vh9g+ayBXi6Qz6mk8XLvcyhL0RhqBhUOpFvqI6j2bHfyNz+8IwngQPi9YLxqMgiKw=
X-Gm-Gg: ATEYQzxVZ6lfaVMkXq0LrSoJWt0R1FD+vVKz0UIr7wxztQas6zW9lrNYjWBlGfj2BaR
	AAX/dqQ3iSvUDZRqFVEa0Tq8S33P8zb4NxOLv4NFPtf/wSf0gAL7K03rqvmQ0O2AedfhxjIUZBA
	hTX1LboY9V1OzEey+4tegZoh6+WrPqexbpOLdJiLILuRyF3K0SpHyX/S9UKOlyYBaWO21gokq7N
	o+Kxh3y9hl+Qay0CCFcRjevia+yr5yl2w90NJkjS6iBp9Bl6j+IgLDIQ4cyQJwsA6DNSG4yHUhJ
	6imcK2DYbL1xqjmc1+CIjvcpO6pjSGRk+gkeoUlVvHeFGNZGml0nZBa5VC1DjwDfrU0BUtVilSd
	edN/r3FQbiJdagjzWZOTU0h6cOB4iMGVUkWdNTGjmoO9M7QbfaIMfxKSosedhnaerEZeemxLNKK
	FnHy8Ndl2XOsTiph+1Y0RdWi7vo+PI+bVR8Y4QmY/luM0MGPqpz4m6oMG8vslEv4Q=
X-Received: by 2002:a05:600c:1d02:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4870f1f40f8mr37921465e9.5.1774346417598;
        Tue, 24 Mar 2026 03:00:17 -0700 (PDT)
Received: from ?IPV6:2a02:169:ee00:0:98f1:7a2a:1483:7cf1? ([2a02:169:ee00:0:98f1:7a2a:1483:7cf1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487113d73c0sm42614995e9.0.2026.03.24.03.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 03:00:17 -0700 (PDT)
Message-ID: <159947f9-e9a3-42e1-b728-842d60f3b3a3@scala.name>
Date: Tue, 24 Mar 2026 11:00:15 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Caldigit TS5+ problem with work in progress patch
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <7333738a-8364-42fa-b334-c4dc4b0ee503@scala.name>
 <2026032244-imprint-reverb-32d0@gregkh>
Content-Language: en-US
Reply-To: Francois Scala <francois@scala.name>
From: =?UTF-8?Q?Fran=C3=A7ois_Scala?= <francois@scala.name>
In-Reply-To: <2026032244-imprint-reverb-32d0@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[scala.name:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TAGGED_FROM(0.00)[bounces-35375-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[scala.name];
	DKIM_TRACE(0.00)[scala.name:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[francois@scala.name];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[francois@scala.name,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,archlinux.org:url]
X-Rspamd-Queue-Id: 042B430636D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Greg,

I've rebased my patch on the latest kernel version 7.0-rc5 and fixed the 
linting 
errors: https://gitlab.archlinux.org/fs75/linux-ts5plus/-/blob/v7.0-ts5plus-test/ts5-test.patch?ref_type=heads
The change log of the patch:

usb: typec: Allow altmode to have multiple partners

Signed-off-by: François Scala <francois@scala.name>

Now, how can this been reviewed/tested ?

Thanks
François

On 22/03/2026 20.45, Greg KH wrote:
> On Sun, Mar 22, 2026 at 05:37:11PM +0100, François Scala wrote:
>> My question is: how do I get my patch reviewed/merged ?
> Did you read Documentation/process/submitting-patches.rst ?  That's the
> place to start.  You might want to start by running
> scripts/checkpatch.pl on your changes, I see a bunch of minor coding
> style issues that you can easily fix up.
>
> thanks,
>
> greg k-h
>

