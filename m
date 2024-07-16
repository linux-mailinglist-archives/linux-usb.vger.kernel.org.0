Return-Path: <linux-usb+bounces-12233-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C9593273C
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 15:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC7D6B21396
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 13:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06EB919AD5D;
	Tue, 16 Jul 2024 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZO4HDa4H"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810EE2AE6A
	for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721135684; cv=none; b=J3xMCrE2VqNoO6fEMAAaTtCuW2m3Bxa5mmC/BRey48wX1ILXFkiZFeP4cZ/0653YLTUPiJNTGFxvqpAi4S26uw9QQ+NLZ18052++2H4RaPeV6GyMFeubIRoV+dkrCGNWLsyEaeuPKzw2unY6flnY0h+jRGWtEPfzJCet2yAXWQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721135684; c=relaxed/simple;
	bh=6dRbIrshTheomuibRAqbFDbRKbFnbPCmtotF4+QiYF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XYn7RSZdng/dqfzZSTC51pV9oXNC5EhIV+8lW8bRXPMv1PwupBuRRR0hISTwxYlbfTNDKesWZ7Pxxw4pEYQR+3A1OMr5K6PJLfoqIreNBCE5N4PNEwyFg83SBCisHtoVw+Mj5kS/+/DcKJTKe4xp5XFLaqbdOyAvETAIwh1LyW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZO4HDa4H; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721135681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0LEDQDLQ3briFZ7Dh19M97K7riFuoWHHeSMgTzHc0b0=;
	b=ZO4HDa4HsAAXKISr4ry6IiL2m143GT8t/0N51a7wOZIMx7o+hzotkrNo+nKgwVqh+slkbN
	XaN/03cQlE1jWv760igXtqFyI6YmtqkXGRhhoSqsWo3hAjwwStAVHoduL1ON4XyS8jTjXq
	LvI96fU+SW3gob+SN/SeokFNBGegAc0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-Cs8yFVofPUuvZxY5zGbSMQ-1; Tue, 16 Jul 2024 09:14:40 -0400
X-MC-Unique: Cs8yFVofPUuvZxY5zGbSMQ-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4279f241ae6so4067415e9.0
        for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 06:14:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721135678; x=1721740478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LEDQDLQ3briFZ7Dh19M97K7riFuoWHHeSMgTzHc0b0=;
        b=Nst9BEGLmTuE9NtInmtFyRlFSw5f7/k3M7Au1QD6JcqUIdau5CqHkrmY41phee29rg
         7z/kI9/MsU1K70wa/p+5u7oJXPw1UnVOvqYMDrHZBlQhQAVpCgcWiVf2zcMP0b1zqMeD
         4kEMHRi6RoP5NFaZD2alliOjJNTOsThtXh2YPUOGy6qymVg1+DHDbC14CWaWVf/hN7hb
         LB9a7NyCqr370sBKZaTH8lvmfAyQB5I7EAmXoL2e7KsAEQGJTHs2thiF0hn5r7KfIVlr
         VcoJUArQob6FwIfJ4LHkBCOVyUFesDpX6zE82ccvphq3ctkOmQHa1a25FtXk2m2aTqAC
         h8rA==
X-Forwarded-Encrypted: i=1; AJvYcCWPqqW5M6CfttKUWbOZY/s/cFg/RNEpWK+wzibnXC7DV/qxAyXvpi408d0SM00kJ6Cem85gQofBj8xXh46zKSVoMfVAwCj9O7xF
X-Gm-Message-State: AOJu0YzAduj2Ze/TJhsgw6hyhRQ1OUEBJnXYMMbitt++9NrHZer6ACnp
	PyOzomxFUoV9/gFZ4r3PXlMg4iG+iK6LAsmbUb5j1j50Ru35ybwhfd9DmrfCzbcNys8Ml2Kl1VV
	o3GbJnZP8tmOSrKNWCCGbEQ2nnNj75Y3PcLAXAfvJp6D+S4sYR9AfYDWHMdoV335+Yw==
X-Received: by 2002:a5d:47af:0:b0:368:4c5:b67 with SMTP id ffacd0b85a97d-368240c5cecmr1297772f8f.8.1721135678528;
        Tue, 16 Jul 2024 06:14:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUbkZufXxQmRD68YJ0BeYGsi3kx+leKWXkuE2NaNvjicZkL5J0TGrRmp7vSDKiJutaHe6Utg==
X-Received: by 2002:a5d:47af:0:b0:368:4c5:b67 with SMTP id ffacd0b85a97d-368240c5cecmr1297756f8f.8.1721135678126;
        Tue, 16 Jul 2024 06:14:38 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:1738:5210::f71? ([2a0d:3344:1738:5210::f71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e93c92sm129511955e9.22.2024.07.16.06.14.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 06:14:37 -0700 (PDT)
Message-ID: <e5603fa0-0755-4b49-ad5f-9f999e8d4e3f@redhat.com>
Date: Tue, 16 Jul 2024 15:14:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 net-next] lan78xx: Refactor interrupt handling and
 redundant messages
To: Rengarajan S <rengarajan.s@microchip.com>, woojung.huh@microchip.com,
 UNGLinuxDriver@microchip.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240716045818.1257906-1-rengarajan.s@microchip.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20240716045818.1257906-1-rengarajan.s@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/16/24 06:58, Rengarajan S wrote:
> The MAC and PHY interrupt are not synchronized. When multiple phy
> interrupt occur while the MAC interrupt is cleared, the phy handle
> will not be called which causes the PHY interrupt to remain set
> throughout. This is avoided by not clearing the MAC interrupt each
> time. When the PHY interrupt is set, the MAC calls the PHY handle
> and after processing the timestamp the PHY interrupt is cleared.
> Also, avoided repetitive debug messages by replacing netdev_err
> with netif_dbg.
> 
> Signed-off-by: Rengarajan S <rengarajan.s@microchip.com>

## Form letter - net-next-closed

The merge window for v6.11 and therefore net-next is closed for new 
drivers, features, code refactoring and optimizations. We are currently 
accepting bug fixes only.

Please repost when net-next reopens after July 29th.

RFC patches sent for review only are obviously welcome at any time.

See: 
https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer


