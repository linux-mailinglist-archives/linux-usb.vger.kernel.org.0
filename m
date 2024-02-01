Return-Path: <linux-usb+bounces-5723-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A69F3845357
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 10:02:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79CA5B22DB1
	for <lists+linux-usb@lfdr.de>; Thu,  1 Feb 2024 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDCD515AACC;
	Thu,  1 Feb 2024 09:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aq9nQ/0P"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B7115AAAA
	for <linux-usb@vger.kernel.org>; Thu,  1 Feb 2024 09:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706778127; cv=none; b=EwY3hqw5m0vjKcokJtH9I/x7brwgtw/y840fz2Q/P2imlB6eiVt3WQuAFymqXuTk/dekcbFWxurD8VUV/uj+3/G/ZejtruU6OFQxuYWwD+VxhGkAQc3PzXF5emdv3YnxPkA8qkUxjwLbS5xdyHyMDGBz2C6LyVAAbuYmczG7vJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706778127; c=relaxed/simple;
	bh=LsreWoRfx0pNIFiAcMF+cfb38qMMG2mxUe6kV9wDkMQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4t+8t2hBU+I6q1pqThaZP+E4BQcwYEKSqYgkO0oYRTZ3BuNqJgvxUSeyvZR/ZYvZrJKEiQgvJ+P1WaEz4+5YfU9iLcMhY+hV09cgUgaMrDxnBhx0fG0Id5a+DOVKGnD0+43u7QRPLgbafnCbo78MMSxm0+MWWwVu7YG1NzGk94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aq9nQ/0P; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-55f5d62d024so5266a12.1
        for <linux-usb@vger.kernel.org>; Thu, 01 Feb 2024 01:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706778124; x=1707382924; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BI44NP3dAK0mdmDzCdTw2B5OH4IMuQfBMUx2warDaO8=;
        b=aq9nQ/0PjJk9Mxjodi3m0Y0kjfix456yaMM+XQ2GVTXh7ks+Wecofb33pFkWoUHDU1
         F1+PxHKFKffuiI0rZuunstKPXuCW47CyROI0aqBaT3dsBJz5eOdj9xISPmSEeubjs4pZ
         1I7mSuh3+/b2+B/zquMEEmZ41hxM0wOwkPwYgdjcaI2XtxgrYqR7Xr5IOwI/3jkjeyaO
         YHNvXuKhxZlb04wA4qRNtIPfjdWmZMMBboHw2+wesbQCA+dOy5Nj2xgq+cTtYxWiV2as
         yTApApGgy2wgREsgMRxtFPv80mRKfdOCm+gqaxIGG5OVDVd2fudl57vvLWk8K2CurUah
         zcyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706778124; x=1707382924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BI44NP3dAK0mdmDzCdTw2B5OH4IMuQfBMUx2warDaO8=;
        b=pJ/gWzhfg1Fsj5jXdGuuySQwpi5Nz9o4ze3qSVHxNb5XE25nRy/MPIpKmtonDj8DT2
         4PbhAijKCZ7KNZQtrTqxBra6A4nXyyN5qt4m+JvZhF+agMWcASVp+9JdCSsn/vAAin/h
         K6+KKMMRky70w6U95L/GJghHEnqEt/4034YIv5nDriSOgjnWBL4JjGCT95vhWQawNWC+
         q77e8xPQmKz1A9f9FHAM9ib2bM25gylOtWrZrlPOxJAAdeFN3oD3UXMqPkhaE84o4DJg
         ODWPsVzlsbGN/YcE/OZf3qMqEYUPt6LLR1t+zvgAt6nlnxis7teBg4XQ8GH5F4jzeGGD
         FbNA==
X-Gm-Message-State: AOJu0YwUi8FmTpQwP3+KCxPgLz8Kyp2r6eW+xBkX195U3cEY6bU4PeXo
	v6peYS017C3zU/qO7rAZ4wctqqyncVbFm+OmrdYAGKr2nc7dc5y/F+9fbA4JqZfiuFjZpv/COvz
	59tpi7VrtknqazKhonH7xR8+vI/eyKTFnVWrK
X-Google-Smtp-Source: AGHT+IEV+PFmvWb0HhY9R2VJ/3+i829zTcpeThpuxAGk8FzbJyV2L6AzWe5SCksdJRpPQudCgJcihZ8Y7vNI9ZKsj1Y=
X-Received: by 2002:a50:8e51:0:b0:55f:a1af:badc with SMTP id
 17-20020a508e51000000b0055fa1afbadcmr165293edx.6.1706778123426; Thu, 01 Feb
 2024 01:02:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130064819.1362642-1-guanyulin@google.com> <0e4221b5-bafe-4bea-b533-0ed8add81ef1@rowland.harvard.edu>
In-Reply-To: <0e4221b5-bafe-4bea-b533-0ed8add81ef1@rowland.harvard.edu>
From: Guan-Yu Lin <guanyulin@google.com>
Date: Thu, 1 Feb 2024 17:02:00 +0800
Message-ID: <CAOuDEK2VSBcQdLKt27VrLUxH2S22275ffbe5mdVM=vBZDhceQA@mail.gmail.com>
Subject: Re: [PATCH] [RFC] usb: host: Allow userspace to control usb suspend flows
To: Alan Stern <stern@rowland.harvard.edu>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com, royluo@google.com, 
	hadess@hadess.net, benjamin.tissoires@redhat.com, 
	heikki.krogerus@linux.intel.com, oneukum@suse.com, grundler@chromium.org, 
	yajun.deng@linux.dev, dianders@chromium.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, badhri@google.com, albertccwang@google.com, 
	pumahsu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 31, 2024 at 1:12=E2=80=AFAM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Tue, Jan 30, 2024 at 06:47:13AM +0000, Guan-Yu Lin wrote:
> > In a system with sub-system engaged, the controllers are controlled by
>
> What is a sub-system and how does it become engaged?
>
The subsystem, run by the co-processor, provides basic functionality even w=
hen
the main system is suspended or otherwise occupied. In our design, the
subsystem becomes engaged when the main system is powered on. The userspace
will interact with and control both main system (main processor) and the su=
b
system (co-processor). That way, the controllers will not be occupied by bo=
th
processors simultaneously.
>
> > both the main processor and the co-processor. Chances are when the main
> > processor decides to suspend the USB device, the USB device might still
> > be used by the co-processor. In this scenario, we need a way to let
> > system know whether it can suspend the USB device or not. We introduce =
a
> > new sysfs entry "deprecate_device_pm" to allow userspace to control the
> > device power management functionality on demand. As the userspace shoul=
d
> > possess the information of both the main processor and the co-processor=
,
> > it should be able to address the conflict mentioned above.
>
> This description and the comments and documentation in the patch all
> talk about "device power management".  But in fact the patch only
> affects system power management; it does not affect runtime power
> management.
>
This description does introduce ambiguity, In addition, the implementation =
does
affect more functionality than I expected. I'll re-design the feature to le=
t it
only affect `suspend to RAM`. The related comments/commit message will also=
 be
updated in the next version.
>
> Also, "deprecate_device_pm" does not seem like a very good name.
> You're not deprecating power management; you're just disabling it
> temporarily.  You should find a better name.
>
Thanks for pointing that out. I'll use `disable_suspend2ram` in the next
version to better reflect what this feature does. I'll also update other
wordings accordingly.
>
> Do you really want your new flag to affect device suspend during
> hibernation?  Does the co-processor remain powered when the system is
> powered off and unplugged?
>
The implementation will be modified in the next version. This feature will
only focus on `suspend to RAM`.
The co-processor will not be powered when the system is powered off.
>
> Do you really want the new sysfs flag to be present even on systems
> that don't have a co-processor?
>
We've identified a use case where this feature would be essential, which is=
 a
system with both the main processor and the co-processor. However, other us=
e
cases may also benefit from this feature. So, I think we could create a bui=
ld
flag for related data structures and codes.
>
> Why does this affect only the USB subsystem?  Can't the co-processor
> use other, non-USB, devices on the system?
>
In our use case, the co-processor only supports USB subsystem. There might =
be
other co-processors support more subsystems, but we're not sure about how t=
hey
will interact with the system.
>
> Alan Stern

