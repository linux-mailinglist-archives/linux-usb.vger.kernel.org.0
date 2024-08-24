Return-Path: <linux-usb+bounces-14032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 004C095DC52
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 08:44:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AFC01F21F38
	for <lists+linux-usb@lfdr.de>; Sat, 24 Aug 2024 06:44:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14C07153837;
	Sat, 24 Aug 2024 06:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FnIOg6O2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6632F29
	for <linux-usb@vger.kernel.org>; Sat, 24 Aug 2024 06:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481886; cv=none; b=WnTDAKbIq7R+V9Pf0+zvjoKLxywU/jBtZ0f1lvdbPe0YyPOWJ0URiux+KHtaKjyRxZ4qrSjZBWEkhnFYdUT+ZAYT5K4b1Bu15Pz1V0Ci2QWiNJetE2stNMt1aDpjCzABkzbQz3HUtihwax8RL0BmcsHKxMIaHE45YQQQNJ71lho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481886; c=relaxed/simple;
	bh=XuNO8PcHTiR/edCVyeVc52RQktbc9rj1G0ogM438RVg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=JOYpkejzEHu9vj0Nyor+qAKAtVO1uBnbMGQvxYfQ5UZHvUi2j3EHK9fskOGOgyXY48YUuV6ulYwktvB0ftfXJwaruhGPkeA9l11Az57dd4rNoXlUqVqQoqUJgNLVkKkpxLoXGcspfkNMAgKxAnENmHuKiL+GfThVGUcXJ+N59+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FnIOg6O2; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f409c87b07so27048201fa.0
        for <linux-usb@vger.kernel.org>; Fri, 23 Aug 2024 23:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724481883; x=1725086683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XuNO8PcHTiR/edCVyeVc52RQktbc9rj1G0ogM438RVg=;
        b=FnIOg6O2yeGD6MkPgHGf8gVWtqtbrtqtN2uBXDOaagHy7uFxoJbfdXULqlJUckoBqJ
         3b0mCm0+DcW0AfBLSs92X39UaQgpWUhJxLvc19JOUS7Y+PvGgObAm8NrsitTzrbg4W1r
         1d12uMtS+wX5HcJngLl0JJ2OSa6NKHAA9Eujqv4gHA7VuRXvtwbMhzxjqaGAjkE1Hqpo
         IlX2PPlyIJCTN+pRZjn4fo7tiijsABj7/ugk7Y9pWDaWxNjp+CIxfz9LG9EZ0sx4E6P3
         YRc8D0n49wALX/bdreoe9bG/mNJEWdy2lj2eCSrtM8zBxYeWlhUT7t2SWoPgHtFlu6Pv
         vAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724481883; x=1725086683;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuNO8PcHTiR/edCVyeVc52RQktbc9rj1G0ogM438RVg=;
        b=nAy03dB32RigY04rl69VCvj/gTT1bcmDhkqmP+RgzD4Y+8QXoNXTP7yv73XUiiijJ0
         LYR0AztZthjHTVc0rm4+FyHFTiOV+wQvUesmX7n6b3qegqIkBnCDZyGDGMzr17sGLmx5
         GUM6rS4DuFbZgQL+2YgX5dk9G53kXtZLnJFAv4GSO19PV/vbhyIHmVj93IwYdeR9dHxK
         JFb8i0FBycfIu6zt/+ObPmQI7l3hwFBMhk+9m+UWm2zrN/e/bOhnRqcdhQ3/kB3OABX7
         QvXzKl/4p+jIfW9/xcnmiDyRTHYlkI2ShpLja/MloGvNoZf9Gzpdv5VlQ1I8Y6dgm8P8
         cnTQ==
X-Gm-Message-State: AOJu0YzgbK8JrYO01Do2CY3AqKrUKpdLW5l7dCfWSFO+8G1OzmEzK09Y
	pLwGiU7u4HBjpdIUA7JVjvum6abZfoC3dbpAjchBjz5lC/gpsTJsLw/exA==
X-Google-Smtp-Source: AGHT+IEnRUxJQSs3L3S7pqrfZm3FoD2SivuFtdMn1ju1cPg7NZWunebUHEOyD/5YhcDszDCoFvRihw==
X-Received: by 2002:a2e:611:0:b0:2f4:f1d2:c6b with SMTP id 38308e7fff4ca-2f4f48eee85mr26361591fa.12.1724481882504;
        Fri, 23 Aug 2024 23:44:42 -0700 (PDT)
Received: from foxbook (bfi133.neoplus.adsl.tpnet.pl. [83.28.46.133])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f40487f7afsm6652971fa.117.2024.08.23.23.44.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 23 Aug 2024 23:44:42 -0700 (PDT)
Date: Sat, 24 Aug 2024 08:44:37 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: schaefer@alphanet.ch
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with USB device
Message-ID: <20240824084437.342426dd@foxbook>
In-Reply-To: <ZsjgmCjHdzck9UKd@alphanet.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

What sort of kernel is this?

Looks like there are some stream-related xhci_hcd bugs here. You may
have more luck with UAS disabled if you need this system working ASAP.

Not only SMART is failing, but also ordinary block reads and maybe
writes as well, so it could potentially be a risk of data loss.

For debugging, it would help to have a reliable trigger, like "happens
every time I run smartctl manually" or "every time I do it while
'cat /dev/sdc >/dev/null'" or at least "often while <some workload>".

I am able to find the PCI adapter responsible for a USB bus like this:

$ ls -d /sys/bus/pci/devices/*/usb8
/sys/bus/pci/devices/0000:02:00.0/usb8

Regards,
Michal

