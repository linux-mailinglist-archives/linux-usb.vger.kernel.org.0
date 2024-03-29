Return-Path: <linux-usb+bounces-8657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D39D1891F2C
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 15:59:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1139A1C26925
	for <lists+linux-usb@lfdr.de>; Fri, 29 Mar 2024 14:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 943C513A89E;
	Fri, 29 Mar 2024 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lh0m+edF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7312413AA31
	for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 12:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711716804; cv=none; b=UvSVoSZkg2uyg1g5gJbbiyzEvrC9I+g65bOhJ8SmPhDF0j5MJx6Nwa+mwkkpPP/lEQguOjo+AfxkXiSHubozmEXGNHszOpnvnLpfpi0KbLtGshlrVn+o45O1hSh7Oy9ec0GnoGGvWo9fG5h4zOcVK1Sck6yPoFcM6fv4Mtzipng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711716804; c=relaxed/simple;
	bh=lDZ3yFBrOvom7GnxCtNEzylmxgArV09Cn+KF+cIBtBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PQy0VAP4aIrR1kim8ZUalEiGh6EdQlJ6IjrumK0dwydnXV+UdWhJ9XfFSvNQ9Yf8z5wvks2EthZjh7WnsaKoIEUhnSffo1t35u87ZJm47bfB0Zf83PIKa752k+hS75GNmpE8PNR1nCYWwbuLccxQQly3qTYUrVE+fUaqBt2ml5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lh0m+edF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a4e0e3ef357so262717666b.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Mar 2024 05:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711716801; x=1712321601; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqmeaanRrv70KrX+f6VF9Jc+mdIFTxL5kmoWDsT7HCU=;
        b=lh0m+edFhth8xi6ClakFkZlNdVoGctYqSDe4JuOzka6NZqKv5MBetW9pFC/51FjME9
         21Y4vUxGvkDITThbWSpTsBOz8PwMCpzCxKKWVUpLCBWZwLRRQAqvb+kOhDtQRv9xYUP4
         +ouempR3e8T6S1enSwepAQIHj6dAMP3JptPZhY9Ne4KAomln/TxnV9El71bZQBMWfoWv
         bu8XRJq1Nt9OarGPgQjXwxGll2JqbkHSLGlmUZOQkR5gDQ5RcV53y45iZSkHKv1YIh0B
         1WbyrkdG5nbexnOiML7QdLJvQGWWZKnFFomp+FBCfciDOASQuG0ZU7pPZ4fcLKPEZA8n
         B7IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711716801; x=1712321601;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wqmeaanRrv70KrX+f6VF9Jc+mdIFTxL5kmoWDsT7HCU=;
        b=pT2GT6xpQe7RxF7syO80BRTcNaezVqpvHhsHWuH6dpVA9m2tILRwlyCWsfnjaT1h+Q
         ZYs50AFtGDi6JvnX6W5PdIEBAL14s5lKWwdT0hYeQbKwikVaOFcDWitqVHBdl/x+nlz6
         UaN3uFFPAROzbM8DJZHaeH8KhxV0biwPb/YISe7k/UU5NkLjZN3MJlKNlabJg2SwzPL+
         JyJyBzkTgMOHvC5RHKY03NOA3EJXr7x+9oRq8IFqTSFDGsI6zQ5bVipva1ckBF4yJjXP
         gI89PgMwd0fjrXA5C9irGvEQl+DiyUi6GMUWlpsO06v/YO8TMg9smbL/aUaaJ2WwHQfJ
         S8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzS4cpr/uw9BAR7wTz70Z0zKQyEr71drkQCQboF3FT6ha9T7V0HT3drZsoDBFMkNGmF7h691VWS4piMskKPA5T4dr3lxfTJZBQ
X-Gm-Message-State: AOJu0YxsFJ/zZ4TtjGfpoYnbzvzVxBKOqZURC7L1wKUC+fFPB6u014Sn
	mIorHib903gOu2MKTJ7EDGEeGTxi43lY5N8mIVkR4UOnFJ7pWw2xMIjqdxEM
X-Google-Smtp-Source: AGHT+IE/m2VAb8y14bLIT+7oEDU9QeelHaHTE001Vkw0H/9Haf3Q6h9CgOSawMqw7b8Sk7bCPS7mrg==
X-Received: by 2002:a17:906:1744:b0:a4e:2d7d:3fd5 with SMTP id d4-20020a170906174400b00a4e2d7d3fd5mr1693942eje.1.1711716800652;
        Fri, 29 Mar 2024 05:53:20 -0700 (PDT)
Received: from [192.168.1.50] ([79.119.240.188])
        by smtp.gmail.com with ESMTPSA id m16-20020a170906581000b00a4a3807929esm1898519ejq.119.2024.03.29.05.53.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 05:53:20 -0700 (PDT)
Message-ID: <e6c9366f-dc9e-4b2c-82bc-ee13a1f7a62d@gmail.com>
Date: Fri, 29 Mar 2024 14:53:18 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Device with two interfaces - what is the probing order?
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
References: <f4df8e45-5dc5-4d81-a414-e19a83b71403@gmail.com>
 <8bc3a7ae-bf8a-486e-946b-ff75ef2ac727@rowland.harvard.edu>
 <77a2f290-2f63-42d8-a6d2-25840049beca@gmail.com>
 <2024032907-smokeless-imperial-f3f9@gregkh>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <2024032907-smokeless-imperial-f3f9@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/03/2024 13:47, Greg KH wrote:
> On Fri, Mar 29, 2024 at 01:36:18PM +0200, Bitterblue Smith wrote:
>> On 28/03/2024 22:05, Alan Stern wrote:
>>> On Thu, Mar 28, 2024 at 09:08:43PM +0200, Bitterblue Smith wrote:
>>>> Hi all,
>>>>
>>>> Given a USB Wifi device with two "identical" interfaces,
>>>> in what order are the interfaces probed? Is the order guaranteed?
>>>
>>> They are probed in the order that they are listed in the 
>>> Get-Config-Descriptor output.  But this is not guaranteed.
>>>
>>> Alan Stern
>>
>> Is it guaranteed that they are probed one at a time, not in parallel?
> 
> Yes, all USB probes are in sequence.
> 
>> Oh, and what about the disconnect function? Is that guaranteed to be called not in parallel?
> 
> Yes.
> 
> hope this helps,
> 
> greg k-h

That's very helpful. Thank you both.

