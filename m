Return-Path: <linux-usb+bounces-2374-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E837DC502
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 04:51:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6A1B20EA0
	for <lists+linux-usb@lfdr.de>; Tue, 31 Oct 2023 03:51:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDF26566F;
	Tue, 31 Oct 2023 03:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DqA3DiLE"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24D653BA
	for <linux-usb@vger.kernel.org>; Tue, 31 Oct 2023 03:51:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C701B3;
	Mon, 30 Oct 2023 20:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NcJE+muHCTM+F5ydwVKCzS7huTyeARslBg0+emRqTPI=; b=DqA3DiLEz4btMtwydEToDoDcBW
	pJpoRs+uF5ciYUtRW88W3duync7qDFpXA6gR5jc6RJHo1DZG3s8u6EzwtyP7hFSFOB4JZxP7LWcHC
	jn0fP3AgSKb8pfUZqRjht9L6tHphFHyFjAyuG2feUTkPKMeXJ+f4+HayiCLkGnKtnBxDGJ70X2OFN
	pWW7ttkPqVBoh4LTszRABbWARW77Vo4uQbxQpj8tj91QsyVoa9ID38zRtHe46XOMcNzL0bQoR322Y
	6681g3cy6ZTKg1O3U+QmV6+RNN/9p90fNNcUt1ZnIBFNTVvjsKK9pGAp89NvN86qKvjGbLusnbic3
	KHOsrx3A==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qxfmV-004UOn-0j;
	Tue, 31 Oct 2023 03:51:07 +0000
Message-ID: <842a0d64-279d-4052-a243-95fee608ea76@infradead.org>
Date: Mon, 30 Oct 2023 20:51:06 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Gaps in logs while using usb-serial as a console
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: ariel marcovitch <arielmarcovitch@gmail.com>, johan@kernel.org,
 linux-usb@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <CAFGKuwoFUaXMsOOWJNBenQDG6+syt80Z9pvQQK1XSZFztC2_SQ@mail.gmail.com>
 <2023103052-unpeeled-calibrate-ae48@gregkh>
 <CAFGKuwp7JH8H9vjz8iJ24R9TRW0GDE-O96VBAG4L8X4DhTabXg@mail.gmail.com>
 <2023103003-defection-recess-cf49@gregkh>
 <968c62ca-0ef2-4bf1-a17b-a6d88d5e2e20@rowland.harvard.edu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <968c62ca-0ef2-4bf1-a17b-a6d88d5e2e20@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/30/23 07:19, Alan Stern wrote:
> On Mon, Oct 30, 2023 at 09:30:15AM +0100, Greg KH wrote:
>> On Mon, Oct 30, 2023 at 10:15:30AM +0200, ariel marcovitch wrote:
>>>> Please realize that usb-serial console was the result of me loosing a
>>>> drunken bet.  It's amazing it works at all.  For "fake" devices like
>>> LOL your drunken bet was quite helpful to some people
>>> Because modern PCs come without a serial port, I wanted to use it to
>>> see early logs on my crashing kernel without having to use printk
>>> delay and things like that.
>>> I'm curious as to how kernel people debug PCs in general...
>>
>> We use a usb debug port connection (it's a special cable).

For EHCI it is a special cable. For XHCI you can use a special cable but
it is not required. (I saw a few people on LKML say that a normal data cable
works so I tested it and it does work.)

But if you want the special cable (for XHCI), this one works:
  https://www.datapro.net/products/usb-3-0-super-speed-a-a-debugging-cable.html

So I tested with both the special debug cable and a normal A-A data cable,
both with satisfactory results.

> Sometimes people use netconsole (see 
> Documentation/networking/netconsole.rst).  I don't know how common it is 
> nowadays, and it may not be quite as reliable as a debug port device, 
> but it should still work.  And it doesn't require special hardware.

It would be great if netconsole worked with wifi and not wired (ethernet).

-- 
~Randy

