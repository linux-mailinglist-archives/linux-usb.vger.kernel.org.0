Return-Path: <linux-usb+bounces-22967-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D2A85D95
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 14:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2AA314C7849
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 12:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98F1B2BE7BA;
	Fri, 11 Apr 2025 12:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aHQ9UfXE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E85E2BE7B3
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 12:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744375226; cv=none; b=PZwZoSn/5Zm/6x2dgJneGJSPfvGLKLFeHnm2RL+Cn00S/Hch2MoFkkgRnEDgyIZgsNiWASy1YAbIU3IVwglk6ys3nTWn8LmREssBHu0tu0fuetnJ5gF1hx3o4nTLitS+xCpq46TofqMxE1MubYhU++jFb1BMRJjcQq6rPw/1I6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744375226; c=relaxed/simple;
	bh=AXZG8z2/mlESYwSYPyua3F76ehc9HJ/RiOj/ndVT6Qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slyzvJF1mll8j14pdmU9D+YcYnqtWxeqYqRTkvviatataxOuRA6+xKUxoUwP/hWdJjdEhdJf4WPpEY0SmcUWzaq/3b5OoXYhXblrnzKrj3rZBh4znzRZt9KcYmhosquQWS/hooBT3QAhTcIvsXbDqFjAvusQdA6Q/0GVf26rQus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aHQ9UfXE; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e61da95244so3337197a12.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 05:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744375222; x=1744980022; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=aHQ9UfXEtgUXLtItA36BHSuNSOm7W0JfafYWoPyQ26lG+UZZq6lwEkklC9x29qon9Q
         a6go+m+zBy2Pc3bVZrqH//eoceD9zo0LadjTuitx/rOX7i97WeXr6WfotMehfuwrN+6u
         osbE8rKZQRA//iNTQnuzTMQ3CZB3oZSdZeNpyOVxTAuz6EVxUem/ZN5189un844KWJcD
         39JuhyJUHFiteRfvrwKQkxRCAHGqjShGUi+BAUDEPO1sKwrbLvdLWlWYe2lW5sycjEpT
         n5/XoxeUT7/h16zhMVHXBkPzuvonZ8+kJL990fgCGApJd96QpS1Or2tOia3n0tAL4RdU
         zh9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744375222; x=1744980022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1ocAfGLIQFAKvHMqFgNq6HHUQpi9TfZCv9uviDd7As=;
        b=QiupofYg6wANezF2n3cvPo7TkWEouJ9YgqnRvgItZ1RCY/XIIFnI1Uu6NP+/wSuSIc
         CJLKsj8BbkdkLh5iJelRk/+5eDsPlKFavL8mMRfLIufDT+YmSoNwe+QAYej+PqtdIpt6
         6zOy23++VBBplWwXLV4zC7sqTDcgVsZr7V13QF8WYV96dpXZoSJ6+O5/cjk6mxIX9ItE
         xcOfsB/1fvk6DKMDpC0BEMJl0fO6TG5aX4JEtRWSaywCOOHJO3Jn3H7E+yktor8HSQSx
         sb+KdrOaUc5pmv0kXbodVHi1rt4AT4s80wo91YzVF0uT8hOO0FWBsDYeGb3HxJ/T3/V7
         zQlw==
X-Forwarded-Encrypted: i=1; AJvYcCUSqx8a8O3nejaCBEKDSMM++A3nmZ6p4mAiZJw19tcc/0Xoi9jAwtpace5KvqPGvDUoSaRCNwPVA9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFuJCfL0kVBfV2ej0yT9RtlFI/g8UvAV6grFV0g6Nx2jXH5VcX
	zns29cqAAtbK+hawIVnNkZzo8ryAxVAivTRqezdt9AxRzoIJ4Gc/Te7oJbfyCGY=
X-Gm-Gg: ASbGncta5H6wXZhHli092C3HwfKKEhiRbfbKtbQJadKD0FFOHGWcE5niaM/Lh8wDgiv
	MnebWfvWN1DID+GSrSyQbjtJVXVxpa5rP1qwOjF21O9Z/Pt/gOwgO301MkTrKe+7mv6MdQmtOWa
	LQfGgC4AKniUy54KlZ7ziUjbj20/ikEKbvIXwvy6GZutR0Br1znOwOeQpGLYsPD1EfhSu3rAZ9+
	iJSo3YPiZOX27H1JlRzZtdaXY7YqaTKHZvzqsfPC0MptjpV5qh/UZnGDvs8Vk3C4dD7lN8r1Ff8
	u8HAEjtY87S/jYIHjzrgs5t33dcJXWQzSB7KyajmBJ7cF4inijQ=
X-Google-Smtp-Source: AGHT+IHgyCOoZTpXR8VI7LoO3entvTJlRIeqltOKvxSFeMXEvp7dwNM/Lz5ZzULD+8sUgZTb+VYO6Q==
X-Received: by 2002:a17:907:9692:b0:ac2:a4ec:46c2 with SMTP id a640c23a62f3a-acad36d5ea6mr209131666b.49.1744375221837;
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b4f5:b9cf:f32c:8fe])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be98c9sm448014166b.65.2025.04.11.05.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:40:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 14:40:15 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Wesley Cheng <quic_wcheng@quicinc.com>, srinivas.kandagatla@linaro.org,
	mathias.nyman@intel.com, perex@perex.cz, conor+dt@kernel.org,
	dmitry.torokhov@gmail.com, corbet@lwn.net, broonie@kernel.org,
	lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com,
	tiwai@suse.com, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-input@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v38 00/31] Introduce QC USB SND audio offloading support
Message-ID: <Z_kNr52hM-iWUgyZ@linaro.org>
References: <20250409194804.3773260-1-quic_wcheng@quicinc.com>
 <2025041029-oval-cavity-7896@gregkh>
 <2025041144-imitation-reappear-a0d9@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025041144-imitation-reappear-a0d9@gregkh>

Hi Greg,

On Fri, Apr 11, 2025 at 01:04:37PM +0200, Greg KH wrote:
> On Thu, Apr 10, 2025 at 09:11:42AM +0200, Greg KH wrote:
> > On Wed, Apr 09, 2025 at 12:47:33PM -0700, Wesley Cheng wrote:
> > > Requesting to see if we can get some Acked-By tags, and merge on usb-next.
> > 
> > let me give it some 0-day bot testing to see how that goes...
> 
> All looks good, so let me go apply this to my usb-next branch now.
> 
> Thanks for sticking with this, I think it deserves the "most versions ever"
> of a patch series award.
> 

I have honestly no intention of blocking this series any longer, but the
comments I raised on PATCH 26/31 are likely valid and suggest the series
wasn't fully tested on v38. So I would personally prefer to get fixes
and confirmation on that from Wesley and then merge v39. It doesn't feel
like the kind of thing to fix incrementally on top, since the commit
message is also misleading now.

Thanks,
Stephan

