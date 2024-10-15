Return-Path: <linux-usb+bounces-16241-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B04B099F027
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 16:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C181F2246E
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 14:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3A221C4A19;
	Tue, 15 Oct 2024 14:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="vdEXvOI4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E41FC7EC
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 14:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729003924; cv=none; b=SVHyuBuUgRYpR/n+tXY0dw2snRvSB12Ie8+jnL5vyUwb+NmbnWOSddHQkWK0oLKnmegtco8JEJdsO2sL7CSvxSV38wpAEJC7FIhc9sQplWMUeJBKmWqKyViY0w5cWfRYO/ETQytnWTw8rZs7ZA1RqRcjRtH+f8/sStESkjeHKoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729003924; c=relaxed/simple;
	bh=nV6IBRvVB3L6bbjM3kqvUJhYSOkzqzpUisPomN0rTMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SGavdT2rwOMu28y7aJeRml2NtDZKh8UukLyeFAij3mJSEMEYnPfb5ZcejOhWuxOmxN6fAFReT3XdzI1N43nWl/B3QeDKU5HiO5Sc1rT3l5ycNSOdlC43s+6ddhLWrZZDloC3GhQYyCNlpBueMudEwvNhRkD8vWOKwx2Q2m4I/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=vdEXvOI4; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6cbf347dc66so26778996d6.3
        for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 07:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729003921; x=1729608721; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OZRjwaTyxDSgqfNv/Mla0zqDHE6AD4bv+YLsNbvhMSI=;
        b=vdEXvOI4SlpzbbDDxOyz/uDE3wLxwQPw6o0f0eIMZP6W3cET7hWkgdMT37OGpXovhO
         Wpb49AyrYxPaR7+b1eWO8kFhWvlKzSpc3Thf55igMqnyL4dZcFrBTYn1V0vKFVBVsQyX
         bSKMZvDvf34dHZi85F1OYlDtdOdZo6VmMDBGyr4RAV2NdFLXMsu51CmpJ4akvKUWceDt
         BTZswcu7bs+JGNgK8kKLQDr5Aza5tcqhrWwOl+0X5MMvWDZsIv6WYDnXzFf/P69DniBc
         8lgrOpgo2aFK67XyDsYV+i+5fsHKUlHrhCWQL2klveU+IFLIMeuNn/8jMBgQCutF3pUQ
         t8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729003921; x=1729608721;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OZRjwaTyxDSgqfNv/Mla0zqDHE6AD4bv+YLsNbvhMSI=;
        b=ZiGHZBuNlB43otL79sb+KmwCcdZpCvVG+AR9S1pENW2+oWyTap2MK9ZVkN9Ibt/JrG
         1NJeffjt5p2O+mQm/a7WOZdpjOsnAy8Q2qCAVlU8Kp7Cg8EVvugZ6i6OVrq4Jooerb3H
         VqiQbRVkUwblsu/i8OJjJkIrwTnW+DmHedb73l4XsGGPHcT6AiP84RXn4cVAxhYnmET7
         AzeeATSM7Fmjc3T9ox1I4CmdL7jQTiuFmQgeusLDc4v280cWSL1gmz/1nAY/0i1J8Xj5
         DM+c6LTdw4PoWHuWZPxplyfpnTpqldDCzVHpbAqHRDe005qiaTSakFnpRjqgxpnTm+1t
         NofA==
X-Forwarded-Encrypted: i=1; AJvYcCUqEfoCtr+o0/ZRAfl4bxvnEPq0jyJgpOGSFojFdhy3EMI3ewRZHNNMt0J9hIO78tZ0/z8wntmE1Jw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8E0PfqDAvqwmP9kkrSn+IC6Ip/ykP2LvuxwIN6N+6SucsrEq+
	9UWrGMaAncfw7aUr9XLcUgMrg5oLImDQMBPODIir0dFvy9N0VnaTGcnbyw/z1A==
X-Google-Smtp-Source: AGHT+IGLrsivmqsJg9LHQaj6aPNfkxmOGLUMt3qtxb+Ug6XJLRfcpyW+WRj1TcA1fRD8ZJkPhqZoTw==
X-Received: by 2002:a05:6214:5709:b0:6cb:ee73:6926 with SMTP id 6a1803df08f44-6cbf9d2da20mr149169866d6.20.1729003921387;
        Tue, 15 Oct 2024 07:52:01 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22990427sm7288236d6.134.2024.10.15.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 07:52:00 -0700 (PDT)
Date: Tue, 15 Oct 2024 10:51:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Michal Pecio <michal.pecio@gmail.com>,
	Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix the NEC stop bug workaround
Message-ID: <6825b1a2-d611-40c6-a7f1-bc9c3d45d30e@rowland.harvard.edu>
References: <20241014210840.5941d336@foxbook>
 <e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3f8e58d-d132-430f-875f-283d8055b6c0@linux.intel.com>

On Tue, Oct 15, 2024 at 03:23:23PM +0300, Mathias Nyman wrote:
> In addition to fixing this NEC case we could think about avoiding these
> cases, some could be avoided by adding a new ".flush_endpoint()" callback to
> the USB host side API. Usb core itself has a usb_hcd_flush_endpoint() function
> that calls .urb_dequeue() in a loop for each queued URB, causing host to
> issue the stop, move deq and ring doorbell for every URB.
> 
> If usbcore knows all URBs will be cancelled it could let host do it in one go.
> i.e. stop endpoint once.

Indeed, this makes a lot of sense, and I have long thought that the
API should have been designed this way from the beginning.  At least
for non-Control transfers, unlinking a single URB somewhere inside a
sequence of URBs seems pointless.  I doubt that it ever happens in the
kernel.

(On the other hand, it _is_ reasonable to do this for Control
transfers, because they can come from several different sources, not
just from the device's driver.  The source for a Control URB might
want to unlink it while not affecting the URBs from other sources.)

Furthermore, I suspect this is what Windows does and what the USBIF
originally had in mind for URB management.  (It's harder to tell what
they thought about Control transfers, though.)

Alan Stern

