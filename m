Return-Path: <linux-usb+bounces-19553-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D32A17AE9
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 11:00:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 116721881CFE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 10:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A1A1F0E2C;
	Tue, 21 Jan 2025 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="D3640H/t"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743B41E7C1C
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737453591; cv=none; b=C0Qh9UxOrtrsj0P60e8D2bD6N2LicJIUtEL3mcrQ9BMvu6wcRM6xHLT7S91nZk1m8oIVSBcBosn+cnd3/UknEfawuC5dVci6cn0BM0Uqg3c/I5BJx6CPOrrVbQ23IFz9X7DKtq/QtnlAjqv/GZqrKzjy8klQfEeUh2VMoQFp0FU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737453591; c=relaxed/simple;
	bh=Tq6Kc9ck77Rmeb34qVgNL53GEmmxyuSYDvRcFIJAUXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M1NPHhIo8Jm8An4R94kefPV6zD9RyDHUjrsSc5mWiI19e07zkimTtelUOzXCPUWhzXb2powhowySlzxsLEQsQs/XQ5EHD3bRXa9PsBrPdfmlOqn05MclnXtLwU9t8u2vyzc9FYIsHqGvBtq6RdKO9ajLjJ4f8wIad5cVvTi1858=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=D3640H/t; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d3d479b1e6so8060257a12.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 01:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737453588; x=1738058388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CxizKwXLPt253QGt7e/f/qZ5dmeGax9KtzPaKUOb0x8=;
        b=D3640H/t/iHp1cjK6Q5G7p6qzd9EM1qbpAyHLPiLZZSX+S4Z0waO9YcslgcUvHv8SZ
         yfhDAL5OBc+cbYKL8YkWF243ndHpnWzs6KyQ4lCqFgbk2z3a5NKUDC7YkD/y3DkOhyFH
         9WXvMWEpcLNGfGBeMsEKuCD2kURPmgkdiTnZWonE4WJo/rkgjikQqW/z+4MdPdbw7l5G
         VhZK8Df1XmrqsHRWiLA00Vi+ipSaokhvz5nBcWjPhbO6nyOC7IJFUIb3wQ2FLwzuXecW
         z2iobyx2BslTh3JYQAXRiugGXizKsPgoX+O6OoemYvNItpfdTTDDlVmYNx0Jn0sm06XM
         /NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737453588; x=1738058388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CxizKwXLPt253QGt7e/f/qZ5dmeGax9KtzPaKUOb0x8=;
        b=ATWP5y1/lAjLvB1dQ1T53Sa/Q8lKoQQ3flVUTnwoRv1r/XJAsnl5fiplwCGFYvJ52q
         EWz4omfu8r2ant/91uuSp3Ldmgo2BKV7I5aePPtDBLjkd5PAGqQfLrIO759qFOnZN0PF
         Q9THfrxhfprolT0AeTOhLHk37UuCSaaaoFPp2tLGVF6ydsd01PhuRSEBgnxAB2+v4YHn
         xi6iRj8w4r3Mf5G4Ue1O77qQL0nERqjSioVRuOlaXZuU/pQTU4FLLWgk5AVZpan344P7
         6b8maUD52A8um27zICg8Zhwtc5sbdT1qf3S7jOzb1AVVyST8VqLnKnheQ2DuuAvMCPSI
         RjAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCRFEf7A/brdF7/2q1Nmr777oRJOHc7VBuxbMcIdHFdBRpqCCyJo4dCaFnrKJPn8U6LWbhozFUJ3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNq5Ok/W5/fkRkcT2Ok68LMvkT4z+BCuxo5araZf2duWfI92Lq
	gG5N/1ulAxNxGscK7XrejFljErVNjC9je5/1XNyV1AHesrqocFmZzt5L2vXzF8I=
X-Gm-Gg: ASbGncsT2h2Ghm1HKs0FkPMmNnNejkoFz6ocQG4654q3KNN0/26Pes3k5pX112gDeqE
	izktYCg9/0ITN0+tuu74TleM4+g4VkpXS/LH+TRVwfcmGLsVIyFP3wJHSRN81WJT7a5iKixfHWV
	j5YPRZYjk3axyVpIQY7Bqnm6XsYDDtxWdrgNvWiQ3n4AHtbHCUBC8bAsN48zHsDrSvkMizhYfjk
	h1O0kNGh0/U61FWto8HqRTtSdYx9FqublhYhpfaXEtsqPukCBKH0Xeciob8ZGUblOH6I2V6X/0m
	cES7X5P5kF+mQh9rKzNKWFs+ViQcJz8Afhi/zw==
X-Google-Smtp-Source: AGHT+IEsZoq7t/ZQbOJiUR9gGGlTg3qCaYqmm6ZsPZFmi0d/VLkco5ePkVbSndbh/UYWndkJ91FZ+Q==
X-Received: by 2002:a05:6402:849:b0:5d9:857e:b259 with SMTP id 4fb4d7f45d1cf-5db7db2becemr34207441a12.31.1737453587732;
        Tue, 21 Jan 2025 01:59:47 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:9701:41e3:e368:740f:c4a0? ([2001:a61:137c:9701:41e3:e368:740f:c4a0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384d2d3dcsm722643366b.81.2025.01.21.01.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 01:59:47 -0800 (PST)
Message-ID: <a7df5090-ff71-44d9-83e3-442876522c74@suse.com>
Date: Tue, 21 Jan 2025 10:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] HID: pidff: Do not send effect envelope if it's
 empty
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 jikos@kernel.org, bentiss@kernel.org
Cc: anssi.hannula@gmail.com, linux-input@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.01.25 14:12, Tomasz Pakuła wrote:
> Envelope struct is always initialized, but the envelope itself is
> optional as described in USB PID Device class definition 1.0.
> 
> 5.1.1.1 Type Specific Block Offsets
> ...
> 4) Effects that do not use Condition Blocks use 1 Parameter Block and
> an *optional* Envelope Block.
> 
> Sending out "empty" envelope breaks force feedback on some devices with
> games that use SINE effect + offset to emulate constant force effect, as
> well as generally breaking Constant/Periodic effects. One of the affected
> brands is Moza Racing.

[..]
> @@ -261,10 +261,19 @@ static void pidff_set_envelope_report(struct pidff_device *pidff,
>   static int pidff_needs_set_envelope(struct ff_envelope *envelope,
>   				    struct ff_envelope *old)
>   {
> -	return envelope->attack_level != old->attack_level ||
> -	       envelope->fade_level != old->fade_level ||
> +	bool needs_new_envelope;
> +	needs_new_envelope = envelope->attack_level  != 0 ||
> +		             envelope->fade_level    != 0 ||
> +		             envelope->attack_length != 0 ||
> +		             envelope->fade_length   != 0;
> +
> +	if (!needs_new_envelope || !old)
> +		return needs_new_envelope;

I am afraid this is the most convoluted piece of boolean algebra I've seen
in a long time. In particular because it mixes things that do not belong together.

	Regards
		Oliver



