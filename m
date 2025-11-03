Return-Path: <linux-usb+bounces-29993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC42C2A2A4
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 07:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A72021886B72
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 06:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A48028DEE9;
	Mon,  3 Nov 2025 06:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bGsIZj3C"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6940B238C2A
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 06:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762150935; cv=none; b=otVJZd9lJyL0GwPjXiZkzz3WJ1X5tLxb032H3YXGq+iEhf0q2scFG/Bbo8wwfntwhg41fwROGyXXsehYdcPmcjRbIUy78tMjVqSzH9z6ca2X6ThCqlQj0CB6Llo3kNfT8Qop1izCN4/MD1qQ7chD9pcok6cW1OgS+Not5OMq9Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762150935; c=relaxed/simple;
	bh=rb4dyM/Yuy2WZtXXeDIMUIO+6FwboedKVKiZ/iYN24g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aTVE2OixMUpYY1cVkpS+ikJAOKBBZCT+R10RaePWNcLlcdXG1OCx9rNnw3Abj93TO7vMIy4PKQuM0JoMWuUjvBarDmN0ZwEKmTU7eBV6Yg44dNkbx8LdPkutLs8FNH5p34dFXLp4pLs5fuANUZ12fZpbOtfd3ai3/5PA27dKiko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bGsIZj3C; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4332acf24e2so2489135ab.1
        for <linux-usb@vger.kernel.org>; Sun, 02 Nov 2025 22:22:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762150933; x=1762755733; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rb4dyM/Yuy2WZtXXeDIMUIO+6FwboedKVKiZ/iYN24g=;
        b=bGsIZj3Cg3DSo+dKbVMD2DKDFuI65fp2hIrIL7cIL5lCKXq9i8sPbKt5/BZOfM6d6k
         Mk5k2Z9lbIsAQzsWkJ+IixF5fIb9ixgoRVyJPJiw/DX6m5yTXfFarV8O4Dh30EC4XkSR
         zaVoePJUiMGTzXpBMVpdJbYgpveaJbe2aLvCVq2gvqb41h2kNgtUw+O1GdDEr2x87FJ0
         WntazTKS/ydbawOsEv7f+fnigJkHSsSz79YvvZplUHD68lBNoUQ61BdUis3F8XAUUA0d
         13VjbI6tPxophWRFc6VupEvrBvAq4A+ob8XPU03W04COhmY9aTZYptokD3eUvooBPLCY
         f5vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762150933; x=1762755733;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rb4dyM/Yuy2WZtXXeDIMUIO+6FwboedKVKiZ/iYN24g=;
        b=A//k+j4xQG3KSsXdlTNCLDTMpPgNEwLhSjMcsD8DnnKDovVWmf246ht5a5rvetkY8e
         5bRhx4r0DAa3Yrk5jFQmfa15eUbWjguSCF1p6q24V64OhyblmK5Y54fkvu/rBHGEPZUm
         wVnbxTnmTSGOfXDxu8h47hlZ1BhUddkfJj7ZUmmyDD/DY10FECP740CQGU6f8nYf4L5k
         s7aWbHdm4NWsynogpmAPt9N5VEUN93HScoGu8qxYBa7cNbleQvb1R8BfKwa3N9IiuTkt
         y+uD8U0KgTrDOBFdnWvENCFg31FCSqQCffIqDlgTK+AC/AqX/sPvuJe7ITOShyr/+gmk
         Fw9A==
X-Forwarded-Encrypted: i=1; AJvYcCUrQJixeDyJ8jg9E8hHzCY+PRzyQgnOM/FOYT88SM7dky7tCn8KC5efBdl2uquvQAAUD/SFHx+UFYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFoXaKQtEO+9wIVcxOQg1FXY6uZvipSRUTnyO+dHI/k7cx83b4
	vcbyp9fshvS8ujvbs8XTHzfrcNwko6/tARYJhJFxH2GGX23PWDxK9IO2A8neXX8UFTwlA8SzRtT
	GFcnt3xa1y18UIXXFgD/IR7Gy+MC/f2w=
X-Gm-Gg: ASbGncsz+nIAQzQyRGz6t2xKM+zTPpTg1kHarBzAi/F/cPpjFl6cOb6UuubvcnuiYmy
	k153E5yGUu4EXggAeiULGoM2bnWKrwNdVRhjLn6DNMkI3yodZjKL4IcpcJD/GjNXE49qFiooJJ/
	9vbmwfA25N9lGUbEZmAwMcTr6ntJMWgY2rgtJOfUsXDGv50SDLaxNvLglYOInL7Ha1e4wEic4BP
	0Fqb152a70ZXr3n79nfRFmyVjLY2y7AboiVzK0wWmvvo+7dYRFE/aitW1lv
X-Google-Smtp-Source: AGHT+IFerlhl2whO93xOi+QNdyYDwG7BeOyS2eUhqlGW6ibfpP9TKXst6mKoqUfMuxuNqqDJPJRI/p9a5b7aJzxSaCo=
X-Received: by 2002:a05:6e02:23c9:b0:433:2aad:9882 with SMTP id
 e9e14a558f8ab-4332aad9b53mr42219965ab.23.1762150933427; Sun, 02 Nov 2025
 22:22:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFNq8R7q-GvFgwRKewzG=ZwkbxEfhKjEsxHWXQ0q8BsSSDFcnQ@mail.gmail.com>
 <2025103049-suing-renewably-fd67@gregkh> <CAFNq8R6uZSS3+nWXkR8XERjMRGTC_4_47UKm_N=P8Um5ySLAtg@mail.gmail.com>
 <20251031224113.4ml474v6fuiytkcf@synopsys.com>
In-Reply-To: <20251031224113.4ml474v6fuiytkcf@synopsys.com>
From: Li Haifeng <omycle@gmail.com>
Date: Mon, 3 Nov 2025 14:22:05 +0800
X-Gm-Features: AWmQ_bk5e7q-1jThFQlDmCtILq-wPpntvG_sdjgGSUoZhwzhlIRhldjVAV7nw0k
Message-ID: <CAFNq8R6tk2VVpsmG-5dS0UPWRQF3TgVH-nhJ+6bbR1yYSS3UAQ@mail.gmail.com>
Subject: Re: Issue with DWC3 Gadget Driver: Stall After Transmitting Only 2KB
 Using Scatter-Gather and TRB Chaining
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, 
	"Felipe.Balbi@microsoft.com" <Felipe.Balbi@microsoft.com>, 
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Dear Thinh,

Thank you for your detailed analysis and suggestions.

Using a logic analyzer, I did not observe any NRDY or flow control
events on the device side for the corresponding endpoint. I reviewed
the handling logic in the USB ECM host module from the latest Linux
kernel. It allocates the receive buffer based on wMaxSegmentSize,
which is 1514 bytes, so if the data sent from the device exceeds this
value (as the previous 2KB size did), the host's behavior might become
abnormal. I will conduct an experiment to observe this phenomenon.

What puzzles me is why the device's endpoint does not generate an NRDY
event in this scenario.

Best regards,
Haifeng

