Return-Path: <linux-usb+bounces-30811-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CCC7BC03
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 22:30:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D72F33561D9
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 21:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0E052FD7C7;
	Fri, 21 Nov 2025 21:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Bonzpj9K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0538533D6
	for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 21:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763760580; cv=none; b=jpdS4DIwkWov/AG0i3R6dFQNy3okDd5r++1O7yXsUj8bNvflC/xG1d8f00uucIYCfkFFw4OSFm1iL+U21KJ17rXyqGNQl86fxAzqlZ80s8rwJ7Jpe2Z2ZpebEBCy8WnJ7E9VJRryaJOrrNNgpKra8fJ0K2vebkTADu2ek3KNooU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763760580; c=relaxed/simple;
	bh=gh9b9mfI7Ux75s0Kp1lq5NuNfLjBxT0Qt/cJT/MYMS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PU5ujKSJ5N6RrEc8bhHYL6K6Qw6hx/ZpGXm5lkGjgzhwCE0sZOlOD8rJpLGzVGd6EXl/UIiJgzAoOIryfF5xdDJ1YXkABvEOAq8IhkGCXmGwniX2FY/zthn2pO3i/kU0K1xC/Pl6rE8F20Jd7RaDsh/V7j/3mKjNgdrTB7ifwIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Bonzpj9K; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-882379c0b14so18040766d6.1
        for <linux-usb@vger.kernel.org>; Fri, 21 Nov 2025 13:29:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1763760578; x=1764365378; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ObNMRgWraNV2+kVy9Ahs5486O+aHiHMvo/bApSprMSw=;
        b=Bonzpj9KasCUu6qViGw+SI9eCiNXa/En2sftrI98OyfAlhrUrAdNHs5xlCHJgbqP+1
         INr21ixbFgRBDxHkLBCBivtuFU+2cvpBFAeqe0WzLFox6rhfBs0ADMKrokbe/vHwQnrq
         yZT3fyjw3imfnB/tEJ8Rk+8klDmV627AOYnphNsiJ3FKIRgzTOp7gqDB4yXciEfamysj
         dwYh6GBcQaCIxBgL+tQw2lWhl47qHtoUkOw+2/r50xpWHnE9r4HMNhCYC7QyWBjPUx/W
         YrhR9nCmV/7z0Wpx97wzeUzavuxftG9nrjXzQIPtTdlwMiOm7xNketOl+uV7G5sG3yA9
         ko1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763760578; x=1764365378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ObNMRgWraNV2+kVy9Ahs5486O+aHiHMvo/bApSprMSw=;
        b=Z77SvWWm4r+rK+761YUMFbnxM8w51aTjKGA5B7XRrqXdrn6AB31MV1293dVjJ/NKlW
         zHDc6t7f+jFbB6zxJUikzzKmpvcIVg7omZb0WlokwnDisbJMmOp3EaJJE4o8pfs9zE16
         0qLbcwiqwiYuyfRbcnooDDm+LYhX+i5ZlAMr21BBtDfyZKTLc1kjduOB2GWvNNHus2zH
         IPJIxdCyoB65Wv0O4j4l3FHiNay1IX2xo1gA1RB1bmUHwz6vIoaha1KtzTL2OK+OE7wV
         Dsv4+qJ6dUQBjISwdmtcr4YyWnTR8pFRUxd0pIj5X6BzF1g/fiw4P9Guyd6d3dgrOBQ/
         c3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCUeh0Hglf1vhZk2ZMAKGEqM80ulVEKbW5uc0Gw9rUdThHL2ZA824wjPPaUkH8MdT+nmE7FV9QOpdfA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjyYWW2NEkMnAnDIPxWAahbD5midq+sqbeLuy+Ms8eozWrJl3R
	c80mKF18SZedkhcjNrThDOU1vwKmz5uKEdLguucWx7fErupSE/4OSkI77nkWZKPoKA==
X-Gm-Gg: ASbGnctINZtw1uWXAYnHfGPVyuzOc/xtt0clyKpDGc4m3jaZCwbQ8NIADHTrUgtPt+d
	Gy6V+fiPy5Hg7Tnj+vp3R14IaT31HzxZwSh9EudHYdEshvcnmvPqNH/oI3MwkRffCtZzBS0HPXA
	VAKRH9OgUxWI9Fs4/COj//HD4M/R08UkvbrWAMUPZmVY6QAH1es4aESIwi6IFYwn2tdRxuJ07cs
	Hcs8I3UcegY1zAlXbNzyy/BLTda3otOLsy05kcTY1DrA+zuLhhLzKGr4FHlv+b2k3LTRV4zMBdZ
	uIE751HSfjp6cauP5jWijEbr4eAi+eSeex740wDs7sGuHEFthGXjI8RdGb6364/7Xt3VRUZctXR
	32vBKZk7iFIYDrYYcCBTPAHhmRPClgBMHy1vUTMkth14Xc1Exk8ouzqq0G/0KggBUilO/o3XZNu
	+Zwe9gK2pMiFAf
X-Google-Smtp-Source: AGHT+IEK26Hkx2hOJI0om8UGqqN/oFpb5KfTvcLLbHE603yAz1bLrAR4owS1IlGR/C4OM5dR0dxGYQ==
X-Received: by 2002:a05:6214:3286:b0:87c:268d:bbda with SMTP id 6a1803df08f44-8847c57d13bmr51179466d6.60.1763760577655;
        Fri, 21 Nov 2025 13:29:37 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7632])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e446458sm45606886d6.12.2025.11.21.13.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 13:29:37 -0800 (PST)
Date: Fri, 21 Nov 2025 16:29:34 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <greg@kroah.com>, stealth <oleg.smirnov.1988@gmail.com>
Cc: Mael GUERIN <mael.guerin@murena.io>, linux-usb@vger.kernel.org,
	USB Storage list <usb-storage@lists.one-eyed-alien.net>
Subject: [PATCH] USB: storage: Remove subclass and protocol overrides from
 Novatek quirk
Message-ID: <b440f177-f0b8-4d5a-8f7b-10855d4424ee@rowland.harvard.edu>
References: <CAKxjRRxhC0s19iEWoN=pEMqXJ_z8w_moC0GCXSqSKCcOddnWjQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKxjRRxhC0s19iEWoN=pEMqXJ_z8w_moC0GCXSqSKCcOddnWjQ@mail.gmail.com>

A report from Oleg Smirnov indicates that the unusual_devs quirks
entry for the Novatek camera does not need to override the subclass
and protocol parameters:

[3266355.209532] usb 1-3: new high-speed USB device number 10 using xhci_hcd
[3266355.333031] usb 1-3: New USB device found, idVendor=0603, idProduct=8611, bcdDevice= 1.00
[3266355.333040] usb 1-3: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[3266355.333043] usb 1-3: Product: YICARCAM
[3266355.333045] usb 1-3: Manufacturer: XIAO-YI
[3266355.333047] usb 1-3: SerialNumber: 966110000000100
[3266355.338621] usb-storage 1-3:1.0: USB Mass Storage device detected
[3266355.338817] usb-storage 1-3:1.0: Quirks match for vid 0603 pid 8611: 4000
[3266355.338821] usb-storage 1-3:1.0: This device (0603,8611,0100 S 06 P 50) has unneeded SubClass and Protocol entries in unusual_devs.h (kernel 6.16.10-arch1-1)
                    Please send a copy of this message to
<linux-usb@vger.kernel.org> and <usb-storage@lists.one-eyed-alien.net>

The overrides are harmless but they do provoke the driver into logging
this annoying message.  Update the entry to remove the unneeded entries.

Reported-by: stealth <oleg.smirnov.1988@gmail.com>
Closes: https://lore.kernel.org/CAKxjRRxhC0s19iEWoN=pEMqXJ_z8w_moC0GCXSqSKCcOddnWjQ@mail.gmail.com/
Fixes: 6ca8af3c8fb5 ("USB: storage: Add unusual-devs entry for Novatek NTK96550-based camera")
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
CC: <stable@vger.kernel.org>

---

 drivers/usb/storage/unusual_devs.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: usb-devel/drivers/usb/storage/unusual_devs.h
===================================================================
--- usb-devel.orig/drivers/usb/storage/unusual_devs.h
+++ usb-devel/drivers/usb/storage/unusual_devs.h
@@ -938,7 +938,7 @@ UNUSUAL_DEV(  0x05e3, 0x0723, 0x9451, 0x
 UNUSUAL_DEV(  0x0603, 0x8611, 0x0000, 0xffff,
 		"Novatek",
 		"NTK96550-based camera",
-		USB_SC_SCSI, USB_PR_BULK, NULL,
+		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
 		US_FL_BULK_IGNORE_TAG ),
 
 /*

