Return-Path: <linux-usb+bounces-24114-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 25043ABD9E1
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 15:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C16BB1891AC4
	for <lists+linux-usb@lfdr.de>; Tue, 20 May 2025 13:47:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E132459F5;
	Tue, 20 May 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hfpkv31o"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC61A243378
	for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 13:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748800; cv=none; b=GzNrkwcQqOJ0nF2NY004kgYC1z+iKnL78sVK5XEsG9NqsTusMnqj2dvitkemD6c8V09VVPJmgFzllPvYZvoxmjOMXJk4rJBQpRPdB9X+t/21LSzmqlVS0EsK1qfpOmMCu1yVhSMvP8LRUhQoMlf3hw47fezlUTeLxZXFlzx7CEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748800; c=relaxed/simple;
	bh=HNi/fBupM8V0uCd8n5v5erSjfON7H2afkO3wD7izDQ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kqG4pz+OzadVCpfFThcbsdHRZyh2f9aNKfHP0MJgChCt+ipcsM4BrQBo7jYiKhT52TehfeINw7vTF+whUS0Rj1HKhRFbRnRw6NZX55lBZjxjMQJcWAWmgYRZ28cp6fn4flNVy64r4WvCpynN8OApXSgeLh0XclKmlQmygSnqikQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hfpkv31o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747748797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ttZdwX7pocHD4KH7bapGwxeFxmxnKsH58aUosyTWGQc=;
	b=hfpkv31oYLgWmFKuR/WZ3AOEN5DRv5lk1tp1enWgIonu1AjYuZSfpw01FGgIVkp5XWetBg
	k9zH64kX1VBrzkhsILTEYHMXUkWsMYGf6JN7lsxpfw0r6L8De9MBaw5wJg/oTitfDjf26l
	VsFaoN5nhxOC4TUQo1NohiO155/yNEY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-x8PuFq4QNyuXlTSYkUYO5g-1; Tue, 20 May 2025 09:46:36 -0400
X-MC-Unique: x8PuFq4QNyuXlTSYkUYO5g-1
X-Mimecast-MFC-AGG-ID: x8PuFq4QNyuXlTSYkUYO5g_1747748794
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442cdf07ad9so32979645e9.2
        for <linux-usb@vger.kernel.org>; Tue, 20 May 2025 06:46:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747748794; x=1748353594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ttZdwX7pocHD4KH7bapGwxeFxmxnKsH58aUosyTWGQc=;
        b=bN+vGslI4PvziaLVmMEpg0IAEadIJflhQq2Ei37ybhOliSRI6GPXNthas74uipFVbV
         k6MU5Ids1s2O72EIrCxBFAcECzoKS6rf5IJ623lix1VMI/tcQerFQ0W2/bl6WjaP+Br9
         Ie+ddg3Qw3SX2SOilksuXKFpMVhpR1XluYBLEHbzSeMU5vRx0fKk5yV/wnQwxszaQOok
         +zFOJ0aeCu2wzDt4FDPcVo8hUto/duNUmJG6Et7JdPAqRjMuzFAfiknpWTin7hol9C+7
         fVe4hDpeU7JiDSM11+Ef1T2OXlBvnX0lAykIvgKcux3S86UcTZgUfX8eosyZqdtraWJ+
         5pHA==
X-Forwarded-Encrypted: i=1; AJvYcCUg02LYJXmnAeQi1YctSUikCVdVVTA1sQcQ9rrKx/VqF7CHX/Vr9lCl0wao7Fyprz6fT50qPOaay10=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaPKnaV4d/FAUjK8cQLc7IyYTnsoNCo0Tw0nuwPlPSdPYNaWmA
	x9xQnES11qAoAs72C//l82EBtNiAI3P0qinb/V1pvM0GcIyNawa6pJxq17+C4lPprPW+CIlAFqm
	87lNh85lRYSWrrHa0w2LLdATFdG1lXqnTCmyfCmwcIv3U65dQyfmVaCutRWPey4EcuaNURlPV
X-Gm-Gg: ASbGncuPclJxtVrhfbBRrG7JD7k1B9iw3Yl266M5Rb52ee4smqbhDQXV7c0Jh4PLgMf
	7egURBKtcnFJfYMVlTg6iNVf1AMnU5ckkd6O2YUpHpBHhMJE2ecCrgcVJiZZvNcsA5IhoYjHL6x
	yZms57F2+rz4WJIpmi7R5NAZI0bS7PpswPfKIppBcOdeveQEqr6bIsGwzP3NX1q3IYmikYijhHS
	6cH/zaRtWNZac6ijRgwX/LEFGpfPTfYo2f5W3zZvZGbsXvLM7SQt063MZxCZ5aCvpqxYKnpB4kO
	AYdapPG9L/tXYJIxKLU=
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr167588015e9.4.1747748793771;
        Tue, 20 May 2025 06:46:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEraeeZ8dXT6jFTOV2vUtyjUlfu0PJDbiOGJ7n9ISNv0+w1r+DJhMjQd230y3rw1DDHt2o+QA==
X-Received: by 2002:a05:600c:c8c:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-442fefd5f8dmr167587725e9.4.1747748793394;
        Tue, 20 May 2025 06:46:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d1f9sm16268918f8f.1.2025.05.20.06.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 06:46:32 -0700 (PDT)
Message-ID: <f818a2a6-2c14-4b55-92f4-c55f27010339@redhat.com>
Date: Tue, 20 May 2025 15:46:31 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] r8152: Add wake up function for RTL8153
To: Wentao Liang <vulab@iscas.ac.cn>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, ste3ls@gmail.com
Cc: hayeswang@realtek.com, dianders@chromium.org, gmazyland@gmail.com,
 linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250515151130.1401-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250515151130.1401-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/15/25 5:11 PM, Wentao Liang wrote:
> In rtl8153_runtime_enable(), the runtime enable/disable logic for RTL8153
> devices was incomplete, missing r8153_queue_wake() to enable or disable
> the automatic wake-up function. A proper implementation can be found in
> rtl8156_runtime_enable().
> 
> Add r8153_queue_wake(tp, true) if enable flag is set true, and add
> r8153_queue_wake(tp, false) otherwise.

The existing initialization for r8153 is actually different from
rtl8156. Lacking the datasheet, I tend to think that the missing
queue_wake is actually unneeded.

A 3rd party test would be helpful.

Thanks,

Paolo


