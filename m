Return-Path: <linux-usb+bounces-7253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42786B453
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 17:12:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AF7B2844C1
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 16:12:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F17315DBD5;
	Wed, 28 Feb 2024 16:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BqQufdcG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E95F15D5D5
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136682; cv=none; b=r5JMVSJLOXiu8QKepXj1SH03sVjIOqjzLCy00JbeExySwhInxCzIe12LisaisertnLz6+MN1Jsmzi0Q6QQzjBwY3m/3B6ZG/pRkRP5psV22YeHagFO5YNK8dpM29fst9LI/pVtAAFPDmeBX9kawdi93u8rDjEcnmyXsRer2kGKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136682; c=relaxed/simple;
	bh=0/SXo7LUmEd3Ek4bAWDkgWgcqOozxVlfBaRmQBjkoGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYJIEwbaTFh/jufwVcKiqG2XBpFH6gutFse/IdCEVhP3GZmKBUabXFrLgARmgCJ+8jE/lJB2zBuGGCtJaieKCtMI+1xuPYLLFEue4tGTBRuRvVPRT8JfPCvXBSX5Py897LZiHmn4//VHKL4cK43IyFARaIDUsH7jiRDQ7zMPaXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BqQufdcG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-512bde3d197so5296201e87.0
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 08:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709136678; x=1709741478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jgP8egN9jzbqWUtue2PPYahrXFZRT/aZTCnQiSVag14=;
        b=BqQufdcG93NRMdtlmwIbirbO3IJPfo3SQexOsal13voIGqPi6mHJmRC3klyrLejE8Z
         BhTE9MKKi86w5Z9GyTkTCDVw2JdiotqLVpYXNLfdcGU8jFjbYn6FYhcYCCxpepKYn4+/
         ydHNCxEoj09Otd0IcAnbbtf856vJ6J7AN+UZdifABfOm5MCpSkXNwKqVCvKnK6rfQNPc
         0OYk/ntEe+G7AfWtxwf/JrwE70bM1Bw/H9JeBtZYmb5mtlQK8ZwHgqpzgr2d7I7+WKyr
         xk3/nwlidEGLWLGLxWO5i+Q+xE423NHcDiwhytDs0VctGULjDQWOAIqsyUMqWrd16Cqj
         Jbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136678; x=1709741478;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jgP8egN9jzbqWUtue2PPYahrXFZRT/aZTCnQiSVag14=;
        b=p8lsdC/L8j1OwnUCiSovDdE4RlCbuzCBPs2htLHgjoMK5BI0nz4LOvuH8XVdYEbNmf
         EFgdTd77HbnnjJdeqcluncYB2MV74jHd9wdcqJlMzflKd5vAajSV4arTjXGWF/xyGiVE
         nnWQlEV+EISAHpphp2impmZ/FiMQ+gymAHOfWuYkXImOGksvexkS33ow5au2FizOImwp
         BQ4otQQPjHq5GRvrvr2eq8UZknPTjnplm1tW8JuKh9gnLUfWCIitPgvOjM5CG0HO2YkY
         SzT3msKVlZPWqwBdXysQRufPUW2SDdHCdc4UhOfDvLZORh8ipOAsuCUKEIgrGjPNunF4
         KRCg==
X-Forwarded-Encrypted: i=1; AJvYcCV5xX7wucg9YvwKVl3ohJAsakxv4MZm7loOai5Q0GmLs1EXDyZ28KrTdSYgQ5d/c8ICLf1ngjKLCcv/TsyyDc6eEw8/D0XSLryt
X-Gm-Message-State: AOJu0Yx6CgfKlUGwPoNInZ7qixiE6y1AsF2dsR4rrNF1S/bs1dt8edxf
	2kt0+zz0VglvHGLiHFf5jd/xHaoNP6ByTIYHWCTNd0r6qbFieDCImcR0Cur60nY=
X-Google-Smtp-Source: AGHT+IG9pHQRYhPAl7gRn1uIw/tLwD3MS/O8eajbw9qNVQ3ZgXy9u/fSDDd8ADWubwAiIqrGVivLDQ==
X-Received: by 2002:a19:2d11:0:b0:513:174e:a152 with SMTP id k17-20020a192d11000000b00513174ea152mr104784lfj.29.1709136678541;
        Wed, 28 Feb 2024 08:11:18 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id w4-20020a5d4044000000b0033b7ce8b496sm14762361wrp.108.2024.02.28.08.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:11:18 -0800 (PST)
Message-ID: <4111f9ba-e1dc-4158-af6f-c048bcf8ccd2@suse.com>
Date: Wed, 28 Feb 2024 17:11:16 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: RIP on discard, JMicron USB adaptor
Content-Language: en-US
To: Alan Stern <stern@rowland.harvard.edu>, Keith Busch <kbusch@kernel.org>
Cc: Harald Dunkel <harald.dunkel@aixigo.com>, Jens Axboe <axboe@kernel.dk>,
 Bart Van Assche <bvanassche@acm.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-block@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org
References: <70bc51d7-c8a2-4b06-ab7a-e321d20db49a@aixigo.com>
 <62296d89-f7e6-4f54-add8-35b531dc657c@rowland.harvard.edu>
 <Zd9Xbz3L6JEvBHHT@kbusch-mbp>
 <76fcb1b1-cdf2-45d0-aeab-c712ee517b34@rowland.harvard.edu>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <76fcb1b1-cdf2-45d0-aeab-c712ee517b34@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.02.24 17:01, Alan Stern wrote:

>> In the code comments above the WARN, this condition indicates "the
>> discard granularity isn't set by buggy device driver". The block layer
>> needs this set if your driver also sets the max_discard_sectors limit.
> 
> The usb-storage and uas drivers do not set any of these; however, the
> SCSI sd driver does.  Maybe that's where the problem lies.  Adding more
> CC's.

Hi,

that seems to be conditional on READ_CAPACITY_16 being used.
 From the cropped dmesg we cannot tell. We need more.

	Regards
		Oliver


