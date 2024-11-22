Return-Path: <linux-usb+bounces-17802-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3249D6495
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 20:29:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B41AB22350
	for <lists+linux-usb@lfdr.de>; Fri, 22 Nov 2024 19:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69C61DFE02;
	Fri, 22 Nov 2024 19:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SOJ0yigV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2CB4C62B
	for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732303744; cv=none; b=g3jnhUMyG4nSShLoN6Yf8DGvFBlgE4fSn+7S1TKChI4UIVPQMJHg/TJdz8uTOKvIZin4Iu12P/48fEIM5kIiTAJRAfrSDdnG5XWwkhjxVMTzwjbXO9jB/aRl16BHBYa8RBJEnbQEVpg+hZ21suPSa2dc0B0IXGP3/zKpAZAS3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732303744; c=relaxed/simple;
	bh=+wvYqj0hzUo8CjjpGtwcJM9IzujjbwiQcJq6R6HNMnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyY3WC+zZN48wY82eIUqJ0RZpQxJYHHYobiJdFQ0rgsf5SwVRv07yjrfsH+3QzMhqAyHeOD2dYC7r3haKFxPjeD2qjFq3yfHJk/F/lQFPK5s4UhuctXoQ9JdvnQjIPw37Bx9t7pFyXMxPTzfysXMO6nmBTmlkwprACqpbEQsp+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SOJ0yigV; arc=none smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-5ebc1af8f10so1238797eaf.2
        for <linux-usb@vger.kernel.org>; Fri, 22 Nov 2024 11:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1732303742; x=1732908542; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1x7xfvlrmJaDu80BzB9IqPpgykKRgIKzolHaNu7VII=;
        b=SOJ0yigVHXo/niBc7Wwaj1nU9Q26Q0DkCqipyBxe8rJhJbxLgn80BK2tALawzfubFp
         HJNwmUp855HhoAaNUIyZM+39TzpgkplXkwr7UuuxL8NGX4gfLYXqbReKnVPZ8qplR3s1
         WkfeJFJLo7Rf5uWrfwoFg5bISa7eFg0nT8Q4SJACpt3Yq2uqbcJQA3nSr1toeZ2sEAnq
         wvxSDKDmhpSxIvCQQsd57QjIpzizE7EyAoE8t3mi+TAeT+L75972GFzRh4N+UBcdqtjk
         cAl9MjhgpMawDdjdGS+dzW0WGwG1dWeXvg3yQbcmq+OuAVD610Oxqfp7F1wfvPEdebw1
         NaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732303742; x=1732908542;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p1x7xfvlrmJaDu80BzB9IqPpgykKRgIKzolHaNu7VII=;
        b=KJZe4xMz4zrxcjT+APQLABtZUU9UQ37kdz0sOnjQacviWlV0ZoIKtq9+DmQTh4Otj9
         f68WkbbwXkP6zy2S3sfIiv9JulUCXP1qfou15L8oc1m4VUskdZLO4y91WA5HUlMjvm2h
         V2+q+dQJcDtjK5wOIefs3+wP5WVl+Jn2SeO6oVhiAK/gSzq19Stu5PRECGOB3PcDWbo6
         CAdlVdhthqSUFMYvG8xdxcbi+UpxA2xBeAaIkmw+pZFyKlJzzuX4UzNvlxePFetI/UVc
         1ho57XANq0Zkyt2C/uRjM69ubmaDWmNZCiVfbB9tElqwkwFFRJKVR3fZBL4z+ez5LfkO
         SeVA==
X-Forwarded-Encrypted: i=1; AJvYcCW/MVF4RhuqQeglYgcO4zd8q0zo18ywO4urgtMuwvFZc81N07mWoLR6HjLwpEOVIe+iYTP+QiT5Xpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBHa1guK7STPL9YosTbS/+EAxyJkpz6f3Of+sMgUd+Re1NjIQR
	tjkc2TH5JoyO4Pg2+GAgk+7oW71wkihyj9GoE8LexgfOXWWudsHpunziMwOnYA==
X-Gm-Gg: ASbGncu756TBZhmFmZbeODO9/n1k0j+ncrPBDDPOw0SFtumQfpAooVhohSYydyPfaiE
	piGdkU1UBl85S89vLaccGuaSCyRaeGvopRnL5MdELsR+g+Qf8wB7rklhErNpWQkMZbBDyC5ViRe
	ZGEXlBb4SnGBI/JmUqJt5Skgj6nDc1wl06ECB5PE8zunvQoiV/RVZkWKBc9ajJiGaERNwCWfu6w
	ybflojfjO1BktLftVCTSYpvB9c6hnxvNjYoAHh+vZRCGfOOPpIWG4F4y3Q5Vm5UU058GIIpe8dz
	CjuYxkk0PRzLCQnSfB+JYjVm3O/AfrtWwa7i/rZ3W80=
X-Google-Smtp-Source: AGHT+IFJaJYbdl27WU0YoIhk0eZMlk3wAZgpIRwLhTBQlnEtI/cEe0mTaSPO41FsOpZmATx51CvHWg==
X-Received: by 2002:a05:6358:2810:b0:1c3:98de:facf with SMTP id e5c5f4694b2df-1ca7972486amr417098755d.13.1732303741650;
        Fri, 22 Nov 2024 11:29:01 -0800 (PST)
Received: from rowland.harvard.edu (nat-65-112-8-56.harvard-secure.wrls.harvard.edu. [65.112.8.56])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c4901bdsm14933581cf.86.2024.11.22.11.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 11:29:00 -0800 (PST)
Date: Fri, 22 Nov 2024 14:28:58 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: How are halted endpoints supposed to be handled in Linux?
Message-ID: <eb3bae13-dd89-4c84-a4c9-4fb49348928c@rowland.harvard.edu>
References: <20241121001138.23a45f6c@foxbook>
 <20241121000216.kif557p3p6xyahax@synopsys.com>
 <b34b5ea0-2804-4692-bede-70ba9065c86c@rowland.harvard.edu>
 <20241121112653.06ba4ee5@foxbook>
 <0dd70803-a074-4859-8cc9-5bd210d12536@rowland.harvard.edu>
 <20241122135733.3d040c0d@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241122135733.3d040c0d@foxbook>

On Fri, Nov 22, 2024 at 01:57:33PM +0100, Michał Pecio wrote:
> On Thu, 21 Nov 2024 10:06:50 -0500, Alan Stern wrote:=
> > > One way I see with existing APIs is to wait until the driver
> > > submits a new URB, but are drivers prepared for this? Is EHCI doing
> > > the same?  
> > 
> > Yes; see above.
> 
> That's comforting to hear.
> But still seems to have races, see Mathias and my reply to him.
> 
> I suppose alternative solutions include: bypassing the BH on unlink and
> error paths, or making it call the HCD back when it's done. The latter
> may not be so trivial, as it would ideally be per-endpoint.

Bypassing the BH might not be a good idea, because driver's completion 
handlers expect to be called in order of URB completion.  It probably 
wouldn't make any difference, but it's hard to be sure.

> > What about automatic unlinking?
> 
> Maybe it could make things go faster and smoother.
> 
> Networking can tolerate dropped packets, but considering that their MTU
> is larger than USB MTU, I suppose they have to split payloads across
> multiple USB packets and may get out of sync if only part of a payload
> is dropped. But I don't know, they could use packet headers to resync.
> 
> > Note that some class drivers treat -EPROTO as a fatal error.  That
> > is, they don't retry and their completion-resubmission loop breaks
> > down.
> 
> Well, that's on EHCI.

No, it's the behavior of the class driver and is independent of the 
type of host controller.

>  xHCI gives them a chance to continue with the
> remaining URBs. Hopefuly nobody relies on that...
> 
> > However, this seems impractical if the class driver wants to retain
> > the existing URBs already on the endpoint's queue.  (I don't know of
> > any drivers that do this, but still...)  Perhaps we should adopt the
> > policy that -EPROTO, -EILSEQ, and -ETIME cause all outstanding URBs
> > to fail and enforce this policy in usbcore by automatic unlinking so
> > that HC drivers don't have to do it.
> 
> I wouldn't exclude the possibility of sloppy drivers leaving URBs
> simply because they don't care. Hard to tell what's right for them.

If they don't care then they won't care if the URBs get unlinked.

Alan Stern

