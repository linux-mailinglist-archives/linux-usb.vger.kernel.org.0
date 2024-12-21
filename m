Return-Path: <linux-usb+bounces-18720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0249F9D59
	for <lists+linux-usb@lfdr.de>; Sat, 21 Dec 2024 01:09:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CFFB8165DD1
	for <lists+linux-usb@lfdr.de>; Sat, 21 Dec 2024 00:09:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E0BA59;
	Sat, 21 Dec 2024 00:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Kuk2Atwh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E9417E
	for <linux-usb@vger.kernel.org>; Sat, 21 Dec 2024 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734739788; cv=none; b=Fyrbfp/LdWVOpmqPYR6k6+6iHbfsVQr8N2jzFjze2ghU2BtPPsFxBtw3KetFQ5aJjjr401TsI0UcNmn8JRXCJGSmZpI5qVWsmgDujwEFoXilUJHNggFBI6ussJYvqDUOZJo7c9JYCVQqTctAQbmJNVU8xXKWHNU0mE2MVQFuzz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734739788; c=relaxed/simple;
	bh=flhTg/GMaZiO4dCxiJDtiKWG3f/ke/JpsT1WGyP5PyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jInHU9WF7tZPch9zYCpkL9ENEX+JWCuG4Ku3pub7LxB/AcAZzaTgpValHIZM/77z7z+fkEyqNhK579sbr6m9G/Ld04cnwgXwZBguhqqJGuhP0o3TO6HwAh4M6bgXjHxAZD0sCKACYoRq80pJif0Cc4wLadZy/exNZ1s0UzkoQjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Kuk2Atwh; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7b702c3c021so197900685a.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Dec 2024 16:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734739786; x=1735344586; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vda/F4g2zeRiPaYfuqVXTonyQ9QFEOsQs2WkWHH0h1w=;
        b=Kuk2Atwhce1Zr90UWfjHUiH2RmHM10dpJh0mnuMMnRWyGfV1/R8LgaA/5ZNwhiFk+Y
         txm4+polFMmlyGft2vNOu9uVqrrQq8wDxV1gJ98xlkaenPafptSWbZsYBpnC/DE0ceNx
         0w1Me2xoRZzfL+4Ri6Zz5iPUUT3YdFuhWQpSA8Okq3zDQlTGXzcmhMhx1NTkUc7f2/C+
         VfTrvXfoTLp3dkUHD/ZF5UrA5n30H4Kk78Tu+ZPyY+1wpJHwg93dSc2GXxKTXfZtUDAE
         KPcVtlW7nC0G/4JBtRWFAvRd+js2GhT65s1T99AXNBaTl3Av/Smy5t6fW/i70b61QgrS
         KRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734739786; x=1735344586;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vda/F4g2zeRiPaYfuqVXTonyQ9QFEOsQs2WkWHH0h1w=;
        b=kz/tL2WGPcoSeAaX4tIDkl4mIU0unrfjPg3l1R/+Uvl+XJNOwGdw9GP2chFlziwpf+
         9O2oaQdBueVP1NVnhJv0Ai+7J1kLEMnsT7qNQOa0peshTR/ak20MdAc0mLLEGrVbWDlm
         KbB/JGPHnLBEFpO/lPFlG4RUpPinMKoUQkFrNlGn8F+pS0O2paB8MGbj9t5Ej045lnGi
         lv4grGv0FZ3Yp7mAC3haTCU35qrqC5keOMtwt9bO2O2rxap5OUIX7W7v6lrONtScyCC/
         aZUaWrEXPHbUqq6STHfv35kdUBDY/FMPbCJYPLu49ygbJlu/3GaSzZF5tuqoPtmZke83
         lTqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqKWpKq+HyCfXQiqKEZrqeFOTfQcbibET/0HXwpUHSgAVL6tYuIHVIngXdbn87ksYikad6841BwMI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/JYSHh+qubJvx/MtUSB+EUVIOs6piIGxISspc5kieHAeqombx
	Nqfs8v6HjN1F6tU9rAhj2ncK0QZ0vxZ1rcfRDvZiEXQniUKCsosbqRQ8qSC9bQ==
X-Gm-Gg: ASbGnct/kmNObnQimss66yl1UaN58WXaa978Wa+fdB5Sw8OohndnbEHAajUIPtFX5Jf
	Ruj9uRGlslAcMv/QrK6hcyIVIzQ3pgZSLJBOQSihBN+nfe3SPi9SLOmVhia+dpopGcUbQ+cglQD
	eZha0m2RRDLJQPpwWp94ufKw123TH7uoJJi3CokWF/qI1YS4zHkyqNkvs1ITPEfFhfSjW8XnIPj
	XdOD9ggrMrXMA5kHOfuHHUeQSuVPfiaQKuVvwXfKLTYla0aWBUSfdIO6Kb7zIyXwIN2eWBpHQ==
X-Google-Smtp-Source: AGHT+IEpElG+0JxCdPbhHDZeB6BBzu2Cmni0gK8xRU7rZxUvyMXYjoiqQNDC5RjW3XmR94fmKDZI4g==
X-Received: by 2002:a05:6214:54c1:b0:6d4:2646:109c with SMTP id 6a1803df08f44-6dd2330a805mr75432526d6.3.1734739785955;
        Fri, 20 Dec 2024 16:09:45 -0800 (PST)
Received: from rowland.harvard.edu ([204.150.3.162])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18135f3asm21646326d6.59.2024.12.20.16.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 16:09:44 -0800 (PST)
Date: Fri, 20 Dec 2024 19:09:42 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	linux-input@vger.kernel.org,
	USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: INFO: rcu detected stall in hub_event
Message-ID: <42fb8b1d-16bc-4948-a214-2892405db258@rowland.harvard.edu>
References: <ade3bb13-e612-49a6-ace2-bf6eeca93f8e@rowland.harvard.edu>
 <fdefac3a-fa4b-4102-9c8a-4ba711beefe3@rowland.harvard.edu>
 <g6wfezt4q746flglh4bteqieooskgbcdyalzkwgtw6fbm5zqle@7zmn625m3eet>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <g6wfezt4q746flglh4bteqieooskgbcdyalzkwgtw6fbm5zqle@7zmn625m3eet>

On Fri, Dec 20, 2024 at 07:16:39PM +0100, Benjamin Tissoires wrote:
> Hi Alan
> 
> [quick FYI, I'm lagging a lot upstream. I had a rough time in
> November and then got some internal work which lead me to be less
> present upstream. And now the holidays are coming. sigh]
> 
> On Dec 17 2024, Alan Stern wrote:
> > Jiri and Benjamin:
> > 
> > The syzbot monthly USB report led to this old email message, which was 
> > never answered.  The full bug report and email thread are here:
> > 
> > https://lore.kernel.org/all/000000000000109c040597dc5843@google.com/T/
> > 
> > The bug still has not been fixed, according to syzbot.  Please review 
> > this material and let me know whether the patch should be changed or 
> > submitted.
> 
> Sorry this fell through the cracks.

No problem.

> > > Index: usb-devel/drivers/hid/hid-core.c
> > > ===================================================================
> > > --- usb-devel.orig/drivers/hid/hid-core.c
> > > +++ usb-devel/drivers/hid/hid-core.c
> > > @@ -1057,6 +1057,8 @@ static void hid_apply_multiplier(struct
> > >  	while (multiplier_collection->parent_idx != -1 &&
> > >  	       multiplier_collection->type != HID_COLLECTION_LOGICAL)
> > >  		multiplier_collection = &hid->collection[multiplier_collection->parent_idx];
> > > +	if (multiplier_collection->type != HID_COLLECTION_LOGICAL)
> > > +		multiplier_collection = NULL;
> 
> As far as I can tell, this might be good.
> I had a hard time finding out if this is correct, but we are in
> undefined behavior, so we should probably just fix the bug.
> 
> The selftests are all passing[0], so I guess we just need to respin the
> patch dropping the second hunk, no?

Okay, I'll do that.  Thanks for getting back to me.

Alan Stern

