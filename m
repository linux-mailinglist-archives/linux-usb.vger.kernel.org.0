Return-Path: <linux-usb+bounces-15854-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FD0994FB5
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 15:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0A011F242E0
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 13:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDF351DF98E;
	Tue,  8 Oct 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WoOZbK5X"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AED1DF254
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728394050; cv=none; b=d8TSMX0gyle+kxQTanfF1W4Ieh+gC8xEknTrPgMv/FmI+/jqca10Pg0zWbQ/XKD2I/hSXnW7IOM8rryReq1rKCiiYG6Kdqc+AcSRvToZdN3tJ3etm6OFArFCRsOBWu2DkQYTF/iDQmbLSb2W0oWrp9Y6GKlp3egGoz1rvZox5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728394050; c=relaxed/simple;
	bh=/lSmaiGQuSgciND2dTuuVRx+OPw3aSWVVIsfYWE6YmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=dYTi3ZnseHmTbK0DqlqfpEcuQ2AW7c+7VwYOj8FjRmkiBqmMfa3jwAhJ/qMhRYul8aLY+Fcez/Axvdu54rwjciVTBqmH1Ew3BlY8rcND4UzFGhGOuDnV3+Z3zV/xGI7nmNvz51ck/Y4GG6Zx7MBUGZGQnybleGxXHRxTGv+H3/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WoOZbK5X; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-a86e9db75b9so867075466b.1
        for <linux-usb@vger.kernel.org>; Tue, 08 Oct 2024 06:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728394047; x=1728998847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YbjdH5gJx4xR+zgbaxEFOL3q+AfhFIpmC+rLHdt60rw=;
        b=WoOZbK5XpaOnHJbwua2ZnPnw3f8sfCDl5iN2m9mCVKckZQyTKHbri90Yg6CIQSz10c
         cFjJLuI1b3wvjsVLdeqPBFn+HkdB8QudAMgqYK8cebPqvlKDROTF/XL1JSKd+8724LCI
         aPCOAywnj6wvO3/wVJSFj3azuDQJH0XjyirfaNO048VlieFOUgk753nBETNtpjul+A0B
         yhTko42DrLNyf78tDoLB7SawNAw22zPJ7rATR30z6zkImbvbagYM1X19btSFZLe60SFx
         iXEFL4tIfhNo7YSxA0dkz7P1jmNN5rD9Ycsb7upvYPFye69LhhTMe9GuV+UlRgChNO0w
         gYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728394047; x=1728998847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbjdH5gJx4xR+zgbaxEFOL3q+AfhFIpmC+rLHdt60rw=;
        b=Kxz6FQNM4cP0LZaxsazfOIueTVyQIz7uYWrboJtZvfNoIscNLWRUIsRkRe2x9fP16f
         pXVyQeBH13qxln1gm0oLxNWJCecKgoIzLxkMvzHU5dCA6n4+LqlKScY9i9ihb+QBfsDc
         E51BoOTOLHKTDR60nJB5KGNWIC4UoVqxOjO31QZNAv2qeHQGrBm7p78ms+Hc+MsyHaJR
         oC6PJbBpA9eke+31RgHjPK+ON2Sh/74w+dO+sDl7U3hBUhmdU6j1XnnONOv9FzdTLqIL
         vDdWdiuUHv5iLPnSISlgNQYUlmrdtHphKwsMcTd+JvrjDzDwqeQ8SuwEO1JLHtFradMa
         6K1g==
X-Forwarded-Encrypted: i=1; AJvYcCW4+G5AYzZIoX9UzgwERpAc074uAV8qdKO1d90IFGEJvu2/TPkyyMLGpPlemnWKd79a2Qr6UslzZJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEyGmdgfsgz09KOrB6SMNITPyoerH32Nkgt2PVCw5+1DxJX7ye
	rC9oZc1iWWiv3MEK8fMlmPVG6kfhxICC/cgzYBs59cIUA8hBVvCtYjBdt6pRfl8=
X-Google-Smtp-Source: AGHT+IE7/J05tNClBYcJ1yptsiFQ2anWJUFQPD28w7+tv8ErmUiqzZSSJg9Fpdyb9CFPFHtYTE1SdA==
X-Received: by 2002:a17:907:7247:b0:a99:53cf:58c2 with SMTP id a640c23a62f3a-a9953cf5b9amr671248166b.62.1728394046725;
        Tue, 08 Oct 2024 06:27:26 -0700 (PDT)
Received: from ?IPV6:2001:a61:1376:1e01:31ff:86bd:53f7:32ec? ([2001:a61:1376:1e01:31ff:86bd:53f7:32ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a992e625a7dsm506283366b.84.2024.10.08.06.27.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Oct 2024 06:27:26 -0700 (PDT)
Message-ID: <7a12a2de-7479-4104-87d3-f1b941ab218c@suse.com>
Date: Tue, 8 Oct 2024 15:27:25 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
To: bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
References: <bug-219362-208809@https.bugzilla.kernel.org/>
 <bug-219362-208809-X5UplhhXlp@https.bugzilla.kernel.org/>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <bug-219362-208809-X5UplhhXlp@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.10.24 14:22, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=219362
> 
> --- Comment #4 from Tomas Mudrunka (harviecz@gmail.com) ---
> Anyway... My coworker says he triggered the same error by proper shutdown. He
> gets sata command fail somewhere near the end of the log when shutting down.
> 

Then please provide full dmesg. We need to know what is happening.
You should definitely get a cache flush command during the shotdown.

	Regards
		Olver

