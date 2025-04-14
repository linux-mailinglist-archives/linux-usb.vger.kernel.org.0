Return-Path: <linux-usb+bounces-23030-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D1DA884D9
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 16:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698787A6A4E
	for <lists+linux-usb@lfdr.de>; Mon, 14 Apr 2025 14:28:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B0072820DF;
	Mon, 14 Apr 2025 14:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="h3GU+z6Y"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2777742A92
	for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 14:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639555; cv=none; b=tFF1Z4lA7wZ36p0g3GR8L5n5h6GrTeHsbb6VoM1QUA1C001FMfAStMIO5V59pL1wYWQRn/stt7oYSWtiUljBPEND0b9abAXTb+PWus1y2x/K1LgRHFwOjtjGt+qjG7nrZGRTV7ls0OaNsFCj4fn4tjeN7h8jPGWRp2AicRRXxNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639555; c=relaxed/simple;
	bh=VPkc+BL+N/82sM3TipuvUvvxUrmfeag+ZU+s6LzlFe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxI47NDSK7HY4MaO1Q/3/q0bDRqjsEwLxhiN94XDRMkh5A9EV1DuyNVJA6P/QXlrxf3Zc2Mew9SJZlbKdpYHquaPfXaAtAX6h1X5o4rXXd+j/6a1g65cawAQzuX6K8Jcs1QDl0EW9WRdrfMKNS82INZfDdaCtmCzPADENMSdFUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=h3GU+z6Y; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f0ad744811so26086236d6.1
        for <linux-usb@vger.kernel.org>; Mon, 14 Apr 2025 07:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744639553; x=1745244353; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6T8gpjoQT7606i7tWzfxu28DBnsN6pzQQOQXOesI5PM=;
        b=h3GU+z6YVAnWeOeew4qb7EuTBAyawQPH4Irr5a1qAypyYDTEZBPBdKctEJg5HY4Jct
         2z24mfKkasEd1KQfJFRbBCbGwab2p7H8BT/H9ADBgtXBAJiGW90OP/Z2K9oKmNOYtwJY
         JnNHdHrURBqxW6QVppNzHawtBiHL+kPpfJYFHJkWtJORwaH51PtLHS55ap/EcNTNZkba
         8NbIfeHP2wZobrSvTvFGYzvif8xTXLIgDv+Z3pQAtfcrpOIdLSXKNJSCn4Ak1dlbs7yy
         hrQgNdF4qL6Ul699oSmEFjVkxRHAJCBzyETKjsG4NF39FODxMxICRjZjetFLRnALv46a
         8i/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744639553; x=1745244353;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6T8gpjoQT7606i7tWzfxu28DBnsN6pzQQOQXOesI5PM=;
        b=lFiUV0XIZu0BMdxxfcRPGQT1l6GpToJFWzK8Ozq7vRiHn3FCYehVCQ4JIIq6X4xTrG
         uabrndl0HNjoE/fU921ZZX6OUPuRi4sYGSZ7spNOwvPaCpGvQwTmi2XhACq+98xtfk+9
         RijyYewlHc9F6FlOxFvgqGNL4gxV/5YluXKWO3GGeefJxsYofUbBFMEGAmUYHR4m1G66
         h30gup1P9r0yjrsQFe5AEl4QwE20mEJ2Ob4w2lORIbW6x5DYwarzKTMQaB8vG9xKTTf0
         MpyjB+DPfjYbYmKCGQY2GP0uS8lG+kzMmooLeROVD+NAWj9ipfXA6qYQ4fbXfWjphvHz
         z3pg==
X-Gm-Message-State: AOJu0YzgbU8xgiXK477igqyXM8WSNfECpADoO7ihHQ30oGoiFOv4j3Td
	31WW07LRtuTT6yIxCI3eEqbH4VmO7l22zM+FYWwtGdKzFHH3/3TUBLxhlZ5TLA==
X-Gm-Gg: ASbGncsOkLAU/drZ8WxTo+9VxCiA0FRQ2QSXcwe32v7QWPYxA2Bc2OmRWyxMJzt611o
	+bPor5m8vWX1DGwPHmd3O/w1t+Is80odyMRR5Yera+XfXQnewIMAd5JD5BUp0jHU6mFuI+BY801
	XgJkgxWDsUVwrtPus7xAvUAEOmcDXXcQAU2Mlgx7yhpCQ8rErizxMJy+ljVl8205jax2wga+iks
	yqu0odROKqm1EM+qOT3kO7bSGrbxv4oosXCKObyhraRULdnliYbCihbJ631zqjOZfGsY3wxMArN
	wECe3InEkgF6SgDUGy8zZCz6mvsETc5ZCnr7fnJ2sdd1KQb5urIA9lHygU8=
X-Google-Smtp-Source: AGHT+IFuZ5rZDGovuBKpWefBj3MR++D9QoLZnHTvoEGUT5YVxEPBxh8JMJ0ezpMw+iD7ILgvjapKQw==
X-Received: by 2002:a05:6214:29e8:b0:6eb:1e80:19fa with SMTP id 6a1803df08f44-6f230caed3bmr148559496d6.1.1744639552779;
        Mon, 14 Apr 2025 07:05:52 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a896b04esm742941885a.63.2025.04.14.07.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:05:52 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:05:49 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: raspberrypi/linux <reply+AG4XYTBMABQ4XN53CBXUUO6GBC3PXEVBNHHLALZAUU@reply.github.com>,
	Oliver Neukum <oliver@neukum.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [raspberrypi/linux] cdc_wdm driver: infinite loop on -EPROTO
 error leads to system freeze with SIM7600 module (Issue #6746)
Message-ID: <9af24499-e2db-45e6-9890-f87c332bd171@rowland.harvard.edu>
References: <raspberrypi/linux/issues/6746@github.com>
 <raspberrypi/linux/issues/6746/2800873755@github.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <raspberrypi/linux/issues/6746/2800873755@github.com>

[+Oliver, linux-usb]

On Mon, Apr 14, 2025 at 01:31:39AM -0700, sfczsolti wrote:
> sfczsolti left a comment (raspberrypi/linux#6746)
> 
> Hi there,
> 
> I opened this issue a few weeks ago regarding cdc_wdm driver and haven’t received any feedback yet. I wanted to follow up to see if anyone has had a chance to review it or if there is any update on addressing the problem.
> 
> If there’s any further information you need from me, or if there’s anything I can do to help, please let me know.
> 
> Thank you for your time and effort!

Many USB drivers getting a -EPROTO error immediately give up and treat 
it as fatal (an indication of a disconnection).

However, I'm not an expert on the cdc-wdm driver, and the people who are 
may not want to do this.

Alan Stern

