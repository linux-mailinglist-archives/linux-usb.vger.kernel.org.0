Return-Path: <linux-usb+bounces-26863-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1DEB26919
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 16:24:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 65EBC7BB282
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 14:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906FA15B0EC;
	Thu, 14 Aug 2025 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rGiToL8W"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1EFA920
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 14:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755181457; cv=none; b=gfXUyG92fo4c/05po/ooio4Hbr3pBJTQwFTsvOoDjXdFO4Ncw89BMswRj401mqYZdWJYQDk/pmepv3pWDZHaqNEH9woO+cg2NV2S6WfmAUMzC3NLofnpvYJaLrhnR8sHvpABfv/BsA7ASUqJSluwd6o3qNXs9W/pGhzZGwiwTEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755181457; c=relaxed/simple;
	bh=ED8HdQ2dKZ6dWpGgiJizvx/uxBKXYvMl/ALaAVHEf7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gh8gv4KkUPQUU0RbfY22dSTqN1gKy3lYQEH61cwwANGAu/Az+BHW4s9oSYaAjqe4pdGj7udUKmnANoYeGu6FDv11ykqPaYjE2vmlsFWpfy9LnTQ8O3PKBQSVs2uhPHSF+Mc+3BiaHRoTwX0MUBAQZhtxiReiBOn+0z8+C6nsFSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rGiToL8W; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-70a88db0bd8so9873776d6.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 07:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755181454; x=1755786254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ib+qp+Mi3ysJIDOqoFT+JWDNK7VlEveNHR/CSlL1Qkw=;
        b=rGiToL8WEkagdFxGjz1iIFiiJu2zX0JrmslL/lzn5IV84NZ+SfOC1aCVqe3LaPwrD0
         2lTHzCBeHmSIQYPrzTXinV5CCjk7LYHlWQv0Ux50bdGo5ag6sLAYM9L1neKlnCfFrfIh
         oUOHepXVnhOvmB/qaI+lmjAuRpMPPyB5QHbBxlxsS7X1hYHaJSqE0U7U6KJuNi3W1gim
         5cMYYpMFp2hL/o8sI96w0S8654XX8aNkCIpt2UspSpa1M35qipRK60eBolHM/tPp3j5a
         VIRJMIBZG0EqKpANJeTHDnLVgfURNF5nd2Ff9z2pHtLayN4SN25ovWqkbZiOiFyPI83R
         Z+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755181454; x=1755786254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ib+qp+Mi3ysJIDOqoFT+JWDNK7VlEveNHR/CSlL1Qkw=;
        b=CsCOP0r6KTKGt8QyymnmN4nCFyAqIFlEjMl/kFOMi9n0XFv/6EXSoH1hns2G4oc1FH
         s9glbcRksakYqsVgyuw1BOxZDsGAQHV8QUdOqThnDnrJPHjxdnlJCR5Fp/i288neoGhn
         Q6oVhn0RhZrGIzkFgryRNKTS2B1ZKIVDw/XU60hmllw2Sa0tRYKLg6nf8kNWCcreH/ws
         JR5WzTwKHVCp9Gwy0m9SYGqC8Ixf/XqYJUHM3yRywI/Udq878EVng/TGsZG+g5KvyalQ
         ldylVJTCwc+mbUzd7MWQ6ZgOyFkuKajuSTydfSqi+9HhT2N+epl6eRodZmHiAStsf7gH
         E6pA==
X-Gm-Message-State: AOJu0YwfJhyx1iqLul+kkhkMxp34UAS8unxNT7djuGBeddzKUWY84yRE
	P94F9ZKFhrKC61D/N8LBN04ax/18XrcpGUML65RLAmFc7aXzeM+Oo5DvKb+UhlUN1wT5u20HG7w
	vSGY=
X-Gm-Gg: ASbGncvYtBbd+xGDBKr9kly9sJ28RptfVM1HOHZCZ97DMxuy2wgdJtomFe5fJEMPobe
	12ILJdwKCJyhDBDtdcsM+8c21oXh9T7LSV6eReObjYvMgNxc0lV8XSSyzZNpONkTzEtKTpmed5t
	mqi/jRAYMuY7pqCUYquELyNJ9926XqFHvM6rel+RzWdZPvpqVKZHiGIK+86tZhPkef5h0JJ74LS
	r8SdIOg5F9Mp7JDAx09elHvwy7v6W5aRHj8JjAckOkoNLiCNPnAwheKcMxD5w9xmS0+vgwh0Kk2
	WiVgdr/9rhKVFJ+t6TEARYa0QstUCeRmPcp5qZSZk2n7GlXr43YJPmsmg6fvtrASLLbE2n8ki6z
	mhiKfP36MsFfA2c/UmqsxAIeTIpg=
X-Google-Smtp-Source: AGHT+IE2sYzCyYCx49aH9/IFSc830v3qN9PmIhWHQkinrq9OrNkTKI1HwUtgKNSsPNdQBkjzw9f2tA==
X-Received: by 2002:a05:6214:c48:b0:704:8f24:f03d with SMTP id 6a1803df08f44-70af5bcc007mr54579006d6.16.1755181453796;
        Thu, 14 Aug 2025 07:24:13 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70ae6cc98e4sm13793656d6.21.2025.08.14.07.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 07:24:13 -0700 (PDT)
Date: Thu, 14 Aug 2025 10:24:10 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
References: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fe845b9-1328-4b40-8b02-61a879bea6df@valdikss.org.ru>

On Thu, Aug 14, 2025 at 04:56:40AM +0300, ValdikSS wrote:
> I have an old USB 1.1 Full Speed printer (Canon LBP1120) which can't print
> large documents due to insufficient USB 1.1 transfer speed/high latency on
> Linux.
> I believe this may be Linux OHCI bug or deficiency.
> 
> If I connect the printer to USB 2.0 port (uses "companion" OHCI controller),
> the printing engine reports data underflow using its proprietary command
> protocol, and the full-page picture fails to print (only 1/3 is printed).

Why on earth would a printer protocol have speed/latency requirements?  
That's just bad design.  It's not like printers are under any severe 
time constraints -- they won't blow up if they have to wait an extra ten 
seconds for the computer to send the contents of a page.

> However if I connect it over USB 2.0 Hub (EHCI, hub does internal Full Speed
> conversion) the printer works fine.
> Same applies to USB 3.0 XHCI ports, via which the printer also works fine.

USB 2 and USB 3 are inherently faster than USB 1.1, even when 
communicating with a full-speed device.

> The issue is seen on Orange Pi Zero3 (Allwinner H618) and Radxa Rock S
> (Rockchip 3308) boards, with different USB controllers.
> 
> There's no USB-level errors (captured with tcpdump -i usbmon0), all URBs are
> success, but they are much slower in OHCI than with EHCI Full Speed via hub.

The timing information in the usbmon traces will contain helpful clues 
about what's going on, especially if the OHCI trace is compared to the 
EHCI trace.  (Incidentally, you shouldn't use usbmon0; you should the 
bus number that the printer is attached to.)

> Here's a speed comparison using simple Python script with asks the printer
> status 10000 times.
> 
> Direct connection, OHCI:
> 
> # python3 speedtest.py
> Opening printer at /dev/usb/lp0...
> Testing 10000/10000...
> Avg delta: 1.916 ms
> Min: 1.443 ms
> Max: 2.891 ms
> 
> Connection via the USB 2.0 hub, EHCI:
> 
> # python3 speedtest.py
> Opening printer at /dev/usb/lp0...
> Testing 10000/10000...
> Avg delta: 0.696 ms
> Min: 0.590 ms
> Max: 1.072 ms

Without knowing what these numbers refer to, it's hard to say anything 
useful.  About all I can glean is that EHCI is faster than OHCI, which 
we already know.

> The printer is from year 2002, with USB 1.1 full speed, and was designed to
> work via USB 1.1 controllers.
> Any ideas what could be wrong?

No.  Have you tried using the printer on a computer with a different 
(non-Linux) operating system?

Alan Stern

