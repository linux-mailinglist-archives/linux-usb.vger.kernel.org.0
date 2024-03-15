Return-Path: <linux-usb+bounces-8010-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E768287D3D6
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 19:44:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AE48328382E
	for <lists+linux-usb@lfdr.de>; Fri, 15 Mar 2024 18:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAEBC1F619;
	Fri, 15 Mar 2024 18:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MwKAaevR"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EA1EB48
	for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710528245; cv=none; b=uUdL90DskvhSBxlQIIrXnyzn4SjKePq+PcabNsQcIVejBBdDOKhLEZ1abOgaZneAdE2Va+ep1oWRsHx2wLAxwaxh6/N5xoYz26iQDHPV1KvX6hx1q9nN8SBOqjF81RgBwSY8yJ6AIVz34P9GYZ8SRhBA8ZIcuckZ5BxKvDeXOc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710528245; c=relaxed/simple;
	bh=1hIcaEugVHYM9qv9vCZLr+cROMsMJ1VI8gM2ISBNduI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gc6Dqzc/SgdSW33lvVC6kjzUjBAMjJM/1Hyhi521vL4lWXLO1CvNokTKrAnnnV9f1WDMdc7q58U+vhrGSNduxQLzafz+8W5LthTgMEckk+nIbCfla037ew8gvnqj3pEnPe3tK/l/Qwgjzjgu0iuGsiozGnap+IOfgL4BNtvNPq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MwKAaevR; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5101cd91017so3831976e87.2
        for <linux-usb@vger.kernel.org>; Fri, 15 Mar 2024 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710528242; x=1711133042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=unYKsN6XP1tGmxG8mlEYFLlvddoUm5Z9kRt/TflohbA=;
        b=MwKAaevRMzrfYEe3Nz4rdKAEAkimUYY35sWA4sxD8D1D9XFtW/jBsarxXxQ5xjq3vI
         ZY5g9w0b7SbRyNO5ZlpAgu3ChpNyejpAYipLT4oEBr5ZRDhBh2wIh/W/lYTBays+WWOP
         PfQahhy2iALf0RlqrXc3cjuAYbljqYIdm30T21fp5j1G6hRqJMcM12tCAHcuk65Wqxxx
         mdxs+MsYuFCTNeVefwyM2w4UMaThPOicIBZqgIOAsrwQdkqhsVbJ222E+Nmad1FwVgO8
         +ZFD5msGU4fDmHMQrouc0+8HtyoTDBr8Z720/BUQQEB6G/GmQA6/lJZyvHpPacyn6hN1
         OMAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528242; x=1711133042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unYKsN6XP1tGmxG8mlEYFLlvddoUm5Z9kRt/TflohbA=;
        b=LXmPbrUu2/xF8/2C0WyqANHZR9ZoW2XjycenYxCFG0Ry/pES4+s3UshLiw9VJa4prN
         9O77S4I36PZ1p2aC2moZYLOybQkxxL5M8J9uxYcB2otG/qiFFu0sgX4ISC+h1IrgDNf5
         qSEDyqm6sAIrW/5AgXy+cqwFvZs+sfH/2Lddj7PDJEBv6yFHdqWCsSj/FMx87QtqL7lG
         2nA38Sn6wfi1QhDVFBQKzLMYjPCl9c+Sga1Abd2A4r8SgkaKY/YUVuHLafeTaNSX0RPJ
         r8qamA1M5bLmZOidPlX8j4Qcow6KujMe74HpkJ5EbfaaUoX6lgGJlxzRXmu7vyNbSHRL
         wXvw==
X-Forwarded-Encrypted: i=1; AJvYcCX8UCU9IjxsjXwM318wZAMZEWJK6Sr11KMQnLcrsD4rH4kbQtKiM4iTtnbB97ruL0rGCdZHGNgldUEb0dG4rDmN95nWfhrpmIhq
X-Gm-Message-State: AOJu0YzWwuwS7WEHk1ZgRw+Dcl9NTBpAY0husrVItU7eqgyIe9pFo9eU
	mkGlWdVadLOXVklxnpgseYdJWwFWmI5KC4LNtXSYajs3XF3fCMlAfKhNttD5X7w=
X-Google-Smtp-Source: AGHT+IGepkNfjDBvL+Ow3oH9rGw1nhLPfmkERiJyEG0SK9efGs8Tt8dyBlC5GPFaxBFpGKlpa7MjuQ==
X-Received: by 2002:a19:4353:0:b0:513:cc91:9ed7 with SMTP id m19-20020a194353000000b00513cc919ed7mr3525941lfj.11.1710528241555;
        Fri, 15 Mar 2024 11:44:01 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r11-20020a05600c35cb00b00414038162e1sm2016682wmq.23.2024.03.15.11.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:44:00 -0700 (PDT)
Date: Fri, 15 Mar 2024 21:43:56 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] usb: usb-acpi: fix uninitialized variable in
 usb_acpi_get_connect_type()
Message-ID: <eb25d06f-775c-43f9-9e7e-4f859f6cc41c@moroto.mountain>
References: <fdd4f94d-fb8c-44a0-9472-3485a567caca@moroto.mountain>
 <2a3ab595-80b2-fd4a-8748-c823fa5ec098@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a3ab595-80b2-fd4a-8748-c823fa5ec098@linux.intel.com>

On Fri, Mar 15, 2024 at 05:36:16PM +0200, Mathias Nyman wrote:
> On 15.3.2024 17.21, Dan Carpenter wrote:
> > The "pld" pointer is uninitialized if acpi_get_physical_device_location()
> > fails.  Initialize it to NULL.
> > 
> > Fixes: f3ac348e6e04 ("usb: usb-acpi: Set port connect type of not connectable ports correctly")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> 
> I sent a similar patch a week ago, just before merge window opened.
> looks like it didn't make it.
> 
> https://lore.kernel.org/linux-usb/20240308113425.1144689-1-mathias.nyman@linux.intel.com/

Huh.  That's interesting that this bug was causing issues in real life.
I thought everyone was using the GCC extension to zero stack variables.
I've only been fixing uninitialized variable bugs out of sense of
stubbornness and to boost my patch count.  :P

regards,
dan carpenter


