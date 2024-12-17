Return-Path: <linux-usb+bounces-18598-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A98D9F57BD
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 21:29:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7144516F067
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2024 20:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5238E18DF62;
	Tue, 17 Dec 2024 20:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1zH3Pi5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF5A31F9426
	for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 20:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734467383; cv=none; b=gdlNVNui2sXipBag6QVSSG3iUK4h7pbEsbHa7DRG01F3twaKhn9Q3H191JrCdtmHapBVJ8+UtK4y37iOGlPQrxnuca26sUKr8bV9fu8m1UevyRGQNHs3w2Mzoc6pCMGL5gYtkjZQjJZqCerhWfruqhtrDP2tbTNxif7cDfL1gUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734467383; c=relaxed/simple;
	bh=wjtVSp5e/gtP2bPB0gVaig8Ytq2WZDbCWtlVs+teKRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eU3+ykNdRtJ7/yECIhqq026w/ylf29c+NSbXvKBpg/giIGGKBxn3LLwNv50mlS5krAMW4/VT49+YIPE3PEWOTOTuHQmxXxM+WRWG7dfuE3QdYk59Vo4JAqxNwoQxQGmI9RuWS8oelcSK3UFKmMIErNDzMcVhzIG3kNK3q/uNqf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1zH3Pi5; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3862a921123so4315211f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 12:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734467379; x=1735072179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=riuJ6VXEH1r2xq2adD8Hh5Js5iv32b824b2rOzdDs1o=;
        b=m1zH3Pi53cox3tfNL9HcV53BLx2yR2Lg7SzOAVlCf2YmjsMVv7OG+3vMrbCCgSe0t4
         De/81QFevkVI51CkfUZa+mOKaJxJ/3TNqsdvGHCy4ABGaUmt8d75XEyiOnj0ATjdnR7t
         H9Oxg11IIyO3FYvUXSCnWRhV0mnKzjQ5RY2vQ7T29u+EzzfOEp0AHgWF4Ddbmk1IBhlU
         JkVGzGecI0j7qFQLxyH4ye+hUBXrYz0nFatIHEjGWDcPYqN5nYkSDfrUtjIw2/erlhVn
         H3CqF5e1zHe26eGzsY2SuQRtRzJZ1+wz9HbvZ4eYoITRxMiv7VL4YecX7ZMpYgT09UxU
         9BMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734467379; x=1735072179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=riuJ6VXEH1r2xq2adD8Hh5Js5iv32b824b2rOzdDs1o=;
        b=NeO+bckWV6mpFTxL+sA607t0y4oyJ0xtBzhDVrKMJRvJ15Ua0WOrsq9yTVnhX31OHW
         JV+ty8PqaREfz47DO5W5JmcsT9tCcQN6kNkSHDNZDruDqgLLGiaHUd3ZHbDPywV/G61i
         zQkMuRpd4he6hzhUChNBCOTfevCzRHHRVp/X/cbzsiDkqLg6TRWBuIo7MeFHbDpnMGGA
         bl+J96gqSZlYtc5oczQwmnBgr+PXuTmZFC3g7g6kDx1sx5ntWEbqRVjB7n/SA3EbsDCp
         tK0l6v8X6VozOy9IVyKMu/Lj+eiLLWlWEDeCDIsStqUIJ6RtcJYk8CqnK+WpVG0NRL/r
         cfZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUtl1lQHDCBCu/kLUSOve7Ja/OZeR577PZHF9VqOKB5cC3c9+ELCQbI6OZnQFkAlyFBk0YoViovNyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6ArAEc9pV6Dw1iqLBwADIri7cY2LyjzXA+RgV49/0tg3OJD/
	Obmgh8spUNGHCaqUzBKn+B8WelKAfdyX8u3oGRJR3iDkqAiZtUw1g4ts38qPCkM=
X-Gm-Gg: ASbGncullXY9G4DqsK4b0o10N4cdqhkUJRaE7jrgeYvISK4RtNs9DnkOuN7uoMmR5Y5
	RLkFbAu+dApE7u/vE/7BVONkLksBlfhB6F8UfyS26EqWFZ82WrC27QxSEBbc850F/PwvFPcFrf7
	qMJOXjCmkM01FQjR49nM76swBB9xaK+fiyzxsp7tLLOJN3KepoRnW/nNXFUZiK6lkDthpNGUJuG
	eGPViv0WVL54fWajBXepehU+zeS5p4F37VXHdkXWcYbIl4CoOB7eG7ML5CW+s8wDeFGeIM1Xchd
	CVuXd4NTZSw8kdjgSsEoJr211hVtYKQXFg==
X-Google-Smtp-Source: AGHT+IH/Wtjlwcy/lm0MF5OCpgkb7cKII6hjVT2qz0bgw5fzVp/w5I5vtqsgR9DhW8S+zU/HcCbehQ==
X-Received: by 2002:a5d:6d09:0:b0:387:8604:5023 with SMTP id ffacd0b85a97d-388e4d8edf2mr206319f8f.44.1734467378883;
        Tue, 17 Dec 2024 12:29:38 -0800 (PST)
Received: from ?IPV6:2001:b07:aac:705d:5605:668a:52f3:a096? ([2001:b07:aac:705d:5605:668a:52f3:a096])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8016bdfsm12153714f8f.43.2024.12.17.12.29.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 12:29:38 -0800 (PST)
Message-ID: <b378e1ab-5699-4369-8fed-fa6973d5aed7@gmail.com>
Date: Tue, 17 Dec 2024 21:29:36 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] usb: typec: tcpci: set ALERT_MASK register after
 devm_request_threaded_irq()
To: Francesco Dolcini <francesco@dolcini.it>, Xu Yang <xu.yang_2@nxp.com>
Cc: heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
 andre.draszik@linaro.org, rdbabiera@google.com, m.felsch@pengutronix.de,
 dan.carpenter@linaro.org, emanuele.ghidoli@toradex.com,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com,
 u.kleine-koenig@baylibre.com, linux-usb@vger.kernel.org,
 imx@lists.linux.dev, jun.li@nxp.com
References: <20241217091208.2416971-1-xu.yang_2@nxp.com>
 <20241217091208.2416971-2-xu.yang_2@nxp.com>
 <20241217163506.GA80703@francesco-nb>
Content-Language: en-US
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
In-Reply-To: <20241217163506.GA80703@francesco-nb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 17/12/2024 17:35, Francesco Dolcini wrote:
> On Tue, Dec 17, 2024 at 05:12:08PM +0800, Xu Yang wrote:
>> With edge irq support, the ALERT event may be missed currently. The reason
>> is that ALERT_MASK register is written before devm_request_threaded_irq().
>> If ALERT event happens in this time gap, it will be missed and ALERT line
>> will not recover to high level. However, we don't meet this issue with
>> level irq. To avoid the issue, this will set ALERT_MASK register after
>> devm_request_threaded_irq() return.
>>
>> Fixes: 77e85107a771 ("usb: typec: tcpci: support edge irq")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> I had an offline chat with a Emanuele (in Cc:) that worked on this a few
> weeks ago and he remember that he already tried a similar approach, but
> for some reason he did not work.
> 
> He should be able to try this patch in a few days, but with the upcoming
> winter holidays he might not be super responsive.
> 
> I wonder if we could wait a little before merging this to allow this
> testing to happen. Or maybe you can just test if this is working on your
> setup using edge interrupts (you would need to use only one TCPCI, for
> the test).
> 
> Francesco
> 

Hi all,

I was curious, so I tested the two patches. I can confirm that if both are applied, 
edge interrupts still work correctly.
However, with only the first patch applied, it does not work.

I hope this helps.

Emanuele

