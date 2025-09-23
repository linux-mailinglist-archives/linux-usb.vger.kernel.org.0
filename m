Return-Path: <linux-usb+bounces-28554-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 76018B967AA
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 17:02:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5681178409
	for <lists+linux-usb@lfdr.de>; Tue, 23 Sep 2025 14:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B03525B31B;
	Tue, 23 Sep 2025 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EQhW9fwH"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DA8255F31
	for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 14:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758639509; cv=none; b=nH+Je5B1MbApCnb+8h2QZFiI+NsfsI2vaydmB0C3t613bZCndg08AYzPZZMQR9wHZ+09A6JtQ54XeRPjAAiLLnSHqJw8wQHz49HK9VE32+XB5Goukp9xOcpp8GwVjyg5HURqdZmn9wZdtnSO/STTOc+lrO8wh/I6gLmH1+oV94A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758639509; c=relaxed/simple;
	bh=2JkaldusHnBs9nmgBDsrH+Q4WyDqb15X4kwjmxawQQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PRvah4Jkj9elzggwIJkvajqeHrkabgXf4K5FvcBigChyZe9hQIig42L4/3rbdMe/Syru4HVFZcO0hBNhurOhseXGFK71YlVrVQ89FFVUA4ELfNRfjOhLfXTEQcR1Xb3s/IlepJn9dHh/hqo1atN7o9GigN2TnZBn7kIARXE/De4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EQhW9fwH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-826fe3b3e2bso607279485a.0
        for <linux-usb@vger.kernel.org>; Tue, 23 Sep 2025 07:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758639507; x=1759244307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ri9p27Eq4rFSbThj+QyWFkt8KhHdU/v11ZSJ66tpy+4=;
        b=EQhW9fwHV4Cpg3aPDmF0cAXj4cTENYLS879I/ucgpowOtieNAZCRdEdrTPDvvLQoCz
         ddEKLq+Fpl5+QVHdaV5ElnbmSM72XOas9gHTM2zPhf3dcdE5ahwwV2h+bgHP1JpvapIR
         hWY7u3M/eaY8ofeBia9DK9M2xj67sEY4dIU1U3bZ8oeB0QdevW8fscGN6WZzxfVXdy5s
         BFx2SHAfwYsnyRepBZPHdUjv+gniKlVyZU7HAUJT0PihG3TrRaCF/jXlpr/1/jcooXgv
         EZYx7n54pPrB26RwHXre1qs+Hltn6zmvTlo3aDSLiBMgb/fDaGgNnaxOhP/14iT11jMo
         tiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758639507; x=1759244307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ri9p27Eq4rFSbThj+QyWFkt8KhHdU/v11ZSJ66tpy+4=;
        b=VH17QNc5D5cTZvHxpomcIS57yXH7uQ9QAOtpCgp4Wtm1tNaQAYEIyRZckMDdcVy/Kn
         caQvG5XyD5IOeivndtyJTOxVBuAaNNvosfvnk7b46TP+8dnS6C6URitz22D2UIjW/LMv
         oHPF1JtGMoXof085QNjNX3Uvm5+Z8oSU3Idq3DFwADYEg02Q7hY1x3ovqFUjSsNSWp5m
         9ZGsGpSF0A/mZ+rCvq07OjxnexFExH/bkXrOHrR5gaQ1elyTTGmrvg/HAXdSiwSxjpqw
         WzrZbp3V39NaDwXFAP940g5omT42C3gnbwYIVurFrWo9iRoRZ7MBBzd5CeVHMvsQig32
         g3Qg==
X-Forwarded-Encrypted: i=1; AJvYcCV35w2zVyg4JNF+yQpHkisgU3ZFJWt3c+NTWJMeVhX12oe+e0ZYlumZ7eJtVmKhCpVvNgP6afzrfys=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjdJ78/aiwO0LdWeU8pSeaGJQrvrnygJxZLWfTBM1g/dvVQ/uW
	HCS5/wxXG13yN1n4X3iHH488nyeHxQvv45kgyY94HhA7Ns21hqT6PUo9EoI5ZPDZog==
X-Gm-Gg: ASbGncu80U2LqNy1lY+Csv4muhlWbEuxFuoZseNQmyxrsxF+P5w5YFLYy4fVwvPTAp2
	dtXgh6sT0ZBp3IcdUrkwKJQduPvRIC7ovFAeiciZCoAB7+GnNNWGhWU+SB+qrTx+4UdzM3/1pgj
	kttox/+pQiRj3rnv/Kt7LNcomCZ16co6vXkpQf8icNqpIyxuplFRXbKvJcaCKHYY4kLPc1EQAkB
	aGH8qpCAuOzLlSA9mNMQZGPgQPu6bOqov5dsWZgpLD/TMBTcpQIoMqlJ/NdrrWJDdW6PIi8kMlG
	+kazWuDekJaKOZJspZozxUyzEkN5FKczKE6hWk4IwrX1GfS0Ug0T4epBXlU//A0CKj6Y8SKTn+3
	Gngjapu77I/Cn+s7W/oBEe1Ph9d+H
X-Google-Smtp-Source: AGHT+IEgq8/SYBm2nZcy+yIjnlm8ABqUN8h1aeiVdFzWtXPHXTllLJNSOfYjpkG/XFj9RGAIuprC/w==
X-Received: by 2002:a05:620a:2588:b0:84b:871a:1651 with SMTP id af79cd13be357-8516eb46222mr283379585a.18.1758639504418;
        Tue, 23 Sep 2025 07:58:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::5082])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85411d12270sm55868085a.26.2025.09.23.07.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 07:58:24 -0700 (PDT)
Date: Tue, 23 Sep 2025 10:58:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] rust: usb: add basic USB abstractions
Message-ID: <0ff2a825-1115-426a-a6f9-df544cd0c5fc@rowland.harvard.edu>
References: <20250825-b4-usb-v1-0-7aa024de7ae8@collabora.com>
 <20250825-b4-usb-v1-1-7aa024de7ae8@collabora.com>
 <DD07LUJXNZN9.3RHH9NJNRFVNN@kernel.org>
 <27AB9C59-BAE6-4F1F-8638-DF9244D0A616@collabora.com>
 <DD08HWM0M68R.2R74OSODBIWSZ@kernel.org>
 <2025092326-banked-resubmit-67c0@gregkh>
 <DD0994IZMBVQ.2HZOA2ZMWT2I@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DD0994IZMBVQ.2HZOA2ZMWT2I@kernel.org>

On Tue, Sep 23, 2025 at 04:38:34PM +0200, Danilo Krummrich wrote:
> >> @Greg: Can we guarantee that a struct usb_device is always bound as long as one
> >> of its interfaces is still bound?
> >
> > Bound to what?
> 
> Well, that's kinda my point. :)
> 
> Having a &usb::Device<Bound> would mean that for the lifetime of the reference
> it is guaranteed that the usb::Device is bound to its USB device driver
> (struct usb_device_driver).
> 
> The code above establishes that you can get a &usb::Device<Bound> from a
> &usb::Interface<Bound>, i.e. an interface that is bound to a USB driver
> (struct usb_driver).
> 
> It also does establish the same with other device contexts, such as the Core
> context.
> 
> Despite the question whether this is sematically useful, I doubt that this is
> a correct assumption to take.

The intention of the USB stack is that yes, a usb_device cannot have 
children if it isn't bound to a usb_device_driver.  However, we don't 
try to guarantee that this is true; a particular driver might not 
enforce this restriction.

There is a surprisingly large number of calls to 
usb_register_device_driver() in the kernel (four in addition to the 
standard one).  I suppose a little auditing could ensure that these 
drivers do deconfigure their devices when they unbind.

Alan Stern

