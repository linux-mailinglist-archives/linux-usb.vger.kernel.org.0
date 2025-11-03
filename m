Return-Path: <linux-usb+bounces-30005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CE719C2B4F4
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:25:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0A9CB4F1A09
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:23:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C436302166;
	Mon,  3 Nov 2025 11:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I69Nt+ZZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70B42FF678
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 11:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762169010; cv=none; b=onaEoEVuzx11rSfcjetPOmxGNAm4tfk6WdpdpgzxCm4PvuKgp3xLndEwnLdixDc7wdzPEfbPtxjTDxvjKzkaIC2fMAwhptscLgX/Jb/ge+ZDa5u+1SV/Heuei+8H48N1a7+jpEpDPatfz3SBKB5MDz+OC/For/KpiFmGNaSoF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762169010; c=relaxed/simple;
	bh=zrhN/426GIFilnVCj4jC8s7WHQTdZuCf3dYpf2RYbrU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jl65mmogx/2TdsB22M3NYhRKUSkZDkDxYmm6HoOrikuhRHgmtZU1A9pzubzIQkrVq8hzsSZu40oPE+K67rEdi8h4Ysuu4t+iPbDEHcRuIZtRPaBMMRItwcVNMOwG54o2cDm8UvETVuMvTcfvnZD2g5fgEVoKRY9DeHgJyCVn2+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I69Nt+ZZ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b7155207964so96431866b.2
        for <linux-usb@vger.kernel.org>; Mon, 03 Nov 2025 03:23:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762169007; x=1762773807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bTiOq3s4Du2klSTxft/DNgygXTqBjyM4NTyZGqGWusY=;
        b=I69Nt+ZZiN1mB8kdAgiRvjcMenTdUvXmY/pnc/P02Jqgw5pxoidebb9JyI1WKhy0Wy
         0rfT2QPC75uexucKKTbO9H6e1DHsK4Z5c6Bp/ADNs2qYexwNsMRhDK6kymfkWOPI7nSE
         JhThI/u9wOrCh2Z02Mi7hLCiLLAbhVFDhrjsGB/QX3rKi1+FyxEDVJ38EBvjGoPkUwLj
         UVNXZLyZThKCqKf5EFZ0Y0iMn7pr6GPi8f8JYF+eDSiCVEeyEmefPLQ6DpnJSp8/TKW9
         fzFrnM3mJJIVsvgRBM8R+3HaKoRR90TNBDGCkSbC4YU7lUx0zZCX6Ez9rRG0qbA/skzf
         qhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762169007; x=1762773807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bTiOq3s4Du2klSTxft/DNgygXTqBjyM4NTyZGqGWusY=;
        b=Z86yomH6D1symcgv8sxoJhRnQxiXH5CdYlKpDh6zj23XDRE4r+GnaY7SADbwlaw7Ur
         HV/21kNkQgEPYHxekSFuXIA8xYWG3mBHVqRL2QR3R0jNXq4bJ2Y+VYZz/0KGG8wjFpMq
         7zecciG3hCOnGjveYG2EbAWu9tdvGDcSwVNJaWmWRr6M6h9U7WcwZuUHLk4SarkIRwJy
         6EuJJbH3UNLrTIjV8hrC0Ewr2EapgGdXgORuLm7Sz+NCka2EiXOVlVsUKtSEN5kAPNo4
         k9RC7eJzGWv6F/KzTOo7XJg1r7DoZtG7i125R+wN8ciXG7GqLFDGGNQHNP5Zx4hU7rR7
         4h+w==
X-Forwarded-Encrypted: i=1; AJvYcCWpBdcBgD9P2JpJsxRHgxTMi2QWhXbLN11RJJ6wqlyPj62tpoZvPezvvHpfY+B2oPfruxo4soJLPdE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhD1wauf+VlZocvmF4OnuD2kTndgKgSVoylct7w+cmt/YLjSG
	BOjuNoKcJ96VYnK7WGi9ZkTrBWRtgCDyk/PfENlHNwj5GukW9amNFTR6
X-Gm-Gg: ASbGnctuo4bfEaZdze5cS8R1tgiZa01mSbsP6F5sRM3hbUe7OrYVlXq79YVC9BijiAE
	LefUkF+BZ8RJTrTtecDNUHj6SZxEaYoPrNFaMbg+eWWihNoWBpI1BiVOdkzdrW+bfEy4FBo5ZEC
	Ogm6jwg9XPNvhPnpyER+8Bkisl/QbUIJu6aJ5q7LQChopuG0ngk7IWaS1gF4/aKuj9KFtk+szPY
	BVdhzSce85PeiTR9+bxTuSjcHWk5Fv6DleH/WY12diOhuYZ8T+sfG4SHsTjFJEYFnQ3/zRrggiB
	EmuaPhKB+8fh3lBQXNTtmYEDv/dAnVecojb1TfVAVirLZEfLdIGqltEXXRjniQn9uEdlvLZ6rN8
	owjqMotwuf4dP5nwiAovPZE+srILUxVW5MllK+UsBZkfKPLfoLo6t+CtBvi1fWHFBLIssaCwNdu
	HWMQzqC3Ns8PyYw1w/LN/AJqo=
X-Google-Smtp-Source: AGHT+IHSVTw67BWDPb21rBazTbhQ1l5vnr08OXapMWF6VsDckr7xusWomPoiAMolfRR8VzInf7Rdxg==
X-Received: by 2002:a17:906:3950:b0:b70:ac48:db8d with SMTP id a640c23a62f3a-b70ac48fb80mr408438566b.28.1762169006942;
        Mon, 03 Nov 2025 03:23:26 -0800 (PST)
Received: from foxbook (bgu110.neoplus.adsl.tpnet.pl. [83.28.84.110])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70b9f29c8asm358534466b.8.2025.11.03.03.23.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Mon, 03 Nov 2025 03:23:26 -0800 (PST)
Date: Mon, 3 Nov 2025 12:23:22 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Guangshuo Li
 <lgs201920130244@gmail.com>, Wesley Cheng <quic_wcheng@quicinc.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] usb: xhci: Check kcalloc_node() when allocating
 interrupter array in xhci_mem_init()
Message-ID: <20251103122322.5433a7a1.michal.pecio@gmail.com>
In-Reply-To: <11d7b29d-a45f-48e9-bff5-cb94150d0bdf@intel.com>
References: <20250918130838.3551270-1-lgs201920130244@gmail.com>
	<20251103094036.2d1593bc.michal.pecio@gmail.com>
	<11d7b29d-a45f-48e9-bff5-cb94150d0bdf@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Nov 2025 13:02:06 +0200, Mathias Nyman wrote:
> > Hi Greg and Mathias,
> > 
> > I noticed that this bug still exists in current 6.6 and 6.12 releases,
> > what would be the sensible course of action to fix it?
> >   
> 
> Not sure this qualifies for stable.
> Is this something that has really happened in real life?
> 
> The stable-kernel-rules.rst states it should "fix a real bug that bothers people"
> 
> If kcalloc_node() fails to allocate that array of pointers then something
> else is already badly messed up.

I don't know how the reported found it, but it can obviously happen when
the driver is bound to a new xHCI controller under OOM conditions.

So maybe not very often, but xHCI hotplug is a thing in Thunderbolt and
OOM happens sometimes too, so it's not exactly impossible either.

I thought it's usual to fix such bugs when they are known.
Simulated allocation failure before/after:

[ +30,414603] xhci_hcd 0000:00:10.0: xHCI Host Controller
[  +0,000012] xhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 2
[  +0,000159] BUG: kernel NULL pointer dereference, address: 0000000000000000
[  +0,000004] #PF: supervisor read access in kernel mode
[  +0,000002] #PF: error_code(0x0000) - not-present page
[  +0,000002] PGD 0 P4D 0 
[  +0,000003] Oops: 0000 [#1] PREEMPT SMP
[  +0,000004] CPU: 1 PID: 4270 Comm: insmod Not tainted 6.6.113 #11
[  +0,000003] Hardware name: HP HP EliteDesk 705 G3 MT/8265, BIOS P06 Ver. 02.45 07/16/2024
[  +0,000003] RIP: 0010:xhci_add_interrupter+0x25/0x130 [xhci_hcd]

[  +0,042495] xhci_hcd 0000:00:10.0: xHCI Host Controller
[  +0,000012] xhci_hcd 0000:00:10.0: new USB bus registered, assigned bus number 2
[  +0,007193] xhci_hcd 0000:00:10.0: can't setup: -12
[  +0,000010] xhci_hcd 0000:00:10.0: USB bus 2 deregistered
[  +0,000080] xhci_hcd 0000:00:10.0: init 0000:00:10.0 fail, -12
[  +0,000004] xhci_hcd: probe of 0000:00:10.0 failed with error -12

