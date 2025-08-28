Return-Path: <linux-usb+bounces-27353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11335B3A436
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 17:22:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C527E9875F1
	for <lists+linux-usb@lfdr.de>; Thu, 28 Aug 2025 15:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1130223DD9;
	Thu, 28 Aug 2025 15:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Rh22dUF4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C276B221DAE
	for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 15:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756394541; cv=none; b=VJezYP3mDGcTj8vyRLZbvoLcXJ244rzAC2Rj5qKt0eAezdBAVMafYreUIyl8IB9B8oUOSh55IA/z/Bxq3PniDtYIbDd97bXiQo18cL82zPlDC2Wd7qaHmb3VP6Pg6Fk3u0RdVsxjbJdRHokDAK0XRNBApH5Jxd77bsvZD0F9J+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756394541; c=relaxed/simple;
	bh=mWEZjheCyPYSrAAC9bfKdgGtdmuN24mP9fShTMz1+ZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsWr4Hb1q71e+QlXDsgTNg1TQ8enhNrMNRnsudWxU3xlU/USV1IXcddMqJFIB8OE9qZx6cFuF6h94wGNyTaoc6QgblopJGOci/lc5jkdOQHGw/iCHXrRo7mlrp9hcZ0x75CCAexLSEhgJ9maQutPTjsad3P6dyMkDTYjuf8jS8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Rh22dUF4; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b109c6b9fcso11181601cf.3
        for <linux-usb@vger.kernel.org>; Thu, 28 Aug 2025 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756394538; x=1756999338; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kGaRraewR26JNUez8yhzhUYjYxfgCbBLO8zfUWdJn5w=;
        b=Rh22dUF4jAYV9UOMYgbrJP2dm3dVgpAsmT6U/6IMqRAgDuCu7neVGTCC7jZIJ7IeXp
         Np2LYVJ71bOR2uRtVIVXG66tnCy28fWhzSA6EXXStnfnhZohI4iyW8TzVEkQeY/lQoUj
         FkYIBzpD6jxwP9anZVtSpP1NkJKq2DA6Z4U6wzFiffJJS9mpudjY7SNeeQ44cvaj9y/L
         x51SAFydJ4dFgc3EnXtXof1+3jMGk1gT1daD5UosvP4b7kp6x1Nx8M0XtAADOUF2vR2/
         jQ9O/kWeS6Hh4NawAsr9OZZkN5gaDETR4lsjRZ9ZfBarKRp9M3U5aj3vae/TghEvRQoC
         7LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756394538; x=1756999338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGaRraewR26JNUez8yhzhUYjYxfgCbBLO8zfUWdJn5w=;
        b=Gicl6MZYzDoNG3qyWzOVs0KuxkDZcmtwPFYVgn/Bpuh+OQy03Lga97xf+KnRSL+sID
         GsPxny0FYOfCHlgKf7eJNniy14L/DSmVj+slY25o2tQFhYeignp1d64gJZmmgiD9QHjD
         3mGCfNlMtjQXpA0FQomDGVaMZgLP9LEA5eFv9cjHCDUh1Lz/alCiP13jZASbARLOc7Xm
         b4bpI/cjHAW+lRtiKdOrNkYRB/xsxv55d5Ykagh2Fh9xr2AHhe81PqYyRg7PSVtn4YSY
         LMLYJZaApoWClT4GhSZJ+GHwzHugtjndkLg8g/mTXbOSrpkYz6Hs+O/PyyBrATS2Ce8r
         f1mA==
X-Gm-Message-State: AOJu0Yyubpx8yd8XCUvWwf2+WTlzQ+wrKFsk5EU5acbIzYQe5Fnq+mBg
	lYQHt1OWk/J1dLE1yfrybsAJCBCHUWm3/SPxli/X/otAuE/HS7gJmypCJHSV1jCvhQ==
X-Gm-Gg: ASbGnctx/DLEGxiDNoqo8LL3V7BrryOKsJTQg38HaoLTKmXQ1+SGUjis51JRhsipXQ/
	tNHUl5DdxKmD1VD9VyxHjYEwHmgWOhg1pKmcZ5nitpyrHXlSl0Ed+UvJxRYSebC4Ar0X/OmQMtW
	iVwexvVev1ixMFSmeDGyNTW6BgkX3y+2OWiMi4sbxNke3cD/vbOLNydFIUabz/qxjuEd4X3HjSb
	1p/xYV+7clJATqoZpjxhPydy7VbTQseeSYGODvpp4/1nti56JGTmeprwKvx4UuvO629L42AQxDd
	7xZmgdbjn8rEcalrPNuLGn6OQJ1nc/Uk1/OpFLPxMPpqQ9J+k7GiTq7luQS6ZBAsZrM+fcWP1BX
	BkHKKPmQbP5J75W2LurM25T3XpFIfCiKnEArGT22Ilvo29SUQOw==
X-Google-Smtp-Source: AGHT+IFFwqDGcukW2vA3z1nhHsolV6i/PbyrnCl3LItJ2zz39TlWC5jUfgW6dQQyM2txpZaQtI5xkg==
X-Received: by 2002:ac8:7e82:0:b0:4b3:634:1152 with SMTP id d75a77b69052e-4b3063418c1mr19222131cf.48.1756394538468;
        Thu, 28 Aug 2025 08:22:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::a58])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2fc0e3520sm22967301cf.14.2025.08.28.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 08:22:17 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:22:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nicholas Chin <nic.c3.14@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: URB data not available through binary usbmon interface when
 URB_DMA_SG_COMBINED set
Message-ID: <3f4608a7-f9fd-41ef-8289-89548678d192@rowland.harvard.edu>
References: <87e75621-f12e-49cb-ad8d-581e4151216d@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87e75621-f12e-49cb-ad8d-581e4151216d@gmail.com>

On Wed, Aug 27, 2025 at 11:05:17PM -0600, Nicholas Chin wrote:
> Hello,
> 
> Recently I've been working on reverse engineering the USB protocol of
> the Digilent Analog Discovery 2, which uses an FT232H in FIFO mode. I
> noticed that tools such as Wireshark and usbdump, which rely on the
> binary usbmon interface, were showing many URBs with no data, even
> though I would expect a payload to be present. Looking at the fields in
> the URB, it seems that the len_urb field of struct mon_bin_hdr was a
> non-zero value, but the len_cap field was set to zero.
> 
> With the legacy text interface, I am able to see data in the same URBs
> that the binary interface was not showing.
> 
> I did some digging and logging of drivers/usb/mon/mon_bin.c and found
> that the len_cap field was being zeroed in mon_bin_event() due to a
> positive return value of the mon_bin_get_data() call.
> Looking into that function, it seems that it returns without copying any
> data if urb->num_sgs is non zero and the URB_DMA_SG_COMBINED flag is set
> in the urb->transfer flags. The comment around that code indicates that
> "If IOMMU coalescing occured, we cannot trust sg_page" which I assume is
> supposed to be the reason for this behavior.
> 
> The analogous function in the text interface, mon_text_get_data(), does
> not check URB_DMA_SG_COMBINED, and instead just reads the first 32 bytes
> of the first sg buffer.
> 
> Could someone please explain why/if this behavior is required if
> URB_DMA_SG_COMBINED flag is set? Is there a way that usbmon could return
> data in this situation?

In fact it may be possible.  Instructions for accessing DMA-mapped SG 
buffers can be found in Documentation/core-api/dma-api.rst, in the 
section on dma_map_sg() (which is called by usb_hcd_map_urb_for_dma() in 
drivers/usb/core/hcd.c).

You're welcome to submit a patch that gives usbmon's binary interface 
the ability to read these buffers.  It looks like that whole section 
of code could stand to be updated anyway.

Alan Stern

> I would assume that if the full data is able to make its way to
> userspace then it should be possible for usbmon to also access that data.
> 
> Regards,
> 
> Nicholas

