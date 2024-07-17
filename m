Return-Path: <linux-usb+bounces-12251-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CCD933DE5
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 15:45:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4A251C22D3B
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2024 13:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EB72180A7C;
	Wed, 17 Jul 2024 13:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qKaRu1Z7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA2180A67
	for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223901; cv=none; b=uI2qtcmXg8gmCYDXpeLfnSuYInDOzJ0UUv1JTHgp4AMLZgD/5YwP3kAhomSbCIqadheEJefcsyN+cMeB2poJfYTE1yhefk+agW44BO16GeAgh8zHT/PtVMKVPrDvbAv8i6jn0fQ8ZoxvaS0CS4lGUidGdKlHNaBBPpKLKj5KXbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223901; c=relaxed/simple;
	bh=UhIxlitTqUL4U0DQIwp4cW2RFYwu4E8Y2tCJXj6ijuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AIHp0wkBRJ93EOe2WM5xiRqwpfBtZCFnuU13zjKHW6J4guAiu/di9QT63Usu51Jq8EVmdyblkBRh2/5pThhO0w4FgvQBAGAA/5qTwtXBA5OlDo0OJGwLUn2WxdwTn81Fa3+q9i1wkyGZdR9PrW0G7uEvZoiwhCPXjvS12g9ghBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qKaRu1Z7; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6b797a2384cso1479576d6.0
        for <linux-usb@vger.kernel.org>; Wed, 17 Jul 2024 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721223898; x=1721828698; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fALf2MLt+/Aew92qcalHrsbufxZ0gJXHdDz503oT6mw=;
        b=qKaRu1Z7m1AKPXWgx/OiZYCbDAubv0y0XmxeN8gpol/ekxRJOI2wZvbwOjLZxwNZLU
         /21OYRQkEG3+tJZKv/MqHEN3mT3DUEoT0X8/oZY7YMAcAr60FRQHVeE9G88zn5zEnmet
         TAvqEdXM0khWCPmL+z24jIVTjcGhaqv1icjuJInpTs3Z8Cgpo7WDc9o3+lGx3P3Z1nky
         ZBzAphTbMJEJu6qwBQAOZS9YLf4VEm56GhnUTZVS7UqSc1pUlMIKUoRg3BE97YK9oRo2
         zDr6lxChk9VxF77rtAXkfDHZY/yJ2GEW7j8pYFOWQ8KHQiQg39OJGFZ6DAz+paelFNHh
         gaRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721223898; x=1721828698;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fALf2MLt+/Aew92qcalHrsbufxZ0gJXHdDz503oT6mw=;
        b=Az7FyRZqydNPk0VS+UWAqoo3CWwJ88Zx6R+xxFW4o27j8fjAco8W4vUIP4I0i7+PKG
         OnxTD4IeT0nuRzg2hDsIHYgOw42K/enDgEM5UMMo84lvKUalM+gBU82zRMI3QIbqZ8zm
         oB0K+uPZUmkWEzbg03Vj6H1Ez08zSbI2pZDNF05d+FWWT+1PV8pNCxACnokFC7KaTDGF
         C6MpoV8BWKyxbG6IYtnm2B01/5W/QSpSljgjYl1ZDpuF9Kb3P+ainKHLCj5S4cYMphQu
         th+YT5OUeiiR8lyjGo3rwnnBNLSHIC1L/K48+3w9n9C8aVW2Qu+Fi0OztnIrJo/Q6VK5
         A2Gw==
X-Forwarded-Encrypted: i=1; AJvYcCXt5JBC3n9FBJRjcLyufRQWEnx7kBhKQRypAKClF6z/JWjqP2+gBsOYQiFzi5yPnnyU5AGyaTldmYy0DSZHQB9b8p9EbQoGPMyp
X-Gm-Message-State: AOJu0Yy+KAqdnDn/JBUdr88272OV46cjA5dNaMLAjGYSJg7OGMofH2VX
	0nEhkQXv422M5uF0kbie84l8TOoyEUN2d6TFKMDbSc0FYNfRHSh0Ke9q3F2XsEZNPr1uvFSm6vU
	=
X-Google-Smtp-Source: AGHT+IGNKBfEji09mQgCYN6J5M9ELvRh6o7b8ZiHnX25ZfQ2FIPphQSEpffxTGrF4fLI93qhhb8fbw==
X-Received: by 2002:ad4:5ba3:0:b0:6b5:e7e5:e62d with SMTP id 6a1803df08f44-6b78e30b992mr17886106d6.43.1721223898481;
        Wed, 17 Jul 2024 06:44:58 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761a0fa46sm41860096d6.93.2024.07.17.06.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:44:58 -0700 (PDT)
Date: Wed, 17 Jul 2024 09:44:56 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xy521521@gmail.com>
Cc: oneukum@suse.com, gregkh@linuxfoundation.org, brauner@kernel.org,
	jlayton@kernel.org, jack@suse.cz, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, xiehongyu1@kylinos.cn
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
Message-ID: <5413aa3b-92ba-4367-b720-2fa4161638b5@rowland.harvard.edu>
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
 <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>
 <429eb27a-578a-4208-8ce1-89434b8d739f@rowland.harvard.edu>
 <3073c8ce-1923-4816-a442-41b4cc333af9@suse.com>
 <6419a4e9-e084-4eb6-8376-9202930ea8be@kylinos.cn>
 <ee0a5160-233a-485c-a34b-99d4a1e046c5@rowland.harvard.edu>
 <45b87923-d256-4c5e-8167-8ef764add1e9@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45b87923-d256-4c5e-8167-8ef764add1e9@kylinos.cn>

On Wed, Jul 17, 2024 at 11:13:39AM +0800, Hongyu Xie wrote:
> From: Hongyu Xie <xiehongyu1@kylinos.cn>
> 
> 
> 
> On 2024/7/17 10:05, Alan Stern wrote:
> > I'm ignoring most of what you asked Oliver to focus on just one thing:
> > 
> > On Wed, Jul 17, 2024 at 09:43:38AM +0800, Hongyu Xie wrote:
> > > Even before usbfs->reset_resume is called (if there is one), the USB device
> > > has already been reset and in a good state.
> > 
> > You are wrong to think that being reset means the device is in a good
> > state.
> > 
> > The userspace driver may have very carefully put the device into some
> > non-default state with special settings.  All those settings will be
> > lost when the device gets reset, and they will have to be reloaded
> > before the device can function properly.  But the userspace driver won't
> > even know this has happened unless the kernel tells it somehow.
> > 
> I was looking the whole thing from kernel's perspective. Thank you for
> pointing it out for me.
> > Oliver is pointing out that the kernel has to tell the userspace driver
> > that all the settings have been lost, so the driver will know it needs
> > to load them back into the device.  Currently we have no way to send
> > this information to the driver.  That's why usbfs doesn't have a
> > reset_resume callback now.
> But I still think that there's no need to rebind for a USB device that was
> using usbfs. Because rebinding doesn't fix settings lost. And it looks
> strange from user-space's perspective.
> What do you think?

That's right, it should be possible to avoid rebinding.  But we can't do 
this until we have some way to tell the userspace driver that a reset 
has occurred.  Oliver's idea is to do this by returning a special error 
code for the next ioctl, and I can't think of anything better.

Alan Stern

