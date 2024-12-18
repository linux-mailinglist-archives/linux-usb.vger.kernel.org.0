Return-Path: <linux-usb+bounces-18650-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F66B9F6ABE
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 17:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 61F8E188842A
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 16:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E1A1E9B0D;
	Wed, 18 Dec 2024 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dlacpFKf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836AC1A23AB
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 16:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734538157; cv=none; b=uc/ru//QHDu1xAK9HId3Kd9cbvn7npN6Igh8RuWJJf5G4vzbKVg4Vo8KVk3zSORw3Arbj37KSoRlI7h/Dkff5hmsPqG6XH8sIMqnjZ+lb4WmyDr28OjZ/lyYTT0FvDnfExUfDfH83aGHFRtCPvROKQL19ETGAdOkfsOqA6ZFyAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734538157; c=relaxed/simple;
	bh=KqVDof9HwQ/qROb5K+N4ycQGH4PqCsXkAz/QJWs39ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FqC88MU9IlPWwDqrr0vlrQNG5QJjTzGlnwu/kTyoA3LpEPUhoqtE4JaNJDTzVD+5vqHo6fok46/h6yCe7xEL3PhEmd0okVaoiO5Nck1dyB742cu5jhfJ/sXBAUk+I1tXL+7Rmx9WK2wojWjtm34gefPymorxT9FFM9JupI0Gq0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dlacpFKf; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4678afeb133so7942331cf.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 08:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734538153; x=1735142953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcp3mswTulzMNfWqsdhygEUnJCvYOSqBSTgGW1curpg=;
        b=dlacpFKf5boRwXqJl6OJdEe8tvJpZjVD9BUu2Cqhi0aVb3Ow+h9YwEZSyRF0MzActH
         GkeziroNHzRDM81aBp07KArmSOJFXbX+yA29kllIssDjhSQhPkToY1Jyy0+7sn4F0qYC
         HxAJ5JR3/wVQ+14kZS9/WbA98/xXI/F+eIRJjCp2rn05gbyr1VrbW1Z/7NfPmQTxT88Z
         Bj4OOKvaCAVR3nL/NroRtwTgkttcpUXuECfPuCGUrNFIeZW8Bf2oqov5uue5mVMrc1Bn
         l9o5kl7H5qrhRO3qcaiIxzyJCE8jByAREijtvw6Ss6cWWN3hj1PDtoPxjl1/sLKihXRd
         fdvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734538153; x=1735142953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qcp3mswTulzMNfWqsdhygEUnJCvYOSqBSTgGW1curpg=;
        b=kHnW2XqbAz9XbWG0lc/aywqul8rTodnBB/x68+kYDzp7Vpa8NWfrekyaWSienB2xRQ
         3ozpI7tEiEiGotQyoTnXASBClPpYMUb4XvkajpMYuQ3FNABpkmnTqE/yPye+b2dgPp6I
         KyzEucrP1jrAHzBefzQ5hCQI+hz1Cltg066HwO50MGfBPmkleu9iyfLT4hMbU9u1s6P2
         taKL3DELdmWuvgRERr+G+7hWBxNUJN/t3HmYhP3ord5T1CnFiep5/gCIfXi8usq+YZ8q
         iof5fVOkneul93HjshVurWgCBu2TX7z1UqA0ncoRDn9OLnt6ytyIXOO5LxS8DA65+A3V
         8icQ==
X-Gm-Message-State: AOJu0YyZlIrv57y2BrbOlFtupNKZF4NZBkvg11N2PYD2Rassf6Al3t2y
	E9+d+IRl4pxirx+7A+RwegHeFxxhpzMJjoNzc3jDyHwg7zavKVdm1fN29VHfukkGf8Fu06Gu65p
	fCg==
X-Gm-Gg: ASbGnctbZ1HMJ8gXooV6V8/4kZn4Rd9A0Yf5yjcHy+nRL5eg627PGXFIW8Wl4kRQSC1
	e6e4s0e8OOKnGtoq7sf0QCR/phkuNDUv2ta0a7jZgeFJmUX/3DF8Z54m03z4tWPfhiTMvAxpRlE
	DsEqvZQ0GzJFdDMDICF6Y3LDk/G+qH/VyrFMJCPLGX2tT9ENPcdm+2mdYh1lzDEnGgwGTVstlgw
	HtV4K8mc/O7FaOW8y9gyBlt/U4fVBJNXM/aQlTkE+QVSLjHvXCnpeACmaELzEjjPIhhLzmYj2o=
X-Google-Smtp-Source: AGHT+IGXu63xP85mEnuPzELTde8pfr45aSMAVDRQdy8W5Jr4KE7hEkDiCRSjxprWw0h83ZcYNiz8tQ==
X-Received: by 2002:ac8:5a50:0:b0:467:72c1:7084 with SMTP id d75a77b69052e-468f8c06fc3mr129459931cf.0.1734538153376;
        Wed, 18 Dec 2024 08:09:13 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2ca4748sm52178211cf.33.2024.12.18.08.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 08:09:12 -0800 (PST)
Date: Wed, 18 Dec 2024 11:09:09 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Markus Rechberger <linuxusb.ml@sundtek.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Autosuspend
Message-ID: <4c30ebdf-861e-4c0e-9a10-37529c037df4@rowland.harvard.edu>
References: <77b79e95c092511a695ac0b6a8eade57b12ff3db.camel@sundtek.de>
 <3e9d6d03-eed7-4f46-9926-4d395c0bc46d@rowland.harvard.edu>
 <4e5403bfeaa656a42f145c217ccc7e58c993bca6.camel@sundtek.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4e5403bfeaa656a42f145c217ccc7e58c993bca6.camel@sundtek.de>

On Wed, Dec 18, 2024 at 06:13:35PM +0800, Markus Rechberger wrote:
> On Mon, 2024-11-18 at 22:11 -0500, Alan Stern wrote:
> > On Mon, Nov 18, 2024 at 04:13:29PM +0800, Markus Rechberger wrote:
> > > Hi,
> > > 
> > > we repeatedly received issues from customers with usb autosuspend,
> > > our
> > > devices are randomly disconnected on some systems, it did not
> > > happen
> > > many times but if more than 4-5 customers report this there's
> > > usually
> > > some real issue behind that.
> > > 
> > > I'm asking here because the Libreelec distribution recently got my
> > > attention that they seem to set usb autosuspend to -1 during boot
> > > time
> > > so they probably figured that out much earlier with other devices.
> > > I have never experienced that issue on an Ivy or Haswell based
> > > system.
> > > 
> > > Were there some issues with particular kernel versions in the past
> > > or
> > > are there any issues known in general with USB autosuspend?
> > 
> > I'm not aware of any such issues.
> > 
> > Do you think you can get kernel debugging logs from your customers 
> > showing examples of these disconnections?
> > 
> 
> one customer just replied his problem is gone since he disabled auto
> suspend (that was the latest one). He tested it since the last mail to
> the mailing list.
> 
> Do you want any particular logfiles / logging from him?

The only interesting logs would be ones showing an example of a 
disconnect during autosuspend.  If your customer has disabled 
autosuspend then there won't be any examples like this.  But maybe there 
are some old kernel logs that do show the problem?

Regardless, disabling autosuspend is a perfectly good way of dealing 
with these problems (unless you're in a very power-constrained setting, 
such as running off a battery).

Alan Stern

