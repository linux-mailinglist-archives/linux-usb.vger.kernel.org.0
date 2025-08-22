Return-Path: <linux-usb+bounces-27163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2615DB3103D
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 09:23:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BF085E4C4F
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 07:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A7E2E7BBA;
	Fri, 22 Aug 2025 07:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bl7G0lPP"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D732E4266
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 07:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755847387; cv=none; b=fenNgdRgoV3WREHkMgxFFKeJPYHbFkIyxjwLQUsStskeTEjJWYgwYbmCSpVFySLmFepJouhJ7aBSwPByfzzJnZKZNm1YS8bttU18uUNwiCwscG40fFzOiuDynkwZh8D08ARK0/d7J9eqOG6sBOReYIK77nCpgKfzSAZt8GEJK1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755847387; c=relaxed/simple;
	bh=86NxbLP5stu7jdC+97Y7NDfFNJItInZZBVtvmEEYzTo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=guQMGpKMACDFN3Gm9IdGt93XF7gUAGT+6lBzWzoZ1eRU/L/Q9damXRVlEQW+Zr9FyQTEZzB+x3aeV4NpIrUsKYwwF12OWC5VhXKU3FsUfS9a3yglpy4MvUrNkVyHqTowTZWmhjPs2nYrfGHB0FYOQv12sQtd93tTwYd0CRyi9uY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bl7G0lPP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55ce52658a7so1600347e87.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 00:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755847384; x=1756452184; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86NxbLP5stu7jdC+97Y7NDfFNJItInZZBVtvmEEYzTo=;
        b=Bl7G0lPPWhmC03Y2Dse9IEt9mbUregAVxsKvTPQM2cWy61qbdr7PyNxNgnRR1gDmJR
         817l6brz5o2j4JzK42nqu5/+BGZrKDt1rrehI7zKOVFYMMmHYl/Mr0QoceXafaaOVcVj
         BDUXx91T0IOgQMdnreKLv6tbBBGNvJEVv2X2fb3QpKnTVsKfLlnXzoCkxAh66AyTT7Lr
         ZZwdphmrTbGT7/b1h5xKc8px9rUZv75JebH2IqMA/+erq/q1OzvT48dp5JXBqUwTZKYY
         +wf0EZhq4qao+3btvqW2tFuZNGJu5QAejTmzdOO2BfQ6GPTskJmxeOj7MElA6ljjXHiP
         rZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755847384; x=1756452184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86NxbLP5stu7jdC+97Y7NDfFNJItInZZBVtvmEEYzTo=;
        b=DSW8/hjHJkuvWhmiIu9GEts7rIpRgMbInVdKtKeKXUX2bywOyjoqkw23mST8I90Pb+
         kwKWPAIePgh6euqo7W4X5Xqnz3CAM/A3SXiaUFQgC3VqjsUFOlwJE4094lAq4KPAbWJL
         k0PxYqobIrajsyW7Nxuajoa4tiGjqg8kofVDitiL9vYw2dUFEVDTZv0mCIJKhBa77ZxV
         RV5e1lXB1lkRH8oWScLGanS97aBc7ziIImwgUIQAdfQ0OTAu4kVov52/vHJgy5cDyPNK
         EtqO5Ad2wcy74hD0KZaJUh9nUDvnZHUiGqYYcLbD5p7HAolaCgbwRPjGZQvBCLTRylp1
         Vogw==
X-Gm-Message-State: AOJu0Yz+UmB/0vuI4RpifcSNESR6XpSMqaYRHHie7bnNW30HJtf3oUkF
	6CsK2uiJywAoH1JXIWn6T6e/+/+1qED1Lbin4WHF6urhgiOWaxyFhto9TyLMtg==
X-Gm-Gg: ASbGnctHTYJloRIRGh+taMzNwdptFPV/PJGE8dqASMvE5q9ZI7uebKMcU86TV/Q9ahq
	xz+VZ4GUJLVzBpCLmAvc+kyjkaidHYNVaB8s+N5i7LkjzssHWmDXJnG+G51JZGpq/p30ZKYomgt
	21cbmfRBkObWTIRRxsUPkzqTyzx5X4lJbNSctgxObmItzWrWSBAyNIZ04GpAdRhWKIlsagaoSGo
	CfWP6Na9AgmW5l8cdCx9qZktKsKJnsuBiZwKR7DUxQ/A4LWG3VeGcyTWNsv419/feRC2Qm8sR9P
	0uuILkxDPU7fjcYEj6ezDhi6UiBlIcytV9Y7ECJZpqwlVJI0D0O+oKXkKDVG52JxBKUyoAWNUL3
	R/xqpdwlmys7ehSUOl+ksnWd+CSXRCzyQItrIDgQjIiBVxg==
X-Google-Smtp-Source: AGHT+IGmgqoUW4Uy4atPDW7nGbrUaYBPpBKVxt7iVP+knQPSJUuLyBw8k9GTkIw16or8B6S7MyzjUQ==
X-Received: by 2002:a05:6512:4004:b0:55b:8d66:f7f8 with SMTP id 2adb3069b0e04-55f0cd47f4dmr779614e87.1.1755847383650;
        Fri, 22 Aug 2025 00:23:03 -0700 (PDT)
Received: from foxbook (bhd106.neoplus.adsl.tpnet.pl. [83.28.93.106])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef351625sm3484689e87.9.2025.08.22.00.23.01
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 22 Aug 2025 00:23:03 -0700 (PDT)
Date: Fri, 22 Aug 2025 09:22:57 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Niklas Neronin <niklas.neronin@linux.intel.com>,
 mathias.nyman@linux.intel.com
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/4] usb: xhci: handle Set TR Deq Slot Not Enabled Error
Message-ID: <20250822092257.493903f4.michal.pecio@gmail.com>
In-Reply-To: <20250821123521.53e7c37e.michal.pecio@gmail.com>
References: <20250818125742.3572487-1-niklas.neronin@linux.intel.com>
	<20250818125742.3572487-3-niklas.neronin@linux.intel.com>
	<20250821123521.53e7c37e.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 21 Aug 2025 12:35:21 +0200, Micha=C5=82 Pecio wrote:
> And suppose that somebody does indeed disable a slot without waiting
> for pending URBs to finish unlinking, what if he also frees those
> virtual endpoints that you would like to manipulate here? And maybe
> forgets to clear xhci->devs[x]->eps[y] to NULL?

I dug deeper and realized that this cannot happen, because virtual eps
belong to the same allocation as their parent virtual dev.

What is actually going to happen is that every xhci_disable_slot() is
followed by xhci_free_virt_dev(), so virtual endpoint lookup at the
beginning of xhci_handle_cmd_set_deq() will fail and the function will
bail out silently. This 'td_cleanup' code will get no chance to run.

The silent bailout is obviously wrong, but it can only be improved by
logging the error, and queuing Set TR Deq onto a disabled slot needs to
be prevented from happening in the first place.

As far as I see, it currently is supposed to be prevented by:
1. the core not freeing devices with pending URBs
2. the driver not giving back URBs before Set TR Dequeue completes

One interesting question is what happens if Set TR Dequeue is pending
but the endpoint starts and completes the CLEARING_CACHE TD normally,
I suspect that handle_tx_event() may give it back. Will look into it.

BTW, endpoints are not supposed to start like that after Stop Endpoint
retries have been implemented and I just sent a revert of a dodgy patch
which broke that, but well, in theory it *might* possibly still happen.

> What if a different device uses the same slot ID now? (That's possibly
> a serious problem which perhaps requires a serious solution, btw).

Actually, nothing interesting happens. SLOT_NOT_ENABLED means that the
slot was Disabled. By now, it can at most be Enabled, because any
completion of a later Enable Slot command couldn't have executed yet.
There are no new TDs on the slot and no damage by giving them back.

Also no point trying to give them back ;)

