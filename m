Return-Path: <linux-usb+bounces-14567-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7D3969F65
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 15:50:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4D3E285035
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9C6D1CA699;
	Tue,  3 Sep 2024 13:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b="F3JvMkjT"
X-Original-To: linux-usb@vger.kernel.org
Received: from shakotay.alphanet.ch (shakotay.alphanet.ch [46.140.72.222])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1841CA682
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 13:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.140.72.222
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725371437; cv=none; b=JTmHb+e6mQuQHRKCaMopOd1HmnxF0RupAUJBTniG9I89WRC9bW0IIdspmtaM9PEu6X9iBKiPHBT52sOlpfFDYc0nDqJGFMUtUnFhoi+yq+HQvtFluQr2AdDWAQPJvNPNKwXDnnXMTuIB4RzeD7UwB5dXEkYN/284HOzI8Wi0Qco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725371437; c=relaxed/simple;
	bh=94k0MamP4n3h+f+GTs3Z5jdLiy75YA2JWP+Fe9pQNGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CFT3zqRn0UvhmU6j6/7vEf25koTSI/QkPOT4pQ/HHRrjSn48q2m/tiRGnd8yKN5tejdl8SYsOlwF/ejoWJhX4DhkpUNuU9m9qQ4U4HU7/7Gl+2/0+pgSxDpHtiOm62qd4FmrDrtGemizkqzNyhmj+KCULLrIZiquWh3IMfnFZdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch; spf=pass smtp.mailfrom=alphanet.ch; dkim=pass (2048-bit key) header.d=alphanet.ch header.i=@alphanet.ch header.b=F3JvMkjT; arc=none smtp.client-ip=46.140.72.222
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alphanet.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alphanet.ch
Received: by shakotay.alphanet.ch (Postfix, from userid 1022)
	id 02C231241E66; Tue,  3 Sep 2024 15:50:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alphanet.ch; s=mail;
	t=1725371432; bh=94k0MamP4n3h+f+GTs3Z5jdLiy75YA2JWP+Fe9pQNGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F3JvMkjT10XYH9MEEfaIAlTttPZVW/A/pD1MNbmP8VxsQj7lju8MS0gZQvadHRQcY
	 XdXVUpq9OsIW8nz6ZQGHjCJM5wP94gmX/1TpEAuoZvkVHGyPM2IYjAf+l8pnM+qU+c
	 29vK1dCQ0i6pKwYMihpCfuuEnsqyY39242O7wDbIGFaStyTfFnfEzSd0M68FVqfMc0
	 kYGKwjCiQq4kbI8iZFi2X9AGUGfVJoYJFgCtb7EO7rMsnZ8Cs/37dn/q9KU9Izo3i2
	 O19KMxvxKBnlLFADOhVsWthqKXPM4tCuDtkl3ysTjoQ9ldkqDkPUuK760nluz4FxgI
	 M+7kGo/5nPhAw==
Received: from reliant.alphanet.ch (reliant.alphanet.ch [192.168.1.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shakotay.alphanet.ch (Postfix) with ESMTPS id E87B812414A2;
	Tue,  3 Sep 2024 15:50:17 +0200 (CEST)
Received: by reliant.alphanet.ch (Postfix, from userid 1000)
	id DE7B676D139; Tue,  3 Sep 2024 15:50:17 +0200 (CEST)
Date: Tue, 3 Sep 2024 15:50:17 +0200
From: Marc SCHAEFER <schaefer@alphanet.ch>
To: Micha?? Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: Strange issues with UAS URB cancellation
Message-ID: <ZtcUGe0FWxpO6058@alphanet.ch>
References: <ZswP0+cLIqkTF0D/@alphanet.ch>
 <20240903094822.3ae297cb@foxbook>
 <ZtcHOlqlQMMD4LzY@alphanet.ch>
 <20240903152218.74393a9e@foxbook>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240903152218.74393a9e@foxbook>

Re,

On Tue, Sep 03, 2024 at 03:22:18PM +0200, Micha?? Pecio wrote:
> > Thank you, I applied + recompiled.  After a while (~1 hour), I got a
> > lot of messages in dmesg, slowing down the md raidcheck to a crawl.
> Sorry about that, this was not intended. It looks like your controller
> doesn't tolerate the NEC workaround.

It's a test system, no worry.

Just patched as instructed & recompiled & re-run the same test, probably won't
hear from me for the next few hours.

Sep  3 15:49:32 video kernel: [  110.660593] md: check of RAID array md0

Have a nice evening!

