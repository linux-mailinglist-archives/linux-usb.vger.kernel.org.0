Return-Path: <linux-usb+bounces-10138-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E449A8BFF9C
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 15:58:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21CFC1C231D2
	for <lists+linux-usb@lfdr.de>; Wed,  8 May 2024 13:58:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B89983CD4;
	Wed,  8 May 2024 13:58:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 2ECEB7EF06
	for <linux-usb@vger.kernel.org>; Wed,  8 May 2024 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715176696; cv=none; b=BvOrRE5IzQvTjxdWWE/vfUc6fZqD5rqf8Q8JIjb5SwZ9o3zALymYQY9kwKjJs26Ka9wn/Hst7QHRb+g7FQQHMgf4ydUckBjD/co7A8mqlP9Fmv331Isw5PN5WUN7VgqZjE8M1L/aNMX7laIxItnku+sHhIMYSUECQ0vSG0qc3OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715176696; c=relaxed/simple;
	bh=DoFoI2sn8p/by9cN78lyEZH7QH5qZR4GiefXMxapKl8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fCtw9YHC8hmOq5snw0KnJ00JDNg0io+HZsWEbVJdCp57qxc80X4pFJCGuaGDrB3TH+TziHAiy4jTTPnoNNn4BC0I3VpbVcy0s5jROu5ApbfAxgkmIzRK1OVvMh+MlOaoUh8DOe2tVGZgfh6OnCr55YMNrIH/MmiiTbleiU4XwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 982879 invoked by uid 1000); 8 May 2024 09:58:12 -0400
Date: Wed, 8 May 2024 09:58:12 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Muni Sekhar <munisekharrms@gmail.com>
Cc: linux-usb@vger.kernel.org, kernelnewbies <kernelnewbies@kernelnewbies.org>
Subject: Re: Seeking Assistance: Implementing USB Device Suspend/Resume in
 User Space Driver
Message-ID: <8bbace90-0978-47ad-b79b-50f95e741467@rowland.harvard.edu>
References: <CAHhAz+g=7pocghMX-Yu=jg0jxnpfwa3+ZmmdLP_pVuXmWLJ=aw@mail.gmail.com>
 <ea450e31-8f71-4726-91f6-ada79e0b3a9a@rowland.harvard.edu>
 <CAHhAz+gRvah++Hv4k5+Ec0epNbmet0=JZ6tJ3R8zjZmiKACaQA@mail.gmail.com>
 <c309b037-50db-4ca1-8f86-60131cb84564@rowland.harvard.edu>
 <CAHhAz+i9TLCb3hKpzWAL2DkH9Y25XszJO5kgbRGzsut1zCzrJw@mail.gmail.com>
 <8a8edaba-670b-47ad-a123-2077e2e0644d@rowland.harvard.edu>
 <CAHhAz+iywarnsNmt0mbuyPV+mNYQ+OwqoDMaymTGAEv6KBcLnA@mail.gmail.com>
 <9a89ba8d-c406-4ff1-98f0-080c77390efe@rowland.harvard.edu>
 <CAHhAz+hGD95zoVbEQTvCq4jquBu+x-kv3n=x5Tb4V0mtQDXv7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHhAz+hGD95zoVbEQTvCq4jquBu+x-kv3n=x5Tb4V0mtQDXv7w@mail.gmail.com>

On Wed, May 08, 2024 at 11:08:11AM +0530, Muni Sekhar wrote:
> Thank you for the clear explanation on how to identify devices
> associated with root hubs.
> Could you please provide clarity on whether the root hub devices have
> attribute files in the devices sysfs directory? Upon checking the
> sysfs directory, I couldn't find any relevant information about these
> attribute files.

Root hubs have different names in sysfs from all other USB devices.  The 
root hub on bus N is named "usbN".  For example, the root hub on bus 4 
is named "usb4".

Alan Stern

