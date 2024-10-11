Return-Path: <linux-usb+bounces-16091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5EA99A57B
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 15:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 82A9F1F256C1
	for <lists+linux-usb@lfdr.de>; Fri, 11 Oct 2024 13:53:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A34F21949D;
	Fri, 11 Oct 2024 13:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="F+lcV4Bv"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F508218D99
	for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 13:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728654792; cv=none; b=GGNuFA2aOd7goxyu7k78mDqNb6yD4Y5DYKWHwNetyQasQqxIhc2VMl3qYFx/5TJ+3jgw4sDlkqpTrmPEmCAm9LvpQpARBFbB6EtZriMaiDKZW4+iFDwOAogvCrsyngobIS5mOXH1biLU/n4Yyi2h8xHjvxRm9Q7rg53Z46Kk9hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728654792; c=relaxed/simple;
	bh=8r3kR1u5PYCextzgPOmPli2Q65rTJpmZy6FzsINGdjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTV35CMgLGKvZiYfot7RyWrySnMszCH+t4EnqWYSJ+6ezKSzrv6EDU/AVLl4Cos+qgIgA0JlmY3fwAXFwCeeOtGAxpsjZBf5orYwzR57lsV+Fy0l0sKqD9WazI9AzjkWt1jmnhgcMblkd4QbxUeX7/AJHLGSrSeHBbjiSSmLiSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=F+lcV4Bv; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e28ff55468dso2162885276.2
        for <linux-usb@vger.kernel.org>; Fri, 11 Oct 2024 06:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1728654790; x=1729259590; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ag2p100YfHWn5amQN/LSPjq+vDCFEkLC+yVHx1CDkoM=;
        b=F+lcV4Bvd1QmWumPGOS9LyokxfKZw4gKImazxVG/PhSagXaYHMxi6wcb550QTFBVFD
         ZsQG0JJql32dD4Qw5Bxbnh/l9B3/XdZmSoEBvGamjpgpYUGTN2tHBtKuuEHUzXI37bxt
         Glc48anncSrFqDe+6H8VFUWypGZ2ximjSAmm3MwNPrIU6OFvEI8/mHlLbA1+baM0nP4m
         byzWaWzObFlkjdcROBcC8I7/GDo1xkLeWssiREuxkmVoKyAklNlxzcP/LkAbyEhmbD+W
         tXTjo+d26ZQjcTtIrKQjlSNOuzMniRVExj+D+7jNoC1jQnTaorrkeNZcv8ro6KkxwYSg
         LbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728654790; x=1729259590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ag2p100YfHWn5amQN/LSPjq+vDCFEkLC+yVHx1CDkoM=;
        b=ZE5A2NLmRa9e0oXVpFVUjua20SzHO+qlLiMS8xCI/M/ZNoTXDl0ZYiIJuzxjHH6MvQ
         JtKDwV3u6vA813pkKg2YUcvOgf/5CgHihWMvwTWxCKUiRi87wbDLCJ4TbDGSM2vJuMRh
         nT84wwDtmH7YE/DEAOtgNwkdRB5GHk9qDQbCA9iQyHWy9DYW1bBd5P211JRYGKeoeFb2
         5viJng9XL86EC2hn2bHvox1ZNWCplET+j/u0NGrGKRJw2dSN/Vhi1ymekKeMXRVEN0Fd
         9hYZnFiYbqwWgfL2o41kQDeWKEdSJYn0B5LVXWQCR66IC3FXvj0D7+8+gm+qX4e4UYsR
         ULqw==
X-Forwarded-Encrypted: i=1; AJvYcCXLLG+vNgrFdPKkr047PxcYuZ4dauQSxBQqAjXSwrq8PPfBgAZvA4GAl8mwUiP7sttJDiR3dSahqi4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzSPIM4WV1T0CJLF4VGOcMqMzK0NgQU3CpZh6fVn5qrOElsP9W
	p+ofM9v1OQsSDNRkiNLyIJ1UPz2gwoalP81MRczrZMXA5lpG1YHSpHjmxXS2zA==
X-Google-Smtp-Source: AGHT+IFiA4JkwRscCF/WSgsva8RrRvGFlwzDWy0VXoeYihDre1R/Xcw9G8Q8d39GJSF34hgjeCi4tQ==
X-Received: by 2002:a05:6902:11cf:b0:e28:f325:9fff with SMTP id 3f1490d57ef6-e2919d827d1mr2189889276.13.1728654790181;
        Fri, 11 Oct 2024 06:53:10 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:2501:2805:c6d5:fe22:7fa3:ec54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cbe85bab0csm15703766d6.48.2024.10.11.06.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:53:09 -0700 (PDT)
Date: Fri, 11 Oct 2024 09:53:07 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: duanchenghao <duanchenghao@kylinos.cn>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Hongyu Xie <xy521521@gmail.com>, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org, niko.mauno@vaisala.com, pavel@ucw.cz,
	stanley_chang@realtek.com, tj@kernel.org,
	Hongyu Xie <xiehongyu1@kylinos.cn>
Subject: Re: [PATCH] USB: Fix the issue of task recovery failure caused by
 USB status when S4 wakes up
Message-ID: <b8eb28f3-504d-4d26-8b02-ca1ae7309a70@rowland.harvard.edu>
References: <8068130ce4ece6078b2893c4c6333c06c792b6c0.camel@kylinos.cn>
 <b8dc326b-8aee-4903-bbb6-64083cf66b4d@rowland.harvard.edu>
 <bddecd4e-d3c8-448e-8a22-84bbc98c4d1b@kylinos.cn>
 <b2ec107d4797f6e1e8e558f97c0ad1be6d46572c.camel@kylinos.cn>
 <84a4f66a-5b0e-46a8-8746-be6cd7d49629@rowland.harvard.edu>
 <fa347849defa66a7d4af23ac6317ae5b37357ea4.camel@kylinos.cn>
 <2c368013-8363-4a4e-bfee-2f0b14d01162@rowland.harvard.edu>
 <5f2f6b979e95e4c2bc33ea0277112939164f6024.camel@kylinos.cn>
 <d70e070f-5224-402c-ac27-0703b4010b18@rowland.harvard.edu>
 <0ad92e8fef2f07672aa8e97bc04f20657469ac6e.camel@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ad92e8fef2f07672aa8e97bc04f20657469ac6e.camel@kylinos.cn>

On Fri, Oct 11, 2024 at 09:42:11AM +0800, duanchenghao wrote:
> Hi Alan,
> 
> I roughly understand now.
> 
> In your previous email, you mentioned assigning a value to do_wakeup
> based on the judgment of PMSG in suspend_common, but there is no
> parameter passing of PMSG in suspend_common.

In my kernel tree, the first line of code in suspend_common() (following 
all the variable definitions) is this:

	do_wakeup = PMSG_IS_AUTO(msg) ? true : device_may_wakeup(dev);

That's what I was talking about.

> Do you mean using the global parameter pm_transition.event for the
> judgment?

No, I meant what I wrote.

Alan Stern

