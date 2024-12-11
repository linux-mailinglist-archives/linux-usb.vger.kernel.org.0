Return-Path: <linux-usb+bounces-18378-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8FDF9EC890
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 10:13:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 851DB16500B
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2024 09:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23C521FF1C5;
	Wed, 11 Dec 2024 09:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+uKw57e"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B1D1FF1A6
	for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2024 09:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733908379; cv=none; b=gWMv+NA7jd48Ee2tGxIplh9dHuLcESQXQe8IXlhZ4QUsQ1zY7o7qoh4pqco/jGeBkM/SlYTsi/ksGYkJ3y1J44a9lB2ya14/T3r4zZjJHWfd+J8PZyBZl+aXzPGJQ0+FyOfsL2aJ2Qp/d4AG+ILJbJZHkmQp2HFu6KL8f9mDDb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733908379; c=relaxed/simple;
	bh=HA7kTSFanwqYyEdIbJvvwEj5Nlh9wNK4iaawZMqMmhA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj64it3n40csNhqhEwjtPDYTPqppYxYoLWWgD0s1hi2ZRJYf441nFqr4PA5aZC9VH3W9hOrYEjb3Y0Tfh1f7jUaftoqu1BZ9sxhHvKdVH27iBB/GxKNYM1tFvLGqYNk0BHCSezHHWIy+etL5IpiRtPm7ChPiwIzq2B0OpuH3LEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+uKw57e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2769EC4CED2;
	Wed, 11 Dec 2024 09:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733908379;
	bh=HA7kTSFanwqYyEdIbJvvwEj5Nlh9wNK4iaawZMqMmhA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o+uKw57e6zZiQoiTRCBYqyg8ah9a26o4jA+qYaRUFP9+FmnPxr/nN0RRy6z86tThK
	 qkNezpraTKu2gCWR+At4jfC3/UuP2N1+aYMug9DgS9sq3M0ZenLttGHhoB/eUOWk5p
	 NQpqH/clvPJVi2HaxleKFeyEPlYCgb3ZKOgoCy80g226HMjTXLhEgXQumtcK2rPFpp
	 kzt2rozbBvu5liiiJOXW79ikFzwyb5yG2ecGu6Wcl8s09xMrZ8nh1VmgO1e5ZSFtxs
	 vdXegQB65v8bdOU3OIaN3L22rZ0GWH5bckvzlvotXhqDcn8wtietyeIgRhO8Mjjo5m
	 lm7Y7OkiYGTQQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1tLImE-000000003R5-0eVm;
	Wed, 11 Dec 2024 10:13:02 +0100
Date: Wed, 11 Dec 2024 10:13:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Mank Wang <mank.wang@netprisma.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Netprisma LCUK54 modules for
 WWAN Ready
Message-ID: <Z1lXnmUMURAYyFF8@hovoldconsulting.com>
References: <PH7PR22MB303872054FB63DF3CE715EBCE6232@PH7PR22MB3038.namprd22.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH7PR22MB303872054FB63DF3CE715EBCE6232@PH7PR22MB3038.namprd22.prod.outlook.com>

On Fri, Nov 22, 2024 at 09:06:00AM +0000, Mank Wang wrote:
> LCUK54-WRD's pid/vid
> 0x3731/0x010A
> 0x3731/0x010C
> 
> LCUK54-WWD's pid/vid
> 0x3731/0x010B
> 0x3731/0x010D
> 
> Above products use the exact same interface layout and option
> driver:
> MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

> Signed-off-by: Mank Wang <mank.wang@netprisma.com>

Now applied, thanks.

Johan

