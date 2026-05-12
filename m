Return-Path: <linux-usb+bounces-37309-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MEPFMf7AmpOzQEAu9opvQ
	(envelope-from <linux-usb+bounces-37309-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:07:03 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8C651E43B
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 12:07:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA1593041850
	for <lists+linux-usb@lfdr.de>; Tue, 12 May 2026 10:03:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E73F3A9636;
	Tue, 12 May 2026 10:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ko+Y+UWP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942E024DD17
	for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778580223; cv=none; b=L5PUTxxleIexHuWWN2c4UElSFjVSW4McUQcfG8hmZ294np9jr2mGbHBrOQ+KdsmaF4CO9fwuEHKAVvn10GQZeN1RM+NF2EdRTvnnzH58h6I1Rgs4GyssXbdWGmUOJ6mBhqCQu0JMRnJMl4t/+76wta84cDt1qLrbMAi+C17ekQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778580223; c=relaxed/simple;
	bh=2srZrx3IH+j0zED2wBjPEW3FffGG/+AeqHnD9S2YjNs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=avFedWsag77bLbyn7lnB45NQVKFMhkmclsmTAYXgcaa6Eh6ADmUbdNYP0uI4hclGN464Jsmn8uZXp4BNgnHmwWhQzKfGeMANzpoBhU8+vYLPR6t+JTtjTPthlNUnPweIk5NNBqu+J1IWAeiTfpctMJJyjNE+7E1G3M81H+rzMz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ko+Y+UWP; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-95cc8ac98bfso1171417241.3
        for <linux-usb@vger.kernel.org>; Tue, 12 May 2026 03:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778580220; x=1779185020; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TqZnmMoUOCLPfKpZW1Tw91aY+l/Tvx1+vXWfiiElswo=;
        b=Ko+Y+UWPmS1ULnsjqNNLcgx+24rWWa+NjHq/InCVHBjO6KA+O2TyhK6kkKJkDmmX1T
         GU/fINlcMn+92sIllxbVX5XJs4mABhtofvgt63haA28aXVGnjvQp6T7oChhnvhdkpk5E
         PiHygr1vPlDRgjnpaVbMBnWUsh2XgXvUbmtyLfuFs181DIZDko9dXSOaJC0VPIDNlRl4
         39eoE/E4JF5VgDwj5mvaC9knXA61PZS7aILQYO9i8RK8iCYPAG4q+v00I6lUYB25I9vx
         23rIobGtHkYlVSnihJXMIM+AKggO4mQshYjAO0VCf773T2rq02ziHCi9D7SKENMwKz9w
         ht4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778580220; x=1779185020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TqZnmMoUOCLPfKpZW1Tw91aY+l/Tvx1+vXWfiiElswo=;
        b=CNnrSdV+ngWZRbHUQ7WhB4GQWOBZSjqGgFcEZLoAdPsABL8jfzMdu2YXy6Mgx67yAv
         Mj2l6Ces73E6htloA2VDdaRKTpU7wJJkDE+r3iuvAogkmO+nMNwqCLdWia9hx2SRjFMj
         xnfTqmsfr2MHR3y7pfhKy3/nnrzitX7OVsFvhBcdg7XmGM/WlYfGDNS2K5VHh2R/1wIx
         jHZBM3I1Gyg2F+PQOsrDWwBhVyI4ZaXm/9k3IUj08Zh1DlJu/9yYgYIHSb3kYPwXFWgN
         0yIeQC+N4Z8AIJ4H2EX4U3pzRb2nVTkSMgNqeWgKBIHmJXLggMNgYfpfxtHrDV6g6kTg
         GJSg==
X-Gm-Message-State: AOJu0YxaBnY0SmuSQH+4aruzks8OQgS0S9q/vB5WK0fcBWHN88m8JOrV
	gco3w5Xtii4M7Y5nzjI8n4uKhkbHypeyf2oNayeFzlLpc2ktzjB+BMbD
X-Gm-Gg: Acq92OEkkRE0MpJKJzh/aK1qtE2H2r5TRIrYunhAM4IHNamy1z7B2IydfXJUaHTHYlA
	F2m8sYDfx8FtE1D69Ok5JSCXaACaz7UZrdqjFCvpoThIKgcUP9aGOdsa9XyJDYx6J5+dMmw8VIn
	Sp1GN2oywSRsWgMfO3xRgGj0GaEEfhjdXaeDFAUyZPpq0+kwG5EerzsBw0hro0VRZo9a5Uriaxv
	ePfrUHc01iC7XtyR93Cbu/2FPryVQXMN2tZiY9Qkv38CdoE5RtxHTC48ot0zqaFUN0PrEP+rB84
	M/vCUpW+7he3hRHSRAWdjXbPSfqEfnpq+Se52cVmnCGECUa0yaN03s5vit6aqJNt+SaAAloPUY8
	Y1UkSDXugOH8OJwtJUlAgo6ZZHYFyTyf5qW/fNcsR2z030BpJgpv2K9EaCRkrhkGmIRvE3PwqVN
	8B994ueKZNvQOStRLfz3t1F6nMWGHun+9J
X-Received: by 2002:a67:e7c9:0:b0:631:26f6:7016 with SMTP id ada2fe7eead31-636178e4e0emr660114137.28.1778580220348;
        Tue, 12 May 2026 03:03:40 -0700 (PDT)
Received: from foxbook (bgw15.neoplus.adsl.tpnet.pl. [83.28.86.15])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6313ffe8ac0sm7651038137.1.2026.05.12.03.03.39
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 May 2026 03:03:40 -0700 (PDT)
Date: Tue, 12 May 2026 12:03:34 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260512120334.4eef3d0b.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
	<20260404152438.582f0451.michal.pecio@gmail.com>
	<CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
	<20260509180603.6f67c9d8.michal.pecio@gmail.com>
	<CA+_z3hT_n09fAszT+DkoTHLzracB7fQZwkiiTxGGBJxhFcD8hg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: BB8C651E43B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37309-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sun, 10 May 2026 17:29:26 +0100, Martin Alderson wrote:
> 1. The timing is during suspend in every single failure I have logs
> for. I went back through 7 weeks of persistent journals and pulled the
> context around every "HC died" event. All 9 failures show the same
> sequence:
> 
>   xhci_hcd 0000:0f:00.0: xHCI host not responding to stop endpoint command
>   xhci_hcd 0000:0f:00.0: xHCI host controller not responding, assume dead
>   xhci_hcd 0000:0f:00.0: HC died; cleaning up
>   PM: suspend devices took 5.5--6.1 seconds      <-- elevated
>   amdgpu 0000:03:00.0: MODE1 reset
>   ACPI: PM: Preparing to enter system sleep state S3
> 
> So it's reliably during suspend, before S3 entry, and the elevated
> "suspend devices took" matches the 5s xHCI stop-endpoint timeout. A
> clean suspend on the same boot takes ~0.46s.

The S3 state probably doesn't matter, chances are that it would also
happen with s2idle or hibernation.

Could you enable dynamic debug before every suspend (or permanently
on every boot) and collect a dmesg log of this happening again?
And maybe also a snapshot of debugfs directory after resume but before
unbinding xhci_hcd. These may contain clues what triggered it.

echo 'module xhci_hcd +p' >/proc/dynamic_debug/control
zip -r debugfs.zip /sys/kernel/debug/usb/xhci/0000:0f:00.0

> 2. No BIOS upgrade. ASUS PRIME B650-PLUS BIOS version 3263 dated
> 2025-06-09 across every boot from 2026-03-02 to 2026-05-08 (42 boots).
> 
> 3. Re "any new USB device": yes, and it correlates exactly. A 4-port
> USB hub appeared on bus 1 (controller 0c:00.0, AMD 600 Series USB 3.2)
> on 2026-03-16, with a USB mass-storage device behind it on port 4. It's
> the hub built into a new monitor I added around then. Per-boot
> presence:
> 
>   2026-03-02 to 2026-03-16: NO hub, NO flash drive, ~12 6.17.1
>                             suspends, 0 failures
>   2026-03-16+:              hub + flash drive present
>   2026-03-22 to 2026-03-28: 7.0-rc4 with hub present, 13 suspends,
>                             0 failures
>   2026-03-28+:              7.0-rc5+, failures begin
>   2026-04-18 to 2026-04-25: 6.17.1 (retry, with hub still present),
>                             10 suspends, 2 failures -- same kernel
>                             that was clean in March
> 
> The hub is on a different xHCI from the one that dies (0c:00.0 vs
> 0f:00.0), but they're sibling controllers on the same AMD SoC, so
> shared power/ACPI domains seem plausible.

That's over a week from first connection to the first failure.
And these are separate chips of different type, the 600 series chipset
is not part of the CPU while the broken one is the CPU I/O die AFAIK.

May be a coincidence. I would sooner suspect changes to devices on the
affected bus to be responsible.

Regards,
Michal

