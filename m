Return-Path: <linux-usb+bounces-12225-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3FC931692
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 16:22:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A4132B217A0
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jul 2024 14:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25A0318EA6B;
	Mon, 15 Jul 2024 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="qYjlqT6m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C88A18C17A
	for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 14:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721053324; cv=none; b=DhVwGRmAfRmg/K1z+bGRQ9dmO2ruRPGFjqZkSLGYSQcSl20qKc2kOo5vRzfQ0YNrivZjSZf5nWE0akso2+XJOycaH8ZsbWVlCoI6WdfKr+JvWEe4VKFSztpb2sreDPn2hZa4UC8IX/3FWB4IEdzwa8hdEsGD7Llh43SQ+T6RZYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721053324; c=relaxed/simple;
	bh=bH7oj4B2Zpz+lQHSYo37+KXB7q7AxK2kIhIqGARTFfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/+n686fE2wy9w1zgyNZAf11a1GaesKCZ6ZGe9UmlJNbSSR0wdi//PFSblZwF5oC9bMGIDKhBIhii8rbkroAobPOFlpX8iszGA+Ig4MlN+ymb04O9ZRnZWxqfovl1FJPsdfcUq13u/jq0t4TrJNyHfkBu5asAWlhUZCLzTqoBt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=qYjlqT6m; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7a05b7c8e38so272340085a.0
        for <linux-usb@vger.kernel.org>; Mon, 15 Jul 2024 07:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721053322; x=1721658122; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tOYxpElHtlrMz0PGrnNSIzCmyVdWznqg4w7SKp+uRk8=;
        b=qYjlqT6m+AQiWiymNRIbv1m5fezC0VTRfvNh1VKXN1+HZ3JEGtuSegU/g9PDjCPwuX
         dPbGxvafLgtal4dImD4uNjrJbfCMmElvGIjRY5TYEUKalZ5kj7DS7bL2mNF4oEalrpJZ
         SsFv3ClBJ4Zspn6D6siblE/q7Y6OBlMAtuAr2eShMOfwqDd9pe7qLo9XGYYmxcdrvMlh
         doHD5eVpZhYIZYIGNmYTmUPprW7JCp+/X1ZRyfEPN7hLvETvTmjy6B3nQb+6GQehwJLa
         XQrPenZIyII3/+2vdmDbTdUhZgecySteOPKuWsiS/pHNlzMA+o1uPufVxQn4iOsL0sVA
         Pftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721053322; x=1721658122;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOYxpElHtlrMz0PGrnNSIzCmyVdWznqg4w7SKp+uRk8=;
        b=bwTTSTq1SgqnGkKQcxvVMN1tjms8m0xY4d0Ch5i4sUSf8u7emoC1QDb2MlVpaxRhNn
         //HaoDO9I09i4v2+TczwklTL4PCvnTBvKUFPz2DS7pGb6Di5C1LbG1/VFNGZulU5fOS3
         L0/caXsKlWXfU8THrAgcHyH/SKXbz8wOfkr7pxH4SoJkgoMPPbE4H4eQUqPkQMsZG0c6
         x6/UTp5FulczyfgM+HnLJJPFt64V17cYyuj2VB/H790HX7cpD9moXRULqnyG7pqXXH+T
         HrOe/HlZ5BCV0MYv6uBYCK8tacWb2qMr2obBD7JFb61Q4+QUu5Hhef1GppERhi+0c/72
         QpPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfjZ+5J3QOGFbbyZfU0vLX7M2qCcB/yFwalYFDnV/7rfu0sSSYlpb/toxjh6bz+pOXE475qDdp1gFIf5KaKw9kfEFtmW7YfTkf
X-Gm-Message-State: AOJu0Yxz2Jlx/tYX8FW2J2htvIEHcLSG4XGNt4XL0h+fGvYMgtfkH+SD
	IdW1jpW61gtiE7QdS7YPuxE+huZunWyviGYtGn8ETKPTx8SowNfnYbUj2TNUvw==
X-Google-Smtp-Source: AGHT+IHvPuU1gQvilK4FmlZJIESIiWMSsLPbWZcGM/bvE/uUlsbqCoJwUAunDBkhbF87iSwEEqN4KA==
X-Received: by 2002:a05:620a:12d3:b0:79f:1915:5b3a with SMTP id af79cd13be357-79f19a7fb44mr1918954785a.38.1721053322220;
        Mon, 15 Jul 2024 07:22:02 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a160c6f5efsm203389885a.107.2024.07.15.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:22:01 -0700 (PDT)
Date: Mon, 15 Jul 2024 10:22:00 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: Hongyu Xie <xiehongyu1@kylinos.cn>, gregkh@linuxfoundation.org,
	brauner@kernel.org, jlayton@kernel.org, jack@suse.cz,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH next] usb: usbfs: Add reset_resume for usbfs
Message-ID: <429eb27a-578a-4208-8ce1-89434b8d739f@rowland.harvard.edu>
References: <20240711084321.44916-1-xiehongyu1@kylinos.cn>
 <527927b8-9475-47da-bf2b-7a5d9e81e470@suse.com>
 <9ef72886-13b8-46cf-a0aa-54dad36102e9@rowland.harvard.edu>
 <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a80d11d-029f-4e7e-9a8e-3abae1034add@suse.com>

On Mon, Jul 15, 2024 at 10:53:14AM +0200, Oliver Neukum wrote:
> 
> 
> On 11.07.24 16:41, Alan Stern wrote:
> > On Thu, Jul 11, 2024 at 10:59:56AM +0200, Oliver Neukum wrote:
> 
> > > I am sorry, but this implementation has some fundamental issues.
> > 
> > Agreed, but the solution is pretty simple.  Because the device was
> > suspended, the userspace driver must have enabled suspend via the
> > USBDEVFS_ALLOW_SUSPEND ioctl.
> 
> The whole system could have been suspended, in particularly to S4.

You are right.  I was thinking of runtime suspend, not system suspend.
My mistake.

Alan Stern

