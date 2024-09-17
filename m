Return-Path: <linux-usb+bounces-15176-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440F97B0A7
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 15:17:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F7E228378A
	for <lists+linux-usb@lfdr.de>; Tue, 17 Sep 2024 13:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F016B1741C6;
	Tue, 17 Sep 2024 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PA2zPht6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE9227442
	for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726579049; cv=none; b=MS6yt3BHQkL1shnNL39Z32BrSh6soUsCLGjK5FE5WjSrplqfDXoZgnKYKO23XMZHG2JsVMZDmDP5Do373+Z/V75nrP/PHXNixwbr1/sTjGGkNTwg5X+2xx0ucZA9H0HlCtVwNi+TN/ZoZs+r2IqYW95XN3hdpRSLguYSnN4i/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726579049; c=relaxed/simple;
	bh=JV+Z7tJW/jScZunkCk3Xq1v1i3Bpk2ewWr8LssnADUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mP6fmtVJODAfcQwbqU8zDlpi5H57GUEa7ou7a9E07NNEuQ+smlOoDW5PlVVRnkjfgob1kQp383MumhCwkhy84nlTqyFCck9H3Hm0iye5iWUmypnl22ll7RgBA1oaLfCWYBzvAi0brTJUousgpOPeOJOu2rBZJnupDKhZ9iH0LJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PA2zPht6; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-374c1120a32so3822580f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2024 06:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726579046; x=1727183846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TQHADIzE/cTC02zvTR6h6NYt8OyzLzbjd1IrJBpXV+I=;
        b=PA2zPht6/9O/Qj12q6STdkCG9yQdn0EFJzLTw0Gpp0fKjYBCZqorPID/duElXpUDN9
         O2NI2me1HeGb0ihrbGYX+lsth0YB+4wtxM9Fd03dM7yHDUtk8QlPuYxqMi0t/bki23fr
         pHylKrVv7zrPg83iTM13VrjNnCQhRKXwB9hcICvXacJU8fdY8+sTjaerIr74bzoihcDs
         ckRFekNoHLAlBQ/0vbPmO0L72vWyARm75mndjv3aK4vDPzYW0C6vn2to+yurvVGUJCvD
         pOgBZM1TJUn/Ev4mfmD61IqSsZssx6KNSZ3qdtQG0ABObVQzbNdFbA92mgcYHWW1dirn
         F+3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726579046; x=1727183846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQHADIzE/cTC02zvTR6h6NYt8OyzLzbjd1IrJBpXV+I=;
        b=BDCZrq1SWfFXgcedOWfFHm8AzRnNMEaX+9yJlwyRczH2NiOL4PHqxJ4Rk8OICrRpjP
         PR9v6WnE54h7WSFpIWcdytz3PYHq4jW56pybpqgLZtDqwfkN2ipi/Ve8OalduO49vio/
         kvO0mahPo2m17l8FMBrShuij5rGxG3UaNrxeGgKcl6BKl5aWvKslh/GjM4lF5w3F/tXw
         bX26lvgM3akXURD+Vx5XJYIF7zJ83BUGKhOI90wh+mKPEfryrovKVBJQFwx3n5nsYVJ/
         6Rd0QlxnKSoKAB9VL6wh3Yy6WQeKqjD49uIhgO7pGwbbJCVF0FW3LV+kUnlC0Tf9ArUN
         elCw==
X-Forwarded-Encrypted: i=1; AJvYcCWBGWVCdQqUfK4x3zieMHsPS7Sfey7Eu38RBKzgx/ZqrVySmHQUOgSrukoJB7XLx9F4nvM3pxUiKUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+5QC6HmUN1BwIsNHjkDBuqx34k8tNH9hIQcfy4N9KIeXjLR0v
	Bp4uFtMtHcuWjbcM/GBymWsRb0UOiT+PIJORUsl49pB3oR9KwoNe5aDFgRXdGFE=
X-Google-Smtp-Source: AGHT+IEKfuYw0ignUGezpYcL7SUmk+4lYS++Y/1Yu+xdXH32HtECwh8759pw7xUTtKV4DVchA7c1ag==
X-Received: by 2002:adf:eb81:0:b0:371:8cc1:2024 with SMTP id ffacd0b85a97d-378c285dbbcmr9662317f8f.0.1726579045357;
        Tue, 17 Sep 2024 06:17:25 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ed:c201:b884:edfc:abaf:1cf4? ([2001:a61:13ed:c201:b884:edfc:abaf:1cf4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e780551esm9681266f8f.101.2024.09.17.06.17.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Sep 2024 06:17:25 -0700 (PDT)
Message-ID: <d88289f9-e22a-4960-9b3b-ad0b3ab17a89@suse.com>
Date: Tue, 17 Sep 2024 15:17:23 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: use mutex_lock in iowarrior_read()
To: Jeongjun Park <aha310510@gmail.com>, Oliver Neukum <oneukum@suse.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, colin.i.king@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240916040629.28750-1-aha310510@gmail.com>
 <2024091648-excusable-unfilled-83de@gregkh>
 <15bc0f3a-5433-43e0-b0b0-8b9c26dec165@suse.com>
 <CAO9qdTHrbG-aWetpM_e7zHUhrwPD=7uCHPbWSMoorgnwjKEOmA@mail.gmail.com>
 <bf971924-9d91-40a3-a4c2-5b518e2ce2fd@suse.com>
 <CAO9qdTHWfYv8u-gJqGkuG_OSdkU9c=qZSnEbE+zCYWG5bT6r+Q@mail.gmail.com>
 <c96e95c2-aa59-4ef0-b211-c1cea71519ea@suse.com>
 <CAO9qdTH_+syAOBXUYT61VZMovDJYjCD1b-Who16Aqj4BXq8GLA@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAO9qdTH_+syAOBXUYT61VZMovDJYjCD1b-Who16Aqj4BXq8GLA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.09.24 12:01, Jeongjun Park wrote:

> Okay, I understand. Then I think it would be appropriate to do
> the patch below to prevent blocking, but I have one question.
> 
> Currently, many misc usb drivers do not seem to handle the
> O_NONBLOCK flag when using mutex_lock. If this is really

Yes. The quality of many drivers could be improved.
Feel free to make patches. However, the lack of quality elsewhere
does not justify a regression. Hence code fixing drivers already
correctly supporting O_NONBLOCK must be correct in that regard.

> necessary code, I think it would require code modifications to
> other functions inside iowarrior and many misc usb drivers.
> 
> What do you think about this?

The formatting seems to be broken. In terms of content it is good.

	Regards
		Oliver

