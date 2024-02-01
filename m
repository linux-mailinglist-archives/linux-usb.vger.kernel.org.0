Return-Path: <linux-usb+bounces-5725-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E61845440
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 10:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CA301F20F09
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 09:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2FE15B10F;
	Thu,  1 Feb 2024 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UTydyzgl"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5521115D5A7
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 09:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706780330; cv=none; b=Zc6oXqNgUH+iz9g8J9cRsayPe1yGFuQJkoN2zauYsGtJRdETqdoVdVwzIT5k8voOrM4uuh3lgzz4eCnU5bDCJh8G6aNsuTkNBIk/kKLYfjb49n+mcd0cKLB8fq6AvjVX9mIm94yq2zabPuC7E6q07VrqYnVCOLOUZx3wLs7qr0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706780330; c=relaxed/simple;
	bh=9l/wcXT+bs/WGiyv1cRps49ciJ9TEQfO/iHpcmKSk20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rDyK8tQ4z988PcwAjhNodRG6KmLhSt8vXxu/ay8zyzA0KQwolVE9iJrJjhkFrM9BkwnEj/W9UmNGcuGQroROfUtWkqeOAQSEC346tka3hE7jEoRfoNymBwJvaxFkMDgtLNQLowopF/KOH/6zGRF4qUzJZRMMfjBmADWCBwouiH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UTydyzgl; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a366ad7ad45so78306166b.3
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 01:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706780326; x=1707385126; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETrdbaHyveHNyICbP2DXqhvu68zNHBWwdNewWmRtz18=;
        b=UTydyzglxjJxAhMsW1gDk+FG3EiXNSuEQaqXcodPIqr46Yz1vJJXJLQU2GM42pqPsR
         wk1BgVO/DybEnV3/8yAnFETHBe08ZIeArnkutsuDV5EJAOCzx/2cY8w2y+9nXgHGNyx+
         d7RuejNI0kS5RY/rWXRODyBxSMFck58x7EbeMV5bQJk7oAhgimxaM0gi9xOCuAZqw47v
         mBbq5E7l1zLXldKNUA7QXqZ6qWdVG0NrUZ7xhiiwQnx8Puo2G/tJhJN0lODHXIHRzAGd
         rH2I/XCCosdiJptYNwUI8EOITzDNVpETOE3FrgoG70DOon0/g7YmVDpMtC3flSNhuNNp
         U4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706780326; x=1707385126;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ETrdbaHyveHNyICbP2DXqhvu68zNHBWwdNewWmRtz18=;
        b=bHkzNd27qc7SBpB3DJXx+zs6QDGfaWWM7FLCevAq1kDnJbBHNOnDKvUdYJ/tA7UKgo
         NcBVMe39U42H/wBrAdRTsowxyMe9vx9Hz64wQYY7ThDxVoD9MJDDx1bgnOqFFm6AZdm6
         VSIY+GRP2kCYvwLUnYPezyWy1awhr1BjG421EKroG+0eZaIDYleNqEB81RrJg4swB0XI
         woUW5hC3+TBc7JT3mUDrjpiFobL3UeuFdSM3jZ8+8fxC3Z5vPiT+xLgqjdlFbN5XRPBf
         vuWcSct2FH5fkTpUTysnsh01WNBH+AQx3Ss5Pjog3RjnZMPgqkGHQ+SucdwNT13+riQP
         v5mA==
X-Gm-Message-State: AOJu0YxJClNBaDZGlHRTS7zeDbRZ8t+7v9pftKCrNSC8tODPBoLE6AJ/
	VMK+NHQ9aT9YRx2l5+HQCkmvovbiXYH9fWUrqvGxKpjVIt9/Q7TMouDCjtfnQOo=
X-Google-Smtp-Source: AGHT+IHxmn0xHdwcOe8J8slylRP8BO1emqCK/Lm1LnQPUY17Fiyt3TUyFc0RlSUnQc7x52p7IIlldg==
X-Received: by 2002:a17:906:5fca:b0:a35:fe4c:e76b with SMTP id k10-20020a1709065fca00b00a35fe4ce76bmr3021090ejv.66.1706780326536;
        Thu, 01 Feb 2024 01:38:46 -0800 (PST)
Received: from ?IPV6:2001:a61:1366:6801:7ce4:a9a1:7f22:a638? ([2001:a61:1366:6801:7ce4:a9a1:7f22:a638])
        by smtp.gmail.com with ESMTPSA id rs6-20020a170907890600b00a26d20a48dasm7002102ejc.125.2024.02.01.01.38.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 01:38:46 -0800 (PST)
Message-ID: <09fce208-72b1-49e8-988e-ea149fbaf0b5@suse.com>
Date: Thu, 1 Feb 2024 10:38:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [RFC] usb: host: Allow userspace to control usb suspend
 flows
To: Guan-Yu Lin <guanyulin@google.com>, Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, royluo@google.com,
 hadess@hadess.net, benjamin.tissoires@redhat.com,
 heikki.krogerus@linux.intel.com, oneukum@suse.com, grundler@chromium.org,
 yajun.deng@linux.dev, dianders@chromium.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, badhri@google.com, albertccwang@google.com,
 pumahsu@google.com
References: <20240130064819.1362642-1-guanyulin@google.com>
 <0e4221b5-bafe-4bea-b533-0ed8add81ef1@rowland.harvard.edu>
 <CAOuDEK2VSBcQdLKt27VrLUxH2S22275ffbe5mdVM=vBZDhceQA@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CAOuDEK2VSBcQdLKt27VrLUxH2S22275ffbe5mdVM=vBZDhceQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 01.02.24 10:02, Guan-Yu Lin wrote:
> On Wed, Jan 31, 2024 at 1:12 AM Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> On Tue, Jan 30, 2024 at 06:47:13AM +0000, Guan-Yu Lin wrote:

>> Why does this affect only the USB subsystem?  Can't the co-processor
>> use other, non-USB, devices on the system?
>>
> In our use case, the co-processor only supports USB subsystem. There might be
> other co-processors support more subsystems, but we're not sure about how they
> will interact with the system.

Hi,

it would be very good if you decided this now, before we add attributes.

The reason is that if this feature is needed for multiple subsystems,
the attribute should be added to the generic device structure, so that
the naming and semantics are consistent.
You really don't want to repeat this discussion for every subsystem.

	Regards
		Oliver


