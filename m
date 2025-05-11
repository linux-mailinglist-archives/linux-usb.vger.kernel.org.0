Return-Path: <linux-usb+bounces-23848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED45AB2929
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 16:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658BF188B75D
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 14:38:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3891F25B1F6;
	Sun, 11 May 2025 14:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0E9AawhQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220A025A344
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746974285; cv=none; b=AIYyO+GtWL/agkrIFq0Euzgzk7Nr074zRjjKb4ivFYjcIvtD+i422VlDdGeu5U062Gen1Q+ZD4jMruGSxOkiLxNXxMMEXTBbKNc6KCd1k6p0FSgOWYdFS4F1R16ABGaarcWv81BRQ4CaYQMmGEMCbph1EOj5L446hIe63eCwo8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746974285; c=relaxed/simple;
	bh=8bl3KG/FnieTFJPm8izZLh/ssk/QFseWAgjoneCWP74=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UHA2WMOqELFXFuLMn5hnoYAYC/I/VOsMmXFT7dsEmtMX2n+QpSJ+/p+8VaJ6Csfqqd07Ne7x4mdeTVHH1Dj4r/pbfJvxCmr/r2pP25YFseBWNkk+KbZctQwxn5x7e/yzRCUub27QuiiV4jOYPztuNRIecvZSMZerUbi+Bqea5Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0E9AawhQ; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3d93deba52fso10199365ab.0
        for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 07:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1746974282; x=1747579082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gLvNwccVZ0cYmbj7WRvgYRBYA8Okxhxyw1Lm5uIekF0=;
        b=0E9AawhQi2Z8MqK6MxEDR07yBjccjxZq/J+5HeHYVGByZfjM+EvQ2zZuscBS8XmdJN
         +gXXjlwuyPSEuh8puSPj8tVAI5R6VwqiBxvDjKyCFyjuc8SdgZYBpFnM9mV5oCyBqaKH
         7wJaskaUjVkCUcty5B3Hl4TBnIY8P99Jy0cxapeLsf5XAg3QPB8130iH1z0tnvefHoHo
         sK8Ek5HneMxfgHupGBqmsWXa6KNEECtqsQilVNftYbCYNCF2GcLOYLostY7jFMgbr4sN
         H/Ef4h936ZpIHiZemSi5gSs8xJixHU1TD2wzSpEaq/e0IXJrGItGkzDXk7nJCqIn1i9z
         eR/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746974282; x=1747579082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLvNwccVZ0cYmbj7WRvgYRBYA8Okxhxyw1Lm5uIekF0=;
        b=Eallx/di5csYKmEqu9jUKSVdWJ5pLDvFMQcccjExPNMpTjDPtOUpyLXG00PKq0gSyU
         48CGb5b4Nx4QibHKbaCQ9B3Xn58ary1tZvpcaCinwPFWLHx8gd77YO+zUJ7iWCAF0XSR
         FREMbwPtBmiTe5WlomsaVXPfrcLWw1ZD+fIq4SVTMjSdWWgoWWyDApaXEXHsQXuDJ+jB
         MdphorpuugSsk8+N6zqpz3HS1dkIN/+8zV8oDaKPDPxw44S0xy2YRAz69YtALPkuWkHf
         dp+Bcoga5hLWKhQ/0/x4zOySLZURipACUKb9JHCIqtNwSaZuvKo/m/bd2HLPHfRs3F8T
         Ftrw==
X-Forwarded-Encrypted: i=1; AJvYcCWgq05RbqrUqCyXqJTTF/QnTMwmRGYDONyNetYuR8K+hfeK+bR3NzpxKooyDjwcJooJvuzkqWtgrTI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpFpLOtF1+OyRK22yNudPmLuvaLw4BXniro752NkQp2pWDXlRo
	qMxCZ7MumAsfBA3EWqYCXrHM5i6Wx2KTR3tpTTSV8yhsTG8k3L/QVpd56VDM2f4=
X-Gm-Gg: ASbGnctyg6Mw7i3Wiij1MYGPdDYMPz0ogjp+McOq62FvJAF39JsJb6xUNDFBM4Vi/W5
	gwO0vtQnciB+K2npSYjyRdS5ZWZ2P30h6WJ9dwJLV9JsmusIVOywk2GZWRGeKV399aQuQ/4dc7o
	m7eNj88JtPNNoQXdc9RBYBOVbDvX2GFgxsbquL+FTFH3Vik5h/+YzWjpeNBea9IflRgjfQh7mFz
	GkRhKlT+Bc1xx9icuwn8+cutOd70rNr2tgfxz68VEYM6kUkVYwcOVCeLVdij9Ob7fl55dpmW3YN
	h3FWW90pcZhAR0eZumFATFKtHuqo+t6qM7Xt5xgpm5G0H0e0
X-Google-Smtp-Source: AGHT+IFmI8KNYL+OA7GhNF+oltU2v5+lz8V4cUzVkwfC6r+xMTSFtJT62p8l95UKs8xmv8rLtYxHjw==
X-Received: by 2002:a92:cda7:0:b0:3d9:66c7:d1e8 with SMTP id e9e14a558f8ab-3da7e165314mr112425165ab.0.1746974281771;
        Sun, 11 May 2025 07:38:01 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e159bdbsm17947385ab.44.2025.05.11.07.38.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 May 2025 07:38:00 -0700 (PDT)
Message-ID: <30676ba5-a901-4789-be07-224108ab66e6@kernel.dk>
Date: Sun, 11 May 2025 08:37:59 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [io-uring?] [usb?] BUG: unable to handle kernel NULL
 pointer dereference in module_kobj_release
To: syzbot <syzbot+3ea73421f5aa3f339e9e@syzkaller.appspotmail.com>,
 asml.silence@gmail.com, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <682074be.050a0220.f2294.002c.GAE@google.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <682074be.050a0220.f2294.002c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz set subsystems: usb

-- 
Jens Axboe


