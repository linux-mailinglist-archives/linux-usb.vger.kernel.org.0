Return-Path: <linux-usb+bounces-22478-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DE177A790AA
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 16:06:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F26DC18885BB
	for <lists+linux-usb@lfdr.de>; Wed,  2 Apr 2025 14:03:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8D91482E8;
	Wed,  2 Apr 2025 14:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="REGOhUpg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1410D6F30F
	for <linux-usb@vger.kernel.org>; Wed,  2 Apr 2025 14:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602616; cv=none; b=TM8vulaQD56gi9KJ+S2SfbPtQdVkLBFA9QOoq9Qy9fq4FZ5rQ9MzhMn7didE0PpFpLzlamDnPR3NT1D6kaYK/vBC8CuMDJLbYVv/4YSX5tcwGvmNNe13DTWqm0V+HBWFnS0l6JisIlRQFCxhXOKRpInjdSQm1gErEpdD26sZkiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602616; c=relaxed/simple;
	bh=p+E6aRIoTwQI32jckTgHkej/dDZaSFWpIp60SQ4BkGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MppVDIecuH/W+YL85t8dJdTW6Z4zqFqZjGE+ZNRW5ugbIuk4RcJpiUBDWKdfOV5esEKzOhWTxEKGQWfihLuv5bWzANyhmoTvNXOKWFjrBL8wm1jFdAR58DQosaH4FY5l6ASS394oGXXKZePOE7mR5iDQTVdMCa3CnZIZ6leLKB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=REGOhUpg; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso64895775e9.1
        for <linux-usb@vger.kernel.org>; Wed, 02 Apr 2025 07:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743602612; x=1744207412; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=otX/2inErTT+4uBhLU4a2GvpOpfCgfdHhNcK5YzgIro=;
        b=REGOhUpgBVZVi4njmiESDHapmIa5dirzedYaooAuiCK6DMkoizMZqpZbhzZW49jxU7
         beXd160I1lxy9HA/kdZucOqI67L7mE+Vno1WZZAn1pZ1bO3SmJyRpjpvqOIvkQDHfLWU
         8XyMKrGpePuTip4dFICMPgOcDjNizXAYcdNnvVwD5m1ESOnMoIh7uDKMZWBmWIgZeCSl
         VeOLA+Njc0derAOiPfOtukODWyzZbLQG/+lar34ClRoJd6erceAqYIPzzgzDSN9vwpF7
         4MCoySvBRNX0dXBeJxjgD7j+uMx9riWbiaRINlZ1bkCcQlAmWqPosewizd3wDRm1A12Q
         t72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743602612; x=1744207412;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=otX/2inErTT+4uBhLU4a2GvpOpfCgfdHhNcK5YzgIro=;
        b=nxuOS1muwzhWWxpnECa5xdH1dIUaX/OO1/0SqTNgravx2fBcjNuhhcKHQyUWFWC+R5
         kqi9jaSuDA5r5pW95201DSZin8UfpN7kIWQTIbLxs+1DX1vZUPNuJ7GWMqNmXYxwjWRf
         BWb1NHpGjBIV74mZr0dzYaHpG7hlLlES8Yoea2x79ddOZPyme6OUHRRmmaAbH04y0CFQ
         eGGX0Adhj2CfGMb/3EX/j1Uw1z7mejSQal2HNqGcKlDkiOS+LbLEKKrplRBIDFP3EJcj
         3h8QVJrep+zQE1OdItd01na3rcBLXddxkVYpY7XInVFk1sJVxybd0ubMoeJE49tjcc+v
         fmIg==
X-Forwarded-Encrypted: i=1; AJvYcCXHh7/1/8SU2B56y3JvH598QiCFanWtm/VtLQhqovejB8uzKx7jHKrbvb7o+4zWu7lDVxgd8afCxTg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwV/xgCDuUSKJ9Cn2iFmeOuPU7wYr6ZeYUPbVA8TT6XgY8teyi9
	FC1oJhxS+Xresd8j5KUX4ETke4Ri84NGuXMcEwPGRSwMIsDbPAB4Z/NgHuz2JJ8=
X-Gm-Gg: ASbGncuxKLh9gkKx7GnzfnF9U38Wlzj1GW5RgB6KH4j7KS2Nj9YVJdU7s+gjxdwhH7D
	wp3IFElzOLuC6fs9f8gevx1QqPkLlDLaG7I3kD436S6iX/Po7roa52HncjrsJarF7zGVvG6JRDs
	TS1xG4b/PXt1OXOBEZSZbagU6yfxDI/Y1YzLaamFXFh+KYx/EATDASrRaPKNbsAxZ4AppdJK6db
	W6eBju5B+KEg/JqLln3215MAtcLrkc4P1HECHyLRcnIDZF4er/jrlc4ysxEbsEl7YXzIyxaphab
	L/CX/KL86Tu4Mat0qntr+5+NmvVfBd+qihu6vBN1lXRY4EQccoPzijN+4buier0eclyr6u6jrbC
	kAbNRBNQcEAf8ZQwD/w==
X-Google-Smtp-Source: AGHT+IGBrZBtJmal2tzHoUyOpBPblggaOQtEz7BwOvl8h3+yM+2JTGnq5ab5Ru5zSZrBn1zQAX4Fyw==
X-Received: by 2002:a05:6000:184e:b0:39c:12ce:8f4 with SMTP id ffacd0b85a97d-39c12ce0e08mr13010757f8f.18.1743602611986;
        Wed, 02 Apr 2025 07:03:31 -0700 (PDT)
Received: from [192.168.178.20] (ppp-212-114-229-10.dynamic.mnet-online.de. [212.114.229.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66a991sm16999462f8f.49.2025.04.02.07.03.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 07:03:31 -0700 (PDT)
Message-ID: <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
Date: Wed, 2 Apr 2025 16:01:16 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>, Oliver Neukum
 <oneukum@suse.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
 <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 02.04.25 13:57, Robert Hodaszi wrote:
> 
> 2025. 03. 31. 11:59 keltezéssel, Oliver Neukum írta:
>>
>>>      3. we should not set res_length to 0, otherwise  we get stuck again (actually, should we clear the "if (!desc->reslength)" in wdm_read(), since that's is no longer possible anymore?
>>
>> AFAICT it can happen if two threads are racing on wdm_read()
>>
> I'm not seeing how could we get stuck. I think, with the patch I sent previously, we can just simply remove reslength as is, as it is no longer used. Nothing sets it to 0 anymore, as in that case, the setter gets skipped, and the only consumer is wdm_read(), where, it is only checking for 0.

Hi,

I see what you mean, but I am afraid this introduces an error case.

Suppose we have the following scenario with your patch applied:

wdm_in_callback() gets a ZLP -> we schedule service_interrupt_work()
service_interrupt_work() calls service_outstanding_interrupt()
service_outstanding_interrupt() decrements resp_count to zero
service_interrupt_work() sets WDM_READ and wakes the waiting task

wdm_read() is woken up and finds an empty buffer
If reslength == 0 all is well and it returns -EAGAIN to user space
If reslength != 0 it will return EOF

We must not return EOF.
Hence the longer I think about it it seems to me that

1. reslength is necessary
2. You must set reslength to 0 whenever you get a ZLP

	Regards
		Oliver



