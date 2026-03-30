Return-Path: <linux-usb+bounces-35635-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ALGZDOS+yWlx2AUAu9opvQ
	(envelope-from <linux-usb+bounces-35635-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 02:08:04 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBBB3546E8
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 02:08:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9534D300D31D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 00:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 948AB199D8;
	Mon, 30 Mar 2026 00:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AhLeZej/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F888462
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 00:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774829279; cv=none; b=D89EsIWExJcACZEBUnxZBeoX7lY4uJKdgd4t+wLgT2aJhOlfIvUfgv/nZ7Rc9JBkGdONcChE5J+6aHu9s8ciCYi2F3G93rUL3M3fBfexFVkSqsnfZ/xMOPmNITJJo7+Mlf5VyCC2f6DVQJpBls9jl6a/yd6H9UQNGzM9t2RgRis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774829279; c=relaxed/simple;
	bh=Yq9riX/8vRMP7ADY3JFyESEjJYor+Lz7Cm2cGALYksc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gsutFfXwtDSPmkIrWIrbzPOso4OKCSbeXE6h8O1fhPVyFIY5ej2YwwTn24oG+Qu8svbj9TF//+mPSVdyHY+enyYNDjmAHA2Ko8pcWV6avay6ldjk3/0TqqTabHediZlPQNYJuSHKAuL2OjzX44esTuXpoZH6sdCz9OWRzfai73U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AhLeZej/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6618bc129acso5626721a12.2
        for <linux-usb@vger.kernel.org>; Sun, 29 Mar 2026 17:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774829276; x=1775434076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZyAoyi4tkbfM+N0NgYyKQmfoftAr6PLybD0ALVFLp4=;
        b=AhLeZej/mUs2Xc0VTYoVKwqBoLreYhsXJeyD7xcaSIoeg08V/pADoQiDVWJnVJAXR0
         D+Mx5+gVevollCMJbPot1+oyCCENbt+nuBHfnEZfPxRoTlhcERm+yYvcTmQ7XOW82YXM
         b+wGsx3wY8ZCQHBeAuDe5GZMd3ZGPPsiQGKyL/yHEOUbxvpY3XEukoM/BwJoy/7jKbSa
         EzgSZ6pzKKv8k1+DexwP4orCMcM57hv9f3Xg7SIgvC0g0MyDSWh3MJTuCpw6aH5czSMH
         ZXkfiDTJxxTt73mevSEug+nANH+U+0vEX88LFFwzBvge+bvbFYiLyhj0Wzgsf5B0D5uC
         lUCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774829276; x=1775434076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ZyAoyi4tkbfM+N0NgYyKQmfoftAr6PLybD0ALVFLp4=;
        b=N7SneuC9KarSdzCRYgVekYOIDaV2n5i5gCmRN13i0iRRLrlYerMX9qi8PG46C4Llp4
         HrcpIuwHz2WDVjWyM3Tc9cykZPobYcbp6Xh2OCiqk092WigQvnUbn1xBUPr052BkjsXp
         291NLSyHVPL5oQR2rQw1Bu9lii7OfTDnaNV2bpWD6cQwb7EU9bJ+QyBDuWuqA3bBe15U
         eXqnxkuBefkzjI8sEdo3302KDKSxPK3aQ3GJ0/3XE47ty6QTJrNUUez11sg9EI6LGmZ7
         xw0QZZMAYweU8+siMV5tkMEiNJj8tXPC6E/lujM9UUYcJvPIDZz2G2GigIjp7XeKsZOW
         BdtQ==
X-Gm-Message-State: AOJu0YzSgfGXiwCJQMQkQbqNSU0uyR6I9ZdAZ/ZdxebUZfV8KjF3PsI4
	i9c/nm4FZqrDJl6f+LnH/OXnw6sOCfnWnI+TdQz5x6jRa0aOa0q9/QPP
X-Gm-Gg: ATEYQzzOi5+IOtd7ITm3CfJvChwE4KfWHg+ZzRvsqJFAKJNbraueGTukGNFlHrJ+djy
	m08VRyu6RMSNAdJnWCysmIcsu7Guj0q+RdzG15RLfQgLhtY6lkgK0NoHAd5qu0wVOvg7/0I8ua8
	ulajYPiKgT9vtdqU91esLtwK0tWSW6eX7n/+roCaS2Ue1C9D1jhap+lUbePICPVfTq5DyFcvrv4
	xSODgl507gMj/oFMw55R7Z7bJs1a8pxhBUldC9VYkcg2tJXOwnHZHfd5TlytAcwh/jQJRHylXxX
	wcbe1GmFXCbvUAQTPiiFBrejldt1UGz2JsSnKYLWyNB5U56TmvGeTASdGs0iTTRLMt/gvcJizVM
	HuM4gqylZ7oEf5t6LIyB+obg4Y7V5Dm81DBmoMqNzENH5vxlbINrhaR+c6/OVDGMYNFGoeI7ZvT
	UoLMPo1SCVOAgs5sCw3INRW3uhGQHmmcIDt+72Z5ejTIA=
X-Received: by 2002:a17:907:e0d8:b0:b97:acca:fcf6 with SMTP id a640c23a62f3a-b9b50358146mr396196166b.23.1774829275811;
        Sun, 29 Mar 2026 17:07:55 -0700 (PDT)
Received: from foxbook (bfi53.neoplus.adsl.tpnet.pl. [83.28.46.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm208372666b.18.2026.03.29.17.07.53
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sun, 29 Mar 2026 17:07:54 -0700 (PDT)
Date: Mon, 30 Mar 2026 02:07:49 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: martinalderson@gmail.com
Cc: linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260330020749.18fbe433.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TAGGED_FROM(0.00)[bounces-35635-lists,linux-usb=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6CBBB3546E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, 29 Mar 2026 17:52:39 -0400, martinalderson@gmail.com wrote:
> [BUG] xhci_hcd 0000:0f:00.0: controller declared dead on resume from
> suspend
> 
> Hardware:
>   CPU: AMD Ryzen 9 7900 12-Core Processor
>   Board: ASUS PRIME B650-PLUS
>   Controller: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
>   Subsystem: ASUSTeK Computer Inc. [1043:8877]
>   PCI: 0000:0f:00.0 (IOMMU group 30)
> 
> Software:
>   Kernel: 7.0.0-rc5 (commit be762d8b, built 2026-03-28)
>   Distro: Fedora 43 (Workstation)
>   Desktop: GNOME on Wayland
> 
> Description:
>   On the first suspend/resume cycle after boot, the xHCI controller at
>   0000:0f:00.0 (AMD Raphael/Granite Ridge USB 2.0) fails to resume and
>   is declared dead. A Logitech Unifying Receiver (046d:c52b) on this
>   controller is disconnected and the mouse (Logitech M720 Triathlon)
>   stops functioning.
> 
>   A second xHCI controller on the same system (0000:0c:00.0, AMD 600
>   Series Chipset USB 3.2 [1022:43f7]) also errors on resume (USBSTS
>   0x401) but successfully recovers via reinit. The 0f:00.0 controller
>   does not recover.
> 
>   Regression from rc4: suspend/resume worked correctly on 7.0-rc4 and
>   earlier kernels on the same hardware.

That's interesting because there were no USB subsystem changes
between 7.0-rc4 and 7.0-rc5.

Any chance you could git-bisect this?
Are both kernels built with the same .config?

> Reproduce:
>   1. Boot with USB device attached to a port on the 0000:0f:00.0
>      controller
>   2. Suspend (systemd suspend)
>   3. Resume

By the way, are you using this affected controller to resume
(with a keyboard or something like that)?
 
> dmesg on resume:
>   xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command
>   xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume dead
>   xhci_hcd 0000:0f:00.0: HC died; cleaning up
>   xhci_hcd 0000:0c:00.0: xHC error in resume, USBSTS 0x401, Reinit
>   usb usb1: root hub lost power or was reset
>   usb usb2: root hub lost power or was reset
>   usb 1-7: WARN: invalid context state for evaluate context command.
>   usb 1-10: WARN: invalid context state for evaluate context command.
>   usb 7-1: USB disconnect, device number 2
> 
> Workaround:
>   PCI remove + rescan recovers the controller:
>     echo 1 > /sys/bus/pci/devices/0000:0f:00.0/remove
>     echo 1 > /sys/bus/pci/rescan
> 
>   A simple PCI device reset (echo 1 > .../reset) was insufficient -- the
>   controller came back but did not re-enumerate the attached device.

What about the unbind/bind procedure described here?
https://bugzilla.kernel.org/show_bug.cgi?id=221073

> Notes:
>   - The 0f:00.0 controller is USB 2.0 only (USB3 root hub has no ports)
>   - hci version 0x120, hcc params 0x0110ffc5, quirks 0x0000000200000010

