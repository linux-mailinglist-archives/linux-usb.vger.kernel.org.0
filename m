Return-Path: <linux-usb+bounces-12391-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A854893B70A
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 20:52:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6335E285633
	for <lists+linux-usb@lfdr.de>; Wed, 24 Jul 2024 18:52:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7146F16A947;
	Wed, 24 Jul 2024 18:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="F3YGSXt0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3912A1598F4
	for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 18:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721847173; cv=none; b=pjR//wW4b4PSz19HylSyKbTVqVNdLAQRRlx3GGPV/hTW7iOlExB4ryZL7mhXSw+xxZviX6JsV1ohHSKG+HvFj6mlGObEqcVamZyvdxLMLipi6/pm0c1rJ1+lk87rjcrKtFuez9Dlvw1U40oJu7a98Q3SQHYIVjF6aJvQUEUfKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721847173; c=relaxed/simple;
	bh=PJlhlF1KdCdmjZyeZlUKef4JZ5PjCR/ybpSJFMsSBe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N18I43oaXcN980Iug2RbAgCk+X0U8Bl6pHKqBK3IP5p2FeVo5zkuKkbquCvBAvW9doR+S7xFrKw9E9OuOA2o7owAAY1cxGLU5DKAgXxU+WYEGaQoh5vfqN8jtyjXGujeeKspByxoaA6qTZ6Il5gj8qFvWdCXw6edwCWIZaep0Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=F3YGSXt0; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5d569bee00aso110795eaf.1
        for <linux-usb@vger.kernel.org>; Wed, 24 Jul 2024 11:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1721847170; x=1722451970; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JNQ4I0Zdzz19iH3uEXnI3RxSHcCL/n9EACJr4SAD+9c=;
        b=F3YGSXt0+JpcRXYmbUAbHT6vRnyWLinqG+ILWI2U3DYp0PrNI9Z8lAzb19IDKZipbe
         YuYjHTJlNdgrTWthwvnC7UzU4Od4D4BEqSXPSHWt99vHWzlzaCq0MsMsDE03cTMiTSrh
         GyYKC3L7yBwOypfcz68LJg4C7H1ICvrNqTxFlZS1NauwNsKO8mct9Q3seoYcrQmiwBkC
         IPcaWWRkA7wa48WQF9Vj8RVSthRKHw6wCgLHhHjwRKNCJ44vY5AYwlTM2pYPqitpn1+n
         tRkvhIMkDX/N6S42zROR/ZM+MC7eVVYmbLFW6ONupomcD23VzCL3ko93vNiusdCkCldo
         wJuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721847170; x=1722451970;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNQ4I0Zdzz19iH3uEXnI3RxSHcCL/n9EACJr4SAD+9c=;
        b=Jj3Co1bID45X30UpZ3IKXCyCVG+0oqVBuGua8jx+DcI2qBnybVEcgCtOl6vhPmhYml
         eUP95Zcfs5nD+1HcqYOQZwXMlqQiUCHC7iwbaFDvkn8wZdxx4Rxz+Ju/Z3iBdnbHzepv
         D1fXM4+gc0DazXFCItNK6pzqste81hbvEXE3gxRbwCP4KHlbwm0r1IfFrAFs8M5HjY36
         m9lQu2UcKpZ+s78ok7J9Y6aTLWxaEhg3QaT/i8LI8a1SRINhH15L+uFu6F8I/pvvPWYa
         GyI2S3K7Fb7dCdy6TYnR/FkUlr3g21g56nXX0lt3wBgUY4lCj+dxQbteFtPi6cJsIae1
         EPOw==
X-Forwarded-Encrypted: i=1; AJvYcCVJfw+OLjjeH9hSDn10f869RyXoR6+hxCyeWf4SqykuFHKFRkc9O0QrhoqQl2/bugcTOoxERuCbKst5y0lyyzpajmOpYeBIYyuy
X-Gm-Message-State: AOJu0Yz8fA4sZxh7zDqv1t7Unh0LSryPpKoWBhJyKUIyzpjfJMPRZlrE
	96hZMMBQ5M5rGWYKorNB6yRz59tkzX5d8pPiYMhiXYVmd4hLOlYtmNoojhFdDMbsiFspAlfGREs
	=
X-Google-Smtp-Source: AGHT+IF6ZZPzUt/0Jb0QQ+bCVPesFomEFJYy7M9894qFg6KkWE/eZ6PM3ZAsU4s8B6DWBMUYhg5A+Q==
X-Received: by 2002:a05:6358:c028:b0:1aa:c71e:2b2b with SMTP id e5c5f4694b2df-1acf8a1cb66mr98884655d.12.1721847170238;
        Wed, 24 Jul 2024 11:52:50 -0700 (PDT)
Received: from rowland.harvard.edu (iolanthe.rowland.org. [192.131.102.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b96a7bb6dcsm41766816d6.90.2024.07.24.11.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 11:52:49 -0700 (PDT)
Date: Wed, 24 Jul 2024 14:52:46 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: core: hub_port_reset: Remove extra 40 ms reset
 recovery time
Message-ID: <3d3416cd-167f-4c50-972b-0eb376a13fdf@rowland.harvard.edu>
References: <20240724111524.25441-1-pmenzel@molgen.mpg.de>
 <c7c299e7-605c-4bd6-afad-dfbfe266aa7e@rowland.harvard.edu>
 <f1e2e2b1-b83c-4105-b62c-a053d18c2985@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1e2e2b1-b83c-4105-b62c-a053d18c2985@molgen.mpg.de>

On Wed, Jul 24, 2024 at 08:14:34PM +0200, Paul Menzel wrote:
> [Cc: -gregkh@suse.de]
> 
> Dear Alan,
> 
> 
> Thank you for your reply.
> 
> Am 24.07.24 um 16:10 schrieb Alan Stern:
> > On Wed, Jul 24, 2024 at 01:15:23PM +0200, Paul Menzel wrote:
> > > This basically reverts commit b789696af8b4102b7cc26dec30c2c51ce51ee18b
> > > ("[PATCH] USB: relax usbcore reset timings") from 2005.
> > > 
> > > This adds unneeded 40 ms during resume from suspend on a majority of
> > 
> > Wrong.  It adds 40 ms to the recovery time from a port reset -- see the
> > commit's title.  Suspend and resume do not in general involve port
> > resets (although sometimes they do).
> 
> It looks like on my system the ports are reset:
> 
> ```
> $ grep suspend-240501-063619/hub_port_reset abreu_mem_ftrace.txt
>  6416.257589 |   3)  kworker-9023  |               | hub_port_reset
> [usbcore]() {
>  6416.387182 |   2)  kworker-9023  |   129593.0 us |                  } /*
> hub_port_reset [usbcore] */

> ```

It depends on the hardware and the kind of suspend.

> > > devices, where it’s not needed, like the Dell XPS 13 9360/0596KF, BIOS
> > > 2.21.0 06/02/2022 with
> > 
> > > The commit messages unfortunately does not list the devices needing this.
> > > Should they surface again, these should be added to the quirk list for
> > > USB_QUIRK_HUB_SLOW_RESET.
> > 
> > This quirk applies to hubs that need extra time when one of their ports
> > gets reset.  However, it seems likely that the patch you are reverting
> > was meant to help the device attached to the port, not the hub itself.
> > Which would mean that the adding hubs to the quirk list won't help
> > unless every hub is added -- in which case there's no point reverting
> > the patch.
> > 
> > Furthermore, should any of these bad hubs or devices still be in use,
> > your change would cause them to stop working reliably.  It would be a
> > regression.
> > 
> > A better approach would be to add a sysfs boolean attribute to the hub
> > driver to enable the 40-ms reset-recovery delay, and make it default to
> > True.  Then people who don't need the delay could disable it from
> > userspace, say by a udev rule.
> 
> How would you name it?

You could call it "long_reset_recovery".  Anything like that would be 
okay.

Alan Stern

