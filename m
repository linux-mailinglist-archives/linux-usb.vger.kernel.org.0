Return-Path: <linux-usb+bounces-896-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AE16A7B4A69
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 02:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id A555B1C208E0
	for <lists+linux-usb@lfdr.de>; Mon,  2 Oct 2023 00:11:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF23D37A;
	Mon,  2 Oct 2023 00:11:24 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D2E18F
	for <linux-usb@vger.kernel.org>; Mon,  2 Oct 2023 00:11:22 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C947C6;
	Sun,  1 Oct 2023 17:11:21 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-690bfd4f3ebso12483966b3a.3;
        Sun, 01 Oct 2023 17:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696205481; x=1696810281; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VIeMQoi8QBaB+nwPjIVi58PASB0t9qKzyA1DxUjQEJw=;
        b=S9DIW4PkkSKlKiAcSWvFUjQEPhWlcjkA0hCEWDP4zg/K/DpxPpY3+9QT/PZMV5G7yC
         Eeh99J8s1a7oRsGSYGicfls4Ex6ZXvyAWEJjVVqEzhTxbYTMNz/YueC+b/P17OMzVG9a
         OSKnT0dOeovn/b5zMn1Hoglu+rNr9nDge2UNn72lQ38NZBmmlK0y2204IYtERCmULZKS
         Sfra+0vP9zZYQlTMO8b1/HRRw+QDsqk0jrD2PYuvAsw3+j/3wOaBpRBXpmEExJx81M8e
         pZPuewhIgXC5AJY8685KDHJVoohqbJjbABeFLcf2NHHkao4hVjT/1lCor8BfdqBoqBwX
         0m3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696205481; x=1696810281;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VIeMQoi8QBaB+nwPjIVi58PASB0t9qKzyA1DxUjQEJw=;
        b=o7oHpbbS5iOfDU4cMp7Ab/8VzGaMlIdi9Lrlufkns03fbg7Lojq3dX+tuQSYp7mCMR
         0ixXTbx/lAIvIa1pemZbwlXZt9QoaLT0zov57yF40bY+tjiFM5QFgT9ioTEBHnFLCV/u
         AVJm2Id834kOs/2Vzc6yeVDwtVKztJzOG+P/Cs+mCR6EawAexFpc2e1d0NrEofg/205c
         fnsxZOopzBSFzMw0UoJl27xPj1lXDaUmTQ8ChL9gtpKl0NmU150zK4xPgrV/XJ29T0Tn
         ddVn0PCHiVfVBvQ6GxZTfXCNFQseu38tmY6inOGo1GC20/bD6gDXx2lCpHihfEYqgOHI
         zFnA==
X-Gm-Message-State: AOJu0Yxfr1nYNhZ5TPUklBPRxXuvbF5g38TGZITSJnnLTAVgmQGdkzLA
	FuLVxehsUqFgSQfm4Vzl9NkLK4h1448=
X-Google-Smtp-Source: AGHT+IHFJvgcO6flKb7/yHNDIK1vTFu3smZotdPeIA/oCOYBhQ73JmK42VMb03xGAWU+89kmOfuYsQ==
X-Received: by 2002:a05:6a00:2e10:b0:691:1eb:7dda with SMTP id fc16-20020a056a002e1000b0069101eb7ddamr10552347pfb.7.1696205480810;
        Sun, 01 Oct 2023 17:11:20 -0700 (PDT)
Received: from [192.168.0.106] ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id q26-20020a62ae1a000000b00689f1ce7dacsm18539800pff.23.2023.10.01.17.11.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Oct 2023 17:11:20 -0700 (PDT)
Message-ID: <bcfdaf76-8d0f-4365-9ad9-a8b285dc70dd@gmail.com>
Date: Mon, 2 Oct 2023 07:11:08 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 Linux USB <linux-usb@vger.kernel.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Oleksii Shevchuk <alxchk@gmail.com>
From: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Fwd: Linux 6.5.5 - kernel BUG with ucsi_acpi
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi,

I notice a regression report on Bugzilla [1]. Quoting from it:

> After update to linux 6.5.5 I observed several crashes during bootup when USB drive connected to USB-C hub. To find out what has been crashed I enabled EFI pstore. Unfortunately there were no crashes after that. However, there are kernel BUG traces in dmesg. After several experiments I found strong correlation between ucsi_acpi driver and the crash.
> 
> I blacklisted:
> blacklist typec_ucsi
> blacklist ucsi_acpi
> blacklist roles
> blacklist typec
> 
> Two dmesgs are in attachment. 
> 
> The messages to search:
> ucsi_acpi USBC000:00: possible UCSI driver bug 2
> ucsi_acpi USBC000:00: error -EINVAL: PPM init failed

See Bugzilla for the full thread.

Anyway, I'm adding this regression to regzbot:

#regzbot introduced: v6.4..v6.5 https://bugzilla.kernel.org/show_bug.cgi?id=217960
#regzbot title: ucsi_acpi boot crash when USB drive is connected to USB-C port

Thanks.

[1]: https://bugzilla.kernel.org/show_bug.cgi?id=217960

-- 
An old man doll... just what I always wanted! - Clara

