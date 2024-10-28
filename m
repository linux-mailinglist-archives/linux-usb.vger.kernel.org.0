Return-Path: <linux-usb+bounces-16795-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D29B37C6
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 18:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00100281C6A
	for <lists+linux-usb@lfdr.de>; Mon, 28 Oct 2024 17:37:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70E6E1DF72E;
	Mon, 28 Oct 2024 17:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="lFuyDlvb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADE8D1DEFFE
	for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 17:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137063; cv=none; b=JmF+TPPRgLzdKybwBNir54S5Pwj3jvFNwSUNz6a2fou2UmdrIohcwyanywFNyffEKguCpi1l4e91xzEBaUL1XUvzp/mUzDSywirvRJgYgovKn30pwqrFlBCPy1EXjb2XW7+j2HInPmAEfq/GOh2bPgwgTdlxmBn9P2j3fDXolkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137063; c=relaxed/simple;
	bh=hCI8Mi8H1UWRgDxMDOgGVseKcQJbj8r8Fsne5shSiKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEbj0TvV8j6pfvGh55To9z8D9Ca8dLxkUFVjDC4JOVE9JKCgcTJEf3M6151L5FH+Che0ocm/cH/fKKyZvoOZx0KYPaEcoVFZgz9faznoTzb5qf7Ob5iH2Wm+7s5TYwB3gZtRSflf5NonVZAF6y73MO8x21STZAFu4Npbu/grxOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=lFuyDlvb; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5ebab72da05so2383254eaf.0
        for <linux-usb@vger.kernel.org>; Mon, 28 Oct 2024 10:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1730137061; x=1730741861; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8WZqEMQCAyXwPwtV+tBhmhJjupzwacrtCyx5m0AlRuA=;
        b=lFuyDlvb6WEwC6yUV/wnllxAgwcca6UJQbnYwVFWIhjs9DbagRcZsn6+XB3QGpp4GF
         21Kb2jtjxM/ALSg7jLdEW7HK+u6K1SCoNn1Z4YRz8dcmsUTMeogtWDwkqDOUXXGowIZ1
         pplXTggR4YTG0L5jNEXn45HvWDOtyepTxkEzjG74az1c9lnyBQZeHRDJRnUshjPCGfi0
         2aHlg0zaMOVGb29pVhhdaDf5sikDwRlyqX8Yy0NEziQD/Bluy4trlS0cx3sUxzmAmeFN
         Q2lTzuSo6Y4LoRTvfZSN/azvRwH15cuNEO/5u9/UhKg2+KN2ZSzOSSUwbMrRYq2YwTGM
         IXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137061; x=1730741861;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8WZqEMQCAyXwPwtV+tBhmhJjupzwacrtCyx5m0AlRuA=;
        b=ZPBJysQ0DD1wELy5ITLuFvACQigTwipz91vR5Q9ThFUIylapWWQvT0Zznpu/OnuT5I
         zm3puD+pakLAAfAciLnCoQxj2qYkw/4R3+oU0uU3SIYfL8OyeZ2yypd5sJIrxr+qfY9F
         QPNZLNaTf4NI7hjScxMeuir7VRqoH9JNXGHt6Vpp89X17ot+d2OdywR/cFVV0ajm9xiI
         H25nRDC7KAoIHKqvVgZElONy1OXId1dJF/Re+L+HyIkjm51wToSsuV6lR1purP2vtzS9
         Tk4C/6mM2+lD1m/Nk+oC0P8nP9jhH9HDeArcN7MI8TbPJO/ApNn2v1qgJP4JtFTjmPCj
         sp5A==
X-Gm-Message-State: AOJu0YxBzybaYhG8wzq4LuGIqoVwPaHH/XuMDKoWjZuZFGjeC99NM/X+
	+8BsXBV/n3K8SqpphSI9HqhBI8bCiUYee5gop1QXgezmoXsWBzkwN1g2p0dVK0vQQm9yUIQkTP0
	eMw==
X-Google-Smtp-Source: AGHT+IFpHg1UW4L21I7TLQ1QkJYwAypQDimt0nV2QK8R4UIvR62F7HgpwSQjfVuvAx2WczExJ9XziA==
X-Received: by 2002:a05:6358:94a2:b0:1bc:573a:401a with SMTP id e5c5f4694b2df-1c3f9d13410mr268891655d.5.1730137060812;
        Mon, 28 Oct 2024 10:37:40 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-27.harvard-secure.wrls.harvard.edu. [65.112.8.27])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461323a6862sm36320121cf.92.2024.10.28.10.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:37:40 -0700 (PDT)
Date: Mon, 28 Oct 2024 13:37:37 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Bart Van Severen <bart.v.severen@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: gadget: automatic remote wakeup on hid write
Message-ID: <f5ab7ad5-9a9c-475a-9a1e-3f9de8d1a2a9@rowland.harvard.edu>
References: <CAOLjEn56gcrBLYqmtAPY49wpZCUzuKAGSt+L2ADBpAEELoQ1TQ@mail.gmail.com>
 <6daafbf9-5999-463b-9198-cd699deb6721@rowland.harvard.edu>
 <CAOLjEn41agaq4J99BFfekPLvnBBKfvBnj24pXLzpkn21_K4ouA@mail.gmail.com>
 <467b1da8-325f-473d-bf46-96947993c626@rowland.harvard.edu>
 <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOLjEn4vJuxmRGUpUqMS6C7P82d18TkgURhd71UkXNTm5waYtw@mail.gmail.com>

On Mon, Oct 28, 2024 at 05:15:25PM +0100, Bart Van Severen wrote:
> On Mon, Oct 28, 2024 at 4:55 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > The gadget core doesn't know when the user wants to issue a wakeup
> > request; only the function driver knows this.  (For instance, only
> > f_hid.c knows when there has been an hid write.)  And the whole point of
> > usb_gadget_wakeup() is that it provides a way for the function drivers
> > to tell the gadget core to issue a wakeup request.
> >
> > Alan Stern
> 
> Agree, best to handle it in the function driver.
> 
> Unfortunately, as stated earlier, the dwc3 gadget driver doesn't
> enable link status interrupts.
> That should be enabled again, so that we can test if the gadget is
> suspended before
> calling usb_gadget_wakeup() on hid write.
> Dwc3_gadget_wakeup() does fetch and checks the link state explicitly
> to return early
> when in U0, so might as well always call usb_gadget_wakeup() on hid
> write, but it feels ugly.

The test has to be done somewhere; I don't see that it makes much 
difference whether it's in the function driver or the UDC driver.  But 
if dwc3 doesn't enable link status interrupts, how does it know when to 
invoke the gadget driver's ->suspend callback?

And either way, it looks like there is a potential for races.  What if 
the host puts the link into U3 just after an hid write occurs but before 
f_hid has had a chance to queue a packet informing the host?  Maybe we 
need to add a flag to the usb_request structure, to let the UDC driver 
know that it should issue a wakeup signal if the request is queued while 
the link is suspended.

This part of the Gadget API has never been tested very much...

Alan Stern

