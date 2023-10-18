Return-Path: <linux-usb+bounces-1880-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 857017CEC28
	for <lists+linux-usb@lfdr.de>; Thu, 19 Oct 2023 01:36:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15543B2113D
	for <lists+linux-usb@lfdr.de>; Wed, 18 Oct 2023 23:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBDA93D984;
	Wed, 18 Oct 2023 23:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aCtbw7hg"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9C15AFB
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 23:35:54 +0000 (UTC)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 383E0116
	for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 16:35:52 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c9b7c234a7so64095145ad.3
        for <linux-usb@vger.kernel.org>; Wed, 18 Oct 2023 16:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1697672151; x=1698276951; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bVieOb0dxZHUr6sRshHvITc5Lu6bs9wgA5QbLNsB1wA=;
        b=aCtbw7hghe5Xlequ8YglKDSCs4T/c7Zc6Nkhqu0yKwNRHESwcBD1d90rreycPlbj/r
         YJhftJKyayycCJMPgP1mb9g+uKsjYeS5eisXmEz+StT9pqyI4gu4QjP4xQr36o+ZhyNM
         dU8lgm6c8ZiBnirvF3IsuH7bupqdNfTHc82nzWXthOGJkd5DyO+uJTN4CHY/omokN92D
         LCdbXRyra55eVOXisl1Jl3Ic60Ky5PtUESUqT9MIrf8uiyBTr2ouRTMa4jJk7BQg2HCJ
         +9VjWEVZgZMXIj/2J5iZKNysCEoVZxNzDS2+dweprfIlCRGddozgNz/xJhhGgZwr6jFg
         4kEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697672151; x=1698276951;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bVieOb0dxZHUr6sRshHvITc5Lu6bs9wgA5QbLNsB1wA=;
        b=QWZC62f2MKmNzHjB4OeQlkXxiiouv8Cs2zR0r24OV5YbQkjpvO7V7Rwb7VN3x1/3rN
         yZ5u9ZRlSVZ4jILAdl0mrUBcWJj77hi7+t71Au+rYkbF5bqGeKkyaLKf7f0zQHrcmgbu
         0LBC8Q7+f6zT4fY6SlVoszYZ5GZb4ZP80/8DCoG6/XLgr24pcVzB1YxrsAq9jLRRuylw
         zd2I4126tLME73eQcm+RpAt9RnBvVSIGgArGoNY+rGIizIrQ/cvSOJ245avHWWwxo0Mp
         oHj2IEFI7T0SoHJCUt2IZIO22AG/mN5FwmJhhsTD5X3QkvTJYxyHO8snoT+gLL6PE+T4
         RkGw==
X-Gm-Message-State: AOJu0YxYmBMMBxX2wL+RDbfxLwt+9gbBTomZlBUQCbKn1kKJfSPNsX/f
	nYaRK6ja6Xgp9bRHmzb8uxuEqbiuWVQl5NCS3iS1opOt
X-Google-Smtp-Source: AGHT+IF6DP08YuF0s4nevLIzTNQsS4ESEj4nqDz/AtSRGY4TJ5rD4s/7971Un9CwPLc63qz0Jf2LTQ==
X-Received: by 2002:a17:902:e88c:b0:1c6:17a4:afae with SMTP id w12-20020a170902e88c00b001c617a4afaemr1147004plg.4.1697672151469;
        Wed, 18 Oct 2023 16:35:51 -0700 (PDT)
Received: from [192.168.88.195] (48.109.197.35.bc.googleusercontent.com. [35.197.109.48])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902bd0c00b001c5f0fe64c2sm496212pls.56.2023.10.18.16.35.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 16:35:51 -0700 (PDT)
Message-ID: <9fec0dd7-f111-4e71-95f2-a06488eec066@google.com>
Date: Wed, 18 Oct 2023 16:35:47 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>, "corbet@lwn.net" <corbet@lwn.net>,
 "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
 "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "etalvala@google.com" <etalvala@google.com>,
 "arakesh@google.com" <arakesh@google.com>
From: Jayant Chowdhary <jchowdhary@google.com>
Subject: uvc gadget: Adding super-speed plus descriptors
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello everyone,
Currently the uvc gadget driver doesn't set descriptors for super speed plus
configurations in uvc_function_bind(). I see that there was a patch uploaded
a while back, at
https://lore.kernel.org/all/20221103060041.25866-1-jleng@ambarella.com/ which
was addressing this issue.

I tested this out on an Android device and it
works - in our case we were seeing that the number of configurations advertised
by the device was 0 when a super-speed connection was used. Would we able to
merge this  patch ? Or would you like me to pick it uploaded and post it again ?

Thank you,
Jayant


