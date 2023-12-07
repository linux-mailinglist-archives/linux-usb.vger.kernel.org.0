Return-Path: <linux-usb+bounces-3824-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5449B8084DD
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 10:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 10B7728394E
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 09:42:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 863103526A;
	Thu,  7 Dec 2023 09:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="d5gApnJC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 406E9D1
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 01:41:54 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-54bf9a54fe3so973290a12.3
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 01:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701942112; x=1702546912; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrr0GbDHBvO6eoDGXmF/XujAE6vi1mysDfbQy7VCaZc=;
        b=d5gApnJCtNn2tGn5l2CNjk1P/i4qP92Rgxljf1DnVTm+IOha8r9MBNq3m90ZS5//5J
         tuSOrB5NZNsEGRmifM57/XPQn6+K2N6kEvS52zKT3MGa67oCyp2/OWX8UBM/87nTtJSz
         ko4CUQ6r/3j2F1raWlTjHzJ0CJuvR+FYh8uV+yUvJI5muXx/bK1gyeEpsnXCVeCNg+eG
         tcaCOVcwQYCoUQrknbdd8AorFbZBImFQZJqelQyJW0OjjZETUJUpoIj/F+2v7gFx3XGU
         rYNFW8EBwf0wOLNALZYw7OOG+pkcGtnn4PGXUgHcpPKXLBjXRcA+iT2XB8xO2aKDvJrM
         sqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701942112; x=1702546912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrr0GbDHBvO6eoDGXmF/XujAE6vi1mysDfbQy7VCaZc=;
        b=pnxOay1xzODiy5z3sa1P7WDN6sge5KpN0lm0R7/4m2s57xRIuNQt3MbU0BwqIfA6P9
         oLjWU4LGCGopOXOCbdcQOUeCBWHheEteO9jxTKQA/3VlF8B6Iy1o5ctIqsI0+DitzEKs
         jEXLaur71ZlgqAVo49F49KbDWhvZjf7P40jrJd+GwZZHZN2tmZd0lS78kt6w72+LO9zk
         N+gT7Wdj0REdaJn66VcLoMJfi2zSmKLSIIqzaJV4X3LN77Odvh/R6B85hzw1l/ieAAeg
         QKlFCm+YkEYEO8vUh4Jd3tx8vAxXPVVehEE7YsD7wwKtuQBAHTwK+8pqqrp0fLgieD3t
         M3SA==
X-Gm-Message-State: AOJu0YyfV5ottoiEFUbV/HI5ZHoPJsMHQh5ueUmEFvr99GG4viRFoumr
	Atl9Tl8bL2wrrELbL9uwHC3xSw==
X-Google-Smtp-Source: AGHT+IEdTZSG/RFIJ/Yq/Q0i3uRvDCLhm4UMoWg8LUXEwK8xyeZOea2rRZoDiqbmk/ILoCFU7KOP/Q==
X-Received: by 2002:a50:9357:0:b0:54c:4837:9a92 with SMTP id n23-20020a509357000000b0054c48379a92mr1377644eda.57.1701942112699;
        Thu, 07 Dec 2023 01:41:52 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:d424:8584:98d8:cd65? ([2001:a61:13af:fb01:d424:8584:98d8:cd65])
        by smtp.gmail.com with ESMTPSA id e28-20020a50d4dc000000b0054cc903baadsm582501edj.30.2023.12.07.01.41.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 01:41:52 -0800 (PST)
Message-ID: <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
Date: Thu, 7 Dec 2023 10:41:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
Content-Language: en-US
To: Hiago De Franco <hiagofranco@gmail.com>, oneukum@suse.com,
 =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Cc: davem@davemloft.net, edumazet@google.com, hiago.franco@toradex.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, pabeni@redhat.com
References: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
 <20231206162353.53767-1-hiagofranco@gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231206162353.53767-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06.12.23 17:23, Hiago De Franco wrote:
> From: Hiago De Franco <hiago.franco@toradex.com>
> 

Good morning,

> Hi Oliver,
> 
> On 06.12.23 13:21, Oliver Neukum wrote:
>> Before we proceed, however, your patch raises a fundamental question:
>> Are we talking about gadget or host mode here?
>> Could you please describe your setup in detail?
> 
> Sure, I'm running a Apalis iMX6QD 512MB, which is basically an ARM 32-bits
> device with NXP iMX6QD. This device is running Linux with wayland, weston
> and the neatvnc server, so I can access my app using a vnc client on my
> host PC (also running Linux, Debian 12).

OK, you are using Linux on _both_ sides. Interesting, far from obvious, though.
(Putting Maciej into CC)  
> Finally, I open a VNC client on my host PC and connect to 192.168.11.1,
> where the issue begins with it being very slow/frozen. After applying the
> patch on the device (Apalis iMX6), now VNC runs smoothly.

For debugging purposes your first patch modifies the result of
USB_CDC_GET_NTB_PARAMETERS. Thereby both the host and the gadget change
their behavior. Hence we cannot tell which side has a problem with its
buffering at the old buffer size.

Can you tell us which side in your test case produces many small packets?

Furthermore, for testing purposes, could you decrease TX_TIMEOUT_NSECS in
f_ncm.c by an order of magnitude.

	Regards
		Oliver


