Return-Path: <linux-usb+bounces-28954-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA83CBBFEA0
	for <lists+linux-usb@lfdr.de>; Tue, 07 Oct 2025 03:16:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70E0D3B88DA
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 01:16:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990F534BA21;
	Tue,  7 Oct 2025 01:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ErQo/FqH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA5827707
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 01:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759799793; cv=none; b=Q3LeoqlatccP4m5SaHwddJn4IhKKwWQk/622Xdtaj8qXP4C0mkCarFs0dzJ8WyoCr679gApJyvgF/iBam/5gyC4oGzSo3dyuDCZgBT9omI92telBvANWPD7O2xv2CWFE0sX4vITVjTc/wCIX7jPsHL+ygI2i2aNhKVwcMX988iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759799793; c=relaxed/simple;
	bh=6X3DsoXCXLXwSW6LHDG0N+geOJvq7dJh0/ciZA8oLKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gJPIwP1Pk2ebUEtH97MCuyNzVVAPpyWuWW02cPkWf1nvQqbc2smYO09GS+imGTq9f5ExjU/wFxsnZAekHqquX2nirYHGoBNPbuE+isR8iYYkMSiij92//QxMNpgmVQVLvOFNOA1anN/sheUGMMDTQyCRcHzfQmIalLmUjmZFIog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ErQo/FqH; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-59d576379b9so2728614137.1
        for <linux-usb@vger.kernel.org>; Mon, 06 Oct 2025 18:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759799790; x=1760404590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ghdf9TZNa228GXUapeik3l8BFyhmMAug+7tiKuSEW3w=;
        b=ErQo/FqH7+i48DhJx3rzDqaiFbPUfikgFFMgJLsb+kFM1dHWp9NJIZSrNPs7U30gCd
         l+9UBegU66SnEd3r1eG0omCSCut5nbBSOohIJi00BEJsCh5DdRJVclbof2QHd/6qMlOa
         hwgnZH/Sa6LMIrIxeswE6+ZgTX5H6YOy4PMtrpBs42ujRG3BfsskZ2pb7MTFK38BYPTK
         X/s6/Rg+APgILxm6p/oRWjEczpC+wW1/46gNwvXHGs+UU9wVO14jFN/QrbW1eT1RjRu8
         eKsgIPSFzkW5o2i+XJf9MfQfZC9aS2cCpdLv89Nxfux/VpTfSEi2goMn7zfBT/lKnx6O
         +XiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759799790; x=1760404590;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ghdf9TZNa228GXUapeik3l8BFyhmMAug+7tiKuSEW3w=;
        b=Z9WJHYyaY8sI9LWUf6koWoqwrSbrBEK27KasZr9NLY8eOR9DmWqYe8s4FHkoAQV+L0
         Btquq4pB7gddQhs6/iuMgeip49e85LCsxNSibjgHb24LOQ/cw+bObqKw9u2Vp5qBQDCC
         ADlQmPYOecllIvtFrG5AAkmLqIgSvjoyD0Zs9DpcqsxwQOl5DYOgrF8H3RYxGeogUNSm
         eEyKFUHocJn33OEfFRepuI4fvMlkmz1Dggd5wcVKUcNUdLWT7kvx2xzNOBp0kJV4EJow
         kOrmBMDS3izcJuR8ZebQibEuN1x0V8ftKotLAFupPGidupK/79bZ5mZ9MdN3ObFhufNp
         Kjng==
X-Gm-Message-State: AOJu0YxUAKYakDS30xFBCeJJrjEA3ke+n3h/wXwuUJl9tQuJXhoZdXla
	RuX1XhbT4c6bH3b4noMNdXZ1wmAQIoc9ab4sKETVWj5J9fVVk5OrQplq
X-Gm-Gg: ASbGncseCV4k8e2P2kfpMzB29s2UWb496QHjaunyygesQzIIGeJ10NqL3BwdlNPm8M7
	xXiRkT58toUquR31VLw7q61j1wszl6rkCLrEatQMy5omwxc8FYNEj0/efl5vdG0IkT17VWNIlpu
	UL65CVtUPz3RupLy6XeJGVic6dUG0CpayMnsjqU2rJuSwvpoFt5auBnKSE3Fkn1dr+Oe5N+Wd0k
	X1MbOSNCvFCtxFZG5q4jKPcA1cB6pVx4ZhIRDK3JDO1yWaO+7gnR+5UjMff4J23PPlUNmqMBBUk
	Nv4oFV1k8B5BUc6rq2e00PhieDrwo0dz8SbHmjCormm4qB8l+cIFns2zf0nUEQtNeyD4dbhPgk5
	avvPuRWaQmMS1DrnWdklHib/1dK/2aUwM4iJGYnFX6W1Keqn+bev9sYUec6v436k=
X-Google-Smtp-Source: AGHT+IFQImR3Vj1kzGx2R+BGfWd215YKxySg4FhZPdn723hBKbycZMLDWwE88sLjbEEJGhlPaL5osg==
X-Received: by 2002:a05:6102:1606:b0:523:712d:44a1 with SMTP id ada2fe7eead31-5d41d10db13mr4412399137.19.1759799790449;
        Mon, 06 Oct 2025 18:16:30 -0700 (PDT)
Received: from [192.168.1.145] ([104.203.11.126])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5d5d39f1a2dsm435417137.15.2025.10.06.18.16.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 18:16:29 -0700 (PDT)
Message-ID: <8fea55a9-54f8-405b-9844-ee67b5e43ba3@gmail.com>
Date: Mon, 6 Oct 2025 21:16:26 -0400
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: serial: fix: trainling statements `break` should be
 on next line
To: vivekyadav1207731111@gmail.com, johan@kernel.org,
 gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
References: <20251004080123.98285-1-vivekyadav1207731111@gmail.com>
Content-Language: en-US
From: David Hunter <david.hunter.linux@gmail.com>
In-Reply-To: <20251004080123.98285-1-vivekyadav1207731111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/4/25 04:01, vivekyadav1207731111@gmail.com wrote:

> +		case 300:
> +		case 600:
> +		case 1200:
> +		case 2400:
> +		case 4800:
> +		case 9600:
> +		case 19200:
> +		case 38400:
> +		case 57600:
> +		case 115200:
> +			break;

It is generally considered best practice to use the breaks after each
case. Here is a good article on this:

https://lwn.net/Articles/794944/


Also, same here. no top-posting:

https://en.wikipedia.org/wiki/Posting_style#Interleaved_style

