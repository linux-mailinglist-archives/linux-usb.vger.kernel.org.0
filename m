Return-Path: <linux-usb+bounces-16423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFE99A4163
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 16:41:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D16F71C23391
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 14:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4DAC1F4287;
	Fri, 18 Oct 2024 14:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="jGbvE+Ye"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC171F4286
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729262469; cv=none; b=ey6PmNM8hM/j6+kiPUwUiUYQ/c+lpUuz5m8IIdVgYQIY8lDk3GZ+HCBCEVzUST86evaO8M93Mq492fMtHF5VdWT+PMUTa+kZIpoQSTISacNZjWNXnWyr8h6/UVs0qKOhiKTExCMe8uQn7DeUgTbJONLA22FBjVvGi0JTDeIBIXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729262469; c=relaxed/simple;
	bh=IbhpVSRXoHp+AFpiEZf0r+beixbxaoTPmsDASpo3j0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFJGKtfFiC6Y2mQfXfWflsbbR71gyJx9akXj2riI3OdR3gpAjgecyxJxzI6mUecmFCVy4huYUqpfrmMvnnKxPFuU0agQKojA/Fgoi3HMa4NGJ3HBYo7tLJtdNuv3VQ09qt8zq3Me/zFZmE7KnIrxS8Bxagv4mAEQ+0b6PWhYt68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=jGbvE+Ye; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7180e07185bso947621a34.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 07:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1729262466; x=1729867266; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D8YdydRMs5ZuJN3KTpZl2ndLhC/IwZhLxMPrFhDw1pQ=;
        b=jGbvE+YezPZ4nYTjHw2nwZzny07zyJ9E0dbNL5qlgxsQLAohtiok9y+5FEraQghFWW
         d3EXR6dZQzS0QBYG0gzf8cHSpK7mEP5C1x0mPmSI8RSC3Y1nNsuWD5RoYE4bnct1rBE3
         xSwz9fhw5zTOwd3NtL/QTn1hU693/MjjevArv+nVtDhT4XUj+v860jJ/G1LS3fFop4FO
         TAH12BFGKfv9QTcynXctlkzYLsx1fqCVKYvJnkluQwrIAqDvFLpT0C23rrhYw4JFca6M
         acBqeJ7Ang0Cu4DcfeT9U5GGwnj0GcTbtgABivvxX9SpIukpZiyfGJpoMBmhNO7kkU6e
         gikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729262466; x=1729867266;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8YdydRMs5ZuJN3KTpZl2ndLhC/IwZhLxMPrFhDw1pQ=;
        b=pc6lAtseUwo2F8G2LRi+6cbZeZm3IoPyqlUGaQgX2ajjaJGv6oYryTsrcox69pVJKZ
         oUEQeFXnDj4YBkE80Gj+J3H9w75/tA2ugfvLYut77Hqg2/tN3JKItNAmJxCo+g7QtT3h
         CrM4AFNPkJy3NF2KcmMS0ZlwFFbOz1cLRqr6wrfH2Exe0rwA7lvt/Wt6ujN+Z4NBx3BF
         +ejVrJgcOQOP4xI51H6P8LpitG5adusTFo78SBloiX06HrQKDvL/7PFpDmkb2dLD5Vnc
         kWBgLN5YscKlTctZbvfnW9+m8gmxA28/LOZbldNT9Qr2e9goaWYRfOSYbb4IcvOd4Jqk
         zX7g==
X-Forwarded-Encrypted: i=1; AJvYcCXnULEScroauzuBP+ZZJsPkmJYzYTj48JoWmg5QkKoWwFhXrbGHGgk0Rf8RyXRc2YqCUzdySRAizL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywew6ioDZ1lmRurFGnLhf04R3FM6Hkq+kGjssDmhmN1Z/kAY/mj
	N+m5bZh7hLcbEbFqmPVYzg03TDU24k7qA4G4281HZIU29gT8F2fb1yVw9nvToQ==
X-Google-Smtp-Source: AGHT+IGdvNRCnoIQrcGPoQnsogsIrxwKdaJB0XeTFqOFbVa0uVXdKHhq3gqEzGp12uvN6jIHUo3tgw==
X-Received: by 2002:a05:6359:6d4a:b0:1b8:3283:ec6e with SMTP id e5c5f4694b2df-1c39e046828mr101920655d.24.1729262466532;
        Fri, 18 Oct 2024 07:41:06 -0700 (PDT)
Received: from rowland.harvard.edu (ool-18bba9aa.dyn.optonline.net. [24.187.169.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156fe59c7sm74426385a.84.2024.10.18.07.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:41:06 -0700 (PDT)
Date: Fri, 18 Oct 2024 10:41:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Guan-Yu Lin <guanyulin@google.com>
Cc: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
	mathias.nyman@intel.com, yajun.deng@linux.dev,
	sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
	dianders@chromium.org, perex@perex.cz, tiwai@suse.com,
	niko.mauno@vaisala.com, andreyknvl@gmail.com,
	christophe.jaillet@wanadoo.fr, tj@kernel.org,
	stanley_chang@realtek.com, quic_jjohnson@quicinc.com,
	ricardo@marliere.net, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	badhri@google.com, albertccwang@google.com, quic_wcheng@quicinc.com,
	pumahsu@google.com
Subject: Re: [PATCH v5 5/5] usb: host: enable sideband transfer during system
 sleep
Message-ID: <cc900c5b-32e6-4147-a5c7-923bfa13686a@rowland.harvard.edu>
References: <20241014085816.1401364-1-guanyulin@google.com>
 <20241014085816.1401364-6-guanyulin@google.com>
 <9b5fe5d2-77a7-40b7-b260-856c35d9dcec@rowland.harvard.edu>
 <CAOuDEK2f_mtfiye7MdnOqEkq3pYW1kcdkwEMMBC5CkkQ1OGu3A@mail.gmail.com>
 <fddf19f6-d03a-469e-a56f-ef390c099902@rowland.harvard.edu>
 <CAOuDEK3mmR9052FWEJAVBkUanVJ1MLLebZoANiasUpD9TDBjfg@mail.gmail.com>
 <003263c8-c901-496b-ae04-7cccd7f3cfa2@rowland.harvard.edu>
 <CAOuDEK2U1Ok=a=X36R_xjkW7MJm2kQ=G7ohh_oC=+f=rGa2eiA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOuDEK2U1Ok=a=X36R_xjkW7MJm2kQ=G7ohh_oC=+f=rGa2eiA@mail.gmail.com>

On Fri, Oct 18, 2024 at 07:59:00PM +0800, Guan-Yu Lin wrote:
> Thanks for the suggestions, let me address them in the next version.
> After some local development, our experiments suggest it may be
> necessary to skip usb_suspend_interface() & usb_hcd_flush_endpoint()
> for connection changes behind a hub and HID events in our scenario.
> 
> Typically, when the system sleeps, the hub uses remote wakeup to
> reactivate upstream devices and resume the interface to handle
> connection changes. However, our current conclusion is to maintain the
> device in an active state while suspending the interface. This
> deviates from the norm, as remote wakeup is designed to function when
> devices and links are suspended. We're concerned that this discrepancy
> might interfere with the remote wakeup mechanism.
> To address this, we're currently bypassing usb_suspend_interface() and
> usb_hcd_flush_endpoint(). This effectively simulates an "active
> system" state, allowing the USB controller to notify the kernel about
> connection changes via interrupts. This workaround applies to HID
> events as well.
> 
> Which approach do you recommend? Should we invest in integrating with
> the remote wakeup framework, or is it acceptable to keep necessary
> components active, mirroring an "active system" state?

It's hard to answer those questions because I don't have a clear idea of 
how the sideband system is meant to work.  For instance, what does the 
sideband system do when a port-connect change is detected in a hub that 
sits between the computer and the audio device?  If the sideband system 
decides to change the audio device's settings, how does the regular 
audio driver learn about the change?  And so on.

It's worth pointing out that allowing two different drivers to control 
the same device is generally not a good idea.  More likely than not they 
will end up interfering with each other at some stage.

Alan Stern

