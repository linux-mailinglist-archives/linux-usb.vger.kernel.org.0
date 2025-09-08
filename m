Return-Path: <linux-usb+bounces-27698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB79B487AC
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 10:58:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E5983B5757
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 08:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A6872ECD3F;
	Mon,  8 Sep 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b0DkwHX2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9C21F8EEC
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 08:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757321920; cv=none; b=QMNT3ZQkPTToT3PrgN/ENZVxUX853T6rqF8MObM+KOZ7iggEk8mXoQcdyvOuJakHrW7txMMiF8bdg+x0NC6JnNGWPqv4UsPE78/5+Uk6m+oe4kINAxdHTn07qIveMmSNzpCFRDvKg0q4Nv98nSRBE0LuBpzVdbNYVcZU0Jfx+vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757321920; c=relaxed/simple;
	bh=hXMqYZB+dzFdO3jGjqJYJjjQZ3ufPz/qF0Ix6++QEmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJsNs+QZI8wOOxxkJBqs0dTnoucOn+6xA7jofOLhq9q/RPE3Pesjp/ZVDIGTBKvTHvyvNaAf51Mcu5yTmqijLju3hhdRRGdbrhYJTKaMkd2wGaXGI6IAo6xkNY2L5zqsFzPbY0t+aWTxMv0WSY/GgRptDAm1ol2ISauoOzxDYSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b0DkwHX2; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45cb5492350so26102635e9.1
        for <linux-usb@vger.kernel.org>; Mon, 08 Sep 2025 01:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1757321917; x=1757926717; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A0jq9k6S1X/e5F9Xchbc7rGyj3NJPtYlYz8J30jdCq0=;
        b=b0DkwHX2psakjnW+vI0A6KQMvmeJcPq49SOBb1OaGJsX3/BDbg5Ros+CYb0eO+xIFl
         NYF9pd5Hp+T5eKHUpqkEMjP32ooF6hxPaewF/9iz3CObhT+qObXmxgs8e2sKPmrC2Ila
         /tcs4FZHuD0nWsS3eaZdgflfRSSMu1nduZ/lLgJk1Z1l8uXWpHdAPt8MiqzAUuHA1MnE
         ZULSTbCSoY0h9+2rtF+L1ZgRO6OpOO5JqET5W3vvGWDUpWuWeJlLj6hDouXrk6gl66kk
         HJNqCmxeMVqrzMOWPUl3ySrPERsXL9L/4lw83g2LR4D5Zx2O5BqXmqfgd/LWHJiQ65Mv
         glPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757321917; x=1757926717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A0jq9k6S1X/e5F9Xchbc7rGyj3NJPtYlYz8J30jdCq0=;
        b=UhDIr5g27P47rCt8k/2MfVBFlHtjpDwfRvqQzWL/qDmdOTe6Oy4pNoiZgCg66Qblik
         jErMj/Z4zkIKhXOp5tZHBZBJLbToZwisA7PVB1bfcT3PZvI0WieEH1lfgJjPKkqNAfuw
         ZwXaT0jlzl6uZNIC6nuzc9GBJKc8g/6xWsU7IR4I7nazoVJujnUMqwC/9GKuDCavHNUR
         a7//R/XCC27s3b1ApdL6sdYIi7kuWnCKvwvByt4Yf4gNUzVwTsd8OJb6/pwsSdKKVtMp
         aTYr/DqwB48xeE7o8cm584ngRqpPEkJidBJZPvVb9mN+/qyPj7dxroOZPab61p4DTebR
         9oXg==
X-Gm-Message-State: AOJu0YwIgwMpnd+YAEvXBJS21Ax9jRvfSlKm8rO8ewGwlzejoQADeugC
	GQ9zUwB662Jb1YqcrDUr1SjIyWpDJwE6EE67o1o0JyCD3OnxA4XM0YKnlqUv0AXKPz8=
X-Gm-Gg: ASbGncuTijrEIHizy1gaa8/aZBXd2FrIvBmDeqcc1MOZyr7t1Ssyajl7shhJhc5IQlj
	tFHJTDWS3SWY4a4ZK3X70l8myqmcuy28zY5p5ld917ZOxHrWI0jyUiJP+Rmjs2TLGrbRP2k6HPw
	jjrgh7/TyRkWxCO4sFQYkU9Kjp6FJ9+6MET/GBF0mM5TI0dZAWgGxrSdZYTZQUGHIZ2QrQOiubD
	m6CPkrb0PpD2YVM4KYeoGBgb/Pn10KJ+A6MjWrIs+PaRp4YjAZHNd1TS72dQUzYjnfZXpI2iRRp
	BDLPwtRV+w2nulm8q04Wcx7TIwG7JkbknwJahsb/KZLOXvdceDhefOuv2gLYfJUcuVnlh0N5rLS
	zoiVLlZxgFAyHpuDlwcFAMuGSmjvmDu/KYZvEsZl/db7veEGxeKDL5S82KwBSUxaJJOeti4DsEA
	RX
X-Google-Smtp-Source: AGHT+IFwnKSywr3YUucpMr3gpELSM4ZF5bkk2uEvqsnnRBInVJnpPYYORFNWuYxFNMxf8Ye8kouDJw==
X-Received: by 2002:a05:600c:3b83:b0:45d:e326:96fb with SMTP id 5b1f17b1804b1-45de3269948mr45255075e9.30.1757321916984;
        Mon, 08 Sep 2025 01:58:36 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ec:c301:8f4b:c388:33a0:9bc1? ([2001:a61:13ec:c301:8f4b:c388:33a0:9bc1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dd05d0c43sm91396815e9.2.2025.09.08.01.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Sep 2025 01:58:36 -0700 (PDT)
Message-ID: <fb8c0ad4-0626-4d03-a7f9-a03629566b99@suse.com>
Date: Mon, 8 Sep 2025 10:58:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: notify unrecognized usb device
To: Greg KH <gregkh@linuxfoundation.org>,
 Akshay Gujar <Akshay.Gujar@harman.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 naveen.v@harman.com, sankarkumar.krishnasamy@harman.com
References: <2025022131-silo-impeach-3f24@gregkh>
 <20250826165244.22283-1-Akshay.Gujar@harman.com>
 <2025090610-donation-sprawl-f6f7@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2025090610-donation-sprawl-f6f7@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 9/6/25 14:28, Greg KH wrote:
> That's a very big difference.  Enumeration failures happen all the time
> due to horrible cables and other hardware issues.  If you are now going
> to flood userspace with this information, it better be ready to handle
> it and do something with it.
> 
> But, for an enumeration failure, you can't do anything with it, so why
> report it at all?

that is probably not true. For once you can try another cable in many cases.
Currently we'd log this information. That is a worse way to handle this kind
of failure.
If there is an unrecoverable IO error, user space ought to be notified.
Syslog is not the best way to do so. There ought to be a standardized way
of doing this. However, this makes me say that this issue is not really
confined to USB. Other hotpluggable busses have the same issue.

	Regards
		Oliver


