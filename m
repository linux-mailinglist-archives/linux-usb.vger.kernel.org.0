Return-Path: <linux-usb+bounces-16294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F388D9A00EB
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 07:47:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A9B1F1F22F97
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2024 05:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AE6618B462;
	Wed, 16 Oct 2024 05:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3jT+Z25"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B454B67E
	for <linux-usb@vger.kernel.org>; Wed, 16 Oct 2024 05:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729057639; cv=none; b=njNrqDc745zACeK/+a3AemW2uzBFFWhmgRhH0vlvgHUWnfTaEDOiy2RNrh8BiaaouLwMQDyfvNK0KvGdso5WPlq+3gLwz+lkGn8ykgc1LnRKL4uj5Ip0ZFdlTP/oixUHKb8zCcqNsU6AbTrMkfMjtdXKdjEdZZhZLHEooSdex24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729057639; c=relaxed/simple;
	bh=mJ1RTCZdGi83v32+lvPkDaB2a2v6eoHGG0XJNNbg9tE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ij05U7UusO3N/ZNDpCrSruBIhNcQ4o50zPl8Bm0u2mEwxq451syB+EFIzJli8IpE9yODh0kHrLhDP6hdGJ80wXNsiHAleBfQDcz6yKmxJH//B0cPbG2dvWyJ2GEGKWDYhi7AsZAkGmdf/6XIRmFDEyNQmCUfqCq3GnGCDlBaHqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N3jT+Z25; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e4b7409fso588083e87.0
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 22:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729057636; x=1729662436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VtMaq5xK1cZc5DIubMNdrMcHcWt3PQX8M/fS2NpGs2M=;
        b=N3jT+Z25btvBl9NKBfuFC6A0KnDpWfBl4Sik7Smij9a16UUg7ON1iNSTA1nbiXysqf
         lz8o548rddj2n01Wg+XB7+rR3KcRdDsMZBFsTJtDXnxLgM7o2H85GouD0Iz64m6bi78+
         C4KsXb6DgrYzho1zecLsL2QQa+U7rlOlMjEOCxNFPuI0uPGjejc9fu6MMif+5FQxb2VU
         wypcebdXgJalqz/IN2nj+RCIbxiIoVtQeKnKGtPjf8CRxlEbMUMS6wq5PF8m8eIr6oQj
         +5Cv9/N4QaoFv97XwHmZrQXhKRLsVpbO+3z7XZAGFZw6iLAA0oZ8UIx1S/n3Douu6AtF
         33Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729057636; x=1729662436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtMaq5xK1cZc5DIubMNdrMcHcWt3PQX8M/fS2NpGs2M=;
        b=mXP1Vh1MZRKCseBGXH52FiiDEUaKJypC4WVQCkz4dUVDr48/cw5TT6nM179PPuIpUg
         zVI/U+s7tMNwYOOHQUi9i7+ENENG8eyA5u7hpIIalxq3RqsiiNfAuKMCTHtI3k8mwWkZ
         z5kSdxe2LEfM1qVMDTKa0iFBBEV3v+Rw0O+U36+g6ImNz8sr9uLB/O490IBYqxHuNykR
         NReudUdDvE7nnusNG3EyTJGIZ4dypGjyZOdT9/GbekjkOm6EE71pV9ZXLz1uMPsJZJRA
         H2fjU2De2bCMTWWNJJm2nkIPZ7C9uYdW3oKUD3I1IWRKBJ/ExRKVxewf3DKpvxVr03MO
         GXcw==
X-Forwarded-Encrypted: i=1; AJvYcCWroMQ/JXas1SspyTdn2rRcJMyBh/BMvmK9GkWaB/pVoFTbvaifDFs8bCI3+tzNSrKXqn2vD/tVfpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz3BP8ZBPU6flbpKcI6BvWx/dLzGAoO3w6WROaje4LN/vZ906Y
	6uX/+uC+WevYfutuRxzE42Vie9z/s8O12vwIybyDVBxisws5YpLeMh6cBg==
X-Google-Smtp-Source: AGHT+IHcswtEKx3quAF28pSPC/FVLQq6S4y13uXQjs8iMxXZFOEED3419ZaP1L6YZyyAp/I4vgbAvQ==
X-Received: by 2002:a05:6512:1088:b0:53a:a3:907a with SMTP id 2adb3069b0e04-53a00a3916fmr1384635e87.6.1729057635975;
        Tue, 15 Oct 2024 22:47:15 -0700 (PDT)
Received: from foxbook (bgt225.neoplus.adsl.tpnet.pl. [83.28.83.225])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539fffa8933sm356576e87.43.2024.10.15.22.47.14
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 15 Oct 2024 22:47:15 -0700 (PDT)
Date: Wed, 16 Oct 2024 07:47:11 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix the NEC stop bug workaround
Message-ID: <20241016074711.247ff14e@foxbook>
In-Reply-To: <e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>
References: <20241014210840.5941d336@foxbook>
	<e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

> > With some experimentation I found that the bug is a variant of the
> > old "stop after restart" issue - the doorbell ring is internally
> > reordered after the subsequent command. By busy-waiting I confirmed
> > that EP state which is initially seen as Stopped becomes Running
> > some time later. 
> 
> Seems host controllers aren't designed to stop, move dequeue, and
> restart an endpoint in quick succession.

As it was you who added the Running case handling, do you know hardware
other than NEC which triggers this? Or could it be just a single vendor
who screwed up once 15 years ago and caused all the chaos?

NEC sometimes triggers the Running case too and it is obvious why. I'm
not sure how I missed it back in January and assumed it's some sort of
random failure for no reason.

BTW, the NEC problem appears to be limited to periodic endpoints. I am
unable to reproduce it on bulk. I thought that I reproduced it on bulk
back then, but on second thought it may have been interrupt, which that
device also has. Unfortunatel I wasn't printing endpoint numbers then.

Regards,
Michal

