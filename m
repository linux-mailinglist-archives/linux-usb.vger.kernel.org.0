Return-Path: <linux-usb+bounces-19558-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BABF4A17E4A
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 14:02:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAFD416AC81
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 13:02:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38A2F1F1308;
	Tue, 21 Jan 2025 13:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ffIn6tdp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71C1C1ADB
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 13:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464492; cv=none; b=d5RkAgNqY6LR6i3mRSob2xXH16YIwOWd3JKs6I0rFUOem1r1YjWLLbvs8t/IvVsqFdogxqgDuEYOpz3HhjvyRJ0Zrzv7qTUy5jZczPFol0VVKwP8jCfMyVqVlpMTYNKDBhl9b31T3T4Z8QzZ6uPpy1zNpo4XMTtSsN21BUIYyDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464492; c=relaxed/simple;
	bh=XtTMNWRYzzJoNUnwJpBhytF4+gRheNw3jBBPov064qs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFhRvj4Efv79kbvHFq2MDra84YzzwCHo/TctfLievB3yfKIoJorS6DYbNnINknqS9QYZdW27U9PaW+ICOtCsVh7o4JwHpJmQm3IfJftYnP/RHp/X+HnNFhe1bT72iIJNiIrPb5hCvUiFVLiP/ZmahWK9AVY5N2OUrXR1UlnUEKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ffIn6tdp; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-aaeec07b705so988196966b.2
        for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 05:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737464489; x=1738069289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPWz4Yl7KRN61v6lHNsL7cySBBZHRou3Cra8FCWrAnY=;
        b=ffIn6tdp/UJxADtHm/d77/uY9vC0iSz90fxdb+7ZWVzzc7cmHGmccfp/27+3bDTlDd
         6FrpYpUy6CIFuXF9LsDzZkrubVuaMC3z6uX25aXEqfUf+whpa2fpT8nA0pDYNZX5NmUl
         LOItXQYtyR2UauZ2kiH2Pcl7rCnZVWra/bCc29XKY0+OmhgHAtLcLWZ3DlR/q6w/CefF
         qXFjkaD/YrLolGKhgpX79k/Cqv7JoaKsg8COi1O2+fIJz1bgGvq6cx0FKG/OgK2Py8S1
         1AiaPi3SsjlXO50grWoRjzFFMo2bOcrfQis5+6X1hEXXO1qAxG/6UmpxPvxu0UJoaqUD
         f8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737464489; x=1738069289;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPWz4Yl7KRN61v6lHNsL7cySBBZHRou3Cra8FCWrAnY=;
        b=MBGl8sg3IbhIdWsEEW90YQpi+FIYaDnx8N6gDZBjqN0lPWKkhFolBaD7qr2l7PBC1B
         pNmV3ToZFg6mS4gY1bPRJMtuW9sylhtt+p0QZhgeOo0YHQhFUUJSnt9JJoy8CLCFV5U/
         rjJyh1YAcajaqTC1clCsRF2kWmuSCjT0RTXexPl254Ac5N4rg+YSbGcPilW+kCbVlLTF
         HvbR+yN8QkoQiz4CYROB4GzfHCej94lnStieJGgEoI79rdPgTCnDZyNv2YXiO7RBhrgH
         E/LmEzMvoZWrAi8qcDgexwYtJWw/gwvCqFzE1y1VDI4Q0RXEI/w7DQNvvEgazcIb3kkY
         wRBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBpr+YJsbL5rpDNnfypclUyG7DxGAhGMd3maxYpuk7U5w2l1I/itls7i1hKDDSuPTG+p6OSEBQRNI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy50TXxvrUaJCQCrRrG8Z1v81ejPl0Ea7GE00x4r65JH4EkwSUE
	dC6P1N/LJHvXQnohnisg7emMJpwI557oBc8FJaGoqn38SoYmfmaxN5jTYUtaK0o=
X-Gm-Gg: ASbGncush5lCSFmG0HUoUlciFtI3qfdxtJeggeCjCyB5Msx/7kf2q/tq/p2rEiEtAGQ
	sCG+p7/kFtd+/2S1Gj/S0hpvo8zUCvCYr/IuSEkGaZVvGIWEWSGwL9QB8sWDxyOtwyQZm33IzyD
	EEVPLjtYFBtDFAA30KATQIPCpDB6lKJp8ep7Q89dGxYxO91xU8JK+987RvgcF/UE9Tsoysd+e+G
	v9G+fWMx4+uIfaSuKt9MAbyVUaOV5fU6D9T0IPf9u7cxkQp4TbUSj5vdvM+p04BiuTq1uHuWpP1
	y7R6deFF8pqgqllxCFRlmPZwICf4duUQdRja2w==
X-Google-Smtp-Source: AGHT+IEgqIoFhhovR8cSbcyWaBSXjtwGfYEQYtvB9WjtCKLKxeLy8V0lGIQZR4pF6FL2xYD6W0GSPg==
X-Received: by 2002:a17:906:d54f:b0:aa6:1e9a:e45a with SMTP id a640c23a62f3a-ab38b3893c1mr1524496466b.46.1737464485318;
        Tue, 21 Jan 2025 05:01:25 -0800 (PST)
Received: from ?IPV6:2001:a61:137c:9701:41e3:e368:740f:c4a0? ([2001:a61:137c:9701:41e3:e368:740f:c4a0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f86e4bsm753077866b.145.2025.01.21.05.01.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jan 2025 05:01:24 -0800 (PST)
Message-ID: <88f81117-a7a5-417b-87d1-a443732c59bc@suse.com>
Date: Tue, 21 Jan 2025 14:01:22 +0100
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
 Oliver Neukum <oneukum@suse.com>
Cc: jikos@kernel.org, bentiss@kernel.org, anssi.hannula@gmail.com,
 linux-input@vger.kernel.org, linux-usb@vger.kernel.org, oleg@makarenk.ooo
References: <20250119131356.1006582-1-tomasz.pakula.oficjalny@gmail.com>
 <20250119131356.1006582-3-tomasz.pakula.oficjalny@gmail.com>
 <a7df5090-ff71-44d9-83e3-442876522c74@suse.com>
 <CAFqprmzt2+dngxVDEiLNmR1AmjU0d0AvsebrSz0Y9w23BJ+8Aw@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAFqprmzt2+dngxVDEiLNmR1AmjU0d0AvsebrSz0Y9w23BJ+8Aw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 21.01.25 11:17, Tomasz Pakuła wrote:
> On Tue, 21 Jan 2025 at 10:59, Oliver Neukum <oneukum@suse.com> wrote:
>> I am afraid this is the most convoluted piece of boolean algebra I've seen
>> in a long time. In particular because it mixes things that do not belong together.
> 
> Could you elaborate on that? What here does not belong?

Hi,

> 
> I think the diff is a bit unfortunate and doesn't make it justice, but
> this is based on
> code that was already there. Instead of just checking if the new
> values differ from
> old values, we first check if any values are different from 0. If
> neither are != 0 OR
> the effect didn't contain an envelope previously (NULL here), we
> return the value
> of the check.

Indeed. And that is the problem.
You could see the evaluation to contain either two or three main cases.

First view:

A - everything is 0. We return false.
B - we compare the old and the new and return the comparison. With a subcase
of no old old values existing.

In the first view you are mixing the test for no old values of the second case
with the test for no old values existing.

Or you split up the second condition into two independent cases.


[..]
> 
>          if (!needs_new_envelope || !old)
>                  return needs_new_envelope;

This boolean statement stems from a common result, not from a common
logical reason for acting so. This is clear because if the first half
is true, you are returning itself.

This statement would be so much more clear as:

if (!needs_new_envelope)
	return false;

if (!old)
	return needs_new_envelope;

	Regards
		Oliver



