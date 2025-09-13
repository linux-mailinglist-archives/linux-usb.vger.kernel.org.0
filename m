Return-Path: <linux-usb+bounces-28045-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C43B55F42
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 10:13:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A368CAA0E7E
	for <lists+linux-usb@lfdr.de>; Sat, 13 Sep 2025 08:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEF662E8B6A;
	Sat, 13 Sep 2025 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EtYpIyjr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA42BCFB
	for <linux-usb@vger.kernel.org>; Sat, 13 Sep 2025 08:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757751175; cv=none; b=cPzI3h6eFqq+uKrfYLFZyGJcOF/kokgDqKlchaJPiDHZUgDbAbMTJqQu0jP/+ti5Zm3SqQsi5DiuCNMl3vU6obRl3l8obCWx1fA3gZlCMj/kXQuf/np+MS4vVIToKcZDnsHJ7syFV+pkayQiOxfrlOJk897dj8fbJvFbOf9XHf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757751175; c=relaxed/simple;
	bh=R0zHToYnuiQEcRHbpnTZ0Nwu1p01PFg+ubOn0A+ZmJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dlCRXxtMGTGraPFqup0tIAe4j3wR8LsfuY6UBLn+gb0PIlgxU8NIalrzCwDO8y7SiMCgHfaBoH4BtBHFyNFww7hmRXskWaXE2iWDQwjEMKL6Sf5DtoMGR0cHHpbWDrFc2zhW5Avi2rsg9i7ZjZEnaonewYnOaO9gmRaJP4oARS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EtYpIyjr; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55f72452a8eso3156128e87.3
        for <linux-usb@vger.kernel.org>; Sat, 13 Sep 2025 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757751172; x=1758355972; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UfQhDuSvzHIkemDW8GNUkq4GLhACt1FD+0aGxJPOI+o=;
        b=EtYpIyjrMxawlHYypmt/TbcevYQjjtlwxLGjgPWEuV5m7p3vNuv76i82FxjrMkuQ3U
         sMwcpcj8sgG3+jzy6aEGY1d52iHeR+zrdakxsMKpFNOSVLlX5QwemzpUT6P/xe+X0lzw
         jwr3min/nYTWH0mFzH4aRpqiaJaQUmT2YRUvL3GIHV6ffgaD6me3J8D8Il3/vZ1MYGD6
         Vv0re9pf9Jyp+D0pQ2wOHAEGNJPtPD/4yrAs0MW94r09P6IHpHVfQjL3FDlYfVehJKCe
         oagZnL/GNwwVbFnjh1Juw0LU8ACjTVZy3Mmu/l+yRvWyrIWD+m+eib7+79hMZe6aOrmX
         fhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757751172; x=1758355972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UfQhDuSvzHIkemDW8GNUkq4GLhACt1FD+0aGxJPOI+o=;
        b=rKhWxOULy+XGV8HeaczMiC8R5zJBGpImMe8LwBGokwmH/Ashw4aEtXuey6wIsQaTvY
         CNKMc7iWgHLwNaZYF6UW3hKrpG5ZMpXVPmZdKJO5iqa010Nyo8DOaOtcp1z4T4qkmnPA
         zeonHG4ygpYw97HNnrEOGqOXKPo9TDKQT8saVSYXZyt0ojlR8sMbzG5Z26Tf/MKn4AcV
         rpawoEXSw8TsfhjOxRGSz+Ch9iiu4++7HGUhCI19PUC5se7MO0Us+bO2KeUleGGfULpg
         mX2tPuwb6k9UAl9zus8IxCcGr7ATN/2lCLzjH0IRzzNTxIroN4dWCVEnRMpgz2po8fId
         I7/g==
X-Forwarded-Encrypted: i=1; AJvYcCUAfSLxF0qsO2zhb4gX0ziAcjBk0+nezBW1/Nb6she90QHxJV6MTAjN9ZAX3/mrO3ZZKgYB//2GN5Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJK1pzLusKGfgHKvUxZmUiHwGx3XG8VymlOy8yeJV1XfWVgzg9
	4ydJ7Gpau7KtQ0+r61wye500aJLxts5xn4JqfWOtRSU+tflgbFIuctEWnABUDg==
X-Gm-Gg: ASbGncsYxrg8n0DSeD+aWXyPyFSfl98oPSvGtixZbsxNHqpyZOydw6Cgp/3EP/euaYB
	s6Zis0t/I0A3Dtc8Au5G64zVRR676ciofaJpadPwvUfjMaLReBFbs0kUQ5uKCsIydl+IYdsRSwn
	WCfCrDGU3ZziYQt2i2bTE2j7qBm+kCvczUH+co3nIW4yMJEJmpDTL5g/1Mt6dK9fxUCRxKumofV
	Cy+XsXWqxOo4F0WQI8/yJgF8DOQYWQ/QhSkvVMV+zdWYblTouMTV2SitEQH/510C9/1mzGGXjJ1
	iYlK04kYMEWklBYNlNDGLgUUOUKDUGj3+GQEPauMvhvOD7Cp0rao/jhO2fE7i/ZF7MnQzgHp5ZS
	hemVwMTPobhjc0lxSuV9A/USjd8fHvRzTyaZjRMnpeSIg8w==
X-Google-Smtp-Source: AGHT+IH2AD5BXTQAgCsKFKU70bkQeF93I7gukIqkNtAzap8icHw0uG0c2ZukmHH3I/86xL2nJAU//g==
X-Received: by 2002:a05:6512:6707:b0:571:7b89:b413 with SMTP id 2adb3069b0e04-5717b98f8f3mr1030726e87.5.1757751171469;
        Sat, 13 Sep 2025 01:12:51 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56e5d5e6fd0sm1794103e87.50.2025.09.13.01.12.50
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 13 Sep 2025 01:12:51 -0700 (PDT)
Date: Sat, 13 Sep 2025 10:12:46 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/7] usb: xhci: use '%pad' specifier for DMA address
 printing
Message-ID: <20250913101246.515abfc4.michal.pecio@gmail.com>
In-Reply-To: <aMRgL4fus--v4QjP@smile.fi.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-3-niklas.neronin@linux.intel.com>
	<20250909115949.610922a3.michal.pecio@gmail.com>
	<aMAPkH5-4rLdmx_9@smile.fi.intel.com>
	<20250909224416.691e47c9.michal.pecio@gmail.com>
	<20250910075630.0389536f.michal.pecio@gmail.com>
	<aMJ9PbOxn3CCuaYJ@smile.fi.intel.com>
	<20250911113451.1f5e5ca4.michal.pecio@gmail.com>
	<aMMtgsAa-dovMqdG@smile.fi.intel.com>
	<20250912114644.7b9bfe37.michal.pecio@gmail.com>
	<aMRgL4fus--v4QjP@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 12 Sep 2025 21:02:23 +0300, Andy Shevchenko wrote:
> Again, imagine the loop that goes above 4G on a 64-bit machine. Out
> of a sudden %08llx will be expanded to cover the 64-bit addresses and
> becomes one digit at a time creating a ladder (ugly looking) output.
> This is incorrect.

If I equated correctness with ugliness I would equally confidently
state that unnecessary zero-padding is incorrect. But I don't.
This is exactly the absurd argument I previously made for padding all
%x and %d formats to full width. Pad tables, not lone log messages.

> No, it's other way around, we should not put explicit casts in printf() in C
> as there are plenty of the format specifiers that allows us to be sure that
> the printed value is correct independently on architecture, endianess, etc.

At least if you do it, the compiler will also do the right thing:
- if the cast doesn't match the format, warn (xhci needs a patch here)
- if it matches, widen the provided value as necessary

And it works consistently regardless of whether the variable is a
dma_addr_t or u64, on all architectures, with or without PAE.

Reminder: this drivers handles DMAs as u64 too, so it will *never*
print all DMAs as %pad. And if it tries, it will be a silent bug.

> > This brings up another problem with %pad: it is unknown to compilers
> > so they don't type check it. 
> > 
> > but if I switch to %pad and later change my mind and extend 'addr' to
> > u64 without updating this format, the compiler will eat it up and once
> > again garbage will be printed on some systems.  
> 
> This topic was risen a few times in the past. Somebody proposed to have a GCC
> plugin with that, somebody else proposed to completely rewrite the %p
> extensions to be more like Pyhon or C++ ones (when you just specify argument
> and handler for it). None so far is implemented AFAIK.

Indeed, not holding my breath for the %pad situation improving.
This includes impossibility of passing it by value - it's forced
by compilers being unaware of %pad and following usual %p rules.

> But this is not particular problem of %pad, it's for all %p
> extensions. And the extensions exist for a purpose. What you are
> proposing here behind the lines is to kill that completely.

Surely people would laugh me off if I actually suggested that.
If those formats work for their cases, use them.

