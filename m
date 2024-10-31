Return-Path: <linux-usb+bounces-16919-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3589B85DD
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 23:04:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD9651C22BFF
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 22:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40EDF1CCEFE;
	Thu, 31 Oct 2024 22:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="buOoRY7i"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220FE1BF311
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 22:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730412240; cv=none; b=UAlir2VHoWdx2D97x4TOF3lofGfZYDICqn1LEQfhezJ0kYtNoHW1Q1wH2NvdcAVPClZT2+Kd5RdslHtCqS/JrFRRUi0G82Zd44XeLG4zzo5eloVllNMUAxOD/7IDRSBLLBz/OmJi7S2YJ+lZE5XMESCPvFyeWkuFf5AkmfzNZpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730412240; c=relaxed/simple;
	bh=RlnC+jIT+pIZZSYgWJHNBbdQgRaVfmA5gz9ipVTZMY0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cb3LQywhTaOJKLYjkftMIlrVDTPb5+RWd0FkGafqBT+4LD4CMhKZAKJU1ZUnB/EF32I49aLRVO3TRYrF8GorkcQ5OYd1OhAMtlU5oAHQIqAeaKKawkq4dyQb9jeuh6+Qfm+3Lb3GXANzwjRiBL2cBTPAnU2fyI5rBbWXH38+amQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=buOoRY7i; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a5e0a3ac48so5402635ab.1
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 15:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730412234; x=1731017034; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JPpa3E0EuBESUXm3i5ddPSocuBWBZkWkGnjzV+3dikY=;
        b=buOoRY7itz4+OEBtsGpRJdnlwvTi8owp1t+W6qUrkHanx5WIrQDbLw+kvDAHKQvxUu
         ghLTpyT8mm30T6olmhUUB4JnAz/UU/rebnF3rfyDQtnpBoxesTQFgKXwuOrS0eGBEPZf
         Y0b66n2zX7fFY4+LpJovBVt1eGUwJors7LkO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730412234; x=1731017034;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JPpa3E0EuBESUXm3i5ddPSocuBWBZkWkGnjzV+3dikY=;
        b=ul+dKCY66odM00SciM1zPUGgkB5a9wujzEZIGcJRil2yi8ICY2PRPI6jh+IMwoyJSf
         1aKoZjGm0c7HA+CKIYPO+obAwXUfZ1BdfzlehdnIzJXDJ1nEvWmVqLs7BfrQE29itSjk
         S0SBPJXL2fY5zjyIRTBmChNUPA7q4DrIZN+91V4PMTL9D/ab97LxVFUjyauBqkfMdM2n
         Th2doiheeX0PDQl3wjU4njcSUHSVldbL2LnyHSS91UGDL5s8pM8lRptiMI+54ghpLd5R
         FYqno9fPkMhTzqjhk3W4e+hUgb+Oln81TGXPsvVkvfBpa9Y530QgS3tgJqUEoQLjSCH8
         8oPw==
X-Gm-Message-State: AOJu0Yw7yjK2t30FQVl/jk8C6lxC3FbyPqXH/MWWOYxbxo9AtStnX/29
	6oxAeYYkzRMPrEhM54+SmUQ0a5IFdaf2GMdpsyHQivsbDCj97XeDjCPnMi21kUo=
X-Google-Smtp-Source: AGHT+IFq39Dp1WRI8hVA+dBsmiNZMgRGgtLb+UOFh3nyZ1kIEoKdmrg6WyBSB7p0NBNaYHeryoYexg==
X-Received: by 2002:a05:6e02:1d11:b0:3a0:bd91:3842 with SMTP id e9e14a558f8ab-3a6b0393b63mr17878175ab.24.1730412234142;
        Thu, 31 Oct 2024 15:03:54 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de049a45adsm465289173.148.2024.10.31.15.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 15:03:53 -0700 (PDT)
Message-ID: <2ff5424f-7fb0-4e67-a521-e309c870f229@linuxfoundation.org>
Date: Thu, 31 Oct 2024 16:03:52 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb:core: Remove unused parameter struct usb_hcd *hcd in
 usb_hcd_unlink_urb_from_ep
To: lizhe <sensor1010@163.com>, gregkh@linuxfoundation.org,
 linus.walleij@linaro.org, stern@rowland.harvard.edu, ok@artecdesign.ee,
 mathias.nyman@intel.com, b-liu@ti.com, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, niko.mauno@vaisala.com, dvyukov@google.com,
 andreyknvl@gmail.com, tj@kernel.org, viro@zeniv.linux.org.uk,
 christophe.jaillet@wanadoo.fr, stanley_chang@realtek.com, sylv@sylv.io,
 lee@kernel.org, colin.i.king@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241027163130.5368-1-sensor1010@163.com>
 <e31ef46a-ebaa-4040-9e56-b83afb414683@linuxfoundation.org>
 <2692e3ef.b806.192d8f95cf3.Coremail.sensor1010@163.com>
 <663beaef-6e02-4a8c-b380-247050f8936e@linuxfoundation.org>
 <5e2b7e82.b980.192dd9ab0fc.Coremail.sensor1010@163.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <5e2b7e82.b980.192dd9ab0fc.Coremail.sensor1010@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/30/24 07:25, lizhe wrote:
> 
> Hi， Shuah Khan
> 
> 
> *This sounds like this change isn't required? *
> 
> **not, hcd in usb_hcd_unlink_urb_from_ep() is a redundant operation, although the cost of a single instance is minimal, the cumulative cost can be significant,
> 
> such as when copying a large file to a USB drive.

I am not convinced this change helps. I would rather keep
the hcd argument to keep the api balanced and be able to
debug a problem that requires the hcd to urb association.

What are the performance numbers you are seeing with and
without your patch when copying a large file to a USB drive?

> 
> *Right. Can you quantify the overhead?*
> 
> Quantifying it is merely to illustrate the benefits it brings
> 
> because removing it has no drawbacks, the benefits of removing HCD are obvious,
> 

There are drawbacks as pointed out in the above paragraph.
The benefits of removing HCD are not obvious to me. Maybe
you can provide them by answering the performance numbers
with and without your patch when copying a large file to a
USB drive keeping all other variables the same.

thanks,
-- Shuah

