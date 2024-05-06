Return-Path: <linux-usb+bounces-10054-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AECCC8BD23B
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 18:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E13A1F22A73
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2024 16:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353E715625A;
	Mon,  6 May 2024 16:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj1tTOSL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59118155A55
	for <linux-usb@vger.kernel.org>; Mon,  6 May 2024 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715012106; cv=none; b=dPECycMCR7NRqpRzfagNK11pSVemWJRXNyTHFWX2MOtwdywl7TmGH4bbUm6bu30taAaY65VmaZqH32pYyPYf2gq1hcx3KFfo6RqT6jy2YtgnMWXU+pNud9pKQLvCVW7/SyVAl1yE8VMqb3Bb7HsSE2CxL9cKTcsGePCQYjRg150=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715012106; c=relaxed/simple;
	bh=eMmHxQBc8sVY/Tn+KK4VgZL6HuY3G7ViFNwffTZZcqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sl2q5yfnwuKcv8pAH4v4Ht2vHYz00BH6ihRFP0tyHBvbugQxWg+r/zhEAs4H6n2JQgAUcrWH/R6/9aC0ivnHAXQntl9Drbxn+JyBQMPo3yuFIoBoaZlJM9sLwVSveT1HIBNCyVHGu/utoLXLTUnS97JXo50L8NTFwRKTvQGRmVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj1tTOSL; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-61bee45d035so23969697b3.1
        for <linux-usb@vger.kernel.org>; Mon, 06 May 2024 09:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715012104; x=1715616904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PT/XuW3+puSqUiHebr8023g8EVG7wmWOHAUS8Dhg5J0=;
        b=Dj1tTOSLNDWGL59GiS5/kF3ha/yo2el+MV+WS5BmMI3x6+JZmwcybjN2Px8pYYi8yw
         x2WoNC4MO5E9DbcE5zActxgXvKuP6nE94qIx/zXJNNFO12dw5ygGqHREtyjMirMLShWb
         B2F6ZA6XOvqrzZOh4Cqnz3hH7jLVoTNFJtPkxwOvAFCAMxZsJE9f7vAPB0tHc7pRPor3
         dGyI2yOHvfH3juJ+uVvsloWnSojk0WvZQruZW5SzOjVOIJrooWt60XfM9f5IGUeAsWSt
         JLsnc+E/OIBC/Xrt0CjknbVYBpIP+NYcpCKrTNFzSuMYNL12aN18rBAwj/GW00G5CJ3J
         arzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715012104; x=1715616904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PT/XuW3+puSqUiHebr8023g8EVG7wmWOHAUS8Dhg5J0=;
        b=lTZCbwbtdwr3r5SVo/bV7oPkY10hNNWtxtg+o8xr4i6otPNRjd8k9OwjJoHhnyphT8
         K2M3Zy0C4z8UH0MIz2Cs9FC+PTCUwx1lVZDavaAi2DP4hx81Xg3WjU5RJn49r1Q8slEq
         wO2ThigV7rZ0HRL7GnVF0SBAOVuEk67KXpcQJWhMOx0ZP7JB4KXwZ5uJ68MXFIKHoDzi
         Ba9KsNki9dqWS5gVuBlM9wYyRpPT2+z/6zN+qXafHBdb3gYQ71V4P5uHpCCQ3fubttyy
         6XIktARaHvnuceAPYLpxzulffqSsSgN3y/aZFQ8RRuOD6TWKUmcg5uI+cBHefNAXDm7d
         WUFw==
X-Gm-Message-State: AOJu0YyJyRVSGIYw1AtmdwAGoKm4dAOketjODLGxAql0f/ixk2mkYudw
	YltqdAPxQLRHEQUemw1TzJltg1pJhIBvNxt5Ln5O0SB8cUUqIUSojsB5YpqWV3P6QJW4VaWRhZt
	nfcXlSJeQhKwv5SlXFQD6X33N4Z8=
X-Google-Smtp-Source: AGHT+IF+YiusqmYKc9a9gAqXZENOa6WMHgyHPMJmP0FbtNBjB1gbunE7CzM4yphTjL/o3R2wYJLXKqTRIHzAfkcaewk=
X-Received: by 2002:a0d:dbd4:0:b0:618:90cc:bc43 with SMTP id
 d203-20020a0ddbd4000000b0061890ccbc43mr10106301ywe.22.1715012104114; Mon, 06
 May 2024 09:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
In-Reply-To: <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 6 May 2024 21:44:52 +0530
Message-ID: <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
To: Alan Stern <stern@rowland.harvard.edu>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 7:59=E2=80=AFPM Alan Stern <stern@rowland.harvard.ed=
u> wrote:
>
> On Mon, May 06, 2024 at 04:44:30PM +0530, Muni Sekhar wrote:
> > Dear Linux USB Subsystem Community,
> >
> > I hope this email finds you well. We are currently working on a USB
> > device driver in the Linux kernel space, which supports the
> > suspend/resume functionality for a USB device using the struct
> > usb_driver's .suspend and .resume callbacks.
> >
> >
> > In our driver code, we perform a check to determine if the device has
> > remote wakeup capability. If the device supports remote wakeup, we
> > enable the device's autosuspend mode by setting the struct
> > usb_device->dev.power.autosuspend_delay parameter and then calling
> > usb_enable_autosuspend().
> >
> >
> > Similarly, to resume the suspended device, we expose an API to user
> > space via IOCTL. In this process, we set struct
> > usb_device->dev.power.autosuspend_delay to -1 and then call
> > usb_disable_autosuspend().
> >
> >
> > While we have successfully converted most of the USB device driver
> > functionality from kernel space to user space using libusb, we are now
> > seeking guidance on how to implement USB device suspend/resume in user
> > space. Specifically, we would like to know if libusb provides support
> > for achieving the suspend/resume functionality mentioned above.
> > Additionally, any insights or suggestions on how to accomplish this
> > task would be greatly appreciated.
>
> Your question is about libusb, right?  So you'll get better answers if
> you post it on the libusb mailing list rather than the linux-usb mailing
> list.
Can USB device suspend\resume  be implemented in user space driver
using software other than libusb?
If so, what are those methods or techniques to achieve USB device
suspend\resume , can you please provide clarity on this.
>
> Alan Stern
>
> > It's worth mentioning that our USB device driver also supports
> > Bulk\Coontrol I/O transfers and other functionalities.
> >
> >
> > Thank you in advance for any assistance you can provide. I look
> > forward to your valuable inputs and recommendations.
> >
> >
> > --
> > Thanks,
> > Sekhar
> >



--=20
Thanks,
Sekhar

