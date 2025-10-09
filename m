Return-Path: <linux-usb+bounces-29095-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B562EBC991D
	for <lists+linux-usb@lfdr.de>; Thu, 09 Oct 2025 16:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0607C3A83F2
	for <lists+linux-usb@lfdr.de>; Thu,  9 Oct 2025 14:40:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49F6F2EACF1;
	Thu,  9 Oct 2025 14:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b="TGX9J3+3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-190c.mail.infomaniak.ch (smtp-190c.mail.infomaniak.ch [185.125.25.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA082ECEA9
	for <linux-usb@vger.kernel.org>; Thu,  9 Oct 2025 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.25.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760020786; cv=none; b=Ups8/lt1v0INsdthwecQaFYdmaQrguK0NUmO5KZLZ3wJYIAAUWeapt1XPl/vyE37g9qjUBSJo7eRSEIQeR1W0NeF310KnGBsKf7UFMwLINq6v+n5CfcKwC7oi1TSv7c+TaWZXQXrLxdusJ+dQt2pXhjasJdwSefFywdqCaH8XsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760020786; c=relaxed/simple;
	bh=62GmSLRRFn7eaUoP+fyUGE2sSHpiZ/O3B81wH7LkMHg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Message-Id; b=MZUj+14583WSsHMN/IduL+RFr1Qgk+IAKrpl7SHA5bGZuSpLv+LmC9YwplyFtPt7RqqWcn9NetYqNKDO0jSc1gciIikhvdiz2IMYoID4gCWdU84WuzUANUyUbgXkWeW0j3eOCn60debow/5Ihuppf62lBULscc3G2tkXzWuKJ2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me; spf=pass smtp.mailfrom=ik.me; dkim=pass (1024-bit key) header.d=ik.me header.i=@ik.me header.b=TGX9J3+3; arc=none smtp.client-ip=185.125.25.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ik.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ik.me
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cjC4c702QzLcf;
	Thu,  9 Oct 2025 16:32:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1760020320; bh=5XihrUhHfryx3yfBEzw0WQVx0YJHhW0zlpoYISIn4Gc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TGX9J3+3434Aj4NGiXGq9uzS54FaDoncMTyJ1bosPAbunAdj9RiZiL/jXtvSHfgok
	 7ZV/ydp6KAw+CJ7Xf+Q3t15WJ1okzaDFph2qoDf9HWubMsZhavE5IbQULcGDiRx/o5
	 xumURv9MTtfm8FRFC+FSlW3L7Yo+WpHBGRya/jho=
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cjC4c3F8BzrTr;
	Thu,  9 Oct 2025 16:32:00 +0200 (CEST)
Date: Thu, 9 Oct 2025 14:31:59 -0000
From: Pierre Tomon <pierretom+12@ik.me>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: USB disconnection after mounting file system
In-Reply-To: <20251009160731.58dd47bb.michal.pecio@gmail.com>
References: <4chgTL1WjjzCqn@smtp-3-0000.mail.infomaniak.ch>
	<2025100905-gestation-founder-3e70@gregkh>
	<20251009160731.58dd47bb.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-Id: <4cjC4c3F8BzrTr@smtp-3-0000.mail.infomaniak.ch>
Feedback-ID: :d3dee46c33acd70:ham:d4c4a9452bf4d5d
X-Infomaniak-Routing: alpha


Le Thu, 9 Oct 2025 16:07:31 +0200,
Michal Pecio <michal.pecio@gmail.com> a écrit :


> Potential hypotheses:
> 1. It is actually *lack* of activity which triggers it.

As soon as I mount ext4, the activity LED flashes continuously on the
dock. This does not happen with NTFS.

> 2. You need to wait a little longer until you see it happen on NTFS,
>    then stop worrying about filesystems and software ;)

I tested it for about 10 hours with NTFS, even when the drive was
asleep, no disconnection.

> I too would suggest trying other cables or USB ports (SuperSpeed link
> quality sometimes varies from port to port). Or xHCI controllers - I
> don't know which one you have, but those with "broken streams" quirk
> coincidentally (or not) also tend not to be most reliable, IME.

I'll try that, but I don't think that's where the problem lies.


Pierre T.

