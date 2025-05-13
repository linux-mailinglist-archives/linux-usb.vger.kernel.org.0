Return-Path: <linux-usb+bounces-23926-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8037CAB5C32
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 20:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 09ED2466251
	for <lists+linux-usb@lfdr.de>; Tue, 13 May 2025 18:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F1012BF967;
	Tue, 13 May 2025 18:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="I0iSK9PE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0136A49620
	for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 18:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747160481; cv=none; b=iLjvRf7kyfTJuSqBk70IN7kP2ab43nMT51lexWG6eeXkIjsOq+CMroOtFFNnLon1jf64GTGrGbz46LNOiMDdlqre0hQ/7+aCEAc0UDm3hRG+0KEW8IGOtydGXgncrUIkwQx3TQcOCz55VVRfN8l7XRLqw0Y4/eCLfO+1QY0yL+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747160481; c=relaxed/simple;
	bh=4krrrkk+qvTRdZq8Oj7VlqbgSsXrlUZptUPDF2S+W4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uf+HVmrHBxcJ93Ke39wuSfRsY71SvcPPziujDl5XGKnJYldFI4stybhpgPqTi9oyUN4GytezOM4Wch7L6OVzE8N3LYAyYLoO8GjeatBGKNCQ/t2HZpvZIA+RhKgu0UBdFdQllsvy/hFjfUC/FkOwTcGhbmLnkSwiE+WOKqe/3v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=I0iSK9PE; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5ba363f1aso955957785a.0
        for <linux-usb@vger.kernel.org>; Tue, 13 May 2025 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747160479; x=1747765279; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5FEkWrhFTB0AYSizXj2l3QrnN5yD1XiBhFmHN6RK7Y=;
        b=I0iSK9PEgSOcxDxpGAH2DTg+LNKRcmB+BTiIsXB0tZeUghlUajwF6l/MQNGvj+axbZ
         K7lSD2VNcaQcCJwPoZuMndN9lqIKKw+utMebpfz8r7VBmyFbJ3I5XLCdwy+4VMbL5Sfc
         JX11hT6g39FukUPjVPKAV6gV91BgqJq2asT71BKXYbTSMB39lUzGTcHpQ5BihmlJLOnb
         0FGGM99cQDluuqz/KWAXLAborwmhMApNTGc/TLUDjFSJtIneDBZAjT0NTYbEeST4ItWI
         hTWxNPvIvSpvl9KHHdsl5qpHMSQ9gA1pIz2I3bv4FlAUrJnQDQ24nUHOdB/r5siMijzJ
         f2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747160479; x=1747765279;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5FEkWrhFTB0AYSizXj2l3QrnN5yD1XiBhFmHN6RK7Y=;
        b=UG5mjPwqX+ruZyVZV7ruXeR1NLfrFg5dku05hf1h1FpNX9V91/xf3crqSlyoBVc8Q2
         dy/h2hf1CXtU04czH+CmTL7qcHeY4b76Xcm0VyJeSdp41fHEH25rPEfFBrq1X4GlGskq
         g8uo2l+yaKnrv2vc0naE9AIyHtPir+deK9M1aGB9HcBtCvMI6R8ePu+KLKRNOhh+mZ7u
         Fb77OEAnGd6sCjtDLGAa0hJcVZk9ryC5dT/dj6hbmWkWTnHILg3I0YzczPmZq9LhYrHS
         IwglKDI2BIY3BG4ZVFDLWyKQzL6Q4jBabqBvW11BBTSKyo6D39UnbF6Y9pW920VFA0oK
         yMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxsc9HNys+AWXG3nqso7ZSl9SQAjW5os/4qfsHWrp1y2L9A4V+jKSNSNjlSneQBY4/+E7dPbW5bK4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyD+UoDQV5VLKT2Gza32PWMl/JVgCAdr3V+RCD3D/6RDrb1faP3
	28R2jNVbfQwFM6crfvg0vVBapYI40/02BnXIXNuo8EDBw+CiXydVYs2Qniz8p44yTzIWQnV/1gE
	=
X-Gm-Gg: ASbGncuf4agVkLqfbgLQuSGZXXS9U8n2bgYJnDTw+Dqj1OpDyKVQXSBGPUSsWSC9IUC
	bmCaBNThhj5oq6fALffGtPxp2RPiYp+csf9k2K+RRTMtLdATNkkfvd5wXQvInZQ8VAka7widKhQ
	YtM7cCk/CiSNGqxq1D425DXClj/MI3Y/KbBgzgnlCBF0D1CxKKVJEUESlmPIJWElwJjxd6g18Ra
	bZkWU1AbON9dDB9LYme/q3mvabTIxiCTRNGu1itXdjGyZ3EUvONyzpz25MxqQ3UiSqibC/FwYPt
	NDyDVGTmk/KctGWQnly7TVTibxUlpUqB3UzH5JqLOBYMqhStOWhhDG9l1rDI1wlizDRpRhyCH9X
	NyOCBTeiQvKczJ4KhE/IXH5EjtEPjyoQUgM4sNQ2jKCrz
X-Google-Smtp-Source: AGHT+IGRY40xVfY04DZzaweSZEI+V00K04ooAl3VLrFIxOl4r9nnSls4np3LTjoxQcIlORjdTh8NYQ==
X-Received: by 2002:a05:620a:4404:b0:7c9:23c7:a92f with SMTP id af79cd13be357-7cd287f91bfmr88428185a.1.1747160478856;
        Tue, 13 May 2025 11:21:18 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-28.harvard-secure.wrls.harvard.edu. [65.112.8.28])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f9af25sm729427185a.63.2025.05.13.11.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 11:21:18 -0700 (PDT)
Date: Tue, 13 May 2025 14:21:15 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org, oneukum@suse.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
Message-ID: <ed0c2f75-f97b-4cad-ad35-78361edf142b@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <8c963ad0-a38f-4627-be11-80ccb669d006@rowland.harvard.edu>
 <69accee9.accf.196ca18308a.Coremail.00107082@163.com>
 <b334ef97-1f79-4dd9-98f6-8fd7f360101e@rowland.harvard.edu>
 <40618da9.b062.196ca805193.Coremail.00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <40618da9.b062.196ca805193.Coremail.00107082@163.com>

On Wed, May 14, 2025 at 12:35:29AM +0800, David Wang wrote:
> 
> At 2025-05-13 23:37:20, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >> I have to disagree,  your suggestion has no much difference from requesting memory from
> >> system, locks and memory pool managements, all the same are needed, why bother?
> >
> >There are two differences.  First, xhci-hcd already has its own lock 
> >that it acquires when enqueuing or dequeuing URBs, so no additional 
> >locks would be needed.  Second, complicated memory pool management isn't 
> >necessary; the management can be extremely simple.  (For example, 
> >Mathias suggested just reusing the most recently released memory area 
> >unless it is too small.)
> 
> My patch also just reuse memory,  in a simpler way I would argue....

I didn't say your approach wasn't simple.  I said that my approach has 
very low overhead, a lot lower than the existing code, whereas you said 
my approach "has no much difference" from the existing code.

> >> >This idea can become more elaborate if you maintain separate free lists 
> >> >for different devices, or even for different endpoints, or sort the free 
> >> >list by the size of the memory areas.  But the basic idea is always the 
> >> >same: Don't change usbcore (including struct urb), and make getting and 
> >> >releasing the extra memory areas have extremely low overhead.
> >> 
> >> Why implements a device level memory pool would have extremely low overhead?
> >
> >Because then getting or releasing memory areas from the pool could be 
> >carried out just by manipulating a couple of pointers.
> 
> A couple of pointers manipulation? and it would be simpler than a reusable buffer in URB?
>  I doubt that.

I didn't say pointer manipulation was simpler than a reusable buffer.  I 
said that it was very low overhead, in order to answer your question: 
"Why implements a device level memory pool would have extremely low 
overhead?"

> There would be lots of details needs to consider,  detail is devil and that why we prefer simpler solution,
> I just don't understand, you seems imply that my patch is not simple, could you elaborate more on it,
> or it is just that in my mind, make changes to "usb core" is a big no-no!

Neither one.
  
However, you have forgotten about one thing: With your patch, each URB 
maintains ownership of a memory area even when the URB is not in use.  
With the existing code, that memory is freed when the URB is not in use, 
and with my approach the memory is shared among URBs.

In this way, your patch will use more memory than the existing code or 
my approach.  The question to answer is which is better: Using more 
memory (your patch) or using more time (the allocations and 
deallocations in the existing code or my approach)?

> >If I were redesigning Linux's entire USB stack from the beginning, I 
> >would change it so that URBs would be dedicated to particular host 
> >controllers and endpoint types -- maybe even to particular endpoints.  
> >They would contain all the additional memory required for the HCD to use 
> >them, all pre-allocated, so that dynamic allocation would not be needed 
> >during normal use.  (The gadget subsystem behaves this way already.)
> >
> >Such a drastic change isn't feasible at this point, although what you 
> >are suggesting is a step in that direction.  In the end it comes down 
> >to a time/space tradeoff, and it's very difficult to know what the best 
> >balance is.
> Drastic change? Do you mean make change to USB core?

No, I meant redesigning the entire USB stack.  It would require changing 
all the USB drivers to allocate URBs differently from the way they do 
now.  And changing every HC driver to preallocate the memory it needs to 
perform transfers.  I think you can agree that would be a pretty drastic 
change.

>  Because counting by
> lines of changes in this patch, I feel my patch is quite simple and efficient.
> I also don't get your time/space tradeoff here,  are you talking about my patch?
> or you were just talking a solution in your mind....

Both.  See my comment above.

> This patch only needs a pointer and a size in URB, and URB object allocated in a slow pace...

It also needs an extra memory area that is allocated the first time the 
URB is used, and is not deallocated until the URB is destroyed.  You 
seem to be ignoring this fact.

Alan Stern

