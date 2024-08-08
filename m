Return-Path: <linux-usb+bounces-13247-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A5094C57B
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 21:54:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 258C51F2685F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2024 19:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F70156872;
	Thu,  8 Aug 2024 19:54:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="ZKzmz34k"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9A3398E
	for <linux-usb@vger.kernel.org>; Thu,  8 Aug 2024 19:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723146863; cv=none; b=Klm6RUf2Ya55mYhTeZN8ZhbEhThj0JAXfhUlooUUgWYwY8zKlgkGhTzCPxIO9gpKtUVq55zVd9UsRrNOK2ByEV1nn+68DsJVlkfpKJ69wMNqpGWtQiz7wTblCNEWL54/aKjf+drLveTANe6PaGKtFbLejTwUSxfKY2vJ6M0Tjuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723146863; c=relaxed/simple;
	bh=MXXYc353+vpQ23DEMh5Nl6mr8s7XK5xgNjjj+otA7xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUXqsl8kDAX5EA+mZyQ+IDIaGI/qiE/J+7P7iDdazJn098G7LFPFTGeViGYNM4fzOeu96Wn1DiChbrqyNyIfvNY/Weiw2BVZ5r7hcy5LYNOfafzhOMVSCgV+W79SRGKRa84lXDeJjRMN8N0LxH3FQIJOOSuFieHujBbPEKduOC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=ZKzmz34k; arc=none smtp.client-ip=209.85.222.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f195.google.com with SMTP id af79cd13be357-7a1da036d35so85174485a.0
        for <linux-usb@vger.kernel.org>; Thu, 08 Aug 2024 12:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1723146860; x=1723751660; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8Srgo/5oJlgmAheioSXGFdDPEka9I9EEVOHrVIBGJ5I=;
        b=ZKzmz34kRkfdaHOQ0zpeDGnP9uzNH9OniSfFih1dF/4LbUJlrXw6+02qfd0iYn1K/w
         DRgjrzM7bYDW/aJm+d2EEyEpOjTuIojdUdKKcXhYLhuSMilVPAHglhmD/U7XAZbUdBpj
         njYQ2kiWKAEUt8UZUEQOzjABPTZ5UR5cSiutI+aSE4lPGKmsfBwt4RxXnXBAGv3xzhfx
         h9MhCwResLZ8NGLz6OhedvAmWsIt2JOVU9W7tAiPrZEu0fYWp+OVNzTdAJjRiXJHZAoZ
         R6auzGJoSVo+uhVXErwT95uqgpL+omx8KZYmQxrbXTC3pgojItKZndBStXONo9DWISx9
         veVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723146860; x=1723751660;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Srgo/5oJlgmAheioSXGFdDPEka9I9EEVOHrVIBGJ5I=;
        b=jYbHHiXVNBtaCS1dM9RJ+QcBWzCvZQ1/TyqwWeIIvyZn0jpClWLyEU+puq90prgqKa
         ibf76XZNToXSjlWPB2v+dNI3FA4XiiK6TxqNRU61slA6EnmUjTnPd7KZF+oomc5rQdoG
         NtIiprDCZ1B+/4zpKDalAFTbddxQvw1g/G/wYJQ+aOL+EZoN3xvXTgaRtt0voE7sexCO
         iAH4637mXT1gIj2cOGAEOdhfbhcLPQb1P85o3m+Memgt0LFerxyN0K9m5532+7oyEWem
         1xt0Eu973R82F6MIKPjp1ewBpu95FdgXIfWk/sUYipF/2vTOTpIXGYpfi5UNmAPgbVEo
         bhjQ==
X-Gm-Message-State: AOJu0YxCUl/OAgTlATb4MrRhYuaMKPttP7vXPZBfsk9HmisUfvkTtS9V
	OyEa4mbxdvLWO5IEjk5H5sbW4LjYSyh+s9iLk2neuZRean5J1npExMK2RWIvww==
X-Google-Smtp-Source: AGHT+IHOcV02G5iRMzTxYyGH47R2OjIYYr1EGfN+sLA4EkZlYZKGN6uybU/EYN+ecQXq7sck953S6w==
X-Received: by 2002:a05:620a:1725:b0:79d:7442:feb2 with SMTP id af79cd13be357-7a38187bc33mr401323485a.55.1723146860191;
        Thu, 08 Aug 2024 12:54:20 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3786d1c9asm189163685a.109.2024.08.08.12.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 12:54:19 -0700 (PDT)
Date: Thu, 8 Aug 2024 15:54:18 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Forcing re-enumeration of a chosen USB device from userspace?
Message-ID: <f46dc174-2f23-4a19-a9f6-5ae6e4e2d304@rowland.harvard.edu>
References: <20240808083921.0400af26@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240808083921.0400af26@foxbook>

On Thu, Aug 08, 2024 at 08:39:21AM +0200, Michał Pecio wrote:
> Hi,
> 
> I have a buggy USB device which works fine if connected before booting
> Linux and also starts to work if I unbind and rebind the XHCI driver.
> 
> On the other hand, hot plugging the device with the driver already
> running usually results in invalid descriptors being returned and
> sometimes even if the descriptors are right, the device still doesn't
> function entirely normally. I suspect a race between initialization of
> its internal state and enumeration by the host, nothing I can fix.
> 
> Rebinding XHCI driver forces new enumeration of the device and reliably
> fixes all issues every time, but it has the obvious downside of also
> resetting everything else on this bus.
> 
> Can I have the same effect selectively, for one chosen device only?

You can reset the device by using the usbreset program, which is part of 
the usbutils package.  Some distributions (such as Ubuntu) include it 
whereas others (such as Fedora) don't.  But if you don't have it, you 
can get the source code from https://github.com/gregkh/usbutils/ and 
build it yourself.

If the reset causes some descriptors to change, the kernel will 
re-enumerate the device.

Alan Stern

