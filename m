Return-Path: <linux-usb+bounces-3832-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 710EC80865F
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 12:07:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A14F11C21EF6
	for <lists+linux-usb@lfdr.de>; Thu,  7 Dec 2023 11:07:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B39237D09;
	Thu,  7 Dec 2023 11:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HX/cpNvg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10896D6D
	for <linux-usb@vger.kernel.org>; Thu,  7 Dec 2023 03:07:29 -0800 (PST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ca0f21e48cso7310551fa.2
        for <linux-usb@vger.kernel.org>; Thu, 07 Dec 2023 03:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701947247; x=1702552047; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bx4HpmYmlVXG5IQBI17IgTNCivl41HccJ/yjvncqRLw=;
        b=HX/cpNvgK3rkfPsfT3Ei34spV3KBZIGcC6tdBsQjVOa6U/XQt+GntwBJW8gpflvSBz
         2qxvJtzidqrLH1slIygBcc76gRLkBm3nYkTSDtjWMzCSDWrhbG+lOH3LABrpJrrEQxV0
         5/DEPR9BrWqRN2qi3XccACToJ/HPrx6zutDlxhZrqwOFd47oZP7AfoLc9DToWLj6fAs+
         rYh4dQ4ZQcbiantGCgj8r849VZzeeiH5QQO8xH+necHPXs2k5i3FfFthKUYcnyNYZ6P4
         APVAuXkcymnNi+SKXZApDdZ8BlZMcNMKycIKBQzoTkraVL9KaiVaDH/xmevkcM0BmTpK
         g3BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701947247; x=1702552047;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bx4HpmYmlVXG5IQBI17IgTNCivl41HccJ/yjvncqRLw=;
        b=MfvuO2cEORInbDpvi3GUYYd4l0AZ77hk/Q2LxxCvzxztvGPzIiFC+zrtAL25uoYUcb
         EX/A2HZ0LJ29hAgvaG1h4PiHPiQTRKNjBiz2a5Uy+9EjaaXblmofwSt/QM4cwzGyPKlR
         m8K49DEKpxxv8j1FMfgHdNJan/mv16sEiU0zO5IGPvyPgMNzlbqvLQCUKqEatTe4ds4X
         3b5+E9kmuJrDsItU+Dfs6VDodbiqDaQh5Oo25EXNtbCJgt/h3i71Zzea5MtZ4HHSOo8g
         ujFxQmhx8XItiahUSQa9x9eHgihF/6hzBSbnlDv8FuCnFo9odeYQxqGOgWRFb+qi5QNc
         ZaGA==
X-Gm-Message-State: AOJu0YxkIywpGOMnfvOoe7Ar4vEdKineMMSGxQL/yBA0fvk3nbLxDbaG
	btJOBD0pZ8bzXJetWRAySp1xdw==
X-Google-Smtp-Source: AGHT+IH1kMq9OVqWlL29emxd9O6UUHUDw1zP942RGlfKMVI+C0S0d3kMChnjaQG+wtuPoQ2/WCKapA==
X-Received: by 2002:a2e:a98d:0:b0:2ca:30f5:7e02 with SMTP id x13-20020a2ea98d000000b002ca30f57e02mr568028ljq.78.1701947247249;
        Thu, 07 Dec 2023 03:07:27 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:d424:8584:98d8:cd65? ([2001:a61:13af:fb01:d424:8584:98d8:cd65])
        by smtp.gmail.com with ESMTPSA id cw17-20020a056402229100b0054cc7a4dc4csm639917edb.13.2023.12.07.03.07.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 03:07:27 -0800 (PST)
Message-ID: <604fb326-61d5-4d67-b009-649ece32a1e9@suse.com>
Date: Thu, 7 Dec 2023 12:07:25 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: Francesco Dolcini <francesco@dolcini.it>, Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>,
 =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>, davem@davemloft.net,
 edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
 linux-usb@vger.kernel.org, pabeni@redhat.com
References: <2ce653b3-c553-457f-bcbf-9fce36f82dff@suse.com>
 <20231206162353.53767-1-hiagofranco@gmail.com>
 <c2ee0ecf-993e-4736-b005-588fa6ef51a3@suse.com>
 <ZXGYgfFhVhlprqco@francesco-nb.int.toradex.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <ZXGYgfFhVhlprqco@francesco-nb.int.toradex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07.12.23 11:03, Francesco Dolcini wrote:
> Hello Oliver and Maciej
> 
> On Thu, Dec 07, 2023 at 10:41:51AM +0100, Oliver Neukum wrote:

>> OK, you are using Linux on _both_ sides. Interesting, far from obvious, though.
>> (Putting Maciej into CC)
> 
> One more data point. If the USB host side is Windows and not Linux it
> works fine.

That suggests, but does not prove that the issue is on the host side.
Could you post the result of "ethtool -S" after a test run? We should
get statistics on the reasons for transmissions that way.

	Regards
		Oliver


