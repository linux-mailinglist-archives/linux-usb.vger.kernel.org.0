Return-Path: <linux-usb+bounces-22138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42955A70C5C
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 22:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CA1ED170712
	for <lists+linux-usb@lfdr.de>; Tue, 25 Mar 2025 21:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C757A25DCFA;
	Tue, 25 Mar 2025 21:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CB0SIAnG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7AAD1EE7B1
	for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 21:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742939279; cv=none; b=r3oQVODgqtruCZ2NyO3e6K7vnPOseJM8SPtZcVW1wn+G9TdlQZgxLTuuf0U7JpHPK6b7mpLwWuy1YXzWJD3IDrSfCwoy8lSKCky1qYVgNL+FbGmhp+DA6Is52Q/gvZzcupCJkJJit9Qu9OGWi5Rz8SjbYrbBnhInV0FffqxW8L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742939279; c=relaxed/simple;
	bh=QETzk4pWUdd8GTK9mbSDrwkUGp7j6xwkhUzJ0GqSv0U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WveBVGgfIETAaZGJtPe/fHXo31CsRQGdQcu+IytbVzqEyxLqI5pXHwWc4LPk3O498T+GTZSJX8TEHuRy80Nf4RqH2XB/Rcab0IC34Jl7nCf/y5/4BVCjtM1TJx3BJL+m4maDKfoF9NecK0vTQWy5Ox8+fC+MA6QeRVhQHrTIWs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CB0SIAnG; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-47664364628so2950901cf.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742939276; x=1743544076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wjSQcs1axKYj4DiilJ42WS/RY+75sj0DasrfbCjQhfE=;
        b=CB0SIAnGmxdFUz4yVjdZHL1LYJzN2aYSQV6WscOvYM8w/zZNQHzEHtLYnQZ+whTzRO
         fcWn0s6V6/9XgM/S0/4N8gASvUrV2kO4UMjvQ7+vFA4iLuuuFB/xhgfidjRyKJ9oR6Gg
         u544FtWhQyo8DyReq68Z7cUoGee6qcGzpXis/aUeRKlDUqgppXr+SixZDl6iPghqrTu4
         JiIMJ3B0S2kwUb5wuR4OPlh6Tv6VEgeLdJjrge3WSOmAWrRArtuJjbGDneS2YbXz5f7x
         h/EEFLsUYc1azLWYlDnLW75GPKM2TsAPCxkMF6JZQwIa0n5ayLCLvxP3yPK4BG61y+JJ
         6jeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742939276; x=1743544076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wjSQcs1axKYj4DiilJ42WS/RY+75sj0DasrfbCjQhfE=;
        b=T0tyyAF1YPDqfB9QYKRReDSVyozqR39efv/tZ4ul0JoIeb4dM1XMFCQZbYW4lPrlhz
         8ijENI1rwBIYUtTc0rfMxVdujdMEEPCOqxI5Zf9KjinHvZxu+J4mnNb3ZS53rV7ImLT6
         +5Wslv0obwEto9N31daMJUUKXasNm6JTpIQVhjfLeJJ4urJDeoThY19Wf1YjujDmfeVr
         6G9dlar5UmL/f9UhTUAZZ7KJrfbuppQ2a1K3xj1PPgcGWUiDNnyDV/7gGra8PvpGHJ5B
         t0qMMVjnvtl27c4I62xVpfsgTR5o48bxQ3nR786Bxf+CpkL80Kh570V/juwg9bIsrKbl
         PO0g==
X-Forwarded-Encrypted: i=1; AJvYcCVPtnO+sDYMAOoT9Mj7XCgKYlr4cisN5jh7SMiw/jX22ZsLNuHONdgdDE4WMwQ+WroEUb3kgXHFWkc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0DdiBleXWO/pPD2DXYMPR3nu2kGwqJXm9eoIzMg7FUz0ESSgR
	Rrf5xHdCDKigNY/bXoPP0HA29IQR4xT2iil+rXsgFmKUTrSMxjfrgfdNsJ6jZw==
X-Gm-Gg: ASbGncs5H+dD1U5U3lr5+d24KUhqlECzmtfhLujWq+9fFf5U2zLExvEVLQ2XLGEi58E
	7jtwzbTVar5r1UT5yp+CkK/6MhcNI+1tkYqPEZ9ALSwdwEuRNGsQWeNyDp7ntQVcFMjjS7jPGxE
	k1Zw+MKX4BoXzc61fJluYbt9rKeNA2U3jbA5BzlntiFdfjw5MRP/GXBuE2A1qEBan69FVF8cPgy
	IDeljE17i2HLv1/BAxVqzwllLO1q3CArw2CSVr0ylUV8NgugY7I791Bg0Xw8o5RI2LhW2q2yYzu
	q6oyxPlexnC5J2DhEVJPCC4d6vZYb7S1U5sP3uvrlnAc4Q==
X-Google-Smtp-Source: AGHT+IGa7jO/ejiTjbS4D+JRAtx11lg1Iif+dd+JHkXnhyYOFTmofUITjiHEUTYyKHeLyVKHjj7o9Q==
X-Received: by 2002:a05:622a:2b49:b0:471:9e02:365e with SMTP id d75a77b69052e-4775f2f8693mr21094701cf.8.1742939276575;
        Tue, 25 Mar 2025 14:47:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3b5d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4771d18fe25sm65734241cf.42.2025.03.25.14.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 14:47:56 -0700 (PDT)
Date: Tue, 25 Mar 2025 17:47:53 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-MKiV0Ei5lmWik6@shikoro>

On Tue, Mar 25, 2025 at 08:56:57PM +0100, Wolfram Sang wrote:
> 
> > +	static const struct i2c_adapter_quirks i2c_usb_quirks = {
> > +		.flags = I2C_AQ_NO_ZERO_LEN_READ,
> > +	};
> 
> Why didn't you create the static struct outside of probe?

Because it's used only in that one function.  But if you prefer, I will 
move the definition outside of the function.  It doesn't make any real 
difference.

Alan Stern


