Return-Path: <linux-usb+bounces-38235-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI8xAHpUHWqnYwkAu9opvQ
	(envelope-from <linux-usb+bounces-38235-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 11:44:26 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0576E61CAFC
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 11:44:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4712C301286D
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 09:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A34C3939B0;
	Mon,  1 Jun 2026 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI1xqxQG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CBE392C42
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306469; cv=none; b=rQfI+WX9X/czZktMnHNo5BaaB96DjjTpG6ftjHAmWT94zpcNr31ro49fogEhfyoPKdssZt8nkcyMzPyPM7cpZ0yZXRHySCzcGxybf0cFLp//l598fJpkRMQ3dqizemdyFq91dX0H7US+UfnoLT4n/GypTYzSXLlmZTeasxZcRhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306469; c=relaxed/simple;
	bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mAJ1FUJ2/tm0V2ADLqz9KCl2OarTSep6KqP4uIk5YcqqyCvcMF2ISouX30XQ9MOpVLn4RWe26yMZeMUgrDBc9tE42fF5mEo3nBTK+ykD8Ay7511KTcqLLOK7phruF0cwdEwmbnWWI75srQI6DcZzPpGgNMXYnRWyY+xvCFfAEgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI1xqxQG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so75155895e9.0
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 02:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780306465; x=1780911265; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
        b=BI1xqxQG2rCVE4+QKaTAHNJtl6o16XxNDM2+JAeKHEwHbuM/4JZA9MurfHqU2IF99L
         EUlet3gKOxqSo55XJmBfAOlgWIFvtpbTRvODDLmGT+dD33wsGQWZo0U8Ma6/VCAyOe14
         KdJAL7QsXAZv4Gcj8DvgXgEQOIUpc5uBpnzeQo+UTdSIEnoJ27Uid4b6lrPr6jikpfsn
         pl2L8RK8y5AoqdvCGwdJZG4/5qdbVHBLjs3qxIkZs0Z6fjGvh9FROgLIyEr+LMwk2+3C
         4eoKEDnqe+uHTIxWbRkg43OBHwkJhI729SE91m9xTIl5Pm16MHxwtxpuf9l/l8COhYFg
         Pkww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306465; x=1780911265;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoKxu7sdvXYOQg4JuegHpjnjGnSj/skENgH900Vm1GA=;
        b=rPmZ7Knp6gq9b2NUkerrj31ZlkqMsJ3AqA+WO8/uP/SrTJJhN3OhBSFfNHym4ShQ42
         hxfThJzi6kdr7yFULZur4J9/YeIszhsghXOYAHTLndann4UVfWFKgX1jf6AjV5QaMBe8
         id8IT14/7/YRLCROBvw/O8WcgxIP6pWK9LIvQd+Sn+IkvTxXFHMfYB23qzt3kVwLUml+
         L/DiHh8QAGfaUh5nSHcBD5N8bI9Oj6O5iFA1urQ+eCNLrGat2CgftMJM9nPIro3nIdxN
         x83+/gcGlScRuQvsuDG5Vg+ykVwhg+GDHxr4qZVgrEifYmhbELtAz2P2EjKliuxRsCZj
         JHaQ==
X-Forwarded-Encrypted: i=1; AFNElJ+YH8UBTTBBa8WB0ORM+UoIXlIRXxed2FTMHZoRBMvYvOm9QY27fO0H2Jx1hnmu36Xpq/8wfFqFSjA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUqp5WC1Pr5RX5r6U7Ek35lIVqJGgUkv0uL0zDIyX5hJQgqE8J
	BdANFMMHZ1uco8p4JUZ3/cyvhR10CihzX8bVCylLvGWhAPLyRnnnVkil
X-Gm-Gg: Acq92OHP5am3PzwL7HNvOZmfrVwsW4dE9J9lK2V4WkQW7hf7VCe6JjH7EKIRI2qaPQs
	A9mpkhcn2+cnscp33uNswrQuSYXfMNlixhoyfcXW6+SxmXC62L4iI/znRKTMlLcwHLjGiHcu+u9
	L5GsYC3CT448WUkFup2d09M2MQWvuT2Rk7rvzbeWMsdio5axMT6Mcryg+bGMtE1MuOHwa46XXH5
	fVhdO7pjOcoUl9BODntMk6fjmRTqwWFhjxj1inWYkltnvMwOejhNBF2Liz7e8R6/sc50BQOJCQh
	73K6YqI+PkeMutk2GiKjJFPEg+Gwm9iR8uHG8RG1eFDxFZzwXYUrkCzIAeHdNKVUwZxwdax+mPV
	PYnbQXCTJwam96JhXetBskdY54mXQXvx1drv7bAJWYPRxaZm8Scpeap0f1ltNyp5lUA9O8HRzrq
	LPwKcuRAf3A942iIoGntMlcgeUTkOTBJGt15Ky8KrpLGvuMixKAzs=
X-Received: by 2002:a05:600c:8a0a:10b0:490:48b7:c1ff with SMTP id 5b1f17b1804b1-490a2941d89mr136512435e9.17.1780306464763;
        Mon, 01 Jun 2026 02:34:24 -0700 (PDT)
Received: from ?IPV6:2001:67c:1562:8007::aac:4898? ([2001:67c:1562:8007::aac:4898])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c053029sm72992385e9.0.2026.06.01.02.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:34:24 -0700 (PDT)
Message-ID: <c4ff641a-266b-4115-8beb-993cbb2f09ec@gmail.com>
Date: Mon, 1 Jun 2026 17:34:10 +0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs/zh_CN: usb: refine translated wording and
 formatting
To: Kefan Bai <baikefan@leap-io-kernel.com>, linux-usb@vger.kernel.org,
 si.yanteng@linux.dev, gregkh@linuxfoundation.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 doubled@leap-io-kernel.com, alexs@kernel.org
References: <20260601033945.555210-1-baikefan@leap-io-kernel.com>
 <20260601082652.650303-1-baikefan@leap-io-kernel.com>
From: Alex Shi <seakeel@gmail.com>
Content-Language: en-US
In-Reply-To: <20260601082652.650303-1-baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-38235-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[seakeel@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,leap-io-kernel.com:email]
X-Rspamd-Queue-Id: 0576E61CAFC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

LGTM.

Thanks!

On 2026/6/1 16:26, Kefan Bai wrote:
> Refine the zh_CN USB translations for clarity and consistency.
>
> Improve wording, wrapping, and formatting across the translated
> USB documents.
>
> Link:https://lore.kernel.org/r/2026053149-flaky-shallow-2460@gregkh
> Suggested-by: Alex Shi<seakeel@gmail.com>
> Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> ---
> v4:


