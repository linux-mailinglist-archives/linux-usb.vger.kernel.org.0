Return-Path: <linux-usb+bounces-29432-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C065BED331
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 17:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 97DFA4E84C5
	for <lists+linux-usb@lfdr.de>; Sat, 18 Oct 2025 15:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B619F242D89;
	Sat, 18 Oct 2025 15:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dc7a1vgB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A35D22B8B0
	for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 15:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760802988; cv=none; b=rGVsLpQksLM4xGOcecsZ0EcIDCMO8EzIVkhkbwbQ6kof+4MaRJUbtHz1Jjx2BNJXpA1LeubTdEWqnaH69JRzKw/JzGQzppW3wTDlLlUZUVBDqNS8gWSlnT5PaNlCRgLX7SqgF5R5guWDpxTJI66PQm+F/u64HUGijtnNv+iGjWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760802988; c=relaxed/simple;
	bh=6NZtHDOkyPD8La711ixX/Q1NJ3fdPU0B/Tyw064qtt0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ktFU35z9Vstfm4DjVk4RUUuMnudSu2ze0Tl+LTLzGAkwKm5JOkEFnksZ3sFrb9ExXXAKeOlyiZZgfu/FZANQdygWiMNR6Ro9SZB8E4GXq3O0SdW4rxr+LHtzV5GsH9a19IS4FRm9xrKA6d6VwjiopGLZhzunX9NDVOVIT6oyPBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dc7a1vgB; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b07d4d24d09so492321466b.2
        for <linux-usb@vger.kernel.org>; Sat, 18 Oct 2025 08:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760802985; x=1761407785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8fhnjMWOirSY3eN7EySi4aJdvuTGkxEFf7pPwEILWc=;
        b=dc7a1vgBTf6C7aZKTmjb9ZaLnYLwn/8nCBDPhMn1y7STfJDEAT2IMtvUq0WArW8TiP
         3Zzz/HD0geLHdpSjfYek9LrQHSOQDaa+O0WBsvzpqSPLCr6zC1RI7cp4h+Cg9bSn4iRL
         mHDg5qkTtdZx+WkoyN4MkYBPcDPG2aimU9IqPZooT4LXYZiUdgD2sv5eI2yO+b1aB4kr
         wSCO3xrxMh3czm196+4oxqQJyG63sI6hzpEldVWbIWjPCAC1ypsoKoi9wdQWmsACdfgZ
         mh/ySPm4oNGJdyy1mJVfh+zqcx8kxzWsRzKN1RirrHTKTgqiU2bxAn0r1CIMpuYvlwaN
         /xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760802985; x=1761407785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8fhnjMWOirSY3eN7EySi4aJdvuTGkxEFf7pPwEILWc=;
        b=OY/5obpkkcrC8EstSA1nOABCLmWMjIUgeBLu0IqfbMU6hfGpQRKwD+urJ+3Xkao/NE
         Rh7eM1F32kdVn01VTQI8pRaZqTcXdVu0vBCSqGOSsEAeD3htBMegx0u8zcqr9kCRPoJ6
         z3R4YG0/aVqbPcPmZq1POVSDYbOZ98k4M/igoEUsQrVFDCq+xqosIuiKL+Sxo2m4nlrO
         wcFyPry9GrvsFwpFQ5nNbyVDTzVG3Utr0pfVTbJjz5ukLauizZ+Nju6q6c0RivfzcKAm
         FGgWeEsNuAnbDHN0YfdHqIeKqo5xykZKOIabQLBx2m3OJQ1DdD2BChD6mhVG4BpbEywG
         TfQQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2VY1DH71wRBZ7ItcX7rtzOt53hHVM77z9w+X+MwEKUiarsgtJaov9Lk1L7ptcDHuU/bp9UKOV3+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpNX/29brSuFVenEsoKLhxqCWU/qDfCiLzaaRF9azV/uSJLQgd
	COrvI5lHPB9wZ4j4BdusLp64my7fCD2LPBJkPqgcY2fJtS0MSg6XWjWR
X-Gm-Gg: ASbGncu/Vt/E/Puv6JRVD97bW3UzACAWOOQ8R5hM03v9Q7jpywhennLr+uPA0kw7A5t
	SNLU4tHMl9ZqztTGyVG0HSMT8SKnLoDlnnT634aIft8VRczYA9tLZxKEVZiC1NJAgFJa3xje8Ub
	GvsvV1Dn8QWw7nVqN32ewGWbCXhffahFR+odhPA2p8kQ9PGwmIHTls2SOc/k6LJH6iODqN1m39G
	eCbc+cR2V0vxdbdKbsvY3n9nSKnT2/GEQG9TGQb5ONWXdckmakYjA0Prpp6RofqvljX+j61UYH9
	Z/AuO47JdhPpu30hWqZUejeXkBH0AZqYdgfP3xNsWejtyVIRj8uwIt45T+W64OPzIoupEl+9sw7
	PpNvtJA3AbJLvv+K+JrvqqAqt6gcsTWq4+pZMrHctzNcdi+PTmd4BaNiBlo+/9NhQIMeSeus+tq
	+jLccUSqiJEd5IgqME
X-Google-Smtp-Source: AGHT+IEx7Bi+dMj5WqrNBJzlNBvoVq7NA0rAfraicQZq1aUE1kcHI0Q9f8r5Fz7esTewE7Ch33913Q==
X-Received: by 2002:a17:907:d08:b0:b60:18d5:429a with SMTP id a640c23a62f3a-b647323fac1mr797118766b.22.1760802984702;
        Sat, 18 Oct 2025 08:56:24 -0700 (PDT)
Received: from foxbook (bey128.neoplus.adsl.tpnet.pl. [83.28.36.128])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65ebe4a5ecsm263401666b.81.2025.10.18.08.56.21
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Sat, 18 Oct 2025 08:56:24 -0700 (PDT)
Date: Sat, 18 Oct 2025 17:56:18 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device
 driver for config selection
Message-ID: <20251018175618.148d4e59.michal.pecio@gmail.com>
In-Reply-To: <6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
	<20251017024229.1959295-1-yicongsrfy@163.com>
	<db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
	<20251017191511.6dd841e9.michal.pecio@gmail.com>
	<bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
	<20251018172156.69e93897.michal.pecio@gmail.com>
	<6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Oct 2025 11:36:11 -0400, Alan Stern wrote:
> > @@ -169,6 +175,12 @@ int usb_choose_configuration(struct usb_device *udev)
> >  #endif
> >  		}
> >  
> > +		/* Check if we have a preferred vendor driver for this config */
> > +		else if (bus_for_each_drv(&usb_bus_type, NULL, (void *) udev, prefer_vendor)) {
> > +			best = c;
> > +			break;
> > +		}  
> 
> How are prefer_vendor() and usb_driver_preferred() supposed to know 
> which configuration is being considered?

Currently they don't need to know, but this could be added by passing
a temporary struct with more stuff in place of udev.

Really, this whole usb_drv->preferred business could be a simple
boolean flag, if not for r8152 needing to issue control transfers to
the chip to find whether it supports at all.

It seems that ax88179_preferred() could simply always return true.

> (Also, is prefer_vendor() really needed?  Can't you just pass 
> usb_driver_preferred as the argument to bus_for_each_drv()?  Maybe after 
> changing the type of its second argument to void * instead of struct 
> usb_device *?)

I didn't like the idea of usb_driver_preferred() taking void *.
However, I could cast it to a function taking void * here in generic.c.

The wrapper would become truly necessary if we wanted to pass
config / intf / other stuff to usb_driver_preferred().

Regards,
Michal

