Return-Path: <linux-usb+bounces-32289-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BCFD1A014
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 16:47:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BB09230060FC
	for <lists+linux-usb@lfdr.de>; Tue, 13 Jan 2026 15:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A91642FFFA3;
	Tue, 13 Jan 2026 15:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="FQr1o3V3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88C91CAA79
	for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 15:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319257; cv=none; b=sG7mvml4j2YJ5c3j/4nvm9Udr/BeVJDdtN75Vw2kkwk+HBuYckXVVKemdbIW5hrH6+U/cekPWmy9DaMCPl47cRnwQeyeO1bQKmyvY2kLPQDkUFb+pevV9jLMspXu/lHP2y5aLzBXuHhRKnh7Pg1d9CaNYNaAhJ+JmUcIFqNPSW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319257; c=relaxed/simple;
	bh=eQZ9PBbv8200BncF+WzVOXiHLgVVW1qfPJ1wOjwR4Q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1vIgY0rlht4FnUOTZ4TTLQY3J8xdFTgk9NgEFL9e1uMejuDQzwQfaxeIsqImtndsBAU/44xXodHx/OwEOC3eki5Mao3q4mc9AYAXvVrO1pK/9Bh++9O0GK9WAATqLSy5VircXbHgurEBW07ib70pKWLrFC2NAYQMly+nrWf14o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=FQr1o3V3; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5014600ad12so1864641cf.2
        for <linux-usb@vger.kernel.org>; Tue, 13 Jan 2026 07:47:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1768319255; x=1768924055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=V4E29K8NtthQbL8xaHlQbXgCcFMaQ8I/QIsll/4mAVI=;
        b=FQr1o3V3GYG4p4qx++bpVUlRJTWV8ZYc9sxMWwdqSPDL/6ha/VN3HAX1xh/TjUo7xr
         M4yGr4/tJM9rVkL4WoJWcUjGaMZOc1BKGr+/8qwwl2v21tqL6O4gKGnlH9hpRXHNCRyl
         klaMkli5wWg5TJIAKtPhKY/nZZtTRu93rpYYf+YktxD1CVKRj55YAUrYpvrR19XGen1v
         sP6sQVxWzAa8ojk8LXMuDvSNSTx9ctRxYAF2u7beseJNEyLnoeaJYcA+1QfmSdnDoumS
         QByVvsNIaSGGfsBoowEpYndH9v10j8RTr5iZDSApXF3RpqJM9KkPhlf9WdHcGdAIwRDg
         u3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768319255; x=1768924055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V4E29K8NtthQbL8xaHlQbXgCcFMaQ8I/QIsll/4mAVI=;
        b=S5C9k7wcafYwdCDZD6Tc4CpKrfT4HAvxV5Py117gdoF4tn0h18cvcpKJugaf+hN//r
         umD+IQtOp632c0aVK+XWkXEhET+lpHn71Czx/GLRlkjccD95JNrrI4La1oHOcJoEzhS7
         bhSJjbOORw1mr4U6GQWr3IAlMOhUudjOSLzwaz5Au+k3sIWuQ5oVkYTuMbEh+92sZWrX
         ngA9FUccEgKp2Tci6xYZDBbID0+xDCtEsdtm4FrG4CZo1PMCIY8JscD3CN7xP975QQIl
         EMO69KtGnt4qIQ0I4XZXB+myIFu+piBcEOCykCA4Y2C2zJzDVsJOT8QtwsjhkpIAXF8S
         sNsw==
X-Gm-Message-State: AOJu0YzEy5aj6Dj7lxRCCYe9uDa8aW1ULfYKRosb+kG8XaSqo0c10kJ3
	BP29aRfj0AkUa2M1GLDzwLdCf3hmK+mtokrTfqU7D6Da+zqDSiFJa5e8HbyigMyfkCOR6vTl8dp
	w4Ps=
X-Gm-Gg: AY/fxX4SoPgos3+gV9+NjvxdBZnFsUH/ZDquAUpn88vZVOuFF4trwR7CDyqz6Beaurw
	HJ3b2CELUZRxmRENhx3O+pwKCUQWj/2o2uzjryXNQpdggsnh0XO0iz8C/wj7TUfRDPTih3eTy2N
	Dwp8oFIfriXfsg3R1RUFpFGDJnyri+hiptdCr3awhsE4TQHlYgFqZKwsUOMGPwtjA9/2dDP8Lpz
	cJ0nCLIo2QiYVY6N078w87suACgeOqugLWJm5MSv2PufPVNF/oQrNRcGPD5dSJMY8YHu+nOatO5
	D8tVHNzunZ+/leZz42n/GhiUGuOS2hDgLcOaE7M4ztnle1xm2cgQ8Zc8AhqdaNWtu7+G4HfF456
	vPX7dwd9NsJv+msp1Xzbn48tUwotYPcAfh4bjPK2peo1gCvsi7gvTTJNZz6Tzp3q2gmYLO5rHdU
	WAQdBgjO5FAft0
X-Google-Smtp-Source: AGHT+IFhjbjTMA3UG1+LzK0VTQpsT0ybcHnnkXUDGy3gkqerhp+UUzpz/yX8uxO8J69O4bodtuJvPw==
X-Received: by 2002:a05:622a:20a:b0:4ee:24e8:c9a1 with SMTP id d75a77b69052e-4ffb499a89cmr245461151cf.44.1768319254559;
        Tue, 13 Jan 2026 07:47:34 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7a0a])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4ffa8d3d92esm149003291cf.5.2026.01.13.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:47:34 -0800 (PST)
Date: Tue, 13 Jan 2026 10:47:31 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: USB mailing list <linux-usb@vger.kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: Track down EHCI and companion errors on rk3xxx systems
Message-ID: <38365c37-b125-4ffb-8ce7-bd4f3f7596ba@rowland.harvard.edu>
References: <073879e4-aea8-4625-bc83-c4b6dd9c9231@rowland.harvard.edu>
 <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DFNI1Q9N7GC6.20PN0RG9LRAQF@cknow-tech.com>

On Tue, Jan 13, 2026 at 02:35:21PM +0100, Diederik de Haas wrote:
> Got my (gtkgreet) login screen and plugged in my keyboard adapter in the
> *bottom* USB2 port ... and that did NOT work.
> 
> Logged in via SSH and noticed it was indeed not listed in ``lsusb``.
> Checked ``lsmod`` and ``dmesg | tail`` ... and noticed the kernel *did*
> notice plugging in the keyboard adapter, so did ``lsusb`` *again* and
> then it *did* list my keyboard adapter.
> I did NOT employ my usual 'workaround' by plugging it into a USB3 port.
> 
> So it may be that it would have always worked ... eventually ... if I
> had just waited long enough?
> While 'dmesg' seems to suggest it took little over 0.5 seconds, I'm
> really not that fast ;-P (or that impatient)

Is this repeatable?

If it is, try doing the following.  After a fresh boot, log in via SSH 
and turn on dynamic debugging for USB:

	echo module usbcore =p >/sys/kernel/debug/dynamic_debug/control

and clear the kernel's log buffer:

	dmesg -C

Then plug the keyboard adapter into the non-working bottom USB2 port and 
wait a short time (say, 30 seconds).

Then get a copy of the dmesg output and post it here.  Also, check to 
see whether the keyboard is working.  In fact, you should check the 
keyboard during that 30-second wait, so you will know just how long the 
delay was before it started working.

Another thing you can try is to force the necessary module(s) to load 
before plugging in the keyboard adapter.  For now, a simple modprobe 
issued over the SSH connection will do the job.  If this turns out to 
help, you can configure modprobe to load the module(s) automatically at 
boot time.

Alan Stern

