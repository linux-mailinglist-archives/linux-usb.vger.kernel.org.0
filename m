Return-Path: <linux-usb+bounces-809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B479B7B391B
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 19:45:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 6555E283EC6
	for <lists+linux-usb@lfdr.de>; Fri, 29 Sep 2023 17:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E85D766669;
	Fri, 29 Sep 2023 17:45:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EAE51B88
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 17:45:53 +0000 (UTC)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE3219F
	for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 10:45:52 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id d2e1a72fcca58-692a9bc32bcso10898373b3a.2
        for <linux-usb@vger.kernel.org>; Fri, 29 Sep 2023 10:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696009551; x=1696614351; darn=vger.kernel.org;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:to:from:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7q/Ocr/LuKL/ulDcDi15T1xKwBX0O06v5b0Uc8oaurk=;
        b=Q/yMuijQ5MHNSPABrzKT/1A79G+Uyj1DDSH9keIJ04vG0+LMTQlvmH4/TflWlTT+M4
         MS/4gsgnG60uXtPFoc82ydwH2XeJC/Ll36Fk2ptT/nSENou1VCc5BtszDqp47WEelp6+
         8+vi9HQcWaRlmTolHgUyPMbO2NDIk4T2+SkB+7187APX61Ls3zOpf4rO8HIxNTjjdGAZ
         ljy5D+tPbUFORdc3vymVF0G3i2D0KU0ZqDClSjIHc7vKDYms8hcvocptwZV8WIGouE3/
         UYSY6gZcqrYNululQa0eH/TYSrs7CwUTV1ZwLiTGVdqQRSNzEZzUpJk/IBWxvxxdHEZo
         8O7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696009551; x=1696614351;
        h=content-language:content-transfer-encoding:mime-version:user-agent
         :date:message-id:subject:to:from:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7q/Ocr/LuKL/ulDcDi15T1xKwBX0O06v5b0Uc8oaurk=;
        b=Xr2ZZlS3t4riVklqnUAAoOm2QRHXGo727H4/2A8kqrn1YrcsvvcChYDkMnqvVZqM+d
         N2/jIIxHkbm82+ylmnIilWlpU6+o25i0pQHT6PB56FS+6fn8ccKki6LBy2j+QOhd5sYG
         t5L8xLrzlDm7CuMuyTp4si7++JpVvIig5gjUDzGljdw4mUkatacGOIvBxxvrOAqug+H4
         WinoDXgQMbeeFyUMbEfeOLJZ/U0OIOuwlHCmUncLIs6D/o9SaqyymbpY45JXLHusZKv7
         tSTtT6GBT9rO8hAP29Z/k/jU5BBBsNkctEdQpo+0g4q0GGIPX1EoRNypLn7zLQRJ8bgn
         IEYQ==
X-Gm-Message-State: AOJu0Yx7ju5usPHvjgxp0C28/cDSbYlr1+BTOldgKJWm67y3iR9iuis3
	RRY05Pu6HgZNdvNvc8P6jDqIBv+MJLUeIg==
X-Google-Smtp-Source: AGHT+IHMyZpZpnGIlTkv3uqbVftZ/DrBCXW6tIs4pq98dp+lH2BgTCHqc1MErCi0MraiW+60taRIRA==
X-Received: by 2002:a05:6a00:855:b0:690:1857:333e with SMTP id q21-20020a056a00085500b006901857333emr5432370pfk.26.1696009551431;
        Fri, 29 Sep 2023 10:45:51 -0700 (PDT)
Received: from [192.168.43.79] ([47.15.3.9])
        by smtp.gmail.com with ESMTPSA id x18-20020a62fb12000000b0068fe6ad4e18sm15279163pfm.157.2023.09.29.10.45.49
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Sep 2023 10:45:51 -0700 (PDT)
Reply-To: businesssolutionsrocks23@gmail.com
From: Noor Bano <noorbano3685@gmail.com>
To: linux-usb@vger.kernel.org
Subject: RE: Meeting request
Message-ID: <e883d06e-86c2-8832-9ae4-0de1fb92e771@gmail.com>
Date: Fri, 29 Sep 2023 23:15:45 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Hi

Circling back on my previous email if you have a requirement for Mobile 
App OR Web App Development service.

Can we schedule a quick call for Tuesday (3rd october) or Wednesday (4th 
October)?

Please suggest a suitable time based on your availability. Please share 
your contact information to connect.

Best Regards,
Noor Bano

On Tuesday 22 August 2023 5:43 PM, Noor Bano wrote:


Hi

We are a Software development company creating solutions for many 
industries across all over the world.

We follow the latest development approaches and technologies to build 
web applications that meet your requirements.

Our development teams only use modern and scalable technologies to 
deliver a mobile or web application the way you mean it.

Can we have a quick call to discuss if we can be of some assistance to 
you? Please share your phone number to reach you.

Thanks & Regards,
Noor Bano

