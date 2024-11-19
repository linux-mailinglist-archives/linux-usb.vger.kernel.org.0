Return-Path: <linux-usb+bounces-17707-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 076D49D1EB5
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 04:12:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12BE2815F6
	for <lists+linux-usb@lfdr.de>; Tue, 19 Nov 2024 03:12:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5A6F145348;
	Tue, 19 Nov 2024 03:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EfYwb+HG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C98713C683
	for <linux-usb@vger.kernel.org>; Tue, 19 Nov 2024 03:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731985915; cv=none; b=qGACaWs2BcLwphLdiogIBdZp9iw+cEalJ5F6LblA0Cy0wgnvBb750oFxoRp4IanrL8DPpiWCLh9FFbEiw4/L7kCYL8OQvkfZVR2ydd36svmUgFnsdG5XmugurttZ/0HJqguStq2xfbpBFUdLg5Mk/lNxAP9o1boomai9EHIcdJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731985915; c=relaxed/simple;
	bh=IVb86MOVRYv8LRYfnxl7sn/j7eIWJwGxMw9CYLU24ZQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HsHke16PlCa8px/F7VKyZBaGv74JByu3J5njfh3VnTE3dxCGf72jaXUjMKx2h4USWj6nanPJsQrMMBLjpIGCtAcg6JR5FUZqIuCRm3T9eVlJYhULlcvUDPWKIu2MKB56nyWJw00cLLoGOKJpYYM7+q6WRjNdjNh4V+4ucfFHCOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EfYwb+HG; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6d403b1d050so2837666d6.1
        for <linux-usb@vger.kernel.org>; Mon, 18 Nov 2024 19:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731985912; x=1732590712; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZG8UleUmTiC5OzQO3TOWEjc2/hE+cAHTzOdjRLKK+N0=;
        b=EfYwb+HGrs0T62VUODK4S/1JBO3UfdcHdnjrN5Y8fVduT5dFWXJNqCekTQi50n/gc8
         pN2+x+V5oOYH85NS5ItTFBpBbU9XarvepGNeZAz7G/8No6Xj/V1ync4Wpe/M8h+wKbLR
         uSKwn322Dszdusy7BhA6jsdCrmoLuS/bz5jAjOvbK3mm1+RMm81PGoHuk53ZBdhc72q5
         PyPfSZXIOKXA4AFZ+lOtGJg/KcgctnkjUEY0yYkxz6N+GppR5dYV65tPKeSWLO99kv6+
         OUCN/zjaEtam8cDiqN74gosFFlQjQRGDtAcVlZ5iw8MEe6DOSJYv/yDuM4VWyJTedPfb
         rfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731985912; x=1732590712;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZG8UleUmTiC5OzQO3TOWEjc2/hE+cAHTzOdjRLKK+N0=;
        b=lyWe8QIKQHSmE6EYXWQw3+QON8hLB14j1/GfOhCS+XZr0yGMxFGhy/8CGh5P2bqT2W
         5neOSIWjOBop/c3uiHOLR1/GdBAENeF9CIpJ+zzu+KHWdpS5BHPtMlOvHW1fAIhnEtaw
         hKJxRhPq7Wyl1zwAtHKqkPjVbLb9LEGESe1SN1jvOey4a3y9RL5FAD63NBG4a+IntKFx
         e544mkSBT1kdCJ60Y5sR1YiNzq4X6jxcOFxCUJw9XX/RbI/zw3av0dJM+Dwvzds/t/FA
         djKH12H3yCxsMF1Ps89SE8KVYQQF9imzeowLG0GvL5ZJwb9RY9ClXngat7x6LKMQp8cB
         A9LA==
X-Gm-Message-State: AOJu0YyrNWYAtzKPzbdw65v2HW2IDXNea8tr9Mt7oLaVnrlMMjjeAa2i
	xZyXaWeLE7Q2f8hkYqX4XJdUCsGHsT2P+JGbD2wgiPXnHA95pM7SDbRjvCuk/B8fd7/UCp5hDP0
	=
X-Google-Smtp-Source: AGHT+IFt2H4z3M9ZFjC/fRAKcMgiLs3Rkuhy63PsZxibwZ5Wa2k+SaS/CYbgqoo2OYDiegOpPANkVw==
X-Received: by 2002:ad4:4ee6:0:b0:6d4:1d4a:70e9 with SMTP id 6a1803df08f44-6d41d4a73c9mr120390466d6.19.1731985912301;
        Mon, 18 Nov 2024 19:11:52 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24f4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40dd22699sm43366186d6.88.2024.11.18.19.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 19:11:51 -0800 (PST)
Date: Mon, 18 Nov 2024 22:11:48 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Markus Rechberger <linuxusb.ml@sundtek.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: USB Autosuspend
Message-ID: <3e9d6d03-eed7-4f46-9926-4d395c0bc46d@rowland.harvard.edu>
References: <77b79e95c092511a695ac0b6a8eade57b12ff3db.camel@sundtek.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77b79e95c092511a695ac0b6a8eade57b12ff3db.camel@sundtek.de>

On Mon, Nov 18, 2024 at 04:13:29PM +0800, Markus Rechberger wrote:
> Hi,
> 
> we repeatedly received issues from customers with usb autosuspend, our
> devices are randomly disconnected on some systems, it did not happen
> many times but if more than 4-5 customers report this there's usually
> some real issue behind that.
> 
> I'm asking here because the Libreelec distribution recently got my
> attention that they seem to set usb autosuspend to -1 during boot time
> so they probably figured that out much earlier with other devices.
> I have never experienced that issue on an Ivy or Haswell based system.
> 
> Were there some issues with particular kernel versions in the past or
> are there any issues known in general with USB autosuspend?

I'm not aware of any such issues.

Do you think you can get kernel debugging logs from your customers 
showing examples of these disconnections?

Alan Stern

