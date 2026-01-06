Return-Path: <linux-usb+bounces-31968-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F1DCFB139
	for <lists+linux-usb@lfdr.de>; Tue, 06 Jan 2026 22:21:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC23F306BC48
	for <lists+linux-usb@lfdr.de>; Tue,  6 Jan 2026 21:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D0F29BDBD;
	Tue,  6 Jan 2026 21:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="CCEOqlLO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82249296BBF
	for <linux-usb@vger.kernel.org>; Tue,  6 Jan 2026 21:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767734252; cv=none; b=IXPuLaS2hnDY50y5KpvxI3j4ZtZ/MYThm4uS4KAj4vflR25p6ncPAkjKd1pxXaDf63Zi/7jMbRPtosUWCmI4yCqAjdNFioL8ZmbxD1dFFgUe+9z+9n4lz12IT+3NqOGAbC75x4yRxDoHmyvjwu8NcwbrefrJUmGSuqZPbPvqgqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767734252; c=relaxed/simple;
	bh=SwBHNG6vZFlNypLfpkmH3I0VlIqMQzsKM6FWB0bvaHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QV1W8eg1UIaTGcoScIb2wpZRPNP/ZeSOfrwms0PE94AfH43hygi20hTVYA+itUSfDF+yOfMxC0Ea8NGuI+NIEasV1+DqTjN6ouVscD3I992b8aSC16zrkSXmoghZHzVujiAe48piffgiXoxXtq/kECcoK8O1lHPQOLTyfPefdRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=CCEOqlLO; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7c6dbdaced8so1143091a34.1
        for <linux-usb@vger.kernel.org>; Tue, 06 Jan 2026 13:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767734249; x=1768339049; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y1hcFi/+aH4515Cm19J8LXmnl2xD7ej4ub/6q1d4ewA=;
        b=CCEOqlLOswNxF5jiVLNlpv7iH5SlHdcjAbYPeu7Ptpx5uKdcEhXm1h5zb8UAdOqSK6
         X5dmH4a5exMs4TlELQGhojrDHyx3Z8w5I9O6zUXpW77QP03nU64/KoJdG1wspJqVCWv7
         Bn+XwTIGmQqU+mplPQIRo5eGOZFHh1j4frYvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767734249; x=1768339049;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y1hcFi/+aH4515Cm19J8LXmnl2xD7ej4ub/6q1d4ewA=;
        b=l8188KBCrgyET99rRI2Xk7ahjiqD22CJwIXdlPAp9II+EoAKWpMP6FKaQMIQW4cdlg
         NWf8g4M9M38Mut2cI/yaLgzQ1HEcU4fad/rdabosRrlC5l93ZY8Mc0EyT7wvRryt8p2m
         KNixAjX91Y3SyMb7Lf9ycnBcFHjiwCIWmc6IsgLUFdvPXSoPfe2SDInJyJ+mysKqJH4T
         iomCq01nIJxgg0nF6sUpDYK6WU6IPNC1ZBckFeP7AQ2zydCCgoeVusUE0vRkN0VCp1dR
         jiIPF5nlEgS2eg39j/ZIP6viih11ip5jTNNNeNt/CISfaWv3IkpIWuVqOmfImKpyhugh
         h0NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtB6tqEE9f6XUz6LuGU9CGAnaaUaTCzC1GUm2XTp/tQ+yi3zWq/cf4Sgwpq3BeWu3GL+P5kgkIGOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ1YiXefDfltmIhO+oXkwodP3Dgs5JwqkuCxtocyzR54fz8ms/
	6Y8H5z1+849CcSSCaeojn7uakna8aExEdd70ZhuhzZHM8HzmMmp5JiNOSf97RyYeiA8=
X-Gm-Gg: AY/fxX43AkUobyER9W/ZJCgLt8COatG5GMd/RR21XhMXJkpBRFbolyQzSbGw+Jsw5/G
	/rvWsDMdH1jVSXkMeD6G9tEu1vnW7OgGckmcUxUb08LBorjN8TszmzBsTXxAuIxndwBPSECBGZ8
	RTSDdBsrnC9/Pn7XDoLQ5CRssJgZje7+kgSPnt16WlRr7buPAHRnXb0YADytt2sSAmEuA1aG6MF
	HHtEbS3DwDygGVbiS0t6FVP6ZIpYNAoiDnvTNYryVzLPsW2yhhNrW8FIb13QTFhiDupRyWrnJMw
	pUvCZSnHtvHby51zCxJrhNS3Ev9ytbYj5BIh3sjHSQ6yHZcbt5NauwbfocTFHljXotzwcelXNxc
	G6Opgh4eoIyO1B4/l1xxhrB4M2SAejEVK247KTuKSlYgdIDsEJKUW8WTyDiNjknWB5vA6770CJa
	Q+3dd/Ocwidd8pD/czSLkC4Sk=
X-Google-Smtp-Source: AGHT+IHEacIRqIlAShQOHh2PodTizmFqHc2wJtebm0T7MBL1rx5BeFXM5pd0ajw2EVPBOoXFGurQeg==
X-Received: by 2002:a05:6830:3147:b0:7c7:5907:b1a1 with SMTP id 46e09a7af769-7ce508a99bbmr349289a34.1.1767734249390;
        Tue, 06 Jan 2026 13:17:29 -0800 (PST)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9c2esm2198512a34.21.2026.01.06.13.17.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 13:17:28 -0800 (PST)
Message-ID: <c4559ccc-d4d4-4971-bc28-b02d80e57594@linuxfoundation.org>
Date: Tue, 6 Jan 2026 14:17:27 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB/IP bug report - dmesg filled with to usb_unlink_urb() when
 using two instances of same device
To: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>,
 valentina.manea.m@gmail.com, shuah@kernel.org, linux-usb@vger.kernel.org
Cc: i@zenithal.me, Shuah Khan <skhan@linuxfoundation.org>
References: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/6/26 03:44, Ignacio Hernandez-Ros wrote:
> Hello maintainers,
> 
> I would like to submit a bug report related to the usbip-host module. Here is the context:
> 
> 1. I’ve two equal UPS devices attached to a single Raspberry PI. The Raspberry run Debian trixie and is sharing the two devices with same VID and PID but different serial number and port attached (one is at 1-1.2 and the other is at 1-1.4)

Can you elaborate on this "sharing the two devices" part.

> 2. Launching ‘dmesg’ in the host shows this result:
> 

Please send the full demsg and also how the devices are
attached?
> 
> …
> [63386.686712] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [63387.003578] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [63388.688086] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [63389.004953] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> [63390.689275] usbip-host 1-1.2: unlinked by a call to usb_unlink_urb()
> [63391.006049] usbip-host 1-1.4: unlinked by a call to usb_unlink_urb()
> …
> 
> Every second or so, there is a new line in the log.
> 
> 3. Looking at the possible reasons for this problem I dig into https://github.com/torvalds/linux/blob/7f98ab9da046865d57c102fd3ca9669a29845f67/drivers/usb/usbip/stub_rx.c#L635
> 
> And the source of the issue (Note: I’m not 100% sure about this statement ) might be related to the flag “is_tweaked” that is not distinct per device but common to all num_urbs.
> 

I need more information to be able to figure out what's going on.

thanks,
-- Shuah

