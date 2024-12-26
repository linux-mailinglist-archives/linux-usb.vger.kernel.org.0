Return-Path: <linux-usb+bounces-18818-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8499FCD1C
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 19:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E89F4164182
	for <lists+linux-usb@lfdr.de>; Thu, 26 Dec 2024 18:37:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980C81E0DCB;
	Thu, 26 Dec 2024 18:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GKlDlzce"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4561D5150
	for <linux-usb@vger.kernel.org>; Thu, 26 Dec 2024 18:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735237687; cv=none; b=iId8Y48FhrTJHG9bINDJPY9pTflBNU/MN1wnGJoKyVH4T+DxUtXZQBaNnnGPPIdEZoJbfpVn5Io54ouDEcl4M277uns+AMI2FcuoZ17A5SNmqiViAWO0e6Ua0UlQkyCahSO3oB0QfbzxmjjuKZKafkx/i/dgOTgSZiHLoRT8hCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735237687; c=relaxed/simple;
	bh=ZdsEviuoo5KPKcew+cQZrSBrkqRevptlS56zA/SzY7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D7O4y/vIwgq7Qrs3R8ImLWm+XG6h1k9xIF4lq0KhOTu/2clY2iF/3d7xN+fMoRsB9thoUORma+vIIYKsX6rAVbEo92jJoZYdp7zH272HZr2gLzKhTZFQ77o0tRPm2FiXkK1yS5syTSWFOAccf+/Ezh2+AluiXFS9/u9RHF1h/O0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GKlDlzce; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3a9cee9d741so46701845ab.3
        for <linux-usb@vger.kernel.org>; Thu, 26 Dec 2024 10:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735237684; x=1735842484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlfrKvVa44Q74KeNad3jseTdt0A11DuWu/sRJ2xX3mI=;
        b=GKlDlzce8Zx0r8EtVI95V2HYftbixy6cl5ukN9C8LjMFhi8LvPy1RZkemXLDNqRCMA
         mAbKclJhQfPJpvagupPs59ntjTQgmw2Xs8hpJcamCJNRW0UP5vtv5yH1rHZn3VDDOfBI
         qBZ+rsStd9pTrWF3w5AooBpuhQDzGBbsrKTJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735237684; x=1735842484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HlfrKvVa44Q74KeNad3jseTdt0A11DuWu/sRJ2xX3mI=;
        b=l2M+aotzJ0+Dm34+tpqENfiGfn43mMnJDjRPmzJ+IEgHQu8lqNAka6ppCbSQrj+cpg
         oTcfOf6SO7ufySrUO+p3fVO2b8o+VKoQ5E/8YXma/P0wfVH7qFVYZgBbg8XGPrnOEpBO
         +KRg6YrB+EsxSo7BD7HrCIpGrRpS8Yi26xo1rMm3lohWNEuQvPsGv1LQCYqbbn41+zh2
         fLrmVg8dUAsRSF6PSFmu0yqNP+cNohBwRFuNXYNKNZZW79qm/DyuQQItxv5TnWAN1p7p
         K2KZF+L0MUe9Vo/A0w/e3Dep3PA7Dh4BgriMG9PHbtehDyUym04/DTWPaUtvoYQhE93W
         aqUg==
X-Forwarded-Encrypted: i=1; AJvYcCW4UQBK7BsQvdZTkgXRDoSv2GaKkxTYmMNvawHIuB33gkx2b0X+FAW/Cfa9LET5+OeiC+Fm3SltUZk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWVQ8VAKABKLkfP8qwgNJpZBB7yhdJgUQqnLyJ6BIAUw3GA32
	gcwq0VfFFU+ppXuTRy+8Oxua4MDlqxuSEaOF/13U4uQ8geAjpixmGkfo9NcQHFA=
X-Gm-Gg: ASbGncsofBPpqDRZ5RFZi9mL6Jnfg3DOGQah0L54ivaZZZnEl0Nb7MHNzHys52KPfll
	uOZAaQXIQO49AV/OKs1qZU6s3Dr4GCw0gwX+/d+zY3rfxN2xAdtHDgb7BbvIFaa8YDI0PTyQwuO
	kThKC6fpNbCtOqxxaZW+RuDUedDYu/7Im1AgBCgHDdAbhxjzlBIZJnZxCFyn7dqPC1fmip6NmbL
	0PH+KJy9uUOO79bU5i3iTwkCrDwuJjLOv5u0Fl6DN9cSHRNtQrGlGThU/JXuRcnzHjr
X-Google-Smtp-Source: AGHT+IFHTmkJWUrHaXZrWcAeLpK09ROt7JB/A7gOFRrh0lAoo1BwLIrIUhxuZX+P2ZR/LhKr4VXNNw==
X-Received: by 2002:a05:6e02:219c:b0:3a7:a2c6:e6d1 with SMTP id e9e14a558f8ab-3c2d5151ee6mr206368295ab.16.1735237683948;
        Thu, 26 Dec 2024 10:28:03 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c2216c5sm3649059173.151.2024.12.26.10.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Dec 2024 10:28:03 -0800 (PST)
Message-ID: <7e4e933e-ea26-495f-a35e-583ebcf4dac4@linuxfoundation.org>
Date: Thu, 26 Dec 2024 11:28:02 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Update USB/IP OP_REP_IMPORT documentation.
To: Gordon Ou <gordon.xwj@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-usb@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, trivial@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241224062336.63215-1-gordon.xwj@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241224062336.63215-1-gordon.xwj@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/24 23:23, Gordon Ou wrote:
> This is to correct the mistaken byte offset of the field bDeviceClass in
> OP_REP_IMPORT documentation. The previous field bcdDevice has length 2 and
> the offset for bDeviceClass should be 0x138 + 2 = 0x13A instead of 0x139.
> Offsets for subsequent fields are also affected and fixed in this patch.
> 
> Signed-off-by: Gordon Ou <gordon.xwj@gmail.com>
> ---
> Changes in v2:
>   - Updated patch description.

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, please pick this up.

thanks,
-- Shuah

