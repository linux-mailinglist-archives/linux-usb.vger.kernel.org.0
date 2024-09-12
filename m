Return-Path: <linux-usb+bounces-14965-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E46C975E77
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 03:24:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76AC4B219B3
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 01:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD95282F1;
	Thu, 12 Sep 2024 01:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="YOyYmiTg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7783C39
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 01:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726104261; cv=none; b=ZRGYckWD6mNXWZ2+r5Hr7eWbIjvMLDFobPq5g7FLzIPDu+YO7aI2ERU3gtpd+YVXiy74FIkKHykR0GwUdE/bOEG394Lcj149S4hZ9yObtvmBjIX7u3PlrjVTBppYRCvArfLAv15RNIol3VouZvimldtixKF1XRegTmvbG0jJpRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726104261; c=relaxed/simple;
	bh=WCkz1wA2fycZBda5JGyZBgMJFp+mm9qFOsBC82gpG+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKz56AV6qrTr5dXIvMEgCutPB0ZzNwsTL8yZMO9D9VFTKPNphEfBx/b3QK/+K6C2cJgYUCwIFHzuerk4Pq71WMpuqdgTz2ZCb++QOh/4pK0xo6IiKA+x70oMVWdnnNrSjCj07Bea4nsKPdkT0iqXXCjrUjYX+qdOJe6SvBA0s2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=YOyYmiTg; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6c3567a143eso3258106d6.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Sep 2024 18:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1726104258; x=1726709058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UOBcbGANHO6y2IqBbxXHcJn4a/lLLiljFUakrQAD5yA=;
        b=YOyYmiTgdVU/etAEQt/a/+83qzHef+UXWxfv1hSExv5tLXapWtt8domZXCY/dyEGpu
         Xdso0dDkLBQ6mTqWa7oeTjZkyc8h7BF6z15AlOid5y+Z1A4jIb6y8DrUfkduu2SQ3Dzv
         0c5e7uBCytlC0bRhv9UlVeNf88IISQjUTf96OGcPy/ZxFoh5TNwZmCRkoZFBH9JBE/xL
         Fy7U/1FXBsSbS/8DKLMlzdq5aeV6umPxAqkAs4dABzMHO0Rg3lb0gnmljKqe1ShfTvZc
         en0cszrKeNaE2YbMX5zGLigdJbvJHvLrtOoynsug4A37cBVCmdDXI1dXNYB7IHv03TmB
         gaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726104258; x=1726709058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UOBcbGANHO6y2IqBbxXHcJn4a/lLLiljFUakrQAD5yA=;
        b=vMHt5+gsovQxWVDJcy2zgvtJxFHgJRDxyI/h2OIYZRVEBgU4tnW74duUjtofSlEZD3
         NCPRLikuD1x83AgvvCZfJVhJMrIsiSws47X9lhbU1LRQhy/8impWdComMjT5PTHMah8m
         cv9T1iKWlWd0WAVRd8NJfvl3a9zHKheVqw9VRc+Mq74APbmR3DyboW/XCXKn5KW55AIn
         pfQGPx/pePw2cTqXGjiRc3GJhlOnu2UxRKULAjVIieTQpA660Crsa/oVIo7eC72Lp5oa
         aJncVykVyMoLQZZmyNaZYOuYWm1flzuXJaVxlPkyxcpph1KFgy7fe+N7Atuf4JEEUabd
         0PKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQTfJ0EyelmCkCGbqf3bffKYH+ZwGPHq6ihTG7Sls7G7KCvhTHaUOAL3H8U7Z6su8S+ZmSu3ltC0I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7Wwe7DJwDgNxPl8q8/s/v6Ou246aoA/1QYfEavnsCHj0CiLl7
	ItI3It0pYhax5TrQj56tz2SQUrdWywAK1rfV8nuAwxSKqAvSKpbe95TpFokitw==
X-Google-Smtp-Source: AGHT+IHWQKUeoPplqrp5x/XBdOkpDoc8ofhwXw7/GlSPZnBvRMV8tbR7gftUmg6tL5QhMLHyJVJdfQ==
X-Received: by 2002:a05:6214:33c2:b0:6c5:64b2:71c3 with SMTP id 6a1803df08f44-6c57352e2a7mr24620406d6.25.1726104258431;
        Wed, 11 Sep 2024 18:24:18 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ff03])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c534786129sm48099016d6.135.2024.09.11.18.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 18:24:18 -0700 (PDT)
Date: Wed, 11 Sep 2024 21:24:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org
Cc: usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org,
	skhan@linuxfoundation.org, dan.carpenter@linaro.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <46a5f308-5d0a-4e41-82aa-5bd9cf81d35a@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
 <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
 <Zqp8vbbIC8E/XrQY@embed-PC.myguest.virtualbox.org>
 <b35a344a-018b-44ae-975a-7767a3d5b6ec@rowland.harvard.edu>
 <f5d4711f-9b4a-457c-b68c-c2e9aefbe4a8@suse.com>
 <890e0ed1-25c3-414e-9e8e-f5925fe8c778@rowland.harvard.edu>
 <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuI5nptdk+BcXh+R@embed-PC.myguest.virtualbox.org>

On Thu, Sep 12, 2024 at 06:15:18AM +0530, Abhishek Tamboli wrote:
> Hi Alan,

> I noticed that the patch has not yet been pulled into linux-next, 
> even though it has been acked-by you for over a month. Is there 
> anything else I need to do on my end?

I don't know what the story is.  Greg?

Alan Stern

