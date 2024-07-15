Return-Path: <linux-usb+bounces-12218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E5A9310A8
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 10:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 430C71C21DB8
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 08:53:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA34F185081;
	Mon, 15 Jul 2024 08:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="V9Ljm2kD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727611836CE
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 08:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721033599; cv=none; b=GStT45s0q0Cw/n1CPZ/nt/I3ZIsCpl6IA3m435cB6hi5k59T43BwoPXa6T0WPGqt1aWYj08HnJ7E3FoqB7R1+KOCD9zwGML7KvaFRQh/l+f3fl2CWuAMdA7svcfTDIhL25Sr+Fxo8L8anl8Y1Ma+oL4nxNC5kAxP+BW8jRonCi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721033599; c=relaxed/simple;
	bh=PvIHSvHDyCqHlg4FzdOm/9JZDBPadb9yALdKopHDcRc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HA3lb0u/xkcUqQL2ZAgoEGOjjW0hvPqnA1ZBBlQNimXNeHIbeYh6AoD/6VqJHCW4S2xOC/uOcU8emnyZ3LMFDKD4tkcTXXnQLXOnNoHHefGUuyGdaPjYUSYbAjwEMn/JoBHgR9hjxTnd+Uf51cLZ2vJ1ryJuR9mYIZLQVI5g2y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=V9Ljm2kD; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-367ac08f80fso2140083f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721033596; x=1721638396; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3odnsVgnGxuOUiR7+Vp9cvYXGHiYs1cqaY5JH4bJ45g=;
        b=V9Ljm2kDw/zAUJGXF8rLKqiaVpnAMnK1S5YusyH/MXXGNxwgfUgbkMAznvJR640L5l
         Ap3exzR8BEUsU1JiGBnHfWieq8Nd1K2G3sk+rZu8WyKugnlfRyqvDZyWm874gYcFxj39
         DQYvhl/YKu7j0FgHBnUOvwEfbDeHZfwgINojF1A8dKdtwvxDL0x06n3Q72lPmn1+trmX
         cQgqEJn/TmANEEl77LHuUJ0TBqdSMbe0yImTeUfyo//d5pMuRyDQLon+33FBObZjNi8p
         Dx6QEmq3QkV1+v/TOKrbmEdxVMiwkpZv63/x81D4PUxtigvT0AvadXbT14LvmgZkvgSV
         PLJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721033596; x=1721638396;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3odnsVgnGxuOUiR7+Vp9cvYXGHiYs1cqaY5JH4bJ45g=;
        b=wO2Q/1T+61HkLTVBp9LFWvPdWgExKaJlrjkncp1Bf5K4J37P8iLZ8LYMi9FIy7G+id
         Rzye1FKk/zaFa6t8qM4voQDFkWMicR7uJAICBTbTh9t4Tgcz/GcrSRRAmvyyNsji/lxv
         nHTGaXB3BiM9o4CPy8XCRR6xdUFCT6MIWrsYmpUqtRgch0C4Eg6evGNLaC5sBmAcepTr
         jmZm6TMcO0JLQNINnhy5dh3nTYDFaf1mGNuHU4wsRpP++DDh3PsMGmlI8kWTmsTU0bwN
         BbYHtZnA3JmU6kHoXUKiK8RRGzBYp7PsqTQKTrwyl/AG8Sp036HvlmYCkFSA+hMWSY4Z
         he/A==
X-Forwarded-Encrypted: i=1; AJvYcCW9E0ENKSH0iZxI6tux3L1w/xQdO5FAmBUk1rH4Mi3J3QCo6Jgbz1pkGp6ofzsn13louhp/6qMJMF1gcSbsByQXyCSx74fBalh8
X-Gm-Message-State: AOJu0YyDdGCisN+VlwqV9JSEFGMchajchejf0dAhlZZyikvirQ3SZsdZ
	dgqkT7cjgW6CAZUpMEIiTQfak9/MDJ2vNuacT/oarr13TqEicxSgw7c3BKZdDTc=
X-Google-Smtp-Source: AGHT+IGcbA7Mwq7h0WiIhyo8KuepT/D1REFUiK2c6xTrJurCwDRfFLaG/d2cskZbQnaFqO6Qk3d9sw==
X-Received: by 2002:adf:fb0e:0:b0:367:9387:fb14 with SMTP id ffacd0b85a97d-367cea735a4mr12099028f8f.27.1721033595554;
        Mon, 15 Jul 2024 01:53:15 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680db047c4sm5711198f8f.108.2024.07.15.01.53.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 01:53:15 -0700 (PDT)
Message-ID: <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>
Date: Mon, 15 Jul 2024 10:53:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
To: Alan Stern <stern@rowland.harvard.edu>, Oliver Neukum <oneukum@suse.com>
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, gregkh@linuxfoundation.org,
 brauner@kernel.org, jlayton@kernel.org, jack@suse.cz,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11.07.24 16:41, Alan Stern wrote:
> On Thu, Jul 11, 2024 at 10:59:56AM +0200, Oliver Neukum wrote:

>> I am sorry, but this implementation has some fundamental issues.
> 
> Agreed, but the solution is pretty simple.  Because the device was
> suspended, the userspace driver must have enabled suspend via the
> USBDEVFS_ALLOW_SUSPEND ioctl.

The whole system could have been suspended, in particularly to S4.

	Regards
		Oliver


