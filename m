Return-Path: <linux-usb+bounces-28475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1F4B919C9
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 16:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3D22A3AD3
	for <lists+linux-usb@lfdr.de>; Mon, 22 Sep 2025 14:16:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E24F1B4257;
	Mon, 22 Sep 2025 14:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AJKjQv5E"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321EA1C8626
	for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 14:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758550573; cv=none; b=PzAAG/ZV1DlVPMdzYrx/PjeAB2oC48OpoAbYCXe71od8lVbQtKbi18Y12loFADrOt90lzj8ij4QLUcHr9nYRInbzWqCGwkMVhc9iHlCK9p2GvRueiG9vsN2mLz4m6ZGR9ZpB0BGckpoD3rvEX4DB88ilvLCK5Y7o5dXPxy4Afro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758550573; c=relaxed/simple;
	bh=m12GtS+HeQsBVohEqqmvsRirEDlPlk7+7zUASWAH5Pk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZNaGbbBkjeDRFYiK/7C9/eY403/ojAQR1qbXHKSDA26/xXCHEicUltpZ2uoGrpZFChnWiiDsdgNX/MmNzq5JPsk5ihNuala8WI0atG6e0NjIc5vrtlAiQrdMFwkCiY/T4SYl707z0+sISQptZExFrPDbgGT3WozcNhOtbQwOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AJKjQv5E; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4b7a434b2d0so38753321cf.0
        for <linux-usb@vger.kernel.org>; Mon, 22 Sep 2025 07:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1758550571; x=1759155371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YX2uiWtGCvKybj9DCIl+Dkenp8Pk36gr+2ams2JpbG0=;
        b=AJKjQv5EAfO6nrubobiEugu4O95xzGxkk32fRvfsAfzsSE9ljCPaqDUpxe7XGAZjGv
         VdeqFCQSVxJvk+0smPHhp+q+ppJYVh/ofvJ8Uv/KS9MbS98XmzTEuo8fs9fIINojLoi3
         BjQyDL6iOJIXez8ym33wuqbNaeyvKXfFoqNRQvkCR1LcLDphW9abl/MPS/7r1GHAZDGE
         LU0pMx5F2njUBhBe4kfwxy4+QO/og41/2ZqIr9lObipbpWBfI7lJjFHBrqRl9lTJm3hM
         laeJnaRt3HBpiao3pFKYwRh1oUiBW4LrU4mOzI12NsSU7wQcVWduhLnjEknTCVjI+FVu
         IKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758550571; x=1759155371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX2uiWtGCvKybj9DCIl+Dkenp8Pk36gr+2ams2JpbG0=;
        b=dbExZgOw9Vf5m+4JxjAVAe6BOS+9+2RW4YVg2Gmwih+ycxMtlIzcaTllrMVcmcMti6
         1x5qQhSKQD2Hm4T/8ut7dIHuH82jfOvV8wjHMSv75WsTHdEePzEAxx1lE8l5KL9QDO4R
         EOPTJMzHAMF6/jwZb4KTXaoYK+jfTGyaKiNObNxl54KKvhp4g9mHjX4v1GtCdBC/Ieiv
         Do+utMR2eJhTkwac1gZF4jV9VnzgsHBVC31xQuD7k1RVN48pVQeU10BgPHz+Oj3iYoJe
         HHV/fHHsqwNTC6XFyr/OL06gJDGji5xdbbPGUJITbiVqaDbQ4l1nlJXkmZ4CVCln8AcX
         qK4g==
X-Forwarded-Encrypted: i=1; AJvYcCVLIGrx8DWy/gb8s1jThYYe4zRNzmlK6v38A8rBeVHEJKW/qj7Vj85bH4ybqx5M7Kba5D/xqqpKmiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvJ9t3/XIUlc49YNg5y9RYwrYTxrKfZrqh0tEUCDcK1Sq/HDve
	CPXSWJgHic3J1ieyUvjRf/9UVUrRyMHRioZYuP+zwk8iT1QpqUPbXw7ddfKYcB2xrw==
X-Gm-Gg: ASbGnct7PD5S8PCR5RD/NtvfKzr6pleWvHbFiZ0QyZCiJuchKowudBvejWfPzyYJ/bv
	aXvsj8TzffBDKjSGVGKW+S/oTvVW5bxlqQu+F+kTWkoJmgZcUsdGtajgWrZTUugJyig2YOAJbt4
	wME4G7IkvEjPjDfyYhVTdP7hvdpRaNCfwJNtwZSGIfpUXPQyA/JjZF+utZizVzy//07zVO2SnGA
	30Z20JFd2TfsES9zH+04p+xqc6Hp7zYYEpMCl6q9dDeLez9nbthQLMz9PZBxQjvluwsZV1NpZt8
	rt3bmZJhLgw7yWwzsQNLCNayGcBs0RHI47dhed2Z9RnzB0etq//Pfe2U8EuOkGWQSIA/W0M8Luy
	ddfWU7OqsGJ7BiP8Ej+kvBAtU1QsTWK9T+MibsgYFPg==
X-Google-Smtp-Source: AGHT+IHWmW2bzrkzjUy2wZaw7gfkovmXoj3nKFRBeuTN7BHormyx68wsHM2EcixnepwUJNon4eXXrg==
X-Received: by 2002:ac8:7dd0:0:b0:4d1:7f1f:af5f with SMTP id d75a77b69052e-4d17f1fb18cmr7161881cf.34.1758550570510;
        Mon, 22 Sep 2025 07:16:10 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ccade1cf34sm14054511cf.46.2025.09.22.07.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 07:16:10 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:16:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: ValdikSS <iam@valdikss.org.ru>
Cc: Greg KH <greg@kroah.com>, linux-usb@vger.kernel.org
Subject: Re: USB 1.1 Full Speed OHCI slow/high latency
Message-ID: <d689fcb8-20c7-4a81-a466-7492eaa23567@rowland.harvard.edu>
References: <6017298f-fc03-41c9-b0e3-a74180f4c9a1@rowland.harvard.edu>
 <f2c433ae-f9d0-4beb-a2c7-84d2fd68e02e@valdikss.org.ru>
 <d41d8488-9438-430a-88ab-f845df3655e1@rowland.harvard.edu>
 <2bf5c54e-7dac-4673-a696-e09eb8d459d5@valdikss.org.ru>
 <7bfaeea9-6eb1-4e49-af8a-77940fdb70fc@rowland.harvard.edu>
 <e5d73b85-9c7f-4c74-9a00-700b4b6e7d70@valdikss.org.ru>
 <da6326e4-9b47-4347-a044-879b4be58560@rowland.harvard.edu>
 <9013fce0-6764-49b1-9e54-68e915e12d7c@valdikss.org.ru>
 <4e83d098-19e8-45aa-94e7-9ef005a0c8ab@rowland.harvard.edu>
 <6214afad-51c5-46ee-90bc-8625312609a7@valdikss.org.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6214afad-51c5-46ee-90bc-8625312609a7@valdikss.org.ru>

On Mon, Sep 22, 2025 at 02:11:43AM +0300, ValdikSS wrote:
> Alan, Greg, I found the reason for 1 ms delay: it is artificial, added in
> v2.5.21 as a possible race condition fix:
> 
> > /* SF interrupt might get delayed; record the frame counter value that
> >  * indicates when the HC isn't looking at it, so concurrent unlinks
> >  * behave.  frame_no wraps every 2^16 msec, and changes right before
> >  * SF is triggered.
> >  */
> > ed->tick = le16_to_cpu (ohci->hcca->frame_no) + 1;
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/drivers/usb/host/ohci-q.c?id=9a53bdfbe26329e78f43485fc43f5fab5f27cbbc
> 
> ED it just not getting processed at all until the time (counted by frame_no)
> is reached, apparently there is/was no other way to ensure HC is finished
> with this ED.
> 
> > /* only take off EDs that the HC isn't using, accounting for
> >  * frame counter wraps.  completion callbacks might prepend
> >  * EDs to the list, they'll be checked next irq.
> >  */
> > if (tick_before (tick, ed->tick)) {
> >     last = &ed->ed_rm_list;
> >     continue;
> > }

Good work tracking that down!

> I removed "+ 1" and it removed that 1ms delay. Doesn't seem to break
> anything in my setup. UHCI code doesn't seem to have any similar delays.
> 
> Could it be relevant only for hardware of its era? If I add "no +1" code
> quirk as a module option, disabled by default, does it sounds sane to you?

I'm not sure that there is any OHCI hardware from later than that era. 
But regardless...

Module options are frowned upon these days.  Instead you could add a 
sysfs (or even debugfs) attribute file for controlling that "+ 1".

Alan Stern

