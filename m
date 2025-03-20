Return-Path: <linux-usb+bounces-21940-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6914A69DB2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 02:41:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906783BCEB2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 01:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A7F1CDA0B;
	Thu, 20 Mar 2025 01:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="gLifOJ/F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60C91C3C11
	for <linux-usb@vger.kernel.org>; Thu, 20 Mar 2025 01:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742434875; cv=none; b=ZWApkw78EPAubB7rBt2GM17DXScjxgTNPXhDCki3WpZCZHmVkkq33zaey22S7CLrmqCM4vJWyiAxyera5Pw9yog2u01/BF8xtD6uTQzcAdcKPLdpx/9trfDEetHHbRFFhJQWsHP5MGGZ7wt5A+2MDIAU7Lvwydamou5D8m1qkzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742434875; c=relaxed/simple;
	bh=UUlnAag7GvtsvmLxS+Vu2PmkhcCEqAWwoPmEyUl0cpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mF48sk0IoOKZJxkmvxSBavYrrwqbbxZiG3e8b13o00v9hph/8AlpjUgfkPJx/vvAfcTIdhZjRHySeA0GDMVQ96iT5dQaD74vfohUcDHfKbYy+pCP56yRJgp460gjJ2L/tmaqqCwz1KUIP4urdDWw8fCtWonYVYVWeOdNgrkix1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=gLifOJ/F; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e8f05acc13so2974626d6.2
        for <linux-usb@vger.kernel.org>; Wed, 19 Mar 2025 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1742434872; x=1743039672; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uZ8h0zSipJfQbtevp/QJvj8hMv9cb9Vf+EvEqQCI1E4=;
        b=gLifOJ/FQDS4PHOhttQbCqJw26KkdzHEsu4GrbmOox4Wi4I65B4bqf261IVnqYO22M
         ASdUnCia8QgxLGmJVanr5fyHKcw44FlSsTzr0o9M2lo5E+ee2QbmQe31jwuOJj6ySmav
         34v28UVstbG9yN40RPmxoT2gRqRE65mxoE3ANuqSoPyZauIOZSoNY8fBdzqOu5LPhqkN
         A0DqnVpK3Utv7RBB9mT6Lo36kEC2ufQGAVQt7pxyfSLCMxAHgnJY0IPcv44wYgesHWDi
         uorVBs4m5COPZ3hDO4Fp0syGQ9k4RPd8T5DGGoKRvnQ4PIuMbrWaTrEunXxJx1ZUv3BU
         Y57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742434872; x=1743039672;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZ8h0zSipJfQbtevp/QJvj8hMv9cb9Vf+EvEqQCI1E4=;
        b=rPU06r8gKVC5WIYEgieKTR2cctVWtV7HnAMs62Pu6E6kHUdD2RT4FxcSX8YngWp6YW
         kdtKoq+DYyE1nOZ4MWAWbGdU3KdNPHYaDlgFTm/pJEfZALPyyrA9x/UvCwvmtCyFDvfG
         mdFXHq/GTYsvNvz7t0Y/KjM115j+1y7tH7Y63VaEXv/LfLm6NLz95O0Y7q98FgfBVNpp
         +CA5nYlI6Jx/2f62xZRjkNlywD6LPEL7UPeUDDfnbKwFKfKDi55TJK22+s3KB17X8UAq
         EAYJVcxzToEr3iwR5eFdzvCfuhdOYNzXDfGPWe4cMatq/PXSuyhCtLXgG5SV6fPMc6c6
         Z06A==
X-Forwarded-Encrypted: i=1; AJvYcCUsciOyZ/vSE0gEb42UL/s53mxr3EAQIIeJWCVXUx+n2IJjRgaC/hwR1hkv8S6wvpBOMzvX9ruFS64=@vger.kernel.org
X-Gm-Message-State: AOJu0YzS8BaET3ZtIV/e0IZr8ZZIQ9Vj6hL7z6s0SfBTVaA0YGzQWint
	cHjCQ6UToWRE78dQ193CS4MHRooZ4IVHNNXwV4zM8VkL4eVX6TNC6IOCcK5TtGUEdBhnCGwzyvk
	=
X-Gm-Gg: ASbGncsr1RK1dSqykcQDPFpDYxK0pVMSLuE+zxSzfTRyaBX45f6A63aHohlMamVv2/A
	v3ZVMuX8QBL2nHjQP/h2myV4hmb/HP0oCUEnNw93wyk9/eQSlWc6zwVkGdOQ8NQAlxOGRhjY+IE
	GvuNwxYvDhgXOIy6jzBqXufwXNx17e6jGKIYvOuAsq6xJP//kLjVrCJ9x2T+Ta/71exb3mcVEuD
	lP0KWopBwLyIrkxtPTsueRBaKz47YUGZ2ybigweUfqidd/b4bOYaG1oVDzw06YNs7wJ2pjRp8l6
	6ig5aTkRBUmZiD5gAh7rA5otK2IUQnzFiBMEn1aKBKnTRA==
X-Google-Smtp-Source: AGHT+IFjwQWNsIniP3sqG2rsgjRfgP+KY3Slh59o+Bs/kQmnTEbqXYdf7mj5eKQwr4fYXV5dCyXcsQ==
X-Received: by 2002:a05:6214:cc6:b0:6e8:fbd9:169a with SMTP id 6a1803df08f44-6eb29389861mr57823156d6.11.1742434872699;
        Wed, 19 Mar 2025 18:41:12 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::3ca7])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6eade209f70sm87478636d6.13.2025.03.19.18.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 18:41:11 -0700 (PDT)
Date: Wed, 19 Mar 2025 21:41:08 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: rtm@csail.mit.edu, linux-usb@vger.kernel.org
Subject: Re: use-after-free in drivers/net/usb/hso.c hso_serial_open()
Message-ID: <e7f0dc08-a5bd-4838-a229-a9fc1afd4f09@rowland.harvard.edu>
References: <33193.1742406937@30-11-165.wireless.csail.mit.edu>
 <2025031933-clavicle-sulfide-878e@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025031933-clavicle-sulfide-878e@gregkh>

On Wed, Mar 19, 2025 at 04:49:57PM -0700, Greg KH wrote:
> On Wed, Mar 19, 2025 at 01:55:37PM -0400, rtm@csail.mit.edu wrote:
> > The attached demo uses usbip to pretend to be a net/usb/hso.c device. It
> > provides damaged configuration information that, among other things,
> > claims to have an INTR endpoint with zero maximum transfer size. If
> > /dev/ttyHS0 is opened, hso_serial_open() / hso_start_serial_device() /
> > ...submit_intr_urb() fails due to that bad endpoint, causing the
> > relevant hso_dev and hso_serial to be freed by hso_free_serial_device().
> > But the serial_table[] entry is not cleared, and is left pointing to a
> > now-deallocated hso_dev. If /dev/ttyHS0 is opened again,
> > hso_serial_open() (via get_serial_by_index()) will use the
> > now-deallocated structures.
> 
> Great, can you write a fix for this as you have a test case for it?
> 
> Wait, shouldn't we fail a device that has a zero size anyway in the USB
> core?  Is that a valid configuration?  It's been a long time since I dug
> into the spec for that...

The USB 2.0 spec doesn't say that wMaxPacketSize must be nonzero for 
interrupt endpoints.  It specifies a maximum allowed value for this 
field but not a minimum.  In theory, transfers limited to length 0 can 
still be used to convey Boolean information (did the transfer succeed or 
fail?), although I don't think any existing devices do this.

In any case, this isn't directly related to the bug reported here, which 
appears to be a simple logic error in the hso driver: not cleaning up 
completely in one of the error paths.

Alan Stern

