Return-Path: <linux-usb+bounces-14388-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E9D96641E
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 16:25:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69AF82856CC
	for <lists+linux-usb@lfdr.de>; Fri, 30 Aug 2024 14:25:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247D11B2501;
	Fri, 30 Aug 2024 14:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="sIWgVkk5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4121A287C
	for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 14:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725027925; cv=none; b=U6zO59rN8G9NvNfD/UTdyuhdvC6S162G/ItLwqBLUVHtSElJLSKKVjUEIGI1ggw1WetMKFxrtvoWK3648NcHunHfCRwuqiPo5VbZ8daDGTOv2oq3f4E6VRdL83n7MA2HCmoe8W1PhXvp1W0SsfTl6vAS4qZyqDSRQbTyylfoh3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725027925; c=relaxed/simple;
	bh=Z5R9wWBIUlj0tYsD5MrPJda1qnlei4++gZAotZb4DVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PO1GZtk0MoeBwTYHm8YtBUew4x3pmcAvGQVirm6gu8kp4ZsGs2nS9PpfdogRp5Q8c8J5bsF6KA+QXkAuoKNLtW/TAQxZBT6vHcBQ9sAgYFdlbA33/0boVZQbYHsDytZ6qI2/qxDk3+wbLJ76kMDM05AjvnsfbMdxkvzfyAANKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=sIWgVkk5; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4567f52bf69so10578831cf.0
        for <linux-usb@vger.kernel.org>; Fri, 30 Aug 2024 07:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725027922; x=1725632722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3umQFafcgmp1gCyBXzHXiTLBA5P6I4VKDZh7hrNP7i8=;
        b=sIWgVkk5kMfQieykESGbfpu2tppxnwxW0b2btYfymAWpZhsgcACTYRLchNG3bto95I
         fOzLeNLpGdO0syyOyBigghuTjLshAbG4wRRGjNNUqH2+bxjm/3waEUC3XMyxaRk4O//Y
         Z/autvcy48QJhYwjs/ps7unQx3vwFWjQt8mhgd0/p1bNkMrCB028BnI3fX/2Q7+K7dkb
         aElAD+YnKDTxir/UcD76PFxBa/uLp9C02aYEq7fRiByfVSD8n9Tq3aqx//Sc9MQRaHK6
         VTMb3tTs6mZ0REFWtAMYChLqIwpzBGm7r+b8cDq5FoU4X6ZmYSozxFz3C9RrKKRDr1MX
         zhuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027922; x=1725632722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3umQFafcgmp1gCyBXzHXiTLBA5P6I4VKDZh7hrNP7i8=;
        b=cqQKSk5Fo8boFA61X+m5M5YwSwEHuzgIEOroC5malUOXJIe7Zfj+yD7nGhSgC9HVnC
         /3YEuD6WaPChRc6rizS3N5tysYx73Z8h9l96bRQRgmN7d4VqHTYE2dbB1MHEZ5bdl22Y
         OS9nDYbumrYd0V2jM0C1IiaRFcBoiFEq7uHKpyLSwF2AqJZhhM9xpT+xGBatA93iGn1/
         GJ3MAIbBJlK4xH3XBVAuZ+a1rHW0yqoUSZP7IpHCeI5uTfcI0gP3ceK1yEZ2ZyejbVty
         LPGuuvy6yEkfrh2CHJP6Z6UFMuTMhvwJ8qfpYPe0Bp57TRTRrdf2d1ZMJWm3uOanfEzk
         ZNoQ==
X-Gm-Message-State: AOJu0YxFM9DIyZAzrbUnorvOZRBiMb4M2zsvoQ/+kMpNfWcAjdB127dI
	BvhOvyOKUgnMzwgvgbds/DV08hlHxNTr7eJp6oUO8emRzKAtQgWhGG6eN9IKZ1ihXjlzBi8o0ye
	lYw==
X-Google-Smtp-Source: AGHT+IFP44JgFqgEiup973yAlSd9QZyEJWTgEx3eT/iqJko1AMwTreA4BWm4Q7AAjuyfQSXCinmbVQ==
X-Received: by 2002:a05:622a:488f:b0:44f:f14c:6a63 with SMTP id d75a77b69052e-4567f4f9b1amr70326691cf.11.1725027922493;
        Fri, 30 Aug 2024 07:25:22 -0700 (PDT)
Received: from rowland.harvard.edu (wrls-249-137-9.wrls-client.fas.harvard.edu. [140.247.12.9])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45682ca38e2sm14288721cf.35.2024.08.30.07.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:25:22 -0700 (PDT)
Date: Fri, 30 Aug 2024 10:25:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc: linux-usb@vger.kernel.org
Subject: Re: Understanding 'lsusb -t'
Message-ID: <92687a8a-4dbf-4a16-8b6d-a2f78f7b3ddc@rowland.harvard.edu>
References: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <63d4782a-1d83-4252-a0ca-a9b50e6074f0@eyal.emu.id.au>

On Fri, Aug 30, 2024 at 10:14:20PM +1000, Eyal Lebedinsky wrote:
> I assume that the generated list is a tree, so each leaf (Device/If) is on only one point.
> 
> I note this output:
> 
> $ lsusb -tv
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> [trimmed]
>     |__ Port 004: Dev 004, If 0, Class=Hub, Driver=hub/4p, 480M
> [trimmed]
>     |__ Port 005: Dev 006, If 0, Class=Hub, Driver=hub/4p, 480M
> [trimmed]
>     |__ Port 006: Dev 019, If 0, Class=Hub, Driver=hub/4p, 480M
>         ID 2109:2817 VIA Labs, Inc.
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci_hcd/10p, 10000M
> [trimmed]
>     |__ Port 006: Dev 006, If 0, Class=Hub, Driver=hub/4p, 5000M
>         ID 2109:0817 VIA Labs, Inc.
> 
> I removed some content that is not relevant to my question.
> 
> Note the Bus 001.Port 006 and Bus 002.Port 006 entries.
> 
> I verified that both are for the same (one) device. They do not show when I disconnect it.
> The device is an external 4-port USB3.0 hub. It is listed once as 480M and once as 5000M.
> Nothing is plugged into any of the four ports.
> 
> Is this correct? Why does this device show twice in the list?

USB 3 actually uses _two_ physical buses.  Each cable has two twisted 
pairs of wires carrying the SuperSpeed (5000 Mb/s or more) USB-3 data in 
and out, and also has two wires carrying the legacy USB-2 data (480 Mb/s 
or less) in and out.

These physical buses are represented separately in the kernel.  In your 
example, Bus 001 and Bus 002 use the same cable and the same xHCI host 
controller; Bus 001 is the legacy USB-2 bus (you can tell by the speed) 
and Bus 002 is the SuperSpeed bus.

Most devices use one or the other of those signal paths, depending on 
the speed they connect at.  But hubs have to handle both paths, because 
the devices plugged into them may want to use either one.  Therefore 
your VIA Labs hub connects to both of these buses.  That's why it 
appears twice in the output from lsusb.

Alan Stern

