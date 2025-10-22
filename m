Return-Path: <linux-usb+bounces-29543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8FBBFE52D
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 23:35:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 91A1A18C3AA4
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 21:35:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF4F2EA146;
	Wed, 22 Oct 2025 21:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4YVvat3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BE727EC7C
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 21:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761168908; cv=none; b=LEsu6CahfwYI1Z64TKeRO01UB79GUwzPpqGLsG2rkIBLo9mU1Wzqb4uAtCY5/a4Hk/WBxDXwwYYPZPsnKrJ5qs7265iXiU0+MqQj4LYRrzKW44TZbxU6wH2KXvgYyXVoM1xSObaL+h4kLFPR9OjEb8yIBB5AjJweHJ0CaiEOLxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761168908; c=relaxed/simple;
	bh=ZcUAedJSFL5GRY92gsT/N5XH0fcyBh7QcJzgHGcMpa4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GopsgJFYbjxQHyOPgFFirIMiwAozXlJQHhlw/11C9r/XmHiO+gXllFZeLXG7rbWM9R+07J99dnKs8340Vosm3sdVslIbKsfsE5/FZuPzGkvCa3CobfJOxb3B2ikhl+TFig49llUD5dE8nmCuPuLNu0QdBY0kqxXrY7BBbORYdow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I4YVvat3; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-592f22b1e49so94731e87.0
        for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761168904; x=1761773704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lhKQHT9SEtHIaGnPObRcS575H61bHIMAG83jgoblnx0=;
        b=I4YVvat3IlU1os4CPTtH3JuvioZEhmQ7cV0uAlFImJtBFecD32rGfMmtE70uFEWEx5
         x5NpBN8a7e4Paj9V1/DIDkQyUuo0xe2/bQXsd7FSLC29s4REwFYbj2ZeLSSNZPtKjl+A
         vwD5Rska48eIYziT7hOyxH+cQSgNzRZdBIjG4MZ9KG+09D9IoLELv4Jj6fYnMtVq0C6Y
         +sVWoxtOF75GeChMrjEAZMhf2DdaUBxs5+2QICCiMVK8Xf0w4gFU3Y6A0cXOGkELcYmY
         +RaEeHckJBsCwGL+SBhY0xeaE13GyYUJEJsjmodWtCdMPQucoVrfFY9EOThYIS0WSNsM
         hLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761168904; x=1761773704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lhKQHT9SEtHIaGnPObRcS575H61bHIMAG83jgoblnx0=;
        b=gt7RkELUOVKloZBDyKuUV/WwtwUNQvmaJzWo+MLCdbRSmUJPx8MiD3T+vsUGTbhaLE
         5/6ZLXY9B8zG2gh/TxBiCahiOQZQgmtNY/bEObdHrGhNlsj4BonrOblxyOdpwzyG2r3M
         DL/tz0VknHZP8ZrEMugKncJXqnf8p5hweiX1Q0K/ypAkljQ35CmIlhPX6Y2S9HpXPMX7
         kaEp/1JKpyefurEKV2pSXskWJyvqNPd8Cgn8t1TkekqBNj1SKCIhdQIB9EpY01uMIVZJ
         qRVO5yDX67cDt/oeRMOrBzHm0dXd3Zue4ko5cqralefDx6iIkCOmjUEiP66YiOVm3IA1
         je4w==
X-Forwarded-Encrypted: i=1; AJvYcCUTw82GxMbttvhYuW0z0xNvvT7QS1qx/fZYBiBbr5XPf4N3DZeSg4tLBcHfxtcGIm/mRcKIp63wAKY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxdvp4xMVBSLvnHhAmJwaeEjxK2lioiIWxDZ7f/WHtm8J61heQ
	vm2bIZipJJ/KGGal+XxFX7zXvc+RL4/bb7JpHnaGvhHd8crM331OkgLZ1Dj12R0n
X-Gm-Gg: ASbGncs7kxkOCT5pTTvARpGhtxYH2f999f8rZP9Thp0nHWCDp09u8jmLl0SSsPVPn2x
	WbUxACJTGAH79yJUsm01QX2QgOGNhpV47PbMuxjBb1vKKSjfZXmeaHLwEF5rTALVnqlyfjRc8FE
	x2/yR+OlSxgM9y/ZjsdOfIeWsCdje5uvhGOl0ewhbMzQKLuXw7LfazhPDVLoVqCN984mHJj+H62
	vnFFhRXWi0RJCmItH6yINmJDYSXjLvF7XqwEZp0CqsF32SKmju9x6V8u+xJ0GropG003V/XyQQ8
	bETzdudUeUFhVhtJAwWP2rtdJw5RrkzyNvYEUVCLoXa4V5POJJTyvKYZJkG15bYfGn4JtK697lC
	wNcPWk90eOo1ScxPwaM06r3H2GQrVS5/PyTMrdkoXC/iF2MWCTs8HYmQGi81TMKZ8kijL739oob
	6EORowZkmiJ4HHhpWuJ7/ecWQzw58=
X-Google-Smtp-Source: AGHT+IHKNco4+0Sz6JvzP0TfUAiB8xtWJalf3ue9BtCtkHIQdRIx1ZC6sstICzuQJXWwf0njRJkk7A==
X-Received: by 2002:a05:6512:1554:10b0:591:eab5:d8c8 with SMTP id 2adb3069b0e04-591eab5da7fmr2178835e87.21.1761168904054;
        Wed, 22 Oct 2025 14:35:04 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d30752sm124611e87.104.2025.10.22.14.35.02
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 22 Oct 2025 14:35:03 -0700 (PDT)
Date: Wed, 22 Oct 2025 23:34:58 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Dirk Gouders <dirk@gouders.net>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>, Niklas Neronin
 <niklas.neronin@linux.intel.com>, Nick Nielsen <nick.kainielsen@free.fr>,
 grm1 <grm1@mailbox.org>
Subject: Re: [PATCH 3/6] usb: xhci-pci: add support for hosts with zero USB3
 ports
Message-ID: <20251022233458.43a5aa9d.michal.pecio@gmail.com>
In-Reply-To: <ghwm4msmyt.fsf@gouders.net>
References: <20250917210726.97100-1-mathias.nyman@linux.intel.com>
	<20250917210726.97100-4-mathias.nyman@linux.intel.com>
	<ghwm4msmyt.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 22 Oct 2025 22:25:30 +0200, Dirk Gouders wrote:
> I noticed that on my notebook (Lenovo ThinkPad L14 Gen 5, model
> 21L5CTO1WW) the integrated camera is no longer detected.
> 
> Bisecting this problem (in Linus' tree) led me to this commit.

Hi,

Probably not only the camera but if you run 'lsusb' you will see that
the whole bus is missing.

That's a known bug, fixed by 8607edcd1748 in Greg's USB repository.

Regards,
Michal

