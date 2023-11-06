Return-Path: <linux-usb+bounces-2562-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 783317E1AA5
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 08:03:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A4DD21C20A4B
	for <lists+linux-usb@lfdr.de>; Mon,  6 Nov 2023 07:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A400BA43;
	Mon,  6 Nov 2023 07:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnRTz0J1"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD234422
	for <linux-usb@vger.kernel.org>; Mon,  6 Nov 2023 07:03:07 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4717C6
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 23:03:05 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32ded3eb835so2901022f8f.0
        for <linux-usb@vger.kernel.org>; Sun, 05 Nov 2023 23:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699254184; x=1699858984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UQQrXVp1yB3RDtpJdxHWupcjK/Y8l8iZQURbUIaupXM=;
        b=AnRTz0J1c4qFZKIUi7sdaNRmweQ3U2OkueW7nySRk4iiO0kbALwc94l1VWP7aDpHAc
         ukf/yX4s4yyny+DNVCCLlJuCcuwjlfh6J2iy5B2UmK/godaB1BjvS3AxXXfvkzMAmIJ7
         q0yuUCDeDu9kUFO17wI2t7QXbBxrNNZrx/Pu+KG/tcvWQ+/KlH0tFZaBuO04WjHNwxRP
         LsZZIePJNtWUmpHVaI/dCQrpTqFSwTvYvfj6JOsPt+/9PFrOT2VKK//UzgZtAe7dOEvp
         9V0jGVnMMhkSUrwlsmIELPIHIYsBpqKdl1zFldjbu74mPfS+WzPW7fGGS2Aa/7AHTeel
         kijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699254184; x=1699858984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQQrXVp1yB3RDtpJdxHWupcjK/Y8l8iZQURbUIaupXM=;
        b=RPg7ItuBEL6S4IV7ElvBxjJSkOaMKQzeqVYCac8nkqCaql24oyu3qn8tKin5w/y+h0
         zGp7bz2Py6jA1JaHPBWO8QtKnwuj2vCqzGW5z9PC0vlYgUMQzG+Oz+E+gTlidFBz4vcd
         5V+WFf/DZxecqw/YJshMwi8s8lDf3DRnejcdYssgtl8rj1mFIupvXDphb9bA2qxXsMdN
         wo8PrQyisscQM4ExZrEqXGSBwu8S1sJOpkEliHcOJDs7WgMNXGvIh0TLGGL6ct37rv9A
         /4p7bgWqW96owCPilLAIvEmUwyLziDCWo+UROaii50rBWV2ho31/PJPoT/zd1QYOkNgx
         AVqQ==
X-Gm-Message-State: AOJu0Yy7LgDfCv7e0ws6K0Z71CdAsnUYhi9UvYbDkyzzOH1HljMmLtgA
	L65+FjNvT2ExM09YUHZN1sYEiPBI4BGHQOuj
X-Google-Smtp-Source: AGHT+IFcA7xyUDz9n42qeoOf1u91/MCpHmVwBipXdbaYHcYln8jCox0nv+dHGONFiwFiw+MypG7f6w==
X-Received: by 2002:a05:6000:1ac7:b0:32d:a213:4d7d with SMTP id i7-20020a0560001ac700b0032da2134d7dmr24521297wry.56.1699254184010;
        Sun, 05 Nov 2023 23:03:04 -0800 (PST)
Received: from ping (dynamic-2a01-0c23-6413-4b00-4825-3d85-08ce-2b8a.c23.pool.telefonica.de. [2a01:c23:6413:4b00:4825:3d85:8ce:2b8a])
        by smtp.gmail.com with ESMTPSA id h2-20020a5d4fc2000000b00323287186aasm8589118wrw.32.2023.11.05.23.03.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Nov 2023 23:03:03 -0800 (PST)
Date: Mon, 6 Nov 2023 08:03:02 +0100
From: Fabian Melzow <fabian.melzow@gmail.com>
To: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <20231106080024.197ffdd2@ping>
In-Reply-To: <61fb4593-c24d-4891-8d44-e2ef819af57d@rowland.harvard.edu>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
 <2023110534-fester-schematic-818a@gregkh>
 <20231105143051.2b28c316@ping>
 <76fc65db-4efe-4da7-a13f-d7a451f836fa@rowland.harvard.edu>
 <20231105163300.3b8df5ad@ping>
 <7738cb40-9ef1-4e8e-8888-b8faadb7ba8a@rowland.harvard.edu>
 <20231105210616.79fea846@ping>
 <61fb4593-c24d-4891-8d44-e2ef819af57d@rowland.harvard.edu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sun, 5 Nov 2023 21:10:47 -0500
schrieb Alan Stern <stern@rowland.harvard.edu>:

> On Sun, Nov 05, 2023 at 09:06:16PM +0100, Fabian Melzow wrote:
> > Am Sun, 5 Nov 2023 14:16:18 -0500
> > schrieb Alan Stern <stern@rowland.harvard.edu>:
> >   
> > > Have you tried plugging the device into a system running a
> > > different OS (Windows or MacOS-X)?  Or even a different Linux
> > > system?  
> > 
> > Yes, I also made a short test with the lsusb of an old Debian 11
> > Live-DVD. I got these devices for testing from the Amazon Vine
> > program and after the third Monday-Hardware WLAN-device with the
> > same problem I thought I should report this problem, to maybe help
> > real users.  
> 
> A test with Windows might be more informative, if you can manage to
> do one.  Perhaps the Windows driver knows how to configure the device
> to run at higher speed.
>
> Also, curiously enough, when I did a web search for reports of
> problems with this chip, the vast majority of messages were about it
> not working with Linux at all because Debian/Ubuntu did not include
> sufficiently up-to-date drivers.  People had to download driver
> source code from a github project and build and install it for
> themselves in order to get the device to function.  They didn't
> mention what speed it used on the USB bus.

The Linux rtw88 driver is maintained by Realtek and, if my searching is
right, first appeared in Linux 5.18, so it's a newer one. I could
trigger an Oops, which I also reported yesterday. According to
the Debian backport https://github.com/lwfinger/rtw88 some versions of
the chipset are still unsupported. 

The rwt8822bu driver has also a non-USB version rwt8822b, so the chip
for the USB support can also be separate from the main chip, but until
now don't want to destroy one of the plastic cases.

Fabian Melzow

