Return-Path: <linux-usb+bounces-26876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E023B26CAF
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 18:41:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5947AA20F47
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 16:40:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4C152D6417;
	Thu, 14 Aug 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ildeziRH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943BE1F03D5
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755189616; cv=none; b=FiCtukcSGmlEr6Bxl0XlqkxsBX2wRfDnDgDMWCCRRDu8Z2y3Y1BwMcNmFhkZVlCmgjRklS7IgPRpm8frRuIh3ZFAHdP0QiyAXvnUtyf1bNsjuYj/F7Ej95ABFpxmyS2tJywkds+OYu27GbXz3Yj8QHKv5/uOh8zqc3MoeAjNqjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755189616; c=relaxed/simple;
	bh=QduH4c5brwI/4+hqEhrAxeTpFSeLWUjt1M/2SDi++Ds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GfcGBhp+/nPA1Pe3rif4aYOLainuHu0xFLWE86szCdBOeHQNXOZ7eUtPSfQe2iInTA8eGSeEQe3ONdxQzI419+IX8a3dwVHXwkACtQSSRPKTuZzjD1+BPvxg6rq4gRVdW1rMQxisFGJK3Pw7Ra9gzGz+qHRQQ+E0LsPb2FRI2fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ildeziRH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-70a88ddb1a2so11286846d6.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 09:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755189613; x=1755794413; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=29njbwTGryaI4zzkUPtzktjdLisztvLZu5yB3ibhhRQ=;
        b=ildeziRHUGhmY8tPbqX8zQI9srdn5tGfK9/aboh3lX9JDZIWH1Sv3wBbtrZRdHqMrh
         cXFc9mNgGKpz2CwS3R6xeht3q2bD8hJmR7eBOsICgXEtkVpeop0nz2SbXiHSgPAPk7I0
         OKO3V+pGurysWW7Y+L2jwsebjAhSTNN3nGgCbYrj4w/PHwkPygsN1pSMkt5RtbOvQlq2
         4TEw0TMfGkSFuDtfmJhy+5WzlchEcdYP2amQdtLf/T7Skgj8Rn2LenBmIpGTtVCuc6Pl
         p7HL1nR6V5xiozzMd/V09/k6h4fcgepxWT6hXCjt55KnDlzb40wjzLdbzl7CNGHF72dh
         0VIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755189613; x=1755794413;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29njbwTGryaI4zzkUPtzktjdLisztvLZu5yB3ibhhRQ=;
        b=s8qNVAsV/EGMpq9ByRWVgFn8W6ZbXMrSrWcfcXa056gHSnt2zm8LaGPOWSO8oPwjvQ
         OURu/eszIu7EC0Fd2IE/qIyW46Ien5TbUUQaGr9+YG4Y7tlErlgqJh2Cp2cyDL/Kusie
         BYJF5DxAWLvHV+GLcHOC09FNGYWIKcvyy9CTDyRIJ6syRstEDMjEUYdAb9SYeUtpZNX6
         7atEW/qzhz9oi+VfcwNnvURuKbeAqsZsG51sie7QS9mcRrWtOFb0ZLjuxaJMQE0LapSI
         aEdYakw7dYGCyjXBcyo/nfsnh0U/3ZpGePmFtP4TvEfYphSOeYqSlpmicF5udb6UW24T
         Skvg==
X-Gm-Message-State: AOJu0YzVtE7LA7qZw5p9XP5KKhWGDa8AvB4wfIELVx+hYmC+pyEaDyBF
	kP4HIF3/KHmXjX06jYoTJtYzFCSzd79gLnf7xE9uSIkIOa9knJkL87lRU3rUg9ATAAsuJNOrD0u
	zLqQ=
X-Gm-Gg: ASbGnctJMT1rjHzoYdIewulbBGTvqE+r8pWG80aVxBp23ckgeCtWFVOeEbhL1Zi18fm
	05Ivkb5v6nRHOmnyc8F2jzXqgTvbaqP195pAaXBlIl9oqk67o/9NZmU2ILpNHvwiO6QZ6/vA5So
	4uVICfHQhc0UpFd3zgYf5l18BtPe4mns+rgOwxFwHLjJeclYGOTxgQ2wYDX9MgSPhRW0k8lSYfB
	EE0uIFeU295xUNvEETv6lNOoleFohqI7g3MSzeFDextKlgcx1qnorg1As2oB/TdZLe+N6PvVlf8
	dla5x+kL1ZgQauRBBmiwdNHECI15c76sXhxSjAYNgy539IqAXOnb+EkXSVlmPDIJjCKb6hSIufj
	tzp52XyVT0Veof4saVHBWfmSlCVaBj85jJur75g==
X-Google-Smtp-Source: AGHT+IE/RjnW1Dy82VnS7rDOnaTND9WztvR5OcwX6ofLXTQa7QK4cyRONgMtyfBeY8L1bEasynqHFw==
X-Received: by 2002:a05:6214:d0e:b0:70a:47b2:f92 with SMTP id 6a1803df08f44-70b98247a86mr36207206d6.11.1755189613248;
        Thu, 14 Aug 2025 09:40:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70af5b0acf9sm15145706d6.38.2025.08.14.09.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:40:12 -0700 (PDT)
Date: Thu, 14 Aug 2025 12:40:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
 <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>

On Thu, Aug 14, 2025 at 06:11:59PM +0300, ValdikSS wrote:
> On 14.08.2025 5:24 PM, Alan Stern wrote:
> > On Thu, Aug 14, 2025 at 04:56:40AM +0300, ValdikSS wrote:
> > > I have an old USB 1.1 Full Speed printer (Canon LBP1120) which can't print
> > > large documents due to insufficient USB 1.1 transfer speed/high latency on
> > > Linux.
> > > I believe this may be Linux OHCI bug or deficiency.
> > > 
> > > If I connect the printer to USB 2.0 port (uses "companion" OHCI controller),
> > > the printing engine reports data underflow using its proprietary command
> > > protocol, and the full-page picture fails to print (only 1/3 is printed).
> > 
> > Why on earth would a printer protocol have speed/latency requirements?
> > That's just bad design.  It's not like printers are under any severe
> > time constraints -- they won't blow up if they have to wait an extra ten
> > seconds for the computer to send the contents of a page.
> 
> That's a very old printer from the lower-end segment, which have so little
> RAM that it requires page (not job) streaming from the PC.
> AFAIK it has 512 KB of RAM, and the whole-page picture compressed to the
> printer language (CAPTv1) is around 1.5 MB.
> 
> The printer doesn't use regular usb EP stall feature to tell the host that
> it shouldn't send any more data. Instead, it uses bi-directional protocol
> where the host polls the printer status every time during the printing
> process, and checks whether printer says it can accept the data.
> 
> So it's constant:
> 1. Hey printer, tell me your BasicStatus
> 2. Here it is, 6 bytes of data
> 3. Hey printer, tell me your ExtendedStatus
> 4. Here it is, first BasicStatus again, then ExtendedStatus 16 bytes in the
> next USB transfer
> 5. So you're ready to accept the data? Here you are, your <=6144 raster.
> 6. Hey printer, tell me your BasicStatus...
> 
> You can imagine how inefficient is that for USB 1.1.

Yes, but I can't imagine why delays would cause a NOTREADY, OFFLINE, or 
UNDERFLOW error.

> And a single USB transfer raster data is limited to 6144 bytes in the
> "driver" (CUPS filter) for some reason. This doesn't seem to be a printer
> hardware limitation: I've patched this limit to 16128 and it seems to work
> as a workaround for this issue (more data in a single USB transfer).
> 
> This is an official proprietary x86 Canon driver. I'm running it on ARM via
> both qemu and box86 (and the interpretation performance is not an issue
> here, I checked that. It works fine on much lower-end SBC which has MUSB
> stack with EHCI only).
> 
> 
> > The timing information in the usbmon traces will contain helpful clues
> > about what's going on, especially if the OHCI trace is compared to the
> > EHCI trace.  (Incidentally, you shouldn't use usbmon0; you should the
> > bus number that the printer is attached to.)
> 
> The "success" response on OUT raster data takes about 2-2.5x longer with
> OHCI than via the hub. And I can't say it's too slow either, everything
> seems to be more or less fine regarding the timings, but the printer doesn't
> like it, reporting NOT_READY | OFFLINE in BasicStatus and UNDERFLOW in
> Engine ExtendedStatus.
> 
> I'm not very versed in USB though.
> I can upload .pcaps if that's useful.
> 
> 
> > 
> > > Here's a speed comparison using simple Python script with asks the printer
> > > status 10000 times.
> > > 
> > > Direct connection, OHCI:
> > > 
> > > # python3 speedtest.py
> > > Opening printer at /dev/usb/lp0...
> > > Testing 10000/10000...
> > > Avg delta: 1.916 ms
> > > Min: 1.443 ms
> > > Max: 2.891 ms
> > > 
> > > Connection via the USB 2.0 hub, EHCI:
> > > 
> > > # python3 speedtest.py
> > > Opening printer at /dev/usb/lp0...
> > > Testing 10000/10000...
> > > Avg delta: 0.696 ms
> > > Min: 0.590 ms
> > > Max: 1.072 ms
> > 
> > Without knowing what these numbers refer to, it's hard to say anything
> > useful.  About all I can glean is that EHCI is faster than OHCI, which
> > we already know.
> 
> The speedtest.py requests BasicStatus and reads the response in a loop.

Either .pcap files or the usbmon text output for both of these tests 
would be good.  But set the number of iterations to something very 
small, like 10 or so.  No point posting a log containing thousands of 
repetitions of the same information...

Alan Stern

