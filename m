Return-Path: <linux-usb+bounces-4329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 641858183AD
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 09:45:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C961F251D7
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 08:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E7611739;
	Tue, 19 Dec 2023 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Zlj2UcpI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41013107B7
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a233a60f8feso305276866b.0
        for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 00:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702975522; x=1703580322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sAchqug2Q0QSu050yT92NoC2gYfn25CvCo91hZuIXSg=;
        b=Zlj2UcpI8+8clRWAtpztkB7+LKPcLNIUh8fwHG5whUJvo5EsR3MYcGifkMv9+olD6Y
         musw9Fc+01eDdN0xvOPTQaf8eRH5Y/Cy8ui38kZwXGMlfhecLLjrfzBm0pBCpFKltWkj
         qKUhrkp2RjFPyZwIi1W2fwhmVXi46TNV6+cjmSuLgtm0exl2j/OFsEtNazJ7dYSBC2KO
         9G0p2Xd2gkdREuXi83iXq/9+X2QuCxAhpCtj8ch0Mqj2G3Oau83TSKzD7afdmiSwTOOO
         O2drk90J9SCfNKKQYOqups+PjZmz+kas3L9HnCOUyvkM+TIec2qmmvqs46CITkMfWnQ6
         CzzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702975522; x=1703580322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sAchqug2Q0QSu050yT92NoC2gYfn25CvCo91hZuIXSg=;
        b=xQRTnfBAgKTN0hO/fvINqXjgu1zkdUu9mJ2LfPU515IXQg71P9JdyBMuJWMmmyT5FC
         K7LtvfGDoQttcQvxA1wtGArsh17ZuQyuWyZWiYOFfKK9fEY6KCO2pTNigaGtdQ4Wmh6B
         olcfmlL5FICit+o0IiT2qUr9knSNpXf6mDYGQbyXoCA+uk0Iiw5UpX3Kzki5RrgnfJyz
         a6+9t0zKiycSPokZWXAOOTLTKG1j8yTQcLMBDNoCJVllW4lY5KQmEWlWiMMDa5Ly/56I
         cAEcYGKvt2Im/5fKcxQOCZgYCwGKdDK4OMva/D9vayhyDqVImziD00kwxPfNKxOjPeST
         Gpig==
X-Gm-Message-State: AOJu0Yx+dywIpVbhU8RbzqN2lqpt6Sc/SYNlAyq4XWkrcMxvhBq2HVLw
	xf9tdzQsNOLK0bSyNK8sIgiJfw==
X-Google-Smtp-Source: AGHT+IFXRDGWm7R1zywPKBzALLZ3sB4NpOGahshVWs0gFJKFPKkcPGvUhUiQ3xGdqYqPocmL2sVmYQ==
X-Received: by 2002:a17:906:6807:b0:a23:671f:62d1 with SMTP id k7-20020a170906680700b00a23671f62d1mr934615ejr.135.1702975522275;
        Tue, 19 Dec 2023 00:45:22 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:86:2ba4:6c05:7fe8? ([2001:a61:13af:fb01:86:2ba4:6c05:7fe8])
        by smtp.gmail.com with ESMTPSA id js22-20020a170906ca9600b00a2371908713sm694157ejb.181.2023.12.19.00.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 00:45:22 -0800 (PST)
Message-ID: <0603f052-df86-4803-b7f3-4a263d7ebcf2@suse.com>
Date: Tue, 19 Dec 2023 09:45:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Hiago De Franco <hiagofranco@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
 edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
 linux-usb@vger.kernel.org, pabeni@redhat.com
References: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
 <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com>
 <20231218205953.g77zdjsojrgjak6a@hdebian>
 <CANP3RGf6OEA1kksEPSKd1A4U3P-GEp1ySnhi_X1qB_9KeQfMYw@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CANP3RGf6OEA1kksEPSKd1A4U3P-GEp1ySnhi_X1qB_9KeQfMYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 19.12.23 00:00, Maciej Żenczykowski wrote:
> On Mon, Dec 18, 2023 at 1:00 PM Hiago De Franco <hiagofranco@gmail.com> wrote:

Hi,

>> Everything basically worked, without any freezing/slowness (please note
>> that during the test I wasn't using the VNC client, only the arping). I
>> also did it using screen with ssh/serial console disconnected.
>>
>> Although I passed -U flag to arping, I still get replies. Is this
>> expected?
> 
> No. this defeats the purpose of the (since it's not unidirectional).
> Perhaps -A would work better.
> You could also probably pick an ip as the destination that isn't the
> device on the other side of the cable, so that it *doesn't* respond.
> 
> The following seems to work for me:
>    while true; do sudo arping -c 1 -i $DEV -b 1.2.3.4; sleep 10; done
> since nothing responds to 1.2.3.4 on my lan.
> 
> But Oliver's point about it possibly needing 10 or 11 queued packets
> is also interesting...
> though that would be very very weird...

Probably not 10 or 11 but more than 1. Sorry for being unclear. Let me
explain.

The timer should not run for an idle interface, should it?
Thus we have three situations

A - first network packet to be transmitted:
queue it and start a timer

B - further network packet to be transmitted:
queue it and modify the timer

C - enough network packets:
transmit

It seems to me that Hiago has just shown that A works. Lowering the threshold
also solves the issue, so C works. Case B seems to be the issue, yet the test
setup tests case A. That is my issue.

	Regards
		Oliver

