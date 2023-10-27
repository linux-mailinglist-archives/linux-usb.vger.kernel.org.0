Return-Path: <linux-usb+bounces-2296-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E20B77D9EDE
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 19:28:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9CF75282484
	for <lists+linux-usb@lfdr.de>; Fri, 27 Oct 2023 17:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16CBB3987B;
	Fri, 27 Oct 2023 17:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fv0rkoGV"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CC442F37
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 17:28:12 +0000 (UTC)
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1EC1AC
	for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:28:07 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507bd19eac8so3419512e87.0
        for <linux-usb@vger.kernel.org>; Fri, 27 Oct 2023 10:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698427685; x=1699032485; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lmysuzjuHdUzDUKerdvVYUJgcEOMLJwWIM3o3T5z/6g=;
        b=Fv0rkoGV/eHJACuzgsR9wYAWfYG3wfKi7oVzpUUP9JqRY3eyXChv3BN4xfZ4yAnqwa
         NBia8ELClE6NhkYJz3/4xxoqXbZM33arpJLxus/KuRIS/04sc80hOV/t0/bqmUt7htYp
         0vhB7cbJQuCkI2xNN1ynGzXwFfh+ZI6fE9Zab6q50I119zTSVk3n4fCA7sMkkbJBA1WC
         jDuvgA1GJT+2K4Tka0/I2ERQN63lHTXkl6V/slA5ml/xueLk0MwBsgqIUd8ZUYXA/awc
         nOOldwsXpqyWZDxLJPyP6+TBTqVNkZrWAnTw6FehwJ9M8kb4yiuDl/FglBKXp1WZ+N12
         dvEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698427685; x=1699032485;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lmysuzjuHdUzDUKerdvVYUJgcEOMLJwWIM3o3T5z/6g=;
        b=kO0kcs2s0vmWnSRLTimYWxQGzo51FdDHj3QObKaHYC9QGILeoK0mL5LJtxf+YbzgA6
         +GSg4r/v58PaBCAdX/PjuVAm3sZORDXt8UXpaBdy6o5eUYKkC4oiQuxuXY0MVIlydxNm
         AF7qLbFHF0iMGSBCNiT1zUdAGI90Gva/IFpAdxluqUBOEm+vJGSpSxLZSskVvuHC8crB
         EuqLaWF/6PkdrEuEhTw4TYKnKPJjPGHdq/X0bGEOPnb9poEY0uca79eWwD4kf5KP5xG0
         bG1BKsrq99lbzVtdtFKkMKwaM3EvyjyBOI/intHB3a4WWwAkGmj9S4AvtXqdP1dLfFFq
         6G+Q==
X-Gm-Message-State: AOJu0YwtQ+Mo65a71qA5I5OhSiAy/e3nqVT7X7NpT84/Ry8k0OrB8d3F
	qEi4ybuxnYGHOxWDGJL75RERCPRXLmsH5g==
X-Google-Smtp-Source: AGHT+IFjnF3+ZYIwG+vrkkQvcpq+c7ZtLolCt6tiP2rOiCGPimdbi+1oFLXrC9OtnBKxHZVJseWQzw==
X-Received: by 2002:a05:6512:2eb:b0:500:9a45:63b with SMTP id m11-20020a05651202eb00b005009a45063bmr2407751lfq.13.1698427685247;
        Fri, 27 Oct 2023 10:28:05 -0700 (PDT)
Received: from ?IPV6:2001:14ba:4c14:9c00::188? (dltml4yyyyyyyyyyyyhfy-3.rev.dnainternet.fi. [2001:14ba:4c14:9c00::188])
        by smtp.gmail.com with ESMTPSA id f13-20020a19ae0d000000b005079db81105sm341725lfc.116.2023.10.27.10.28.04
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 10:28:04 -0700 (PDT)
Message-ID: <ccf7d12a-8362-4916-b3e0-f4150f54affd@gmail.com>
Date: Fri, 27 Oct 2023 20:28:04 +0300
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
To: Linux USB <linux-usb@vger.kernel.org>
References: <ZTsR-RhhjxSpqrsz@debian.me>
 <055de764-c422-4c22-a79b-dd4db56122ce@gmail.com>
 <2023102704-stable-lid-c86a@gregkh>
 <7484f7c8-a49c-4111-83f0-bb6db2906fae@gmail.com>
 <2023102729-spent-ninja-7e39@gregkh>
 <037e5af2-3afd-4a37-a4d7-6dc87af605c7@gmail.com>
 <21c2b8ee-7753-413e-98f9-d1401edf5c73@gmail.com>
 <2023102720-emotion-overlying-9bb4@gregkh>
From: LihaSika <lihasika@gmail.com>
In-Reply-To: <2023102720-emotion-overlying-9bb4@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Change lower bcdDevice value for "Super Top USB 2.0  SATA BRIDGE" to match
1.50. I have such an older device with bcdDevice=1.50 and it will not work
otherwise.

Cc: stable@vger.kernel.org
Signed-off-by: Liha Sikanen <lihasika@gmail.com>
---

diff --git a/drivers/usb/storage/unusual_cypress.h b/drivers/usb/storage/unusual_cypress.h
index 0547daf..5df4075 100644
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


