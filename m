Return-Path: <linux-usb+bounces-27226-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FA2B333D0
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 04:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F8243AF5ED
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 02:01:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11EDD21CA0E;
	Mon, 25 Aug 2025 02:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HZv21MBT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BDD1E4BE
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 02:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756087310; cv=none; b=bFDe12B1s2dQ+ZQeqqGeLoubrh0pI33OpBGYKZfI7XzmIujG7QYjey29CrjBVNYnFi4TeDxJnVUoeKpx5Wy8Odr40edvhslFwiichZhQh5Ku+BZQdwcS/0CmBhdJOHy+X+g1xVZgtjSbBSUH550md2y29P26pA95AXleT5nw7AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756087310; c=relaxed/simple;
	bh=wIGH0m9FtHFoD1tG6AB6wD3rrqQLE7xeks1HyczeahU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cbj1MzYntkRz9jWCZwxXE/cLJ9S8BFrkBdK7dmpFeAoY2o0AyWECVar5wy+7CHomksMAn/5WR9s0pn91gIYiXDRuw/M9qX1mTAhuSwwN2g6Tb88P4BpGDxbUX8pg4Nx3fOqYEcA4YhrNkOiPcgNrn4SYNEmdUZiYb9fCf0xj000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HZv21MBT; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-71d71bcac45so31332127b3.0
        for <linux-usb@vger.kernel.org>; Sun, 24 Aug 2025 19:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1756087308; x=1756692108; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xPoitRQ/IXYB+BKPn84zctYfWeLgkj6/m9I8qp2PJXo=;
        b=HZv21MBTsj6l0pHaEdgSCX6vQhqg+9hwxrx8S28ICUZ6c8K6TWqQ1k9Cy2L9uavfsL
         79o/II/Qmq6MCEBGhwHBfLDdKwfnJNNuN2OiV9td7a0BdqwQuj54ZPut17GT2mbL6jWR
         EffQPOsJr3DKi+Tplk9Lj5RMEh658V0RsqySjGOmIsbvyxEyOJNCogY/qfB42nqWVXPx
         b9YHLScWiaB0s5rs43AWkJu0SsC0QBYHZ/6nUrrxpEo2pOQ9QCECEvZTqrHCOisAcSD4
         3+wvRLZKm+eYMDL/HJxdoOhjyCOldGwcxr6YRkNShVPxenOaO0v1L1FCyhOyuzAkJlu4
         zQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756087308; x=1756692108;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xPoitRQ/IXYB+BKPn84zctYfWeLgkj6/m9I8qp2PJXo=;
        b=okfwtbNpqZzK9ynmsWw/CNxyx4qW7XIWZ4ug99RQTKYGwyy1IB5NRXzMeXXMBXflwu
         eIOI+HEfCzOF/GupsRH5fUoLrWtQD5NxE+WB/TX/z/7W5Xjv38/+JGNq0a5bz4bKVC+0
         pcPxcRLD1y8hMv6tdaBgeK5o4c3ScKbkA0TiX6WJ64FAoBpbZ8HcS5VjykDjqqHyyY2/
         Ge+P96usJ3qKOZLlccsORDH5s+93T6YlNKVXnZQg0luzQB/YFRRhc2EjWZ7UuXT4bFo5
         nglEsG5IcHS+NgfdZUQ28/Fvhwgp1jaGyZLhn8ffUJtO/WVxPqTjT/y3eJka/1UBFAuI
         LfPw==
X-Forwarded-Encrypted: i=1; AJvYcCXowSunfUfpzxlY6fB13K8HsIJB1hb+BjwTuRmqYaQxxbeQayhcGrE+cYB/PjhYX0/yft+06HkKjNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3dnzxeYizXhA6dIyyHpbTRXr708ovZaDCyYQ1GMbbnO1w1ewj
	vql6erKIvFvmDeK49rBuNKyPcOd29wlUJb8LHLvpdxfOeEjQy5ldp/5+zwxs3b/J4g==
X-Gm-Gg: ASbGncvnTmTZYa02EgHsrL0X1OBrZRPmiZxvJJP9yPyroliXaY+lVO3mf2BullQ1lmL
	K+HhLGOxwrmTZqKZ0TYVrvasapRLRQ5SMCEbji8rCykw5u//hMJJe+6f2gkXDNV6wfR0mEmLbn2
	FEH10HqjVZtBjp/evBIKVAMAdfAQcjKa+lk1ADyttqW8E17ascy+PGe0OpHk11FSd9+63ES6RjL
	TWrdqfB/Q3tIq4CyuoMUV8SFl7H8O8Om+kN1bqZmRhrnHIRknl4HEYp7/ibQZZWC/iX8F0l7V5d
	FzS/xlzeopUnyaCTDAnFBXXQC0B9oae8L9SV94JtqPgrtIn3XpO7CMPTdJDvqAbrtP8gcuqgtFA
	JwFlAYIoOvyTuOCooKswVO5sS
X-Google-Smtp-Source: AGHT+IFxKtN4MqdM2gDpwPd6SRGHpoxBytgfZTiGfc8g8PTZSK+gRpxzSn7VRwg26oj1n6BvjcMuvQ==
X-Received: by 2002:a05:690c:250a:b0:719:fafe:e822 with SMTP id 00721157ae682-71fdc2df5femr118396297b3.21.1756087307850;
        Sun, 24 Aug 2025 19:01:47 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:156:8000:24f0::eb06])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71ffce104d1sm11087847b3.28.2025.08.24.19.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 19:01:47 -0700 (PDT)
Date: Sun, 24 Aug 2025 22:01:44 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: =?utf-8?B?6Ieq5bex?= <ccc194101@163.com>
Cc: gregkh@linuxfoundation.org, jannh@google.com, rex.nie@jaguarmicro.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	chenchangcheng <chenchangcheng@kylinos.cn>
Subject: Re: Re: [PATCH] usb: usbfs: Add reset_resume callback to usbfs.
Message-ID: <379c80f7-aa01-4575-aa0b-d64ef01c1346@rowland.harvard.edu>
References: <20250822024602.42894-1-ccc194101@163.com>
 <f159e37f-3b27-4977-9712-345e8902eb48@rowland.harvard.edu>
 <4cdaecd1.131d.198dedeefe2.Coremail.ccc194101@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cdaecd1.131d.198dedeefe2.Coremail.ccc194101@163.com>

On Mon, Aug 25, 2025 at 09:36:49AM +0800, 自己 wrote:
> At 2025-08-23 04:30:18, "Alan Stern" <stern@rowland.harvard.edu> wrote:
> >On Fri, Aug 22, 2025 at 10:46:02AM +0800, ccc194101@163.com wrote:
> >> From: chenchangcheng <chenchangcheng@kylinos.cn>
> >> 
> >> When an Apple device is inserted into the host, and the host
> >> wakes up from S3/S4 power states, if the reset_resume process
> >> is triggered, the absence of a reset_resume callback in usbfs will
> >> cause the device to unbind.
> >> By adding a reset_resume callback to usbfs and reporting REMOVE and ADD
> >> uevents in reset_resume, the userspace is prompted to reissue commands
> >> to re-establish the binding with usbfs.
> >
> >usbfs has no way to inform userspace when the device is reset.  This is 
> >true for normal resets as well as for reset-resumes (no pre_reset, 
> >post_reset, or reset_resume callbacks).  I don't see any point in trying 
> >to add support for the latter but not the former.
> >
> >Unbinding the device forces userspace to re-open the device file and 
> >establish a new binding.  How does adding REMOVE and ADD uevents make 
> >the situation any better than it already is?
> >
> 
> >Alan Stern
> 
> Here is my reasoning: 
> Currently, for Apple devices after S3/S4 states, since the USB hub loses power, 
> the reset-resume process is triggered during resume. If the original 
> reset_resume process is followed, the device would be forcibly unbound,
> and the device_attach function would be used to rebind the driver.
> However, usbfs is different in that it cannot automatically rebind
> after unbinding and requires a userspace ioctl to re-establish the binding.
> 
> If we assume that the reset_resume callback of usbfs does nothing
> and simply returns 0, the USB device would still be reset. When userspace
> uses the previous file descriptor handle to issue a command, it would result
> in an error: "PTP_OC 0x1007 receiving resp failed: PTP Session Not Open (0x2003)."
> 
> Therefore, by adding REMOVE and ADD uevents in the reset_resume process,
> userspace is notified to first unbind and then rebind. This approach avoids the aforementioned issue.

Doesn't the "PTP Session Not Open" error notify userspace to unbind and 
rebind?  Why is adding REMOVE and ADD uevents any better?

In the current kernel there is no reset_resume callback for usbfs.  
Consequently, when userspace uses the previous file descriptor handle to 
issue an ioctl command after a resume, it gets a -ENODEV error.  Doesn't 
this also notify userspace that it should unbind and rebind?  Why is 
adding a reset_resume callback any better?

Alan Stern

