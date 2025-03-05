Return-Path: <linux-usb+bounces-21381-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60363A4F8E2
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 09:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9DF001892731
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 08:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 792431F5850;
	Wed,  5 Mar 2025 08:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3AX9MIt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7284D1C8FBA
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 08:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741163577; cv=none; b=Ocfy206ZysYuYR0FBKAklyfJtwDhaT52r+2fFUzWoOx6jO+tQyOLnFvQbv00GvlAE0D4jCJooYhL4zGNaPp1pm7GS3USxU8hScOAarhJWDjknZ37HjRj1KL5+wyiQMeBUosKhKuOY0GM9UiRNmOtNZpgctwe+ShXjN82Br6CdiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741163577; c=relaxed/simple;
	bh=LyLkFpOaJc4TdmuEaBouKO1t9DPNNrXvGQxe+2c8NTk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WTO2R5VlzxaLfJzxpj8eG3rLfoEqK4cxNNSRHsFTHJD4I1QsQ8DDqiEnLwSzbzPDMYzyFJBy9hiuVH9i/EzWgPvfOei+87A2vOctEI3WlMR0SPf2nSZQskJXZXi69QKGNPYpJTU4db/r8mqAAKdzR/mUJ1md8PF7Vu0/GJRrong=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3AX9MIt; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso9192396a12.3
        for <linux-usb@vger.kernel.org>; Wed, 05 Mar 2025 00:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741163573; x=1741768373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06t/jHR8Fitj3+jLFowoEUFdYv5bqa/LQh30s6hftvw=;
        b=D3AX9MItjBRq9BqzNC2w78lfcWjceUau5wPbp7LSt+yKPlyRn/0fVnkyLVcYyegVww
         bIdyQ7N3Tck8eezoGTrR47C02VroJE9k52mdJNtAojTyy6972/4LAlNiYCbQenP5efJg
         rfNYpgpL0xcEVwIW/QpoT/kQuhvOlESCe72axsKP+2oqP+Fld8LdGB6b87K/50nJshGf
         jN0OErOKvChVJLS7x4KdEJ8e5mtH17beMU0Z55Ts3nX2jUncJIeiYpE6TkCuq57q+/f9
         CoK/+iWRDE0tDYEvsROLtsXFDSK2WMXFwswRUg/ftrU8VuxGEE3CL4zBa65PDEDTA7Dq
         ZAUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741163573; x=1741768373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06t/jHR8Fitj3+jLFowoEUFdYv5bqa/LQh30s6hftvw=;
        b=LBRjh9n0BxuFVKaBBRqHY1B9AbYyBCOqT6tQtcaClIcv8VNSBAdVPlsU4C6WS+WNvv
         QPD6ADetgQgg6gPeYpJHdZc08f9fCZI0R/rxp8F6Pq4TBy7kbJ24l+0MaBZBoQiWVR+Z
         EXq6vgjylTZ4OYRa8kauie3zCafKwNUqcgVg9MUBZtKF5EthrEVPVvZ52omyaLkHM68S
         wzCWvKd1SEFXmhB7X3jWSayJ9CmrBs8r5dOvqCUuWz9/2JrHqdOdCrtmxtjgc6qAxL5n
         I8MHDTUdV+RiLLu6z3Lu5ri5ApeMCzCWpcBxBnhjZasuAAvbNTtbYDPS0KzUm3384hXt
         HSvw==
X-Forwarded-Encrypted: i=1; AJvYcCWcQ86ShiqgzWh4VCxS326WX7pobaVMiQ8Gu5CGxGstHdCy8QdkU5wtP0bUsDHaXoB8EiMyoBCIOhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxibqHZOKP19Lop5HIotHOuYsCLVw0fc5V3Cm4vrv0ZEiCoausA
	93xYdDnVsESAi7cpuZ4NE/VSgqKhv6gRW326N0x50QFQw8C0/ZVp
X-Gm-Gg: ASbGncsFkN4NhNDpYEtEDEVyhSkG0/26L99vnhffWqV9I8sUJBpBlWfhECy8M55WmP/
	f+HrdAjvj29vEvaiuHYJhmJuuTLRzsT53CyHyMhfVgD6/EABFSJGejwTZaJ/ErrtZiv+JCx+jXt
	HBR5ZvWJVa42M5ghwbJow/Uhwex/it4crLH1XCf0HgRVSNGw0vSsuKjWO+44sKXBmnzbAlwYN4O
	NR4m449Q9B1AzC2OlnGA0izlxWTSw+zHZIE2c4SlFNOI7Iqy3cGSvIeUx7vSqaEvALA+h4SRkor
	hqv8++DOfrzWPkuyT+af90LBB1VXLHHd6c/NHsUsNtYQggWk2pRmLQ0QjczqQw==
X-Google-Smtp-Source: AGHT+IGzOzSnocmuw0Czj4aJSX3W4hvRsBmR5GCE2QkNzV5bMC2HVX3Gfj9zE2xv7EvYXBnhO0AwBw==
X-Received: by 2002:a17:907:6d0a:b0:abf:63fa:43d4 with SMTP id a640c23a62f3a-ac20da94820mr209085966b.44.1741163572369;
        Wed, 05 Mar 2025 00:32:52 -0800 (PST)
Received: from foxbook (adts246.neoplus.adsl.tpnet.pl. [79.185.230.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac165223834sm413426766b.165.2025.03.05.00.32.51
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 05 Mar 2025 00:32:52 -0800 (PST)
Date: Wed, 5 Mar 2025 09:32:48 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>
Cc: mathias.nyman@linux.intel.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/2] usb: xhci: correct debug message page size
 calculation
Message-ID: <20250305093248.3cc6c066@foxbook>
In-Reply-To: <20250204124145.3998098-2-niklas.neronin@linux.intel.com>
References: <20250204124145.3998098-1-niklas.neronin@linux.intel.com>
	<20250204124145.3998098-2-niklas.neronin@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Feb 2025 14:41:43 +0200, Niklas Neronin wrote:
> The ffs() function returns the index of the first set bit, starting
> from 1. If no bits are set, it returns zero. This behavior causes an
> off-by-one page size in the debug message, as the page size
> calculation [1] is zero-based, while ffs() is one-based.
> 
> Fix this by subtracting one from the result of ffs(). Note that since
> variable 'val' is unsigned, subtracting one from zero will result in
> the maximum unsigned integer value. Consequently, the condition 'if
> (val < 16)' will still function correctly.
> 
> [1], Page size: (2^(n+12)), where 'n' is the set page size bit.
> 
> Fixes: 81720ec5320c ("usb: host: xhci: use ffs() in xhci_mem_init()")
> Signed-off-by: Niklas Neronin <niklas.neronin@linux.intel.com>

Actually, is it useful to fix this code if the next patch in the series
removes it completely?

I thought that you perhaps meant this simple fix to go to stable, but
it isn't marked as such.

Regards,
Michal

