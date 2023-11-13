Return-Path: <linux-usb+bounces-2837-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3017EA33C
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 20:02:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C00731C20982
	for <lists+linux-usb@lfdr.de>; Mon, 13 Nov 2023 19:02:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A8622F1C;
	Mon, 13 Nov 2023 19:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="imLdyQi8"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D367722EF6
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 19:02:30 +0000 (UTC)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 333BAF3
	for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 11:02:29 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40891d38e3fso35727755e9.1
        for <linux-usb@vger.kernel.org>; Mon, 13 Nov 2023 11:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699902147; x=1700506947; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:mail-followup-to
         :message-id:subject:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o2IA05u9AenQA+9ttiemJXT4mvTYWamIO+O2Encr/AE=;
        b=imLdyQi8kY1o94DhJxOWfoOkX1cldDK5Iv/vHf4Zr2+XLcLwTS/YZZDt88VYY/yOlb
         ck8aqoq2OJ2t+VZtnZLROMYWfrCt1xrSbB43xg1NX1yNXhO/z5N8JNoJWhceD6MOUQ3w
         B2OD4XCWLZvKt/kt4RMaeJHbJk84roAlO2NhG7F0bSJ4eIN1g8PtJxA+L7OKmMjfgqJB
         8iUx/khHUoKlt2DuyYzKjv0HBRtrhyNC3Aczv02h8/KcQz0+3Zsn0wKl6VdlyeMANNRa
         WgfzPilFQ8dzV24t8HkA+iwumQTE4SMmx8c7fvLW4SNYMA553It9jL8Y3We+zX96UI22
         y4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699902147; x=1700506947;
        h=in-reply-to:content-disposition:mime-version:mail-followup-to
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o2IA05u9AenQA+9ttiemJXT4mvTYWamIO+O2Encr/AE=;
        b=t62hGsV8OrWp17P7s6D7gRDA8NOmEunt/kQoTxk294v1kBgnCc0QxPMTjMeFgM/2aM
         aFe0Q6CbK1aBocitvP6mF1aT+mRfSDLZtNudNV5Jcwb292jmHhK7A1HtJhuozGDRklM1
         M2mbqRYMkbAy+JYja2ydg8TyS3/sMN4ugVdQgO9AoSn8f4CHAdNOgNr/AbCYzYV5oQ/H
         cf80DWkxtiVBflzlIZc96Sh71ldcbmqAgYgu4XyYk4uNFiM9b4UVh6MXjMNos0QamI58
         rCx+b1j7kyjFL9BSlFpZnHUqMcyNkFVrejgIry99fVvxrsSGJRTMuUyW6oNp8D01SKDX
         2i5A==
X-Gm-Message-State: AOJu0YzEzSh7dwP2JUBW8FHZy1RcTwNp74o+1AREuHokNA+XeNC7t9CV
	TjRCqSsHQDTiX6o+VfjK4aW5Z/UiCeA=
X-Google-Smtp-Source: AGHT+IEVhYmf+Dd+a/62fQdu6q+DVxmSwKVL/ADG9dmJGhof1GL2QO5XiYRnSsBDOERR6I9m2lR8rg==
X-Received: by 2002:a05:600c:444f:b0:401:bd2e:49fc with SMTP id v15-20020a05600c444f00b00401bd2e49fcmr5922697wmn.24.1699902147331;
        Mon, 13 Nov 2023 11:02:27 -0800 (PST)
Received: from ryzen7700x.fritz.box (p200300ee973f6100aaa159fffee94020.dip0.t-ipconnect.de. [2003:ee:973f:6100:aaa1:59ff:fee9:4020])
        by smtp.gmail.com with ESMTPSA id k23-20020a05600c1c9700b0040531f5c51asm9025406wms.5.2023.11.13.11.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:02:27 -0800 (PST)
Date: Mon, 13 Nov 2023 20:02:25 +0100
From: Andreas Kempf <aakempf@gmail.com>
To: Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: Slow enumeration of Creative Sound Blaster G3
Message-ID: <ZVJywfuXwJu7asbQ@ryzen7700x.fritz.box>
Mail-Followup-To: Oliver Neukum <oneukum@suse.com>,
	linux-usb@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f85ecc36-8e05-4595-8baa-5f4b48afc8df@suse.com>

>> On Sat, Nov 11, 2023 at 05:58:08PM +0100, Andreas Kempf wrote:
>>> Hi,
>>>
>>> I apologize if this is the wrong mailing list but my investigation
>>> led me to the USB subsystem and I do not know how to proceed.
>>>
>>> My system:
>>> Arch Linux
>>> Linux kernel 6.6.1 (-arch1-1)
>>> Motherboard: ASRock X670E PG Lightning
>>> Device: Creative Sound Blaster G3
>>>
>>> I have a Creative Technology Sound Blaster G3 USB sound device that
>>> seems to work perfectly on Windows. It used to work just fine on Linux,
>>> as well. However, at some point a few weeks ago, it started behaving
>>> oddly. Unfortunately, I cannot pinpoint exactly when the problems
>>> started happening because the symptoms did not immediately point me
>>> toward the device and I did not immediately figure out what was going
>>> on as I only noticed hangs when shutting down the system.
>> 
>> Did you update your kernel between the time when the device was
>> working okay and now?
>
>If this is a regression the obvious suspect would be
>
>5fadc941d07530d681f3b7ec91e56d8445bc3825
>("ALSA: usb-audio: Fix init call orders for UAC1")
>
>I'd suggest you try reverting that.
Thank you for the suggestion. I figure that this commit made it into
6.1.52. Arch packaged 6.1.51, so I downgraded to that and then again to
6.1.12. Both showed the issue. Somehow, the kernel version does not seem
to matter. I am baffled by the whole thing as no other piece of software
should be involved here, as far a I can understand.
It could be some kind of hardware issue (Motherboard/Device) or an
extremely weird race condition that I somehow hit all of a sudden.

(I seem to have messed up my initial mutt setup for the mailing list, so
I hope this reply does not completely break the thread)
>
>	Regards
>		Oliver

Best regards,

Andreas

