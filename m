Return-Path: <linux-usb+bounces-12243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1DF933828
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 09:42:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A709428329B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 07:42:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56F8E2032D;
	Wed, 17 Jul 2024 07:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cPMS+Vel"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2DF20DC3
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721202126; cv=none; b=MRan39PxQfesZSyjiJXK1QXmhGN/UfRSwXJrgsfi4ILp+xIO9rBNkCInP+2gvRgRIq+0UCZITtskSVjSMp096JfkP3mDFqJir8xNMBFLqGzW4YCEIRIZFDl0Q9EfymqXP8QdrWOLrNoFApy+UmjXoaR9htbv2QEWKgPw76+IuzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721202126; c=relaxed/simple;
	bh=OiffStuUSLh1cS5l+P2QiNDzFgzly7BoWKy89/nhqHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJ+/gX+l0qD2qiTUtf3RTSS1kZwS9/5EDWCHtqZ1yYG0+gsnEmorI1T2wlwdmEBw0dKiX0/6cB+kGSYmSYaEQXSL6FRmLuxKtdHcpdX7ygheRGsUMYGDaSINX2X0KVRcix13B2UKYZnNKPOn6v+imuJrxHZ0MR1eSfoP9Ff9Hu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cPMS+Vel; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-36799a67d9cso5053093f8f.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 00:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721202123; x=1721806923; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8O2GqN4Vi7Z9MREfEbIQ23yM5JSotW2UOauCW1qsCXU=;
        b=cPMS+VellLfsaV8sKmXth6i9o052x3TkiO8S7Owqxzf/jl3TjkW9V6tTznE1aPgEuI
         8y4cifC2hFr9tgcZmgr/adFSiPxclYQJYcc2523+LE5IMQ+lueIwamIE/APc+NtdOEuG
         993RVWNbapqCRu92MgkKmJWqwn46zwKacc7ZhpUrivCxHWDTzDD6eJdOJT/m+YNnG1VM
         BavT5qAR3kACWzvnSDhphneIXu/9sdOblF9YFpQ6ClgmfVZ9rt5W7ql9I1nRPOhIgQGp
         JV06GzizTvopSVONYSDcpRL6lABZg7u9KzOvmtfdo0Xh1OrLqNVjEcIz5FC8BJD0EOw1
         VLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721202123; x=1721806923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8O2GqN4Vi7Z9MREfEbIQ23yM5JSotW2UOauCW1qsCXU=;
        b=Zf9LuoZok7DI1NxEOZcFwcuy9oqXSm4AECwExrNAJHTnH4XbB4a7QA1IjsM9xDb3ml
         EmIK5eTDOWt1nSzQKESgFMKaksGF5Do2RNBKmjQ9Opy/0jpy8aC7NOMVDoxXqeYq4OO2
         SKpvxRUe/cXUD15B8BdYhn5hKTr8goLWP7UU/qjdc5jN6vcx6r3F74y21jX5QWzklwjp
         /Z3MKiXlephQ6dWsAytKey5M/IGPKkCNEQn7/vcUAbJc9P1LGcnJU5S+ksFVmoY7nQ8w
         qBFipy2Jn2oJfPltukPKk5wYlJ7zD4Gm22r5v9AfEL9Hl8rezheTeh1jfZ6cm1XQYVWc
         GFZg==
X-Forwarded-Encrypted: i=1; AJvYcCVd97dxPm5iRf6fDOki9oQ41Pv1HrwGIUhZm3hnAzdwUa/Lmh0zouMwG4h1m88r/g7zkrIBOCuvFMgu0yHIBihypFz6D5ZEVixn
X-Gm-Message-State: AOJu0YxVdNLlMj18zJOrGu7olRkKPVkQnzUm+3vgeeU2/le7a1fxXdsC
	p6Z5c50wfJW10h8vrf7FR8u3te+OOGy4C4L11nP1/dMnZ8yDIqZAzOGQdGXhVYs=
X-Google-Smtp-Source: AGHT+IHzAG0DLEccG8M5eU2CIZi4PVHwhBeNXTo0q0B0a4qNJC7uN9NoXE53DDedUs1wstSZjx4fxQ==
X-Received: by 2002:a5d:528a:0:b0:366:ec30:adcd with SMTP id ffacd0b85a97d-368315f2017mr835182f8f.7.1721202122495;
        Wed, 17 Jul 2024 00:42:02 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafb9aasm10940535f8f.67.2024.07.17.00.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 00:42:02 -0700 (PDT)
Message-ID: <a648a2b3-026a-445c-8154-2da43b641570@suse.com>
Date: Wed, 17 Jul 2024 09:42:01 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
To: Hongyu Xie <xy521521@gmail.com>, stern@rowland.harvard.edu,
 oneukum@suse.com
Cc: gregkh@linuxfoundation.org, brauner@kernel.org, jlayton@kernel.org,
 jack@suse.cz, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 xiehongyu1@kylinos.cn
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
 <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>
 <429eb27a-578a-4208-8ce1-89434b8d739f@rowland.harvard.edu>
 <3073c8ce-1923-4816-a442-41b4cc333af9@suse.com>
 <6419a4e9-e084-4eb6-8376-9202930ea8be@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <6419a4e9-e084-4eb6-8376-9202930ea8be@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 17.07.24 03:43, Hongyu Xie wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>

Hi,

sorry for being incomprehensible. I'll try to do better.

>  From what I know, that CONFIG_USB_DEFAULT_PERSIST is enabled by default. Then udev->persist_enabled is set to 1 and this causing udev->reset_resume set to 1 during init2 in hub_activate.
> During resume,
> usb_resume_both
>    usb_resume_device
>      generic_resume
>        usb_port_resume
>          finish_port_resume
>            usb_reset_and_verify_device (if udev->reset_resume is 1)
>              hub_port_init
>                hub_port_reset
>    usb_resume_interface (udev->reset_resume is 1 but usbfs doesn't have reset_resume implementation so set intf->needs_binding to 1, and it will be rebind in usb_resume_complete)

That is correct. But even if CONFIG_USB_DEFAULT_PERSIST were not set, losing power
would just lead to reenumeration by another code path. Devices reset themselves
when they are power cycled. There is no way around that.

> Even before usbfs->reset_resume is called (if there is one), the USB device has already been reset

Yes, it has been reset.

> and in a good state.

No, it is not. Or rather, it is in the wrong state. This is not a question of good and bad.
It is a question of being in the same state.
  
> After all that thaw_processes is called and user-space application runs again.

Yes. And user space does not know what has happened.
> 
> So I still don't understand why "the race necessarily exists". Can you show me an example that usbfs->reset_resume causes race?

Sure. Let's look at the example of a scanner attached to the host.

OS			Scanning process (in user space)
			1. Set a resolution
2. Going to S4
3. Returning to S0
			4. Initiate a scan

As you can see the system would now scan at the wrong resolution. Step#4
has to fail. As there is no synchronization between S4 and user space, initiating
the scan can always be the last step.
For this to work, reset_resume() would have to restore the correct resolution. The kernel
cannot do so.

	Regards
		Oliver

