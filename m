Return-Path: <linux-usb+bounces-27856-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6942BB51242
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 11:17:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37ADC7AD861
	for <lists+linux-usb@lfdr.de>; Wed, 10 Sep 2025 09:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 669DD30F94F;
	Wed, 10 Sep 2025 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RyMp0RXz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF8C2561A7
	for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757495844; cv=none; b=Ar8wLvmpd7RKrJjC+4Y0hKSr8wKY/utdV9XJbjlb8eZKap4mF7ysguC3havcS9l/yP9k1DMzIS0XNAa3GaCoL6i/1Er7zdfyBP9LFCcqozeS4LEqa5UoitZ6UO2sy07gtacS4HwcKsS+pO74p7oRt8JjxeJuJl+HFWc6iFQQNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757495844; c=relaxed/simple;
	bh=2DToTPEOKOjpZWy8MMC/9KvGtMnN3hAcXLf1q84OWmc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gxjPBYJxBjzkQL/Xbut/0sJLQ6nRMswlelS+O4N7D2L1aNZQBihWri1v7DRRIGSECOGLFiXfSWtJRkQHuSqRtsU7Ipag1TgKSZr0M8HDMbrKwzJuHmpHB9uwj1MFG0ex/AyVlYCOtXT9HCi7bfLeOBbAMljJBILD5dT21J/QfyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RyMp0RXz; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-55f74c6d316so4023974e87.0
        for <linux-usb@vger.kernel.org>; Wed, 10 Sep 2025 02:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757495840; x=1758100640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PYF7wuH+NxplQtJ+U1EGBItktp9d8DJV5cKV8DLn9YA=;
        b=RyMp0RXz7ZzoxiOks2KvFmnDTpgmOyv4iYcVwKVv8fBUWjy3EynnquAQoDzlu4FhoG
         XuaaVN/gU3NwyN+S2IYNEw112zNWyES8mun+pRI16NEZ/gyxv02aoch7EyWErR6BzjZf
         LBg4YerzWuvY45GjNua8vOtm97keyptOVY0q/54M4iwXR8BBwvWi1cjfKZM6gZP9ru24
         IPtXAWuTEd0J/fgw5SvsJqx0/IAILBL7JGSuJhGjRVKYPchLHumnhB3PLFdWU1pHo6pb
         LO63FsEM8sBTegMWGtjVuZJydicI4glmALr/6pMRDZa91B8+3ZtcD3RLmRn/t8vsMn3n
         rx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757495840; x=1758100640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYF7wuH+NxplQtJ+U1EGBItktp9d8DJV5cKV8DLn9YA=;
        b=HwGTQBZf7IOsUkeUtuUvbMWWErKIhPMJCFeO1YWeXYhewmco9CBQfG5BZ8AAOHTr6B
         GssT2cPBw5e6kbDjP4qWG2xqUn63TQPR6yw18bnmuF000Br328hIec1pyfg8Vim6dRu3
         4H0gsYzQQHqT3M7ZqzbMWzhc0r4oUIHnwhh8OYLvKqTerBde4AlHwTNMfq7HNj6K/Mtr
         FfoZU88WcK1+tIk4w9XZUIO2EWVdzhjjs3viFXMn26DReuwmLJfn+TXOFnMcGI9tU213
         80GLN7reQDqM6O4jJ7e8b8vQRyHG+R0Ru4JZDEmLCpOw/oEkr8E4aE7tggUQCmGQO+L0
         Lkdg==
X-Forwarded-Encrypted: i=1; AJvYcCUw8YtRrSn2H57IE5uge4VU0923T7pjf5zucitxSYmHA+xFu1um+9V1xJ0/lmjr/WCe95RUJPgTpAk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+sRqPUY7d//9g3X+qYKB3Egyt91NMMi0sM3w8GIHEoZp5vTET
	A9UbvAC/zf291uGm0lrKYyJGGOyi+zheAgRNbrNQUPIlRKnC95OV1hF4FsUnJg==
X-Gm-Gg: ASbGncuMKPNi6NZClAsIHgL5LARbGQ6fsEy0unLlyOnFRPLUivv9N/p/RFGBS29jJ+Y
	piF/TDaoyiHj0dVQ2+oJxSDeOgRGYGd3gcUqbDJ+Ms37iwUBRFvh9NqKwm99lTTMXD7a4cW6TOY
	scYYAl6hIbnDKqHyb/u+cDoqCnmWma5FeOXy/3RNjMqjhZyAIn8RV+wbeloIJycI8+RZyP5i/RC
	rkPXpLUKyEXbI2mYO/+2V2qmfhMy2s9sZX57JaGztD1diKiMgZQWsymzj8VddtzsD0Amh6aOQp5
	B5E677S+zNW80onI/ZFmSLvN0IlvdSxmR68SPqmZQ9Ydc03hrYMugeDUIuowa3EVpW+G8bd6Tcn
	sZ8xrbduwnk7MiaBW8UNO0OIlCN+OvzwFSMA=
X-Google-Smtp-Source: AGHT+IEjBtfsxx4B5s8nPnMsueam+Q5UJV3/7vsETlgSRwvzMlFM9HcRIPQIAJgWjG1KV6HZN13YgA==
X-Received: by 2002:ac2:4e07:0:b0:568:fcd5:1468 with SMTP id 2adb3069b0e04-568fcd51608mr2320240e87.24.1757495840149;
        Wed, 10 Sep 2025 02:17:20 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5681853e403sm1085431e87.118.2025.09.10.02.17.19
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 10 Sep 2025 02:17:19 -0700 (PDT)
Date: Wed, 10 Sep 2025 11:17:15 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250910111715.60e0ecf9.michal.pecio@gmail.com>
In-Reply-To: <20250910110448.30e6b906.michal.pecio@gmail.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250910110448.30e6b906.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 Sep 2025 11:04:48 +0200, Michal Pecio wrote:
> [13035.022589] xhci_hcd 0000:00:10.0: Stopped on Transfer TRB for slot 1 ep 2
> [13035.022648] xhci_hcd 0000:00:10.0: Removing canceled TD starting at @0x00000000fffae050 (dma) in stream 0 URB ffff88813358a3c0
> [13035.022657] xhci_hcd 0000:00:10.0: Set TR Deq ptr @0x00000000fffae060, cycle 1
> 
> [13035.022662] xhci_hcd 0000:00:10.0: // Ding dong!
> [13035.022666] xhci_hcd 0000:00:10.0: xhci_giveback_invalidated_tds: Keep cancelled URB ffff88813358a3c0 TD as cancel_status is 2
> [13035.022835] xhci_hcd 0000:00:10.0: Successful Set TR Deq Ptr cmd, deq = 0xfffae060

This also illustrates how this series degrades usability by printing
the same DMA twice in different manner:

@0x00000000fffae060	<-- zero padding and @ (?)
         0xfffae060	<-- bare number

It's the exact same number. And this is what everyone looking at this
log wants to know - is the number the same, or is it different?

It doesn't matter what type of variable is storing this number in given
moment. Source code provides this information much more reliably than
type annotations in debug messages which people will break over time.

