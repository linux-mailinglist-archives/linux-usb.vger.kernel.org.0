Return-Path: <linux-usb+bounces-31841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A8CE98D5
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 12:37:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B87D63005F1C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 11:37:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5EF52E8DE5;
	Tue, 30 Dec 2025 11:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ase3+yPC"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F080276050
	for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094624; cv=none; b=jWPyrSkfK4GcaGKKrEXxM54Zch4vQjYTm2DFaYRQSBMEe/zjpsejpgZbI56DrwrG2rBZnS6OAFNeWIp0HBloq6WDfHSYfjZVHQDpi+2RHeg8JggNSZqaI/QJ74qN5/O4WXU8BksYqoOWQTxRj5gJ4GKflpaCgzPubnMbXbd2iOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094624; c=relaxed/simple;
	bh=8n8WP6t0YcDAYZ7kg3FzA+7B5fDmDzd8BrdVQJVpcRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kZ04g0wut2oNGJPNCGGi+9C8VlOMtytkjofHLLjr9Grw0YbEER35lSUZCJMTcTu4GDtbKcdK3lObTC6WFNvD0mh8sghRyyd2ZvdK3uiXslEyQtFnAbvzJ4QyQxRgRxQddD+kjKuPXXK2o3Me8/2GmazjhYNuEIgqbFSVRC4x2Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ase3+yPC; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-37b99da107cso91667661fa.1
        for <linux-usb@vger.kernel.org>; Tue, 30 Dec 2025 03:37:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767094621; x=1767699421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CmAFwrYbDuyMoa/BPWjtX3r2mUHX5vgd3DvqkBcFzk=;
        b=Ase3+yPCgI2K/7zwY6HeHLVpt0MTzbeVu+fQe7YltTVnJsipj/+VnLDpzD9gUutvUE
         If0ARIlIQGQPtaxrMb5538uWv0vFWABUlrI/mtJLxGZy4DvW8RWGyi7onFwFQr+cpvGX
         5NQDZscrk7FIL3gtbRloK+ymD9Xiqdt//Of/zWl2Si6mcZmb+PTaEeXsdJOVlRzAHcCr
         bIsjN8Q/NPw6xueIx78sUHN516LUBT5PqD1MJYcFCpBI5pWJHsdffSO64jdjQ36dEQ8/
         DQ8am0zxmUmpmW2MztQ3a4z8f/wd84yf6AG53B3pXgQG65hnO6W0ih3eFgeIk31sSLE0
         AH4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767094621; x=1767699421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4CmAFwrYbDuyMoa/BPWjtX3r2mUHX5vgd3DvqkBcFzk=;
        b=AFq1HZwBK84av8pfgu1JoqY3t9YpGoXfsg7Jqf8+a6QbbnSyHXQr/u+Tba172q5i/T
         LaMsr/nXz9cDdQnwQHwbezQ4kpuYMLZ9dFM4jKGX60ijjpVRZUwv1syBBipGFQ3EFPLF
         N8mvjhJakZf4BYzNiTeGjMN9GBNQkhAyvo8dA7ARofaS3sFos8nCX6LpY5Sadx9VLhpE
         cm6iY6qkwU+OdQ1xl+U3NjjaJ9RCGD/hBYpbxPoybCXSFJj9Qg3u3Vin81xA+okIA1WJ
         ywJpfCPGpSOlx+fy9dKdrZjwNDqNPUGcWr4Mse7Pgcb63cYgjYxPiUHlphJoQ7phA3ne
         f+Zw==
X-Forwarded-Encrypted: i=1; AJvYcCUt93UDInzRJWfJsF6YMq/E+QQz6KprO5H3q+KqxqLuP0ONrCsPdD7AvCqtJn89E0bTm7l1FwIOhLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy20il9o3594w5A81//l7geeEPwjL+4tfoCZHmEzWP6MRVl9wl
	HhlpbbTiXHUO3GVMyoh7QFTG221R+v8R5UKB0zlf3uxYkw8DIx8iyo2+J5LLQg==
X-Gm-Gg: AY/fxX6Er64RB4456SAXctMFUwW9vVCbTnalGNWK+IleRInpTaZB+5ZBiFE4/9oAiei
	rXtysOJBSKs5VRC1YG5lvUADhdqQIXFlvc4R3N16nTr4CZ1rSo5Ksm2tQh5P/i71eoIXIjOIHuD
	jAbWTpegMLKAW7ivh99V8vMe9lMjY2EDismKHDEgglOaZq9aYKsJDFTCH/vvnjBHhIxJu81JjJW
	LAB2A2GIKzh9OUc5N/jjAg/fuXN0IPfTMdmEmEKHeZr2VU7gZ7vOkTBmhG8w0gj1tFB2XVek+hN
	idpNd9jUcRMHDj4/Mwn2E6zwYUWz0Hf5KQIlhwfieOwO5+sKvu8Xm1aLfqzYITtahlyK2hesLHl
	F6r3y8d1/8wQ6SlIKmoj4H90rSjmkM2AOXCrRHyOK6WFYStAR5YGfv4K+hBFIpd1VBPg6Kug27b
	kIBAOqfNMf
X-Google-Smtp-Source: AGHT+IGF3gFGUozf4G9zt9Om+vstcNbw0h6yAp0aZ++ChCDii30yTV/4I9FiaTW4YuEjPjrGwT/sFw==
X-Received: by 2002:a05:651c:f02:b0:37f:8bb4:88 with SMTP id 38308e7fff4ca-381216bd8cfmr102647771fa.41.1767094620457;
        Tue, 30 Dec 2025 03:37:00 -0800 (PST)
Received: from localhost ([194.190.17.114])
        by smtp.gmail.com with UTF8SMTPSA id 38308e7fff4ca-381224de728sm89285781fa.5.2025.12.30.03.36.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Dec 2025 03:37:00 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: nfraprado@collabora.com
Cc: Tim.Bird@sony.com,
	bhelgaas@google.com,
	dan.carpenter@linaro.org,
	davidgow@google.com,
	devicetree@vger.kernel.org,
	dianders@chromium.org,
	gregkh@linuxfoundation.org,
	groeck@chromium.org,
	kernel@collabora.com,
	kernelci@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	saravanak@google.com,
	shuah@kernel.org
Subject: Re: [PATCH v4 3/3] kselftest: devices: Add sample board file for XPS 13 9300
Date: Tue, 30 Dec 2025 14:36:16 +0300
Message-ID: <20251230113655.1817727-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <78b4f1f60563fc854f5f4a54b42e0bac60715070.camel@collabora.com>
References: <78b4f1f60563fc854f5f4a54b42e0bac60715070.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Nícolas F. R. A. Prado" <nfraprado@collabora.com>:
> While I understand it might be inconvenient that this is the only file

As well as I understand, it is intended that more files will be added
to tools/testing/selftests/devices/boards with various vendor names and
product names.

So I did some further research. I grepped Linux source and found some
vendor names and product names with undesirable chars.

Let's go.

/rbt/linux/arch/x86/kernel/apm_32.c:2097:                       DMI_MATCH(DMI_PRODUCT_NAME, "PC-PJ/AX"),
/rbt/linux/arch/x86/kernel/reboot.c:396:                        DMI_MATCH(DMI_PRODUCT_NAME, "PowerEdge 300/"),
/rbt/linux/drivers/platform/x86/samsung-laptop.c:1633:          DMI_MATCH(DMI_PRODUCT_NAME, "R40/R41"),

Here we see / chars, which are simply forbidden in Linux filesystems.

I also found a lot of others undesirable chars, such as "(" ")" "'" "&" "#" "*",
which surely will break a lot of tools. In particular, "'" is used in bash
to quote something verbatim.

Here is extended result of my research:
https://zerobin.net/?d1f2655a979acd3f#oBhwIedQvBL/iB9Src65aRYuyjaye2GQBNL3+6yfvGg=

Unfortunately, I'm not sure which of these names refer to whole "board",
and which of them refer to merely some particular device, such as USB device.

BUT for 3 instances of / chars given in the top of this email I'm totally
sure that they refer to whole "boards", so we have at least 3 totally
legitime cases, where we have / in product name, which simply cannot appear
in UNIX filesystem at all.

So, conclusion: if it is indeed intended that further examples of boards
will be added to tools/testing/selftests/devices/boards, then they
will contain all sorts of undesirable chars and notably "/", which cannot
appear in filename at all.

For all these reasons I ask you to change name convention for this directory.
For example, use some kind of sanitized vendor/product names.

> there are
> tons of dt-binding filenames containing commas in the tree.

Okay, I agree with this point. There already are a lot of files with commas.
But I still don't like spaces and all sorts of characters, which are present
in DMI vendor names and product names ( "(" ")" "'" "&" "#" "*" "/" ).

-- 
Askar Safin

