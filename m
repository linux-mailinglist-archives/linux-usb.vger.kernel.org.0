Return-Path: <linux-usb+bounces-26098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E63CB0EB95
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 09:17:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAEDA5665CD
	for <lists+linux-usb@lfdr.de>; Wed, 23 Jul 2025 07:17:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F867272814;
	Wed, 23 Jul 2025 07:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A8RjlQs1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08F4F42065
	for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753255027; cv=none; b=nq8PIje+2mb5k2YitDwBhOv+kuCNgvkagwUN6X5oih4HuUzxOTL1DxUY72EVAaLuA9PTnz3kwkJd+cRIYDmLVcvxoVRvtbXYH9ZvK3Z9zvurlZ36xvXRps7B4/BKm8st7UVEX6repnxbpx090K3aqW0D//x9TOzD/2K61ZyGARw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753255027; c=relaxed/simple;
	bh=dCIQ9pi8CHnrcgbOWkn13oZfNaihHxqtu7TbF/rVHjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bXbUBET82E3TV2c0isDZo4XeXrOPOsgqreq8D7wROzzGuDcmMp9ZvorIdeGeUgsKadN3qvIn8yDx6CBirLVn5XAxaiV9YXrP865PR5YSPvieP1bSmUfe73CIwYpjkc5WdXzgQMj2q4ChaRdoOxCAGPhG31CvTE2mA2C+GBLcpos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A8RjlQs1; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ae36dc91dc7so1020376766b.2
        for <linux-usb@vger.kernel.org>; Wed, 23 Jul 2025 00:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753255023; x=1753859823; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sjgCzalKQA7mynglTO8uzWQ6FH//8k7oECe/6Ke+2Ts=;
        b=A8RjlQs10BiDP+CFxXxv2igTh0+iiN9WhhqxjM2RUzzpgw6v83/O6/gl7pRfKl5Lij
         Du76sBn5z55ZHdqUFBgXbq5qPAHVRggZSIOVUmjOU2kFTsqkfgIwPigAVSUBlhU+ex1p
         ewNYciw+UWhylK+amcWGpJjhs2275cVcSLHFzmvvvePTLMmvGc9BBFu29t3JilHevCW5
         e1JvxhpFshz4Kvqa2LQWgDMn1c6U0pRH26QTTs6kQ6oMHdYMm+E/VUF9GfefEsHLQHdW
         rhIoT2/8CN+CaoNdqZ/DlToY2Lv5vuOo/05VIuQA28CT693xkFJHJKl35eL2yVNFfW/e
         ZwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753255023; x=1753859823;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjgCzalKQA7mynglTO8uzWQ6FH//8k7oECe/6Ke+2Ts=;
        b=BvwEErtKDvJPBWQbiscNvDH8Rn+AfJC9oqBdvlCkoNvhd9Wj4Pie4BVrMa0y/qSTvK
         E4+OZ1ud4szv18Ieo1ZyW9tH07HYQIHP7oazKmjsNi3Fj1Sg2shYOfpQNosAS3DwOEyu
         12ZzEdcC/nPL1uh12nkD4yPSkOhqW68f4mc8xp0Z/tbuUauMiYj9XpkwKiMu/tNhyDbc
         dt9xanfi47jUM53ck8gWCtjdtjbgStL3I6qK6/irGcpdJsItt3RGMqmcGAbe69HULw60
         Z4uVFfq6+Bq8kDaTSpvfuJBCeft9BpXBkInRuXAzE2FUNaRflE12UbV2d9yzs8a5OLab
         54xQ==
X-Forwarded-Encrypted: i=1; AJvYcCVubOumswM7nYgo6xLe//BljWXSBaUfJ8q9UA6AoZKzB9uukyLrJdQOPBNkp9BRH700tU3aGMOvZmw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySNw2h47TDq58PzgJWmWK0PeMCGJFue+io59D3feaJfzuGGO24
	7oqyuzkECTqCiyPbAE5UdHcGU4qahKX5RxLD7mEBg8RVm+bwZV/E7QD04ZAzt3X5hY8=
X-Gm-Gg: ASbGncuk7GHFUEKIy+if5Az5xDqvu1vfDal4GAwNej4rddPdAcQUiej2ffbVV65rq65
	Ka4OJ2yFuAnCKMx2ZBr8dVSZWPX2+PFCAj6RnkGw71Sh0AuwlKcrw/eplkoN61zs5FrM12gj6r7
	yqW/B4u4+xeR6rW+uYx3DUKec9Ef22tQFCOi2gqMU6hB7JAmjfOxXRR6pmPy95a4KbjzuQfLJDN
	5BDNFqg0x0u/vzYumcHqKFemlJtYp7+XPnWG9Ks0q8sb2TkC4Beittt8n+0m6CIJwmD5aAEhqfS
	h9QKHeALQAQeGSLfHbRgXB0P0cYnzaMdNKdUHk4vNpGDmEP6WtllwI4U+3Rj3Dq9fmZ/hbGnH40
	7bSHJsTrtIpQJ1VYqyPOX0z78UBB9q+zODb/g9O24q2q3xOwZlao1iDRtEMLuOtg=
X-Google-Smtp-Source: AGHT+IGuuEyTsRXkgkT9r8mWAZV/qIwG0TNGe8o4GgTqWMhqKXUoMdqq4qg3WnLlEX3qPfrQmAlN7Q==
X-Received: by 2002:a17:907:788:b0:ade:450a:695a with SMTP id a640c23a62f3a-af2f9381584mr172150866b.61.1753255023164;
        Wed, 23 Jul 2025 00:17:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:1375:cb01:9949:2e73:6e1:36f7? ([2001:a61:1375:cb01:9949:2e73:6e1:36f7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c8f59a7esm7916619a12.31.2025.07.23.00.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 00:17:02 -0700 (PDT)
Message-ID: <6373678e-d827-4cf7-a98f-e66bda238315@suse.com>
Date: Wed, 23 Jul 2025 09:17:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbnet: Set duplex status to unknown in the absence of
 MII
To: yicongsrfy@163.com, andrew@lunn.ch
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, oneukum@suse.com, yicong@kylinos.cn
References: <1c65c240-514d-461f-b81e-6a799f6ea56f@lunn.ch>
 <20250723012926.1421513-1-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250723012926.1421513-1-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23.07.25 03:29, yicongsrfy@163.com wrote:

> No, the standard does not mention anything about duplex at all.
> 
> However, Chapter 2 of the standard describes the scope of devices
> covered by CDC, including wired and wireless network adapters,
> among others.
> 
> We know that wireless communication is inherently half-duplex;

Well, no. 802.11 is half-duplex. Cell phones are capable of full
duplex. CDC is not just network cards.

> for wired network adapters, the duplex status depends on the
> capabilities of both communication ends.

On ethernet. Again CDC is not limited to ethernet.
  
>  From these two tests, we can conclude that both full-duplex
> and half-duplex modes are supported — the problem is simply
> that the duplex status cannot be retrieved in the absence of
> MII support.

Sort of. You are asking a generic driver to apply a concept
from ethernet. It cannot. Ethernet even if it is half-duplex
is very much symmetrical in speed. Cable modems do not, just
to give an example.

I think we need to centralize the reaction to stuff that is not ethernet.

	Regards
		Oliver



