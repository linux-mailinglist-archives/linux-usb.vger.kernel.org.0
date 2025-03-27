Return-Path: <linux-usb+bounces-22232-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E60A733D3
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 15:03:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3E9A6188AFF6
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 14:02:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1272B217679;
	Thu, 27 Mar 2025 14:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gkcBeA5e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5DD79CF
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 14:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743084133; cv=none; b=VLqYSdEI7dG+KrsVGTKZ7cn8mAkXeR51oEDO47OQ17NGx00g4CVtQpn1OaE+y/6UggOEJr2iiOLDlhU71bZLazRfZ6MKR8mvfxxoyFChjUL8DEj43ZTJmVcFE2EzdxnsAQQXJ8wNoQiCi9hEoOKyam16dHFf0iARKovlwWqFnPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743084133; c=relaxed/simple;
	bh=cqf11Pz9JhbgAIl3asxDpX0Pyj8CKqlu4uBXva96xuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pD1sYC8OrhawxR5XswUsFpRVXsW5sQtnqR0Qc/IW8dKOgTKezvC+iJmt7c7SB0opbArMCBRXVmPx5gIwBJGVjXaD3lanLqo9snITSJqRV8LvgkO6Gqhkv9tEOIfO6mGSRBKhQoJ8fHbNWz/M9y+L2Bl0E45jvwILTdd77sMZKcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gkcBeA5e; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2279915e06eso21920815ad.1
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 07:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743084130; x=1743688930; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I6+lzTRwJoxGLhsBP/jpjF8an5v1mXJJ/EYMWzXoLZE=;
        b=gkcBeA5eyYOFPJgpU8WsgV5Ks9coIAQgltTVZ4dpBrzPoIcWvEcxgK8eWkcyxIZK7k
         y4B4zaHuz+1SjPFAfHRznLIlicOQdXYN/z5JuKRdEa/Cuw7z0gsY4OA/qkEm49EmZTRP
         jDtRSv2ENZ4m9FqQp/zF2l5Uhf4Mu/xZWrTDY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743084130; x=1743688930;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6+lzTRwJoxGLhsBP/jpjF8an5v1mXJJ/EYMWzXoLZE=;
        b=rddio+w2oji4k3sgukCoZmUl7PiWnMZdxYqq40hZr9hMY+b6VFjwI6ZR3oZwCvYHAC
         kHOQBAFVL6CCSaAGcfWdgyYVX7BWAlgkSIGvFWdnOLfmxQ6/jcwSvSruBl16I7meJvRd
         77LIjRznkOQB214dz51TZ/cQqmYdgASG/cFRWJbaQSVRfeSQeRPrpLTEj23L537+8wHZ
         eqWcnLIHpsrSkVBGAAoT2jd5T0qdserzUFyl8KIQZ5Z7D13BHeFlP8V6mT5tmL5s8Z/P
         ViS2a5pU2RMfqQR8X99+mL26G9jb0K/qEB/mZEfpwUTuUD5/exkn61rEmn9On8nUfELM
         4vkA==
X-Forwarded-Encrypted: i=1; AJvYcCVE7qwZBX5vYKDkXOhMxadsFZL7PdZ+6rcUol79EG/JYPW83Ci4gw2XzukTp9Kle2X2B7D5xKHjRwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzGXN9oJoJXq8+WqLCL+ougjwX6m6M8ncmAuW4RPhicmbV0Sx
	ACyJ2ocP+oKB1MSe0Jnef0jwtto7ywZaghYi8GxajvnsPQmNrmXw1io8lTCc4w==
X-Gm-Gg: ASbGncvNyFj5BWZBHXUXiq4CLRSO9YbnxFW2f/tQTrW7ckwSDQ1LYiTiPuq3A2+sJIw
	gJo8UUGTy6J++gv22nZOYdgyPCvgWmTc7TcTn2xXatVdBsLoHoLJE2n6tLT+qAefMCJxB4j5oH7
	/q2suUf+MeA1ohI49EbdNGoEBq3c4LnMcwDhxiRUDMPM0OY3wqwN4uJjmBaYc3E8h/u3z+i2c7o
	rNs1I2BO2OecJSvtGpvKqO4JORnd6OxvtKMqgwt5ao73cIsNYgd5QF+Yh6AdSsjeXlQu+QqKhXJ
	lpjL+fLRwSLjekO/q+oZTnWOPT7OdeT2TMLK9iBtzuNcVhk=
X-Google-Smtp-Source: AGHT+IG5RDX9ELKWhy7U+xRS3VIKhi043iiEwxA4WvUdw/Q6+t/DjvYPY7UK3SxprNLahK6GIimuUg==
X-Received: by 2002:a17:903:41d2:b0:224:912:153 with SMTP id d9443c01a7336-2280481cebamr53711055ad.5.1743084130287;
        Thu, 27 Mar 2025 07:02:10 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f651asm128518625ad.209.2025.03.27.07.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:02:09 -0700 (PDT)
Date: Thu, 27 Mar 2025 23:02:04 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] thunderbolt: do not double dequeue a request
Message-ID: <vxocwwtfwg3tmjm62kcz33ypsg22afccd2ua5jqymbxaxwcigf@nnydc53vu3gv>
References: <20250327114222.100293-1-senozhatsky@chromium.org>
 <20250327133756.GA3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327133756.GA3152277@black.fi.intel.com>

Hi,

On (25/03/27 15:37), Mika Westerberg wrote:
> > Another possibility can be tb_cfg_request_sync():
> > 
> > tb_cfg_request_sync()
> >  tb_cfg_request()
> >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> >  tb_cfg_request_cancel()
> >   schedule_work(&req->work) -> tb_cfg_request_dequeue()
> 
> Not sure about this one because &req->work will only be scheduled once the
> second schedule_work() should not queue it again (as far as I can tell).

If the second schedule_work() happens after a timeout, that's what
!wait_for_completion_timeout() does, then the first schedule_work()
can already execute the work by that time, and then we can schedule
the work again (but the request is already dequeued).  Am I missing
something?

> > To address the issue, do not dequeue requests that don't
> > have TB_CFG_REQUEST_ACTIVE bit set.
> 
> Just to be sure. After this change you have not seen the issue anymore
> with your testing?

Haven't tried it yet.

We just found it today, it usually takes several weeks before
we can roll out the fix to our fleet and we prefer patches from
upstream/subsystem git, so that's why we reach out to the upstream.

The 0xdead000000000122 deference is a LIST_POISON on x86_64, which
is set explicitly in list_del(), so I'd say I'm fairly confident
that we have a double list_del() in tb_cfg_request_dequeue().

