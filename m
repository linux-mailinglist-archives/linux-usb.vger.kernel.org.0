Return-Path: <linux-usb+bounces-28828-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 250BCBAF187
	for <lists+linux-usb@lfdr.de>; Wed, 01 Oct 2025 06:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DAB212A1065
	for <lists+linux-usb@lfdr.de>; Wed,  1 Oct 2025 04:37:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8DD12D73BD;
	Wed,  1 Oct 2025 04:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cvrd7fu8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB70123C8C5
	for <linux-usb@vger.kernel.org>; Wed,  1 Oct 2025 04:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759293450; cv=none; b=AK0H+I/0f0yPyU50jrgE0Eey+53j+OBMO1P/khsq7qCxHUkE0RShTMsNVnkTxGQ76lRHiOlzwUHyDrrx3OZ9hdqBhEUh3VAmPYmv4zYyY1XMycvHAtoOy2lY/1sDMyisQUa9Pa8KiU7pYWxjijbWZ0clXgf3P9Cg6KCyptn64I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759293450; c=relaxed/simple;
	bh=dCaRnTDskwqEI8sV8rq+5asgm+ypdm2aisI3BH6Ws4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gynJZ9qVQmi86gP4rI954w5WqP+zibdQlgLMYkxzdN3iQWEgMfVEVvHP+F+UQL0MPCRrRHsuLb45T5ICiVt6fjQWkdOfDZhZ0anWsZoKnqOW3duVK8fx2w9oTtSx4bIKKnW9/DrHkY9yUTbBSuNLTWDqlfVa69XBl/4vHZOtO9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cvrd7fu8; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b5f2c1a7e48so499076a12.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Sep 2025 21:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759293448; x=1759898248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MPq6uQImOLbVbQ5YyRJgD3fiIsAq1mSu/jIrrDsClYI=;
        b=Cvrd7fu8b7mqS5IM3RUXwPXn7V9QtEHTglZJ3IixPd9nveV3KsMjd5nD/VXJWTRfrx
         78Mv76BDDawn0HsLm9vznnZZY3xBdQnawgz7PYtc3VNbJmtBOynCdRVbdsNsQyvyJQnI
         1AjMXTXGB43A98GJmdiNw/0bM2Pv9V8itAg4JEv0r1VlMQGjuSclL69aIGweMVteX8n5
         ZoheVGieAXabYH2/kfDMVctZWUdqXY5Sa7E6f/0MynjHhzO9/C38gmibkN/qc/AUvX5n
         RbEIMl2j1CGosDyEiv7SMW0W6pAb+5ros9QnSxSzZJLOUVWO+y6h3fDQ66VldH0kh9NO
         5r1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759293448; x=1759898248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPq6uQImOLbVbQ5YyRJgD3fiIsAq1mSu/jIrrDsClYI=;
        b=K9OCpfDOn7N+Z+66voOUgGMdlxDBJJzkoDMdI5QdLiGxhvu2Cm8gD8cnLpMXny/9M4
         16+jG2SCbK6XNnkz4WXXtgXaMW4WJpFZjMldtdwG1MoH7CQFShb4/c8eXqceVe574ke1
         C9NH6KzomzVK4KamtfJNqclOVhksk57Cer5GK3b3ZJohQpebWDt1O69zA4NbQCVm+jck
         cX3DOY+cJkO7N/xe+66WWrznFV2+LUAxTW49Fy15KRkyw/hU9IRC6g4dVscbHHKP65Pm
         M9YCkF8Jl76kRLfK7nCGN8zm/XsNAdb+uWRufOuy1kNcLeWJ8ofC4zY9Be9w+ST1Qx1W
         axmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDxTxOwbZ57yjie7g9kN9NLNgB9qIBrG68sGD+ND8Lr4OcZvurpH1P05OjBAPFz3W6XRk50jhz+2E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsqCGDKcQI6vgKaclXlPMByn+KP44B6xOxlNv7Ywuehf+aU55e
	ykxMBSmxBptgeqAdUVyRe5FRHnr4GGBGkcVzZSUeqYqgBe0DYrnGbrXO
X-Gm-Gg: ASbGncvwE00EJiC5/iNICUGIc19UcW2BaM6OTKYN5m28wRSofXu9vJXXmGjm5vhtXx3
	g3zQQ8iDWCbIa3N45TXqa706viR6fKiJob5UzhHCMNv5NF6qaDHk+CR7efZcrE08KlZ1CiM8qnA
	w5piLrOfTzWJ8F4Chn2x2ByL0tP/Z/senahN/jiTy99mgD3fS0tptkAo3H7crEiz7IZXt75Ohi5
	xjd8IkvB3G9YSxZ67YUcWXq28uw3aTpyeYrx62Up+pCj3+Q0PnPD7mi8pu/zk/n65X4zVXa2roC
	6pKCBqNetsd58R1iiBipjIXLihCuAU94kRlAqfQ8RMhK+7to1w4HoQwPnU0Q2oDX8EVzyJaNJYN
	0AgWbfjLlYI0Uz1MOY7VvMD5KCP3JMfwUm9C/Qh3H8kkCW1L0OC8tc066H+FifQeK/3869Q==
X-Google-Smtp-Source: AGHT+IFmNzfgvEEahVwLkACMZNqW0KUgxiZlN4x/uBqreI8OJr+lyeHZmUQ14H4cjQuSd5m1Lge6CA==
X-Received: by 2002:a17:902:f546:b0:264:70e9:dcb1 with SMTP id d9443c01a7336-28e7f440582mr28584725ad.56.1759293448001;
        Tue, 30 Sep 2025 21:37:28 -0700 (PDT)
Received: from [10.0.2.15] ([157.50.97.83])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6882210sm173000665ad.79.2025.09.30.21.37.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Sep 2025 21:37:27 -0700 (PDT)
Message-ID: <5f936182-6a69-4d9a-9cec-96ec93aab82a@gmail.com>
Date: Wed, 1 Oct 2025 10:07:21 +0530
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: Fix lost EEPROM read timeout
 error(-ETIMEDOUT) in lan78xx_read_raw_eeprom
To: Jakub Kicinski <kuba@kernel.org>
Cc: Thangaraj.S@microchip.com, Rengarajan.S@microchip.com,
 UNGLinuxDriver@microchip.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, o.rempel@pengutronix.de,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+62ec8226f01cb4ca19d9@syzkaller.appspotmail.com
References: <20250930084902.19062-1-bhanuseshukumar@gmail.com>
 <20250930173950.5d7636e2@kernel.org>
Content-Language: en-US
From: Bhanu Seshu Kumar Valluri <bhanuseshukumar@gmail.com>
In-Reply-To: <20250930173950.5d7636e2@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01/10/25 06:09, Jakub Kicinski wrote:
> On Tue, 30 Sep 2025 14:19:02 +0530 Bhanu Seshu Kumar Valluri wrote:
>> +	if (dev->chipid == ID_REV_CHIP_ID_7800_) {
>> +		int rc = lan78xx_write_reg(dev, HW_CFG, saved);
>> +		/* If USB fails, there is nothing to do */
>> +		if (rc < 0)
>> +			return rc;
>> +	}
>> +	return ret;
> 
> I don't think you need to add and handle rc here separately?
> rc can only be <= so save the answer to ret and "fall thru"?

The fall thru path might have been reached with ret holding EEPROM read timeout
error status. So if ret is used instead of rc it might over write the ret with 0 when 
lan78xx_write_reg returns success and timeout error status would be lost.

Thank you.

