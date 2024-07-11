Return-Path: <linux-usb+bounces-12141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE4A92E2E8
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 11:00:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 501CE1C2340F
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jul 2024 09:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0025C155A52;
	Thu, 11 Jul 2024 09:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Pqcntlhs"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3622A15573B
	for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 09:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720688402; cv=none; b=XU8iVK58nMlizXGrYxVhgsELJIaGr3rqlptJlwpVHzMG0l7T88JE2JkH1CeZbSYYuzlFo0la1YJeMo7IGaQ2vMGb3MG1qdwmVDoqjWN+P+jD0dKjHiKiMgUV89Ai868KKGJY/MA1jC52mUqfs/UngrOVAt6ez5+zhRg6Y/znGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720688402; c=relaxed/simple;
	bh=Kf/OlZEIAfKJfskw1GEmYoycLqweYJlEWfMIyhbvHgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SFs6bpUlMclarTjjOhkO7Z/lqzsbxvetUHEn2ViKf9IhPsZ1QznF3EwiLfJ8IksS4yGrQqpaOJtf0ufGA7cZpUPnd2IeB7mPBQq2XpU2JO5Frl44GlYkBQrLtMC9NAABcKRm1svJGrnOV3LmIvlFQOzejmRIsJnItss6eXubq6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Pqcntlhs; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eabd22d3f4so6615781fa.1
        for <linux-usb@vger.kernel.org>; Thu, 11 Jul 2024 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720688398; x=1721293198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9TQVNqV/55qcmWSodfaodGl8kIRqYK6zmB9ZbQbvagA=;
        b=Pqcntlhs0Dl16Hh/ylpYKQSEYxGkkc9PZ9e5W5QmqD7L/2W6t0xmYodnKtuCal241r
         6CKQo+i/Ci/Q0kOWuDZOO3Jb4GoHgdf1gaAPSpeSbgInmx1XAOA0W3PxFRuDciLA3Hhi
         Vs2aYGGK6R+v1+KiRCpo5Mc03HU+wBT8UZeUGPNcBA+mYJb7RWOAfLHtP5+tz4p95L+z
         fpAJShevnRoxBRBWeepfESOviiBNUNU5f0YtopVhaU6A8HVdqhfB7EWINizfpxZrjYwO
         qPVWjZpW2sFcoOEhjaszedTUlbsIloF4ef0FBuaUcsj36JqJZ6gkt6Z0fumPaUDoMpcw
         dYJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720688398; x=1721293198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9TQVNqV/55qcmWSodfaodGl8kIRqYK6zmB9ZbQbvagA=;
        b=XDwT38hu1kLE0B6kg0kaAit006snsnndIK/TXE86tuhbEIJxFRoYWAIIjEA6O3Zy8J
         OzuOvMlHKgPn1Lfducm1I9lp772b1sKCs4oxfOlC/MFJ/2H3krzHvnmuTDjVn0uQE506
         88gFyyMA6ollh6SThF47lxCm8rhr/zri4cVOKQbATfIAWCuvWDB8Dvt955SAyLz5emEa
         uvWx4f12xYNC9Nkv/8Ba+oxXf1smYQwIfFQCCdj786D7dqXINHfGdA3uMfUDXJIKVu8/
         deR96xkfI+2ymb2fT/MGcDqHU1QzuRqSdINDNQf6LWsLhMuhEEyvHbzOXguKj+wHQBGA
         lLRw==
X-Forwarded-Encrypted: i=1; AJvYcCWOGYz90MZRnPFJ4HmqSmSBl8UVYV4Fp5dkTqTkIXmricZmVqWCDbXQO7XitGkFCTMXiDciLdv13JuwlTumK5v9JXUWsgDaHLI/
X-Gm-Message-State: AOJu0Yz1DEtLDJKVqD4w9DiTpamgt9LbKUTWi6ENaGDpRtrAlpez74fB
	60jb3/9IJcsh5xExL5MJH8VVL3GBSJDFIZgRls7ngg0UaMqhnPCnCK2miO/heOc=
X-Google-Smtp-Source: AGHT+IHc18o4aVyduopTkQAgdU/QnaNP+1ksS70cAtHQ0NH2O6pxD9zY29Hfwo70ZeQyHbs0jq5ycw==
X-Received: by 2002:a05:651c:1025:b0:2ee:8b58:5ebc with SMTP id 38308e7fff4ca-2eeb30fee32mr53398011fa.29.1720688398055;
        Thu, 11 Jul 2024 01:59:58 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42662315363sm189294335e9.26.2024.07.11.01.59.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jul 2024 01:59:57 -0700 (PDT)
Message-ID: <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
Date: Thu, 11 Jul 2024 10:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
To: Hongyu Xie <xiehongyu1@kylinos.cn>, gregkh@linuxfoundation.org
Cc: brauner@kernel.org, jlayton@kernel.org, jack@suse.cz,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11.07.24 10:43, Hongyu Xie wrote:
> During hibernation, usb_resume_interface will set needs_binding to 1 if
> the usb_driver has no reset_resume implimentation. The USB interface
> will be rebind after usb_resume_complete.
> 
> Normally, that's fine. But if a USB interface has a matched kernel
> driver, and a userspace driver or application is using this USB
> interface through usbfs during hibernation, usbfs will be
> detatched with the USB interface after resume. And this USB interface
> will be bind with a kernel driver instead of usbfs.
> 
> So add reset_resume to fix this.

The device has lost all settings, yet we continue like nothing
changed. That strikes me as a very bad idea. If a device has undergone
a reset user space has not requested, we need to return an error upon
the next interaction.

I am sorry, but this implementation has some fundamental issues.

	Regards
		Oliver
  

