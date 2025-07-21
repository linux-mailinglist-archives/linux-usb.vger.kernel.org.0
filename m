Return-Path: <linux-usb+bounces-25992-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CE5B0B9C1
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 03:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8864C7A991F
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 01:20:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297C815E5D4;
	Mon, 21 Jul 2025 01:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="CfdTtXsE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299A578F3B
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 01:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753060891; cv=none; b=uY6LXZwYT6r1Ak7V4RIlH+fUYsiAwsOGvb2+IlRIfVfnhs1RK6BCRtxVVGOKt5F2f3SUZCoypbWG58Tevw0+Oc5iSoB5S6VLqv9NhVIGZSWIOM//Uyfc3CsyRSs9ZFbu6xtox3eg7pc4uiqG2ZM5xNJyDf8AEHpYqDcCkCHYrCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753060891; c=relaxed/simple;
	bh=+MJ1Ymv+daQPTYNiE58qhqypmAUkFSHCG3m1YGa7Ftw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W8iTvUN0O/fEhO6JIrbaHh6lMcdVCN+NaluW42UvXpkGw2uIH0KTbUJMzc/4aqFW+wz7iD3bRxvAqo9y7+8cekRqkQuDoh32LC49/UJfhBRBwb/dLpOEqOmm+38ERZBDlz8vCjoPg+SVhqIRb8/l05e0uz7RDbSC0DCpFJ5RqpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=CfdTtXsE; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6fadb9a0325so36337186d6.2
        for <linux-usb@vger.kernel.org>; Sun, 20 Jul 2025 18:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1753060889; x=1753665689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KutpOD99zfcETHTtzhC3inW+4TFUP9RGVT5ONQg1qvM=;
        b=CfdTtXsEJ3Z/tFyirLVR0dMfOklW20d83cMgA7ugjNrvgQoAetyFYX8wYueES72LrU
         qaIfklElvz+HlfIEma3T8Xq6haQD2Lv9rt/ZDLj22xZOChclQZz2GuVldNt7FrOtotju
         mBmDdlsjBjwj5JWJNEJ/g2EdPhg34FKKyh5dXJi1iiSLRBmSLmuk19+f+Yz8zFLqywTW
         IwmwyGaJgfgTMgEDb9aD6jQKhcUhIl1ppYXdNr2/qitygAcyqdpol2XkSQ1vZpKgLER/
         72ODi2/8E2X14ptwRMN0WqosNnqppoGLJczwRkqu563DJGCI+uMUlXVnsBWv+mvOsFJ/
         /zcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753060889; x=1753665689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KutpOD99zfcETHTtzhC3inW+4TFUP9RGVT5ONQg1qvM=;
        b=qKV/m9cMKannoquYp+qPBRR9UmUv8iyfOrYil6vp2GvU6H6eabpBjUDc8g02q2mWvP
         02t2Mq7vJ6xN9lf790DCD3K9Mjk6M5JQCcnRqa/47zP5isRmVCnUAS7AVyQHJ/75Ys41
         c5Td68j7kMZkgvrc2VOxQZ/vwgRSFoU7fFbE2KGQZnQaipoVsF4bHXy7tC5pDINhUWhk
         j5uBAddUdKPsD3E/F9fYnnJ2D4O4qs/7S985qeeo50D2RL6owN9HC6NkMCtqT4s5zD8B
         d2mW4bIZN2dyYVg2f9nGYtVtJjBXQPC0x0SMQxiCLugRCxE5p3t+vCztKvmL0qQ+AvJp
         2+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCU3b9UyDwnXd4rDsLLQjxZ/PSIHT4/YMdcST2T950OnpMUexHDxYzzzbgd3T2IMS0gQqUbKy6L/ULA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4XWglKEQLKaxlc8MiZNISWWtc8Z3LHbYJOXtOr2hT3tDAxICa
	NaLEADuLObyyVHKcS+YJwtAz3Q6bvP3Lg/pb169cSkQjFelPf5ax46xeBgpa2lvQ6A==
X-Gm-Gg: ASbGncvLIJURpsjK4AKOdBHAJ8oAdW9dFUk8I1FA+Wd0XWfSmJ2G1BrNJg3o302ei+6
	GnoBL21JJjJyGFs1FvwT3SI7WlEy6nYMoGawAoMIldf2jJb7qtAl4irxxRGBxkWmkR9GE1s7fmb
	w4GACmiB1rrwIW6xjn7SVdlF9PO/tquWpv5oofUc1gtvnk/zUbMKEB7MD+2Avv+J3AaGtdF09DX
	eSOf3ddBef6F53y5AmCqmwxgpk8L8k0Qxyn7ClHP1H7Sfif6Aa2KhooPFumP9H66TO/QPxNwC0s
	porQOs3cY+iw2CRfCjhiWztxal//J+OErkidoWZKSChUTwBjJyCeKicBxs4Q7UfelA9D/heM9KD
	tkTJhkWpqVxCfOyi9AsIBltY=
X-Google-Smtp-Source: AGHT+IEWJdJ6j/5sk4yCskCysiI2a7M1IGPMx1kIxCHmUxxkULnnKpZ3yKjp41mgb1lTlIPkbNowxA==
X-Received: by 2002:a05:6214:ac1:b0:702:d60c:94ac with SMTP id 6a1803df08f44-704f6ac55c4mr315024336d6.26.1753060888997;
        Sun, 20 Jul 2025 18:21:28 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::401d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b777sm33924716d6.71.2025.07.20.18.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 18:21:28 -0700 (PDT)
Date: Sun, 20 Jul 2025 21:21:25 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Marco Tormento <mtormento80@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: hub: Move typec deattach before children
 disconnections in usb_disconnect()
Message-ID: <36a75fd9-71a4-4f53-9a35-560cd9cd5687@rowland.harvard.edu>
References: <20250720210847.30998-1-mtormento80@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250720210847.30998-1-mtormento80@gmail.com>

On Sun, Jul 20, 2025 at 11:08:47PM +0200, Marco Tormento wrote:
> I tracked down the issue to the following logic:
> - power brick is plugged in
> - monitor is plugged in
> - when I unplug the monitor in usb_disconnect() hub_disconnect_children()
>   calls usb_disconnect() recursively, and this results in
>   connector_unbind() invoked on all connectors, which resets
>   port_dev->connector to NULL on the ports

I'm not a typec expert; in fact I know practically nothing about it.  
Nevertheless, this sounds strange.  The recursive usb_disconnect() calls 
should affect the connectors to the monitor's children and the monitor's 
own ports, not the connector or port on the monitor's parent hub.

> - typec_deattach() is called for each device that has a parent, which in
>   turn should fire typec_partner_deattach()
> - port_dev->connector is NULL though, so typec_partner_deattach() is not
>   called and port->usb2_dev is not set to NULL even though the hub device
>   is actually gone

But that's port_dev->connector for the port on the monitor's parent hub, 
which shouldn't have been affected.

> In order to fix the above I tried moving the code that handles typec
> deattachment from the parent before all the disconnections, this way
> typec_partner_deattach() is invoked for the partner, port->usb2_dev is
> cleared and typec_unregister_partner() is happy.

In essence, you're moving the typec_deattach() call up before the 
hub_disconnect_children() and usb_disable_device() calls.  (The 
sysfs_remove_link() calls get moved up too, but they probably don't 
matter much.)  I'm not saying this is the wrong thing to do or that it 
will cause problems, but it does seem odd.  In particular, it's not the 
reverse order of the way these things were set up when the devices were 
originally detected.

Alan Stern

