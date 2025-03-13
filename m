Return-Path: <linux-usb+bounces-21719-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40824A5F43D
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 13:25:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 75DD1171C6B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 12:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5BD3266F1D;
	Thu, 13 Mar 2025 12:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JjkD1jE6"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709991EDA33
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741868697; cv=none; b=KvEsqqxQXOf7dFFs0D/rS4X4XWIKgkkPQviCNiw7WpXA4DFTZoSDFb2nIiJVGMN40BbbbUP4iikb3qnO+aoR7mx/CmklcTBvP6HmI1kCcvby+MKu02I8z34W95fHoSk9ytA0zVhhLM51X5xoI3RwXybhMkWivlxP579bCYMxw4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741868697; c=relaxed/simple;
	bh=3piGY6Mos9lWEASypJlgl6NU89/tZvm07nsj0xWexd4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TA08Mi1z7OKnPrEutXP/zLk6w4S3RkyFhXccH2iWhKm8vJDLaK7uutnEG6bOjnvAzJiTLnNJiC2ktqcXP0GSa0jTr7rNXhWHbka7XHIKhRkfB/LlNnZZ7z4cmYg5mz1KYjPJIp7JF9+Akb7LV/9pZtN5tN4auPo3B+scbJ9S8JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JjkD1jE6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741868694;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41pRJjFSQunsUf3a0XIIQpPveoWhQuMHRR8nqruq92Q=;
	b=JjkD1jE6ZWC9EmxhTFooXcaD5Iye+3cS5piCyqdB1z/eqSWJsFDH63Ggb8mjVXaMgFA343
	PmkQyWMS1UFdIPug5kQDcjVyR1VEVCmTBwJVbyXdY6cWoJ/gptwBgD0tjFdWB60VC18p2J
	qn1PLYJRMUUDkdnZPt+kLIkieTtcj3U=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-0_KDiAtQOHm5Y5Sur0HMBg-1; Thu, 13 Mar 2025 08:24:53 -0400
X-MC-Unique: 0_KDiAtQOHm5Y5Sur0HMBg-1
X-Mimecast-MFC-AGG-ID: 0_KDiAtQOHm5Y5Sur0HMBg_1741868692
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so4643585e9.0
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 05:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741868692; x=1742473492;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=41pRJjFSQunsUf3a0XIIQpPveoWhQuMHRR8nqruq92Q=;
        b=i4Z+tGTrwQoKmos4B4vMbCP/iw1jI0Sf/nhYYS7BxTlrbQ9PSQKVwjwlB7PqeQQldd
         ECWC6mUch/yYQXJ9ESs60iNT1rV2Q6VlqGBpz1+448Xx/XwQmm6a+fqhE1sL2srDT1vz
         jH9v/ZYgmtLPl+IkGZB6qXGTJbwAlaj7zOEZQ5VvCFmwkp1uk2AwPpzDc5GU/7M1WKg8
         1X5J8XU5coTQGn2BiBw3Gn5t+eiRwsDhxsoeFTrRM7lR0DWfxziMoU60m6+zv38FdPw4
         Kyq89ud/4ifUAIct+dLkxpIHqpDZmq2xzEzgeL+O6Mhe7czqJh8KkqPaXvFXxU3PkjWo
         gbzA==
X-Forwarded-Encrypted: i=1; AJvYcCV9sLrEgWUzwy0gQxnnJ5Eehk6OSWged4lXX31x+YGaQpCD5jHDRm3I/05LNiKzzQH0fzwgFmKMjno=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmbBhghExBYXZc2r5ec1V6C0Wc8+Pa+U1QNh/VUS9KNUKQFwsj
	lmXHQAR1RmOoOThv96G+90b6yBbueGamN1pUIGvToaSUEhyLP3C5MPTT3lqEsr5o7Gsk6QfRDn2
	gMlJybNQk0dXSK05li2F0WYlrQ0GkZTL0qqrA4FbH7+H7Swg1H42amNO37Q==
X-Gm-Gg: ASbGncuHOfDbyJ9NTvX1kuLtLfVfBLPQNT528GxsF5ZlYrmAFjg/X73yY+KvxI+PHTJ
	q+y6z7Vb3ZfHmTUdhpRLPXrHBfbhehKCFCFGlmL2RaRnFofGO/1lQzy2sO2AXOnPC5B933NrZK/
	gw3n6GOtp4GtH8rxQBEwMwKj/EjVGPjVDm9S1n/N6/RsOosusEWCSk5+7RV9GR5CC/jja1H33Ua
	pjE5UJMJsVYvTgF7IG/YHsPYI31QCMZ5Y05rzBprJzeaANzr2eiNvlulMJSQw3u3OooXe1T/rqM
	qTWwL0aHUnKsLRc9QCVekK+Iro+rC5pvxucF/O6F
X-Received: by 2002:a05:600c:3545:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43c5a600909mr210437685e9.7.1741868692011;
        Thu, 13 Mar 2025 05:24:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFTta66vARQNmkgMsRaEzJLNRUO1YbSPiH3Ss6xOHBxWgJdBqQI4Hnl8PBkX5FvrFzJP6jwiQ==
X-Received: by 2002:a05:600c:3545:b0:434:fa55:eb56 with SMTP id 5b1f17b1804b1-43c5a600909mr210437455e9.7.1741868691619;
        Thu, 13 Mar 2025 05:24:51 -0700 (PDT)
Received: from [192.168.88.253] (146-241-6-87.dyn.eolo.it. [146.241.6.87])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d0a7310e1sm52414735e9.6.2025.03.13.05.24.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Mar 2025 05:24:51 -0700 (PDT)
Message-ID: <932f543d-8fa4-4891-a804-f58a55356ab9@redhat.com>
Date: Thu, 13 Mar 2025 13:24:49 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rndis_host: Flag RNDIS modems as WWAN devices
To: Lubomir Rintel <lkundrak@v3.sk>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>
References: <20250311091035.2523903-1-lkundrak@v3.sk>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250311091035.2523903-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/11/25 10:10 AM, Lubomir Rintel wrote:
> Set FLAG_WWAN instead of FLAG_ETHERNET for RNDIS interfaces on Mobile
> Broadband Modems, as opposed to regular Ethernet adapters.
> 
> Otherwise NetworkManager gets confused, misjudges the device type,
> and wouldn't know it should connect a modem to get the device to work.
> What would be the result depends on ModemManager version -- older
> ModemManager would end up disconnecting a device after an unsuccessful
> probe attempt (if it connected without needing to unlock a SIM), while
> a newer one might spawn a separate PPP connection over a tty interface
> instead, resulting in a general confusion and no end of chaos.
> 
> The only way to get this work reliably is to fix the device type
> and have good enough version ModemManager (or equivalent).
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

This looks like a fix for the net tree, could you please provide a
suitable 'Fixes' tag? Also next time please additionally specify the
target tree in the subj prefix,

Thanks!

Paolo


