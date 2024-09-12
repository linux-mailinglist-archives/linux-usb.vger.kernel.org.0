Return-Path: <linux-usb+bounces-15017-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AB3976F49
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 19:08:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A5751C238AA
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 17:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E971BF7F0;
	Thu, 12 Sep 2024 17:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="TXrJzS8G"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559351BF338
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726160873; cv=none; b=Yi6nAP44hlralQc2vkaTBLXCcblc5KcCleLYVNv6uvWygsPT6UwUadmRWGw7u11eMvYAaOVQI4WEM34Us05YitJi/IRpL9aUVKu/tzKGlIBjhUHZgbi7FNiVQ+hJS4NSRGTea1bck8j+0hpEc2wIUDkPshZAjDIO/XTv8cYgmJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726160873; c=relaxed/simple;
	bh=OiNWEqHciZkVPseAu8B8WmN0darILG6zbl3zeYFKgTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3nFcEwyBPt6d35cerYYWfHq5cYPcKbYDGWHQrQUsA1WLwzxV9kN/NEjT2I9z6usvC/hqEEbcQAvsvUHHTmfPOdI0MbzASZy8RIEDAMCnHTHcgpsq/qucDKp3bKYD+ER8RDYWI+ZiMWkJ4jrzZzNhvvGYnFpEVymMZz1vayEpjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=TXrJzS8G; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-374c962e5adso784383f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 10:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726160869; x=1726765669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oseDqCRJUhFD2dLeTPXlO5hbRz2duVo6NZcTc3tDjk=;
        b=TXrJzS8Gn1wF/eb7iQ6Mkk4gsOREfjMNJ6byBLwfVKpaTkeFh8a0oCiFP8rU/6PogF
         1MplRFKFyrYYYIu9snElanAIbsS8XY6fTR2cahiSHd5kiojj0OhwqO+QM6NoHYC2Ihhb
         WE9n/kb4tiS9Fs/sPjmh2uXDQTdTLkmA40I7+2bzX4rLTE5L8XMXOKqVJxE/d+qJ0VBC
         60rZyTHEDZL9/WkiUWYaxDDOAg7/3S+dkJ6r7c7yAIVZul7Tt0giP67IUVu5pLRDG75b
         +epbLjE8L0K0xVN2wZ6ixISOq93i+gg8kqr7v/HllMGz8VFQ3rm782LhufS5DDIoyhKy
         9/ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726160869; x=1726765669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oseDqCRJUhFD2dLeTPXlO5hbRz2duVo6NZcTc3tDjk=;
        b=lU/Ric9CcA83NJ9o1Te2L7rbyus47A9xTGA/eBx3nRckGnNVFFcdFXTmWN4F4nkN4Z
         LysAMecLaXYmROkT0cB2u8WiWn+l23s9Sp6RmAwB+ZKUhqekB+RbT9OZHlaCwKQ7AEcm
         IlmIlDBkRh5fWodrIUzkyGfXoik8WXoxP3+hQHbdvTzeh0cLYyDqSacvkEaUQWqBcjNO
         8HalWawaqTSntZ87ArZktQZEw9je0QrjluU7smEuoO/R1dVvi0koQdPCBYAfMPu7wiXO
         dr8u0BSH26t/85COU+hmtoH7VZTvYxsYDYELekyFJCzyWtLzA+ZTJGBrpOGDfxEAy+3o
         qD2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXDcMn/s3ROfRS49MuaY+tIICC66yYPjN2WSa3PbQ/tgb1BTX/TiuUkeu/MPGHLIY/uVL43fzw3nA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT0N24qbkm2DKItSsqGJ4h0ASO3PYRRTsd0jPOeEbkXh/a+dzo
	8keGVmC63O4XeXiuY9x/gVMgU0EJgyyKroGs5KpqrhqhDuZ9qGzHbNgFazQRPN0=
X-Google-Smtp-Source: AGHT+IHvBFz42bnD10MptdQXnDZJ29xeTaCo2acJIgwblIAwEYqHIRq1XEqzLBBjgHeAVF9yUsPdDQ==
X-Received: by 2002:adf:e282:0:b0:376:7dc1:6e91 with SMTP id ffacd0b85a97d-378a8a1c6c5mr6485540f8f.11.1726160868823;
        Thu, 12 Sep 2024 10:07:48 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ca:eb01:f47c:2f3f:7fd9:e714? ([2001:a61:13ca:eb01:f47c:2f3f:7fd9:e714])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42cb1f0140dsm165140815e9.39.2024.09.12.10.07.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 10:07:48 -0700 (PDT)
Message-ID: <cedf861a-bc1c-4677-983f-321407503f9e@suse.com>
Date: Thu, 12 Sep 2024 19:07:47 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: iowarrior: fix infoleak in iowarrior_read()
To: Jeongjun Park <aha310510@gmail.com>, gregkh@linuxfoundation.org
Cc: colin.i.king@gmail.com, kees@kernel.org, gustavo@embeddedor.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+b8080cbc8d286a5fa23a@syzkaller.appspotmail.com
References: <20240912163413.10019-1-aha310510@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240912163413.10019-1-aha310510@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12.09.24 18:34, Jeongjun Park wrote:
> The dev->read_queue buffer memory allocated from iowarrior_probe is
> allocated in an uninitialized state, and it is possible to copy the
> uninitialized memory area to the user buffer through iowarrior_read.

Hi,

I am very sorry, but this is not a proper fix. That this happens
shows that the driver has a bug in iowarrior_read(). Zeroing out
the buffer just papers over it.

	Regards
		Oliver


