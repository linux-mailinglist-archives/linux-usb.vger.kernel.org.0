Return-Path: <linux-usb+bounces-13698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74716957B71
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 04:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B1A7DB225B9
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 02:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AB4E40870;
	Tue, 20 Aug 2024 02:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="wvjQr1zw"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757EE1C28E
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 02:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724121071; cv=none; b=XMWj5abxV9SJ6lt9OaMtwFCsPpM4ElGLsccBaRlzaK++t9A2W/Jd8ehxs9j8WJTu/4o/0rUM+3OgBTEpUkY+uDeYkrYC5kcs1xw4kKuFT8Wg++PjBx6EV/yvaTW8EjOPRsRUuy7jaXp9lBB04o6rCvHgDnYK7+P3Mpw6EtFB80c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724121071; c=relaxed/simple;
	bh=X4pUZjFHh+atbmSEesDAN7m6L9U3ll3z6YtLoWj3i6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f2vU30dpMopqUUh+DdLv7OSUq5asPVsaduNdRM+MXz0Z1LR8AwuHn08VyFSKwYnPIBNoP3ARNIXAXwzn7GD9+QBKhcX7qNEXyQhLq71715uibg3InxnciElTD+WF4pB0sBTkncmHtw240Q0S61R/V7hyo6vjfcEKhV1bjKo8sT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=wvjQr1zw; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-49299323d71so1843248137.1
        for <linux-usb@vger.kernel.org>; Mon, 19 Aug 2024 19:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1724121067; x=1724725867; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mqpoKCWyifK+ET7fuTv1wH7YXi6lhsgH+FAT7wqmTY=;
        b=wvjQr1zwia54+m0+SqYPptO2s/VZkTgAG6o3VQ4AHp+aiIaZRgTH+bzd+wvlSXvb5I
         htRzk9X/Z4+fZpAGMurIOXcA/ho5uDUQ1l1UhPENZA+LL2m0g85kqYoajkkJEfBclgCQ
         DCXitIBTgI36WY6HyGHehWjrYevHzdAFFFAoVVMFEa+qMtLFY7bI+/GjyK21CIuevR1G
         O+CNpPS0KzuIfw8HItl2gT6BJo5VGKEJHO9xKvsREaI4rW5Gq4RkO1dOk4OYOz89OSXk
         qxdJdvqZ7vZBAu9ax7PHg0enfib9an0909skJopyfoJWzZEPmjU6dqi911PFujOYGb5t
         TKGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724121067; x=1724725867;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7mqpoKCWyifK+ET7fuTv1wH7YXi6lhsgH+FAT7wqmTY=;
        b=QgLfsDzTSooITC8fn3OM7Zso1O7XkbACgJ5+FVhN6kBP2WzQkukoOEP1PndfcqxGdp
         0Mf217Yv2V/PoSE8brnGOoobPgm7X4yeU5M9VJ9KnZFqn/biqmdo7+8FK+fsPCXP0IQ9
         /aC2u2H26cTsegBYHPeR2IXThl7AeWscgMOJuGGQYEvr/iB5PN1Ncv/t2jCGLcYv5RI1
         9bu8H7MSlyniUjGDSH/aBpUUD4/1dSaEeZpYrW7R9HwXgywy6puxJNOPonHZRU0Sh4LE
         6XptBoUkSlAlnDOrpRkmUDlSQJQ47Bh2dp5KUx/6CM6PB7To5YgdUIL02EdDM8YunsOa
         1gGA==
X-Forwarded-Encrypted: i=1; AJvYcCVtKZEkFXfaC0EG/c0fG33SGT1xasDL6jldClrc2HgwUpwpesZHbTvwSuuydoKPw9Y9PkTM8v4TjMqN3m5FwVrUngFuPhXwHmRn
X-Gm-Message-State: AOJu0Yyg6f3hTCahhWg/mYwSIiuti+JcNd583TC9rgQuFRgZMbWh7UtW
	s2Lr5MGkM9LPxa9XZaHHCLRJ4dIt4a5v1ve0AEVlZXul4h5GiZi94Te6/n0/Nw==
X-Google-Smtp-Source: AGHT+IHWDxY8GbMwAR0OBZxPuRx2s09i/lQO0qS4xVPZvJ4y+H/lOztCfraZkvCHnXfID2a66CDHFg==
X-Received: by 2002:a05:6102:6ce:b0:497:6bb5:3991 with SMTP id ada2fe7eead31-4977964b14bmr16623986137.0.1724121067302;
        Mon, 19 Aug 2024 19:31:07 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ed1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fec5ea7sm48342336d6.88.2024.08.19.19.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 19:31:06 -0700 (PDT)
Date: Mon, 19 Aug 2024 22:31:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	syzbot <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <9ff214a6-10be-414b-bf86-3757dd819243@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
 <0000000000009f6f85061e684e92@google.com>
 <51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
 <1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
 <2024081909-afar-trolling-2a67@gregkh>
 <20240819101358.77aea582@foz.lan>
 <54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
 <20240819182456.5e13315a@foz.lan>
 <044260d2-4aa3-4937-9f5b-91e039a1df41@rowland.harvard.edu>
 <20240820011033.79312cb5@foz.lan>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240820011033.79312cb5@foz.lan>

On Tue, Aug 20, 2024 at 01:10:33AM +0200, Mauro Carvalho Chehab wrote:
> Em Mon, 19 Aug 2024 13:14:19 -0400
> Alan Stern <stern@rowland.harvard.edu> escreveu:
> > Currently the driver exports only bulk endpoints, even though it doesn't 
> > check the endpoint type.  You can tell because the only routine in it 
> > that calls usb_submit_urb() is smsusb_submit_urb(), and that routine 
> > calls usb_fill_bulk_urb() before doing the submission.
> > 
> > Given this, I suggest merging the earlier patch submission from Nikita 
> > Zhandarovich as-is.  If the driver ever evolves to include support for 
> > isochronous endpoints, the probe function can be modified then.
> 
> I'll see if I can try his patch and see if device keeps working. The
> logic indeed use endpoints in bulk mode, but I'm not sure if, for all the
> BIOS files at drivers/media/common/siano/smscoreapi.[ch], the endpoints
> are properly reported as bulk.
> 
> What happens if an endpoint is reported as ISOC, but the URB submit
> is called without URB_ISO_ASAP? On a quick check, the code at usb_submit_urb()
> seems to not complain about that.

It _does_ complain if a driver submits a bulk URB to an isochronous 
endpoint.  See the usb_pipe_type_check() function and the dev_WARN() on 
line 503 of drivers/usb/core/urb.c.  (In any case, the URB_ISO_ASAP flag 
is optional, so of course there is no complaint if the flag is missing.)

Furthermore, if an endpoint really is isochronous but the driver uses 
usb_fill_bulk_urb(), the transfer won't work at all.  URBs for those two 
endpoint types use completely different ways of specifying their data 
buffers and transfer lengths.  See the paragraph starting with 
"Isochronous URBs have a different data transfer model" in the kerneldoc 
for the definition of struct urb in include/linux/usb.h.

> I would be a lot more comfortable if the patch were using just
> 
> 	if (usb_endpoint_dir_in(desc))
> 	...
> 	if (usb_endpoint_dir_out(desc))
> 	...
> 
> or something like this (to accept both isoc and bulk):
> 
> 	if (!usb_endpoint_xfer_int(epd)) {
> 		if (usb_endpoint_dir_in(desc))
> 		...
> 		if (usb_endpoint_dir_out(desc))
> 		...
> 	}
> 
> 
> instead of calling usb_endpoint_xfer_bulk(desc) to check if type
> is bulk.
> 
> I'll try to do some tests, but not sure when, as I'm traveling abroad
> this week.

Instead of going to the trouble of running a test, you could simply run 
"lsusb -v" and check whether or not all the endpoints are bulk.

Alan Stern

