Return-Path: <linux-usb+bounces-20879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4054AA3DEB2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 16:34:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DFE87008A1
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A60D200BA8;
	Thu, 20 Feb 2025 15:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="STpQNBiz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6038A21147B
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 15:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740065304; cv=none; b=Dwb73ANhE2UgDdgOCH2ONC838yR1mPBbtNr/8Mx12xmIwYb7bYPoynfDx4uiIRYPWIuuCJtXt7WWERHGGjKM9IAMmF3sqQY102IqkAatbbnSH7+YXeA3/kJ0kMBNYBTwmU4rVlaeU+fUzWRc8K6uFnaMyyRQK5JKCuytPWZVFqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740065304; c=relaxed/simple;
	bh=RY3capvtA1M4+W/fYu0LB/qUUEJEtuU3+I1GnuY6tM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXQ1aOP3KbXCiKXVJLbpVqqc8z1MRo+pkoUhnUPA+6CVpxMV1X6/kdmx6CokS/HPxGBPG0HwV1Tz+T+7ZI9wTQRMfT3MjUMJ76cgQVQHIqo4Nu4IZ/mU3Ai4uHJ7R89DXNYcpQHr7zZz/T5SADXg86xDhr82VeIJaBRlwDQ6eA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=STpQNBiz; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-7272f1de42fso728796a34.1
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 07:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1740065302; x=1740670102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENQYOqaPCKPhXBAnGNW66EYnjesjbzCeLgZXkD0NLWg=;
        b=STpQNBizzlNi9pdOoybL9H1KySBJ2MDbqtrmz3hyyZDWtuZviGZUmc+GeCD7WSMujq
         OgsR4Q9nDU1DtOMfCfkWhhF8Wky04nLLWpCz5sNjjBi8qxi99PCXG3bhZOr2hElJlRZj
         8fs/Ir8HB2q79vMuHiV4wpJVzBOsSKKxhLLMHxAP7NwDYMFsNIdLg2OLJkP94hhDwU5v
         2oIo3UJlaX+7pZFKxNVSoXdfQ3GOZoXkH7Kd9apkpCLxxwPIx6dXArZOIq14+KCOEMmC
         lLBj2Xc8bXzL8me92IK552xfkwqWzixVxVJbwnoa5R3DNWW9w8HP69FhC4t2lxdqBtQs
         dweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740065302; x=1740670102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENQYOqaPCKPhXBAnGNW66EYnjesjbzCeLgZXkD0NLWg=;
        b=ftu5mS2NvsfrmCWipH1uVyVzwUTAzJfFv+rvWo2l9cMYyr71vzU6U9F2EdtiOegPLW
         xye6Jrc02I0tu8LpEw9VhgBtJPxIui3rf04lQdTtj39w/qIdf1y5ik1eOTruZjvZ7+Dh
         RdLVYg33k9mT+ESXBMQVvXxxZlQLxQE/TnOa5KPmk75lkem54yNXzVWzpphGtuVcc8Q3
         Kh+zwaKEMLosi4psd0UdaEDQPpvLHmLpTDcRxLFb3bJxS8MoGK7vcaWInN0z8rW8JLWN
         sA7XDDIv3LByy3r6lGqdfiB1wV8G0yNz2t8fn2AbMdAncsZbVwn12ljtryJDO+5XlEGx
         ALSQ==
X-Gm-Message-State: AOJu0YyN4RDDmUqq4ZY8pa+skM5sYtszrSx6Hkh9knB1+mGcmWc0CYbw
	KuyFzYAs4w5TssrWsBPriJpcuEfbqU34qwR6cZ1H0lhEMSgx/dLyS6IZTYJTj3ldqS6Nxq5FdMQ
	=
X-Gm-Gg: ASbGncsDa8XFyJOBsAEcDc/8SwH1iMF3nGOviF3qpkm4NY9bLIwzNK6ioZW+Vj3wHnU
	/FjNw6USc43vzZLkuyBOmw05Kfl1WRpkMVg9x2mzSxCSqSMhzSrBejutinJVIVWfU25uHDSgV1o
	VrMdVVD5uSbMHGvMIhxyWsz4riJWdVcTPuMcnYpKW9FZ7End+zt8b/hvRzWRRdjYwBBaBNKMDJj
	j+pc51ybwHQRATlxaMpR/nu2Bf2+En86R9jv503yGDfArI5DTeKZ/gsb33Apd+TYlqTBQHIu4D9
	VLfz+KMPNwad31OW9rZJ0vrsOoz22HDXfw==
X-Google-Smtp-Source: AGHT+IHESyw7HFfjfmcKWqwH+M69GMfPqa3jtg3UKwz400ea1KAOocc8wyr8Ft+yHN8fUYUkBJjnhA==
X-Received: by 2002:a05:6830:668a:b0:727:11be:f4ae with SMTP id 46e09a7af769-7273775eb59mr6346329a34.3.1740065302158;
        Thu, 20 Feb 2025 07:28:22 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fd00bf7a75sm895707eaf.14.2025.02.20.07.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 07:28:21 -0800 (PST)
Date: Thu, 20 Feb 2025 10:28:18 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: USB list <linux-usb@vger.kernel.org>
Subject: Re: design of usb_lock_device_for_reset()
Message-ID: <e838913a-f177-4e58-8d2c-6a5d9c4e00e7@rowland.harvard.edu>
References: <45365f62-f6bb-4e00-8946-84b115de0184@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <45365f62-f6bb-4e00-8946-84b115de0184@suse.com>

On Thu, Feb 20, 2025 at 11:44:34AM +0100, Oliver Neukum wrote:
> Hi,
> 
> looking at this code it struck me as not really good
> at its purpose, if there is ever contention.

The presumption has always been that contention will be very unlikely.

> If we really run in the repeat loop
> 
>         while (!usb_trylock_device(udev)) {
> 
>                 /* If we can't acquire the lock after waiting one second,
>                  * we're probably deadlocked */
> 
> because somebody else is resetting the device, what
> are we really waiting for? Do we really want to even
> reset the device in that case? That has just happened.

This is indeed quite unlikely.  No point optimizing for a situation that 
will almost never occur.

Besides, it shouldn't matter much if we do an extra reset.

> It seems to me that in that case we should really wait
> the reset to proceed and then report its outcome.
> When we use it, for example in uas:
> 
> static int uas_eh_device_reset_handler(struct scsi_cmnd *cmnd)
> {
>         struct scsi_device *sdev = cmnd->device;
>         struct uas_dev_info *devinfo = sdev->hostdata;
>         struct usb_device *udev = devinfo->udev;
>         unsigned long flags;
>         int err;
> 
>         err = usb_lock_device_for_reset(udev, devinfo->intf);
>         if (err) {
>                 shost_printk(KERN_ERR, sdev->host,
>                              "%s FAILED to get lock err %d\n", __func__, err);
>                 return FAILED;
>         }
> 
> We happily wait for the first reset to take place, only then to do it again,
> or, worse, we wait for shorter than the timeout for the control
> message we use to perform the actual reset:
> 
>         unsigned long jiffies_expire = jiffies + HZ;
> 
> Now, this may just not be important enough to change, but
> it really does not look good. What do you think?

If you want to increase the expiration delay to 5 or 10 seconds, that's 
okay with me.

As for knowing whether another thread is currently resetting the device 
-- do we have any way of doing that?  Not that I can remember.

Alan Stern

