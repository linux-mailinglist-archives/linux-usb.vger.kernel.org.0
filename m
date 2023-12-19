Return-Path: <linux-usb+bounces-4341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBA481889A
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 14:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C2827B2486F
	for <lists+linux-usb@lfdr.de>; Tue, 19 Dec 2023 13:25:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E679E18E31;
	Tue, 19 Dec 2023 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GsHdkTyS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0AB1C289
	for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 13:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40b5155e154so57225075e9.3
        for <linux-usb@vger.kernel.org>; Tue, 19 Dec 2023 05:24:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702992245; x=1703597045; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ax22qUSfazP8KkJY5UiieUc8xOcFqmDiRENmJhYQkak=;
        b=GsHdkTySgLHzEBBYlrrgFuJo0RNMOUFSu+j+8JkAcz+GU4ssd6TKch9AtEzFdJym0a
         e8p/Zvh7zVBa29E+w3GMuVSTbk3G3WWJ5Fvwszns+AZRkXzBU6X1gtzEMC5wyabp7jbT
         XDaG037bA7uk4HHlmejijRXniaj19YvyLKkq+63V6andphGSvjc0oai24IJDUA3cIvyZ
         PcBadaUesAOGQfVmEjtytyd3oaFDu8eV5NeXU9isQI4H/8HbWtNqTZtKJRCvoolHS5oE
         blAR8Cz82leJ+eAqTv14qSYUCd9BXZYB8FL3iA1jFZMo2d91rNoLJqfDG5DCifP4cym3
         DMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702992245; x=1703597045;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ax22qUSfazP8KkJY5UiieUc8xOcFqmDiRENmJhYQkak=;
        b=koj/O5ZY9gzbkbcBTLy9nrcvSUHDtsbGFIiRUHeUrPhvnThMfuioEpJ45j76BjLdts
         tiI1e5uoRluWLXHt/HPoEm3p/h2WTB7i+JCzWH1/HH+0CtpG0pXmKukIgItbwxapJZFX
         66bPhvpHXmY3kfGjMogEkVspX4FP3Qd+g4xJDMPugGiHGQ3FcJXi1rCwG2hFZIBIuLiU
         nLPH9ah5QNdg5dek7DqBlj5JhFygWkQKITaffCkCY/1Jw3CLldGBc6f3MB3yGt+Y9hyU
         8dhOuND8v4FLymZVdXdc3dXmNctRrbizBaWjgsOpBVQzsy3PtjPROdsz1MPj8rJ4AxHK
         fd2A==
X-Gm-Message-State: AOJu0YytgSJyfg/lUrthdLjlwAOTgTWFByFl/rY9cVvCu2vArftPpYq4
	XJyHNTEkFnbKrQT5Q81QYF9QsQ==
X-Google-Smtp-Source: AGHT+IG0w/abP2R3+D0F8vYDJMBy7oTi8RmXYYL6kj2YRS6hskiPyw6gL2atcrj2vq+suRn0M3qq4g==
X-Received: by 2002:a05:600c:35c9:b0:40d:23cf:a913 with SMTP id r9-20020a05600c35c900b0040d23cfa913mr541441wmq.150.1702992245227;
        Tue, 19 Dec 2023 05:24:05 -0800 (PST)
Received: from ?IPV6:2001:a61:13af:fb01:86:2ba4:6c05:7fe8? ([2001:a61:13af:fb01:86:2ba4:6c05:7fe8])
        by smtp.gmail.com with ESMTPSA id va15-20020a17090711cf00b00a235a62516asm2275652ejb.57.2023.12.19.05.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 05:24:04 -0800 (PST)
Message-ID: <fb92d7d9-7794-47be-a9b3-6605c52ad594@suse.com>
Date: Tue, 19 Dec 2023 14:24:03 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
To: =?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>,
 Oliver Neukum <oneukum@suse.com>
Cc: Hiago De Franco <hiagofranco@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>, davem@davemloft.net,
 edumazet@google.com, hiago.franco@toradex.com, kuba@kernel.org,
 linux-usb@vger.kernel.org, pabeni@redhat.com
References: <CANP3RGefehSBiFUbaEbLGiaj64JsYbATJhr+i_4ed-xjq2ARZA@mail.gmail.com>
 <70822a4d-a9d9-4be4-9d1f-89e50a8a7378@suse.com>
 <20231218205953.g77zdjsojrgjak6a@hdebian>
 <CANP3RGf6OEA1kksEPSKd1A4U3P-GEp1ySnhi_X1qB_9KeQfMYw@mail.gmail.com>
 <0603f052-df86-4803-b7f3-4a263d7ebcf2@suse.com>
 <CANP3RGeg1NKGcoOyst-UWLbf=j9f2Qj27YbvTBPGMZADaqxeJQ@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CANP3RGeg1NKGcoOyst-UWLbf=j9f2Qj27YbvTBPGMZADaqxeJQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19.12.23 13:19, Maciej Żenczykowski wrote:
> On Tue, Dec 19, 2023 at 12:45 AM Oliver Neukum <oneukum@suse.com> wrote:
>>
>>
>>
>> On 19.12.23 00:00, Maciej Żenczykowski wrote:

> Perhaps.  I've been looking at the gadget tx code, and assuming hrtimers work,
> I don't see how it could possibly screw up...  the hrtimer arm/cancel
> are clearly
> at the same spot in the code where we allocate/unqueue the ncm->skb_tx_data
> 
> (I have found a potential use-after-free-on-error bug and a stupidity
> that I'll send fixes for,
> but that doesn't appear related to this thread)

Yes. Could there be a logic bug in the algorithm?
Maybe it is necessary to also consider the time the first packet
was queued and to transmit if that is too long in the past?

> But the host side driver seems more complex/confusing.
> However, I've not really ever looked at it previously though, so it
> might just be that...

How can Hiago determine that? If you do a ping from the gadget
to the host, tcpdump should show the timing of the echo requests,
shouldn't it? If they arrive simultaneously we at least know which
side the issue is on.

	Regards
		Oliver
  

