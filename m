Return-Path: <linux-usb+bounces-26841-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A75AB2653C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 14:19:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E625D564323
	for <lists+linux-usb@lfdr.de>; Thu, 14 Aug 2025 12:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BD8F2BEFF0;
	Thu, 14 Aug 2025 12:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpiFaG+f"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E019B2FB97E
	for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 12:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755173801; cv=none; b=Xu7lAD5jn8V8q/L2ypaHqS1fnQhKEcrqeZsNnQd+QInFVIdFS6I8GkWslIF5CPjPQIGIg04zphUtqpdtEKf48pLD9MRwn0l2o4SPLK9MQmdbQBroUzD57xNEJlcbp4yRSdrgxDL7jFwB+ojHow6OxtsDE90PHMDYMF1WMVd7hak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755173801; c=relaxed/simple;
	bh=7a425pygCSozKOupEqMoJgBZGQ0afIh0W+qnVuB+cBo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YUPTVThdKr1MuPmDk69EMi7IoICTWd0etYw3+ZJP7Y98nfKAyQYgwxoiX5fiALdtHpM8tiPqFJ2fYcCViD8jBxDAKYj0Z1aJ0jXVJqBvxKcu06v6OPe8RpiagISnIEpGziMbV5ixXZARNPXSxumVuQTpWHcrmpPJUfGMXJHW49E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZpiFaG+f; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55ce50946e2so901695e87.0
        for <linux-usb@vger.kernel.org>; Thu, 14 Aug 2025 05:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755173798; x=1755778598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g+lnsJ8FDB42FPpd5UJwwVrc7Ww/wt0rNzuuRPFtnPw=;
        b=ZpiFaG+fH/AKkuzqIW7Gquu1I5jCQ9tMpnlco5vetZ+QX37G2b5jhVEfDLjQgOGekA
         QKhEGNboDO3UQADUDaC7rR6cJ1dQfR7Y0hC55uchlAdhtuvytzaX9o69Ok3SnFStcyG1
         bLFwaJk7Ca+N5GVVNtkXsFoNI4ua9FcR3uWjpNoS2ng7v6ltQUNxyTLRUzuoX62icf/y
         oikhrcw6mJ4pzZuR7g+DETCWw10BmSWMgJ9BBUoD1UNOp1fxfw9tJ77OPGQqRME8sNp7
         nGy/2GOB7qXf4LnzhK5BUcqzM0ZoGN8hOCcHIMJOku7s0SnUHs9I8jATCknfcDpYkq3h
         pESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755173798; x=1755778598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+lnsJ8FDB42FPpd5UJwwVrc7Ww/wt0rNzuuRPFtnPw=;
        b=fv2dbb+y9xwxf6zyOMI7cCaXqNgVhvUFOU6FXHrwXQ6nl1plgXTn4SFwHnH+nnebUW
         TY/mvxoGKqxHRhoSGL2Xsbdpg3cUtvfzO++POcMPa8Nff5J0eHz93NsxyFq6B83fyaHp
         kjxkt9PpvezuH0PCsIzXGftkno7uucva9dPDfR3dQdUuP0o0+tdVgUzSs9Sy12UTXBn9
         sli+Z4xUPbfIne/2CWO+NyhvxiCUpm/LHM6Gqa09T/ADy++YTKJMMCqX+cfFk2RQwMOy
         r1wikUWp5E2oj9t6URAueCde/2kQr8c+6lMBFm1lV2HlmAIAUqXdZ2/sPFFcgtv09LNB
         bCDA==
X-Gm-Message-State: AOJu0Yz4hUknPn1w471m2T4sjTCHvUQk2KRYfg2iaUVRo12QoD2ZWP1P
	Ymt1w/eGA6m4MS9b1h20b+G7mA3ipdU3XMYozxPvXUUnoQ2RYGNe3N1r5AUcaA==
X-Gm-Gg: ASbGncsOE+apVIn1IYgsAPuhuTcXMDcWUKBqky5TejgvIR//8Ukcm4PwmGFIYt6A56j
	X5EcJHOaPC4WnWb5ZVMF29M43A7fHadZRrUzW20fGm+uWzm4rW4EB+FrxM0pSVOe9DSQQAImhZL
	VOsic7Hcqp0zuMVMblFry9TLtKQ1lkShCRQc/8YIRdXtz+gr8TjoVKsKrqc+chZRMC8nDIhIqsJ
	SttmgWHvMQRQGhwaTP5aubEW6CYIUaSjH7s3+hMAs99GTINcycio+/Sp4ArR8cd98b9LH0V3w6x
	3OnBuuAVOH4cGppOPXn119bj1VwspvmiWHQdbY7nOYwJL88oB+YkCxB4ZeZWG2tXu8yXXtp+oR9
	uLCWiTGD2O+lhU+AomSI38a2Carq8lmMiOqM=
X-Google-Smtp-Source: AGHT+IGyEy3VFgsFZUEDE+CcJ2cwgYsUopNyfnCXXfvfvjKb7nzyCfuj0GFmPzhSJU00qlyeWrQvDA==
X-Received: by 2002:a05:6512:220f:b0:55b:8827:b7b9 with SMTP id 2adb3069b0e04-55ce50a3457mr975393e87.53.1755173797569;
        Thu, 14 Aug 2025 05:16:37 -0700 (PDT)
Received: from foxbook (bfd208.neoplus.adsl.tpnet.pl. [83.28.41.208])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca678dsm5584196e87.122.2025.08.14.05.16.36
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Thu, 14 Aug 2025 05:16:37 -0700 (PDT)
Date: Thu, 14 Aug 2025 14:16:32 +0200
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: Martin Maurer <martin.maurer@mmeacs.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: Problem hanging Bulk IN, with USB 3.x, perhaps due to
 wMaxPacketSize = 1024 and wMaxBurst = 6 (OUT) and 2 (IN), tested and
 reproduceable with i.MX8MP and Raspberry Pi Compute Module 5 (CM5)
Message-ID: <20250814141632.43ded731@foxbook>
In-Reply-To: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
References: <64e36d3b-606f-4fa7-bb6a-1dfd8a144de6@mmeacs.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 8 Aug 2025 23:47:07 +0200, Martin Maurer wrote:
> What can I do/test next?
> 
> Try again on a AMD x64 controller? Perhaps with main/latest of Linux Kernel?

You are describing some fairly complex setups, can you confidently
say that the problem is USB and not elsewhere? For example, you have
tcpdump running on the USB host machine and packets go out through
the USB network interface but nothing comes back?

What driver are you using with this USB device? Any errors/diagnostics
from the driver, or from xhci_hcd (I guess that's your host)?

You tried usbmon and what happened? Is the driver submitting IN URBs?
Are they coming back empty? With error status? Not completing at all?

Trying on a PC with newer kernel makes sense, debugging may be easier
that way and lower risk of:
- chasing bugs in downstream kernels that nobody here can help with
- fixing something that has already been figured out and fixed

Regards,
Michal

