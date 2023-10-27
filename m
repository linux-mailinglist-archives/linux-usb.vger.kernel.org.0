Return-Path: <linux-usb+bounces-2285-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C187D9A3C
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 15:41:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ECD771C2106F
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 13:41:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7C622F00;
	Fri, 27 Oct 2023 13:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aU16N9yi"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C110EB678
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 13:41:27 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE6959D
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:41:25 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-508126afb9bso2935998e87.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 06:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698414084; x=1699018884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L4Tm5c5sZxmH7XDaxX6t2vcfeU9w+G/u30yPdbXShzM=;
        b=aU16N9yiAvPZtfBn10Bo5rBEmECXQewB8NJ+aiiLzNhXXLCSCqi8o/iKQlf+I99g79
         XrY/a01H1oSZEQe0ZdnLT++rBXSt6WqrpWQ7+94y1LARNt+zcb8B+bm3/RaQqNTmgNMK
         im6hKwazpIJ2+q1OwXCE/DjKh+qUSbDY9aIDl9sqigQbZCgcBUg85t8eeixT/6rFH52V
         C9VFN2waxlFRevhO/cWKiX9yAJKpIq/oPVsvfuY1yPTiTPNREO76jIk/hjZ+RR/7Iq1I
         DxHb67LzElsS4LHVm5fUufyBVhE8wpc3NIhtXMacg5WlxtCyCs7n5zZL0I5MYDnDbYGT
         rTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698414084; x=1699018884;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L4Tm5c5sZxmH7XDaxX6t2vcfeU9w+G/u30yPdbXShzM=;
        b=ZCG7GQFAj3c6C2vDVSsnsPLsRbw4SWGAF6rNeZU5lUuuzVHjvLXQEoi6Yoik6MeBt3
         spuKnlZhgWhn9uLvHbdWEP6oy148bI/Dt+U/sWCsVlOd6SWE+uIUS9ChVhbm9d151jS8
         EtOw9K2XIzuF+HhodPt5Nzm+FT7xtulP4jbosteCr9yGmhd8cdQnbqTOAVvNOIbTx/8A
         ZbruwzPM9c5pYOAsm4Mq+SNwlQpTCcdoecOebJk0Rcm5CYEFuyQgNHVi8th+BH9lxKS4
         IahaPb3tcTgc3XWD6Jg9x9gVd/RyYcefEoUbMo03sjlmo5RdD44IwY0zEfB0Vs2r6Svb
         C+mg==
X-Gm-Message-State: AOJu0YxofukOkxGG4k6bHpUixtzQY/R2WnRDjQnWd0C3Ziyk9SU6hV5A
	FRDg5QazKyys0oHGbRZVGSja0rEcohCCPg==
X-Google-Smtp-Source: AGHT+IEUWKpAu+KuV3eVmyvDGl4DnpHMCrsnO65yHpXLy8jLILTDvDC5Y7YNIF2zLO4Xjsg81Dy38A==
X-Received: by 2002:a05:6512:282c:b0:508:2022:7738 with SMTP id cf44-20020a056512282c00b0050820227738mr1869217lfb.19.1698414083957;
        Fri, 27 Oct 2023 06:41:23 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id i6-20020ac25b46000000b00501c8959f6asm172970lfp.98.2023.10.27.06.41.23
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 06:41:23 -0700 (PDT)
Message-ID: <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>
Date: Fri, 27 Oct 2023 16:41:23 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] usb: storage: set 1.50 as the lower bcdDevice for older
 "Super Top" compatibility
Content-Language: en-US
From: LihaSika <lihasika@gmail.com>
To: Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
 <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
In-Reply-To: <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Change lower bcdDevice value for "Super Top USB 2.0  SATA BRIDGE" to match
1.50. I have such an older device with bcdDevice=1.50 and it will not work
otherwise.

Cc: stable@vger.kernel.org
Signed-off-by: Liha Sikanen <lihasika@gmail.com>
---

diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
index 0547daf..7b3d5f0 100644
--- a/drivers/usb/storage/unusual_cypress.h
+++ b/drivers/usb/storage/unusual_cypress.h
@@ -19,7 +19,7 @@ UNUSUAL_DEV(  0x04b4, 0x6831, 0x0000, 0x9999,
           "Cypress ISD-300LP",
           USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),

-UNUSUAL_DEV( 0x14cd, 0x6116, 0x0160, 0x0160,
+UNUSUAL_DEV( 0x14cd, 0x6116, 0x0150, 0x0160,
           "Super Top",
           "USB 2.0  SATA BRIDGE",
           USB_SC_CYP_ATACB, USB_PR_DEVICE, NULL, 0),

