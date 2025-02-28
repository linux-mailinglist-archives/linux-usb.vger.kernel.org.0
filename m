Return-Path: <linux-usb+bounces-21203-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3EA49D45
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 16:23:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5C4D1898BEF
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B5270EB9;
	Fri, 28 Feb 2025 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OaR8JR4B"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CD026F444
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 15:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740756086; cv=none; b=iA/SYzhEapfdQPyI4GxSH3NrAb/WSOTV1JKjlfM3jr+/3FTcnzI5jWueApnpAY8InZRwTsRy7J9U0qUqGmUzy4/2Z61xo9KGQwOPe6TWkyE7vmFGp2avizty2VouRCfEO0Ke+LQ1SZPeaRr4BI54RC9PcsyafL3X94pC+6trki8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740756086; c=relaxed/simple;
	bh=KECKa7HXMO2S6P3OFCfRxoEsFc6wINxBWgMsRAegBDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRNJ4vitmNIBwgfATPUkI/SWmJ0vhrsnHJ2c/ECOawafG/sDTWsjyhDjrKnrjAmdrBB6qeV3Mj7xs/nUpHKUfhHffJwYT9xYmZI5uS13msxCjyjToj4ntrqNF7WqAgtSMQu94Ayt0JG+qCTnJPHgkpeLvFgkb6LDu55diht4r38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OaR8JR4B; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-46fa764aac2so18232391cf.1
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 07:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740756083; x=1741360883; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3zKHm2FbIZbRCZMx6XqxFdXnpMw66b0caIDo/gjHQJs=;
        b=OaR8JR4B2rsmX9MNxtyds+hdEtwp4u2R89Gve3RBe6+8WVE7oyQ9dq9/u+XZgsFt3G
         ojBWIgo0YQkzjsZhQIaY9iFrTXdzihv8ZnML9ta+89SgGgm5ojUG3ZGb3rU15V0xDt5u
         78U16ZVXeJjH36Lff8NFJsQhIwSTP2OJ9VsEkEpzbfmNuAF7xPrpNi0YXr/n/JEdQQJ+
         6akWM4Z2O4cMZFymi1Udxi/RCWQj9EavJmn28RsMoqGFzNoKWPHfLsd0t1i5ev61725t
         6yeh0hCWG305Ufnok5cZAwsncyI+MgEgg45Vwqafv8gO4/5EzZLvFPSgDfoyCPT47DTV
         fkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740756083; x=1741360883;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3zKHm2FbIZbRCZMx6XqxFdXnpMw66b0caIDo/gjHQJs=;
        b=ZIdyOHWTQuWPX4Ctknrou79mTEqq7JB4Mh1BHwEVoZQnQvWi92BLA5A30xBL9AnyqF
         YzeTh70zTAN/ax7rxi20riElWgRuw//K4koxzp+xkMGtGWXe1fa8qzTuMldGjkGtLZ/4
         BubgExc5TxDQIIe8QnoDxLC64CiwFokG+T81mmi7UkereC19hN4+Usr7h+sTaQuoN90x
         O+M2iqVxj0fC7GtbrHX+kLL4bUSrZT9bss5aDcwRhzoCQk9QkAjbnqEd8F4IrCp7Krj4
         wU6EUuwgzmEqmeba0RqoZ6ze9/27EvweQlkbhZOAtZlVj50tYAkERu3FOFe0Hftu14kR
         337w==
X-Forwarded-Encrypted: i=1; AJvYcCU0NYRsmMrVOiPaqs8G7Fo1C+HPEvKU2jYMhBBcgaLj7MHzXQQkKi/Lpb59U9Egc6A7nKDy6LQY1qM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5qSREbjVcaWcaPBEDe98lCGFBjn2ZGsB3WwIYuT+kQomsA/sM
	o5q3rRWXSp5i8CMPdIVjmKqclBIY8uoA414samAvUYg2iLO0ggDe7QeYe2xsXQ==
X-Gm-Gg: ASbGncu7aKmRDt6j724S8piYD1+KfYTJ9ZlNVU8qOadUvZ0c0n01WdMH/uyGGa+hWql
	lJ6NZEi2jebmBKUvvqmHrOyi0joTtK9P2X2dDRBXRtoUNKt0wlmmxtXOPyE8u77AAv1Tl+2Heyv
	XlS5IdEVjZDDu3B1PfuN00azyzWG8gNCaEUCisYq63LfeGyozypEBHHXCmWpum7o7eGyCXBRmLS
	fVQnJPP+E64omVB7//QroH3woAYOvYN7R4+J2OBLeWrNqrUh0iHgBANESBIdkD9WFUjGJeANfIy
	PAbycnoXq9fzn5ASKfJE4e/kDqyqwkaLEZnLOJ1GNVD5ezeWruzWsaEkCi4Wy92GqyPF+XsDUaB
	RfQtqpIdwfPBA66a8LuU=
X-Google-Smtp-Source: AGHT+IGz9doxOFauOLj2SOAKNV3haWXF9zvTC5dsMiNswX+IYjm/SEucg/ksBBE7PfIwgTSgi/7JYg==
X-Received: by 2002:a05:622a:11d5:b0:472:12f1:ba4a with SMTP id d75a77b69052e-474bc051974mr52432911cf.4.1740756082757;
        Fri, 28 Feb 2025 07:21:22 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4746b4f9507sm26119881cf.27.2025.02.28.07.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 07:21:22 -0800 (PST)
Date: Fri, 28 Feb 2025 10:21:19 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: j.ne@posteo.net
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [usb-storage] [PATCH v3 0/9] usb: storage: Mark various arrays
 as const
Message-ID: <17654d89-a9f3-478b-90d5-0bc9ab838739@rowland.harvard.edu>
References: <20250228-misc-const-v3-0-09b417ded9c4@posteo.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228-misc-const-v3-0-09b417ded9c4@posteo.net>

On Fri, Feb 28, 2025 at 04:11:15PM +0100, 'Jonathan Neuschäfer via B4 Relay' via USB Mass Storage on Linux wrote:
> While reading code, I noticed that some arrays in USB mass storage
> drivers are declared static but not const, even though they are not
> modified. This patchset marks them const.
> 
> All patches were compile-tested.
> 
> Signed-off-by: Jonathan Neuschäfer <j.ne@posteo.net>
> ---
> Changes in v3:
> - Elaborate *why* const is a good idea
> - Link to v2: https://lore.kernel.org/r/20250226-misc-const-v2-0-ab655a4a29cc@posteo.net
> 
> Changes in v2:
> - Add new patches 2-9
> - Use consistent authorship information
> - Link to v1: https://lore.kernel.org/r/20250225-misc-const-v1-1-121ff3b86437@posteo.net
> 
> ---
> Jonathan Neuschäfer (9):
>       usb: storage: jumpshot: Use const for constant arrays
>       usb: storage: transport: Use const for constant array
>       usb: storage: alauda: Use const for card ID array
>       usb: storage: datafab: Use const for constant arrays
>       usb: storage: initializers: Use const for constant array
>       usb: storage: realtek_cr: Use const for constant arrays
>       usb: storage: sddr09: Use const for constant arrays
>       usb: storage: sddr55: Use const for constant arrays
>       usb: storage: shuttle_usbat: Use const for constant array
> 
>  drivers/usb/storage/alauda.c        |  8 ++++----
>  drivers/usb/storage/datafab.c       | 14 +++++++-------
>  drivers/usb/storage/initializers.c  |  2 +-
>  drivers/usb/storage/jumpshot.c      | 10 +++++-----
>  drivers/usb/storage/realtek_cr.c    |  6 +++---
>  drivers/usb/storage/sddr09.c        | 14 +++++++-------
>  drivers/usb/storage/sddr55.c        |  4 ++--
>  drivers/usb/storage/shuttle_usbat.c |  2 +-
>  drivers/usb/storage/transport.c     |  2 +-
>  9 files changed, 31 insertions(+), 31 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20240401-misc-const-e7b4cf20d5f9
> 
> Best regards,
> -- 
> Jonathan Neuschäfer <j.ne@posteo.net>

For all 9 patches:

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>


