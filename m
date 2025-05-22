Return-Path: <linux-usb+bounces-24219-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8E7AC07E5
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 10:57:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 695AE3AD219
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 08:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8862286413;
	Thu, 22 May 2025 08:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jisc/KJb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15D52356C9
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 08:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904137; cv=none; b=eo5iuliRjdWoTZ9Ob28DZj+3FQ20NDzh472AtVZqb+nC+oJFpUs7Ga/RK6H+whJEBQvtEefb4N2B6WiKt/Xc0jZ9vrREgNxLlZQkfpawUQgtOTcrSAbMpYKNrtCREyJaDRepp8Ss1MTIcaq7fVb6Xd6qwRcJhP/LMmssXSUlwNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904137; c=relaxed/simple;
	bh=CpauFDWXlkQ7aXN74FLEkhjk+C+tiXJyIbkc9eB/thA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g+GFcNxiaaQwQNTZipLEPRexQfKijV6kMWEJAqyklQ1P3ABa/yRqZKdZJMPIw/yRoX+qf+PwHDNU7mfawE6M8+julYUvmQFkX3ujz4+MFp3/ZBAEXiB3GFtjr0X8U2eyiLrpxr1qodLAq6qxe+S6Gxg4+AWJ34GZCoLO7qiSoBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jisc/KJb; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8ae08e38dso79879626d6.2
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747904134; x=1748508934; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CpauFDWXlkQ7aXN74FLEkhjk+C+tiXJyIbkc9eB/thA=;
        b=Jisc/KJbu4KMlSmLJn791KFWXIQWoEpsob44LDw2jOpYzUpkqniwvHuchzW+akjizz
         3XHJ4nzH1WIA4H4I4vtY3N9XN/Tqh00hhf+7/5MHbm4IVSG5ni5VqVUjHvQ2bHkYDbOP
         iNj5bbOXqKmJM8PEAjGFkTpMztK+ruFEzmCJtprzs3Ys7qEy8eLe1vXPgZ4Iu7vH1Vd9
         vXkDZsiPJN8AAHtWGXVJ3FUcGH5B4bPVHhI2HR91uiIHHlfvqlm+i7qX3/ZZjEDHlQZ1
         o7YUXxtuETQp3g7mHvg2Xy+TYu6L7yNPFbC70D5wy8Mw5YLNvxDowMzfeY4UASQQ2B1i
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747904134; x=1748508934;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpauFDWXlkQ7aXN74FLEkhjk+C+tiXJyIbkc9eB/thA=;
        b=qd1lipgMz5sp7yC4YruVuXn6s8NKsajITOOIYZS/mZoMDa2xfpYgB3QGdephSZBB+B
         YtOlj5/rY+2NejDGzaykf39zkDBLBf6arGVlxSkL7xs8W5US/MzVe8BHwl36zHM5IIha
         HXy9KQ0GTyzqhJQAsTFg0FnNf+XODhP3sEpPdYAgFy39QN4G9Eie4WXVaj6ZpJ6XHHBp
         6Hc2LAHD6PuIja5PEvtgcY5QgwFWDF4qgE8+8eJtyWDXOn3RXMoMuenfX5uTgcNnN6nD
         rmoUsYJhHUZdC2BWHNyvyJ+e5uBfp/ArEFFJWPD6C6sYMAYrrSUfgJRDh3JnNmNL3ZMI
         T4WA==
X-Forwarded-Encrypted: i=1; AJvYcCV4vdkuuCFBq0If3fRhz+uRBTnWn6e3NADgxw71itFyjdDV9q/HecRAerX4UBfgq5KKagRPXKQjpEU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyPu8Cf1KGyzKqs0OBiMEeaYhau6oIRJroavEmAmUAh8N2DdgP
	mwXG8q6l0XmzKWpTubBtq6NjnSZCvFknrU8jwsh+b79QTm2DU4n32DUyZMLeENEOJDdCbaqaJo9
	MYAwclfnrD1BA8j6xmO5pboP5X5w30bM=
X-Gm-Gg: ASbGncu0TPcng2VMes7zE7r73rxxQKjaHYjYeOS5do3/GP46Osc9ZYmJ/kqnAc2M5Au
	agmZ7OUR+ek2CkX5fgQ9Yq/Piv3McwxXCVpwYwKQd05ok6kAKKeqe0eZVAd/k82W+91uZZh9AB2
	fb9MZ5g0v8E2ackPQg8HNgx84LI+rZWirP0g==
X-Google-Smtp-Source: AGHT+IFSrd0xHS0//0Vx1Qf6C8nWL8cI9xEXdCYw7pywGHt3ZTIRQsKQeS/aTcA4ugwR+rMnKQLrKVNWLW4bR2htLvo=
X-Received: by 2002:a05:6214:cc2:b0:6e8:9b52:7a1d with SMTP id
 6a1803df08f44-6f8b082872amr389160986d6.8.1747904134671; Thu, 22 May 2025
 01:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521132354.1104-1-charlesyeh522@gmail.com>
 <aC3u6uCMin_0SXWQ@hovoldconsulting.com> <aC3vf5l4WacJcykH@hovoldconsulting.com>
 <CAAZvQQ7=UueHS_jbJVsiKMm+kf2cTW8gqHXvr44dbOdYLMgqqA@mail.gmail.com> <aC7ji_pJtOGXlnBN@hovoldconsulting.com>
In-Reply-To: <aC7ji_pJtOGXlnBN@hovoldconsulting.com>
From: Charles Yeh <charlesyeh522@gmail.com>
Date: Thu, 22 May 2025 16:55:23 +0800
X-Gm-Features: AX0GCFu_MlK96JdZhrIUZ9KB92gCaGmf2OwiCZ-SZvTEXSfGPG_kcB7mXcIeXPo
Message-ID: <CAAZvQQ4Cn38swq8k897w=wfWR1RdG5r3mgv-twhiVKBp8MAwDA@mail.gmail.com>
Subject: Re: [PATCH] Add Proliic new chip: PL2303GC-Q20 & PL2303GT-2AB
To: Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	charles-yeh@prolific.com.tw, joy-yeh@prolific.com.tw
Content-Type: text/plain; charset="UTF-8"

Hi Johan,

> There's no need to send a new version of this patch as I fixed up the
> summary when applying. It was just a reminder for future patches.

Thanks again for your guidance and support.

Charles.

