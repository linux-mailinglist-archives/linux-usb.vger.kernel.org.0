Return-Path: <linux-usb+bounces-30301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E40C9C4931F
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 21:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E3BB3AF8C9
	for <lists+linux-usb@lfdr.de>; Mon, 10 Nov 2025 20:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84C6833F8BA;
	Mon, 10 Nov 2025 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="PWiLgpM1"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B602D7DC2
	for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 20:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762805429; cv=none; b=Y0vIX9VSHw10ed98bktLu9UguwstqP25EQcm6mvTEq0F+7SwHDrIbon1CXiDRvl8kuXDvtPSKsddjWtcRASyFSfw8aDb0uJA6KE+Km2vRmJ8xIGSGe4l4FSxWFvMhilAkDFb/mixXKyDziylL9Jychx4ucgByXUjToz+sSskLyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762805429; c=relaxed/simple;
	bh=9jh715J3zhYgr7vV+A0FRNJLn3+kp5U4RcDiOVM26r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r8ChKuMHMRHBFdJG3PDrMjimc0v7qwjawj84R929MwtLNDk25+9lcHQSzQC0wIYowIs0RybMOlPWLErBNQ7b7R422IwUQU2lA3sW0gJbZ5WPSpO5Fe9luCu+9o5vg8UUrs5Ueu58iZUac6xfxQrLr3ZXAvIN3Is/a/Da5vp7uoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=PWiLgpM1; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4edade7d5baso1693051cf.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Nov 2025 12:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1762805426; x=1763410226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=PWiLgpM1Xj1hcc/Diykff9tkLedp9HlEv2Ndy6lA+4MhX86FsY8YwrnCd4/m0Dw5BO
         cNb/SahwoaQMJvfa33bjgNLyIYNvhXoN4qBdFN5Ybka8zWkXEo42XY+HgtfaVbESChnq
         ZkPHkpfnmbNB29sCKLi28yUzjivvAIDLyrVhGjdg2yYo3YLn5QswSXnWLzMKS97QZ5Ga
         9rhdDCAjmtVfFZzsuBRLJ+mPIXVuYp0NhKA6Rw+2eeemhtP2I261YzuWKQvKBZtYZPo4
         hTQTljymK2z5UxSsc+LCwUU7lrESGNtBLWQt7OGhTGWouLpbEgVhwAAMhegpetzKUT/k
         a+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762805426; x=1763410226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1l1rpdi0edG+jJ2v9QDv3ez8ceen+pVk5UIQhPyIEc=;
        b=tUcgFh9Ue3wUoJI/4Oo3NifO2JU6/Ycb9Viu564fycr3V5pi3bscO88YCtQwfWJ16j
         jQuZFOdExxAbRpg8uEO6uRX/8hZc0WJArwvBno//XtkmCSN2xck0ELtf2btGBpUnmxc8
         0iuOk3sLVlD+zpiGpKVJx2G17rv5kSoxit5PTnvJK7HDbhKdYtBv3Nx956EVWsYn3le5
         bEnEDFc5yaRdYO2mkHj5ch8vQWyUG3VFjoqtHbNUYLMxDV5nfcqd7ZkeoN/UANCeWjVv
         W468yQYZ0cjSSeUSk93zC0kmuX2h/lAEpsdvR/ePBce9ksX3di8PIXw9IaL9uXw3gXnd
         7J9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUuHlqDahPpUtJk24ckqfr5jrPTFu6QeKOEAQuAqkBXi0SEBR+4yJ09NnuQufxYZwLI9V0JSVUbYtw=@vger.kernel.org
X-Gm-Message-State: AOJu0YydVN4Fg6CjJtQ+I6bdMM8YZ8cFrbt64uWFgC5cG7+8g0SfCBl1
	U0U7H13rEJmzv9LlF7CcUS8pPdh6lK7lYs3vCb6Y8Z3hDHJL0hTdkIuTgVZEAgQHIg==
X-Gm-Gg: ASbGncu0MKFrp1v58jrKb+8Ad/zpRf1zLCQTgRrdLCtzryMtTOtgZYbYnfTO8zg7ukG
	iBxvA26lOjNQdH9g13XBRd5LBd4kzDM7RcTirXBJRX8eevwrqHIKDo90v84nKX/qiEFu9fQJxvi
	RBGtDeP30PnaqBZfVTFO0SURf1cWRAf9i0NGAOiVgNZeS6R03FkwwpegzdQpEAwBw76cFkUTBGk
	EJrHjGYj2ylIGdjidfSHJ5IYDwzSp1CN8CqdO8quI0SYGq6KXgylLeyYioNQmG+ikrKn6BLJyaB
	ReQQjF2MM6JuF/zGxiWcjIEddDXqJws1fl8VPIdzxz0lB05cIEVS8X7YL2jzowul049uxOsb3q3
	RwOD4Ms9IjG9sGiuWjqdZo9Zr13isweLRHX5tNeoEe86f5TigQDsWqKXY9R8cHeF2fPb+MRmjka
	i0IIBeKuNKFbQzLtOnHxtW14WklI9QZvAIUazkOQ4eB0vItX2kIu+4ym4zudKEN9dl1mAMYA==
X-Google-Smtp-Source: AGHT+IE6vW1fZ0H1TK1sGq2X+CuEOdqFfcqY7kVDqldDW7KHCD//2cXzu8s4xuuaBFfozryysnDJFQ==
X-Received: by 2002:a05:622a:5445:b0:4d1:c31e:1cc8 with SMTP id d75a77b69052e-4edcab19f1emr6309711cf.22.1762805425906;
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4eda561a021sm53507261cf.1.2025.11.10.12.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 12:10:25 -0800 (PST)
Date: Mon, 10 Nov 2025 15:10:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Terry Junge <linuxhid@cosmicgizmosystems.com>
Cc: The-Luga <lugathe2@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Michal Pecio <michal.pecio@gmail.com>,
	Terry Junge <linuxsound@cosmicgizmosystems.com>,
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-input@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Subject: Re: [BUG] Edifier QR30 (2d99:a101, Jieli Technology) reboots itself
 when RGB brightness button is used under Linux
Message-ID: <1ac9d1dd-822a-487a-bd42-45c163dfbfe7@rowland.harvard.edu>
References: <25f2419a-ee91-41eb-9446-87d238b4c7c4@rowland.harvard.edu>
 <CALvgqEBu_RzQYRSJnbu58XZt5wHX6PRD8i-J7Tovh7+KuhOyag@mail.gmail.com>
 <6999b5b2-a242-432e-8100-5d8ee58bcae8@rowland.harvard.edu>
 <CALvgqEBD05PwMpm00cAbFkpSWpCFP9jaBU0r-8+op+RGPtkktg@mail.gmail.com>
 <7adc816d-169d-4213-bb67-9d070af3c4a7@cosmicgizmosystems.com>
 <30528153-95f1-4ec7-a6bf-5da396441f86@rowland.harvard.edu>
 <xrfmda5rohporc3bjax35fc7xjziai6cmdt5svjak5rps6y6jz@k6h4zlt3jgg2>
 <CALvgqEDZ=g+uvdSYqbD22sL_VP+n6Pda2xXuFAJyKkh3bjm6HQ@mail.gmail.com>
 <CALvgqEC6UW96NEYOCM5v0m4x8Si0A7AwPuMpwXt3PMqkO3eqww@mail.gmail.com>
 <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <52fc4350-2930-44d3-b844-03f00806f142@cosmicgizmosystems.com>

On Mon, Nov 10, 2025 at 11:57:10AM -0800, Terry Junge wrote:
> 
> 
> On 11/9/2025 10:54 PM, The-Luga wrote:
> > PROBLEM IDENTIFIED AND SOLVED (almost)
> > 
> > Reading this: https://docs.kernel.org/hid/hidintro.html
> > and https://github.com/torvalds/linux/blob/master/drivers/hid/hid-quirks.c
> > 
> > I decided to try the HID_QUIRK_NO_IGNORE:
> > 
> > I added to my kernel cmdline:
> > 
> > usbhid.quirks=0x2d99:0xa101:0x400
> 
> Are you sure?
> 
> HID_QUIRK_ALWAYS_POLL = 0x400
> would stop suspending the device.

Actually, it forces the kernel to poll the device's IN endpoints even 
when no program is holding the device file open (see where 
usbhid_start() calls hid_start_in() if the ALWAYS_POLL quirk is set).  
This is exactly what the speaker seems to need.

As a side effect, it prevents the device from being suspended.  But that 
doesn't seem to be the important thing here.

Alan Stern

> HID_QUIRK_NO_IGNORE = 0x40000000
> would stop ignoring a device that is in the ignore list already.

