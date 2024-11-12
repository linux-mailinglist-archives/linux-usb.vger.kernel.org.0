Return-Path: <linux-usb+bounces-17488-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5992E9C5C0C
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 16:38:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0F92D1F229FC
	for <lists+linux-usb@lfdr.de>; Tue, 12 Nov 2024 15:38:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E0B020125E;
	Tue, 12 Nov 2024 15:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="F1icZC7u"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA7520111A
	for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 15:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731425900; cv=none; b=e+4DGxcysmYd5t5DnitqrWsB9WITs2g27zI5Y9RNI5uo6vWI//C59KvFOGeC2cuyHiV4tRP3QW+sjwLjNl/bD8Yoi/QoKr63bljnGEUNtC4twDOFCeFS/kxQchHRrHhCbxrDjDekVWWvf6JlwdxyWbpMnE80bkVWy4SawLLI1gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731425900; c=relaxed/simple;
	bh=sdhx8TvevQPzP9rwHjeBQ0WqXkaUKN2RtRj7mimst3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SUxX+e/o2C/hDP0t7Y46a26BKgi/2e39gQ4b4K1m55gTlwQRW9Gq1O8sz9MfDV8XO3DsG/Ouval/JOwwhXmkzphWhyoeyaw5iqsNVWyAnsdpq91YdBX3fgVdoH4qZ7JFLrbQXVJxg+/SIPnUqeh4aWM/aZT/sRbG5v04JTNH9Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=F1icZC7u; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6ecaa45af7bso6948057b3.3
        for <linux-usb@vger.kernel.org>; Tue, 12 Nov 2024 07:38:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731425897; x=1732030697; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wgr2G18lvm+aKu8E73YpOcAkoG1t4AtxA2QHpWS3/f8=;
        b=F1icZC7uprmZWuH5USgXIZI6JzHhuCaCsUIkYzVryfu6s+StZ/RqkSkopNme7sUiFj
         sPNWrdSA72RBCFXdVuXzxCSV7bnNkMjLX4fsCyFf844845wBrAWOO8lFQ6x6/Jhez/wj
         ysYHmLX+asibAbvPMlp6vJWlfBG0GWPqXMlqkafrKKIw1FAQB0LEVDYDs0wCPaowBuDg
         Iwnk5qWYMRn3ORDzXn5yQKX7tV7seTn+OTDk0+mLTKQfFMUwAMhul0Bzhh3Yi87kU/mr
         hhJsoae5DYE8NrsfGDfYspUfCBcQXI643edAocRGwyv1AvBvbAtJwM2Rl3ZMehCDCYXH
         9+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731425897; x=1732030697;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wgr2G18lvm+aKu8E73YpOcAkoG1t4AtxA2QHpWS3/f8=;
        b=Vcn0eevQq6aRD5C2tubflMN3sTbiAPfyijw7YDACpB5UfTcQCxVZFHbrRPCpe6VwJk
         bw1VkJ3tMpPjb9qJkZzb4yuZUBqDauFXuep77W9WhcUKihNWgNXfiCyKWb1+4J2vjKZC
         jQA6R4+Ka5ommOxFcSkI6rSd2zoM375T+yiGewVNopViVozTN7w054Dnvghhyp0s4Bw8
         Xg+hsSgVP4QqkCVFHKsMFzTvHpwsB8qkUOX+s5DUW7ZMIjpi6uHp8j5WkDENYAR7fM+j
         zVvlTl5/OzERmGEqgMRv1XxONUDw4Z5+p+Vg9dV0ENWFBTwaW6FXb5r0t6NvKMdD0TqS
         eEoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXF5g/2tk59ZyoPJ2KCVZ84qfekR9w+VpeLeNMMtaArF881jaJSkpjDbK3yZSRP5AJ3R2/URKLlsQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQuQoh7Omgz92PojJBORyr89a2g1YSWQnrLDDy16uEnwxcBIqX
	/+mGaetVH1EMN3kIKpAsC6qUuUs4GkUcEuo6q/oIvglze4V85iIi2NEetBiDMg==
X-Google-Smtp-Source: AGHT+IEvx8kjGI3x0PUBktGzbHj8Jxk6e0Ogjux8k1tUZhjwc7mbhV3SJD13bOyQRf9GiQ7DNvsx+A==
X-Received: by 2002:a0d:c907:0:b0:6ea:4d3f:df7c with SMTP id 00721157ae682-6eaddd72e88mr114617417b3.9.1731425897546;
        Tue, 12 Nov 2024 07:38:17 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.12.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d39643b377sm72819876d6.79.2024.11.12.07.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 07:38:17 -0800 (PST)
Date: Tue, 12 Nov 2024 10:38:15 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: Oliver Neukum <oneukum@suse.com>,
	syzbot+9760fbbd535cee131f81@syzkaller.appspotmail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb/cdc-wdm: fix memory leak of wdm_device
Message-ID: <7b25946e-265a-4939-98dc-d31555e143bb@rowland.harvard.edu>
References: <000000000000e875fa0620253803@google.com>
 <20241109152821.3476218-1-snovitoll@gmail.com>
 <825be5e2-31b2-4cd6-a283-05935ea6161f@suse.com>
 <9447f943-5172-4386-b159-f6b37735fe13@rowland.harvard.edu>
 <CACzwLxht_ACYD4QdDqSWfYkZ7+0a+z8DWMt15KhGCF4E1g9-Lw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACzwLxht_ACYD4QdDqSWfYkZ7+0a+z8DWMt15KhGCF4E1g9-Lw@mail.gmail.com>

On Tue, Nov 12, 2024 at 02:34:13PM +0500, Sabyrzhan Tasbolatov wrote:
> On Mon, Nov 11, 2024 at 7:29 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > I don't understand your analysis.  As you said, cntr is initially set to
> > the amount in the buffer:
> >
> >         If cntr <= count then cntr isn't changed, so the amount of data
> >         copied to the user is the same as what is in the buffer.
> >
> >         Otherwise, if cntr > count, then cntr is decreased so that the
> >         amount copied to the user is no larger than what the user asked
> >         for -- but then it's obviously smaller than what's in the buffer.
> >
> > In neither case does the code copy more data than the buffer contains.
> 
> Hello,
> I've sent the v3 patch [1] per Oliver's explanation if I interpreted
> it correctly.
> I don't have the reproducer to verify if the patch solves the problem.
> If the analysis or patch is not right, please let me know.

The analysis is not right.

The patch is also not right, because it doesn't change the meaning of 
the code (except for one respect, in which it is wrong).  I'll send 
another email responding to the patch itself.

Alan Stern

