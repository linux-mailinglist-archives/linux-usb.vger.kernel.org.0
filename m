Return-Path: <linux-usb+bounces-26779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AE759B23DC1
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 03:39:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D9723B9344
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 01:38:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C3B71A073F;
	Wed, 13 Aug 2025 01:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="fs244+1q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F4A199934
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 01:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755049107; cv=none; b=puTvUoWQ+patZH//wcsAYZ/8T5lXefvHmiHdjQu+awuqlbRLjy8DbiWX43FuUTztvfibKoHQB7DHzzvRz4psHtyvoNijnXlXo6VWX8CTuD4tsJSoewZcdIYu8szOT6kQyhGJD3/KaXd6+UCnLkHLLUGz+mUhIEEqyFcMWYIFM3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755049107; c=relaxed/simple;
	bh=avQTEeDafSyhCSMD6MZeCRj3kg+eXD4fd3LS9e3ITyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1mQEqJlC6OcfBBiA/quqKTh7kHNBvtX4YSp0/srQJ1t5nV32TLvQ1h5a6v53tvIHMVsW3IGlRiRaFYstHe7syYtCUdmwzQXFwgx3amF3WuJ4i0RQ5kvRp245RYRbrQvZbFq0Mn/+sV0Xi7vg5oJ5hMVMixdRbH3uPllXdghBTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=fs244+1q; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-7094f298dc3so53524286d6.2
        for <linux-usb@vger.kernel.org>; Tue, 12 Aug 2025 18:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1755049104; x=1755653904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf1ks6JUZ1IFFm+2x9B7TBmLSYkbRnh2E4KrA/6BMZ4=;
        b=fs244+1qnyRm1qIZqwQcPpjk+RsIreXF5lOHdIq42Gq3r/EOyPU9LggtaTFoxGJIm/
         RyHpbdAB2lPa0YOhzA47RR3uyuoS6OEV/dORknbvTfjt+b5vOuezbwecrHuVxd/XT9AF
         XlhgMcf+22ipAzOh3U1zhtilOuOWb0CuylN2zG8U9UsyTVK3F4T2ucXXXK1/phZ8jlT6
         9PHuow48+gJZsCw9y5jVnF13/QBKVDK/m2m9030+DDE0tMFPw/4x3MmflrvSlC5JwYDv
         RxEwcrCpHifO9xu3UqlrIRB43Gjc/o09+ocazLI7oVNATAYmYr/Nn2D1JJ6RGMiQOxvx
         7qVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755049104; x=1755653904;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xf1ks6JUZ1IFFm+2x9B7TBmLSYkbRnh2E4KrA/6BMZ4=;
        b=ZNRcNgL+uvDx2pacpDfzHkUXlCN0mBRxIJuxa6JzyqB7eXDT86vwEsnc0z1vij/Pqg
         OoJUesKqQaMAs+84mDEx9n3kaAxz0H6lPfjM2IngZrA8yf3dziDr6YcAxumrzTfuXzpz
         /CFQ095Rhc9cjwGoPhP/H49LnNDa47PDCr2AKEuS9DyGnoOpT1OOBmZJlCWvMdKwajZY
         9dGyhyvxpme47mkALUMtrJMlE8LeQc5UDmkhFII3TrmQEDzyuwT3kt2cewImT798O762
         EbmMlbzlKGoXMMH8KA4/Go39DiZEPTsaQeaW2+KmaRhscU2ccfc0FsYDTMbpdHOS7LsC
         Zhmg==
X-Forwarded-Encrypted: i=1; AJvYcCVJfYqps75vEN4JE2zTrmJk/ywwJaME3cC4wnHPuN+Fa5hjH+L2dXkZ41zrWbgU5yXQEVDzkUk/CWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDx7vQ9laqCWBHsY1HlvMjhA+kv7f3ulQCBIWUqq33WoJKtuTD
	+rWMSQa8Wf9vBv2f5aMY8dkiKbOD5g0G6qbXeEgDqEpLXPRpQGdEeGEA+XL4kr28zohshy66utB
	2PoE=
X-Gm-Gg: ASbGncubCD7PvR1a+yPyweE0ATHIAyTiXv8V1EBPY0Z4q+8+M1gxk1cIs9HdFkf0k5N
	obiAV3zhw9mGUiP/eq7I0qO9TvguH2P2zLq+3DnJm4mFLYtZ+sBqtkDn8enEytkJJ5z9UFNhhgP
	Rm2XGyNaIuMTxaLJzZk28uvCME8p6TawXXlRomWYJr+bQoV3BC8jFO9MKHKAly+iPVYuP0NhqEk
	SJRHgpO27OdpETmKj+/nXH6iJkOTUAHk5BmNBF0cyYXMaTaKw7fvd3BenfJfxbZFhZKJO+iCXCz
	BxeDLdKbqYOX93rJ1snk8Pqn0OxnSIuBBTf5+h/hUMgHYYFWsWxCym1b6tE9bnR5nW8hv0pCHOe
	cRebTOKXO43DfwldNDGSmKsY=
X-Google-Smtp-Source: AGHT+IFxLiXaFFD0/y9Ma0z0+T0y1/ZnYdoI8nKVbc4lPZ5ngJrX1uRpLH/2uUXlst7kCQpz8X72nw==
X-Received: by 2002:a05:6214:21c2:b0:707:5ca4:baa5 with SMTP id 6a1803df08f44-709e85868ebmr17221766d6.0.1755049104308;
        Tue, 12 Aug 2025 18:38:24 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::fa48])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ce39fb3sm186698816d6.82.2025.08.12.18.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 18:38:23 -0700 (PDT)
Date: Tue, 12 Aug 2025 21:38:20 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org
Subject: Re: [usb-storage] Re: [PATCH] usb: storage: realtek_cr: Simplify
 rts51x_bulk_transport()
Message-ID: <49559415-4493-4b90-a9bc-c6b9074a61f6@rowland.harvard.edu>
References: <20250812144358.122154-1-thorsten.blum@linux.dev>
 <b11a19b6-9fb3-4fdc-b94e-33ff01a634b3@rowland.harvard.edu>
 <19E72C72-AFD3-4D13-8F14-9A1F96B971D3@linux.dev>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19E72C72-AFD3-4D13-8F14-9A1F96B971D3@linux.dev>

On Tue, Aug 12, 2025 at 11:28:56PM +0200, Thorsten Blum wrote:
> Hi Alan,
> 
> On 12. Aug 2025, at 22:06, Alan Stern wrote:
> > On Tue, Aug 12, 2025 at 04:43:58PM +0200, Thorsten Blum wrote:
> >> Change the function parameter 'buf_len' from 'int' to 'unsigned int' and
> >> only update the local variable 'residue' if needed.
> >> 
> >> Update the rts51x_read_status() function signature accordingly.
> > 
> > That last part isn't really necessary, is it?  It doesn't make the code 
> > any clearer, less buggy, or quicker to execute.
> 
> It's mostly for consistency because the parameter 'len' is used to call
> rts51x_bulk_transport() which now expects an unsigned integer. I'd still
> argue that it makes the code and the function signature a bit clearer
> because now the type communicates that 'len' cannot be negative.
> 
> >> 	- if (residue)
> >> 		- residue = residue < buf_len ? residue : buf_len;
> >> 	+ if (residue > buf_len)
> >> 		+ residue = buf_len;
> > 
> > This really has nothing at all to do with whether buf_len is a signed 
> > quantity -- it should never be negative.  (And I have no idea why the 
> > original code includes that test for residue being nonzero.)
> 
> I agree with "it should never be negative" and ideally the type should
> reflect this if possible.
> 
> It's also easier to reason about the code when comparing two unsigned
> integers than having to think about implicit type conversion.
> 
> > Much more serious is something you didn't change: Just above these lines 
> > it says:
> > 
> > 	residue = bcs->Residue;
> > 
> > It should say:
> > 
> > 	residue = le32_to_cpu(bcs->Residue);
> 
> That should probably be another patch, no?

So we're really talking about three separate things:

	Making buf_len and len unsigned;

	Simplifying the calculation of residue;

	Using the correct byte order for bcs->Residue.

The last one fixes a real bug; the other two are very minor by 
comparison.  Regardless, they should be in three separate patches.

If you would like to submit three new patches, please do.

Alan Stern

