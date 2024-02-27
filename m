Return-Path: <linux-usb+bounces-7134-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F65868B9C
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 10:05:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 20166B234D4
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 09:05:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D0F8135A73;
	Tue, 27 Feb 2024 09:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="F14Kc37D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D183D12FF98
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 09:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024711; cv=none; b=l1ciBreZNgElCsTdTih1MUARnW1D18oxT40b7HyI/MDjwzmD0hbuOcyj8RoCj2GuW6Mosnw1l1VqPIunRBee8k2ssWshk7zIIizdt7pCYWReKAuQu/XxwFrawtLxIKLNyHW1oW7WEl4379brViBHKtLHp6vxzpw5QR7FhBLMmJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024711; c=relaxed/simple;
	bh=WBe6ga2pwLP2qHgi217Nz+cjjBzoXfuuCdkvtlbLF4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CT1oB4bjs0TKJhEHpMYz9VkNWqsEPsO7ZThiSNl+JubTXoKqa02NB24NeQJop64z9mTmnYAniPznEHa1igolRtfRaprW1t5gcl5eTPOQiHTtT0TmWqS1WZ23DGVssnZIac3BBu4f8/c9TZLIrq4tMeZMWBIP1sSo4Y4c4vxMngE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=F14Kc37D; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso4954851a12.2
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 01:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709024707; x=1709629507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rCD6F3e3P3I+Zgk/2guSviAQKEfOfySNcNBt5UHEyXo=;
        b=F14Kc37D4Num9JJ7X0m0kszo6RDhV8CtzHX4Rj3+1qHBOrIAXjE4MN3+cnUdGFyaPk
         nTRzOX1QtDxWi+PDZgbqjMQnZFFF0JcCEq3mrUmUbNJ7c43dijsvAtZciq94eP/h8gaV
         EqtPAaNnrNWoUTTrz7YDTP4JAnXMxHFwtQTGtdV82u/82iS95dI6Qzv13v8IWRLcEzZg
         aCPN/gaG7CJMODQvIidIMKKFfoBID6rb4nvVPSMZpC5cgDEFJnn6h4yq+0MjkHBubwGn
         cSL7vetUlu4kRhHgRofrNBSdKFfkjd5CH4H4swtfmUqZn42R/+xuD9CxTL2mpWilYmst
         uhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024707; x=1709629507;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rCD6F3e3P3I+Zgk/2guSviAQKEfOfySNcNBt5UHEyXo=;
        b=h4IDdB2FfPBOC+exMynFNvOcc7ZdS1jHEVCdusdMPy8ggwa/Eg1et7kK591V4G8nq6
         jLrgZ++Gy2lGsQD/wyaa07BJ/iYuA6wxchAO5QB4wAe3B6JkNRxvmLi2Rngi2tWvAX1v
         lJMgSbZMBesUzVLI7KVWvyKxiUS+gyXkpFv1IX5BHp17wFagdurnn8UBiwo6DGD8Qxps
         wGO7y4JArgulD4A33sNBo3PZ6I11pIIB/VPTyfxtbGwC7FG4o5dgrW6FfNMujguhRxzY
         R1OROxwLDQupCRB7IhAcJZJsxwKPy2+s+QVvpB8yHTN9VByyJVADIJSQXzq2EGhvSHCI
         djAQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2XbihxpJy7WG7WKnh9POjIs+qdfE2xaqD4HNiu7c3AvO3y6FyBu9loQNU5XvwPzH0eAn3LQ4Hfkns0Hj9LMmbqFoivh68NYzy
X-Gm-Message-State: AOJu0Yxx5su5SvJpgpj/tnAxGQkjNMRI4APaAttjuuon750hF3DovCcg
	BDlsC82BRzC33J2nC17i+cEQjfKaVpf3ZC2B+2al4zVkJfpj4Vcd+jQ8vzO86vk=
X-Google-Smtp-Source: AGHT+IGmE8MK4gkN9ZDkWYcSJldVKxnmTp00nCPleWmQ8of4pKV4ikWCBrLzgOeJlaMUry+8f5Wkfg==
X-Received: by 2002:a17:907:9950:b0:a3e:bd4e:c87e with SMTP id kl16-20020a170907995000b00a3ebd4ec87emr6151888ejc.36.1709024707227;
        Tue, 27 Feb 2024 01:05:07 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:d8:8490:cf1a:3274? ([2001:a61:1366:6801:d8:8490:cf1a:3274])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090603cc00b00a433f470cf1sm552971eja.138.2024.02.27.01.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 01:05:07 -0800 (PST)
Message-ID: <8f4fe820-2385-40e7-a3c6-51102e57acad@suse.com>
Date: Tue, 27 Feb 2024 10:05:05 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB:UAS:return ENODEV when submit urbs fail with device
 not attached.
To: "WeitaoWang-oc@zhaoxin.com" <WeitaoWang-oc@zhaoxin.com>,
 Oliver Neukum <oneukum@suse.com>, stern@rowland.harvard.edu,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net
Cc: WeitaoWang@zhaoxin.com
References: <20240222165441.6148-1-WeitaoWang-oc@zhaoxin.com>
 <3ff16f34-07a9-4b7e-b51d-b7220f08d88d@suse.com>
 <41daf1a9-590a-e220-84a3-648eb895272b@zhaoxin.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <41daf1a9-590a-e220-84a3-648eb895272b@zhaoxin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 22.02.24 21:06, WeitaoWang-oc@zhaoxin.com wrote:

> Maybe, my description was not accurate enough, here not add new return
> value to scsi layer,it just add a case to tell device is gone in the uas
> driver internal and the ENODEV error code not return to scsi layer.
> Here just notify SCSI layer of device loss through flag DID_NO_CONNECT.
> This is also hope to fix this issue in the uas driver internal.

Hi,

sorry for the delay. OK, I see what you are aiming at. Could you redo
the patch with a better description, like:

We need to translate -ENODEV to DID_NOT_CONNECT for the SCSI layer.

	Regards
		Oliver


