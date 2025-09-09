Return-Path: <linux-usb+bounces-27773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A42B4A6A2
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 11:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8C36E542694
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 09:07:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E47CD274B5D;
	Tue,  9 Sep 2025 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abqdfo2Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B363F24167B
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 09:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757408822; cv=none; b=VYCx9N73GZ302aHVEOiydibpt7qWc1dC7J9KM+c4XudIghLBr85xiaMDpNCC/EPUtAOAJmALoP0WDPFAQ2tTpDC9wQkW0Xt/xT889/TLeoap2CHt6jSgij8OLZec57wwuKWnscL/PnYfHcvm+0O4QiFz2kW++O9lGi0awvyfIrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757408822; c=relaxed/simple;
	bh=Mu9heSLDA8nrQUe2B/mKsd26ur+XOD84VbVNg+JI7pk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TNM0FXnXsVwlCHz4uhhwgzgCKjeI9lRhIJB9EmyjR7GKQ6DYp3qZ6j9xzKJ/inJCGQ03NROQtTMis23SEfCdeT6NQpBL69LRoa0I6k58Ok6SJ9FyNvKGE/F5q4KtTBv9XhcwrKfq7GN1o/Nnucdq21/YPdEx6rNNVD6c0ONsmf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abqdfo2Q; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-55f6b0049fbso6109477e87.0
        for <linux-usb@vger.kernel.org>; Tue, 09 Sep 2025 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757408819; x=1758013619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4706Y7VhoKoZU56xrEsFzu6JL1W9AYpGaPBNaBL4gw=;
        b=Abqdfo2Qy6fwdERAMHmepd8ZP8FWiRJW6ZEUvzpwkXnFYiu9mN0UQGka+hbGcltxkV
         COJNcY8ZfblSzMwOEveiGURclZXJ95KmYfP2CxQQ1Ws1+pEZjnzyHLmwFAQBix+nkiJC
         3zaPGWVlAWOPIaPULCUVKRp8rbNIJM32MZgrUa4CeujnhRWNfEdFI0qtoU4wxZFhm6po
         DXiFmp7Ezildb13hezb9b47qKLH2seL9iV+Rk9lcQDQSn3cVAy7OhfhfxIrPEuM2Lraq
         F4673Izx8ma+/bx8d9GsGDf7pD0kDvCUekyOTniumbU3Z75E4MMqfQqeZKpLfA4ZbZsu
         Fl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757408819; x=1758013619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4706Y7VhoKoZU56xrEsFzu6JL1W9AYpGaPBNaBL4gw=;
        b=N/MaaMYYTAXP2Dapst6z0aPmpWCQ1hzgKc9qn+vkdIFl9x7Pdz85EG0lxsoRMzu3iJ
         wruM8P6zRoDTnTUcI3VlwAV9cWcLxXlzWJUHQR9DpaUXrdnG8NP+W/niw4FwTGbNdRZR
         zd04NN3Belf+ZQq2gs7Jrjbza6MQxw+Ek2Dr1iEJnhTaKNri0NCiApxdnKnobaJrWtXo
         GY28yx3AKHGF1dlHYTsXrnNn9zK6Kf5mAVqe5y+AoullRMCVYQlFrpYSTozqdm8WRTEs
         JY6K8J8/ft4sB+BB9gZUMdswnyX1XW0VjeJAlajnJb3FdaxCyhzk6UwpmPnEgqGQcZJE
         KciQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAQUbN/oypwz7maIEf038ZiZ60tBQT3Mn2SDx5I3OFeXbjD5lh5LG/VwWv/fPdH+hSWzTvD0MaCQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzX/aA0wFWWxgI/BJnU4G6L+zmbb4+N4nwHceqeMMCHbz6nf4QI
	0xzv7LCg7+KdWFXNe0MHwCYxKMc0RNMMnMqt7CjT1LrXaOXq9zMIhTrA
X-Gm-Gg: ASbGncvSdphsDbPlaTn0A0+apBqlJ811/EQsXvOkD3UMf8fqGyCT099fPkay1Mml7iu
	Nwp0pYNup9FJqtaY0vmpH88x0cTjk1PlNgX+cHgvNu03Mlrr7wnUMifJ+jFSMtKDvDp/05M8Hj7
	hy8XIEeT9/KukPTOEc/qpfwrnCc3c7eAVCxGp1IotNVpcxU+d18leqIbhnot7uuDP8jEs+UFrgu
	F3D4hOaUNn9bDzWuAyAWzSmhgJC3shSlWVuwfh7f1MCP/9eXoAgWygRa3Y0u9GqEfSZHatAvyph
	pL9cxOeWBXx3JKkXaDtQa5pYlPA3NkLevjMGY24PrAyK4mpjV/T9rnfbJ7w5OZMqxG5cFDgHsoy
	rvq0tMsNHygfOyeocmzBYWO1awNIaoyMycC51dqsf1anANA==
X-Google-Smtp-Source: AGHT+IGqqvxgXY2OC9at7e+Z/dJe6HNnDTsrlz4oZFJzvocQesOciANg3kl63GyEUEZ9jeQdxahboQ==
X-Received: by 2002:a05:6512:131f:b0:55f:3ebc:133d with SMTP id 2adb3069b0e04-56260f37ba6mr3071966e87.21.1757408818324;
        Tue, 09 Sep 2025 02:06:58 -0700 (PDT)
Received: from foxbook (bfg216.neoplus.adsl.tpnet.pl. [83.28.44.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-56818445b20sm368617e87.111.2025.09.09.02.06.57
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 09 Sep 2025 02:06:57 -0700 (PDT)
Date: Tue, 9 Sep 2025 11:06:54 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 7/7] usb: xhci: standardize address format
Message-ID: <20250909110654.4d064391.michal.pecio@gmail.com>
In-Reply-To: <20250903170127.2190730-8-niklas.neronin@linux.intel.com>
References: <20250903170127.2190730-1-niklas.neronin@linux.intel.com>
	<20250903170127.2190730-8-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Sep 2025 19:01:27 +0200, Niklas Neronin wrote:
> In the xHCI driver, printed hexadecimal values can be ambiguous, making it
> difficult to distinguish between values and addresses. To enhance clarity,
> all DMA addresses are now prefixed with the '@' symbol, ensuring immediate
> recognition as addresses.

Is it really a problem? Which values look like addresses?

Is it important enough to justify merge conflicts on multiple debug
messages when porting patches to stable? There are many inconsistencies
and typose in those messages, but I only clean them up if change is
necessary for other reasons.

> The '@' prefix is removed from '%p' specifiers, as they represent unique
> address IDs rather than actual addresses. The hashing process does not
> preserve any relation between addresses; for instance, if two addresses
> are X bytes apart, their hashed counterparts will not reflect this
> distinction.

Is it really a problem? BTW, you can reboot with 'no_hash_pointers'
to make %p work normally for debugging.

Personally, I do believe that there is a problem: those @ add no real
information and they need to be stripped by scripts or when copying
numbers from logs to calculators. But see comment above.

This problem applies to new cases added by this patch as well.

And what if the kernel starts hashing %pad by default? ;)

> Exceptions to the '@' prefix rule are functions xhci_ring_enqueue_show()
> and xhci_ring_dequeue_show(), which exclusively print to the enqueue and
> dequeue debugfs files, containing only addresses.

So debugfs will also get @ now, except for two files apparently?

Why are those files left out and inconsistent with the rest? If the
answer is "because the @ prefix is annoying and breaks tools" then the
same answer applies to every other debugfs file ;)

I have a script which parses event-ring/trbs and command-ring/trbs to
print commands and their completions together. Others may have other
scripts. They will stop working now. And for what gain?

debugfs is nothing but dumps od xHCI data structures, anyone going
there already knows what those fields are.

> Standardize printing of all 64-bit addresses read from registers, using
> the "0x%llx" specifier.

%#llx is easier to type and less eye sore than 0x%llx.

The 0x prefix is maybe rarely necessary for humans, but useful because
such format is ready to parse by hex-aware calculators or scripts.

Same argument works against @ prefix. Scripting languages, terminals
and text editors can select whole words and we don't need @ included.

> Adding padding is unnecessary and provides no useful information.
> Prefix the value with "0x" to clearly indicate that its a hexadecimal.

Sounds like an argument against converting to %pad in other places?

That being said, I'm not sure if %08llx is truly evil yet.

> $ git grep -n '0x%' | wc -l
> 39796
> $ git grep -n '%#' | wc -l
> 5204

Not sure what is this doing in a commit message?

> Redundant "0x" string prefix is removed from DMA addresses printed
> using the '%pad' specifier, since '%pad' automatically includes the
> "0x" prefix.

Not sure if urgent enough to bother, but makes sense of course.

Regards,
Michal

