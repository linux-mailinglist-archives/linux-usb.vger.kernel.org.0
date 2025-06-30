Return-Path: <linux-usb+bounces-25313-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC1EAEE0A1
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 16:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0D716EC7B
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jun 2025 14:27:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A5428C5AB;
	Mon, 30 Jun 2025 14:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EG/YWAIu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3568228C013
	for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 14:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751293622; cv=none; b=oDFggqfMLmUwmIWPWCCWxZoYvIXsDQukkseeGvHVu93jCKQz/Rdg+nUpwRFJHq/xCemywlwLBh+cbYYNh8IAsJOP2rrbJJYAX0Zx0aXrjPm4cnRbrmW0ualZk62/djnI3/9XK5S6k0V/ORKAKUScZWqnOYlPnM9nis0xc9un2pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751293622; c=relaxed/simple;
	bh=7df/gHAWH0M/f2MpyrA6jV7WVUOkgH08YWsrx7B+PdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NTkazLhb52THyjpT+uCfmrw/N1nG/0h5r/o7MKdTLiDyfy9x6gj0NWAy6L7yc92SXS5KHKjCAuAVn6W3RxzBhAsrxwyb1VXhGlgLmIU5FvflNINUNbVzv7Q2Q6/a2fsubU5NmLcCqB1YR8YmkLTcCPElokBDDjk2ZyZ8b0snAUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EG/YWAIu; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70109af5f70so2185996d6.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jun 2025 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1751293620; x=1751898420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D+xcDwEq0XwCHZxX9UAE0a2YYZ7EsQktIBuBGKcEcZU=;
        b=EG/YWAIu/eCvqntLnComTkT8FFTNNvOcyWBxPXO/jLdWyw0I4NM7eMhFX1GDIqPe6V
         jfhqx4oJJuIoiUCx4n93k86aVZ9yF1vt5lUbq1R+PAMFpbOp07E/+h0ZjDzz62h0LF6w
         xjjgIH96yp36baoprivT3yUfFRMl54cy1gVUNqvDEZ8QjJoJVgFP63nWMN6YA82sb6xt
         lPI7hjW7aY6njBca0TVPWKW2c35fAPB0RyoRHZBa4TU7btfpl2aE1aXBzZnZVUJ5D6VU
         l+zNnFpNrTyznmx73pqBztHG2NxjnLcxDP2gEEE5Hla5Ozz+ElZ784ORLL7CF8LTDVtG
         ieSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751293620; x=1751898420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+xcDwEq0XwCHZxX9UAE0a2YYZ7EsQktIBuBGKcEcZU=;
        b=Hm5f+xjn1YeWN9pIXv8XFQYcmbdKX/W/cGQdQcmOS4M8jCBEUA6wSi2EZxIEwSHjXW
         QO8rBgTZBnpjJAMthaIJAScbXg5p5M0d/cfw799JXVm4MRefcwfdYZE6NppWTVf4npr7
         qxzUn0YBqUHJYUtB8BWR1RmuUcq2nytvFcQRCG+TGwGbM5jMwWo/MHYcURCFy7x603Lg
         M/pg39HPv3MbF0PYftvTsK4SPijJRsbjhrzvnGvuFKS0mpk54VQF64jCrEFc06B2sU74
         5ZU/NWrKr+cYcVdXsXEm9KFNyKLd125NCB8SDBCIup1yNhJutvvEL/VeK24u46uIhwHO
         HGyA==
X-Forwarded-Encrypted: i=1; AJvYcCVKTxFn0bNvLE+VDNoQ5gqvDFQLYGAM0oLVGsphcMNb9OtzfBC/wEAd8FzbO25DQs3sG9d1Ah0Zrr8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHMFGICy/Cgxu1Uyth6BflJlvywoEKl3yqBuQU+6dUpWeuVEhi
	YT8q+tf+Xl+oThFjerM0VjPJta8suwvtKm01cbCMuLl4/aS0THm3W7i6JGiooNrfnWcgdalCFOC
	MBPo=
X-Gm-Gg: ASbGncvpekJaM3qB9F8Ix2r0ubiOqL7BC3vqirKOOfApaNnf+4OHMlWj6+BU/V/d6mX
	Vmcd/Rd0m9GcBciuzwqAjrHIAoYzi+O51QTwb4Dj4ls8Gp9yat4r9gJv9jRh0BzqPjMTzwjXdVG
	OA2sD1WElHb5Z8qqEhyQdDmxufZ3AVgmCt+VV4ob61/CkAiB9YAHyvI3C+fBhcmq8j/GGBOD2Dk
	vJ+kNm5MdBkZRleiyEiGtILui45fpgZZVxjAtPnkMNX8Nu2wdr8RucPUfwjbm3FK5NiMc4n8cFO
	c0Bb1eyfvq7HxUaNg2TWYj2lzbXpR5vjnvOrnZyihR4rrkhFnakvAVHFRkZVIgAiIFwGn8DciDz
	lWeJx
X-Google-Smtp-Source: AGHT+IGY71+jbGJGdpeo34rJwHVbWIWI7MBxdTgHTS5TcnXdjbDpLxKSROASFBgY8g61d7fTealGHQ==
X-Received: by 2002:a05:6214:262f:b0:6fa:c55e:869 with SMTP id 6a1803df08f44-70002ee7d42mr264779196d6.23.1751293619811;
        Mon, 30 Jun 2025 07:26:59 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ae40sm68454576d6.106.2025.06.30.07.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:26:59 -0700 (PDT)
Date: Mon, 30 Jun 2025 10:26:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, viro@zeniv.linux.org.uk,
	linux-usb@vger.kernel.org, imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: mon_text: find valid buffer offset for iso transfer
Message-ID: <57695560-d6ef-49bc-976e-836ddc903d13@rowland.harvard.edu>
References: <20250627105651.3653231-1-xu.yang_2@nxp.com>
 <8a251c8b-5ec6-4238-bdcd-8d8001fd06df@rowland.harvard.edu>
 <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zbxioq4jk2ykd3alu5j6igmgzmsuainlwelhvl5lhz3iczcqyv@uspbdfpyj36j>

On Mon, Jun 30, 2025 at 05:13:31PM +0800, Xu Yang wrote:
> Hi Alan,
> 
> On Fri, Jun 27, 2025 at 10:28:53AM -0400, Alan Stern wrote:
> > On Fri, Jun 27, 2025 at 06:56:51PM +0800, Xu Yang wrote:
> > > The valid data doesn't always begin at the buffer head in case
> > > iso_frame_desc is larger than 1. Otherwise, the output info will be
> > > meaningless.
> > 
> > Not so.  usbmon intentionally copies the entire isochronous transfer 
> > buffer, even if only part of it was used for the actual transfer.
> 
> Ah, I see USB monitor only copies DATA_MAX (32) bytes data for mon_text.
> For mon_bin it copies entire transfer length data. So I think whether
> the data is valid or not matters for mon_text.

Given that nobody has complained about the way it works, after many 
years, changing it probably isn't really necessary.

Furthermore, I suspect there are no usages where the transfer 
doesn't start from the beginning of the buffer.

So overall, I guess this change won't make any noticeable difference.  
But theoretically, how would the user know that the usbmon output didn't 
start at the beginning of the buffer?  I think you would need to update 
the documentation as well as the code.

> > > +	if (usb_pipeisoc(urb->pipe)) {
> > > +		isoc_desc = urb->iso_frame_desc;
> > > +		for (i = 0; i < urb->number_of_packets &&
> > > +		     !isoc_desc[i].actual_length; i++)
> > > +			continue;
> > > +		offset = isoc_desc[i].offset;
> > > +	}
> > > +
> > >  	if (urb->num_sgs == 0) {
> > > -		src = urb->transfer_buffer;
> > > +		src = urb->transfer_buffer + offset;
> > >  		if (src == NULL)
> > >  			return 'Z';	/* '0' would be not as pretty. */
> > >  	} else {
> > 
> > And how come you didn't modify this branch of the "if"?
> 
> I looked into it, but didn't find any ISO transfer usecase using sglist
> to manage data, so I skipped it. I'm not sure if my understanding is
> correct, do you have any ideas on sglist?

I'm not aware of any use cases like that either.

By the way, this code runs for both IN and OUT transfers.  But for OUT 
transfers, the actual_length field will always be 0 (because for OUT, 
the buffer data is copied before the USB transfer occurs).  So the code 
you're adding would skip the entire transfer buffer!

Alan Stern

