Return-Path: <linux-usb+bounces-25010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F6AE3D14
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 12:45:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC14B3B6829
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 10:43:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4E7242927;
	Mon, 23 Jun 2025 10:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SP4IVVZG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589DC134AB
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 10:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750675215; cv=none; b=JIroO9Frusz3+EQG/XzW3P+vycfe9fjwY3cL7O58rNl6z4/E0s2gfloh1dGWI4Yh/mBsbGYfbvCuVtfzPXkb7g9HV5WX+83D0iRyQueA/wEP0OKvB2+g+9z+gQcZ1iQ7H/ACWlJsSNNyclY9L0tzljjCr2iQDXXfq+PJhRGNIIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750675215; c=relaxed/simple;
	bh=p9sVdzfjWDm4qYQyOyda+TEJgM0VUnsaPGos42tfy4k=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UNjVlFic9SXhSZKr04TEeqLf7a3lOoN08+2WXWSgzj0maznBKKAYwnEwwdVSmssK+JduJv04wgDz4q1wBuu/WgkI/J4hI+tNC6rH3abQh3m9bvSkeY6PBsXeIAuggfZ+RlSAr+tD/7f73dQlgYN149r2tC5+Ns+D9codDk3tFmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SP4IVVZG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-450ccda1a6eso34655675e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 03:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750675211; x=1751280011; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sbVRAFX8VYOvWM1Ofc3Zc/KTJL+ZF06sJJtfchAGE70=;
        b=SP4IVVZGNRB41dwqKo+hboMgJEn0zLHo59BPaCvOKXUfvmmuqrDrZpEV87hudAbEuk
         YtGRDEiP1txW79rtxsjPQ6kBHiYExvMZ2zJLy3uJX3E2rxUQkX51FvoXQPCFBKmtmUJl
         yDKy6y6wQXliHa2SeAB0t3apUCSD0E1g240sH727I7U1+l+bnOuCsNbpd9+ku5t5TEfF
         RHxNRUKF7TZzts0EONoQDdZC3QhyzNmOMB3yh6qxQa6vIgUhwEUT4TMxEpHlQjHL5xxv
         idHSulXCKfZQE6cw0pfUUfWm6sZnXLS7T50ynv09hyXgsjV4Ye23EbZ3iCwZodAS6Uke
         roaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750675211; x=1751280011;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sbVRAFX8VYOvWM1Ofc3Zc/KTJL+ZF06sJJtfchAGE70=;
        b=hdfeFxx54XjsGthMEts5ftbSaehEX6aIJt0Pnqlz2TlPrKPQg1pOq0eUA4FqWVNx1h
         7gNhsGg9JzNmlZkAYAoW8gYi3TtfA+kt+MgWKlKVAYNg+Hm/4q/juzYmFMZjYZ4Qpmtv
         ATfsk6Hl9kHgIKxVthBpBd59S4P1XNhTbCP6kW1QatjalzkzTMwAajYLaQJLtjk3Vqt5
         1V8H+J4Iv3MpnMusp+SzWTkRHVaCQfQMDCoGnhMs1r7/DsmLNcX8lDyoQP0G5RXL6zJx
         BEyKu6cNmwhpegfgraF0QsnmQGU+sMadQNmXobo74g0/s5RPqmR3ua7rkD++r7qL29l+
         pIyg==
X-Forwarded-Encrypted: i=1; AJvYcCXk0eVZTtdSsgP2OAJFWHL+sM7tNGxSHnRPku3vnDrp30+JRN7lmavRzrk1gv9WD5h8SD4fvc4i54o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5nigwuXp1d4mIWdjpQXkXAkO8C5Fkkec6GUM5GQCy41ugTgSm
	KVcO3PTD/U9lllKxTuEXW1N3kl8fqzlFlzTl46kcJTNLO/Amo5bgS8pew7umM3mXqdritnHYgCY
	eoxO0
X-Gm-Gg: ASbGncsdnq+oO1J451Vx8L9A3z3DFzF53BwQx/eK4RPX/TLMvGVvwQ8/AuV1QMPTix/
	nXjtXPgXXLKJvMnVkkejokxEKHkkWrQcj8gJKKPuZcZmc5sduek38NyoqbXtSrP3iXcQSCQKZFT
	E6ldhM6DCr2nnX2MLmY2ZQDuzx3+WtJwkHajnKjP6X29z7FIXU5zZUQN8Hp590gWsp+9KK4OotJ
	Qux7g71Y8zpt8ZiHerVqrijeOjmtK5wytinKRA6P3RfW+i0azY0lJJLZXlKBLLdNl3IiV4KI2ED
	hovBXU8AWbuhcAy7KC6fGw927EsoOXXe3uB32HbYgiyCgrkYdFb6rJ/e3uOtlvVLUuyrHeepEfg
	+B+IehS9wwhPZIEOpRrxxJQaosp5eTYv80E6aO60=
X-Google-Smtp-Source: AGHT+IHHtLY7dM+qJTBBBRmep1PlC0PsMC8zdIlNDFtIbuJtilM823dpRPvm6Sb8Mjq+VvIIIqlawA==
X-Received: by 2002:a05:600c:8b14:b0:453:a88:d509 with SMTP id 5b1f17b1804b1-453659ca92cmr131621145e9.10.1750675211535;
        Mon, 23 Jun 2025 03:40:11 -0700 (PDT)
Received: from ?IPV6:2001:a61:1376:6301:41a9:a5d4:30e1:2ed8? ([2001:a61:1376:6301:41a9:a5d4:30e1:2ed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535eac8e0asm139936525e9.23.2025.06.23.03.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 03:40:11 -0700 (PDT)
Message-ID: <1ea7d8a1-cc2f-44bc-a53e-31cfa3947577@suse.com>
Date: Mon, 23 Jun 2025 12:40:10 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
To: bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-220238-208809@https.bugzilla.kernel.org/>
 <bug-220238-208809-PhGLKJCyLu@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bug-220238-208809-PhGLKJCyLu@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23.06.25 12:03, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=220238
> 
> --- Comment #6 from Ryan Walker (fewspotty@protonmail.com) ---
> (In reply to Oliver Neukum from comment #3)
>> It is good that you have found a work around. But you were right. This is
>> supposed to work.
>>
>> Could you please post dmesg of working and non-working cases?
> 
> I emailed you the working state to you directly because it had a MAC address in
> it.
> 

Hi,

are you referring to SerialNumber?
You could set it to XXX and indicate that you've done so for privacy reasons
in the public report.

	Regards
		Oliver


