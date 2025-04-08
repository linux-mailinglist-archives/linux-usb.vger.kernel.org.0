Return-Path: <linux-usb+bounces-22756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B26A80C82
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 15:36:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84FC59072F3
	for <lists+linux-usb@lfdr.de>; Tue,  8 Apr 2025 13:30:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DAE18991E;
	Tue,  8 Apr 2025 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fchfh7Cx"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA913190470
	for <linux-usb@vger.kernel.org>; Tue,  8 Apr 2025 13:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744118962; cv=none; b=jVMJa+qqsQj72hBO9cBUFSUxkhNGUHVUR2A/vFkw7UVDB38AQrGrF6HqFYE5iQfESMGpnWGOHJsdhsyGuo2oFhX/NPbmTQ8kiIyzeiflZkFdhUZxJhDs6rFxUIGH+LI/jyFNsqQidaYq6Nzj0B8b0rrTL8QwepPX4dIbb1nPgp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744118962; c=relaxed/simple;
	bh=3pOUYj6JIOLbe1ljngk//BXwsbh+xpYpSEW8R94B+kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WQpXmY8xXpthUwBgLU1b51zz0pvIhmMe0eFVxqbiTEA3bqzKLwQiMkWbaibu2G2pjXH6vRiQKXbBq+yOAPz7ZwvpbXso4drqvqVM+gF8fLAFKo9aINztQclH8ARDkZVhPlgKReWHo5u2JU5O1x+N7RWFbaPEq2qxIe1pBikkZx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fchfh7Cx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744118959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uBHxE4o+poP6p/ofYoEMxQF6RNUpC2hi/3SExaAVHuA=;
	b=Fchfh7CxL4BW5G00aZPhmFSqEEYWKO9uO2ME6OGUCP9VAyEFtZNxH9z6eOM+vTEab/bbj1
	cPSPg1IYmE8gy9nVhccca9+WJPepGXwXvrN9ER0qL8qE7uTLd4GSxceQ89D8roc+5mNVMp
	ldv8bL3ZNHen3rJfRooroMqTpRcmszI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-504--Xz_GsysNDqTN2Nw5qjNog-1; Tue, 08 Apr 2025 09:29:18 -0400
X-MC-Unique: -Xz_GsysNDqTN2Nw5qjNog-1
X-Mimecast-MFC-AGG-ID: -Xz_GsysNDqTN2Nw5qjNog_1744118957
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ea256f039so46827745e9.0
        for <linux-usb@vger.kernel.org>; Tue, 08 Apr 2025 06:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118957; x=1744723757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBHxE4o+poP6p/ofYoEMxQF6RNUpC2hi/3SExaAVHuA=;
        b=HmuU2cfwo5nRwix2Bt2FBzj5ch6x19yH9LEt3q0Eq4ti6XkHeiaIAPKQdW9jyl6yte
         4qSYdrjIu+ESUHhkRbtlIw5lH/ZFmOnwHCG1+PBG3VDgGZLlBTfLEmF/Z/FGZyyYNSSH
         xqzaCVtsCSYpySKJuEqHRWHduZne5szqNuIwHU82HuM+BXdXIQyXWsfSLQwY+QvCTBgm
         wgKQljSZemKBq5Aqm0Kh+ZNkIVwmehH9pzuHygymyi2tIKMo/sgCBhBD+d08OwFZAkAH
         1tWYoRVlvy2AASJ2zn3sP2muDamNV3DR8ttkQCb+puzr9+5k1XANcuqSNfhSVZKixILx
         Qiqg==
X-Forwarded-Encrypted: i=1; AJvYcCXgN30H6VCG70+Qr7Ij8kWWhmSDJk/oq8it1TMlWLiDFNP0iMwHApMADc9VMmmIH3kNXKaBaa8//I0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yysnpuw9Qc+Z1qADxA2cI99ayepyjA/6EbOypT1pBscXBdJqNTT
	8wVsuJ0wdRIpr8+9sf7UFNURENzYI4i9YwlPZZLNJCkApcvRqFP09hfnEP0ENRE2o0Aesfc8/nk
	1EBxb8hp0PebbE6vxFz42P8uiEL8d8nCd68JItO2XSmZSmDYz/t/MqgksLA==
X-Gm-Gg: ASbGncu848ee1uHp4k3L6wH0H+FJJhj0b8tBFngUb+t+xLiNZgN+gUYI3yPHoExAdTO
	gfqo6WUpa46A7DN3fnVV5QFvxhDCzcgp47InbqeW+R1xuHRjrsUGCKc11cXJbKcx89OQ9SAE24Q
	26shr1afUaE7CrNAHhEZvCvvnXgPgIpW2q+V4fZ9suiiv/LaNR5y5aTbuLTuFPeU/bLTq3VCKht
	9BKlfpQzqhSMC/elSkpglHjvHyb7NTkvGDr8cRIkc+dMzglKMOH/OifxXUVbO/CtjEyzGPtfgFh
	f3Bto+2nlSxIH4rfKxulZZsNVwa9s9HZuOWPWnkI7nk=
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr13769263f8f.26.1744118956996;
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1HpRnEm/6M6CXH6msdauscTzQ/uB3jUvfgXW4D2EwTpNq9WLAloBhZWMlPFT2ix4Lmb7tOg==
X-Received: by 2002:a05:6000:1a8d:b0:39c:1f10:d294 with SMTP id ffacd0b85a97d-39d0de28a44mr13769230f8f.26.1744118956594;
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
Received: from [192.168.88.253] (146-241-84-24.dyn.eolo.it. [146.241.84.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f0e5e8dfasm26993845e9.27.2025.04.08.06.29.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 06:29:16 -0700 (PDT)
Message-ID: <d5e03a72-bff3-4df1-91ed-6916abaaa0ec@redhat.com>
Date: Tue, 8 Apr 2025 15:29:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH REPOST] usbnet: asix: leave the carrier control to phylink
To: =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>,
 netdev <netdev@vger.kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
 Ming Lei <ming.lei@redhat.com>, Oleksij Rempel <o.rempel@pengutronix.de>
References: <m35xjgdvih.fsf@t19.piap.pl>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <m35xjgdvih.fsf@t19.piap.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 4/7/25 2:08 PM, Krzysztof Hałasa wrote:
> [added Oleksij - the author of the phylink code for this driver]
> 
> ASIX AX88772B based USB 10/100 Ethernet adapter doesn't come
> up ("carrier off"), despite the built-in 100BASE-FX PHY positive link
> indication. The internal PHY is configured (using EEPROM) in fixed
> 100 Mbps full duplex mode.
> 
> The primary problem appears to be using carrier_netif_{on,off}() while,
> at the same time, delegating carrier management to phylink. Use only the
> latter and remove "manual control" in the asix driver.
> 
> I don't have any other AX88772 board here, but the problem doesn't seem
> specific to a particular board or settings - it's probably
> timing-dependent.
> 
> Signed-off-by: Krzysztof Hałasa <khalasa@piap.pl>

Does not build:

../drivers/net/usb/asix_devices.c:1396:19: error: ‘asix_status’
undeclared here (not in a function); did you mean ‘si_status’?
 1396 |         .status = asix_status,
      |                   ^~~~~~~~~~~
      |                   si_status

/P


