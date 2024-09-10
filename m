Return-Path: <linux-usb+bounces-14905-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A26B9973863
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 15:14:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C669C1C2443B
	for <lists+linux-usb@lfdr.de>; Tue, 10 Sep 2024 13:14:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67501192D9B;
	Tue, 10 Sep 2024 13:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Am+tsIX/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4604C192D8E
	for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 13:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725974032; cv=none; b=kGESw6ADrZCkNogP9sI7qCIoAXTNgy5S5uLoq//T+AfoXXdctvCMSkPU3diPUu272oQeV+AefQgYJMuQjgJeYiuKKrOq3rDco0FFKYJQob5wz2EILXbdkp7rwo9+3eBcoeVWl6fC0e+th/822T4izxk8ud41tKYcFXG4yJLqqvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725974032; c=relaxed/simple;
	bh=Td8G0ZhZzKBRWrXjIEUMlAY6Xd0molozO56n4pFV8iU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UejBMsQJUxs4XpXBfeu94bsNDqZWccc8yfg0+1H6/KCygUO73IgddM3++pc21RVv1F/wUGSPxkiG4Ld3EHJTWKauYeMhhj7BdIKDVjBUfg1iVdZHuV8rVS3FB3uOBw9y+AHLejdrscRbdDACwrfkJYoADqkBFMfQe8HeOfrYUwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Am+tsIX/; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a9a7bea3cfso190528685a.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Sep 2024 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725974029; x=1726578829; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fpN52Tl3Y7hU7ZRXluVo1s+cWZSZSn4C8T8BEZMK7SE=;
        b=Am+tsIX/q8YPkmqKLk3MEsUHCWyN0fZsQrPapl2OijcrId7JwKGjfLWRzE3eAh75Tr
         RXyaQ8EkrYjCcg49T97gnEhS9EYBGGsK6bBD+XdLPOhUACQUAo4Ni5muvF8PCCnNUFkC
         I/pzqs8opqqDdBS1g2cKU/VFwi4hccoTQBdysKq0YNZk3HiNRCy/UHt4wgfb8f7Kd6Gi
         7nW0eXu9h74kZoSySijqEWMstVy4XbGDZ7c52a7WKQamWxeFU19w4gyfGTX9v5plm14M
         PUOdZ/bsTo4eYkk1MUY3nh1tyPt3WkWOFsLmwLmZ80Zd+akzbtfGavJ82uTJlB3ePRPn
         c30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725974029; x=1726578829;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fpN52Tl3Y7hU7ZRXluVo1s+cWZSZSn4C8T8BEZMK7SE=;
        b=ewTZ3unFqFc2jgwxnGhEwqLrEmeUdQEbadD0NHuMJXMfQ/ICysCHTU1iPoEHQJn81W
         M0g0si5T3AzlG5LlkFdwpRNf/1j0i78mEGDL2LRMLvQXNQ3zoYJqIiy/jHQOW6Ky9Z7z
         btQS5lHERkwRZ5GObaWdHUFVk5IUfJM3Hn8ODS4VwCYXDT+RE8cVIVav3lRblh9pira5
         Uhdm0MBULNF+tK/hqKYyvWHV619U1lxv7AVW4YVJkpecpO6KNmOVzkC7jKH3H8MpFeIv
         GRDY1Qf+kPyEero+W0EPbyq1jP1Z3DSfvMSRYrPKis8033J+oHCh9WpkAOvgB4d+d/0J
         T+Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXPJ5kBEr5OycZ8dIkNoPg4p71hawQiwEB4fOsaMgJeiDFF0SzYXrLcU9+PxOB4hnkUBMM4OgshhxI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWFKbZ6ayKH5d3cvZQ0RI7yfbavjUWaxW4lXcfqOf2TutalNDq
	tk2run/zkMR8nKEgddo2JWG0gYKl5jvnBxgGFALsksWJ4oEul5rQt7gtfcfFbw==
X-Google-Smtp-Source: AGHT+IF5PRcpk2RCeI33il7JeEsHL67QzDDZTB7lIxRX8RSfCSIdG7+kckjVTEpmGMcjUlhDs60Fuw==
X-Received: by 2002:a05:620a:4406:b0:7a9:b8dd:eb96 with SMTP id af79cd13be357-7a9b8ddef9amr999401985a.30.1725974029054;
        Tue, 10 Sep 2024 06:13:49 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::ed50])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a9a7a04667sm304784885a.75.2024.09.10.06.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 06:13:48 -0700 (PDT)
Date: Tue, 10 Sep 2024 09:13:45 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org,
	jorge.lopez2@hp.com, acelan.kao@canonical.com,
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
Message-ID: <fe0d3259-c60b-4ef8-aa42-edb5ca2e2d90@rowland.harvard.edu>
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
 <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
 <CAAd53p4i1zzW2DsVfirjXVsQX0AgXy1XbzWaM-ziWmAmp8J1=A@mail.gmail.com>
 <7be0c87a-c00f-4346-8482-f41ef0249b57@rowland.harvard.edu>
 <CAAd53p7c4-jpZ6OsW+H9qw2mvvr8kSfX2UEf8YrsWJt5koYbAA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAd53p7c4-jpZ6OsW+H9qw2mvvr8kSfX2UEf8YrsWJt5koYbAA@mail.gmail.com>

On Tue, Sep 10, 2024 at 11:33:02AM +0800, Kai-Heng Feng wrote:
> On Mon, Sep 9, 2024 at 10:39 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> >
> > On Mon, Sep 09, 2024 at 11:05:05AM +0800, Kai-Heng Feng wrote:
> > > On Fri, Sep 6, 2024 at 10:22 PM Alan Stern <stern@rowland.harvard.edu> wrote:
> > > >
> > > > On Fri, Sep 06, 2024 at 01:30:47PM +0800, Kai-Heng Feng wrote:
> > > > > The HP ProOne 440 has a power saving design that when the display is
> > > > > off, it also cuts the USB touchscreen device's power off.
> > > > >
> > > > > This can cause system early wakeup because cutting the power off the
> > > > > touchscreen device creates a disconnect event and prevent the system
> > > > > from suspending:
> > > >
> > > > Is the touchscreen device connected directly to the root hub?  If it is
> > > > then it looks like there's a separate bug here, which needs to be fixed.
> > > >
> > > > > [  445.814574] hub 2-0:1.0: hub_suspend
> > > > > [  445.814652] usb usb2: bus suspend, wakeup 0
> > > >
> > > > Since the wakeup flag is set to 0, the root hub should not generate a
> > > > wakeup request when a port-status-change event happens.
> > >
> > > The disconnect event itself should not generate a wake request, but
> > > the interrupt itself still needs to be handled.
> > >
> > > >
> > > > > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
> > > > > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > > >
> > > > But it did.  This appears to be a bug in one of the xhci-hcd suspend
> > > > routines.
> >
> > I failed to notice before that the suspend message message above is for
> > bus 2 whereas the port change event here is on bus 1.  Nevertheless, I
> > assume that bus 1 was suspended with wakeup = 0, so the idea is the
> > same.
> 
> Yes the bus 1 was already suspended.
> 
> >
> > > So should the xhci-hcd delay all interrupt handling after system resume?
> >
> > It depends on how the hardware works; I don't know the details.  The
> > best approach would be: when suspending the root hub with wakeup = 0,
> > the driver will tell the hardware not to generate interrupt requests for
> > port-change events (and then re-enable those interrupt requests when the
> > root hub is resumed, later on).
> 
> So the XHCI_CMD_EIE needs to be cleared in prepare callback to ensure
> there's no interrupt in suspend callback.

Not in the prepare callback.  Clear it during the suspend callback.

But now reading this and the earlier section, I realize what the problem 
is.  There's only one bit in the command register to control IRQ 
generation, so you can't turn off interrupt requests for bus 1 (the 
legacy USB-2 bus) without also turning them off for bus 2 (the USB-3 
bus).

> Maybe this can be done, but this seems to greatly alter the xHCI suspend flow.
Yes, this approach isn't feasible.

> > If that's not possible, another possibility is that the driver could
> > handle the interrupt and clear the hardware's port-change status bit but
> > then not ask for the root hub to be resumed.  However, this would
> > probably be more difficult to get right.
> 
> IIUC the portsc status bit gets cleared after roothub is resumed. So
> this also brings not insignificant change.
> Not sure if its the best approach.

It should be possible for this to work.  Just make the interrupt 
handler skip calling usb_hcd_resume_root_hub() if wakeup is not enabled 
for the root hub getting the port-status change.  When the root hub 
resumes as part of the system resume later on, the hub driver will check 
and see that a connect change occurred.

Alan Stern

