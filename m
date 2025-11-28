Return-Path: <linux-usb+bounces-31039-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28276C92710
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 16:20:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CDFCE3A769F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 15:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA13223A98E;
	Fri, 28 Nov 2025 15:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="JAS2c4AN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A548479CD
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 15:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343232; cv=none; b=GeEF8BhWVTcGwyYNBhCyZaoIrrgjr4vz4lD2M3UZi/UHDv8sx9UWM7mot0CsPPYkcOJq1ji4ohJAHQV0oQ2RtPP9pDgNa/rq7qshkIXbgrwbmKzuxd303HlfjkCpZQP3u/9M2vx/PPRBF5KtRc6pql7oeUf1txhxpmqxdXztem0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343232; c=relaxed/simple;
	bh=Vzbj3gCNBqIS0sBjnC4NakHC9CnFTEG999hRpnpBn8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBukBzU2Qhq+gRuPhUPwciL6ASbah3mEfBZlr8yJvkxDNSnfM8YwmqehmO7Otyh6mTAINiD6gC4bCLe90mBWUHM2m7mTTzQcZbL4V9LQY4heW9gwBWDKS+r0j8S8atX8MKBvrxGuniI8L3IMWHViUaBR4nYIiKxQQ1b+5uOQ9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=JAS2c4AN; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-8738c6fdbe8so21675416d6.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 07:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764343229; x=1764948029; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3MhXELSlGNn5B/eVu5S5Gh+jHE+z9XbKl7VIjuvsg9g=;
        b=JAS2c4AN9jIqVRa1cVoIDOJZKoFR30u4Htnf8HF09ohmIjOU3YPbwkyZVepMfcFi9j
         blxacXxPAQwzwqmcLGZhghvzSzDzidzDzQ93ZJxqKipySdAl2bMKXiR7VqAim3EpzQyo
         ua8pwcFLbn7CVbsCqZ6OC4S5W3n+fiS6N5iWrvMXBBiGUpx4kY8XDTcKeCGoHF1ubhfD
         ZtPdYs2oCKwI4FaDbkc4B8gN5Y5JLg1RtfNQ/iBzizMbbFXhjgthlDnfagcoerFiCaiB
         0sTVwOzHAqRGdWLIqtPGT7N/q8CcWk+uTEGBBrzS52pmW5eYIxrpn6dBE3PqSo4ihIOk
         8IPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764343229; x=1764948029;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3MhXELSlGNn5B/eVu5S5Gh+jHE+z9XbKl7VIjuvsg9g=;
        b=DpYef7W5Hp2ndLd5yYM2gnPzbsbaHoNbaIAM5mUlhlKYZh759r1dCHOAMdhV9g0spi
         z2Xt0QSxeD1f30Ad+N91Wet19ShBBSgHPKNyhpK6MgUGc/+ftxK1MX3uccB5OSUeAKI+
         LPy1l9vtj/WT0L/Ghk4vUstHOyA/Bzd42SmOM9Mr3JFiSjHXFZ768mR2TEMsvJI7yLwC
         tDgAKFoi1D9ZDeSJX3dQjubmLxyEMomhpwQqI8DG1mN4vazv2LD0Bl4mGTEpFwCQg9NT
         uiCAQzOGerBWuZJ2qWhBttrKJJ6XPJ1TjAVXIPsDNyZgZXIYvSdTueS1+JzbWkFoMQQU
         TaHA==
X-Gm-Message-State: AOJu0YzZfYIzGqQKazrAdltk64O3U6PkvOSiuX458pFFjBERBKGyBc+B
	eWj98wlefBtrOc8E++V2iqzwjUHe7RKuK0gQZEFJAf/MRQqHcToj2jppLTyjTAPOVmjQUwnpa3d
	nFrg6lg==
X-Gm-Gg: ASbGncu5cviVyLqRguP7IXxGjmJWLuhBTge3My5NEclMQIqoazUmRazrQm5Cr6/0m4T
	IH1oYRm7LBCTNXAYjQa4NWhGP7lYAQTKxWWCSklCgHpeD8z5raIEB46LwBPA26lN1YK6DA2yu93
	mwgLn/dZt3fwXj4xYbyVsJW1GfHL3RhLZf56UrAmE1NF5hC7LUnoRqA91szf/z3DSQ3UlHFxPop
	Ts8fkXhJ7I0GOYfJz8Ci7+kGREYb+nZyZ7DyXmYms3wdZEltZ0TuYNccX1ebHRVA6lS6vOi818L
	PccIWLQNpKVeStA5pLvH/+vKgBUktn1ywRtyZdsNQhZfwdPSaBJ01WTu4UAdTw7Nd0yvfkfUppT
	Xy6M2Kwce1Ls5wqDM5PU67Bqk1titQx0ygUk2S7hEJyk7vRN1C30G/5V0EeBfFn7hCWHtkpA1Ex
	4u5VCXV571PzwYYuYQiuLDDps=
X-Google-Smtp-Source: AGHT+IFioKfDMfkZBaXfx1UOOjTknefrrfrEGuD9275wk4IK14Espn9YiBthr0w1EoSbiD1O2o56VQ==
X-Received: by 2002:a05:6214:80d6:20b0:882:4580:a86f with SMTP id 6a1803df08f44-88470083a5bmr373115506d6.6.1764343229320;
        Fri, 28 Nov 2025 07:20:29 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::61f4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-886524af5c9sm30834346d6.10.2025.11.28.07.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 07:20:28 -0800 (PST)
Date: Fri, 28 Nov 2025 10:20:25 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <9776c9fb-8fed-4e79-b312-0b1a872911b8@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
 <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
 <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8aa2f1e-fc44-4bb9-8245-d6ac76047dc3@kernel-space.org>

On Fri, Nov 28, 2025 at 03:20:35PM +0100, Angelo Dureghello wrote:
> Hi Alan,
> 
> thanks a lot,
> 
> On 11/28/25 04:23, Alan Stern wrote:
> > On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
> > > Hi all,
> > > 
> > > looking for some help on testusb tool tests 9,10 always failing with
> > > -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
> > > 
> > > Devices under test are custom boards, have same qualcomm 8 cores cpu, and
> > > kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
> > > Anyway, connection under tests is 2.0 microusb connector on both side.
> > It seems quite likely that the problem is on the gadget side.  That's
> > what you need to debug.
> > 
> > > /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> > > /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)
> > Did you look for error messages in the host's kernel log?
> > 
> 1-28 06:14:23.716  3913  3913 I usbtest 1-1.1: 3.0: TEST 9:  ch9 (subset)
> control tests, 1000 times
> 11-28 06:14:23.758  3913  3913 E usbtest 1-1.1: 3.0: get interface status
> --> -5
> 11-28 06:14:23.758  3913  3913 E usbtest 1-1.1: 3.0: ch9 subset failed,
> iterations left 999

Okay, this confirms that the Get-Interface-Status request is the one 
that failed.

> 11-28 06:14:23.781  3913  3913 I usbtest 1-1.1: 3.0: TEST 10: queue 32
> control calls, 1000 times
> 11-28 06:14:23.787     0     0 E         : [    C1] usbtest 1-1.1:3.0:
> subtest 3 error, status -32

And again, subtest 3 of test 10 is Get-Interface-Status.

> 11-28 06:14:23.787     0     0 E         : [    C1] usbtest 1-1.1:3.0:
> control queue 81.00, err -32, 31996 left, subcase 3, len 0/2
> 
> > > usbmon shows for both cases some EPIPE:
> > > 
> > > ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
> > > ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
> > > ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
> > > ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
> > > /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> > I think this is the expected behavior; g_zero does not support
> > Get-Interface-Status.
> ok, good to know. Btw, on this article seems all tests are passing
> 
> https://bootlin.com/blog/test-a-linux-kernel-usb-device-controller-driver-with-testusb/
> 
> but not really clear what what "test must pass" is.

It looks like something may have changed between the time when that 
article was written and now.  I would expect g-zero to support 
Get-Interface-Status, since it is a standard request.

> > > ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 2505a0a4
> > > 04050102 0302
> > > ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> > > ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
> > > ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> > > ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
> > > ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
> > > ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
> > > ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET
> > I don't know what's going on here.  The usbmon data doesn't match the
> > source code in the current kernel version.  It might have helped if you
> > had sent more of the usbmon trace, enough to include the request that
> > caused the -EPIPE error.  (That is, the most recent preceding line
> > starting with "ffffff85bb5b4100", which should contain "S Ci:1:007:0".)
> Below the full log of the transactions of test 10

...
> high speed      /dev/bus/usb/001/007    0
> ffffff85bb5b0500 3778229608 S Co:1:007:0 s 01 0b 0000 0000 0000 0
> ffffff85bb5b0500 3778231291 C Co:1:007:0 0 0
> ffffff85bb5b2100 3778241217 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> ffffff85bb5b0100 3778241294 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> ffffff85bb5b1500 3778241325 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
> ffffff85bb5b4100 3778241355 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <

That's the request which failed.  Comparing it to the first trace above, 
you can see that it is the same request: 81 00 0000 0000 0002.

...
> ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE

And that's where the failure was reported.

Alan Stern

