Return-Path: <linux-usb+bounces-22239-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61167A73539
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 16:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 321F6189A09C
	for <lists+linux-usb@lfdr.de>; Thu, 27 Mar 2025 15:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8172C15533F;
	Thu, 27 Mar 2025 15:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AJVKv0O2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B01146D6A
	for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 15:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743087733; cv=none; b=WJddeZ2No1KSMqkDoVwkGhSmI/dWVu/AmC1rmrDGhNpjbtf5t1Lioy3C8dkUdT/THHRkKDyJI4Jit/NM45iSt/MgDqQSHl29Jwn9GmmN3qTefHPsxhLGjkICElGZI1Md1AJBp0C8lfyE4tYmFDlSbiToBDcHSRcu68F585IroTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743087733; c=relaxed/simple;
	bh=oKZeyOlcmWhv+Tjy/QuaTCsTxF/1DkLzixlEK/75rmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5gM3YPBJ7ckiT/Q/fH7WFi8/EH9cDW91KidU9vBf7hPKmiICBRyqEeiW2pHY6Z1GoaYl1VJrcexoqxmd4+aW/WvqEwEAfYQgTamNaej9v5M/TVaU60K+A8s1Mtlyfy/4HkRa1K9e0gtif6DwmYWm7rb3CPoHt14JFicOHPky6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AJVKv0O2; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2240b4de12bso31983895ad.2
        for <linux-usb@vger.kernel.org>; Thu, 27 Mar 2025 08:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743087731; x=1743692531; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3qSWt3uvMh71gDWYUGX7+fPc1Nv/aAAnMr090z0vRF4=;
        b=AJVKv0O2k4EMl75fRcMvu0M9tmjpnWaE1kYEphmztSnDh06YEDONorwwaySRhUYjDj
         iS3oyT7yc73zK9+AO5B7lTlXsCF4N+FDzVhold73XtY8pSKqrxWytZ3Xsgte0uQeaMGf
         2L3OMscbmv+7GwRQfm2C5Valw1OqPjG3IVJoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743087731; x=1743692531;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3qSWt3uvMh71gDWYUGX7+fPc1Nv/aAAnMr090z0vRF4=;
        b=GIdFViwRU/jWfV5SiNPi6JTvXe4M7Ai0T5DNdTlHeZmnQIk1Ck09CRfYyHd7+G7FAr
         Xcd8ecQCgq5qMCg9LXzWCdpnqHvI+jtlfXfXsc/x/wQuVDYIi8whZB/HnkVutcqhtxSa
         0qO2Z+veKAig+JbZNJAMD9AdgUNu+NjAT9dSjurpYl0s5uONSA/5Qs25bselJKOlcSEU
         j2jfSnfc88JxVJy7YRJz7QxvCbJZx2jDE7m4mOSyNbMT8rGpF/SOgXeGT/bupEuiD7Nw
         bB4e9e8b8hxlNz3q/urkX2SQMdNW0Aqi2wgMrF/+OdGb0AgX+Cw1zIFWKHo2Se+Ij/Og
         qS/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKcefr0b4wXKc/5I8/8WGsQwYs4PJKgP5HBaLJYvritZEi0VSEF2/caVYh+MOjf/fUbvQ1/EQI3jM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3HSza1m5k8nVwydHgzitMtEXztv9b7B1TR50Iy/o+FadMBiBN
	ITDunrOzQbWVi5XK9htXiaZCF12xm0jpnBbfiq3JEN8O0ZcOsfIkGaiRRvZbFQ==
X-Gm-Gg: ASbGnctK/80JMdXUm//8JwbUFA+/E6FGkoPNnUQK7eAfghwmEe7y8EzXnNC/6BHvkBp
	R/SB4tgWc39gQF+jH5MM5FESaBqPxSgOJWSJKfOHl/E1XhySuF+v6fD2t/d2Rp4RfoCGsfj5xSX
	RBJVCEUX50Ih2xB9qZug3sO4bdsS3m//af0qFhdpZ2sMLA9w/26Uh3JPdMNBnbDOATcMjNdyqp+
	CK93IgkkC1VYOmt9Tm/qdeXY3CWnfFI8PcoLlnouUCFQn0rJTdfU1fo6P0JGWw/dOP19/fVePE6
	4AGFgATeGqewmU8cGuPKObHlNy5AsvRNDqluWAG1Ra9+YRE=
X-Google-Smtp-Source: AGHT+IG/IJqrqoT0m0m7gmMVPQjaTlvKtiXxSxIivb95+Nb+Y8jAJm8non/NDiXNCuNHB+d50FJhAA==
X-Received: by 2002:a17:902:cece:b0:224:255b:c92e with SMTP id d9443c01a7336-2280481d10cmr50732785ad.3.1743087729081;
        Thu, 27 Mar 2025 08:02:09 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:cd9c:961:27c5:9ceb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf93esm316675ad.154.2025.03.27.08.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 08:02:08 -0700 (PDT)
Date: Fri, 28 Mar 2025 00:02:03 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCHv2] thunderbolt: do not double dequeue a request
Message-ID: <qdbqm52rasvncb7db5ok5qfep7bfkxq34veihhrd2xdodozdbl@wltsov2h5fcz>
References: <20250327114222.100293-1-senozhatsky@chromium.org>
 <20250327133756.GA3152277@black.fi.intel.com>
 <vxocwwtfwg3tmjm62kcz33ypsg22afccd2ua5jqymbxaxwcigf@nnydc53vu3gv>
 <20250327142038.GB3152277@black.fi.intel.com>
 <jdupmjvntywimlzlhvq3rfsiwmlox6ssdtdncfe3mmo3wonzta@qwlb3wuosv66>
 <20250327145543.GC3152277@black.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250327145543.GC3152277@black.fi.intel.com>

On (25/03/27 16:55), Mika Westerberg wrote:
[..]
> > Yes, if it's scheduled.  If it's already executed then we can schedule
> > again.
> > 
> > 	tb_cfg_request_sync() {
> > 	 tb_cfg_request()
> > 	   schedule_work()
> 
> This point it runs tb_cfg_request_work() which then calls the callback
> (tb_cfg_request_complete()) before it dequeues so "done" is completed.
> 
> > 	                        executes tb_cfg_request_dequeue
> 
> > 	 wait_for_completion_timeout()
> 
> so this will return > 0 as "done" completed..
> 
> > 	   schedule_work()
> > 	                        executes tb_cfg_request_dequeue again
> 
> ..and we don't call this one.

Ah, okay, I see.  Thanks for the explanations.  I'll drop
that one from the commit message then (let me re-spin v3,
just for the history).

[..]
> > Let me see what I can do (we don't normally apply patches that
> > were not in the corresponding subsystem tree).
> > 
> > In the meantime, do you have a subsystem/driver tree that is exposed
> > to linux-next?  If so, would be cool if you can pick up the patch so
> > that it can get some extra testing via linux-next.
> 
> Yes I do, see [1] but it does not work like that. First you should make
> sure you patch works by testing it yourself and then we can pick it up for
> others to test.

Sure, if I had the H/W testing would have done by now.  OK, let me try
to work this out.

