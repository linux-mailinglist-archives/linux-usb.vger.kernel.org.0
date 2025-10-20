Return-Path: <linux-usb+bounces-29465-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BC23EBF23DB
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 17:57:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BBE2B4F7541
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 15:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C913227AC31;
	Mon, 20 Oct 2025 15:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="rQtFbdWV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9C279346
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 15:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760975816; cv=none; b=ajMVLUPpcF5RfV74WPBlisTQ390Aki0biKgy4FfxRL0dRYo/jzTUKHNarDiPs7Chtx8ChxyOi2Fh2+ygygk+tOJeItqsmsefdv436OOzj6PBr6HEuA3kKHQvkHC6hg3O1u0fJXIkn7twR8NF8+e4zN/v59tCbGeAT4pKvmHM/CQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760975816; c=relaxed/simple;
	bh=e2llRSe6rBf6kfwlDIh7FJxE1bNsKiQgJihK7id5+48=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNzO2x4RRdZ8+nTJ61Lqg6pTI751dQHR2CbMXlA3HtLcKo8zJurC20yddiMFhG29iqH8jIux9sMEuGU1B7bfQelZnLT/1MtTg0GXaGV4BQJgzwFInEnk5OiQFl0MhxntYgrbfZqPLtjZjXKBu3CJAZCaUl/8He9emsRR8kyYZ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=rQtFbdWV; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-892d1443e48so436095285a.0
        for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 08:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1760975813; x=1761580613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PS9ppW8BlUDf/OZHMCLmT1BgS/dX4mu/cLIa/oy85v4=;
        b=rQtFbdWVW3jZzkJfTStLkIBqfgWjsVb6rf+BbOR0dp1AMaKxFdfPEAUdIfUW76WXjP
         9CmcdhlW7cV2HPtp9EM8tf2QVdiHA2bMjZYo3mqIo4w4MdYpMt4XmSKqh/gYrZyjLxrR
         WhzshebzMtuFv8tO+N5gMBzRENWX5WL3spubzwAfLrmHFLDVBY7hK4Lw/VmP94UfZeDa
         OexzH2c2vZW/gBasE3Sr1yHoW9eD7Cg56WVHLl/jOKmbPeUrAqxhDqhttlXdIXv/l7ZG
         P9Xh4Cn22irVX5pxe1o9ID8bNyGLghfJ9wh0eHTZZWiFUWLeAxx5Zg/BgHLWgiQO56b8
         K8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760975813; x=1761580613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PS9ppW8BlUDf/OZHMCLmT1BgS/dX4mu/cLIa/oy85v4=;
        b=PV2Zjb3YSgeeMebq9brtGlYDinXeGRagwzVAmvKhWxM43grRdZP34rxkl9sBrZSpQ8
         5y9pYZBVQ4iekN6PSsXCBtx5UlPeT1yVZC/s/Km0eSc276LA7m1hSCS7KHPTscdjLpS5
         IQQObZ4o4FOv7bDDqzoYtOktmYvxjtjLCAGMk5gu78jYiBjOPSUYz8hvvF0Odj1YEKLL
         7FKNNSEYPhKS+zZz0wjKzwJ504oXyBMwv931uUDeyI3Q5mUSMD+lkCBJaMN5PZn9x4IR
         2YgKp25t1Im4O3SygYDuNmkQmNEHZq9e/0ODW+eYZlTyG+DoHYw0SuD3CH36x/oDz6Jp
         4z0w==
X-Forwarded-Encrypted: i=1; AJvYcCVX/LL2mKP8bNWm5YhPuUIBb4U7MZ2B7kDd7mXufkwNmb6MAuSN24CN+m4dA1mlP5sib/+aGFp7GhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPrqzIdTE4WrtpLi9sWh8/KK/o/Zmewvx4AdJzzdtWN9ekmBoo
	KeDeZzLmOGuyXhrCjCXS7LZOCBiZRMxsO6nAJQNMcvZO6DkzuhHc+rwKcTUhHTCtRw==
X-Gm-Gg: ASbGncsImw5TW6GzlLBJjbb0DeYa5yfM9DS/yfeILj6NXKVGgV2ZADPsD7ePQ8YDY9u
	ymRH8Q+BZfSOIcuGJOfDAwlk+PrThaBM4gFWMm9yR/K4az1pZoCtPVlpukwHQwUp6iZ2FaDSl0t
	1ij26ErHfp+KMY8TdonfEGRYPKz+mvO19Qi3bhSg3A8ysJnNSiMZeMQPoxApDzORVLQ2Ahym7Tm
	bj3NnAttXkjILmtJ2rXhkJi6utqP1U8vFql1O5aPA6yoZu0fv+iH35ccjpOL7pbuT8k/mOkyfa1
	NyHWOtbGWYmTkQqKe57MQnTpQpjqsgr7mfrH00Em7h+So2KAPvx2ps8Y8uEKPU0xxOHwPScLdKQ
	n+WsvdEFKQw01YiZlRnTUtovh2Lsj9tPyog22tS46x1sWelgdFNQoXZa8DEvhMf0r1XT1fiH9Ug
	bv+J4b73Dd2FllZ2m3razsz7jtjgKXUptgwvfm75RJVb4O6TN9T1T/Zz4a/5RAaPavOSjapMNrC
	hJgkebW
X-Google-Smtp-Source: AGHT+IG/rDU0EjLahTNi6VfthpLTzDexKTzbLVBecb90B5+2WmicLIOJUth/CtS2njAiwWv1qFzLwQ==
X-Received: by 2002:a05:622a:d1b:b0:4e8:a514:2341 with SMTP id d75a77b69052e-4e8a5143538mr121816691cf.61.1760975813506;
        Mon, 20 Oct 2025 08:56:53 -0700 (PDT)
Received: from rowland.harvard.edu (nat-65-112-8-19.harvard-secure.wrls.harvard.edu. [65.112.8.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87d028966fasm53806466d6.33.2025.10.20.08.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 08:56:53 -0700 (PDT)
Date: Mon, 20 Oct 2025 11:56:50 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, oliver@neukum.org, pabeni@redhat.com
Subject: Re: [PATCH net v5 2/3] net: usb: ax88179_178a: add USB device driver
 for config selection
Message-ID: <e4ce396c-0047-4bd1-a5d2-aee3b86315b1@rowland.harvard.edu>
References: <20251013110753.0f640774.michal.pecio@gmail.com>
 <20251017024229.1959295-1-yicongsrfy@163.com>
 <db3db4c6-d019-49d0-92ad-96427341589c@rowland.harvard.edu>
 <20251017191511.6dd841e9.michal.pecio@gmail.com>
 <bda50568-a05d-4241-adbe-18efb2251d6e@rowland.harvard.edu>
 <20251018172156.69e93897.michal.pecio@gmail.com>
 <6640b191-d25b-4c4e-ac67-144357eb5cc3@rowland.harvard.edu>
 <20251018175618.148d4e59.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018175618.148d4e59.michal.pecio@gmail.com>

On Sat, Oct 18, 2025 at 05:56:18PM +0200, Michal Pecio wrote:
> On Sat, 18 Oct 2025 11:36:11 -0400, Alan Stern wrote:
> > > @@ -169,6 +175,12 @@ int usb_choose_configuration(struct usb_device *udev)
> > >  #endif
> > >  		}
> > >  
> > > +		/* Check if we have a preferred vendor driver for this config */
> > > +		else if (bus_for_each_drv(&usb_bus_type, NULL, (void *) udev, prefer_vendor)) {
> > > +			best = c;
> > > +			break;
> > > +		}  
> > 
> > How are prefer_vendor() and usb_driver_preferred() supposed to know 
> > which configuration is being considered?
> 
> Currently they don't need to know, but this could be added by passing
> a temporary struct with more stuff in place of udev.
> 
> Really, this whole usb_drv->preferred business could be a simple
> boolean flag, if not for r8152 needing to issue control transfers to
> the chip to find whether it supports at all.
> 
> It seems that ax88179_preferred() could simply always return true.

Instead of all this preferred() stuff, why not have the ax88179 driver's 
probe routine check for a different configuration with a vendor-specific 
interface?  If that other config is present and the chip is the right 
type then you can call usb_driver_set_configuration() -- this is exactly 
what it's meant for.

Especially with that extra requirement for the chip being the right 
kind, this doesn't seem like something the USB core should have to 
handle.  If other USB networking drivers need to do similar things, 
maybe the common part could be put in a library in the usbnet core.

Alan Stern

