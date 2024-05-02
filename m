Return-Path: <linux-usb+bounces-9976-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4A8B9B93
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 15:24:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C69B128262E
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 13:24:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C9C84A4F;
	Thu,  2 May 2024 13:24:46 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7A483CC5
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714656286; cv=none; b=uG08MKXWRW2W43k712ik9oo+aYPmvzuUOYqzhfDWiYlbGugwkDLg+oapRElBwK4B3F67LNJXPAcbM3Yb0/sEpjQHFlEIDi3+ova6o+XT8++ozVJiDAtR96rjw22gAkixUKGdvSxEos7lFTCtWCW83TtBIgCtjPrbO5Tav336RrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714656286; c=relaxed/simple;
	bh=QFpPm1xxZYXIYeyWy4gG8QrKCYb8LfQ27/bXtH0Nhgk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=LGZQvJa1q2l0/NRWCnJmlYsMMD297RGtYP6O4tzRWOd/HQtx4DGRA4/8oHCmebE70zoHnwJbiGHgl095JNX1DSyFggCzDWLmT+aAL5JKH3y/MHhAv5WEWYFm6uhqL54QScrJGSHKQoiWqyGZXHNDjCFCc6YMq9ZjR21g6aYhgC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 8186F15360;
	Thu,  2 May 2024 14:24:41 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id 708E321339E; Thu,  2 May 2024 14:24:41 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
In-Reply-To: <2024050204-recreate-exerciser-bd62@gregkh> (Greg Kroah-Hartman's
	message of "Thu, 2 May 2024 12:54:39 +0200")
References: <20240502100728.7914-1-mans@mansr.com>
	<ZjNoWq0r7CJJptRk@hovoldconsulting.com> <yw1xmsp8big7.fsf@mansr.com>
	<2024050204-recreate-exerciser-bd62@gregkh>
Date: Thu, 02 May 2024 14:24:41 +0100
Message-ID: <yw1xikzwbb3a.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

> On Thu, May 02, 2024 at 11:45:44AM +0100, M=E5ns Rullg=E5rd wrote:
>> Johan Hovold <johan@kernel.org> writes:
>>=20
>> > On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
>> >> Use tty_port_register_device_serdev() so that usb-serial devices
>> >> can be used as serdev controllers.
>> >
>> > I'm afraid it's not that easy. The reason serdev is not enabled for
>> > usb-serial is that there's currently no support for handling hotplug in
>> > serdev. The device can go away from under you at any time and then you=
'd
>> > crash the kernel.
>>=20
>> Oh, that's unfortunate.  Regular serial ports can go away too, though,
>> and that seems to be handled fine.  What am I missing?
>
> How is it handled?  Normal serial ports can go away but in practice,
> it's a rare occurance, and usually people use serdev for devices where
> the ports can not be removed (i.e. internal connections).

If I unbind a regular serial port from its driver using sysfs, a serdev
device defined in a device tree gets removed as expected.  Binding the
serial port makes everything come back again.  I fail to see any problem
here.  If there is one, you'll have to be less evasive in explaining
what it is.

--=20
M=E5ns Rullg=E5rd

