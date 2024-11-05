Return-Path: <linux-usb+bounces-17138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B889BD6D6
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 21:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0DBAF1F228E5
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 20:16:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CAF0214419;
	Tue,  5 Nov 2024 20:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b="qZXOShhJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8961FE11E
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730837802; cv=none; b=uJi5r6MTZJH8kOxOg7B86G5IdlE3Wzfkd6BTyeuyxYWnBdanBZulZIh/61zpKiCSyT30vXyUHGe2kv7nzlUq6ZyMgTiRkv8BMcT4uu7w1wpjhM6xqhmdiWTi/BaXvhoe2rNxi4iyqFw/Vd1UmrxZmCaaySmxKUM+KbhBHiWNrU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730837802; c=relaxed/simple;
	bh=No+tBb3iM39T9nvSy4f1h/eCdw//wpvGehXzoVmwl0w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V1ao1+I5MR9NX3d/FhsLeDvsZ/tUJKqDIGbum9uH+nCTw6plQJCC4k5lYASbvOpzOam03YcuX+rRJUgrY2Ay0Cp7DYNgKQjIkCnY0xmVAxQ36zFaD3r7ycIpIMQQ/eNOFTzgK9tCNV6395PzkudcfUjNP1kq7k2ewdqLQBtEZCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org; spf=pass smtp.mailfrom=kfocus.org; dkim=pass (2048-bit key) header.d=kfocus-org.20230601.gappssmtp.com header.i=@kfocus-org.20230601.gappssmtp.com header.b=qZXOShhJ; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kfocus.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kfocus.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-83ac4dacaf9so216454139f.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Nov 2024 12:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kfocus-org.20230601.gappssmtp.com; s=20230601; t=1730837800; x=1731442600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9+ckaindqBCee5ve4hNcEd7sofPcYiZayRWOUc9OlIs=;
        b=qZXOShhJ5lJyBUBj6OUo0ZUeTQZOY5Ds/7CcyzucetOZNIw7+qMOEiKYyERQS9xYPj
         /hdSN2oApEN3lJAmqObQPhFYpic8xoaEyU2NaebMx3XwqFbI2Ai1x6rp0f4+eI82KWrI
         bJ0JwiBo2YAMc3Urayn9/itOqqZh6Jyo/PC4KWeI3fc86ZSdXuVUEfYAGOdfjYFEbxQn
         hkegQInI+URAePo747qDCnP2ojDYfHKt4t/fifZNSVb3ZhuSajlBG/5a94LSkkWzEcTu
         XX8n4ub+8nVficMN7UBhRIk4WDcSdpijmWqi+pNqxE8LbXbWTGOSd/UcxY9Dky99rM5U
         al9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730837800; x=1731442600;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9+ckaindqBCee5ve4hNcEd7sofPcYiZayRWOUc9OlIs=;
        b=jGrlY0HjYo0doSsa+ircyWGm6NBxU7EgE2AC5ZYFHph3Ee4fLchc2enWEDN7Qx2scy
         5z+v5vG8zAuxj2w/Pj7a1VOBOetFvNSCuAifXtRWFyMVfgn/hSVaxpduHxA8O37aNfJD
         LKfMp0SAkNHW59bGoBHw4y95OaNmrUUSmHQtqD37spQU0RL0Y9/ECOVs+cdumiLZbAel
         +HHqSpQRPczc1UZBgbbtivDtodqoZuyj961YU5/gDRyzqX3VEeHfq+1bAwchqKzKsFjh
         eAI0CoAch6+qvQC9kN2P7ypF0h1bT7Z8Egk+R32G98qaFjG7L9mI1nDbJlqJBnb0R8wm
         RWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWsnXW/+3rcEmFQJxgE8YR6I53ExbO72W2xq0hL36MwP/pR+WtmPGbqV6l/EGX1kHra+wd5HY02t5E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4fSxGnnebe6PBClTjjjT+W5v4KycNycB70XTqG6jVQ1E446g
	zl+7wluOzEW2UQMBnj1Gw/4cLX+lRvP/JSdUsBieNAJIbmyVI93pWbDnYPKwoRo=
X-Google-Smtp-Source: AGHT+IGl5dNOTJBptLvmxzYmyVucRPwQPhWHVJm4yI3f7fXU3aKkox0bkZmi8cwTTfMJAjZe3yP+Fw==
X-Received: by 2002:a05:6602:6194:b0:83b:7164:ebb4 with SMTP id ca18e2360f4ac-83b7164ee02mr1673306239f.14.1730837799869;
        Tue, 05 Nov 2024 12:16:39 -0800 (PST)
Received: from kf-ir16 ([2607:fb91:759:8d6:2a49:bc88:6dfe:3a21])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de048895a6sm2552499173.11.2024.11.05.12.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 12:16:39 -0800 (PST)
Date: Tue, 5 Nov 2024 14:16:36 -0600
From: Aaron Rainbolt <arainbolt@kfocus.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: YehezkelShB@gmail.com, michael.jamet@intel.com,
 andreas.noever@gmail.com, linux-usb@vger.kernel.org, mmikowski@kfocus.org,
 linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: USB-C DisplayPort display failing to stay active with Intel
 Barlow Ridge USB4 controller, power-management related issue?
Message-ID: <20241105141627.5e5199b3@kf-ir16>
In-Reply-To: <20241104060159.GY275077@black.fi.intel.com>
References: <20241010232656.7fc6359e@kf-ir16>
	<20241011163811.GU275077@black.fi.intel.com>
	<20241011183751.7d27c59c@kf-ir16>
	<20241023062737.GG275077@black.fi.intel.com>
	<20241023073931.GH275077@black.fi.intel.com>
	<20241023174413.451710ea@kf-ir16>
	<20241024154341.GK275077@black.fi.intel.com>
	<20241031095542.587e8aa6@kf-ir16>
	<20241101072155.GW275077@black.fi.intel.com>
	<20241101181334.25724aff@kf-ir16>
	<20241104060159.GY275077@black.fi.intel.com>
Organization: Kubuntu Focus
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 4 Nov 2024 08:01:59 +0200
Mika Westerberg <mika.westerberg@linux.intel.com> wrote:

...snip...

> Okay, thanks again for testing!
> 
> It means disabling adapter 16 in DROM is actually intentional as that
> is not connected to the dGPU and so makes sense.
> 
> > * Boot the system up, nothing connected.
> > * Wait for Barlow Ridge to enter runtime suspend. This takes ~15
> >   seconds so waiting for > 15 seconds should be enough.
> > * Plug in USB-C monitor to the USB-C port of the Barlow Ridge.
> >   Screen shows in log, screen wakes, but then no signal is
> > received, and no image ever appears. Screen then sleeps after its
> > timeout.
> > * Run lspci -k to wake up the monitors. Once this is run, the
> > display shows correctly and is stable. Adding another USB-C display
> > after this also works correctly: It is recognized and lights up in
> > seconds to show the desktop background, and remains stable.
> > 
> > Notice that pre-6.5 kernels work fine with Barlow Ridge, which
> > implies that new code is causing this. It may be new support code
> > for tbt capability (and therefore pretty much required). But
> > regardless, it's still new code. With the current patch, we can run
> > a udev rule that enables hot plugging that likely always work, or
> > (worst case) at least empowers the customer to refresh monitors by
> > clicking a button.  
> 
> We definitely want to fix this properly so there is no need for anyone
> to run 'lspci' or similar hacks but because I'm unable to reproduce
> this with my reference Barlow Ridge setup, I need some help from you.
> 
> You say with v6.5 it works? That's interesting because we only added
> this redrive mode workaround for v6.9 and without that the domain
> surely will not be kept powered but maybe I'm missing something.

6.5 is *broken*. 6.1 works correctly, but that's probably because it
doesn't have Thunderbolt support for Barlow Ridge chips at all. I
suspect this is because the chip is just acting as a USB-C controller,
and that works just fine without the Thunderbolt driver.

> I wonder if your test team could provide log from v6.5 as well
> following the same steps, no need to run 'lspci' just do:
> 
>   1. Boot the system up, nothing connected.
>   2. Wait for ~15 seconds for the domain to enter runtime suspend.
>   3. Plug in USB-C monitor to the USB-C port of Barlow Ridge.
>   4. Verify that it wakes up and, there is picture on the screen.
>   5. Wait for ~15 seconds.
> 
> Expectation: After step 5 the monitor still displays picture.
> 
> If this works as above then I'm really surprised but if that's the
> case then we can maybe think of another approach of dealing with the
> redrive mode.

We'd be happy to run this testing on the 6.1 kernel if it would be
helpful. Will that work, or is 6.1 too old?

