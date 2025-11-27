Return-Path: <linux-usb+bounces-31013-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E41BDC901FB
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 21:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 63E1334E381
	for <lists+linux-usb@lfdr.de>; Thu, 27 Nov 2025 20:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320083128DC;
	Thu, 27 Nov 2025 20:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWPzv8q3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C975262FF8
	for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 20:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764275745; cv=none; b=Ckx3KRAQeeZn6YIOmbrMm5TcSMs18D3HYrq/p3r341ID2/bNAzX/0TQgcbO5l0GuXCcwVIO6nhDAQ22fQbLnBEnOcQwk2m3co3ajhJvu+mLkoaDA3gyJdUj9AympL3rgupP4TTgR/wmlXni1fIOZmlSQIIaWxu1fxTIazc4wHRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764275745; c=relaxed/simple;
	bh=HtDJiGKwBcd0MheKnVnzDxPgz7tlHfxmRyB9yTFfvLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DVxLM60vzeh5zDoJvczLBNpMY5gj5fDxuSKTeHhjKVDA0WK1rWGDS0NN2eq08R7QpB0o8zH1MsBNoAHFvfH7ksmBHBrUvmS+v5qCqBv+XkuCCYBElkcoOdmaL+DwzzrqPi1z02rvIXpFW7uRDuEcVCEi4ZxyhHk2vjE4VCZ6i7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWPzv8q3; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-641e942242cso1062294d50.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 12:35:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764275742; x=1764880542; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LiJqKid1AUPaq0JBx2dwztOPzocSSNqSoSuSWdADDrE=;
        b=OWPzv8q3Yyqzwfe12KbyyODlc+1jt13+A9+Bj7yHrw/48wfDIP+f3VbyRHuBSETRdF
         yEeYd1D5zozE2koqY0wezaNB25tch8QL23CcHy4ImA32zENSi4m50OhgA26lw3GxNUrN
         syDJPSgH3WJYoyYkxessaNfzEzHnJ6MIu0C1Tb3oFWNdIrVYPW2lUN69F3MhYc5iDnhx
         UJNKuupsqa2B2PEgv2IpNjJSCAsdWNlj+jVbNPSspUWWLbL4E47e4JfoyyVgL1VofTeJ
         Ef9hs8l6JuYLLFBlUgpDk4aT2XKNV/2l27CQ07wK7LCB54xNBRDxuPqd9eP7ctnP3Wuf
         bRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764275742; x=1764880542;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiJqKid1AUPaq0JBx2dwztOPzocSSNqSoSuSWdADDrE=;
        b=gVSsXkCfcLpjtq8HdKQ6jzP2mmgbSABO+xW3nNqE+eGTqQXXFLgwo5bAD0n7VYuz3Q
         56xyztQN72P2e/ZQQbKtsyy9BibFytKbe/a4i2EhyJQGFlmvP+DfVyohzW7qQPYHVDMO
         nesHvHLn2F/7roKjLI3oTRoZo1Lv8lJF/yz2UC1M0FG83eCYvztkN68uMar5javGDtIU
         46ar5UCXt82tI1W3EZdlF1FsAHKDthmO0nQ4Td+GEtL392pjYU14EmSboGKnmziFoWGb
         jgfZLHF0mKvo5qpqWRhoZ4qjmmN4lYg+e9I3VQsNTYJfjD5muQbF/f/NYZunwhln3/t4
         QfMA==
X-Gm-Message-State: AOJu0YypMB5X7TTRJ3VaMmiUxqY/Xx0jD5mhwFjUUaVK8+/KbdEWCUuL
	B5EQEHe0TVDZQfd1Gs+0jt27QP6pFpWQMBj+GIMnrZG7cr0OGHH2ldVR
X-Gm-Gg: ASbGnctJNK+S1DupIODcIW2E6nWBK+bW3toDWFqYpIZ03VHyPrTMHEUlklEPtbhDhhl
	gHQ+0W6mh/veW+I6DKDLw7LBw4XDFy+h6GlgsDauxDwL3/Ipf9/othGA4PLGai0iFpcyW7uYDfh
	mJn1Rzi/aJZBx1QghEUPHny2sRlgMf9Sb6hg5QcoobX9CLSDn2eshYKyfzfxg6vNmpxLstazdL2
	RLcF76D7C4GdqeiAxkq2c7DByusqNmGUMQNuaqIOyMSNWLpYccghSjJ2dWoL0aJ8SX411DEdf7k
	jLxMSZnwqw4trdyLK2fIzl3swDcg7adB7ZaZXxnvknc24mgNSuIz4kG5UYqU0w2zsuAGxLMx4g6
	gK/gnJfO0d3oUIw1doFe6w5IDYhY+prjjtI2WFHmtRH3iBADfrHbsiaqcBVecO+oHwLb/cV8XkR
	KRKolqxmN8iGJs2vZCMRFVqQNM9IrRd/lt1lDXWmFAKDY6Mjsorip4Bd9KV8x5wfmXuPzg
X-Google-Smtp-Source: AGHT+IH1ZhvCQv2MEp+5/UarxbSxfCaOdxcBamQdmSSrJtRgTbE7ALnAkKsKzoTBGbYiZAzE6cNyag==
X-Received: by 2002:a53:ce8f:0:b0:641:f5bc:6999 with SMTP id 956f58d0204a3-64302b39306mr12603551d50.85.1764275742186;
        Thu, 27 Nov 2025 12:35:42 -0800 (PST)
Received: from ?IPV6:2600:381:6a1e:8e2d:1df2:9a47:b4c6:d8c2? ([2600:381:6a1e:8e2d:1df2:9a47:b4c6:d8c2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78ad0d5fe10sm8958637b3.14.2025.11.27.12.35.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Nov 2025 12:35:41 -0800 (PST)
Message-ID: <70565b52-d42d-4808-84cd-ac8587c75b10@gmail.com>
Date: Thu, 27 Nov 2025 15:35:37 -0500
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] usb: gadget: dummy_hcd: coding style improvements and
 error handling change
To: Clint George <clintbgeorge@gmail.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 khalid@kernel.org
References: <20251119130840.14309-1-clintbgeorge@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251119130840.14309-1-clintbgeorge@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/25 08:08, Clint George wrote:
> This patch series focuses on addressing various coding style issues in
> the dummy_hcd USB gadget driver. The changes include simplifying error
> handling by preventing kernel-space crashes, improving readability, and
> ensuring consistency with kernel coding conventions.
> 
> Clint George (8):
>   usb: gadget: dummy_hcd: replace BUG() with WARN_ON_ONCE()

Hey Clint,

Regarding our discussion on Discord, I wanted to give you advice and
have it be closer to the code, so you could see what I was talking
about. You asked about Greg's feedback regarding the "Bug()". Here is
some context so that you can understand Greg's feedback a little better.

In Kernel development, there are thousands of people writing code. As a
result, developers will write something like "Bug()" or "Warn()" if a
particular path/condition is met.This is to create a signal for future
developers about situations that should not occur. A later developer
might do something that causes that faulty condition to be met. When
debugging, your goal is not to simply remove that line. Your goal is to
find out what caused the faulty condition, and fix that.

If all you do is eliminate the signal that there is an error, you are
just "papering over" instead of addressing the actual issue.


>   usb: gadget: dummy_hcd: replace symbolic permissions (S_IRUGO) with
>     octal (0444)
>   usb: gadget: dummy_hcd: use 'unsigned int' instead of bare 'unsigned'
>   usb: gadget: dummy_hcd: fix block comments, blank lines and function
>     braces

As we discussed, you can break your patches into something more focused
on one type of fix. For example, one patch could be to just remove code
and put in a more meaningful comment. Another patch could be removing
unnecessary spaces.

>   usb: gadget: dummy_hcd: merge multi-line quoted strings into one line
>   usb: gadget: dummy_hcd: use sizeof(*ptr) instead of sizeof *ptr
>   usb: gadget: dummy_hcd: remove unnecessary 'else' after return

Also, some things like your changing of the "else if" are things that
you do not need to change. Some of the knowledge of what to change and
what to ignore will come with experience. For that particular one, most
developers are used to seeing "else if".

>   usb: gadget: dummy_hcd: fix miscellaneous coding style warnings
> 
>  drivers/usb/gadget/udc/dummy_hcd.c | 139 ++++++++++++++---------------
>  1 file changed, 67 insertions(+), 72 deletions(-)
> 

Overall, my recommendation for you is to reduce the amount you are
trying to tackle at once. You can work over a longer period of time on
the file. Not everything needs to be accepted all at once.

Also, feel free to continue reaching out on discord. I just wrote here
to closer tie my feedback to particular patches.

Good attempt at submitting your first patch series, and don't get
discouraged. Getting feedback is a part of the process.

Thanks,
David Hunter



