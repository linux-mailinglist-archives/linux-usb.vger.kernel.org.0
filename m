Return-Path: <linux-usb+bounces-23897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D3AB4EB6
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 11:00:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 96FAE3A8830
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 08:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A728121129D;
	Tue, 13 May 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="g4gafaXd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F94211486
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747126806; cv=none; b=mMI9hGqBL9JOndQA1JfOgpvaxjy6n8P8jIWaqLeiKILsKA6uyqLFLYU+IlbZnOmWAsmRo7VbSpX9iruqL0xlzws4c9Wz3sO4HJYEb6oDZat2KcYlmjCH9waEj89W3o0aQ683lg4W2nsvo+UaE6L1U6yLsrxzwvji8+o4mqgA9LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747126806; c=relaxed/simple;
	bh=7FJCteWCfIbSLLE6R3OoAZZaPUH1UYwU2njFZe3VddE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULbrO1HBb1/YXIQalaR3DjkjUNGWmmbGp4tNZL2Kg2nikGlwU2PxuB7uJyD2fCXKQNhmCVlkVlyhMRWLr+0drAObdCQomKjvUR4PXHN9ednDWpN9TwWYviWq8TDBkbUdLFqKRQppnKVU2rYYclwxsgOj8spQiLaBYN4gqce5We8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=g4gafaXd; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a206845eadso1370592f8f.3
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747126802; x=1747731602; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J/sV5bReSJD3klljzGa19Hc4f5rzEgOUKX1lBy/6QCQ=;
        b=g4gafaXdSRyGB4TTs/uvclXPRxjcrsB9srAhglZg29HZvKoz4bSSmJxtp82KDbz6nw
         HINf6jdXI9U2PCCuOHu0LqsRPP63F2qewsoUIvbupIwg5eTPeaiQxLES7h3mLSNF6HnK
         QVHhQthofLEfPAzsVnA1EDsgo4x/Evfbzyq1DXHKjt+HUKwUrHQVh49xvUiFlHQFvf1a
         f6ZmEvb3IgcGDm0vOELCBogpYAhiU1jfsi1ZtvXKbWpFux2a/2uktmoDmUQYoAJXPOol
         BJ8lqBJz4Z11m8DQUJtAezj8czLXmmTclcxHrOHHNeX0pkxnDiT0eNxvlejiBF42I6pk
         moUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747126802; x=1747731602;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J/sV5bReSJD3klljzGa19Hc4f5rzEgOUKX1lBy/6QCQ=;
        b=DlDJtPcRSNjtsrZRYfgE9Xfl7XCvTcCH0XSNF/FFBFpeNMWv5olv/2cqWJrcwKtaF/
         v2d8/s+Fw+Ke33two3h0NB+WBFQMiLpLVlWAnRV4qJZ9jcsQpJen5fFplwVhQApHdiWF
         Jc9LXlj3gKqLNeDww1prc3Tk8bu5rdkKtkZLRPkiUHJRdClw9CgltJVNCjxtSI5JXTlV
         KsjZ4nUcZbOObaqFFxCYn3CCf5KMSuHZNGJJO0g+PlUaUZDSuSUaxWOohVjxnspar272
         BbrUZo+2ktlIm378L0fIqNUunwZcYezIhTUTANk/nabd5sYFK84E5qmjipvm1vq5zO6O
         xWHA==
X-Forwarded-Encrypted: i=1; AJvYcCVkRTccO3VxBGyCEBeNvgUc+4gsG4Uzln5ErnsXKemU1Jp31IPdwo4mipm7wvjDKSsroi+e47YLLns=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUGjiCPjfsptwJ5FXKRDbNxVuVpnOneHG8CIDGvUtGCQN9viFz
	kfpM93m+GgpWOdTiKruhxgt6VZuPCpZ6ilgFX4J2xX7DJd31Kc/YCltlBv7AZhU=
X-Gm-Gg: ASbGnctttbNn8mQYIwZqS1+dB6AS+nsjtEQyIYRsgbZThjovX1Ti01b3mjmxAxvn0zO
	fSEK8inktUWKeKbm0UzLKuVFEVQPsQMNtmXgssCXXRD8xawCXKVExwx8rLg77Xn725b55qXIKxu
	E4gBwO8Qj8aga4IrXig/r0a19o1gjzxNqgGfRC8XinRiUJTSJmehnoMn8Rj0/vsKMX1YBzt8dWf
	Z+jmXZBAvxz4Xe3vs6WRqJht2aVzLLLbdYuaXaWQh2QFVWv7uT/JEO4DJIl/RWagr6IiukOonfU
	xCNiOUA+XpKcwNC2lCPYi+jPdaGLK6bl/3LM5bcHfUpiYOCYCJBSuWdsSIZYkmwgRCrEyUCokYz
	jVI4e2PkXilrazhZxQ1M=
X-Google-Smtp-Source: AGHT+IHNa6LdSLW0bGwyDavu41Wnn3O0fNNmTUGNaBgw+BMksPcYOfz9t377gEimfC/qQPa8Osxksw==
X-Received: by 2002:a05:6000:430e:b0:3a0:b733:f255 with SMTP id ffacd0b85a97d-3a1f6484984mr12614588f8f.25.1747126802598;
        Tue, 13 May 2025 02:00:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:1335:3601:f121:69fe:935a:67bd? ([2001:a61:1335:3601:f121:69fe:935a:67bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2961sm15400503f8f.45.2025.05.13.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 02:00:02 -0700 (PDT)
Message-ID: <cd601d4f-566b-4fd1-b13e-b7bf8bb59507@suse.com>
Date: Tue, 13 May 2025 11:00:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: xhci: use urb hcpriv mempool for private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513055545.5738-1-00107082@163.com>
 <875848ec-f92b-48a9-b5c2-792bb0121824@suse.com>
 <1335f63c.7bea.196c8c53bef.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1335f63c.7bea.196c8c53bef.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 13.05.25 10:31, David Wang wrote:
  
> No, I don't think which HC the URB was last used for concerns here.
> A URB cannot be used by two HC at the same time, as long as this hold, I don't see reason
>   worrying about who use this private data before.
> 
> This patch for xhci dose not assume which HC use the private data mempool  previously, nor
> should other HCs.

OK, I need to correct myself.
Though I have to ask in the long run what happens
if two HCDs need to allocate the mempool differently.
But for now it will work.

> Or, do I misunderstand your comments?

No. The problem is with the first patch in the series.
Basically you need to pass mem_flags from usb_submit_urb()
to urb_hcpriv_mempool_zalloc() and use it.

	Regards
		Oliver


