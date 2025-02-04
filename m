Return-Path: <linux-usb+bounces-20122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66509A275E1
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 16:31:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E90C1886E73
	for <lists+linux-usb@lfdr.de>; Tue,  4 Feb 2025 15:32:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6669214236;
	Tue,  4 Feb 2025 15:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="M4G6UFHW"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C1B25A659
	for <linux-usb@vger.kernel.org>; Tue,  4 Feb 2025 15:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738683112; cv=none; b=YS81vJ4OTiE+JI+iP7tZSX64E4jBXcztuT8M/Hck8Eo9VUYe/5MNRcN3KDHyubFeuX07YW6Awj16okO+o3ZtNX93NPk3OLBeqq7WlxOjc4pBXzwmNzXnBFqzH123rFstaTU24c60DaKH0kbgPGw5SmXrOeXW7YrGFCBNCkmO7DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738683112; c=relaxed/simple;
	bh=y/HggLJSN+3EivXP89QktPNjxkoD2eOJwHrHJpo+/Rs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nrd9LjXABhmPdxa42JTu6h7GVHkI3NJF2+HCYBewen1SN+JR6TjhukdGniscLAXhjk2IHINJsBqNZAhXP2B/dy/LJ6QJ98jnaIaZXBk6jQIq8bc6+4SFN6pkFUPYwrypDJhwEOw2ehjN1DMc/bBT9netTsWdZj9ylMiXs5HwshM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=M4G6UFHW; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7b6e9db19c8so511570785a.3
        for <linux-usb@vger.kernel.org>; Tue, 04 Feb 2025 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1738683109; x=1739287909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=M4G6UFHWpy8gYFRXRRqfV1BKhkaycVWu2i+QczXlSxVjfIaexsh5y/IK9Bm7m3vz1e
         8L6EYrDNgYQd+CIJDXJbf9ahEVltQ77J7T0BKua1EImZI/eXHHnofhN1FdQ2bUuW8re6
         6tvGePcdgLcG2EM2yQ1OVNJ88Vgl4fD2pB6YYUZzexgAQwVvQMv/7/a+lqt8qEV7+glS
         sgXPaVNAUswg6kdjn5nj2LOSncFmGFa7QCAVfYyTWjKh0NkOvUDqr5Ap3kXk6QbKwW1Z
         hK1TpY4ZqaeF1R425YPx/t1+Jp0vijJtG+fTHnon9/UMttMtH+GXj+Xfbl0MxdtB9mgX
         eM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738683109; x=1739287909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6vDogQZmhVzdQ5E+BOKChoBdDnjqfZw9znSsTvbUcs=;
        b=bl5zLXgDqSWqAbwoj0e105LFk4l/TR2jkwgaIzj5TRvQnY1a8l9/JDE9SMRJKikYir
         za3GFN+Kz/EhZTd1qCsne6hye3RLRDTkpIslv7PLMlBmNpotbJTRuX+XVyB9H2CPNXgW
         asmCP30H2SIZCYBfPY8xHLTfVkcN4hb58XBtzKka70AELNWOOam2Z2bfpwQb0lhC6goX
         lMovqI/BolIgczy88JWsC96XOzXecXtN2fvEB2S8TpY6FGjZ/oPnXDmDxjT6lvCWRhWE
         64QUxZp6v9zkv/w0G0Jciyth4nRv/eYiiX+tTb6ay4CpINhPifD990Eak+y627WxtNWj
         3FDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLLOnftPht96GijTKD963gACL+GK0+eDdIHVRK7C2jIN67QfCnU1fGKNStBEbRS6BOebIBFKitRj4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnqZ6FO1/Q+IZ390lKiDNCop6F+GDZHW8KqbM0+vBEUrgqGkoh
	k7HOxh0j5XuKTckn5W++li4/4bblY3cZSWOQmifmC3F3nJhOj9OIOs+V/PsUjg==
X-Gm-Gg: ASbGnctWTITH4Afteda0t7qR1DzuiG/UCx/q24sgxo7lU7N9XrDjI6nqlKZ2aIwP0b/
	jQhAVu/+sVDwfPVRwQwAaIpLZ8/2o/UeU8L6KUQMTPSz0C2rF6AiS6It0Qvswlth3Dy+8mzgJGP
	qpPgrLchwL8Rbo/a43Q2GzSZ45W2PfRgbIOZI46lpjFjc2Kbw3WSN6eO+x8MP7gqQEKAU2qheEe
	ukfnpbv7U8Q98mZSpXllk5aIigaGNlF5TdSa/qJhqIu78uImdxu/r6xvRyw/KQL+f0bdNSDQ/BQ
	8thg9ka47ZM73zOe903L82q58HGr7QXCvw==
X-Google-Smtp-Source: AGHT+IGr16xztzaU5RVdUQ4EEpqABDmb/hiK2v/XZRwrNmn6sD1FtahgAqVWBvE/dHbzuTOuI+PQKA==
X-Received: by 2002:a05:6214:19e7:b0:6d8:a610:21cc with SMTP id 6a1803df08f44-6e243b8f713mr344012086d6.1.1738683109138;
        Tue, 04 Feb 2025 07:31:49 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e4168d91f4sm30300316d6.58.2025.02.04.07.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 07:31:48 -0800 (PST)
Date: Tue, 4 Feb 2025 10:31:46 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/5] driver core: add a faux bus for use when a simple
 device/bus is needed
Message-ID: <28e9ed5a-9437-4a53-a099-a8df27ca8a91@rowland.harvard.edu>
References: <2025020421-poster-moisture-534b@gregkh>
 <2025020424-retrain-recharger-407c@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025020424-retrain-recharger-407c@gregkh>

On Tue, Feb 04, 2025 at 12:09:13PM +0100, Greg Kroah-Hartman wrote:
> Many drivers abuse the platform driver/bus system as it provides a
> simple way to create and bind a device to a driver-specific set of
> probe/release functions.  Instead of doing that, and wasting all of the
> memory associated with a platform device, here is a "faux" bus that
> can be used instead.
> 
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---


> +/**
> + * faux_device_create - create and register a faux device and driver
> + * @name: name of the device and driver we are adding
> + * @faux_ops: struct faux_driver_ops that the new device will call back into, can be NULL
> + *
> + * Create a new faux device and driver, both with the same name, and
> + * register them in the driver core properly.

Along the same lines as Danilo's comment, this routine does not create a 
new driver any more.

Alan Stern

