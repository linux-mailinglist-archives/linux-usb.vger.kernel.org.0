Return-Path: <linux-usb+bounces-13276-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0939B94D1A2
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B88EE280E8C
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 13:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40A3E195962;
	Fri,  9 Aug 2024 13:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="OgOEtCmS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6023196C86
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 13:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723211623; cv=none; b=WuuqDloaDgOfyc6hmNocjGfTUuW31L5P86eclWWO69GCqlqYLZoZfYLZmVY0ygbnyk6wLzeNzMYSbROerYQSlN1vXVVumoyeOo1zyaQkt1pByBGrD7LxM8AjIZuKKKZNJJEnaC7rXnhIhLZyp2Oip6WED7PHOVqQ8NQOaSTxXgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723211623; c=relaxed/simple;
	bh=7n2T+P4ANvqZeOut5RpDHTSbQ3lR9jXWePNGBFM9qVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/Nht3YQOBVWpRxlq182KuN545UUKLav6/L3T8G1htg+BPkp/7ih+PJdG19IKcVSXEtJJkq9iQubk/k11/RRFBK6oF4NxOdgcqQt9NJNJrCOndYt791h72iAaZLypd6sASCyYMLxGvqzHcu7KzR2D8WRrfqrC4h1eCAZmVM+qb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=OgOEtCmS; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-67b709024bfso23005637b3.3
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2024 06:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1723211621; x=1723816421; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SX0OzF7OzHWR9wIp5+Pbjk636WCu/tB3mDHpQATUaPk=;
        b=OgOEtCmSKb1eCnGA9jCPqFwEhzO8S7BoW35usMG9xaiNUKB1tNGFniQuJVpQ35p9pH
         lKm6AnIdVFcuExX7vpEbcAJzbjYI3E7cWv4mHg6B6g/RzNaC8UxK9NxWeiY3fyz3cyn5
         QiUi9n2ilNY05Cntv0CzLgaIPg3UXnVavhwACzdpbfDMNdlkgoaMIrpUCTlHW29p7m0l
         9ThbGXSi3Uycf/eJkQUWogrbf8rR/Tvd+Tlbn+laK9KF0i4DU0YYjwjw9ej1lkNq7D25
         GD1VRu5KDtsKIGhFmaZZNwlJACzIvlOHfjZkmcYxx7wwj1ZV3XBZAAxbrMQdkte5kOzN
         OGCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723211621; x=1723816421;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SX0OzF7OzHWR9wIp5+Pbjk636WCu/tB3mDHpQATUaPk=;
        b=Jm4WvfAlhHDhQ/RX/fZ7iH21rbkQoTkkTn+/yHgZBl1aJny/3HCCYcI8jQycxdqHQ7
         6yLIiuF8Axs74/SvCaCYkEQtqHYx7+ctCRZawrVSwUxdHU4LwhffetAOGNqGT0hgSYLR
         CYo/EXmoSROoXGrjJwIUHAHHgQH9+hHZdmZX0DNLsp1QLAIDi0/rHusbz73RGWHYKS+q
         91IThLibWuHrhcvluRNbBtCgKaoY6ihO56+0CEqT2GAXuessRAaciHFSbLy6WGXkP7tW
         RRgTnhWRVOzLvluPQKcZedgzH5i1MhcdohCPWj4DfZDt7TANk0pTdzcuujmimiS/32Zy
         pHJw==
X-Gm-Message-State: AOJu0Yzxz74R7uOFQVc3kkZihM/GTC2UuDaHelnlzrEQAb1jACr6ohN0
	FEYBu8pNhFjrSo/vMNfPZX8SpHfIguyeSMXKxAWw0K9eGeC1OCGY9CwvQXmXtGe3HNpHpx51ntN
	yCEy+
X-Google-Smtp-Source: AGHT+IHYedQIBYR4d6jTh7SOrxohUj3rqXC1Z2qE+fLAS+V4yRqsz6jPTt0amCoRCDp84Jvv/lomHg==
X-Received: by 2002:a05:690c:4e0b:b0:63b:d242:4fa0 with SMTP id 00721157ae682-69ec6037746mr14829227b3.21.1723211620864;
        Fri, 09 Aug 2024 06:53:40 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a3785d4709sm263051385a.9.2024.08.09.06.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 06:53:40 -0700 (PDT)
Date: Fri, 9 Aug 2024 09:53:38 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?Q?Micha=C5=82?= Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Forcing re-enumeration of a chosen USB device from userspace?
Message-ID: <4256543b-b834-4051-a962-0020f0180537@rowland.harvard.edu>
References: <20240808083921.0400af26@foxbook>
 <f46dc174-2f23-4a19-a9f6-5ae6e4e2d304@rowland.harvard.edu>
 <20240809110206.4b43c1f2@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240809110206.4b43c1f2@foxbook>

On Fri, Aug 09, 2024 at 11:02:06AM +0200, Michał Pecio wrote:
> > You can reset the device by using the usbreset program, which is part
> > of the usbutils package.  Some distributions (such as Ubuntu) include
> > it whereas others (such as Fedora) don't.  But if you don't have it,
> > you can get the source code from https://github.com/gregkh/usbutils/
> > and build it yourself.
> > 
> > If the reset causes some descriptors to change, the kernel will 
> > re-enumerate the device.
> 
> Thanks for the suggestion. I compiled the tool fom Greg's repository
> and ran it 100 times in a loop, but the descriptors remained unchanged.
> 
> I only got "reset USB device" messages in dmesg and class driver noise.
> 
> 
> I had no luck playing with sysfs entries of the device, but I found
> that the parent hub allows me to disable/enable individual ports. There
> is some subtlely in USB 3.0 as the associated 2.0 port must be disabled
> first to prevent downgrading to high speed, but it works.
> 
> Curiously though, it doesn't have the same effect as reloading the host
> driver. My buggy device randomly comes back with good descriptors, with
> the same bad descriptors, or most often it doesn't come back at all.

I would guess that the difference has to do with whether or not power to 
the USB port is turned off.  But that doesn't explain why the device 
fails to enumerate properly the first time it gets plugged in.

Alan Stern

