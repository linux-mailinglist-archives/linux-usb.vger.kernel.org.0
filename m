Return-Path: <linux-usb+bounces-31032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D55D8C90C0F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 04:24:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BFC293462BF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Nov 2025 03:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF63A2D0636;
	Fri, 28 Nov 2025 03:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="X8j52Xsu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D971FC8
	for <linux-usb@vger.kernel.org>; Fri, 28 Nov 2025 03:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764300231; cv=none; b=raSTkwLImKGKI4S7Tl0lr/TTPUXuTzHVDX9bk6suxZHqndAB/14AxH/0K1jRbkeu9BolGXg5l06j88dgNaTgiTzt4TUoZ67DK7DEp/jHvM4i5BJzQAUqFJwNBzFUMdwZyGgMonhbQRF5Lgcx0VOhL3OSk5oeLQSTAHd8FvWRrZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764300231; c=relaxed/simple;
	bh=w5ZR3UsYwMbGzDKFaCMn2YiBNTK63GRPDJCimed4HVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBkpnNTb0YuK58+E8N1m4WLsVfQOPjZd990zB/8ylX9bkIG7yR30IwWUHDs8ZOttAzVyRfbv0QavJWIo094sLnUS0T+HImZ6gjsq8JYc99DmYOZf0JJD7qjF015b/xA1hrnOk1uJ03b+FuyU9E71V9Tz+o4iOznHSWtDGG33pNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=X8j52Xsu; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b2e530a748so118377085a.0
        for <linux-usb@vger.kernel.org>; Thu, 27 Nov 2025 19:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1764300224; x=1764905024; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3o0vp7j8f6/XWFiA72WlCfG+8f+CvaBi2uuiD/OyE10=;
        b=X8j52XsudRzLKL6t5N41wMU6c9xTBvrJqwDCZQinXGzSdDTXdMbXk6kh6Jpv6XqbkJ
         0+e0+zT6XxW2c+yyvNEfiuMByqfJ4S7o0gt+NtzqkAQMkABkn5WTArWw19a4M3XcseX/
         LVIaQ4DZdiCcmlHwGrYGXCc/JJXsqI2d02+q0ciNtwhAp+zcH76fSIhJ1m7aMQ8ATp5z
         OvQkr8O/ulIRgFG2LFwdK5Fys9k85Fg5C4kHg+mmM7bPUZ0NWq2aeQgGW6sowiB9CMPC
         KDI4uRc0+puDCGfv/1XlV5qA2SUu4w3xRzpRyIpaw3HCA3UKK00SpSTYXjX0ck50N8V3
         qjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764300224; x=1764905024;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3o0vp7j8f6/XWFiA72WlCfG+8f+CvaBi2uuiD/OyE10=;
        b=ZRSbBW+rMzkagJeMaZzGQxvcRlEK82rbuoNGH7pgTmTBAWV2g5fDKFFnKh1jeC6aL8
         8TP5Q6e3P7tU4FJ2hG6cKStqNKP6zUIQWF8j4YbSP7akap5zYfjooclb5HfEUbB9/abA
         TZTrPwCfaA7A6MA2bsAZwRCEuIusXLUXbLUUD1F48MKcjWsLDQ6pb6AWPdtK8Gxa3hvu
         g9TRhj8cxqFDCvtTN5nJ/hBMJY/itAgSon50pLB7UTXbhl4f9+yLB9j2Jn11PR9LEVhL
         Go8kewDfI/mbWDWLZrzrAvPOPyKA6XAjuCy9CcS6wY0x6SV2gFGs6xrfdOLEpVCsWOjs
         +gwQ==
X-Gm-Message-State: AOJu0YywEIBHinVo6VJdFN0yHLy8uWuc1isAo5uI+azai4nkj8br8rdN
	90lWJLulAWP0ivTtBer8TAwXeUjcWA9OQK6IZuDEpImxc9gXb/OX6St39Qr3oF4K7nLS/yYFuaT
	qfPR0GQ==
X-Gm-Gg: ASbGnctDMPWTiYUeJpYbTezBIyq9cZCREfPA1RivfgaYokc0jftbAgW6Xth+0RuEmPN
	MuqTLJZIhCcnNYqKfJ0Zn+yYJni3W9OM7PeGSH+1QoC1Ak5pWLGgqU7gAVizpbOdeWuuztOw+V8
	gO6/fAoYIFvlpbK7fRUCxJzskkcG5LaOAIaddtSWELxmBYekPIf36SKxriW0PgjqC2slA+9gxv7
	Oa3Uyc2UhqeZVGp9halYXFJyWUqXYFFpEspHd48AmSt2cEMIpGDhu6YhMbv9+mizQVxAiSqC6NN
	k7ROn0lOLuQj+MUjhmejK3MnCRQ+BNGIeuzgw797HgjvWA4lSnd5g6lOdmjHaweMaEvXcL64OxL
	V+MagwQoh5LKZwcet/Pehwsbvi68yTM7ENY/LmiCaS3c/RW4rVsviIHZDD7U5vazFjcKI6R9Xwm
	2VMo9hqM5po2pP
X-Google-Smtp-Source: AGHT+IFHsc+kQXDJzh1sbKtki9pFz4HdRyWl3Hb4NWQpNuXTIvYBalAMzGZ9ex712rQzT+m48iTX2Q==
X-Received: by 2002:a05:620a:4102:b0:8b1:59d9:f1f2 with SMTP id af79cd13be357-8b33d1f00c0mr3380137585a.24.1764300224234;
        Thu, 27 Nov 2025 19:23:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::a122])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b5299a6fdcsm226161385a.20.2025.11.27.19.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 19:23:43 -0800 (PST)
Date: Thu, 27 Nov 2025 22:23:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Angelo Dureghello <angelo@kernel-space.org>
Cc: linux-usb@vger.kernel.org
Subject: Re: testusb: epipe errors on test 9 and 10
Message-ID: <c17c0821-3dd8-47b3-b795-f42675fb0a75@rowland.harvard.edu>
References: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbb3bbc1-e8c1-450b-a38f-7b3f4cda6006@kernel-space.org>

On Thu, Nov 27, 2025 at 09:06:24AM +0100, Angelo Dureghello wrote:
> Hi all,
> 
> looking for some help on testusb tool tests 9,10 always failing with
> -EPIPE, kind of ep stall. Peripheral side has g_zero loaded.
> 
> Devices under test are custom boards, have same qualcomm 8 cores cpu, and
> kernel is android 5.4. Involved drivers in both devices are xhci and dwc3.
> Anyway, connection under tests is 2.0 microusb connector on both side.

It seems quite likely that the problem is on the gadget side.  That's 
what you need to debug.

> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)
> /dev/bus/usb/001/007 test 10 --> 32 (Broken pipe)

Did you look for error messages in the host's kernel log?

> usbmon shows for both cases some EPIPE:
> 
> ffffff85bf04b100 1951528285 S Ci:1:007:0 s 80 00 0000 0000 0002 2 <
> ffffff85bf04b100 1951528785 C Ci:1:007:0 0 2 = 0100
> ffffff85bf04b100 1951529102 S Ci:1:007:0 s 81 00 0000 0000 0002 2 <
> ffffff85bf04b100 1951529554 C Ci:1:007:0 -32 0   <== EPIPE
> /dev/bus/usb/001/007 test 9 --> 5 (I/O error)

I think this is the expected behavior; g_zero does not support 
Get-Interface-Status.

> ffffff85bb5b2100 3778244155 C Ci:1:007:0 0 18 = 12010002 ff000040 2505a0a4
> 04050102 0302
> ffffff85bb5b2100 3778244178 S Ci:1:007:0 s 80 06 0100 0000 0012 18 <
> ffffff85bb5b0100 3778245631 C Ci:1:007:0 0 9 = 09024500 010304c0 00
> ffffff85bb5b0100 3778245693 S Ci:1:007:0 s 80 06 0200 0000 0009 9 <
> ffffff85bb5b1500 3778247900 C Ci:1:007:0 0 1 = 00
> ffffff85bb5b1500 3778247964 S Ci:1:007:0 s 81 0a 0000 0000 0001 1 <
> ffffff85bb5b4100 3778249094 C Ci:1:007:0 -32 0    EPIPE
> ffffff85bb5b7100 3778249432 C Ci:1:007:0 -104 0   ECONNRESET

I don't know what's going on here.  The usbmon data doesn't match the 
source code in the current kernel version.  It might have helped if you 
had sent more of the usbmon trace, enough to include the request that 
caused the -EPIPE error.  (That is, the most recent preceding line 
starting with "ffffff85bb5b4100", which should contain "S Ci:1:007:0".)

The -ECONNRESET errors are a normal response to the -EPIPE error.

Alan Stern

