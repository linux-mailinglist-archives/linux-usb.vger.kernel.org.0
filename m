Return-Path: <linux-usb+bounces-23868-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE71AB3C3D
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 17:35:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C125B46179F
	for <lists+linux-usb@lfdr.de>; Mon, 12 May 2025 15:34:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8754323C510;
	Mon, 12 May 2025 15:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="l/ds3KL6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F09423C500
	for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 15:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747064087; cv=none; b=OZRQ+kjZZ1BCO3krsmPDM/QHXhi2iEg7gvl7jH9aMCw5fjDlBz+G/vS3R6DxSv722GYVlz/hEzHUg615LUbTvm2EOcXCGNpKhT6ywWd2fRtZUFfI9kOV8vvZqgfXaq7DzLYuuug5UuYkY7uCz2LsQ3DOZ6TAP3zi1kgGlRhCRS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747064087; c=relaxed/simple;
	bh=BUkwgzL+MSLKCC2+REuz9ThllAAWTrnd1vUtZmKWiw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rsus+vOvCWe1OAf23yVHAxsvslHvpTczda+fU/gYOVH9yGD6oyRr/434Du7j4l75YqcncfBrJvcSf2I35DSFoO9z5H3v1ZA53Ot11SMbG1iTRlpufhZqlNf/bhRzSLHEBPHY7/daz/svljGQ3VWvGBh4bxJEfn2qanIrwNTB3h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=l/ds3KL6; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-47ae894e9b7so87096671cf.3
        for <linux-usb@vger.kernel.org>; Mon, 12 May 2025 08:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1747064084; x=1747668884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h2IEqsFP6mbIlWzLtUHadM7bvGmNt6W1aQGNu23yom0=;
        b=l/ds3KL6tIKam7TSWf/Lf6ADIj5Swve9HbgiBkjBGdDRDKRgbbrex+Br/9SfHoGomZ
         AB464YIvyLqxMrdFZXeC1W4OqtPmJQ8+J2OgKQxCmg+kR9zPXmLS/O5byP65rua0CXyO
         mwl6Evy5G7nuZKDGl8GuQKKjxkkdke6fp4wDdG3mMfHXPiIWw5WZKBwrgqri7clvHs2l
         e4oil6u/pelzIpls1rlyK5daKsVFbZ3kaYWf5Z1dnK2BBS+b60hSitx9HBLrKeMHi9Qg
         RjuJLDDM1hK8Ij3CIghuELrU23HbS/btYr9yyTwYRXH70rKDBDKIZFhiTy452I2O9RYF
         udKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064084; x=1747668884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2IEqsFP6mbIlWzLtUHadM7bvGmNt6W1aQGNu23yom0=;
        b=WCQBHrWJknXfKvnF7xofxlza8SypexQYwBy1nR033wn1PeUol1zYqYrOtY+d+UJFTy
         hcAKhxwk5x0ue/AxrP8tAHij6T/RDmNwKSyYAnLAuQm35poR/NG8Vo4LlWMj8nflgJBZ
         3Xw06HsGX3DXHa4oDsWo5iocK7UP7XoJuyb1XD4VF39nq/btAaCjo6xGhZ/DiCtH0dLH
         mMDBGl0Gc69ygSivVbSQDHj/lwDA7v2/JPZz8v9+pMIZSQXfAyIlnaIkCJlJ6t0z5jDI
         1bUDsvW2MpPXoa0AUDgJqIqdU/x2nM0tLlR9sjBfFNDZT3l/BBM9x2r0gcb7SscX4RGm
         gAWQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfTHMpC7slMN6s/tNdFJU3M4hNHhd09fdS60QbizKbQHUz2zVcVYm98F8Hpc6X/Ary/5DSrpw9lSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjg3BdkLrTF70wK0Ekzy6RLsAY53zXG57CKivi+sB4V7c+C2n6
	ds2gEhst77UTgqjnuesb5mij5cw5AmXReJ2z41Wk5fqtKkw3wqwKv+ZJf3j7Cw==
X-Gm-Gg: ASbGncs1K1570PvA/9DOTaDgBmttOg51qGf9E0o/YunVHS7V64jZzStVAiY75sG+TBA
	8EdDWbAnmFt9GUqiumTkQ0Eb9NJnGp4x3nP9xqFLvC3XcmjO382uqz1hROVJOrFgfNV24wyYbYV
	uecjiWOb0HgGLmSWOtgTxPUKczIa01mewkcI4cTgFiqEoiKOEXGyp7erNe9eAEjVPSq1rLqYWke
	ZNDIFaL6gnjz9yjnjrCXhLUey5VJpw7BwlsViqlx3GfRjbtipi65MgOTbePagikbJT/R+fDbLYE
	CSdGbEIuULAXdyyTbrpHk1IW5LhDe1Tj+2M4MrORjewsyIX3WwIORHWHcdSxyiHG0IOBSLDy5E7
	av8+H
X-Google-Smtp-Source: AGHT+IH8OuHVn8EU95Z0dn+sa4fi7WbCN1/rL8STfDNceTR/nqBxCTh41lLOcwUGLyaoM7eK6RifBA==
X-Received: by 2002:a05:622a:14b:b0:478:f4bd:8b8e with SMTP id d75a77b69052e-494527deb21mr217626471cf.39.1747064084310;
        Mon, 12 May 2025 08:34:44 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4945259e3acsm51685791cf.72.2025.05.12.08.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 08:34:43 -0700 (PDT)
Date: Mon, 12 May 2025 11:34:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: David Wang <00107082@163.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	surenb@google.com, kent.overstreet@linux.dev
Subject: Re: [RFC] USB: core/xhci: add a buffer in urb for host controller
 private data
Message-ID: <7fd35044-3719-44c1-b4cf-89551e27da26@rowland.harvard.edu>
References: <20250512150724.4560-1-00107082@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512150724.4560-1-00107082@163.com>

On Mon, May 12, 2025 at 11:07:24PM +0800, David Wang wrote:
> ---
> I was checking memory allocation behaviors (via memory profiling[1]),
> when I notice a high frequent memory allocation in xhci_urb_enqueue, about
> 250/s when using a USB webcam. If those alloced buffer could be kept and
> reused, lots of memory allocations could be avoid over time.
> 
> This patch is just a POC, about 0/s memory allocation in xhci with this
> patch, when I use my USB devices, webcam/keyboard/mouse. 
> 
> A dynamic cached memory would be better: URB keep host controller's
> private data, if larger size buffer needed for private data, old buffer
> released and a larger buffer alloced.

This sounds like a better approach; you should try it.  Allocations and 
dellocations from a private memory pool can be really quick.  And it 
wouldn't waste space on buffers for URBs that don't need them (for 
example, URBs used with other host controller drivers).

Alan Stern

