Return-Path: <linux-usb+bounces-26809-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D21B24CB5
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 16:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9201D4E42BE
	for <lists+linux-usb@lfdr.de>; Wed, 13 Aug 2025 14:59:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 143762FAC1A;
	Wed, 13 Aug 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tZk1OJMi"
X-Original-To: linux-usb@vger.kernel.org
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C05C2ED172
	for <linux-usb@vger.kernel.org>; Wed, 13 Aug 2025 14:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755097066; cv=none; b=ulHrs/evl9syGEA6sAaNO+NICNy8IfkwrV27JFVgjCDFileh2lML4GWLxsOp/2etXAzcbDJO9ao/R6p6auuh5IRvINKWlrTWKwciE1/wH+Vhxmap+UE+3RHS8G083CT+uQL/mp41p8enBgBAT7sOSnNJ2Y+sK/hrwj2qzLFlCFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755097066; c=relaxed/simple;
	bh=2nQhhmTMpWAkEfQqSuKYdG+7HAP1ecHNw8TdIF2331E=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kienLDtI0zrRQXce0FWTYJB3qhPAp7GYpK+NxmHcRWc3pV3xnoXqNGkiJ3oiAGhCRRc33+o6YzKGgjHKvFq4OHK1qWOvedo+B1w3iIp0f4cPEEUlmfjRnLHGwmx6y44hRoNcTHmJOG91Kv03Kg+RrUJjNf3mUbm4+gtPayT3aLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tZk1OJMi; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755097062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZX0y3XqvMJOpqUkdJGA0oEg4O1RqEHyh9mxsJeg//rU=;
	b=tZk1OJMiVRqSV7+X5aLLA1tVT6SxVvMXjd+Kk/ow2bVMHraZKX6+yJO6xh4BXSDkPgBBiE
	VEwef0286emSwznk28MqpnXzWcQVfQGg77GD3z6KXOXFhZLHhHvJwbWLyfkqSTn25ff4vk
	pgUIvwh3haYsv9Og7+9GZPM9Kl8xBB8=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH 3/3] usb: storage: realtek_cr: Use correct byte order for
 bcs->Residue
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <2025081358-posted-ritzy-bd3f@gregkh>
Date: Wed, 13 Aug 2025 16:57:27 +0200
Cc: Alan Stern <stern@rowland.harvard.edu>,
 wwang <wei_wang@realsil.com.cn>,
 stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@suse.de>,
 linux-usb@vger.kernel.org,
 usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <FD8853F3-7ED4-48D7-BADE-F69B4B6D3A43@linux.dev>
References: <20250813101249.158270-2-thorsten.blum@linux.dev>
 <20250813101249.158270-6-thorsten.blum@linux.dev>
 <2025081358-posted-ritzy-bd3f@gregkh>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Migadu-Flow: FLOW_OUT

On 13. Aug 2025, at 16:39, Greg Kroah-Hartman wrote:
> On Wed, Aug 13, 2025 at 12:12:51PM +0200, Thorsten Blum wrote:
>> Since 'bcs->Residue' has the data type '__le32', we must convert it to
>> the correct byte order of the CPU using this driver when assigning it to
>> the local variable 'residue'.
>> 
>> Cc: stable@vger.kernel.org
> 
> When you have a bugfix, don't put it last in the patch series, as that
> doesn't make much sense if you want to backport it anywhere, like you
> are asking to do here.
> 
> Please just send this as a separate patch, and do the cleanups in a
> different series.

Ok, you can find it here:

https://lore.kernel.org/lkml/20250813145247.184717-3-thorsten.blum@linux.dev/

Thanks,
Thorsten


