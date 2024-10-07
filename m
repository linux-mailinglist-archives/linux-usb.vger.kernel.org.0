Return-Path: <linux-usb+bounces-15795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD38992706
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 10:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA6EB28345C
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2024 08:33:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB16714C5B5;
	Mon,  7 Oct 2024 08:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AP2LM94h"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9432A17C20F
	for <linux-usb@vger.kernel.org>; Mon,  7 Oct 2024 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728289987; cv=none; b=MC+LbIo0Gccaeo+7LEK4o8LlcW5TbIBaZEy8/xZRfRmrNTTlNbvVyjElUEjdS+1CREBA53+Oj17hzRnwnzdkF2JQ5x7/3HiQPmjcaBOs6W4BhjCDqqfNgsJdLXFvEdli+GgaAA6AoiUQNW3ge0LIy9+0DRNfDVrtNqhWUgWmKq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728289987; c=relaxed/simple;
	bh=18ln3AkPpXxOueGiphqU58hpgurOq46/s78jX+YfOok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lUV1u41BFPEH0oVX+L04hUqPzJ59AF9gTN9tZ0Q1yZgz0TYMtf+GjEA1dcNtCJDKUyaNC4brTnYxWp9bjqD6dkEuPIhC2QIkly+bxdHj3SyMniAGuM0yjo5qDpbAy+655To2EnIa0lW2o3VXAG1sYnP2gQ/wkAy6x3jprTDOPfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AP2LM94h; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42cb9a0c300so37338635e9.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Oct 2024 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728289984; x=1728894784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e3kVrBuosVag079TQqmY6M4yqw2SaRiaqR56WKG9S0I=;
        b=AP2LM94hgcatGo9fXVhoi9pSvyPuld2cXop5EYhASApJYQbVQXU5gn4V68BM63VVzV
         pp7E6+pJlOAv2OVm6f2KIJfyzLnkPP0p8TSMbbq6mExHP6dogY5/yTozkyQ8bYhHs0xp
         9nWfCy+wpXqV/CBfFbXvytIfmXhtrZ7ZwqesKgOjwEFLK1oTnOuFDYWh/GDF+23rNXKw
         TBRWyTJMGwIqjM0UKVUZCOQa+R6CqtuoopBZKjHmhtgzzVBFss7XjN5AFBGFBQmF3v/E
         N3LJxYDiwIdH1pLz8eOsBKfVVTzO6Toc0QZJxRedH0WvKIfrkAaeNXvuw29s2XhcgxrQ
         ziRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728289984; x=1728894784;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e3kVrBuosVag079TQqmY6M4yqw2SaRiaqR56WKG9S0I=;
        b=FJi+KLB+Y+V9/ZZXUzm6Cyv6rfuuR5v+n2nL7Ofbb/oNkmHfuhFT5oJuGQpx5nKGnI
         3sGj81nVhEUrMUHwyCBYxqGvf+4J7BKeZXmoc8NRjIODk/xmcMXEnzDQmTsxeEXPeS6M
         lgWNU5bYXOzvHP3leV/Wrtg4f37IvA9EBqpDE2Qf1RQG8ekbuXrlMac0tX6Ga3MAclH9
         lhBbiefusV+eS0ENrlY4pat2cyk44NYPQssMo7o3g0NQlblIdomyXWEraXQ4vGzoGBhh
         8M2PIzmtOxWfI+okTZJj7PUu+8wmsv5aJCv374csTTC9mHmd8Bvj4kQgYKi0Jyaqdl0e
         xbCg==
X-Forwarded-Encrypted: i=1; AJvYcCW3T9qIMvMQxCRci47M29aiouuMsa5E/1LrwyEdDzn69g0rYANgSl48C00pHJwsyxnGq30v+qfaadE=@vger.kernel.org
X-Gm-Message-State: AOJu0YysmuCVfp8vFi7txyiOJLHpEAo2IEJUAH9En99anrqm6SyeQ9iy
	fNWxihI9aQEtbyx6+wbCs2uc/eX/jhasSiCmJQ/qDTOYFx0RPTGsvF6Kymjcg54=
X-Google-Smtp-Source: AGHT+IEr5VSQs86vHVixG05gNcXB950uoClEW+Uj+1kun8mU16AfkZpd0hRsx/adqhPslkyXgfbeVQ==
X-Received: by 2002:a05:600c:3b86:b0:42c:c401:6d67 with SMTP id 5b1f17b1804b1-42f85aa6e6dmr66769565e9.6.1728289983969;
        Mon, 07 Oct 2024 01:33:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:1370:2201:dbf:8c7d:e87d:3baf? ([2001:a61:1370:2201:dbf:8c7d:e87d:3baf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f89e85778sm68235275e9.2.2024.10.07.01.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 01:33:03 -0700 (PDT)
Message-ID: <8a754920-2813-4674-863d-7c1bc1b83660@suse.com>
Date: Mon, 7 Oct 2024 10:33:03 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: chaoskey: fail open after removal
To: Greg KH <gregkh@linuxfoundation.org>, Oliver Neukum <oneukum@suse.com>
Cc: keithp@keithp.com, stable@vger.kernel.org, linux-usb@vger.kernel.org,
 syzbot+422188bce66e76020e55@syzkaller.appspotmail.com
References: <20241002132201.552578-1-oneukum@suse.com>
 <2024100408-cedar-debug-5b28@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2024100408-cedar-debug-5b28@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.10.24 15:17, Greg KH wrote:
  
> I'll take this, but really, the driver should not care about how many
> times it is opened.  That change can happen later, I'll try to dig up
> the device I have for this driver so that I can test it out...

Hi,

I agree. I'll send a patch for you to test.

	Regards
		Oliver


