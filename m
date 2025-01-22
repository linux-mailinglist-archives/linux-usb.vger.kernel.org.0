Return-Path: <linux-usb+bounces-19648-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E77AA19A3F
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 22:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DE2DB188C926
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 21:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 731071C5D72;
	Wed, 22 Jan 2025 21:17:33 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from cae.in-ulm.de (cae.in-ulm.de [217.10.14.231])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601141C4A17;
	Wed, 22 Jan 2025 21:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.10.14.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737580653; cv=none; b=kVGy0s5ZkfKaTquRPFsyDn3eOgqnMvVrmixXokfnDKDwdg1GDatdvIIFoIsr3O8jySxgvdgShX49Cds86op72mQwx0w6qMp95dwiRNTz4r8axRTU26SlW0G5aYiJ8aH0mt2JMxCnM/gW//4I7YZQji5i0mnExzukKmBatVM+DB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737580653; c=relaxed/simple;
	bh=CqiQ0imkdTILdMNRyDweHmdqmMAf2zxsNfwD8+kSOqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sxwQTk6+LBqljsUG+hNwybzhSGiIbYR96ag8CW8ueDEWWiig1CiCZmEtd1nla+Nv2rztRE+1MK/uY5Lt7kDujKCIGcqeMDUaPGPOCZf5bq/N+TQ7VJB2c+ihPYQkyrK6CPBV59Us3oieAdhLDw2eU2U5QYKsPL3gdO2s05seLw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de; spf=pass smtp.mailfrom=c--e.de; arc=none smtp.client-ip=217.10.14.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c--e.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c--e.de
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id DEE301403AA; Wed, 22 Jan 2025 22:11:47 +0100 (CET)
Date: Wed, 22 Jan 2025 22:11:47 +0100
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Fedor Pchelkin <boddah8794@gmail.com>
Cc: Saranya Gopal <saranya.gopal@intel.com>, linux-kernel@vger.kernel.org,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Prashant Malani <pmalani@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Samuel =?utf-8?B?xIxhdm9q?= <samuel@cavoj.net>,
	linux-usb@vger.kernel.org, Kenneth Crudup <kenny@panix.com>,
	Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 5/5] usb: typec: ucsi: Clear UCSI_CCI_RESET_COMPLETE
 before reset
Message-ID: <Z5FfE7ps0Cc25qIL@cae.in-ulm.de>
References: <Z2Cf1AI8CXao5ZAn@cae.in-ulm.de>
 <ie6okmkyqr7qiydcrcepghs6aewgi7stipcydgcpaoedhgp2ef@ye7y43aceofl>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ie6okmkyqr7qiydcrcepghs6aewgi7stipcydgcpaoedhgp2ef@ye7y43aceofl>


Hi Fedor,

On Sun, Jan 19, 2025 at 04:23:21PM +0300, Fedor Pchelkin wrote:
> Christian A. Ehrhardt wrote:
> > The (compile tested) diff below should fix it and I can turn this
> > into a proper patch but I lost access to test hardware with UCSI,
> > thus this would need a "Tested-by:" from someone else before it can
> > be included. Maybe Saranya can do this?
> > 
> >      Best regards   Christian
> > 
> > 
> > commit b44ba223cd840e6dbab6c7f69da6203c7a8ba570
> > Author: Christian A. Ehrhardt <lk@c--e.de>
> > Date:   Mon Dec 16 21:52:46 2024 +0100
> > 
> >     acpi: typec: ucsi: Introduce a ->poll_cci method
> 
> WARNING: CPU: 0 PID: 8 at drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1af/0x1c0 [typec_ucsi]
> is triggered on my laptop on roughly every system boot. When it's not,
> there is a
>   ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed
> message observed in the log.
> 
> I've tried the above patch "acpi: typec: ucsi: Introduce a ->poll_cci
> method" but the issue is still triggered [1].
> 
> Is there any useful info/logs I can provide you for further
> investigation of the warning in question?
> 
> As the warning is quite reliably triggered on my system, I may help with
> the testing of other patches.

Hard to say what might be going on. Some obvious questions to
narrow it down, though:
- Is this something new and UCSI worked before or has UCSI been broken
  with older kernels as well (maybe with different or no error
  messages).
- If you get the warning but not the "PPM init failed" message,
  does UCSI actually work? Try to plug something into the USB-C
  ports and watch out for additional error messages (possibly after
  a timeout). Do new files/devices show up in sysfs?
- Printing the value of CCI at various stages of the init process
  might help us to understand what's going on.

Best regards,
Christian


