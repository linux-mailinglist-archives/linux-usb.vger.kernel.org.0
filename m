Return-Path: <linux-usb+bounces-6410-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F576854C92
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 16:22:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 828FE1C2242B
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 15:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80AC5C605;
	Wed, 14 Feb 2024 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eftgxWuF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6835380F
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 15:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707924169; cv=none; b=swRXWBJobqPoQTzM00GyxehZ2/F5T2IPgB/9I8q31rSbg6hp0rKr34FjNfaIcminVU+d2lQbqEjjmb5+XxfSIHPmrmTzbjQx57HHgpVrEQOecDtq6hlSXUiS1ZTcTe5ZbF+ANo4XS5qiib08KlHNRdzwq9zpAGjmLCf8rkNp1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707924169; c=relaxed/simple;
	bh=WKdn3mvzn86QyQZuvEccxV5vq2MCcCY41ElDhgEjsVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WewknHhzFsGjlXcemmpYJgl6dEkjEIb27b/i97p7iQgXcPzwx1WMdj9AtS18D05ICibq7qodERU/2C43HMN/ddG5hS1OJoFtjnK1s/kkYPcyK78rvS1yCs+wAM0+TkwXHnRoQOBjXcWp2wtJ7DnHOteQ5qaYuRO21rdKGyZKHHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eftgxWuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D556C433C7;
	Wed, 14 Feb 2024 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1707924168;
	bh=WKdn3mvzn86QyQZuvEccxV5vq2MCcCY41ElDhgEjsVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eftgxWuFpNaw2IWdxOajUaxcVHpr7KpLNirjp8EImh7vieo4PnUnlmiVTQVL55uDj
	 JGZyzE2p1ZH7g3NeeLE2ojHUqc6YyJi0KLVlpvVv/jkTdyfHMoH9sTLqalDjFbyadm
	 aWXhSGpGbF6AxphsZXq8S6CLVqkTEyIVxmqzGTlQ=
Date: Wed, 14 Feb 2024 16:22:45 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: usb: read interface string descriptor(iInterface) from linux
 service
Message-ID: <2024021432-woven-affix-1b4e@gregkh>
References: <CAHhAz+isQ5gUDBAPv3WkK6QQL6d4d0Zk4U9VCrKwKaS1RrQX+g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+isQ5gUDBAPv3WkK6QQL6d4d0Zk4U9VCrKwKaS1RrQX+g@mail.gmail.com>

On Wed, Feb 14, 2024 at 08:04:46PM +0530, Muni Sekhar wrote:
> HI all,
> 
> USB devices can have multiple interfaces (functional units) that serve
> different purposes (e.g., data transfer, control, audio, etc.).
> 
> Each interface can have an associated string descriptor (referred to
> as iInterface). The string descriptor provides a human-readable name
> or description for the interface.
> 
> >From user space service utility, How to scan all the USB devices
> connected to the system and read each interface string
> descriptor(iInterface)  and check whether it matches "Particular
> String" or not.
> 
> The service program should trigger scanning all the USB devices on any
> USB device detection or removal. Can libusb be used for it?
> 
> Any input would be appreciated.

You asked this already on the systemd mailing list, why the duplicate
here?

