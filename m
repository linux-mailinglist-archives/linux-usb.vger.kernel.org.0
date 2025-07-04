Return-Path: <linux-usb+bounces-25492-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 30040AF94B1
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 15:52:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F0AC5C0376
	for <lists+linux-usb@lfdr.de>; Fri,  4 Jul 2025 13:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF022309DAC;
	Fri,  4 Jul 2025 13:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="cfLsj6No"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EC2F9484
	for <linux-usb@vger.kernel.org>; Fri,  4 Jul 2025 13:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637070; cv=none; b=aBJ5fMT5Kb0VXXm4FFZAVCXDhflfx4nIf98F0Kk/aYtOwb25k5YHa6wvk+YyZRULk1AuRG8yaYYtsnF5P5PgSx7ENVSlWqsODhsiC0HvQtU1/57Fi/K+ILp/1IKFhmGpz5Y4U1jTkWxMxAmvyc2s0qWU7sLeAjdQYePtfrN+SjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637070; c=relaxed/simple;
	bh=+UyVNx3d2xsOsv3hlWbLcO0faItygFtG1VFebtg95qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aMLZvPm2/YEBedljjCiJCTCqUR1x6x9LETElTQ2TqV4QyVe6FXmVzKPXp3qSuZX+hVGNKzXRyJdWeTn4Gj3chT4yIqeKTRzUNCPpy0XFPrKLWd8P1RWY/FVHgfPSwTMr0fHl0+NqdLkHE/e+NxypcTZ8AY9mQQw8fGjgObl7Mnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=cfLsj6No; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7d3f192a64eso97923085a.2
        for <linux-usb@vger.kernel.org>; Fri, 04 Jul 2025 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751637067; x=1752241867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=cfLsj6NoyhBIdaTL8glE5jE7X5IquV8u7ZkxhSFgovpE1s6lfhOrV60Ysc7Xm4knQT
         9lUFcJ6K5EOS8Yf50AKEMCbGl0IUqMdvrtNuWB9qhjplZ1mRqcCrpzpXjJ/E8ifc1bvc
         mOAfhsI+lP1aFb0Dsp9JOgsAjKZQaLkS/GqYo/70nhSQBzyvkluCFQ7rz8GOML99P0M0
         e4Ry9bOlcJ/a+bcWDfFOVSAL/zMY54g2+a5AWlPppcgDPXFOkV5bYvJUB7fkcFvg5uXc
         ZeJUakWfV+rLNoBxmUhJydw7xkwl7rDbdmFhVZHAG1pstiw35CyriCe73S36UqK8PD22
         CRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637067; x=1752241867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYQz0SJHD/yO65tyydxbBaxqDOlxtpBqpW8dxJVOqUU=;
        b=qtF4IMjxEkAhvz/8Ib66Y+5nOeDvUxtehlaBJhUF5JfIOExYy/8t8Mmb63PruOA3Jp
         g0PrJAppcPMn8N1a9iCzhNBMrlZtdU9VRy8kebuFxo2NTmsf/6hj/i79BKoBwJmJ1xB+
         Ok+or4TGXazox27C3mjOyNt6CNqbj27iOe/PbGfBgpL8h1DmhqqQOkupzwxTa9uiPeQx
         +NjoXJ/iGjsTSLuRaa65+/bPbsyK7uUUMF8l4HVvzZq8AaVqNX7uNgBn7MxpzKGXoh3l
         G9U0LZI9GMJ8Z21hDVZYGKN4zcrSSQTImZ0CP6gpGbIoGVYLLo6gZpi0Q52xZku5AUUt
         Iqgg==
X-Forwarded-Encrypted: i=1; AJvYcCWke33FLmk2xyIW+6B3UPWvVeVC6sT2BxOkzBrKhhI36VL1kFA1yd3hnp++NREOnuY5xmjjZVVBnWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8j7I+Wv0O8PWMiYZ/Hj/1kzLJSFBfS8/+Gqv0yB1bS1pZYVXy
	yeW9EeL/Lc5mkk2ZzssztgAWS2I8SqaJEqBHUcjfZOFivP1zkPlKH7fzjgaOrpZ3iA==
X-Gm-Gg: ASbGncuNflCMlzercA6AtTDBSjIkqn9uXbDOEV1GAFRt6KGPJs6Qd/Erv3AX+F6Xjlk
	AzvKeGSuQ/y+WxnAM7OnxhRZ1cc5gu24kD6Q0dfJ7veFTEbSuJQ31AFlD0e8H3tvNluSNgVoUtc
	3d7s7ZxikhYAHeEk2spbaD9es1UeOreVyU988fRg87xINKsfa0EBVepKfVG8hCo475OuIHUYshv
	Cam8ra8N2PhVJltZAn8iCFLCfg8bdBO9nwf766Xpad5jIvY6Yj4OXzKsUFW7gcvMvy+YUyv7+XV
	tXidAcvDFcxStRqARYQ83jE6g5Lnom8QhEqdlXlVXL+zOaZC+1TL3/ufPKuFOC8=
X-Google-Smtp-Source: AGHT+IGPrA4k9Zr2z8tw+Z35KFW9UzX5+1J5nLqm7+nyYdjjQoYkcLFbaNyTIqAXeMIcMfmr1ExyVw==
X-Received: by 2002:a05:620a:198f:b0:7d0:a1b1:cb0c with SMTP id af79cd13be357-7d5ddb7ada5mr262663285a.29.1751637066601;
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::4179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ac60sm12583176d6.97.2025.07.04.06.51.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 06:51:06 -0700 (PDT)
Date: Fri, 4 Jul 2025 09:51:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: ezequiel@vanguardiasur.com.ar, mchehab@kernel.org,
	laurent.pinchart@ideasonboard.com, hdegoede@redhat.com,
	gregkh@linuxfoundation.org, mingo@kernel.org, tglx@linutronix.de,
	andriy.shevchenko@linux.intel.com, viro@zeniv.linux.org.uk,
	thomas.weissschuh@linutronix.de, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH v5 1/3] usb: core: add dma-noncoherent buffer alloc and
 free API
Message-ID: <afb549d1-a7d8-47ee-83af-76faedbb55a0@rowland.harvard.edu>
References: <20250704095751.73765-1-xu.yang_2@nxp.com>
 <20250704095751.73765-2-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704095751.73765-2-xu.yang_2@nxp.com>

On Fri, Jul 04, 2025 at 05:57:49PM +0800, Xu Yang wrote:
> This will add usb_alloc_noncoherent() and usb_free_noncoherent()
> functions to support alloc and free buffer in a dma-noncoherent way.
> 
> To explicit manage the memory ownership for the kernel and device,
> this will also add usb_dma_noncoherent_sync_for_cpu/device() functions
> and call it at proper time.  The management requires the user save
> sg_table returned by usb_alloc_noncoherent() to urb->sgt.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Alan Stern <stern@rowland.harvard.edu>

