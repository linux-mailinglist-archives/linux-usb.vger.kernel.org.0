Return-Path: <linux-usb+bounces-14792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A011196F693
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 16:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5D358286F6A
	for <lists+linux-usb@lfdr.de>; Fri,  6 Sep 2024 14:22:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85A9D1D04B4;
	Fri,  6 Sep 2024 14:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="oiEN1A03"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9068C156880
	for <linux-usb@vger.kernel.org>; Fri,  6 Sep 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725632540; cv=none; b=LNbAiu1A9w3+gpy58d+6XSTu4J6+a2saLi6U0sv3pw9npkOQqo/9icgksDUcgaCy4pmHR8Q7nsM4fMYJfveXCZTWrg3aLJGbxw4fGo21wBNf76xAmgpcAcQeOE8oYVYn2hkuCMKpBAOJVPPsdNmOjnFOoNcEcM7bIP9hRNCHAsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725632540; c=relaxed/simple;
	bh=tQjkERqH5a7vtr1bH4iiesADfhckp05VjCbDTRK2JqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oEE1cLZUhm4gXrWSUSknIjBnbuynf3ZeuOH2M9ly0Vzi1by59xE3JqHHCz2gl2D8Z5wYpTB+GeASt01RxTDV6qLrsx2oY49y4F1hyyrtJlLwV++Omp6/CeRqCamFNbcAAOKXbGvEjh97iXL+bm382/0ReujXj3AWDxVME4dO5iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=oiEN1A03; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6c34c2a7dc7so10490376d6.3
        for <linux-usb@vger.kernel.org>; Fri, 06 Sep 2024 07:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1725632537; x=1726237337; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i13O7aMho6sIZDHthcXgLUs7X49lVWT+R426B+rq6ZI=;
        b=oiEN1A03rPndoHW6s/52Y0nhxhf1eeYR6joDXFafJ6sTj1g4EtVm0cChsL3P9VCArP
         6pUdQiVoRt9AZ+q/yT5adz5koHwHcuM/3IKjNXFrOXGVSPtF+FSfZGKNuQ3UJYS5ccbz
         7Ea7L/1ez1SXgKFZYtQLOEbwuQgKsB/EjbRKGG4XavppSGtfOh+4jYr1vgZDEyLM+PVu
         31Kuk50YLn5jpCNTXa1GZaIjvp412ZDLs5V9YQBMFacA0WQCqWgFR8cABd8i2iR4vhdw
         iQvnS0L8x337pCgKhMVvh5eZxxpTdK/jj4c4gtrUY2Cxr1B7IPPlY5FU0/I2otFNM6V2
         InYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725632537; x=1726237337;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i13O7aMho6sIZDHthcXgLUs7X49lVWT+R426B+rq6ZI=;
        b=Vr35Gqd3Z1IvOoI3jFBBI4sMSicvL0llBnMoNCHdmDP9kcTKhbGfRNev91MgJQsCVl
         zHddkgHzmloxXVRSX2aUdEZ6TJLK7ansZ1Mzf7HWIxDQTUXdtvCZxiHU3KH3iodY7n7F
         PojSVC90Hj34uRFNtO/prx4Fcp9wALcuP3UdvDIxjDmcfU4Aee1cpTIqCPNRgqSBcRuT
         FgD1SPY6LkPExqJci69KrE2D/Jz5SygNrLDLQ+wOhTS7YJrLe9as0ramZPMHJAyXWQOy
         Gk0q2XvWbXsNX/l+kojv4liNT6A8X5ZjDQJ3j8/uQ7EUqTMWXPXwFCaoEtc0JAlny/3i
         ta6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW0bxG8+GBuJq2uQ9UylqizmYGmCgpDKidwWh+uA8CpVFBVan9JsuYyU3Xv63igErZlO514qaXwunQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrxcdX1Z9WaSPQegUJ18nXtf4uUdkc56w8iLhPzEvg+3qrhBZN
	ApvBp4I2SnLxluMDZskNng6DcCBXNgwmSWPnHRQk0/76jOOxlTkuqPnXmfocFQ==
X-Google-Smtp-Source: AGHT+IHGtc7MfDbeSVaqNtS8fOc7eRQVn4NDEMJLoXNjeV99r/fMfQbwdjG9upYn27KoLoBbDA8LRQ==
X-Received: by 2002:a05:6214:5346:b0:6c1:547b:418a with SMTP id 6a1803df08f44-6c33e69c654mr322505756d6.36.1725632537418;
        Fri, 06 Sep 2024 07:22:17 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24a8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c5201e4bf4sm17079946d6.56.2024.09.06.07.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:22:16 -0700 (PDT)
Date: Fri, 6 Sep 2024 10:22:14 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org, jorge.lopez2@hp.com,
	acelan.kao@canonical.com, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] platform/x86/hp: Avoid spurious wakeup on HP ProOne
 440
Message-ID: <d8600868-6e4b-45ab-b328-852b6ac8ecb5@rowland.harvard.edu>
References: <20240906053047.459036-1-kai.heng.feng@canonical.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240906053047.459036-1-kai.heng.feng@canonical.com>

On Fri, Sep 06, 2024 at 01:30:47PM +0800, Kai-Heng Feng wrote:
> The HP ProOne 440 has a power saving design that when the display is
> off, it also cuts the USB touchscreen device's power off.
> 
> This can cause system early wakeup because cutting the power off the
> touchscreen device creates a disconnect event and prevent the system
> from suspending:

Is the touchscreen device connected directly to the root hub?  If it is 
then it looks like there's a separate bug here, which needs to be fixed.

> [  445.814574] hub 2-0:1.0: hub_suspend
> [  445.814652] usb usb2: bus suspend, wakeup 0

Since the wakeup flag is set to 0, the root hub should not generate a 
wakeup request when a port-status-change event happens.

> [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, portsc: 0x202a0
> [  445.824639] xhci_hcd 0000:00:14.0: resume root hub

But it did.  This appears to be a bug in one of the xhci-hcd suspend 
routines.

Alternatively, if the touchscreen device is connected to an intermediate 
hub then that intermediate hub should not be allowed to generate wakeup 
events.  That's determined by userspace, though, not by the kernel.

Alan Stern

