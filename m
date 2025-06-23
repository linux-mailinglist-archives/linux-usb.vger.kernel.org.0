Return-Path: <linux-usb+bounces-25035-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71102AE580B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Jun 2025 01:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DFAF1C26463
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 23:33:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3A322D78F;
	Mon, 23 Jun 2025 23:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="itLrDnJ8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD7227E8F
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 23:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750721574; cv=none; b=SpfqwZikS7FXuhjwQ7r1zw7x9ahqIGhYb2d3bEpidPDl8Pve/PkV3Fis5YKWaK/+lZVlo7r3bkcKqRqLaxky+L3ra1oTPodGALNrG/dQfk5LiSk4rCjnk/piBwKpAKktXlRsr7DZ1nsGvGyN0pr6AvA8R+RrmQo2XUOfsgaFO+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750721574; c=relaxed/simple;
	bh=K56mKHHLXtwc5hRAfxeaXBiGz2WSxbaQnlx7RfbDe5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iKnXB9SFxFI1pwguDCj1vRfy1E12UcuQsqjCmspn5pFCYqqHm+8C+87LfS2CK/lfH2Rp9Lc4zGlNb4bDbQi2q3lbj6kL8RMuMeWbrqqr5fZpoQFJptaxrNjF4caPqGZ0wJcSHCAJOdWqP8NdyXcavo3LTLmIUOMpGH+xzsAXiFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=itLrDnJ8; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7d3862646eeso311790385a.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 16:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1750721571; x=1751326371; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oTfT9g5hWGgx6r00qx14KfZ3qfGiluwHm7OsvjyNUSw=;
        b=itLrDnJ8rjpK8rFalvkyiWAFSw+Leg04SsKcSlSWPHDUxsPiyLvM69wOzq5vvvLnMY
         hCQ4/xh+zl419aG5OV6Pz5w1/oTAe3Juw1xkk0r+SVMVedKNfQRIp5qoiSP0I7OiGDrV
         3TZ3hRG5LonfPNO/YmVB+63qOXnWanMOkevxDtpzGM3zqtjy6IoeQbSQF36hCSOb8rVc
         DAhsFDRVtNDT5uByqyiLB7TCrWzbvFhv5mjCLjkjA/JzX6NvBPUqOpVlunIguBMmhSNC
         rBtx+x2KoN72C9WP7UE/Zpc1+UWY6rZGIniNtiJX6aI66Rl2HgpBcj8cNUta/peSPyLA
         KP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750721571; x=1751326371;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTfT9g5hWGgx6r00qx14KfZ3qfGiluwHm7OsvjyNUSw=;
        b=uvZezSKpy8heQ8+U0EowEXnxopm0HVwF0Upoapv2h0F6h93fmAQzPqBVwCdb4z+MVb
         iuj2onTOSbhCPGiA7UMxvNzcyor/YAr3etwuwSO8pDQdHJlf8Adq6mU4xHIJ1iTVK8am
         p1owP9k5vCRgAnAhV2Ab8jiByNHl3U3jkxLzyYLxpW1kC12T0Q4b5CuYZ+d9+BDoIfO/
         WtIVHZar2Qoz/pKM32nT7rksrg52QskT9XyfBsLoMO+0ivUdJ2MaNN5BN71ptMHVaVnI
         pE95J0NyM6YSVri9gzPxpSqFjzttOJEp9nW3BUh0rleO+dbmfXD24QiuDAjNv2m8lkUH
         N57g==
X-Forwarded-Encrypted: i=1; AJvYcCX/B69T67COSVKN8vqs7J5ad2cZk+RW7zCxy3K5jAazIcL8ofvrJz00CfY3lybLFZA2msuPxwNmefI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjMz6k6+DYKUyP/HLHXluWcHN2WTnRVO9LflA+6GwojuBp700I
	n/jKtezFLQn2M/xOWIEavnKIP5HRq/aucSQ6AFamzZr5SUdG7GnKqA3BzsMTVmv5yw==
X-Gm-Gg: ASbGncunmJWrrX+mbUwoO292phvql+kA18ALsrfXYTaonDwVxrEqD5AM+RZImYEGRMe
	CEzKwk1hQx4SJOeaZXFztJ8l20n6edpOYPwfXpMQ2HiZuNPg4BdaguQ/uA2x7nqsbKh4uFuQLvF
	qPBa0SYjYPon7M5IOenkadoFjhGbTdkyHOlAtpHTCthZrswt3Y5dwqlDnOYUrErOqPUqGHkmmkT
	cdTdgJStHa0cgNR8RKSuf57YNkNXmWLUt2IXbnNW2Qod/dqRZrJ9eAd8ugf9bqmSiSaNxiv6RQh
	QjIVeMFCztjLP5dVi8+zOXsHf67Y8vfdXvNL50SaHE1fCgOzWnN8tjK4vrw5gAP3dW1Ua00KJGJ
	Vu2TtJMnMgc5RjThguX3wz+NsffLjFzaQOcY=
X-Google-Smtp-Source: AGHT+IH2Hxbk32TYcAMEqNHRkSeOyH3MAsgPDvjbRbtpcnyPxJE9w2Xitm1Hj7TqVWBLzq3i9t3oHg==
X-Received: by 2002:a05:620a:2692:b0:7cd:90eb:7d70 with SMTP id af79cd13be357-7d3f991d078mr2058472785a.35.1750721571218;
        Mon, 23 Jun 2025 16:32:51 -0700 (PDT)
Received: from rowland.harvard.edu (ool-4352cc89.dyn.optonline.net. [67.82.204.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99f0351sm443924585a.70.2025.06.23.16.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:32:50 -0700 (PDT)
Date: Mon, 23 Jun 2025 19:32:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	oneukum@suse.com, stable@vger.kernel.org,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v2] usb: hub: fix detection of high tier USB3 devices
 behind suspended hubs
Message-ID: <c73fbead-66d7-497a-8fa1-75ea4761090a@rowland.harvard.edu>
References: <20250611112441.2267883-1-mathias.nyman@linux.intel.com>
 <acaaa928-832c-48ca-b0ea-d202d5cd3d6c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acaaa928-832c-48ca-b0ea-d202d5cd3d6c@oss.qualcomm.com>

On Mon, Jun 23, 2025 at 10:31:17PM +0200, Konrad Dybcio wrote:
> On 6/11/25 1:24 PM, Mathias Nyman wrote:
> > USB3 devices connected behind several external suspended hubs may not
> > be detected when plugged in due to aggressive hub runtime pm suspend.
> > 
> > The hub driver immediately runtime-suspends hubs if there are no
> > active children or port activity.
> > 
> > There is a delay between the wake signal causing hub resume, and driver
> > visible port activity on the hub downstream facing ports.
> > Most of the LFPS handshake, resume signaling and link training done
> > on the downstream ports is not visible to the hub driver until completed,
> > when device then will appear fully enabled and running on the port.
> > 
> > This delay between wake signal and detectable port change is even more
> > significant with chained suspended hubs where the wake signal will
> > propagate upstream first. Suspended hubs will only start resuming
> > downstream ports after upstream facing port resumes.
> > 
> > The hub driver may resume a USB3 hub, read status of all ports, not
> > yet see any activity, and runtime suspend back the hub before any
> > port activity is visible.
> > 
> > This exact case was seen when conncting USB3 devices to a suspended
> > Thunderbolt dock.
> > 
> > USB3 specification defines a 100ms tU3WakeupRetryDelay, indicating
> > USB3 devices expect to be resumed within 100ms after signaling wake.
> > if not then device will resend the wake signal.
> > 
> > Give the USB3 hubs twice this time (200ms) to detect any port
> > changes after resume, before allowing hub to runtime suspend again.
> > 
> > Cc: stable@vger.kernel.org
> > Fixes: 2839f5bcfcfc ("USB: Turn on auto-suspend for USB 3.0 hubs.")
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > ---
> Hi, this patch seems to cause the following splat on QC
> SC8280XP CRD board when resuming the system:
> 
> [root@sc8280xp-crd ~]# ./suspend_test.sh 
> [   37.887029] PM: suspend entry (s2idle)
> [   37.903850] Filesystems sync: 0.012 seconds
> [   37.915071] Freezing user space processes
> [   37.920925] Freezing user space processes completed (elapsed 0.001 seconds)
I don't know what could be causing this problem.

However, Mathias, I did notice a minor error in the patch when I read it 
again.  It's in the new part of hub_activate() which does this:

+		queue_delayed_work(system_power_efficient_wq, &hub->init_work,
+				   msecs_to_jiffies(USB_SS_PORT_U0_WAKE_TIME));
+		usb_autopm_get_interface_no_resume(
+			to_usb_interface(hub->intfdev));

Once queue_delayed_work() has been called, it's possible that the work 
routine will run before the usb_autopm_get_interface_no_resume() call 
gets executed.  These two calls should be made in the opposite order.

Alan Stern

