Return-Path: <linux-usb+bounces-32317-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA4D1D19A
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 09:27:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D8CC3004E29
	for <lists+linux-usb@lfdr.de>; Wed, 14 Jan 2026 08:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361737BE99;
	Wed, 14 Jan 2026 08:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="KIJv+XfQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C0B37E2F0
	for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 08:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768379226; cv=none; b=p3qFmWprBlOMjtylX0yYq7BEwtud3VpgRfRFVQDe1XnGk6KDrf2ypPQ3Fq/P9x3Ro4EhGD4sjTwboSTR0CO3tT75QhR3s3QIaqfP8YQ8lHYGiXp3AlJI9IjKRf8LFR7R8tugSxaFrExNxGGCNzR6Ded+ncLXe0jOlgYEvyRm5Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768379226; c=relaxed/simple;
	bh=bXPEH5GUB3XZXpP2cXcCpUkKWKiO0BnarVi236usIBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NEzCUOlMFJMgoHb2lSNh8UOoeCBh++QlV3vGtYy/4bhcNbBUQVgXOTrLllfm8tzBSwMWhKexyTD3/2s/nvjTWG5NW1EmUytjbyFycFSMv8qZQH1KkKQuX9txQiv8bz+uu7pGzXa/7T8U/kfqeLnqj5CqUKkYX9EA00Uzf8p43pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=KIJv+XfQ; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a4fc95aso3554695e9.1
        for <linux-usb@vger.kernel.org>; Wed, 14 Jan 2026 00:26:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768379216; x=1768984016; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8K23CFClWp75rW+8jGqnl/yM8nt6L8R36CbrPulribI=;
        b=KIJv+XfQg09jJm8w2oI77Wouz8m8qSFF64V60N/NtoGAWphoOQND32kf6vVEA4ZKMB
         0cTByerU1dp2V8hykv3V4NCutKAc3lAteRYYzDM35U5l3sTYzCiRMw1evJo94YoQ3Hzc
         wFn5iEgHaz6twHWaL94NHPHZLDDM/hQbafgkl5KUAcbIj2Gk8kR1xAZLkqlFQ+Brb9OS
         jTw61vxrVLE8Dx+XesdWiY19V5xJUiPsTYsIV4WnuppWtdZxUBHzQN5V4mbzj/1BPJFy
         HZCH+n6hyppQLnjHRy3yNoNBOzwucmghJDNLTlGxqqSsNwtw0WEC/ZBy10Nqkiqw49d9
         Dlvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768379216; x=1768984016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8K23CFClWp75rW+8jGqnl/yM8nt6L8R36CbrPulribI=;
        b=X949Gc51fdu+QdfkQ9LXAnRiAcOInfhzS0hIvpmSAVTKu4/5gtvxAXQhDsvACAZXHB
         HxWZlgqDIozq6jFUpKUOmLOqUMgVmiK9h7p+FIABCqgnf/nsuaPeDLKSwBF4HMJBPlw4
         nHxOw5dVJmdboE9B9/l4AprxYjzH3+J0GlXJd6wWhOs85Fvbjmp5g4G0yVHWQfwE+bCW
         IO2IszqOsdKv3qaeJkvRrNq+Z8A/uIOFTc59FDz2FSvNMu3IEINmOI4vSoO2CjTL6P/9
         buJ7Mapt2Y0yRU1czKTHQrRarWccr47fw1u3tcSN2FGeaJtOXnCN7zShv2HdOfNVsqFh
         Q/+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWT3vt0GF2OY8VP2CpTGbzTX2rkqxWTWx43W6DxmHcE6Knwb/QdAKvC97LQeDWbBuiYU54NGEwd2II=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDygf3uF6WQdi100zSBdzkt7sTvthJoW5izRDhojAAOvBC4Wid
	J7bB1nf+NeofHxmmM3tHnVosMxtOxVr6I2F3trwWGIX/uiieh1WhE9AB9KFFVLKtK3Ilt2RvcNp
	P9eLt
X-Gm-Gg: AY/fxX5iY3ZgOVdpF6jK/sU3uH0EQU9Uu1LSsxpKSBn8hUkNzkJf3k/qRtVBK3NtKbS
	q66KH4XcQvR+dmehWMPGHI8HXHV02uiVm9Cg202/W9B6IbMkGqSB9KS0RtxC1hQ4Z622AqKTiFJ
	sSMLAcOKs+H2XL3sGR59xaQ+iJV/6eUWHP4cp9ug+72l80r+bPZmnWvudIamA7V2VdJPX/B3gzj
	/DvDFI+om8shy4JXlaGwQx+ZQHjt92XCaGmw8MZSMf6VJ4SLRmCqtuqeO0rZlx9V2gE72MV9pp0
	pGPQdUtaF2A1y1zHvc4uUWRt2LVA+dXrG9J/BY8PI6CejqtSSnTGIVj2Teq9VFktNgwyUfFIufA
	0T6u5uIIzMuIcDrjfVVmPyMsvcxAFUDkXxPMErZLIAQjucbjHALB5w4lu7dj2sUbZVbuxP+Ha8Q
	dlaWjKOdNv9WkH1KfJtimwJo73LL7YhEvLDy9KH0xPtkyhla8pJnZb5Pw=
X-Received: by 2002:a05:600c:c48e:b0:477:a53c:8ca1 with SMTP id 5b1f17b1804b1-47ed7c386e5mr64900135e9.14.1768379216300;
        Wed, 14 Jan 2026 00:26:56 -0800 (PST)
Received: from ?IPV6:2a02:2455:31d:5400:d829:a1a8:dbfd:4976? ([2a02:2455:31d:5400:d829:a1a8:dbfd:4976])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee55c5b1asm16020615e9.5.2026.01.14.00.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jan 2026 00:26:55 -0800 (PST)
Message-ID: <8bed5082-0aef-4dee-8239-c3e8aba50f9f@suse.com>
Date: Wed, 14 Jan 2026 09:26:54 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in i2c_tiny_usb_disconnect
To: weipeng <coderlogicwei@gmail.com>
Cc: anna-maria@linutronix.de, frederic@kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com, tglx@linutronix.de
References: <a53fa501-dff1-4732-92c1-fab8e66ef886@suse.com>
 <20260114081100.830758-1-coderlogicwei@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260114081100.830758-1-coderlogicwei@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14.01.26 09:11, weipeng wrote:
  
> I got it. It can be solved by using wait_for_completion in the module exit
> function to wait for all the i2c_tiny_usb_release() to be done.

At that point the module unload would potentially take forever,
because you cannot control how long it takes to complete.

> The i2c_del_adapter() will wait for all the users to put the reference of the adapter.

That seems reasonable.

> It is not a good idea. We can't control the users. So the i2c_del_adapter() can wait
> for any time.

Who exactly takes references? I think at this point you have a design issue
with the i2c layer and seems proper to include the linux-i2c list.

	Regards
		Oliver


