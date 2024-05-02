Return-Path: <linux-usb+bounces-9971-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0165A8B9962
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 12:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8681289D59
	for <lists+linux-usb@lfdr.de>; Thu,  2 May 2024 10:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A804177F0B;
	Thu,  2 May 2024 10:45:48 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56EF5EE82
	for <linux-usb@vger.kernel.org>; Thu,  2 May 2024 10:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.2.72.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646748; cv=none; b=bTKdNjcvHYScHMtupVA4bvBnqRRuVYx6LGXeO1bg6wDYT4kWDDDl6DapuZev1w8lsDqRj7aBwArUcofq6wXah62jHESzT1D06d7RG9k2ckld7xeOqim5PBCfslt06cGe6Pm6//NoGa/2W3UODNR/OMRJilPMNDAsa2XScbQGBIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646748; c=relaxed/simple;
	bh=VotaP3j8/qB5P/PT9F+RYM3Wzi1GqYGZSQuGn0//l5c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UZ11q6LaXbobjM6Zq+f6KOlWH9OeJSQ4e0o4fVFA2kB5ccLlQhd0vAPfYm5KBZCphJ9gqnJmpIhYh1SZktWhhXxHkFOI+ErHj+iEB4ILuOcxWzbElVtTB99gvApr1tdhaHp0V9kdUrjUp23bJT3RbyUuszui571dCwAZ6Uop59k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com; spf=pass smtp.mailfrom=mansr.com; arc=none smtp.client-ip=81.2.72.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mansr.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mansr.com
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
	by unicorn.mansr.com (Postfix) with ESMTPS id 05D8915360;
	Thu,  2 May 2024 11:45:45 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
	id E36D021339E; Thu,  2 May 2024 11:45:44 +0100 (BST)
From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: use tty_port_register_device_serdev
In-Reply-To: <ZjNoWq0r7CJJptRk@hovoldconsulting.com> (Johan Hovold's message
	of "Thu, 2 May 2024 12:18:02 +0200")
References: <20240502100728.7914-1-mans@mansr.com>
	<ZjNoWq0r7CJJptRk@hovoldconsulting.com>
Date: Thu, 02 May 2024 11:45:44 +0100
Message-ID: <yw1xmsp8big7.fsf@mansr.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/29.3 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Johan Hovold <johan@kernel.org> writes:

> On Thu, May 02, 2024 at 11:07:28AM +0100, Mans Rullgard wrote:
>> Use tty_port_register_device_serdev() so that usb-serial devices
>> can be used as serdev controllers.
>
> I'm afraid it's not that easy. The reason serdev is not enabled for
> usb-serial is that there's currently no support for handling hotplug in
> serdev. The device can go away from under you at any time and then you'd
> crash the kernel.

Oh, that's unfortunate.  Regular serial ports can go away too, though,
and that seems to be handled fine.  What am I missing?

--=20
M=E5ns Rullg=E5rd

