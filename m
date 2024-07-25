Return-Path: <linux-usb+bounces-12421-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2576F93BF64
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 11:54:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBD0C1F229D6
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jul 2024 09:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E66E198A35;
	Thu, 25 Jul 2024 09:54:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AQLK2DGk"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8003A171E55
	for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 09:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721901242; cv=none; b=A4mnePJTwua2Qfco2+vHPcj9XAmFFR+WHB+Rp363rdkxUwd6XxbqFvlAHxzLam9VYHekiAJD+1T3fLAolfcG7aFabnN0YpQ6RJ94PeYoRUdVoR5wYcvy47jxSJp/iqtoOHZVXxEJmDH1xmLFBQabkO/XFeiHIUBLul74kg75C7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721901242; c=relaxed/simple;
	bh=TRogKpvrGbqxUvdw8euZYKuVBYuIo9/CTs0zy8grZV4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzDJxZ5hTlauH5/vkO/ylokll1m5IyELB4mEIG8vTDhTDm3Kb7q5w2gMch8fFWd5HwdN0hTPnySRWmBlIbGVjBjAcS5ojj83xsh7mb66TjKMXlgY51WFCDhXOLN+GQaen7NlHKOrrver7gplXXB8QU+lPTYRjkGkLPI9so2NfEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AQLK2DGk; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721901240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Azo1YWuyIM0irZB6B+BIwEhaWJ15+/vkqjauTRjqjt8=;
	b=AQLK2DGkWfGqc1vaUIsptF+7z9EBsrHfK85S4sO2aHnnuSgZQIOL98PWfDjnIcmxk/S+wG
	cl1F8aHGry60K6XCfyS0zkcbxOuZf5jXAdCSLy/Pb97B3f0toKvBRBxCD5RBf+pRIrjhxS
	I9trwIbKuHkKaR19uamMUQr+KyooO9g=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-pQTVF3ySNraofdWX0Z6Skg-1; Thu, 25 Jul 2024 05:53:59 -0400
X-MC-Unique: pQTVF3ySNraofdWX0Z6Skg-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-369c99e4a88so142504f8f.3
        for <linux-usb@vger.kernel.org>; Thu, 25 Jul 2024 02:53:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721901238; x=1722506038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Azo1YWuyIM0irZB6B+BIwEhaWJ15+/vkqjauTRjqjt8=;
        b=SnJ35zYCKGI/cjjODija4vu7Kkwins984RPQYY+A3zSHdyaIcCT2DTKVGK34k+v2I1
         AA2Xkb7yA4BHTLDeG++ed0M6KMbYAnPHni5Pd0ygnST7pWR7lpANUd4fNDvXjnybFf/m
         AlPzB5sYV2bJKgGfYlMfYyAlFt48gjZTD7iBslOtXSXwZ8NoL6/sVVAUfLi+FrQiHGWA
         HxQyFlzwCZ9ZBZnIp596WBcqiZKM1GwBaxYgBEpZsrY0AfhdKo0Hprz0MHzbAJVVhYH0
         qBvZI7Rfd65nda4GeeONDMgMGeM6GFxRLf391EPHbOWuD+ZW3Cd19DHpEO7h0e85ElXh
         2zBw==
X-Forwarded-Encrypted: i=1; AJvYcCWVaFXWK0CmS7IZ8qtzrSQnZLluHS8P8/qFgtDIZNyXbnYvbNBtKQUtozQPwv0Qrq8cKjCmsoGkUDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5YvpO8a/WLni+oSdQ/aGyqJHrlZULcZD6sHb77CdaMdb6jdDe
	gNYhC8TrnrS0UxbRYFfMmiy3kBiiLR54Jbj1XE3U5mBN3wk3+QcUW1XVAB2XF/s2Mfjh9HXDneI
	fQxxshLzhC3jV7pMZZN/EFdOv76OjCb4JlrOnwNYfB8+hdBjhZaXvj4qc5Q==
X-Received: by 2002:a05:600c:3c89:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42805440493mr7672575e9.2.1721901237837;
        Thu, 25 Jul 2024 02:53:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFI9xUvHg0R+EO/RKq9ufzKkJZaoU8wz7XHuGLoen5hz1S74CdRTqMxjnghTCleM8tL0hE06w==
X-Received: by 2002:a05:600c:3c89:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42805440493mr7672425e9.2.1721901237386;
        Thu, 25 Jul 2024 02:53:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:b231:be10::f71? ([2a0d:3341:b231:be10::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f941352asm67749725e9.41.2024.07.25.02.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 02:53:56 -0700 (PDT)
Message-ID: <d3d97260-f840-4ea8-b964-64e36448bf96@redhat.com>
Date: Thu, 25 Jul 2024 11:53:54 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: lan78xx: add weak dependency with micrel phy
 module
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 gregkh@linuxfoundation.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, mcgrof@kernel.org, netdev@vger.kernel.org,
 woojung.huh@microchip.com, Masahiro Yamada <masahiroy@kernel.org>,
 linux-kbuild@vger.kernel.org
References: <20240724145458.440023-1-jtornosm@redhat.com>
 <20240724161020.442958-1-jtornosm@redhat.com>
 <8a267e73-1acc-480f-a9b3-6c4517ba317a@lunn.ch>
 <v6uovbn7ld3vlym65twtcvximgudddgvvhsh6heicbprcs5ii3@nernzyc5vu3i>
 <32be761b-cebc-48e4-a36f-bbf90654df82@gmail.com>
 <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <ybluy4bqgow5qurzfame6kxx2sflsh5trmnlyaifrlurasid3e@73kpadpk5d3p>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/25/24 08:50, Lucas De Marchi wrote:
> if you are saying that the build system should automatically convert
> this:
> 
> 	config USB_LAN78XX
> 		tristate "Microchip LAN78XX Based USB Ethernet Adapters"
> 		select MII
> 		select PHYLIB
> 		select MICROCHIP_PHY
> 		select FIXED_PHY
> 		select CRC32
> 
> into (for my config):
> 
> 	MODULE_WEAKDEP("mii");
> 	MODULE_WEAKDEP("microchip");
> 
> then humn... why is CONFIG_MICREL (being added in this patch) not there?
> It seems even if we automatically derive that information it wouldn't
> fix the problem Jose is trying to solve.

I hoped that the 'weak dependency' towards mii and microchip could be 
inferred greping for 'request_module()' in the relevant code, but 
apparently it's not the case.

The MODULE_WEAKDEP() construct usage makes sense to me, but this patch 
will need at least for MODULE_WEAKDEP() to land into net-next, and to 
grasp more consensus in the phy land.

Cheers,

Paolo


