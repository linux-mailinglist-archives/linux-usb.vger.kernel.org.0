Return-Path: <linux-usb+bounces-19623-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D96EA19144
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 13:24:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 014283A7DC2
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 12:23:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BB3212D75;
	Wed, 22 Jan 2025 12:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2lUzcPN"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EFF21171D;
	Wed, 22 Jan 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737548633; cv=none; b=UbMeUTN8DlbE3i4P3uPxMJPh9KhIsVqFJJI28Z09Jja6998GwpZ/hc5gHE8whZ5V0PTlpPs1gs5I5rALCkNuZ50aWEfqaPKoHzRbD5CzxdHS0kpGy7ZPp8s6znRZOiz8qq7DY2h8IDceAbq8bqohHdM7V6iD3xcdJ0pVo/kj8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737548633; c=relaxed/simple;
	bh=dTGyUEi/lyqxfOwcr7hSB30zjbeRXMw5OslBFxN0ouE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mJ5a0Odp2fta6mCeJGihIOtkes5GjGlvAMLNWQ14PAJmhE5GeZRotx4RSVhZXNu7ltqper9e1vUCPnwBYeDjqrNMpZu1TfFFgufWQiGuGddBN0uAuHJ+UN+mpoBK8T9qsDPuPakZ6NP4iqaK3kstIbC2rAjPHhGI6a9DrroZobA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2lUzcPN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-436a03197b2so47573685e9.2;
        Wed, 22 Jan 2025 04:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737548630; x=1738153430; darn=vger.kernel.org;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=760Wn7zTTbD8yTsRqOvWWO2yZjHpBhgEkrkrnoW49To=;
        b=F2lUzcPNe4Qj8y58/jLfSh1PWM5QPPtznFimOvDvcdzeeC63GcswJyHpUp0yiUOUqe
         k+X4bLw+T+thv9zA0gFji99+qrixqnLhlkIPLVVamng14a9T83F7AYg6hngixhInoXHo
         qW0jd3pPpYkcKDYPafyToVkFeWfvPGOZ0PMDNg7mKTFAa/UkQMBP90rKQxelvUtpbr3W
         TlhTAWlg/JqrDyyCTX2n4tze8klIi5GK9ul8vLe/90J6C4GJkI/Xkyrcb+TscJRXm9Gw
         SlG61otETuOQGeabGOlCLlq11L4dKfGcVTsMllRRBO80vYrNCrLfYTSaL4IdYUNJkQnN
         jjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737548630; x=1738153430;
        h=content-disposition:mime-version:reply-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=760Wn7zTTbD8yTsRqOvWWO2yZjHpBhgEkrkrnoW49To=;
        b=R84xt563JRDB7mcL8qMutldA+e8N/iOIz4y2CiFWSRh4GgFKt6q466rxG4GUgW7b0s
         yiaPpkjXoaobqwTwD/qrdjrIpHSGGe5DhmWIyAC4e+XHlQodDZ2dCmFoTospXYGGhd21
         M9yL2DzfvbPpacOG6Tvovg86uM5E48Q0b9vLc56lOzjCyB3obd30peOuF3BwN48a6UoR
         Ssmf9Ic/W+fojF+LvfczRwOJT89alwU2osuDlWP+VxEvI2Fhj/0sB78ye4+ol5maVtgd
         qcp3hva1ty5a004mSoM4ZebQGrYdXrmGksJvqyTQ2MnzzBXIFNXfcDmU6sge2pLmIT6H
         EMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVICCf8RefD8PU6oXif4eJOERruuJuaxIYYcEHa+R1wqI4fZsp2CsbitB5NUb/70roicFc4XbAtFVdD@vger.kernel.org, AJvYcCVVbSpu1cd7Kgf6vqZSt5solMA9jS2DI0weeXMN+hZjuOuYgx/aJXx/VfXTwBOzefHKJMqjtWc86f1zrs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn3YWrmBsDCNZTZrnQ+yZUW6BHhGiJushApsLjWJqvBKaC3UN4
	ux37qw8Itl9xl76OCYRyuyKEtEh1Zx7StFeR3tXjRoft8jKY8cGN
X-Gm-Gg: ASbGncuiOy5ecW3ANTNaEWVjHlLg80p2aO2Ug2qxKuiOPfhebj+EhAMHZXyswy+6Hjj
	ajyFWB1O7/3JKv5/FR7l3rAupGccFVeNLao4zyZ3yaxjbQpVh/24tebK/u1HyRCxKeR49U9xgY4
	/45FwSttohrqYiLIK1HP3NNIoAJ+R6jsrK9xK1p61ICoEh2LKYVgDFE0uZY8RE8wnw/mvz/MIiY
	FNDpqyyptvZ4VT5bwPezuvBzVLt36Eqn7s3CoHhjPremcGFqlz8hbSmGULASm2D/y4ouygQ
X-Google-Smtp-Source: AGHT+IHbfbCvJH7jPo6iObTUfCf74oGW/9NlqcCDsWh4Z88MQCqdirhUQ+3kUdePL++WFVybnvwm0w==
X-Received: by 2002:a05:600c:5126:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-438913bdcbcmr162128235e9.1.1737548629704;
        Wed, 22 Jan 2025 04:23:49 -0800 (PST)
Received: from qasdev.system ([2a02:c7c:6696:8300:60ee:6158:3505:672])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b319fac7sm22250825e9.13.2025.01.22.04.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 04:23:49 -0800 (PST)
Date: Wed, 22 Jan 2025 12:23:39 +0000
From: Qasim Ijaz <qasdev00@gmail.com>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: usbip: fix null-ptr-deref in status_show_vhci()
Message-ID: <Z5DjS7M6YQ7q-rBO@qasdev.system>
Reply-To: 352b31e8-f8ef-4207-81a7-0aa22c984aeb@gmail.com
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 22, 2025 at 11:56:34AM +0300, Sergey Shtylyov wrote:
> On 1/21/25 11:36 PM, Qasim Ijaz wrote:
> 
> > If usb_add_hcd() fails in vhci_hcd_probe() (i.e., a probe failure),
> > the error path calls usb_remove_hcd() and also sets 
> > pdev->dev.driver_data to NULL.
> > 
> > Consequently, any subsequent call to platform_get_drvdata(pdev) 
> > (which returns pdev->dev.driver_data) may yield NULL, causing a 
> > crash if that pointer is dereferenced.
> > 
> > Fix this by adding a sanity check to ensure "hcd" is non-NULL
> > before proceeding with further operations.
> > 
> > Reported-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> > Closes: https://syzkaller.appspot.com/bug?extid=83976e47ec1ef91e66f1
> > Tested-by: syzbot <syzbot+83976e47ec1ef91e66f1@syzkaller.appspotmail.com>
> > Fixes: 03cd00d538a6 ("usbip: vhci-hcd: Set the vhci structure up to work")
> > Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> > ---
> >  drivers/usb/usbip/vhci_sysfs.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/usb/usbip/vhci_sysfs.c b/drivers/usb/usbip/vhci_sysfs.c
> > index d5865460e82d..a5e6c3c4af06 100644
> > --- a/drivers/usb/usbip/vhci_sysfs.c
> > +++ b/drivers/usb/usbip/vhci_sysfs.c
> > @@ -76,6 +76,10 @@ static ssize_t status_show_vhci(int pdev_nr, char *out)
> >  	}
> >  
> >  	hcd = platform_get_drvdata(pdev);
> > +
> 
>    Empty line net really needed here...

Thanks for spotting this Sergey. Just send out patch v2 which fixes
this.

> 
> > +	if (!hcd)
> > +		return 0;
> > +
> >  	vhci_hcd = hcd_to_vhci_hcd(hcd);
> >  	vhci = vhci_hcd->vhci;
> >  
> 
> MBR, Sergey
> 

