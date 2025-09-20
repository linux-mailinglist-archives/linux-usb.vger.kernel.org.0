Return-Path: <linux-usb+bounces-28413-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AFB8CD7A
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 18:52:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D0EB7C2309
	for <lists+linux-usb@lfdr.de>; Sat, 20 Sep 2025 16:52:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CEFF2F7AB2;
	Sat, 20 Sep 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ipHxqFzg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563961E0DFE
	for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 16:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758387146; cv=none; b=DlYasRtDONh36T9BbgyZxfbrG7eCYeKnti4laAYHoic4PIZ7EZmcJaZN/rfPkf+fVJ2Xh+D1hY2FnrTZhoi6BMVUqhoOKT+B/0EILYMI/XWBRdTNMAVj51U0ZshznUHs1yM4DjtZkjGhAJkPZmCbOkpfMx7OY7DGdRf/IkDU45Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758387146; c=relaxed/simple;
	bh=GWpvS5x6cG1Y4f2S24NEW8dN0quQ/cx+TBhU9hoDln8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=URRdfB2JzvVX7apAAfwvfOwt70PlDxwu/RZ6lc8kGcyB+eVAk+N/63IrwkvpzFe7lHraj8YdOgHDieANkHSB4i3BAy5LzoCMbbrwkqc2hry7NQa334Dgj/2G1MSahywI62qxMMVCoD/CWi9iJvDvFjCRrmAg8POSYUJhexzbMmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ipHxqFzg; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso5606066a12.3
        for <linux-usb@vger.kernel.org>; Sat, 20 Sep 2025 09:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758387144; x=1758991944; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6t0lvNAvBHvFjIYOZdnPwHv9uI7zn4mkRak4VLc3x+o=;
        b=ipHxqFzgmWoxFnQBawz23NUMuyU0ry9vKhPQg5SDsvLh7zDpF6y8iv7WehZmb5f6+M
         91kdYgsLlAALngU2ik9ua4TeCacnnRGXgqrvBlukiESsLAwhrP+jnn1s2uiSAvSTKXr0
         oLu49Fmz5FXaABpW8TZzLAUvrkIcqoskVU876JuWQM74ggnaaBfsdJ4Kd5IgDFg6fbiu
         LfdlpMWQBDpJUMCGYWLHC8uBFT1Cm3QdUDlX9bdmHqUd8qxK/Bnu8M54fnIivaELmfiS
         Y/fGCHn18bCEwhtRl+sk7Sacl8wKNaXj5ZOz3aTRnd9SicgFJ0Z77s5+KupjlUQs1gRw
         1m2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758387144; x=1758991944;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t0lvNAvBHvFjIYOZdnPwHv9uI7zn4mkRak4VLc3x+o=;
        b=Y3R8mW5kVaGQAsbFL7ODLWRyEiesa+uSrH1at4h2TxLTZoru3mlbsuBhKitTz0NLBV
         c6cPthBNdWXDL/BvrHCse/xNRzq6ZI2GPYRZybbCENRJeWlc5SEJFL/0kYcO5HbmkYmH
         9Zrbz9ft/6gyJavOE2AAOaCUSLxD9INxJ4B2sGqSaMhqi6WmZpWDuv0LraRTE26r6prB
         vvVF+LcUVb17TMvcodjiKYIw31ExePMwFknN2zYZCht6zw1+BV5r/KezikCVQjYTE9HV
         yat4NE+qX1RYhUAg/CpjnIdgRNYryj5gaZqXsKB8j1ZWbus+kZS5422emc9ZwbUqgLId
         b6cg==
X-Forwarded-Encrypted: i=1; AJvYcCX8dOuOgooWL/K0ZGsQPXv6MTsOCf0J758+ry2gEghfFS9h7DfRpOyjKjXkQIm6eSd1Qu1bNb+7pOg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfA4JvRRheCruw5DSGHzXl5IfIuP6Mp3aBRy2pBaCUpuNVhTxm
	PAXW3vF9LNGCvv0d6JVHPmaBHDVOXJlbFYboSOPlawcuIWuDRxOa2mhFz6LaP3nc+5L1UhHrj06
	zOwo4qZkpUSPxEAPIieZff5XC2wsdJGo=
X-Gm-Gg: ASbGncuyRRDoI1Mj9mhjT+AV7MXmQkTZ7kZeipbuMrlnzzz+y3jw22t8SN1CzeEtpn6
	YZHshbE3RZ/cI9G49aUlmf05t/xJhI4gw9OUl31i0smSujUUtCMPHux+DQoLlP3SVGp+ac85jm/
	WpM3eShS5y7QiC5/M9SJLtWICn6wyUCIdOq/nwZ51FttB7BJQG+LeUAUBCDyDXw497FkJ/UQfxt
	JlHaKwNCsl7kF6bWlbSuO7gtg029ERzuj/TubPGZnGqcIXOscC/fGlMMdMN4IMFAtE=
X-Google-Smtp-Source: AGHT+IHHbxws3SREQHUm9DXYPSh1lNZGC+x8Xy2uJwCBquseYOMfarK/RwziU8Ml2w72ef92uUul+cCZANWL5gTtfzQ=
X-Received: by 2002:a05:6402:1e96:b0:62d:6cac:1ec2 with SMTP id
 4fb4d7f45d1cf-62fc08d2120mr6186264a12.4.1758387143494; Sat, 20 Sep 2025
 09:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250920045059.48400-1-viswanathiyyappan@gmail.com> <5b51d80e-e67c-437d-a2fc-bebdf5e9a958@lunn.ch>
In-Reply-To: <5b51d80e-e67c-437d-a2fc-bebdf5e9a958@lunn.ch>
From: viswanath <viswanathiyyappan@gmail.com>
Date: Sat, 20 Sep 2025 22:22:11 +0530
X-Gm-Features: AS18NWCYwk4g8GKTtmeraqfyKpXAyJkc7cnfC3ztEpzTK4PVyVgiyuigIenJluQ
Message-ID: <CAPrAcgOb0FhWKQ6jiAVbDQZS29Thz+dXF0gdjE=7jc1df-QpvQ@mail.gmail.com>
Subject: Re: [PATCH] net: usb: Remove disruptive netif_wake_queue in rtl8150_set_multicast
To: Andrew Lunn <andrew@lunn.ch>
Cc: petkan@nucleusys.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, 
	linux-kernel-mentees@lists.linux.dev, david.hunter.linux@gmail.com, 
	syzbot+78cae3f37c62ad092caa@syzkaller.appspotmail.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 20 Sept 2025 at 21:00, Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Sat, Sep 20, 2025 at 10:20:59AM +0530, I Viswanath wrote:
> > syzbot reported WARNING in rtl8150_start_xmit/usb_submit_urb.
> > This is a possible sequence of events:
> >
> >     CPU0 (in rtl8150_start_xmit)   CPU1 (in rtl8150_start_xmit)    CPU2 (in rtl8150_set_multicast)
> >     netif_stop_queue();
> >                                                                     netif_stop_queue();
> >     usb_submit_urb();
> >                                                                     netif_wake_queue();  <-- Wakes up TX queue before it's ready
> >                                     netif_stop_queue();
> >                                     usb_submit_urb();                                    <-- Warning
> >       freeing urb
> >
> > Remove netif_wake_queue and corresponding netif_stop_queue in rtl8150_set_multicast to
> > prevent this sequence of events
>
> Please expand this sentence with an explanation of why this is
> safe. Why are these two calls not needed? The original author of this
> code thought they where needed, so you need to explain why they are
> not needed.
>
>     Andrew
>
> ---
> pw-bot: cr

Hello,

    Thanks for pointing that out. I wasn't thinking from that point of view.

    According to Documentation, rtl8150_set_multicast (the
ndo_set_rx_mode callback) should
    rely on the netif_addr_lock spinlock, not the netif_tx_lock
manipulated by netif
    stop/start/wake queue functions.

    However, There is no need to use the netif_addr_lock in the driver
directly because
    the core function (dev_set_rx_mode) invoking this function locks
and unlocks the lock
    correctly.

    Synchronization is therefore handled by the core, making it safe
to remove that lock.

    From what I have seen, every network driver assumes this for the
ndo_set_rx_mode callback.

    I am not sure what the historical context was for using the
tx_lock as the synchronization
    mechanism here but it's definitely not valid in the modern networking stack.

Thanks
Viswanath

