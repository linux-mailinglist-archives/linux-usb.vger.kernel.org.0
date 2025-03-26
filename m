Return-Path: <linux-usb+bounces-22180-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF20A71B8B
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 17:10:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29A353BD5CC
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 16:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A321B1F5853;
	Wed, 26 Mar 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="dJAs+wsn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FA71F5820
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 16:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743005076; cv=none; b=tFM0u5b3UwmU63dpNvcLe9gkHQvSDENOv0rkM8uHQiSC4ARYtcyaiRXs8IglSqlvrN3YlEB9Z+D7y4F6Q2O5qjm2lPFHeBt3au20O+AN2d3qGBJAYPLqUtMcYIeRc6U9eXPbkFtnX5XSmAZrOEfL5fZZyNEKMMjIIfKONP+p+8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743005076; c=relaxed/simple;
	bh=94f84rBX5VepA7AG0Ddzm8rexeXxs6TY5Rtfnx9sF1A=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kAee5FFQ4WCQA/LYz87Ro2ySm8FE+DxaXYkrdbvY5AGtK/vTadKjsJCdem1p+yIVSZfnwiMx+ILx/OI4151ECl4W+H4Ffyqw8VSS8gbWsbu+9lsopUr3R5oA+1CuO6jUBHK+XJG5fYJ7NrsYF5nnGjwXfw9K/wZulNugj3Whal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=dJAs+wsn; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c59e7039eeso4823985a.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 09:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743005073; x=1743609873; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uga52cKqGQ1FOAloi1q6opFP1j0Ko6rKhd7jiox2rbM=;
        b=dJAs+wsnkL+dWHxRoZ5VRljwyWTgtRYSSZiOJF7FOVQxOa5xltMzvJ70K/H/wyXQz+
         nnITPJsUz0GgcPoUmCuGH/XOkUxEReuEAVkmbDXoJpdr7aTmJeEPsKBitqPwAUrtHZRP
         S76klybaQ+3jKeRlZtGBTisj43up+aaT1HdvQerITf1wmQUKVcWfqYxPumalvMI2NPl+
         /A+tRJi2b8f3RGqKHx1axbLqyoOSEJkH8GqUTvTPVYokKAdp9/O5YtgY2zALvBMfkAXb
         O3znMN9nkxtjZwTR+3i+8eb+u9qRbYbXKAM3Bm3JpTHR0cDV9A/CISD5BQZGNl7JtL1Q
         Nkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743005073; x=1743609873;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uga52cKqGQ1FOAloi1q6opFP1j0Ko6rKhd7jiox2rbM=;
        b=vBzWU6TkK2Dy/W1TnQkxNkYesSVtdaj+m/Cadx8OCkP12RUH4fSoEqJyZL7EztMGYo
         tZbZm8XfdcAzCl6L6wmdrDIQ9x6Tvyvej2cNTNjLdDoxl8J1yQCmTR0ypSxNYFlS8jXU
         WC2VgOlhh6mRPk/nkpcVU8YATKqSecLDuW9H9UMc6sV+wpWH5CJzcEuwSjpEkjDjhnvR
         qxV9aKxePtjwLrTxTZRkt6u4f1zL86R0z2RJBejZg2hJWvU7W43444uP0xxtWl+QOYwT
         G9l7Hhhd1vPQTiC6pxKjz4wd/n95LZUIMFCoj5pp56TYePxNgBqVBMhJSf4/ZpwXU/vI
         b8Hw==
X-Forwarded-Encrypted: i=1; AJvYcCV3W3PP/ljN4+GYBFwDmAAoh42/Ofuh6jQePykFiBJ/KuRrdfIO1MZ4hRZhDRXjzrqd71+nBJbnMKo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXVexVcf/hn7Jc2BYtavKa3q/+8jcoP4HPhVv+abuZygZBxyFF
	L275G41fcMm5xpCdHe5hiM6aGZuICBKeOUvEGo1qr02PZGRiWmdAsoBWh2zyBg==
X-Gm-Gg: ASbGnctFwD1YKOy9uAhbuspI6YJHZpoRnspHmCIvDu/5OS0TC69s2wcH57RubJlXg69
	hZRd2g5vpH49yWWkjbAx93Iwne2uSPC8NFoVeSJgoIQwenYMaS985RzsDE33Jt9w1a7+ZS75jBv
	5kRyV6xofPgNqf9A5iCKfMtTp7GUw8cnYFl+RTOEtx1t2Tg8W8U46/KoQmB14+LW95XcZ1WUE+H
	aBRh0NCj3xRvxF2cjqXVGFCPIrxmZwDvgP+6u7T9JICUX5UCxK7lyKYhC9QsF/XJ+6NRbKWsFxk
	jNJ5SXrNP40jRr4NoAqB53XTLs1HhQHjbTwMWnvTytDDT5dUAq6navCS+fUW1Zn9LfllxvzYgGb
	sFluuNZx+PCnAk9YpeP5eB/2Fe7vFHdmag3RZ0g==
X-Google-Smtp-Source: AGHT+IH6S8pOUbtu+BAVHi+tbBZs7cgoKKbH+qYcUJYmh7OUf+tNAgAPBhsZvrump26j2fb9I7dABw==
X-Received: by 2002:a05:620a:1924:b0:7c5:a2f8:e6e4 with SMTP id af79cd13be357-7c5eda0f1ccmr27993885a.29.1743005073268;
        Wed, 26 Mar 2025 09:04:33 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-24.harvard-secure.wrls.harvard.edu. [65.112.8.24])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92d0137sm777709085a.31.2025.03.26.09.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 09:04:32 -0700 (PDT)
Date: Wed, 26 Mar 2025 12:04:30 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	syzbot <syzbot+c38e5e60d0041a99dbf5@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v2] media: dvb: usb: Fix WARNING in
 dib0700_i2c_xfer/usb_submit_urb
Message-ID: <c6bed13c-38df-43a6-ba5f-0da03b91f3df@rowland.harvard.edu>
References: <6bb3b80b-a808-4992-8666-535ed9a5c980@rowland.harvard.edu>
 <67e2fed5.050a0220.a7ebc.0053.GAE@google.com>
 <29db5fdc-13c9-45f0-9183-c80d637725c6@rowland.harvard.edu>
 <Z-MKiV0Ei5lmWik6@shikoro>
 <d0fd60d7-5660-42ed-b1c7-4dfd6b8e74b0@rowland.harvard.edu>
 <Z-MrfICsY06DZV-2@shikoro>
 <f8e975a0-87d2-4f83-b580-6858050a252d@rowland.harvard.edu>
 <Z-QjIRoOWpoWaL6l@shikoro>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-QjIRoOWpoWaL6l@shikoro>

On Wed, Mar 26, 2025 at 04:54:09PM +0100, Wolfram Sang wrote:
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Thanks for taking care of it!

Which maintainer should this go through?  Mauro Chebab?

Alan Stern


