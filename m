Return-Path: <linux-usb+bounces-2556-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB497E1663
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 21:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A6782812F2
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 20:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91BBD1864D;
	Sun,  5 Nov 2023 20:24:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEgM4GvR"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D36DBE6D
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 20:24:23 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF6CB3
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 12:24:22 -0800 (PST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c515527310so52831861fa.2
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 12:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699215860; x=1699820660; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eo+VCmX95rqhDqtn56i2LEjkDGlQ1czpvQZsfaPJeMs=;
        b=iEgM4GvRr37i+z9j3FZ4SSQTN5echfZBiBfZjNY1Yxjd1dr7Et7V9zqgZpM9N1YhKA
         r9X/uGwVVefGSMrSXFLj/AJtpnwQV8VDrHRFUmxEMMrr2+9wpyb44SLaHIv5CADUPM8M
         5Qk4bONWYD632j+VQsz8iX+iK0oA8PVSrALVOLvyjp8Tqfj4zPG3epxLvUKxSaow7o7s
         b91WHU1117oByx174rU1KbWPOyvy3M0sQuO9I4c7kdK8YZwTtjHgo6KzfJkfmMaFXivn
         BY+b2Hhov8e79208TeSoVfQY4HjXHme5/mcQ6xpDP5iZpr5xmjtMJTit1zqYkEhMqLCL
         uLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699215860; x=1699820660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eo+VCmX95rqhDqtn56i2LEjkDGlQ1czpvQZsfaPJeMs=;
        b=Dxw5or41jOU7aucWtLZfzoYwd+DgjA3d4QtLSmF0wiIGXUy2E7fS/2jBAqh8L9MtJh
         97LcCRTapOOYuZd5UZY+mCDgFJwzX6c6C5FNxD9hP/kRdaEe69ehKAwWPgD+wT8Ak87w
         A+rDyIMTXU8DGlRC0kC31nLGHKPMdS+dIcUnozkwFYlmh2lBYHhEenhuv7xZZKQZQtJN
         5Su3FK9MmurNa0CUtvZ2eicNJeX8IOwyP4VFfcOyBLRPwAGbPJ2kyZTlp35HcLnQRvdZ
         nfcMGTHhNn+weaX0WAoAqV2PizYbC/PiAQ/MFIpeTBS7kNUEZSB77PCr4I+mYwq0MB8T
         MqUQ==
X-Gm-Message-State: AOJu0Yx0EmQuiWo57V3F+jrh/KIOC562qmQYdImC6mpu2F94bR8pL4Xz
	OFS7gct/LF2lSnFcwBqUFoK4HkuzGulVdA==
X-Google-Smtp-Source: AGHT+IH35+YbpKQEM4eOnBSmEMlmoFu96TYEIIPcC2bVzWv95QCevHK903869Gi8kFgEhR46Etcg3A==
X-Received: by 2002:a05:651c:54a:b0:2c7:fa6:718c with SMTP id q10-20020a05651c054a00b002c70fa6718cmr4619438ljp.9.1699215860333;
        Sun, 05 Nov 2023 12:24:20 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-614a-dd00-0ef5-1851-2e93-33e7.c23.pool.telefonica.de. [2a01:c23:614a:dd00:ef5:1851:2e93:33e7])
        by smtp.gmail.com with ESMTPSA id m21-20020a056000175500b0032326908972sm7570528wrf.17.2023.11.05.12.24.19
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 12:24:20 -0800 (PST)
Date: Sun, 5 Nov 2023 21:24:19 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <20231105210616.79fea846@ping>
In-Reply-To: <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
 <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
 <20231105163300.3b8df5ad@ping>
 <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 5 Nov 2023 14:16:18 -0500
schrieb Alan Stern <stern@rowland.harvard.edu>:

> On Sun, Nov 05, 2023 at 04:33:00PM +0100, Fabian Melzow wrote:
> > Am Sun, 5 Nov 2023 09:56:06 -0500
> > schrieb Alan Stern <stern@rowland.harvard.edu>:

> > > How do you know that the device's USB hardware supports more than
> > > 480 Mbps?  And even if the hardware does, maybe the firmware
> > > doesn't.
> > > 
> > > (Note: Just because the device's WLAN interface can run at 780
> > > Mbps, it does not follow that the USB interface can run that
> > > fast.)  
> > 
> > These USB WLAN sticks are sold as "USB 3.0", and also have a blue
> > USB-3.0-A-plug. I don't really know the speed, but 480 Mbps is
> > reported by "lsusb -t" or in the descriptor. I did not open these
> > devices, but have assumed that they only use a single chip to
> > handle everything, WLAN and USB.  
> 
> Have you tried plugging the device into a system running a different
> OS (Windows or MacOS-X)?  Or even a different Linux system?

Yes, I also made a short test with the lsusb of an old Debian 11
Live-DVD. I got these devices for testing from the Amazon Vine program
and after the third Monday-Hardware WLAN-device with the same problem I
thought I should report this problem, to maybe help real users.

(Forgot to send the mail also to this list.)

