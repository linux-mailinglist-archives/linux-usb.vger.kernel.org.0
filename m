Return-Path: <linux-usb+bounces-12729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9049431A1
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 16:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 55612B21B38
	for <lists+linux-usb@lfdr.de>; Wed, 31 Jul 2024 14:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5851B29AC;
	Wed, 31 Jul 2024 14:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QzII+EPz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57741DA53
	for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722434679; cv=none; b=rJSlgQ2AdT/NcOhTemAonn28MvxpjHrxmxoyM0wUJNnu7llCA5rlLPG/JmUpEgZFcffIZa8FzdXqNoETtmoIawPonghwUpW6a+rm2qFQWfw0yKtywHgm8Rc3+pecds2qCy7SX8INulmpOyptPaVCNs62oiDvmolln+7Vxjd7stw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722434679; c=relaxed/simple;
	bh=oLh2PxgOYmR7+7wdleZ5fx2VuAWo/Sel6Gx9WfF2ndM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X+oKTPZVa6PfHYFV0Mvle/F8IWYCXdmUCTy2a9Da56uAffAzf/YiPB/EE4tFB5y6J7rwfIwICF3MjvBrw/8Ls0dAqigkPSTPMs0267Skv1jeTo9XB/FWM2W6SH/eQBP4U88JUTBlQgMuhf27ydLQ3a0ExsaAqdKtkmr2vH39JJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QzII+EPz; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a1df0a9281so363928085a.1
        for <linux-usb@vger.kernel.org>; Wed, 31 Jul 2024 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1722434677; x=1723039477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=a33CO1uHADQ6sgXZQtQE5aEWMq1kTwgBEoJ/8BHTMSw=;
        b=QzII+EPz+AeFudTuY5beEx0D520OPezVkRv61O6qXkLQ77Ff3MNsRsre3F7cjSGyV/
         +kCO+lbXZrA86yryJnN9QCLfP9QGqeRQWnUzdV7tVKvs+ivYGORBpOok7Easx7uqFyfA
         OOPWSXwm5UB4dBMN6OUwsAd2Tzrz6nJ8KpUn/fU8RG1T2FFDoM9ox/4QyB/BMHHBcgtH
         KV+wjbcgc7y9IjmXp+LfOMD5fTgaJ+pGAtUiiR5iWNDCNYTsigwVzyilM6v5COnQIFuy
         +BgudmFKJinUZuT4ePH3BMbKNxy740NO3/sPwat3NM89hUQrCVMb6te0fQdmQs8hIJf9
         Lzfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722434677; x=1723039477;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a33CO1uHADQ6sgXZQtQE5aEWMq1kTwgBEoJ/8BHTMSw=;
        b=vvCQBOLIZFRRbwyYhLD2GNj+O6/nn7/hkou8qTRv/ZB1U029RTVfqbWhmcAqoBNo0I
         exQJZAwmqczKcdrQNkXMwhzWMB2uSqOXPlJfRvuiw7ZF89mxXISOYMRO6+9LB559D8zC
         vuV1EOh6oIfcxS4Sc1Oj0SpcWfCp6hoZB2uLT9RmVfCL88wtPMMfHZCrw+Y01SjEb2xC
         Hhn6+iVHwZgsxAnf/Xc0MdduGrEPFxwjTQGQ23KZ7vIjAhs7L/Qt/jXV3HeN1807xak9
         FS/acKYi7iUHqEkDc+qfPsOe/LFqmYiGHgdfeg4Y2PbgfAJYtIeZdtbUMjAk5MDqvISJ
         N1MQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+lemEiwkn15LdcnxytU5IrFoEsYgZpFT1ZpgXxuiWdNpuSO4/93rg5B9ss2oJg9uk2D2S0ohMBcSiRvRVONsUoEQVETgL/1Iz
X-Gm-Message-State: AOJu0Yz0nZXy7BnSdv0L5Ne60+mleFXxniFQsWu23bfq5USnjeczW+eG
	5QJmBd+dYwDpp4G1RpsVcFetJjNXMfEv5UqY2viDGOPpIN+1MS9RS2vATYnRhQ==
X-Google-Smtp-Source: AGHT+IHuaIxXiz9/F7tFd8xWAfJBmkTsfbtztGBLPFY0TGFZMDZboiTLKwe6io78Jn8mrFkjnOLl9g==
X-Received: by 2002:a05:620a:8016:b0:79d:9102:554a with SMTP id af79cd13be357-7a1e5223dddmr1848014585a.14.1722434676796;
        Wed, 31 Jul 2024 07:04:36 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a1ddea0c2asm645807185a.27.2024.07.31.07.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 07:04:36 -0700 (PDT)
Date: Wed, 31 Jul 2024 10:04:33 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, usb-storage@lists.one-eyed-alien.net,
	linux-usb@vger.kernel.org, skhan@linuxfoundation.org,
	dan.carpenter@linaro.org, rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: storage: ene_ub6250: Fix right shift warnings
Message-ID: <804a6d40-73a4-4af6-944b-95e9324d7429@rowland.harvard.edu>
References: <20240729182348.451436-1-abhishektamboli9@gmail.com>
 <e72cc56a-3066-4cb8-848d-bfe27a48c095@suse.com>
 <ZqkpOQIjcBSAg8rC@embed-PC.myguest.virtualbox.org>
 <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d7870b0-6b63-430b-8885-2509b33dc78a@suse.com>

On Wed, Jul 31, 2024 at 11:15:28AM +0200, 'Oliver Neukum' via USB Mass Storage on Linux wrote:
> Hi,
> 
> On 30.07.24 19:56, Abhishek Tamboli wrote:
> > On Tue, Jul 30, 2024 at 09:09:05AM +0200, Oliver Neukum wrote:
> 
> > > 1. use a constant, where a constant is used
> > I think you are suggesting that I should replace hard-coded values like the
> > buffer size with named constants. For example:
> > 
> > #define BUF_SIZE 8
> > unsigned char buf[BUF_SIZE];
> 
> Yes, but the constant we need to look at here is bl_len.
> This is a variable needlessly.

The code in ms_scsi_read_capacity() is written that way to be consistent 
with the sd_scsi_read_capacity() routine.  Or maybe it was just 
copied-and-pasted, and then the variable's type was changed for no good 
reason.

Replacing the variable with a constant won't make much difference.  The 
compiler will realize that bl_len has a constant value and will generate 
appropriate code anyway.  I think just changing the type is a fine fix.

> > > 2. use the macros for converting endianness
> > Can I use macros like cpu_to_le32 for converting the bl_num and bl_len values.
> > Should I replace all instances of manual bitwise shifts with these macros?
> 
> Yes.
> 
> > For example:
> > 
> >      u32 bl_len = 0x200;
> >      buf[0] = cpu_to_le32(bl_num) >> 24;
> >      buf[4] = cpu_to_le32(bl_len) >> 24;
> > 
> > Is using cpu_to_le32 appropriate for the data format required by this
> > device?
> 
> Well, the format is big endian. So, cpu_to_be32() will be required.

Better yet, use put_unaligned_be32().  However, there's nothing really 
wrong with the code as it stands.  It doesn't need to be changed now.

Alan Stern

