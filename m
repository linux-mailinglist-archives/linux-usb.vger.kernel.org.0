Return-Path: <linux-usb+bounces-7614-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 67EBB873D62
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 18:21:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13C6AB21F54
	for <lists+linux-usb@lfdr.de>; Wed,  6 Mar 2024 17:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D93813BACA;
	Wed,  6 Mar 2024 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Rvzs4PDb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ABBF137935
	for <linux-usb@vger.kernel.org>; Wed,  6 Mar 2024 17:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709745677; cv=none; b=jCi2PiGL3ubXpytlcHnrzNN68viqkeVFH2hB1Azm2KFwHVmhgyuFtfn4hyhS4Z7lwNI8Rvssajh+sGY09DRYFiWNNlGOb3dnYf0QCErKq5imHOFjpTaoHo0yOFWnAo1eNObIxi6R1Nnmw1IuAU3vZsNcL0NKuw0Av0Vr8HXKdSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709745677; c=relaxed/simple;
	bh=49Up81ZbgJmdwa8GIlUFaFyVt+xRUPlfXB0cFDd2aWQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IKSSBheXkTppIj+tZ1yOBuDZsE+h0zeqsF3/Ep0oCmJVYSt9TV8IdSthBwml8KwJbntwj7n9MNoTl/AINsB/pHhuBFbbTbp2AT7L2bcWNan9sqG3Sbgz/Q7Xc7GO4jYFw3+3ctbruDy0Ov8fGydLkILeSR9h/urW7rlKSRrJy8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Rvzs4PDb; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56781070f38so1939146a12.0
        for <linux-usb@vger.kernel.org>; Wed, 06 Mar 2024 09:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709745674; x=1710350474; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6b7AEWTHQqCnLEs2wSNzarO+p6XqtsGbbdwNY0/h8HI=;
        b=Rvzs4PDbtj0uEShGTE53Zz5GzYS49MmtWlrSCuDcS3S2CJbozuKGlx9T7cwn7VxZsq
         hD1aa7eDiMkVKOmVZnaG5m8b8ZD3YnkhGNbTIuo5nSeswrSK6mPIuJpPr3rhB9uU9XdC
         AjqzSFiU7OUvSL/3oPjbxheXtzTk5SDiek/CexVRmlmkr524jRjQ0VC6Hvj6VynEjjFe
         5apTAeNm7FrCwNucHGNWvpvXl9JCMesDkXWRQzClD56T9SCoFwyh23EFrIpuDDKULdJI
         45yjIm2jVMCoz9zgvSaGZQQgj8wDCUSnRF/8o7tlN4vdLFbUdfKk29h0iqTu87JV92Zb
         7yrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709745674; x=1710350474;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6b7AEWTHQqCnLEs2wSNzarO+p6XqtsGbbdwNY0/h8HI=;
        b=geDEZtod9DeWaRO50PB0nwJ6EVxagv4/7hjU3EnwJZV7Pf97Y0Jm5ydqInl2zXP9Si
         p5MM4xtZmByeLax3vaHyEcTWolYY89vCQjzysgNh5hgtbz8eGiWcks059HxJ+2glHftl
         oAtVdJWFXModI6zfPoIygRpAvTOaCYG/eVrtyj9LDTeVtqOzFwGuNBnHyPBQ/ZQhwSR2
         1UMl6JDnJ+kkkcSunHXkR2NNQpLlNvfTxI9pf2nhEZvSRaxYhk4SAPSGwSKEXrhYdz6W
         1gWkuQboI3ccc70EI3AnCY6Q+vuVyOcgdsErkTWE0IicPi6NCFytK00eD/cucsrSZOot
         CQaw==
X-Forwarded-Encrypted: i=1; AJvYcCVGhwiBhZflLUF27grFfTr4Yq+dYjeY98gCNaHeZ35F2UBQozmtXAMItWYvdjrsUcpzqpaYOnlS7JRpV3fLjheOqsdpQTAOA4Mp
X-Gm-Message-State: AOJu0Yyxzkle/thF2c15uEYoZQOEpObqfzxOv/RJf6ILIrkd7UZ8Eg+U
	7pJ7KrE52aqfNMXSNeWKMpE5CzIcvGsNo27DdXwTMXvEgI3q1bV1qcgjrRZ654U=
X-Google-Smtp-Source: AGHT+IH8FAZXjKs24NTijeBCoQufQg0eKtaUfx+QDqRTEpbcRSgiDnextqhBzmGLzu/d5moJUDFSxA==
X-Received: by 2002:a17:906:b250:b0:a45:becb:6e3c with SMTP id ce16-20020a170906b25000b00a45becb6e3cmr1678840ejb.35.1709745673791;
        Wed, 06 Mar 2024 09:21:13 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:b2db:904d:e0b0:46ec? ([2001:a61:1366:6801:b2db:904d:e0b0:46ec])
        by smtp.gmail.com with ESMTPSA id fw17-20020a170906c95100b00a4576dd5a8csm2978506ejb.201.2024.03.06.09.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Mar 2024 09:21:13 -0800 (PST)
Message-ID: <22bf5a02-7bb7-438e-98ce-25e3bf805b2c@suse.com>
Date: Wed, 6 Mar 2024 18:21:11 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/2] net: usbnet: Leverage core stats allocator
To: Breno Leitao <leitao@debian.org>, Oliver Neukum <oneukum@suse.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, horms@kernel.org,
 dsahern@kernel.org,
 "open list:USB NETWORKING DRIVERS" <linux-usb@vger.kernel.org>
References: <20240306142643.2429409-1-leitao@debian.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240306142643.2429409-1-leitao@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06.03.24 15:26, Breno Leitao wrote:
> With commit 34d21de99cea9 ("net: Move {l,t,d}stats allocation to core and
> convert veth & vrf"), stats allocation could be done on net core
> instead of in this driver.
> 
> With this new approach, the driver doesn't have to bother with error
> handling (allocation failure checking, making sure free happens in the
> right spot, etc). This is core responsibility now.
> 
> Remove the allocation in the usbnet driver and leverage the network
> core allocation instead.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
Acked-by: Oliver Neukum <oneukum@suse.com>

