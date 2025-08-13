Return-Path: <linux-usb+bounces-26817-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D5FB252E3
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 20:19:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9F115A7134
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 18:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 945C8191F98;
	Wed, 13 Aug 2025 18:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JrTh/BEB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832DE1D7984
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 18:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755109177; cv=none; b=WnE6XFw5jZM3FVVaAG8GRi7dTMmn4g4QjE+9N2fz7JI7Lr1vAjdecoyE5jN49MRAKDfp93i2jO7XHMv9O1AizQUZ4Iu+jfh4Tak7htLqKimTSvAFSHQpcA1MbaLxl+3eKgGDRWD3nZeIatK9mjRiEp9pblrSuJ3ayeDobuNVOvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755109177; c=relaxed/simple;
	bh=iD0th0JPT9XvS0OT+NlKvnds6lV5srAjhD+Ek1vOBmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+BQUdlCbYQRG0435/c980zEdvfLxSNcLlVt4YzxdP/KKLpcOaiGbfuIDDc/IJx8RbMNUO6Hri6tPFXEcLZiV1cPj7c5Zvc7ArCqDDT2PDxfjtQjSPN1qY44+cvbrr8gjBlP8FuLtyMUWYrdoN6+HqOwJbAbuVH/JcwCxPKiXxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JrTh/BEB; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70a9f15f15fso2048036d6.2
        for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 11:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755109174; x=1755713974; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+EddfMazfmOOVzuGouJhvs/WQquMhL7Ov9e7tsnnf4w=;
        b=JrTh/BEBe+eiHnrv7LLDsDJb2uoDcogn6bVEFOZkiLtamoLTC4zqya6aCxRXxo2CeK
         fuvffVTHyrY4WmMib4X1WlXPTDkJ6/LgdQexz9JGXT+rR+n7r+Vu5RriCTX75oCU5DiI
         uVhSxEYaPH76f7RDrzpa5PYVweAuIfOm4LAy6C3cbK+/Qb5ydDNdPfCHupjhoGgv0UT5
         zIcr2rBw9S6Uxmp2AkXq0qVvo2bMk0dSjPZEKnuLWBVOzW6AqKRheeCCNlhu2dTKt5cB
         Ix77ohwiseXno+Ja2ctGi4YU3Lr8c/6GRl18hbUU4Z9uz/JdCRqRCe41eJzMm5Mzo5Q+
         UPTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755109174; x=1755713974;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+EddfMazfmOOVzuGouJhvs/WQquMhL7Ov9e7tsnnf4w=;
        b=hprSTO523ilSxPBwe3nCKCBaEVPAaGcd8E27D8x3QqPPXGNVLpKkVe0HjlrBa2r8Ed
         OBQdjY4xFngZ49tqXuhfN7Hz+NYTGP8kA72LXVuq1Eu7k0wwRBUR5n3HfW9dwJQFs6qQ
         Jnt6VphK7uT39s4IYSOACaZ5j4M8CJA2hnH5qIRQlxiY5hMlSklVel/0DEGkofAuFkJv
         akkHrla8o+aLjTyf+kDAAjo+Vz9Ad6AonXa293bklV9jQRC2743E5Az3nkLtnnxeZY3l
         p13wUH2zfO8cSnVKww6OquQX38595TJCTcEYRE06KfIthja8qLz2Ttyz3iDLK61ucEy8
         CfWw==
X-Forwarded-Encrypted: i=1; AJvYcCXdDan9q7f94yG2okn0k1zKaMcSA9uL0XogAbjW6/Z/5loCuC72xeDDHjaoqTI1u+Yos9qLo69JSw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Gnz9GLOT4ySZ+ztcp+lpuBcvz77FM/C4ZfuaFVhnfvDnWr2I
	vrgEXNO4C8FQmcdlYgyg2Di7RlSc4N71uu6zU/Kl/RWCxCtvr/RRFCneILmOy37WGw==
X-Gm-Gg: ASbGncuVUyvfbcoUshAbZ3EsLRS8CY5vluRvR9S5O+loAZiItfaT42QLQj/8tY0AUu1
	CxCx3AKMHTZUH/MYzYSK2IV4jTw2QZlAr4PafvEeYiEa2WRtjpDzxRn75cZVR/4TUYuPzhJy8O5
	x7A61L8G7zfL8sFTjAwizftHUsRh0rWwQUdnWyFB7gXs6MvS0UZ5n+C6i/LyZUGOXPxaMYUgzZL
	0MCrcAK9dlG/BftpqiyjfyKUeLkzG9wFRw8sJhUQ/CGvpIWybZ/BvhunD7jJEIs2q6jutis3ypx
	L8UFoi4z71D/PEEBnf9icI9c5GazA4OP6lykiPY7vWbdRRHexaRh8AAixv21YkrHnB0dbedzhZY
	O+4nhHVnKgVyho1/bjDrEbQ1VMbvIo935SogLrPuP61kCj1Y9ut6KiSLmum6d8UxaHA==
X-Google-Smtp-Source: AGHT+IHKYi8hdhJJIgu/bCYBOlGTkEfmfhsKUWy4uhRFa7m1jaX30iy/xegLNRbs2iwR0T2ioiWIeA==
X-Received: by 2002:a05:6214:2307:b0:707:6c5:55ad with SMTP id 6a1803df08f44-70af5c0002emr4387246d6.12.1755109174206;
        Wed, 13 Aug 2025 11:19:34 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:349c:f507:d5eb:5d9e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5c1df31sm1233556d6.81.2025.08.13.11.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 11:19:33 -0700 (PDT)
Date: Wed, 13 Aug 2025 14:19:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Zenm Chen <zenmchen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, pkshih@realtek.com,
	rtl8821cerfe2@gmail.com, stable@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, usbwifi2024@gmail.com
Subject: Re: [usb-storage] Re: [PATCH] USB: storage: Ignore driver CD mode
 for Realtek multi-mode Wi-Fi dongles
Message-ID: <03d4c721-f96d-4ace-b01e-c7adef150209@rowland.harvard.edu>
References: <ff043574-e479-4a56-86a4-feaa35877d1a@rowland.harvard.edu>
 <20250813175313.2585-1-zenmchen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250813175313.2585-1-zenmchen@gmail.com>

On Thu, Aug 14, 2025 at 01:53:12AM +0800, Zenm Chen wrote:
> Alan Stern <stern@rowland.harvard.edu> 於 2025年8月14日 週四 上午12:58寫道：
> >
> > On Thu, Aug 14, 2025 at 12:24:15AM +0800, Zenm Chen wrote:
> > > Many Realtek USB Wi-Fi dongles released in recent years have two modes:
> > > one is driver CD mode which has Windows driver onboard, another one is
> > > Wi-Fi mode. Add the US_FL_IGNORE_DEVICE quirk for these multi-mode devices.
> > > Otherwise, usb_modeswitch may fail to switch them to Wi-Fi mode.
> >
> > There are several other entries like this already in the unusual_devs.h
> > file.  But I wonder if we really still need them.  Shouldn't the
> > usb_modeswitch program be smart enough by now to know how to handle
> > these things?
> 
> Hi Alan,
> 
> Thanks for your review and reply.
> 
> Without this patch applied, usb_modeswitch cannot switch my Mercury MW310UH
> into Wi-Fi mode [1].

Don't post a link to a video; it's not very helpful.  Instead, copy the 
output from the usb_modeswitch program and include it in an email 
message.

> I also ran into a similar problem like [2] with D-Link
> AX9U, so I believe this patch is needed.

Maybe it is and maybe not.  It depends on where the underlying problem 
is.  If the problem is in the device then yes, the patch probably is 
needed.  But if the problem is in usb_modeswitch then the patch probably 
is not needed.

> > In theory, someone might want to access the Windows driver on the
> > emulated CD.  With this quirk, they wouldn't be able to.
> >
> 
> Actually an emulated CD doesn't appear when I insert these 2 Wi-Fi dongles into
> my Linux PC, so users cannot access that Windows driver even if this patch is not 
> applied.

What does happen when you insert the WiFi dongle?  That is, what 
messages appear in the dmesg log?

Also, can you collect a usbmon trace showing what happens when the 
dongle is plugged in?

Alan Stern

