Return-Path: <linux-usb+bounces-3732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A0280501C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 11:22:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A898DB20D5C
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 10:22:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C30C5380B;
	Tue,  5 Dec 2023 10:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PZZvDB+c"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40F99A5
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 02:21:57 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40c0873cf84so27724095e9.1
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 02:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701771716; x=1702376516; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfZJNSQ5xEmWcdRaICEtZLq/bhaKOh50aZuU1fZaSaQ=;
        b=PZZvDB+crLG6Y99ObbHMsejws01IPMsnST0UrHwgCTkjnLYxmrR3rqpGcar1tQtv2Y
         zQMA1C+0ty+5xSI99HOPXbMkPF+DSBBsvvK24bx2FnXXj6OAHw2ZB1pAHzelpeQ6yWZu
         0V3sIBQgVE98fi+M6jxqQbw7GC2qRuJfmdX5WKW9J7wGvU1tA1NtXju/N8+F0YktEivh
         ZlTovY1tocO2mhOy97ozC9mKWRfmnkyq/iq7OP1C7UUYHOrAPRHc3Cn8JYbj+Ip2Awu1
         MkgBgEkT5+TtOYTor15jcZZFnz6AErWcAt43Oiqc4GIi3F++oGZvQv68xWP+2Qt7u0cr
         /mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701771716; x=1702376516;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfZJNSQ5xEmWcdRaICEtZLq/bhaKOh50aZuU1fZaSaQ=;
        b=o63O8G0XNNkQnRJC8NwvrZ7evJafCl+H826pxz4EYi84mjaaH+K0WqgwwyjydvXLuZ
         WvX9QSivxbj88UhLdXjTAioDQtlfoq4/jUVLl2xXRhy1D6DER2yB0vTXD1dntSP8dCdI
         359TEJoZcRWvJmVgU1ECSV8kMZ9fMcbQ9ynTEX0CuulJ5Khyhlb97Wu5Lls5tDwPZwDG
         r8RYhlYt6XxuFKlmV2jVNRj6m1B4i7FwbtQ+plAJiciLIG/SlFgp9gVR0+8LZ+4HLwyl
         YMp9EzwXznxlq3dJPKxsk5bca6sYF24ViNIzGJkUuOHIvjDBYApyRGOhPP41mTp2Mhm2
         SsSQ==
X-Gm-Message-State: AOJu0YxyclLAUhEkJiRNisP8wHToHN6SFChn9e4K9D8W/p+EI45FNtmI
	GwBnb1J1o3lTMADxM7L2IsUIVg==
X-Google-Smtp-Source: AGHT+IEGgR9vP/IDHx4I8EsEBlJ6nnlhSkR2i4kB0X8XAHt96YZ8oy3EI1zXi7Ek5iZLKsio1Im4XQ==
X-Received: by 2002:a05:600c:4eca:b0:40b:5e21:d367 with SMTP id g10-20020a05600c4eca00b0040b5e21d367mr338017wmq.112.1701771715715;
        Tue, 05 Dec 2023 02:21:55 -0800 (PST)
Received: from ?IPV6:2001:a61:1362:9c01:78ff:1f81:1ea8:d077? ([2001:a61:1362:9c01:78ff:1f81:1ea8:d077])
        by smtp.gmail.com with ESMTPSA id bi10-20020a05600c3d8a00b0040b4c7e1a65sm21847794wmb.13.2023.12.05.02.21.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 02:21:55 -0800 (PST)
Message-ID: <b66c6ee2-a836-4a83-bc0e-f34cac84a0f1@suse.com>
Date: Tue, 5 Dec 2023 11:21:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] USB: gl620a: check for rx buffer overflow
Content-Language: en-US
To: Paolo Abeni <pabeni@redhat.com>, Oliver Neukum <oneukum@suse.com>,
 dmitry.bezrukov@aquantia.com, marcinguy@gmail.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
References: <20231122095306.15175-1-oneukum@suse.com>
 <73ef03a1607f221c7939cb0646c17c5435dcecd1.camel@redhat.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <73ef03a1607f221c7939cb0646c17c5435dcecd1.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.23 09:04, Paolo Abeni wrote:

Hi,

> I think the above is not strict enough: at this point skb->data points
> to the gl_packet header. The first 4 bytes in skb are gl_packet-
>> packet_length. To ensure an overflow is avoided you should check for:
> 
> 		if (size + 4 > skb->len)
> 
> likely with a describing comment.

it seems to me that at the time of the check skb->len has already
been adjusted by the skb_pull() before, respectively at the end, of
the loop.

	Regards
		Oliver


