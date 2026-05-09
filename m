Return-Path: <linux-usb+bounces-37186-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZBWMJnhb/2l35QAAu9opvQ
	(envelope-from <linux-usb+bounces-37186-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 18:06:16 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 368625006CF
	for <lists+linux-usb@lfdr.de>; Sat, 09 May 2026 18:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D829A300147B
	for <lists+linux-usb@lfdr.de>; Sat,  9 May 2026 16:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25C8D1A9B58;
	Sat,  9 May 2026 16:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P6R4QSa5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B8B2F8E8F
	for <linux-usb@vger.kernel.org>; Sat,  9 May 2026 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778342770; cv=none; b=JskNZd5XQfnr9cMiHyKPs8PPyD8T9NjwEXfByybhggODqTapaQfL52A2CJzvuaj0PUyBECj5DD+MYQVkcD0lPwZMEubCVgk2FcolnnYNEz2ID/RVWMJAdonp+rBqokhe6MMfhaS4n9hqJtckX4MTe6C2LEb4y+cjpZte4THQc0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778342770; c=relaxed/simple;
	bh=gZFgF+fQWD6gzwPKNasyXcUZu5WrHL97iY7xC6VpOm4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HdzLVBiJioaRDHdVB32PAzsp6h/M2bMCzqN8cqkfJgrsee0QxP5RRNPrjYjpLztW7N/G6xQQDpFc3Pt12f/eXyfdrpeJd2w5ACRjqNVTP2iXRKTYwS7NuLLe8nDwg/5rQw7Vlc4GU9P17yN4JbUaILoDHdVOveCwEKAj88mvzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P6R4QSa5; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so23501881fa.1
        for <linux-usb@vger.kernel.org>; Sat, 09 May 2026 09:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778342767; x=1778947567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V2E8cmKtJP68D0+P6Na7Y7gPaTdyTWmtLGInxYa6pv8=;
        b=P6R4QSa5fjMiKuE2MLj7yUWLtYVJnAgpy6X2i1dHxPB6r8wMVjtdZKsyrk5t2Ytfoh
         g2iYox8SB9ECEzvURERJURJXBBdvqjqbBGu00oNogh7kKOnRCRrj8mMOL1QsVDa02bfX
         T7iDGt7AerAm6F9sZKWzJKhNNCcpRtmppBxW4xG3TWv0G0QRkH6mBffH0bxgfsNOToo8
         424rZma5xwjnWsMB2RLDwA15cxJJ2tmzhRtf8P/CMO1KJ9jlRA8StwqsjFMF0VldfPZJ
         LuhKZbjsrwRCGtIypcXz4XxJVCCtnmrMRO3W8q2x4t2OooZUEymwgyAQz0C5GQfq5brI
         UtfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778342767; x=1778947567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V2E8cmKtJP68D0+P6Na7Y7gPaTdyTWmtLGInxYa6pv8=;
        b=R+BgwiylSgG1B8FOphkbCxBviotO7XOeBHAVxyCTY9Ent4t5MGzZZOgYNgDKEd97hd
         z3xu+qUYCTNxOXl52NNJulLiiAfj0LYPNRJ5aaq9Z1ikqv0Dt4jyK7rQEeiFvB6cZsZt
         kvoV16YVJyX1twXrYC25R3C9VEvVHno+Sy4mgaMdfF5n4xgR3PkZJSmg+1zICL26V3b1
         /vKuef8QzbiJf6homgTpInCAt2Y3ALJmWvaQqhDe2pNxkWZs8N6OQz4wfuzGImxrEVc7
         8yTAxZMl9McTXMbNte+QyvGCR5OkcpAG9FW/TQ+tS4U1UNPnHk7HK6vyaSO22Ujy8Wo9
         VL9g==
X-Gm-Message-State: AOJu0YyCDuUs9u0ebOued3P9JZq30IW4nIwBX2i1lciXwJ+QIpESyARa
	72s1L9sVzPkJeR6PbodsIS67FWoUaYnJV7o+QbT9NJ4TWZFmOG7y68k6Ibh4UA==
X-Gm-Gg: Acq92OGwsru9dRjDKEF0LUuFFdw0a8KhRfngpHkmU1UDUi56IXa/XpZ2p6ycp+IWAZ1
	gdQ8Et0hb+GE1dPQphwQCL2YTi991EkeEfFAepi9xfd0/XiKAMLWecXnjVMDsjXd+V1unJBxkDf
	EeDy9iLb1Ha6//+AsOeHnU1d7vrvZEn7DEbhzX3QiTKHUY0734ZFOcVUv3C+CtfHt9wHUPg+fKL
	uuGWLP5iHDZ7aHpixOKijlPg7Ky/0pxpllACHToN5jU/WKPwS75oy2WGLBYOoZkg4kbFxX4hjYP
	wOqkObgqUGk0NKp6x3ZdGuPn16kL/3xKHL4bWY8KFCvmywb4hY5R00QuHhbvqq+t4YzEvR+PJsy
	m3Npbmje40J+XtJ2nuuERq6VXlme2NPa6wviGVL8Z5OFlelZFcFNjNXTvVTvxNqM3s+WxdlSN8A
	6V2d381cW4cltVsYVQYGfDikkbT5s8Bk45aeg=
X-Received: by 2002:a2e:ad13:0:b0:393:cdbb:222f with SMTP id 38308e7fff4ca-39408174e04mr8771831fa.26.1778342766996;
        Sat, 09 May 2026 09:06:06 -0700 (PDT)
Received: from foxbook (bgt227.neoplus.adsl.tpnet.pl. [83.28.83.227])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f6292993sm12826021fa.41.2026.05.09.09.06.06
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 09 May 2026 09:06:06 -0700 (PDT)
Date: Sat, 9 May 2026 18:06:03 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Martin Alderson <martinalderson@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: xhci_hcd: AMD Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
 dies on resume from suspend
Message-ID: <20260509180603.6f67c9d8.michal.pecio@gmail.com>
In-Reply-To: <CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
References: <CA+_z3hRjPnQOrEp7uXsNsu6wzqQp9O6FT18i=XcSC7k74Xd2QA@mail.gmail.com>
	<20260330020749.18fbe433.michal.pecio@gmail.com>
	<CA+_z3hRTD-QAgv3jZhOZUUPA0sNZ8946jfYwYsZ=RnQJ0LG7cw@mail.gmail.com>
	<20260404152438.582f0451.michal.pecio@gmail.com>
	<CA+_z3hTMfggtv+u_A_SRyb2FRzVjm=Nav5NRCTuhmEthb8x0jw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 368625006CF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37186-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Sat, 9 May 2026 15:51:03 +0100, Martin Alderson wrote:
> Hi, still experiencing this on 7.0.2. I tried to pull the logs
> together to get to the bottom of this (I've tried a few different
> kernels)
> 
> Kernel                          Suspends   xHCI 0f:00.0 deaths   Rate
> ------------------------------  --------   -------------------   -----
> 6.17.1-300.fc43 (March)             ~12             0             0%
> 6.18.16-200.fc43                     10             0             0%
> 6.19.7/8-200.fc43                     5             0             0%
> 7.0-rc4   (build 260320)             13             0             0%
> 7.0-rc5   (build 260328)              7             2            ~28%
> 7.0-rc6   (build 260401)             10             4             40%
> 7.0-rc7   (build 260409)              7             2            ~28%
> 7.0.0-261.vanilla.fc43                7             2            ~28%
> 6.17.1-300.fc43 (April, retry)       10             2             20%
>  <-- same bug, stable kernel

Looks like it's not a regression then, but not sure what else may have
caused it.

Any new USB device that wasn't connected before?
Perhaps a BIOS upgrade?

> 7.0.1-262.vanilla.fc43                7             2            ~28%
> 7.0.2-300.vanilla.fc44                6             4            ~66%
> 
> 
> May 09 15:29:37 fedora kernel: Freezing user space processes completed
> (elapsed 0.001 seconds)
> May 09 15:29:37 fedora kernel: OOM killer disabled.
> May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
> May 09 15:29:37 fedora kernel: Freezing remaining freezable tasks
> completed (elapsed 0.001 seconds)
> May 09 15:29:37 fedora kernel: printk: Suspending console(s) (use
> no_console_suspend to debug)
> May 09 15:29:37 fedora kernel: sd 6:0:0:0: [sdb] Synchronizing SCSI cache
> May 09 15:29:37 fedora kernel: serial 00:01: disabled
> May 09 15:29:37 fedora kernel: sd 0:0:0:0: [sda] Synchronizing SCSI cache
> May 09 15:29:37 fedora kernel: ata1.00: Entering standby power mode
> May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host not
> responding to stop endpoint command
> May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: xHCI host
> controller not responding, assume dead
> May 09 15:29:37 fedora kernel: xhci_hcd 0000:0f:00.0: HC died; cleaning up
> May 09 15:29:37 fedora kernel: PM: suspend devices took 5.758 seconds

That's not resume, it's during suspend. Are other logs also like that?

Regards,
Michal

