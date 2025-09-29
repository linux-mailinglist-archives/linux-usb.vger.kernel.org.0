Return-Path: <linux-usb+bounces-28776-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0EFBA8E06
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 12:21:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A5F99189D640
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 10:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1383F2FB994;
	Mon, 29 Sep 2025 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Im//W0Va"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 960DA2FB987
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 10:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759141295; cv=none; b=Ltig/bVnKN973Z790172XErb9c+DSaMVqa8emdfLG28tQislXsPg/DI5Y4IAT7MeD2rY8rOsfN985++pZYPpt+W0f7k1Rzf7R36K6yY5isM0VNd6LVSMY5KLAj+PKHxUzVQayi3aB05eN8iQi2LjG+1RJYjh5lU0zbvFy9XniAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759141295; c=relaxed/simple;
	bh=sHzoMkJn5rMuogfvJJiJ1DJ7qKYiNTO4Ufwdd1t8dNg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=otpWoFaiEu7LgDNXOGLW7voG0S7Bwwt8zDRaXo8+Z/9a3Nz13jhKJzf/aFrhSvae1cLXz8qEKfQLMsn+h8IwCD9yfbvh1shORgMW9wn0M+njcMW4V2d1Lqr6zhMjCjAnlW+syh+NXOS6pC+cSRkuIRGV5GQAwo3ypVDSaXtBXvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Im//W0Va; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3b3a6f4dd4so301231266b.0
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 03:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759141292; x=1759746092; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83SCFxQSl2n8uHVURYlncQ6T1axBoOC/n+5RpM43Bq8=;
        b=Im//W0Va4X9unAUA+jaDaArQKRJ1OcYVLX6rGsF65CiK+pv+A6sChWKzczKoZu01Vt
         P1q9+nbQ9bFBW+8yXZp/DDalxI1jmAyh8lyeQwCl3ldmPo1kd5OIQTvmqJka78uq9A5e
         R6/MghNN4Bndy4b7ez8mBTzHSjbEnq9c3+J5xz6g0eRHTzaZNxrAPMWg4P1h2nP9lfze
         KOtXczS2DxYodEflYNEwJlMqbWdRzK/Q5473FkEKqLo/dY0mONen/se9+UqqHkBclbdG
         zkZUihDDPP3lcUPUaRiOKEOs0PP/vyakM8Yvmvo2eahALcqw9w8Ppuax4US6wnuVNROG
         QCgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759141292; x=1759746092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83SCFxQSl2n8uHVURYlncQ6T1axBoOC/n+5RpM43Bq8=;
        b=BO50u1zoz6a6qZtd6nEwfaoql7DitibEDXUSMJIkrr5lfiQftal9Ml+mqRX/vSlMrI
         h4nbqIF5AbYSWaWt81kH1za4pJ8AbbaSwgx2qoXIKPRKGko/cnk3p7LNAHYLU2xy+LvW
         V9QXGmq1RBudUtTF+kiIvHf4bxdHYeJ7Dz/6Q5Bol+ft7c30fKgyawMSYaakgCiqxhZI
         zA9FJi49z281ccrpFWrTX7boFuhoPhIbZ6EoKnMh+/ULCxOOqxw0Jw7LhQdQlo+6eTxy
         hz4ydNJFb3yuM7LfdMZ7kXldsVxqccMdujLYih6yPuafjSTJPv9cOKbk62X3p2jGgFIv
         z+6g==
X-Forwarded-Encrypted: i=1; AJvYcCXg6YyZsZcPNlYfkmJHUPe+9E/viPzB0mKY0zuoJKmw6in8e6GF4g0wEiKKOKd4/dckzgUqB1Dken8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4dSUacu7FQJPjjV7AQy6RuLbLL+0Z05QZYrntxPu0PhkAiD45
	btaYZGYXP7tuXnB4xuxFTjFOQU72wBgoMj+rq7gIR5pXQTizDktTlqIgli7V5hzZ6jM=
X-Gm-Gg: ASbGncvqlH6t6k+H66aCPlAyjIRjUx2D1UQTyeZ8lx/XADSHcYzUHPouwKbE5t1aGuB
	v63g3nQ8HqqU2pK4AjA8RgJKSK8A2LmmvfO6508+XQKpTWbPJz58lUBLV1mEgRIIZj0i7C6o7aO
	JW3yS3WEAdwtTQk4OcLIBbdWEagfDXkMF9cltAMMcS+jr20SJowN1e9F/HQgamXpL3ZUZpeB7Oc
	+NUj2zv5OXFUsqPRepA1V7hhLMrfXZNZEyjeBiYkqbxuV/uWhPY+OnRWmfHf27rbgmYkiwl223h
	8I7YyNBes3f+GlHK6n6gtNZZL4Q9leiY7IxpwPi9P2y/PnHXoxEvLdqTUbKFLXxAwnTxHoA2gkz
	cUsBS6zskc3RwUrnSNCXNI3E9RIl1TXM60Ul+bv7Yd5c2BlL0tsB0ELVK
X-Google-Smtp-Source: AGHT+IHjoH7Yhek7IIwEqV3iQtifKitwK2zUXthJIq83mjDA2PaIynPMn2TL+eicWpseoUaL5N0fZA==
X-Received: by 2002:a17:907:961a:b0:afe:b878:a175 with SMTP id a640c23a62f3a-b34bc9723demr1856639966b.46.1759141291708;
        Mon, 29 Sep 2025 03:21:31 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a1:1:4136:3ce:cdaa:75d2? ([2001:a61:13a1:1:4136:3ce:cdaa:75d2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a36521c2sm7529826a12.20.2025.09.29.03.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:21:31 -0700 (PDT)
Message-ID: <5a3b2616-fcfd-483a-81a4-34dd3493a97c@suse.com>
Date: Mon, 29 Sep 2025 12:21:30 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] net: usb: support quirks in usbnet
To: yicongsrfy@163.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, marcan@marcan.st,
 netdev@vger.kernel.org, pabeni@redhat.com, yicong@kylinos.cn
References: <c9e14156-6b98-4eda-8b31-154f89030244@suse.com>
 <20250929092942.3164571-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250929092942.3164571-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.09.25 11:29, yicongsrfy@163.com wrote:
> On Mon, 29 Sep 2025 10:45:19 +0200, Oliver Neukum <oneukum@suse.com> wrote:

>> Please get in contact with the core USB developers. The problem
>> needs to be solved, but this is not a solution.
> 
> Thank you for your reply!
> 
> Should I add the AX88179 chip information into the `usb_quirk_list`
> in `drivers/usb/core/quirks.c`? (Of course, it will also include a
>   check for whether `CONFIG_USB_NET_AX88179_178A` is enabled.)

That would need to be discussed.
Ideally the probe() method of cdc_ncm would never be called.
But there is the possibility that cdc_ncm is already loaded
and the other driver is not.
>  From an implementation standpoint, this approach is indeed cleaner
> and simpler than my current solution.
> Is the method mentioned above an appropriate approach?
Well, no. Declining devices is not usbnet's job. If the logic
needs to go into a device driver, it needs to go into cdc-ncm,
which would need to check quirks.

	Regards
		Oliver



