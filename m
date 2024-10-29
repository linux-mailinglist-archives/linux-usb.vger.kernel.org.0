Return-Path: <linux-usb+bounces-16833-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EE09B50CF
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 18:33:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 35C71B2318A
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 17:33:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBA681FF7D1;
	Tue, 29 Oct 2024 17:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="XGrG9uCU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282861DD0EF
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 17:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730222809; cv=none; b=M3kqNT5c2stRYjVBBRXhkz7cMN0uiLqhdko3AUss8Ee3ssKCgMifBbJRGypn00X/USFV9m5tZGCAU7c38LMMdNoLyyASBZg4OX4qR92FtwirauzkrhxMB9txsPeu+1RBaHDoFAMRKrPfQF8qQ2Gee4pPppf50RybcNFtlg1GpIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730222809; c=relaxed/simple;
	bh=Uu9UotOtGs1EGOjrSNHZrB99FC0RA1TIaj8U0UG5puo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjYud1Ln2G4H9FA4qZSrv9BuDAPK61D3ziII3bdqcobp877fVs3lVxv3iowsnWpl6cVMNn0y3xxfx6YrtLtr9o7AnaX52QeKHHmGUEuT9kpUd691kMHkaRZ+xHAN9rk+hT2o3yAOP+jvpxmV614nzPPsWXRWfmibgsDLTcuV4Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=XGrG9uCU; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3e6089a1d39so2317582b6e.0
        for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 10:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730222806; x=1730827606; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ufL7IdAeSBhTqaJRXKx4JX0pJRofv2UOY186X+FLfu0=;
        b=XGrG9uCUw6yyAaO4qlg76Wg5UAQdqFyhj/Zl8N1m7a0le5fzQbnZfYzEC953Rg1kkb
         /zY1dyDhuS7NC0dmtBceZo9q6egi60jv84/HnZBkofOQd6DBV0Q99ZUcz+XvN9XZA5dr
         tYUDONzwZBf+Z9Qpx3QZB4BtO9fxf5JJizS9nj2nOH4Aa3eLCgy0oI7BOXmsHCVvD9+k
         FK5eiIqUt3YUIULgo2AqftwCSNb6t5K817du41TlW/OuGFQ5Akln0+fu0yTqKjXEOncv
         C9/YDa0zFurhMT2YSpx/difd9UWZB8lznQPSCA4jiVb/GSzJw8MCSObf4snGlqRKVJ/p
         TsgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730222806; x=1730827606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ufL7IdAeSBhTqaJRXKx4JX0pJRofv2UOY186X+FLfu0=;
        b=bBYKC4Pf3P8EmlSZrr4aFby2fA7UkBQrGJ8j06U7okIOc//8++CtYX5EhF/6AdLwSl
         j8cJJZblQZcuigFlKbm/5Wvh6aatzUeeDbWbnN6v3sQEHrxCXVxlg7X4ydE5+hNexfeX
         9Zw3zpwyPHa7z53gZ+0UaIQrveQENI82F/sIUMQUO2Ct1G+W2zAGVeqU/ZI9U0EICiSG
         DKu7IWo+laJM1df9Bl7jzo2veO0kEBxzBojTmDCjMJ2tzR24eY7bMYKQ70s7xsz7ECKQ
         I41XfB4nE/wrde/PRI9c+l220v9iVJZ1OU1CC3ADdh9jqLxrx8VuPj9ArvCGwRosxpSX
         aOJg==
X-Forwarded-Encrypted: i=1; AJvYcCXeBP+MpammDVcV5c6wFnOq3+iyKl4HZNk1GdeRHbOg415twmTFIHtj1CcGs+Fb64+FWouNTHJe/nQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmly+KgYIp3qhc3WsK+KSp6Fy9GXtri8pBGcmMfm8/qcCjsGYV
	RFs1PChbO48tKqL+hvHJlBJCyo7nOwWM+g/8Yif64K3pdUH68aLSPBHWl/9MrQ==
X-Google-Smtp-Source: AGHT+IF1zvOCN06b31Y0j4D8L+F117uJLyVFEoc+IHxIwIU2mLnyUPGJvTZ+dyFrS0VGKKuMdetYhg==
X-Received: by 2002:a05:6808:148a:b0:3e5:fd5a:d3cc with SMTP id 5614622812f47-3e6384563c2mr10793797b6e.16.1730222806167;
        Tue, 29 Oct 2024 10:26:46 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-27.harvard-secure.wrls.harvard.edu. [65.112.8.27])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d179a02608sm43816256d6.78.2024.10.29.10.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 10:26:45 -0700 (PDT)
Date: Tue, 29 Oct 2024 13:26:43 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Bart Van Severen <bart.v.severen@gmail.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb: gadget: automatic remote wakeup on hid write
Message-ID: <c6ce3f52-cd27-425f-ab3a-beb56e76a247@rowland.harvard.edu>
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
 <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
 <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>
 <f5ab7ad5-9a9c-475a-9a1e-3f9de8d1a2a9@rowland.harvard.edu>
 <20241029002209.5eqrdsvpxrh3ycxl@synopsys.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029002209.5eqrdsvpxrh3ycxl@synopsys.com>

On Tue, Oct 29, 2024 at 12:22:10AM +0000, Thinh Nguyen wrote:
> On Mon, Oct 28, 2024, Alan Stern wrote:
> > And either way, it looks like there is a potential for races.  What if 
> > the host puts the link into U3 just after an hid write occurs but before 
> 
> Regarding the potential race condition you mentioned, the f_hid can
> track when the ->suspend() and ->resume() callbacks are called to handle
> these corner cases. How it should handle that is up to the f_hid.
> 
> > f_hid has had a chance to queue a packet informing the host?  Maybe we 
> > need to add a flag to the usb_request structure, to let the UDC driver 
> > know that it should issue a wakeup signal if the request is queued while 
> > the link is suspended.
> > 
> 
> The host will sync with the gadget via SetFeature(remote_wakeup) control
> request before entering U3/L2 to enable remote wakeup, and it should
> disable remote wakeup after resume. We have the flag
> gadget->wakeup_armed to track that. The dwc3_gadget_wakeup() will not
> trigger remote wakeup if wakeup_armed is disabled.
> 
> > This part of the Gadget API has never been tested very much...
> > 
> > Alan Stern
> > 
> 
> The f_hid just need to properly implement the handling of remote wakeup
> as Alan noted.

Bart, it sounds like f_hid needs to do two things:

	Use a private spinlock to protect all the places where a request
	is submitted, if the request might cause a wakeup to occur.
	Also take the spinlock within the suspend and resume callbacks,
	to keep accurate track of whether the function is suspended.

	When a suspend occurs, check to see if there are any pending
	requests still queued that should cause a wakeup, and call
	usb_gadget_wakeup() if there are.  And likewise if such a 
	request is submitted while the function is suspended.

Alan Stern

