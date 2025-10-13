Return-Path: <linux-usb+bounces-29208-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA9BD2219
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 10:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4D9CC4ED9E4
	for <lists+linux-usb@lfdr.de>; Mon, 13 Oct 2025 08:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2AE2FB098;
	Mon, 13 Oct 2025 08:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Aw5SJ3mt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D232DFA26
	for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 08:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760345203; cv=none; b=rkCLBHV3y+yqtXd55E6/cVir8S2GwGTu+5cM7GE42dLaiKGdsYvAf3tIC4UPNBbuDf+tMKGa0kbnWpO1G8CrYpqTomqzQ3Dd5JlmzI1cSHlJDjoRIHPCgGDiFRwzvgSQe6oIomiVCbHTAC2ZV+7FpGgucKBOu6yzWhMCeWVYmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760345203; c=relaxed/simple;
	bh=dgMErCroAkIlF7WPvGESH+X5fDqNzmJ+IjrjXyQiOwI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b2plyKD4XP3vBTmSPjHI7swadoPqRZVrJhqSGs2Hw58EhoQPbu7tvcgFOEboQ8GrS64q+DO1gJPlupBvhYAgZTpFs1PriI73aPiOy3/aSQtalHQFlKm4H/7x0zJjgxsndvwh6jha6CnT+58B71DjJJxZomgYUlGSNBuH9vP7/QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Aw5SJ3mt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4256866958bso2127710f8f.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Oct 2025 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760345200; x=1760950000; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WV1b6QmUQukySxftL/tEewHE333j2DgRF2JqWMsSNfY=;
        b=Aw5SJ3mtqRegPp/YjCezx5YJ3MH3x8EglwpChi9IiWxDhKmTr4W5SU/OcF6inWziQ0
         kEj0oiLzSpD91p8B/TzSCn4LMiBNLeiUJrs2v317ETNLFxGCtqS3Vk+dTb3Bh1DsHmyr
         ZV+H7ggPgFkAAdwDHxRXywMTg5fBdbnPo5bupeOVVxbtb5CXIhqbEXYzpc/bOmiHN9OZ
         7Wvi/9l4A6TBjAfkOUKu2z5ZDsVLv9W2fzzkZf+AZMEfebdVYHvnT012Sk+Hvf3L/YcT
         gE8hIz1uBsrPDIkcY/qq3pUkNdhsNG5PQfjQ5bb5kJt4LkN/aKZsnrOShPBzF/N6tYxL
         ns/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760345200; x=1760950000;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WV1b6QmUQukySxftL/tEewHE333j2DgRF2JqWMsSNfY=;
        b=ebcwVRC+fQEoP4kEi+gnnslI/wafI2A4Dp3r77HSov87CQPeqF95zhmKqSubeAsgM9
         /8l+/yc/PC1+ZNaoBn7rwfdJ2Kk15n0w7lIvZuvgZ2uPfYkPr2pXhNVh52FMhAW8wAv2
         a0WoOeyUwDA0sLP0ns1TqYmrDnVdV0ayj5HpkL5Q0RE60vDu2qtrZm3EGs7Urt4ECfWc
         QSPEq/6pS3f8gUOh8ZGR3UfgmPnrhCGqkNOoeTYZDkiBg0VD1wYLpyT71kDj8BQ5RFBH
         d3hTuvFScN1Ir4uqkOkZ0zi6+Z4CeXz6cnfVTdxVugsTy3Jg7nJgSeu1ZkVjmwIzk+SL
         AweQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvcCX25lapBdpRcLTgTQIV0Gyg/ihl1Tr5F+JaMU/PL3rznKn3fMXy1O2fsITlEOpJ+3h4Qjn90t4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLFe8MVA6BXMyBk/bRlRbMLEnup5ObBGKQrDF5znFBoOqHKk5D
	x1K6pyGebsm3WPkdsd0XiYTxusp1v1yvRhWJik+rTwoUnqHh0SAilCk748iQ0AInIss=
X-Gm-Gg: ASbGncuCIjq+/oRLoOmwwOZyFVCzVp4r6sWr5ptGiAC5hjyJsrSAm7n766J23D2j15Y
	zIUq2cSQ0OyRqN6NrS29a1NyFt1CgZledPnYGi081hkRPjhrGyVw+SI9SGSbq+GH2OHeISJnls5
	ZWfeEuudXCnolNwIlO03pMeda/Lg3k+rw3Uqxk+Ee15/mCWYuVWro/NU2rMaaZbX8fs9eTqZnJY
	EzJBj9CHLQq++l1BTQf43SAaU/JOoiLIAeWH8cIIBtM+p56EYVHAyV85GODtfayo1T7u+tfl2gm
	Mmy0COhrYAZ4BsPNf91QO3EudZ3EobZI4+223by5mTMh1Zh/NNQAI1SBxP8YM2nM11dcAw3PUqZ
	67JDxTmm4Bgnoc+A4j2b6h6h7918LFo3fmFetpdTJK7siVtGaVJQbJ2k4gzSy4yS7FTbuuo3PJQ
	TKDQ73DF5eUuDBKOy+gQT4
X-Google-Smtp-Source: AGHT+IFj9V88YG1sQXMa1M6PD2xfAMOlnVV7fozH/bdvXdddiaVsIQVT6EJ8PC6nDoZ3umGmvjS8OA==
X-Received: by 2002:a05:6000:2082:b0:3ec:3d75:1330 with SMTP id ffacd0b85a97d-4266e8db3f0mr14224546f8f.52.1760345199909;
        Mon, 13 Oct 2025 01:46:39 -0700 (PDT)
Received: from ?IPV6:2001:a61:131b:7001:9072:e882:13e9:40fa? ([2001:a61:131b:7001:9072:e882:13e9:40fa])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce57d3desm17302057f8f.7.2025.10.13.01.46.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 01:46:39 -0700 (PDT)
Message-ID: <09517b84-e38c-43e4-b8a0-75291b2bdca9@suse.com>
Date: Mon, 13 Oct 2025 10:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] net: usb: ax88179_178a: add USB device driver for
 config selection
To: Michal Pecio <michal.pecio@gmail.com>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 marcan@marcan.st, netdev@vger.kernel.org, pabeni@redhat.com,
 yicong@kylinos.cn
References: <5a3b2616-fcfd-483a-81a4-34dd3493a97c@suse.com>
 <20250930080709.3408463-1-yicongsrfy@163.com>
 <20250930080709.3408463-3-yicongsrfy@163.com>
 <666ef6bf-46f0-4b3e-9c28-9c9b7e602900@suse.com>
 <20251013075937.4de02dfe.michal.pecio@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20251013075937.4de02dfe.michal.pecio@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.10.25 07:59, Michal Pecio wrote:

> 
> Would it make sense to swap registration order?

I would say so. As a rule we should probably
only switch devices to modes we are positive
we have a driver for.

	Regards
		Oliver


