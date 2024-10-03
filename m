Return-Path: <linux-usb+bounces-15681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B14598F733
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 21:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3231C221BD
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 19:48:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 678831AC453;
	Thu,  3 Oct 2024 19:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frJgRlHX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2B31A4F0F
	for <linux-usb@vger.kernel.org>; Thu,  3 Oct 2024 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727984917; cv=none; b=rTgj1p9cKM1TzcFGnxSEJg3aFXOaR3T7JGFnf3GGuFRNmBLLlEETg8emkD51YaGlXkaC/DHodNCZndaJCyGawRNqDsYhq3MQKslDt+xEy3EbLpgOQ+Aut1PtaQoMefzlGBFocef/5hOn/4t7oDy6U7PIChrN1VPjP6iudykC9B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727984917; c=relaxed/simple;
	bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type; b=dzz/BzLxCdwzqxtbkaQYRB81vUhaxJTq8udzlisu4JSXSR0Ob3oBiAK8wTDvLK6rDen6anvqLInSCiwRrV/TDLkWgF9lKQ4Zg348Gf+Eifmv3MB1rLuh+w5iuslYhoE7VNKteUj5soO124HySYdPiUOs/eRmgcF3tMseyWXBspQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frJgRlHX; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5398c1bd0b8so2422261e87.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2024 12:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727984913; x=1728589713; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
        b=frJgRlHXKehdL16CZMq+8bfKN4BObt4x9v+qxy/cPV1+wwUws4r1fe3sbI/pm9GtyO
         ebFWWzjZkwQy7BgxETlXoHwMdc9ohDQb5VQuoXvlR+nqug2pb33HjvRyJvImr3Swx3YH
         Cbc4vtqNwNWS5g2EtVj7uYm+9AenQ3xWohxFLGqf/E//GEmCr2MygomowYlACSTfzx+8
         VudzybGopSeN3m552JsbtOK1/CwGgjVdLPCFog72fDiQCrgbrnwOxwWmFafE1CfAdwLs
         bWhyqg5RhV+yj50sU7GAZ9c0+RoicVFjvZIWZc4mAmYavK/6m2Ds+uqM2WJS38nwBfx8
         +feA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727984913; x=1728589713;
        h=content-transfer-encoding:mime-version:in-reply-to:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAMwGm0Iz2ch2LV9h6xKvKJVrcWzGxIB33i0l9yP6T8=;
        b=F/OvOS1IptjY6wHSpp6sn+y1vtUnb0Qf8nnWsmSnQVfyHptvGdZ52BjfSULaB3tUqt
         YGLqeH3bi8M+Oe5vfytUd1Kn6Pu6aniJpTJQVZtzWrjWeQeXX71qPMWmCodZOFN9OGPT
         MGdQ9y2UiE1VMnNVP1nW5X31VusLeFZ98BL/wrhOskTUBKFJwFnUk26oel2+iyvK8I7N
         96QGJ9uVwJTbEO1EjBduJ6KplLKuoSkdeeWxQNuPyckNmuLaSKzZsJVI5SMGgoT4Zpv1
         AOg2MXsyWb/UP4relQOavXgq86fKfduieRjk2bYx/qjpkL6+CYjUQ8BB7PiF/W8vFEmz
         qhNw==
X-Forwarded-Encrypted: i=1; AJvYcCV3T7bzzzxiErwRlrkh5RrtyOG4F/MFgadctsH4eA60KHE1Mi5aDCb+iB3Otf35Vne9aZ+aU9H1GiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKZUEnLQU9bq9QcdB7RiIO9TAgZkMYtw/CrP+7g/uwv5GIjD2W
	i1KW8VRYlB4gVtW52DBxj4iHWx0+9YOpSoyTC6bEsTjBZBkbTtQEpE4Di7Ww
X-Google-Smtp-Source: AGHT+IER6XzFJ/9D6ZSmLIQW7xzVDqoYQ3Z32Obikwwjp3rt/WrJ1RiMeuc9PABCSCfcJV2QtbG43w==
X-Received: by 2002:a05:6512:1048:b0:52f:30d:526c with SMTP id 2adb3069b0e04-539ac12cd74mr97194e87.5.1727984913071;
        Thu, 03 Oct 2024 12:48:33 -0700 (PDT)
Received: from foxbook (bfk18.neoplus.adsl.tpnet.pl. [83.28.48.18])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539a8251106sm247634e87.4.2024.10.03.12.48.30
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 03 Oct 2024 12:48:31 -0700 (PDT)
Date: Thu, 3 Oct 2024 21:48:27 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: harry.wentland@amd.com
Cc: Raju.Rangoju@amd.com, Sanath.S@amd.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, mario.limonciello@amd.com,
 mathias.nyman@linux.intel.com, mika.westerberg@linux.intel.com,
 regressions@lists.linux.dev
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003214827.4edb8731@foxbook>
In-Reply-To: <467722db-188f-4487-a837-01e65e194d3b@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> It hangs after some messages.
What are those messages?

> I sprinkled printks but don't see any on the console.
Did you use loglevel=3 on the kernel command line? No surprise then,
unless you turn all messages you care about into 'printk(KERN_ERR ...)'
or 'dev_err(...)'.

I would also recommend increasing loglevel to 4 (permanently), because
KERN_WARN is rare and usually tells you about pathological conditions.
The 'quiet' option is an alias for that and used to be a quite popular
default in distributions.

Regards,
Michal

