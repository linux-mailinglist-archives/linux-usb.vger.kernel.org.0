Return-Path: <linux-usb+bounces-36812-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEM5Dx059Gl+/gEAu9opvQ
	(envelope-from <linux-usb+bounces-36812-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 07:24:45 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F3F4AA77D
	for <lists+linux-usb@lfdr.de>; Fri, 01 May 2026 07:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 58ED0301992A
	for <lists+linux-usb@lfdr.de>; Fri,  1 May 2026 05:24:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777E034404F;
	Fri,  1 May 2026 05:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QKT87JOL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1D0E2DAFDE
	for <linux-usb@vger.kernel.org>; Fri,  1 May 2026 05:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613070; cv=none; b=PdbAopHwLb1TBZyy0O7tenIBpnC86b1tSaaGniJurItgKD0S3U7XKVyNTtrhgB2Dn8uLrB+mXxR9SZebR2JF254CjQuNmfmK19LlVrDCvvcR2Hcmjuf9ikG4NeAR3gR7bdrD8lpJE5jYNgRyuB1FW1nu1tKS3Auaxk+IO+mcp/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613070; c=relaxed/simple;
	bh=Or+T3mRAtUtl+S7kam4QxQFXc7lvjnL7Un0fWGi4AHU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fZcuB/tMRiIoP9YdeZvAqvJon9yzQEjvW/jkN8hL5vvOrtNBnxM3HNvwj6CnIyKZERbfF2zwkBv4zPtXuBfvQ3o772gVqZFgYeXKrcpW+irC/7Nd7mk2sfm+vJbbaju+Sy+WYEtfLbpHIf9xfL4pCOElJZwpJejcBt1y8nSehNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QKT87JOL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43cfd832155so999812f8f.1
        for <linux-usb@vger.kernel.org>; Thu, 30 Apr 2026 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777613067; x=1778217867; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tpBHdYGXANLSMLurCZHwQFZNIClhvUMcn3QtK6CuJrA=;
        b=QKT87JOLj+YDGrBelXvLZETDwad1NOFnZDS0t+uoo1Cr7ydpuCvYLVF44uu3egEiiM
         G8/y+7VnW3CuCMbUuJYqEeSNJOAFkPihnQLjCNOxx7y4VclQvcgHH930iKn97qXUECCm
         nlvHJe4FSLClkaCViPrKMzyiNOTIGzYp3E/VCDISAHUwT5zvVmcT/FpAAt0iOAHTL7qB
         7KimfAYRTHxTyQ77Q//u6JDypd687GGHqi1prZFp6c4rH+ScjR459vMxycWpsv89NTC9
         YXd8H98v5vY3Al8WLE3SfNvx/sl0hZJKNdtMZ9phVlsqKeKgBoGGL9zXm7WQ7rqmD1Ux
         nw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777613067; x=1778217867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tpBHdYGXANLSMLurCZHwQFZNIClhvUMcn3QtK6CuJrA=;
        b=O7m+FIraQ+aVHSMEfYN707ma1i4tV8hO4UX3TPPspYeMbH4O/heMSWCYMopPl3ykoN
         L0Y34mUD9d0hUCrQT1bEnFZrzrqTfYvr3ddumABkj7gCD3JDeBlvpcUcQlcGcX2bQHzB
         YNUSbu4iYQacRhr8ifMGGyXSaPPkiE9nqze+p+zMJvJisVjG6B2zIDWBlRNzpgApILjo
         xItnccI1U+RVxLJJR++dwL993aE2tb1KIM5hcz9j/ZgfvNqIKfJQWr+9juuKa6NLeqR4
         EEjNA09RKit9oPtrjb2Y1U5Xfv2m/Y2tSBjSKdte3i4ghjtTj6791+fVkcoTUGrDczuG
         eWkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9G7G+y6NaHMkWd2gVqwk/tYrXNXyXTCcqJwh0vYYPw1XGwwAB5y8vc9jfIGuPi5DUtls72E09XHCQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrZqgRVlp/r9nU/NMdoU2JLk77FUHgjs1neRsa1GxzID5U0s9P
	gczYF0GAdpomhfuh2m0Aq3NLX9l6AiTeDOasU6mqPmwmC9Va5bhdvNhT
X-Gm-Gg: AeBDiesMCdykAmBwl0WWdg4rEKDNgbO1shZD+WTkiOn4cND1Ek9krRZ6Z8ESM6XaqIK
	JSUByYvDsoUdrHBoynPdS4pR2CIlImRSBTeiwlN37OKUHeh+D+YsBTinZ0HrAuV2k5Q5gdu6ZNU
	wXLWMrpu3zk/FOwEQ2WuWt5QHXYpv2KhJZ5+LZ+EZJ6ZJmaWS4AphHhruiFamw+AEEzBPAUuWEy
	wOFq5Ez9V8g+4hre2iPrsOMCn7E0Ojkp1EpO/IFI7v1fVM7Ng/VImcRogyGcx8QZzNp9boSr93c
	sXB/iMXG7pBT/9HdiOwng5lWIQ55xR9XVcPc+fmv857jrcDvyVWMkxgVCO7ywBjw5CD8tCV9kI9
	LR9gOmdm40FzNdPPxTUsE/5l/GsafUS4ml0drqUXgvTeFmjyNIINqB66f10Nk4kSU9ixGbhH/7U
	c5GML3nJiBQcked3jatnrk0p6lYlJv9OCVhsqZO5uN3nU=
X-Received: by 2002:a05:6000:1786:b0:43b:4136:1e6f with SMTP id ffacd0b85a97d-4493ee4d4d0mr9516767f8f.38.1777613067093;
        Thu, 30 Apr 2026 22:24:27 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b7721fsm2576602f8f.36.2026.04.30.22.24.25
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 30 Apr 2026 22:24:26 -0700 (PDT)
Date: Fri, 1 May 2026 07:24:23 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Birger Koblitz <mail@birger-koblitz.de>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Chih Kai Hsu
 <hsu.chih.kai@realtek.com>
Subject: Re: [PATCH net-next 3/4] r8152: Add irq mitigation for RTL8157/9
Message-ID: <20260501072423.1bacdcac.michal.pecio@gmail.com>
In-Reply-To: <fac7da10-a2d3-4c14-9208-8762f38564cd@lunn.ch>
References: <20260428-rtl8159_net_next-v1-0-52d03927b46f@birger-koblitz.de>
	<20260428-rtl8159_net_next-v1-3-52d03927b46f@birger-koblitz.de>
	<06a42ba1-b714-45b1-be30-4a793752e495@lunn.ch>
	<9feb0bc1-b817-46f8-9092-e2beff30ec9d@birger-koblitz.de>
	<20260429200214.3e8dee67.michal.pecio@gmail.com>
	<4446ad8c-0f5f-4f5a-8166-557ce9cc91b7@birger-koblitz.de>
	<fac7da10-a2d3-4c14-9208-8762f38564cd@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 88F3F4AA77D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36812-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	FREEMAIL_FROM(0.00)[gmail.com]

On Thu, 30 Apr 2026 16:19:30 +0200, Andrew Lunn wrote: 
> If you are getting interrupts after the device has been disabled, i
> guess it is because the timer for a delayed interrupt is not cancelled
> by the firmware. If so you might be able to work around this firmware
> bug. Disable the receiver, sleep for 10ms but keep processing
> interrupts, and then continue with the tear down.

If the device responded to this URB, it would complete with a normal
status (success or some USB error). ESHUTDOWN (and the debug log)
indicate that the URB was unlinked by USB core due to rmmod, before 
the driver knew that it's being unloaded and disabled anything.

Regards,
Michal

