Return-Path: <linux-usb+bounces-34628-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KRuDbr8sWkAHwAAu9opvQ
	(envelope-from <linux-usb+bounces-34628-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:37:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9525126B62C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D4BF308F813
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:37:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 322D13A75B5;
	Wed, 11 Mar 2026 23:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ps+yJ8fB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F89F377028
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773272237; cv=none; b=ukBY8IuVumMGTWZCgNu9NBolJFr0HZJKJ5yVSncpfDuIL4IWvDlOqSFhIR9/LgcNkrUq9yvuzHyNmzBcTXWuljDlbN4NIljNlaMeZe7FcCn8dQgo7eB7Lqapn0dTwPWh14jZ0lVjIVTG7G2hA7lk22wpM80h8eahlDjYxin3Grg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773272237; c=relaxed/simple;
	bh=2eupapEfQNeHkUYEMcdS3p7DAYeAm6TzkamnfJ7DyWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJBFy3Okzl99ycr5t7/P4/hel0dTgg9Wf3tGai4AwVgSUMNoBN1nIUhzKXuRLmKXNs+uMhpRhzTmyCCPnEeIjXingLBmjdZyAiiVIGqynKeduPcvRlBwf4/lx4RkPVisn9OZBAGOuqZbNpaYkAyCWibEgUOrB+m6hZlCOjBnl6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ps+yJ8fB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso2952935e9.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:37:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773272234; x=1773877034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xz4JhHpkfUtvuhugX98hnbwV87DiIdMI+Eh59bG8IRE=;
        b=ps+yJ8fBp1nhZE28AcPJ6JyWkKdM4ixkKfpfWFfJN7bCO30rQt9aA+BjJlTRyg2SXi
         6lkNXP0qShkkMuZlW5O1e3Xzxu2qx7iEG+twb5wIXgQFLz+vBB8nfBVArFa0IoqSEHvc
         fuzmYeM4CnD3Dt16EolAIdqiYnk56T4MGK0UpTmJZZbA3t+urUTuCA/Fpq4FDoKPCAU+
         piNBGPtdLhQ7cK9xP82tzZ8M2qBqXNVD1/KlPIkjQvsKjPDVQjeddErHce2qpBfpY+dn
         jhsO4VZ1yOOq1j51XdftPUKOZ3MEkZhdpczwa8BMVcCfeWV3gYmJCrmCWfST8nkzrAef
         BYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773272234; x=1773877034;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xz4JhHpkfUtvuhugX98hnbwV87DiIdMI+Eh59bG8IRE=;
        b=cZH4Y/itGkzp665GLkdSpID1YNd8zbEfaHN6MAtzoHp8VQICYJ7umLrAaJkJ1AFM1S
         kAze+w8uyxXzBzbXge7bHURIpRQuGhJ7leAfPEz73Axnazf1iHD7SHv3m9e/vIkHiH7g
         L76PO/gaDGmS29hdmcezfYbW5dFfvJmdrq358A1ZMXiJdIRhw6JGLcBIfjahyKPSQiFJ
         a8J3KK4GZzDRfpC91Nd6SYXx9NSY9kjkT66BF1jjySyuvRReHo4Pb1T3FmYUeC/QFYPW
         EIPzjpb7PUvrWHWGUvU1bLwZ5uB0+Jj5yowq7rU+rTQyJJFq4eQqCIf0fwyF6//5VhR0
         F7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOGTWbQntUFvdR1CHXhtX6QhDcqVk7dQgIMyus6Yd5WG0YIlIMXvBaJJO/s9ycUfnT88YKOHz0OUk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxAnlhhHwUOzLP5tC5X0jRRlz1k1JuEfPBX+BFV0WUZn3ldK1z
	z6hstrNePnzkgLyzHfzMsgXptKTpsudndA1R/I+JWf8Mu4LJCkJTQIZNJwWRmKC0VbM=
X-Gm-Gg: ATEYQzzkA0oDFNRwJmbv4Jl3UtfMIAt5Hv4sTfTL6NUQrUQhMFGbR0bU4rCERBLdQFK
	CG0Fftc3gM7x8XprPXMMaXmZkq5SFF9cboE9fLyUf0UI96GImCAr9hLx8B7em6PesZDPmTfSD0t
	7KqnLnm4aGEvqVN5PCnxTUHxnD3Vk50YLLKF6RoSLR80vCq0S57KLKifTFgTwLRxoc0Kz1v0UN0
	MUw768v+xoVDk1ijotlV6Bst9oCMobWGXRNtTJFDCgrzDUYQvxkr6o/VglWRfQiun8R2NTFqMSF
	UeHE9HwS2qfW/JZOTCPl2AT3yJFc5io3ex+Wvd6Wu9BD1wzI/z2a0UGzOOceFODj6VbA5kDE0W+
	fMPrHaGtDCnIGXch31/NvcYDZGUMb59oT4b0vSn03SpsF3xGHuG+jGjVyWqykhOCjidvTBsDmiI
	OpxCjUoHkoWKV9z8vBjBo5jsf/Q4mAJxJ6zg==
X-Received: by 2002:a05:600c:6085:b0:485:3d9f:5510 with SMTP id 5b1f17b1804b1-4854b10a1f5mr74417745e9.19.1773272233921;
        Wed, 11 Mar 2026 16:37:13 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a737csm2657859f8f.10.2026.03.11.16.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:37:13 -0700 (PDT)
Message-ID: <223e0295-1819-4234-90d9-7db440f25be3@linaro.org>
Date: Wed, 11 Mar 2026 23:37:11 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] usb: typec: qcom-pmic-typec: simplify allocation
To: Rosen Penev <rosenp@gmail.com>, linux-usb@vger.kernel.org
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:QUALCOMM TYPEC PORT MANAGER DRIVER"
 <linux-arm-msm@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260311232347.18257-1-rosenp@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260311232347.18257-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	TAGGED_FROM(0.00)[bounces-34628-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9525126B62C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/03/2026 23:23, Rosen Penev wrote:
> Change kzalloc + kcalloc to just kzalloc with a flexible array member.
> 
> Add __counted_by for extra runtime analysis when requested.
> 
> Move counting assignment immediately after allocation as required by
> __counted_by.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Hi Rosen.

Thanks for your patch.

I have the same feedback as Greg gave you previously on this.

Each line-item in your log should really be its own patch i.e. v3 should 
be three patches

[PATCH v3 1/3] Change kzalloc + kcalloc to just kzalloc with a flexible 
array member.

[PATCH v3 2/3] Add __counted_by for extra runtime analysis when requested.

[PATCH v3 3/3] Move counting assignment immediately after allocation as 
required by __counted_by.

Or something pretty close to that.

There are several reasons for that

1. Bisectability
    The ability to more easily bisect patches.

2. Logical separation
    If a change deserves its own line-item in a patch
    then that change almost certainly deserves its own patch.

3. Mixing stuff up in a big patch is confusing
    I look at a commit log and see lots of things going on in one go.
    I as a reviewer or say someone tracking -stable and deciding which
    patches to pull into my tree can't look at a patch a "just know" what
    it is doing.

So v3 should please

- Have a cover letter
- Contain three patches one for each logical change

Oh and reason 4 is the most important !

Patch count bragging rights !

---
bod

