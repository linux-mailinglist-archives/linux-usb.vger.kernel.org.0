Return-Path: <linux-usb+bounces-18611-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA23F9F5D4C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 04:13:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 762A416F0E3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 03:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17DC584D29;
	Wed, 18 Dec 2024 03:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="QWGqWVgu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7BF13BC0E
	for <linux-usb@vger.kernel.org>; Wed, 18 Dec 2024 03:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734491595; cv=none; b=tJufTn8EjDvW/yS/gIU2mjxjsJXJTs51FtTpTPSbgVoiVtuM/zeOYu1qYPcja0K+c4IBkw+H+xvDjJB0lXe0F7FkMpx0nY7W4S7NUe/sQM344QQJQOyEbjp3AJemllyhH+/ToaAxajhc4gyGBmVGThxEWf1ueN+9Wmp98G47Zdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734491595; c=relaxed/simple;
	bh=TSdAmdCKfkhu0fpTCtWuEzvsCUea3/N804lQ5srpBhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJTyRWmwVrDm71Pf/R/FuFsdrTWNHw/HJFNzBk9GQuT1LqWn/IKCW2hiKIFgvo/Sq/wv5u4XK3hCE8uBCZ61J7KeeqpzpnpKv+wG5/wCk5VdilSuQB8c3m7RtVxpqLyAzcLgWqdh/6lWrsIikxSudhPiL1LIZ2ntWpwnax9VdLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=QWGqWVgu; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46677ef6920so3074991cf.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Dec 2024 19:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734491593; x=1735096393; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WRiadgdSYdBpoMNgXmugT9VcPJ4bnKgS6fG9A+Hj4xg=;
        b=QWGqWVguKh/SX3miGXNMlNKnL3PwEjmTfTGq6QOw9dHrW0gMoOVOe/dyVa+grtv+iC
         /0OEq9QiC3SUED5w4eW1wpMXEXc2P64sFGx9rFG+rg6V5ojR5ZT3phCJFd3oE1yZDd2j
         ZznpKf+w9nDE2iYNivJtmHrWHrvyVKUBToieQXGl4p5ZXe3zlIMVaQGgt2zJ2g3VWdEg
         teJCXfH7HLLhLoHpufbdGpC+q9tnyTwEdYBfnXY1FlJrXqD8Sv08ixKGyj5LuMAUBOa9
         phcZuzT011PpqJPMX+QOkTayfNFt7653zNgkJomOuWLQ5WT7EDg22bEDNhHyakLhKmes
         CBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734491593; x=1735096393;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WRiadgdSYdBpoMNgXmugT9VcPJ4bnKgS6fG9A+Hj4xg=;
        b=ogHSy4LDG8neBxFkpF6aVAsb323usM0+uaVhsXkThdHolSDs/Iv1IKW1zMxIbI4EqD
         Hk/+IXn/hGXjJJ0pedIru2iOhsxio1Jc1v6dyiW3WN/zcKlf13MqNZjK9Y9IctGLIm/W
         Ytrxb2srsTfDtlh+5zK0yrEUSj/WYBJTu6c5mC97xaGQjXCpzXNy+GmFUCGQ5M0EWqnP
         R9nJVVzFcF1C4B84uBX+3AIh4OfM46cMXNiZjgGu1oYps/djHxRuPyW5qzLdmw4S9C6i
         umcN5lh2KCrZix70VgaQULLMPO9z2hvgFBd5kJ06JNDum9gZ0W8ZU0JFZtxQPcYbXzvG
         Mv+w==
X-Forwarded-Encrypted: i=1; AJvYcCU3l+6Gm/cbSyvl7H3agOHUL2fsqcZmUWQnA/n0h2fiyHmbt0H2zey9FNcZXyk7DJsxnrVuz6hOvjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOlIli9ZAu0sTezalHRyMYzJjSXPlfxNJHrXLVfP0K/RFEhql
	jrv81ps7RQFAy704QGIPuW5Zx5grPxu3jQSm1oqniUmO+yObsKBg5uX8Pdz7RA==
X-Gm-Gg: ASbGncug7QuxmcUPeCokHQRFaKSLqHbAXby+/hkX4U7cLR+jrIZrEAJuOT87IfgDQdN
	3IrwsXjdeLYXxoD8puUWw1JMqIy0H7M3kVwroJI8/Nt971w37ZGsjvXDHqqU1/eXYxKlvgB6TrS
	pwa1kws8BSVyn06xGxSbOwhOomT22YTxPtCTmhpsXun9oidLla7JFcuR2uhgWc01AaiGiyaSVbA
	FYSgNonF9JPmvWU2KfiLgKU7YLPg1WY1BxITUJKMjccgyyF1YNP4xmH7Q==
X-Google-Smtp-Source: AGHT+IHmwTLyLNTi02LOS5ooyvlOWkFoWhx9Po/GonMxFiR2j94KBJQ4C5DdDpV1GZLL+bdJ7isQSQ==
X-Received: by 2002:a05:622a:94:b0:466:8f43:4aa8 with SMTP id d75a77b69052e-468f8d02089mr74975511cf.7.1734491592896;
        Tue, 17 Dec 2024 19:13:12 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::41cb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b7047f3f5dsm382828085a.66.2024.12.17.19.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 19:13:11 -0800 (PST)
Date: Tue, 17 Dec 2024 22:13:08 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Ma Ke <make_ruc2021@163.com>
Cc: gregkh@linuxfoundation.org, christophe.jaillet@wanadoo.fr,
	stanley_chang@realtek.com, mka@chromium.org, oneukum@suse.com,
	quic_ugoswami@quicinc.com, javier.carrasco@wolfvision.net,
	kay.sievers@vrfy.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: fix reference leak in usb_new_device()
Message-ID: <2aae349c-dd80-44da-9715-a214f6946b75@rowland.harvard.edu>
References: <20241218021940.2967550-1-make_ruc2021@163.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218021940.2967550-1-make_ruc2021@163.com>

On Wed, Dec 18, 2024 at 10:19:40AM +0800, Ma Ke wrote:
> When device_add(&udev->dev) failed, calling put_device() to explicitly
> release udev->dev. And the routine which calls usb_new_device() does
> not call put_device() when an error occurs.

That is wrong.

usb_new_device() is called by hub_port_connect().  The code does:

			status = usb_new_device(udev);
			...

		if (status)
			goto loop_disable;
		...

loop_disable:
		hub_port_disable(hub, port1, 1);
loop:
		usb_ep0_reinit(udev);
		release_devnum(udev);
		hub_free_dev(udev);
		if (retry_locked) {
			mutex_unlock(hcd->address0_mutex);
			usb_unlock_port(port_dev);
		}
		usb_put_dev(udev);

And usb_put_dev() is defined in usb.c as:

void usb_put_dev(struct usb_device *dev)
{
	if (dev)
		put_device(&dev->dev);
}

So you see, if usb_new_device() returns a nonzero value then 
put_device() _is_ called.

>  As comment of device_add()
> says, 'if device_add() succeeds, you should call device_del() when you
> want to get rid of it. If device_add() has not succeeded, use only
> put_device() to drop the reference count'.

You are correct that if device_add() succeeds and a later call fails, 
then usb_new_device() does not properly call device_del().  Please 
rewrite your patch to fix only that problem.

Alan Stern

