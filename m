Return-Path: <linux-usb+bounces-18618-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D47D79F5EB7
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 07:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ABBE11888E44
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 06:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 194291553A3;
	Wed, 18 Dec 2024 06:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aPQCKPti"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098C91531E2
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 06:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734504114; cv=none; b=Pb6UTxZHuR6mborsRLcFzZOmFeGFxIhv7h77m8LQSlfeNO1GJKm6QWOrxBm7TqcRcI3VQ7VSUz1UE/lhXP2poM25yfIBxtxVLt3xiD99HXGjRP+4XgBPGO7ZHrqdl7NzaXLgFYWwlQhFHCQqUQTf8KnQ87vF5ccXUUIoRSBnpEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734504114; c=relaxed/simple;
	bh=PVlwr8mfKRxXFbEbIMsHZRbnpRRYzZus4FuKjBjfWiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAgkyB5kpTcY60NrS7lZxgmrdOnyMzxPl7RoaUZRaYGuPQjkpeJL87SERDt00fVLXKJUXEAiWOtT3et1w0hLQc8zRAMUvGRwJnzKC3/V0UuFDr7eKI/fNmRgO2Te67wCHGyr/PvexJK++kJtO0j4n9VzVSmLL6wKCf5mjzzPZgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aPQCKPti; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4364a37a1d7so15690905e9.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 22:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734504111; x=1735108911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iTFIm6Olr5J0VYC+UWFbCw8PjPQxjA73Inj/173Aw1w=;
        b=aPQCKPtibH5Ms/cqfiQ40L1QRZABsat/JEHI43UxBZheLhO/vFCNH8rE0//w8KfLsr
         VOidCoF/boBx+zUc0L3kWYmBAxL5cFMsWRHGySOHYjHGz5iE2JWlffX1d+q9V2W+8aOM
         7ZuZX5p+yzlTND3aO9GD+ZP9P92NkapKSJkAN01+tcCwmb4tjpj1FDP2NN9cYDK1dNQg
         qkfeIcsniz8ntP30Pfv62zJ05gHVhVrGNn30K0ZuGZgj4shc9xaCF42v+pLZbf/h7Rvj
         EbiaG8sbYV9sTXndgLJGY66IrVOKYuihfHBHyC4/KgTUDUXpw8qAeOAlBWkwyK5lDGnl
         EDrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734504111; x=1735108911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iTFIm6Olr5J0VYC+UWFbCw8PjPQxjA73Inj/173Aw1w=;
        b=vwDHjH2mELwkBYT7ZajD+nllRmN38fuO1TEWJo+c7EN+ADnALjX0Q8LKiGi0aEx6ca
         qqKBQyBjpYfgnk5O6fV8n68qXWtmOXCLXCiMLM2kD4+/T2NWpygs654bgc5Ucuq9YbVu
         tLhYjSGdnlGVaJ5ZxHGAdw2AE+FRFv3E6QUhxcff09hujqh9swC+xoGGqrPgNvy5Iwdv
         yKJNJfivGIjLHxdxIPy9HK7BEeOGZ/eacdfV65hyvUwXDTcOkwr1gUsyxl11aoyfc05Z
         F0N0KFseZBA3zPcl0NhOdRn44wuKHQ35BfX9083qqH3radSc7fCXB1GHsry9reH1ryzp
         YZhA==
X-Forwarded-Encrypted: i=1; AJvYcCUlrZZOoKGisdKTRdi55nDHdFgbFED5mdRJuin5gSeVtAhYPlYgXgGZ60M899lBSsKslAmTkWnV/jI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr2gB3RXWdJtjM/8/YV+AcITRVDyN7l7oAH2mL/A0jlc1ngkn2
	z3Rqa2/7xnZfGP8kglF+r74UAq5dtowaV2TRD2wANffBlfgEml+K
X-Gm-Gg: ASbGncv6z2EsBibj+j85XKRzWIuFRGJzx0ePnI5FzrHOuDgeN7Ry3wyaA9RW1wgTuV3
	6tJFT4g/S7o4Ee63t/96GJUFIpDjonESYaqTh0aytsmmRx8/FRjKN1Rx8Xo2A4hsbPJiVOBOF0a
	NMHNQqPpveEZ1ld6uZls33EH919IsagI15dn/2OnW7KS1f6NORaJFfOa8YeeLAdS7jp3XlGVfTg
	AaihJOBJw7Waqv0WE3gpvmwI44Fk12At/rcYqB37kroJuqzj3cjzni7qE0/gPnsAelhhfpzK0c0
	JbWL5JpPA2I3XGLTRb4PT806GZ5K7JRn0A==
X-Google-Smtp-Source: AGHT+IHonuO7awA4hteGTtsewJt1mHgYO5to5LYOX4jan8U8oVt3jRsEStNJXMIwy74AxV8dP95E1w==
X-Received: by 2002:a05:600c:4588:b0:434:a19a:5965 with SMTP id 5b1f17b1804b1-436553456d2mr10704805e9.6.1734504110948;
        Tue, 17 Dec 2024 22:41:50 -0800 (PST)
Received: from ?IPV6:2001:b07:aac:705d:5605:668a:52f3:a096? ([2001:b07:aac:705d:5605:668a:52f3:a096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c801211dsm13061829f8f.17.2024.12.17.22.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 22:41:50 -0800 (PST)
Message-ID: <12af64d4-b9eb-480e-b6e9-9842d76901a4@gmail.com>
Date: Wed, 18 Dec 2024 07:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de,
 dan.carpenter@linaro.org, emanuele.ghidoli@toradex.com,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
 u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217163506.GA80703@francesco-nb>
 <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
 <20241218053120.7r4ytd6bqzcmsbcm@hippo>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20241218053120.7r4ytd6bqzcmsbcm@hippo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 18/12/2024 06:31, Xu Yang wrote:
> On Tue, Dec 17, 2024 at 09:29:36PM +0100, Emanuele Ghidoli wrote:
>>
>>
>> On 17/12/2024 17:35, Francesco Dolcini wrote:
>>> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
>>>> With edge irq support, the ALERT event may be missed currently. The reason
>>>> is that ALERT_MASK register is written before devm_request_threaded_irq().
>>>> If ALERT event happens in this time gap, it will be missed and ALERT line
>>>> will not recover to high level. However, we don't meet this issue with
>>>> level irq. To avoid the issue, this will set ALERT_MASK register after
>>>> devm_request_threaded_irq() return.
>>>>
>>>> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
>>>> Cc: stable@vger.kernel.org
>>>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
>>>
>>> I had an offline chat with a Emanuele (in Cc:) that worked on this a few
>>> weeks ago and he remember that he already tried a similar approach, but
>>> for some reason he did not work.
>>>
>>> He should be able to try this patch in a few days, but with the upcoming
>>> winter holidays he might not be super responsive.
>>>
>>> I wonder if we could wait a little before merging this to allow this
>>> testing to happen. Or maybe you can just test if this is working on your
>>> setup using edge interrupts (you would need to use only one TCPCI, for
>>> the test).
>>>
>>> Francesco
>>>
>>
>> Hi all,
>>
>> I was curious, so I tested the two patches. I can confirm that if both are applied, 
>> edge interrupts still work correctly.
>> However, with only the first patch applied, it does not work.
> 
> Yes. This is an expected results. So could this be regarded as a tested-by?
> I have tested edge irq before sending out the patches too.
> 
> Thanks,
> Xu Yang

Hello Xu,
I confirmed that the first patch introduces a regression, 
so I agree with Francesco and Dan about merging the two patches.

Anyway, I tested it.

Tested-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Regards,
Emanuele


