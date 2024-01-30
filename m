Return-Path: <linux-usb+bounces-5621-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFC584219D
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 11:41:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BAE528F441
	for <lists+linux-usb@lfdr.de>; Tue, 30 Jan 2024 10:41:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D899D605B4;
	Tue, 30 Jan 2024 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="FlVy2dkm"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9D5D657BC
	for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 10:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706611244; cv=none; b=r7cycWe5Jb3yTsEZwaauHuGv6188BfNE/+pkw6JZMWQh2nJm1+8dNbH9I94CLQ2j0rav/NArWOtltlRdR/a5F6dmwAVCF1Ot3FjdZiWM6Gi5HQMbjWMu1EFl15UTUJVCEevSyGcGW2R0wFnBtPUVoiGJyklsqq80mXFGycnQvY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706611244; c=relaxed/simple;
	bh=ETdl8coLEmvqaxOFLDsn4/glTC/AoKOwDmqO3n9zkAw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXh7cgphduDcy7vX0UQfs98/7VwjQQevUPFTFayHO7M0OPGQUFfMSE2rjGB5VdZsGJ5PO3keCGw27V+7l8C5Mi1ewU9YUzfWWr5mNyEUwGzx4OTbtlf3g2/5X724n47iczXCzlHUiYQYSLzXn9vcEX8AKCItHEHxbLmymzzJrhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=FlVy2dkm; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f35ad4d36so192825a12.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Jan 2024 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1706611241; x=1707216041; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
        b=FlVy2dkmMTm3VdInTzYzAVaHF+mck+lV2jkocL6K9V/yoLpfW8TxGh+hPuPO8Gc/jP
         jsoY9okfXGxxpxdPmN1WiKHmImOHqvN0HYVkdWHUSbYNl7RhPq16oxRAP7oI294IDWX6
         tgDOrKnuBQONnsmTBh56esl8g6dVEx1XwOYk4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706611241; x=1707216041;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bpht1JVVU83PUsSOfehDgTwxwvmRcn3OoCMGwiYoquM=;
        b=TbFrkz0DKmmaDQd+bxi0aqd25f6bl9Ilhjkf23t14suNIWrcieCjaP4CEU/i7Q4zEv
         I2gNOdARQIwCEdpQ19jchIHOq/Vc6SBOUbdMebSwidCdbgkhrxmOQxjYOj5YFpO83txm
         hUFH6F4CL0ggk03EG1jDVp8+cIf8jkvA+7HUb/IB2poZoi1EoWaIbrP3JG3J5XmMePqt
         QWxoh4JmuVl3V0wq7GzuctWJA6nrbcYUApS5Ppa6FsUt4FoI19iSA3MGRrH20WHvzM1O
         GdJvYv3E1DaC5/qp6ldw0WtY25Hw1X804Cp6M0RARhupBVN3mZcQHOvori7hGA5N0gIY
         dZ/A==
X-Gm-Message-State: AOJu0Yxk8pgi1uzou0g5nFHQubrDQFY36OFfMno2+amB9r6YOcZGCxQn
	4yy0W/Udcj2MvOXmVVudMn99MVKfyaZHEuW5PZr2Hk7C/CZwjaXuzlQyRcofCCw=
X-Google-Smtp-Source: AGHT+IHZ1+k7/jhfw/iaNOKyePTFN9as60sY4ufogxiCp9dTJV9WWo6nCqSg8dJHFMfPftGHyW34Rg==
X-Received: by 2002:aa7:d04f:0:b0:55f:99:fb30 with SMTP id n15-20020aa7d04f000000b0055f0099fb30mr3223522edo.4.1706611241253;
        Tue, 30 Jan 2024 02:40:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id es19-20020a056402381300b0055cffd3fd32sm4749393edb.68.2024.01.30.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 02:40:40 -0800 (PST)
Date: Tue, 30 Jan 2024 11:40:38 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [Linaro-mm-sig] Re: [PATCH v5 1/6] dma-buf: Add
 dma_buf_{begin,end}_access()
Message-ID: <ZbjSJi07gQhZ4WMC@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	Christoph Hellwig <hch@lst.de>
References: <85a89505-edeb-4619-86c1-157f7abdd190@amd.com>
 <0fe2755fb320027234c086bcc88fd107855234c5.camel@crapouillou.net>
 <577501f9-9d1c-4f8d-9882-7c71090e5ef3@amd.com>
 <7928c0866ac5b2bfaaa56ad3422bedc9061e0f7b.camel@crapouillou.net>
 <2ac7562c-d221-409a-bfee-1b3cfcc0f1c6@amd.com>
 <ZbKiCPhRvWaz4Icn@phenom.ffwll.local>
 <c97e38ee-b860-4990-87f1-3e59d7d9c999@amd.com>
 <Zbi6zQYtnfOZu5Wh@phenom.ffwll.local>
 <a2346244-e22b-4ff6-b6cd-1da7138725ae@amd.com>
 <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7eec45a95808afe94ac65a8518df853356ecf117.camel@crapouillou.net>
X-Operating-System: Linux phenom 6.6.11-amd64 

On Tue, Jan 30, 2024 at 10:48:23AM +0100, Paul Cercueil wrote:
> Le mardi 30 janvier 2024 à 10:23 +0100, Christian König a écrit :
> >  I would say we start with the DMA-API by getting away from sg_tables
> > to something cleaner and state oriented. 
> 
> FYI I am already adding a 'dma_vec' object in my IIO DMABUF patchset,
> which is just a dead simple
> 
> struct dma_vec {
>   dma_addr_t addr;
>   size_t len;
> };
> 
> (The rationale for introducing it in the IIO DMABUF patchset was that
> the "scatterlist" wouldn't allow me to change the transfer size.)
> 
> So I believe a new "sg_table"-like could just be an array of struct
> dma_vec + flags.

Yeah that's pretty much the proposal I've seen, split the sg table into
input data (struct page + len) and output data (which is the dma_addr_t +
len you have above).

The part I don't expect to ever happen, because it hasn't the past 20 or
so years, is that the dma-api will give us information about what is
needed to keep the buffers coherency between various devices and the cpu.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

