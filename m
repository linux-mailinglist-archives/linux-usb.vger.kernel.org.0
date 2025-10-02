Return-Path: <linux-usb+bounces-28876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C25EBB5025
	for <lists+linux-usb@lfdr.de>; Thu, 02 Oct 2025 21:31:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 703897A246E
	for <lists+linux-usb@lfdr.de>; Thu,  2 Oct 2025 19:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7EC285CA2;
	Thu,  2 Oct 2025 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PIW0rJ4d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FACEEA8
	for <linux-usb@vger.kernel.org>; Thu,  2 Oct 2025 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759433454; cv=none; b=oruHSIWwPJJnvDPI2Sztb4NBC34fGIcunBfd2i/+ljPnmedTbLeLc/NADoEGWc3BhkPXNgOUF51aligb61Ipfqgk97b1G3fEeXFLB8hMf6eKTW9V7hcGaK+NIOykq9Ftv06ihXp9iTm0lf+8ajlD/aGExt2Z9j6GOE49vejmEfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759433454; c=relaxed/simple;
	bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpLNsqqivKgSNj4SbmkjxS8Za/eJ2w+zpGSWNbaQJSFKoKcTbDdJcIW2pvVUELyAiP6xWPn+3LenhL5JekuL4Wagn5niEKZns+c3lSJXnIyJywOcNeMiLJEiRfbzdrg6h4UZVyPWnM70vSK+AMj90m2Nmh6P9GMo2RZB4b3edzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PIW0rJ4d; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-46e6c8bc46eso7812495e9.3
        for <linux-usb@vger.kernel.org>; Thu, 02 Oct 2025 12:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759433451; x=1760038251; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
        b=PIW0rJ4dnNSaUBViyoFYRhUEwf7G8KdbnKjXHMjIfJZJO+7IYBIV3Knuvf1SWK2xJA
         ZpNrO66udeQXmoHf/vNZKSTjzihsWhONq1yZSsMEx8r2y4if500ZLB6U0Ax3fWmHg7Pk
         Pi9jc2G1w51MiKyty2yjaLjt/w822i+ZqzzHWGZguSi3wpOdEKJapZRZOfXkPO+W4y5O
         wk1sA5JM7SxoJaWc64mgNWANw9eKgTWTeWoT+nHVKs1iGGQ4Jp0cCuDEEN5Z8QgBNX67
         LALgfZ6dnOyqcjnlRgAfXsE8yNUFV19thFux22+vX3XqszlshbGRrxN9xcwq/RpMssw9
         A3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759433451; x=1760038251;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RavlUV38xKbCURMIaXHAVGr9bhvD+BobklBpey5pr9E=;
        b=LwqHm66sr8zhPhR3qsyGAh4+pSlX09T/SFmGVjbEMmxtgu4RYR1g6xcz2FtpJzpfNY
         xDwCDZW0zYOVM0smt9b95olCgO1l2+o6DQe/aodir8Diov4ehsi+4ghk1oyO+nvtao6s
         gah+mZxbE6ShSAfVHqIQxpveyVUrNDmiPXrME2n4GodjsbX5UD9eM49L7mUZrKYwMlkI
         JtXfhZE5GvWD6jKIBTY0sVqJYps7Uqln+ucPrftaYJEyWoapqi5X++5lQ6vj9WaExQ2Q
         JwRQG/h9xOIYITmyfaAzVIxG5TjEDF/KlujhrZWRiQxQOgzd58uXrOhhyqEsxwvdgj2P
         ulQA==
X-Forwarded-Encrypted: i=1; AJvYcCUBawlETZbb36PPqjO/EEMMb3gtHtUUg+BrZzRK2veOrDaNaqsfqrELRtLCOZCM6NvAHAD/Lo6SCXs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ESpvcnU45BfD5SVhd8jPpoNN0mmcrZvV28SquTExSl9qIOvu
	zcnPAzNsGBwOTzFosea17RaXFi0/svIQbNyJSjEJKvmLjMuUjUDtgwkB7Kdh8muNtA8BkWoxINZ
	jp/HsRSDUQeZgz+SXCRJg35MlS5F4UCioEvVXXaCI
X-Gm-Gg: ASbGncvSPNwXKIziTCHQrjqegz0M2Lkxnu1mqzeTaPM9khkiFGNxwiGTXd8kaX4BPTB
	c2amvw/JHgz2+QNpivtUbqR5ldhnYac8/c/T19bEbxYMAYm7Zd+f14OnCIPfn4R2g6xAbziERy+
	MFNn/JdUSOqJpTIQeviE0GFTmrNUHFY2XpcmrCW2VSVjSnEhgei05LNgEspusuM6GBZHLBHRWKr
	2Q0/1Yebf3+nGJYuoL/2kLBy9B81kXSDWA1mOYtck/SWx3nxm8zAViZEjC/rIvR1ZJZ5OCYFfyE
	Pco=
X-Google-Smtp-Source: AGHT+IFCU6uBe4gWMYCNHz3kAgXiO/K7bY0HyJGwPrChQwZ9JM6yW0mxGVSnRHqeL/KB4jYDo6HP8b5r3lGA+u45RuI=
X-Received: by 2002:a05:6000:4024:b0:3ee:1368:a8e9 with SMTP id
 ffacd0b85a97d-42567135148mr286275f8f.17.1759433450604; Thu, 02 Oct 2025
 12:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250926-topic-tbt_header_bit_fix-v1-1-122238af5c82@oss.qualcomm.com>
 <aN5fpicXs-JwKvQo@tzungbi-laptop>
In-Reply-To: <aN5fpicXs-JwKvQo@tzungbi-laptop>
From: Jameson Thies <jthies@google.com>
Date: Thu, 2 Oct 2025 12:30:39 -0700
X-Gm-Features: AS18NWCP5sKgHNdu12Azk2AdvFWe9eB4GL8mTduwvhesRx7j7Vpkw8n9TtAOPbs
Message-ID: <CAMFSARdM6CmUwfntnbG3THsOFC33KyZnR1RVLXmYwFJum+5K=A@mail.gmail.com>
Subject: Re: [PATCH RFC] usb: typec: thunderbolt: Fix Thunderbolt adapter type
 bitfield values
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benson Leung <bleung@chromium.org>, 
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, Andrei Kuchynski <akuchynski@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,
thanks for raising this. Yes, it looks like this works around the
current faulty definitions in typec_tbt.h. Where
pd_ctrl->control_flags is assigned in our EC firmware, the
USB_PD_CTRL_TBT_LEGACY_ADAPTER correctly gets set to 1 for TBT2 legacy
adapters. So the data.device_mode assignment you are updating here is
currently correct even though the macro is incorrect. Your patch LGTM.

