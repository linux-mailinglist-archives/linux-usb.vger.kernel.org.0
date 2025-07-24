Return-Path: <linux-usb+bounces-26133-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB62B10532
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 11:04:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09048189B2D8
	for <lists+linux-usb@lfdr.de>; Thu, 24 Jul 2025 09:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FD74275AFA;
	Thu, 24 Jul 2025 09:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ULswZ4tH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F43F12CD88
	for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 09:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753347844; cv=none; b=XA5/8EDaUFI5HQEFsbrGYHWl/tRCJEIJw5sawt9PY48KYHxmByA63aS30ESDzAiPuc6Uph5XbmlMxJwX0FWF1uTLP16E8vH/hrqD5zdWa6P5tKL0jEJQBPYzrq6FGohgGrvLDyrxmLvGS9BJlKmmCoIDJlB+JjCOFg0iSr+Oftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753347844; c=relaxed/simple;
	bh=busOX8H+NKP03yel4sfjsz8pkXOKrWf+uaygGkk8dnM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JQwkJTps2UraasueSFIsWnGrRDBGLgrghEj//LDfkUDOmDJF4OlRxX4jJ/FfHMMSBr7bXpfA/mTguVAGIO3+nb1LEDHL6q7mXK2BcFirO1ZQKvexd9EbqDs1rVto8ca8yj4IrXwT++kk+iV+iN1Vy47UMyFXt0lp1LmdS5tK13M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ULswZ4tH; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so776049f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 24 Jul 2025 02:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753347839; x=1753952639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GXfhfh633Enne0/vUw9Tau4IPJhzzP4DhtNfiz7MQVI=;
        b=ULswZ4tHckQnjRHmrd+2wi4l/sUobyZ3onU8+cIweyDNQS6r6LE5A/IfdMudCpQqxg
         ZHxOhHOnCQA1olO06PGudO+ABZjO238zI3h/UeBnMQ1OvSiFgUxGWPE1nhIaHWj+V6aB
         7GZanYiVu/yyLtnFJIRxDu+aRkv+FtG1hc7zMPn7OP6mQeix/3eG8n5Lc+XLe1MQ2OQC
         U2GlORlIPyoPDXwIPSDXx3IBQLvMO37lCdFAHQlnu+mhSyAx/1QXjFZSvY0guHTY2Tdz
         bIDJIqsli67xRFQlEZS3C4DFszT9qvcLYkLg5mpoV7ecLMi9vJaCIVlrTvgCy2MPXPwd
         P2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753347839; x=1753952639;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GXfhfh633Enne0/vUw9Tau4IPJhzzP4DhtNfiz7MQVI=;
        b=XWzk8UMLr3QSqZfeWAvz1qtgfcUZwC5TnxJVVEu8Pqf6zqF19PHj7ukSamTp48MwE/
         LlmrXVOg89V0wLgLXQVaBMOhbq3ae5u+7QSqy6CXOpB0AShNeBR4XnXmigF02SoNmRsW
         YHTulNvKCyRZhrxqfnOrchwk3Ct/MmdBqSxFOoS7kYQenbf8yXEkgd7DYTGxglO8yFxg
         RXUGxbariFrXfbZjQkLoyxVI4vK5x6SS6iCZYoAXmZtxOOtNZ0toTf4EycbIlzylyKo6
         fucWK2gvi84064ogW8q9G8FI3i+YT86ZYme22rJFec+eEs364xw2ccxjo4wUnfUMD0ZJ
         0YrA==
X-Forwarded-Encrypted: i=1; AJvYcCVYWMPxYFbX4KGzyOMcCD7x8ZUgtMBNmK9I6oUHFbKMAXUWg+PwrmR9cbEaG8/XUfGkCLC3WPBUV4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOiz6CjvEEWj0wobHzqc7RooRqo+tXfwPtPS6YAGPi3pua074e
	BdbnHdiM7Y8tJ/981bmebtKbHaj8WCVzqI/aORlvs9wBqT+/BGOBPHdoI84jpGLpV+s=
X-Gm-Gg: ASbGnctBTq7SaI8wonMzFwjPspxsSv4W+vMTLNRVuGoq0IPJGjwKfHfM7ZMkjSP2w/Z
	7n3nP931Jbx55KXatcY/MYmM/40GR72bqmFLaGBfLwAusoBNSjeicpfEAUwtF0zdh5k5NikGTAo
	p7x07zjsbb2S+mvJTFNsf4tTNLXAfuocPTe8SZV+LcZjqAcQDjt8lqD+Jx0wbOqOVgdAWQa0ugu
	wfvFgCwX9r+W+hwiax11cxUJVOUG4bE91Mz4v76zcNfGSAMqpqkEcnRozf6BFJ0vgCeqFwOKPSo
	jtSBAKHVPzxHQuO/Ll44lzENb1Rae4ETpUPR283UM7DeVrm9Tx19MzFP0mEQtTuK1TuT1r/8Xr2
	E7Jcx9nglL1lIv3hPYjyyYYg8dEiJnBRSn8IJb2erpsuUN1UIAxjy9n7Vi2HEdtop
X-Google-Smtp-Source: AGHT+IFSuHIz0mKo1Y9mXwFRqckeYEZ8PDM4MxRGcLaAdkrLPqq8H9KRRvQ3J7qejG7PIF1aTY99oQ==
X-Received: by 2002:a5d:5d85:0:b0:3b5:e2ca:1c2 with SMTP id ffacd0b85a97d-3b768c9e3b8mr5153341f8f.2.1753347839543;
        Thu, 24 Jul 2025 02:03:59 -0700 (PDT)
Received: from ?IPV6:2001:a61:137c:d301:8150:e550:d7c:58ec? ([2001:a61:137c:d301:8150:e550:d7c:58ec])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458705378ffsm12032515e9.1.2025.07.24.02.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 02:03:58 -0700 (PDT)
Message-ID: <afdfb8e8-0d42-4b5c-86fa-e46fed35b80f@suse.com>
Date: Thu, 24 Jul 2025 11:03:57 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usbnet: Set duplex status to unknown in the absence of
 MII
To: yicongsrfy@163.com, kuba@kernel.org, andrew+netdev@lunn.ch,
 andrew@lunn.ch, oneukum@suse.com
Cc: davem@davemloft.net, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 yicong@kylinos.cn
References: <20250723152151.70a8034b@kernel.org>
 <20250724013133.1645142-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250724013133.1645142-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.07.25 03:31, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> Currently, USB CDC devices that do not use MDIO to get link status have
> their duplex mode set to half-duplex by default. However, since the CDC
> specification does not define a duplex status, this can be misleading.
> 
> This patch changes the default to DUPLEX_UNKNOWN in the absence of MII,
> which more accurately reflects the state of the link and avoids implying
> an incorrect or error state.
> 
> v2: rewrote commmit messages and code comments
> 
> Link: https://lore.kernel.org/all/20250723152151.70a8034b@kernel.org/
> Signed-off-by: Yi Cong <yicong@kylinos.cn>
Acked-by: Oliver Neukum <oneukum@suse.com>

