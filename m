Return-Path: <linux-usb+bounces-16897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F859B7982
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 12:17:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 851BD28224A
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2024 11:17:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C097A19ABAC;
	Thu, 31 Oct 2024 11:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hdBY7CpN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FEC1991BA
	for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 11:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730373454; cv=none; b=gt+cNs0GqPDjpDTJQ7rdBnmXlpSK9mhr1cOS1reVrXO/Ndu+61zH18jU1gKrTRp8k26RwcpKuTYPT2gghUEnuuqLrH4mn5wu+m1KcrFl2kzhvcVs2XW2M0uOSka7oSKKRoDe2+b4Y49yj2Hnkf62cN2Hwm1o4RZ5qOC/q53aWFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730373454; c=relaxed/simple;
	bh=JIY4hvHjU7GbsJGxp/EiN2W3yZ4tJ7fCTIbxR8wtxsM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Lcerm3zu7AYDJr38/FJ6k1TyRJNOus0IHnurF1dYwDQVYByaUwdNQfZmrmqrodzwM8Dzx7B6nzteDLj40CgSW7iuTtb4O49qr6M02drBSy6p/NdlVSmcmY7kPOL9hMuFP0gHLAW0gwimDEh2krZJl6ojtLYJ4pnraQGDtA/JkzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hdBY7CpN; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2fb518014b9so6365521fa.3
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2024 04:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730373450; x=1730978250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIY4hvHjU7GbsJGxp/EiN2W3yZ4tJ7fCTIbxR8wtxsM=;
        b=hdBY7CpNHCBZeiiZGzDyOVlnqEGXYlUubhKutDy76Nhwz3FDwv5i32D+Z0R3ovWeiH
         gbbORHXvbkvCt94oaaakWPRw4XHkJgZN3H4mTmdfr9Cuv1eVzp+AuYBEqD10si2g6dN4
         2jt8Lj0kP5zEATkBUyaJEGiEEEohcYgpi3gzZccs2IA35GnxL5sV19PRiMX19aWHSOoM
         e55u46s+ym2G8yut+3uYlPoejccvSBPQZfaJgG4+0HElJCijTgtS/1Y3M/FpRCQBP5Hl
         5SnMaN1EYHhMkWMU1/qTmGeU6FEdOT6p4yyHbWYSnglKuROVyPjp0h3ftqFMA/RyHVAD
         r5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730373450; x=1730978250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JIY4hvHjU7GbsJGxp/EiN2W3yZ4tJ7fCTIbxR8wtxsM=;
        b=OyLATGyiZwIeLm9xJ0LGf5/o7COsFJAr1W7u5uMEZYi1dZwQ+Csuj9pyR3PfRI2EUI
         sjLzrdQ36XerBfn2NGdNIbr2/gYKVKbFTHHdbzjwdd0RRdAiSVhln9WdVS/DxVs41ADE
         KaBPXZKyrKzOTYOysrWrZXToF7Os6qk8qyC1lUKI+nkR0tmKQL3LObyQro0yIfpNIowa
         6+mkm+fc+cQDiwJER5meryN0SBTKpP/RwOf1+/NmW10qwbpHALyvuo/B8/hfO+ANKemN
         yjSRIgFyZB8JBzxddVGZtbx5p6mGi3OEIAZagS2O1sh2kMfKCSh7TAtzcijyHrchcYRH
         mYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZc/Ud9j6cg2YZAFGpn6S/4tpKXXxGGbkQfhpj6CqUOKuIevHatj0a4SVem9bWqE7NcNggPEctjio=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxabH7xOIqG9zILUg1RVFrD26UfG3cQ1QXRAICJJ1D9212aqHP
	3fkHcjvLqC4RjN+jv4u35wO+vj/si7gru40Vh09TwQGWRnOj40ON
X-Google-Smtp-Source: AGHT+IEvIak3Xee5Yh23Ug2e4iXZ/XeiJJX/6au5wU9nZPYmbY5/Jz68xlzl/wmX2sMnUPrXSHiRKg==
X-Received: by 2002:a05:6512:39ce:b0:539:fc86:ce38 with SMTP id 2adb3069b0e04-53b34c35b65mr8636216e87.60.1730373450258;
        Thu, 31 Oct 2024 04:17:30 -0700 (PDT)
Received: from foxbook (bfh123.neoplus.adsl.tpnet.pl. [83.28.45.123])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9c16dsm167079e87.109.2024.10.31.04.17.27
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 31 Oct 2024 04:17:28 -0700 (PDT)
Date: Thu, 31 Oct 2024 12:17:24 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 "Neronin, Niklas" <niklas.neronin@intel.com>
Subject: Re: [PATCH 0/2] xhci: Fix the NEC stop bug workaround
Message-ID: <20241031121724.5a259d6b@foxbook>
In-Reply-To: <20241031114926.22ac4359@foxbook>
References: <20241025121806.628e32c0@foxbook>
	<20241028083351.655d54cf@foxbook>
	<f6dcf205-e8eb-4ba8-91d9-24fa0f769739@intel.com>
	<20241029092800.32eccf3b@foxbook>
	<7c2abdd1-c209-4616-9d18-be5fc99fc527@linux.intel.com>
	<35fdb2a4-8514-4b4d-9332-127d6ed07908@linux.intel.com>
	<20241031091347.29b6ffdd@foxbook>
	<20241031114926.22ac4359@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Update:

> Your patch prints one dev_dbg() each time, mine spams many of them for
> 100ms each time. I will remove this one retry limit from your patch to
> see if starts spinning infinitely, but I strongly suspect it will.

Yes, that's exactly what happens.

This time I have killed the ifconfig loop, unplugged the NIC and
started 'rmmod xhci_pci', which is still hanging 10 minutes later.

So business as usual when these things go wrong.

> One retry is not enough. This is what I got on the first try with a
> random UVC webcam:
> [...]

The Set TR Deq mismatch errors went away when I fixed your patch not
to give up on first try. Maybe I remembered wrong and they have always
been around.

Regards,
Michal

