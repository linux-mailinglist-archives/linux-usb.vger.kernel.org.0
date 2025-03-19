Return-Path: <linux-usb+bounces-21938-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A4EA69CE0
	for <lists+linux-usb@lfdr.de>; Thu, 20 Mar 2025 00:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9F25189CB99
	for <lists+linux-usb@lfdr.de>; Wed, 19 Mar 2025 23:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C039224230;
	Wed, 19 Mar 2025 23:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Unbg2h81"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAB51DE3A9
	for <linux-usb@vger.kernel.org>; Wed, 19 Mar 2025 23:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742428278; cv=none; b=PsPT/1pDDJjAikIouZxHfjDhyhCBCgv4Hy1n0OM0HfUZZzl72PBOZ69wTviF+bLWZD1/lWUNDF2Q4YxTePppFiFxToquR2Ry7ihYxdQ+vBgq9jiGLFDntf86e1mbBVGPiDWR5ZZ8qeKs6oX8f+Mq3eacELomkcIN5o2X+WB2YKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742428278; c=relaxed/simple;
	bh=izjLDmh1q+e24sB6PpSMw1XYFIbYzwxscN1HB7p2mOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZrGUukw4i1LAkD5CNjwUNKHGVvM5nv8FLBbMSjE4Hnhod950iKBGWbpeV2lvT8SdpezPw0yi0Y02uz1WkYNSUUi7QnzFcrX1yXbW4iO5pTqkj1ctHlfIvcbCef4hhoWzZGXWRspyvmTEozn9cMBjdfLfDlWyFU8y5OA8PBOKjS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Unbg2h81; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F02CC4CEE4;
	Wed, 19 Mar 2025 23:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742428277;
	bh=izjLDmh1q+e24sB6PpSMw1XYFIbYzwxscN1HB7p2mOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Unbg2h817cY41DDuIiVRzqyE37MMIbcbvEsO5vdC647OvR1j44B13xcmVow2/s6dY
	 F98Ya0axwEksXtdWQcng/1s07aFk6fFSLFWBmZzTHlMKagcEoraznK8QkSWKvgqfCq
	 waqPUgYMnjG3jGadvGXBOtJVcbPKLWzkWU6xqKxc=
Date: Wed, 19 Mar 2025 16:49:57 -0700
From: Greg KH <gregkh@linuxfoundation.org>
To: rtm@csail.mit.edu
Cc: linux-usb@vger.kernel.org
Subject: Re: use-after-free in drivers/net/usb/hso.c hso_serial_open()
Message-ID: <2025031933-clavicle-sulfide-878e@gregkh>
References: <33193.1742406937@30-11-165.wireless.csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33193.1742406937@30-11-165.wireless.csail.mit.edu>

On Wed, Mar 19, 2025 at 01:55:37PM -0400, rtm@csail.mit.edu wrote:
> The attached demo uses usbip to pretend to be a net/usb/hso.c device. It
> provides damaged configuration information that, among other things,
> claims to have an INTR endpoint with zero maximum transfer size. If
> /dev/ttyHS0 is opened, hso_serial_open() / hso_start_serial_device() /
> ...submit_intr_urb() fails due to that bad endpoint, causing the
> relevant hso_dev and hso_serial to be freed by hso_free_serial_device().
> But the serial_table[] entry is not cleared, and is left pointing to a
> now-deallocated hso_dev. If /dev/ttyHS0 is opened again,
> hso_serial_open() (via get_serial_by_index()) will use the
> now-deallocated structures.

Great, can you write a fix for this as you have a test case for it?

Wait, shouldn't we fail a device that has a zero size anyway in the USB
core?  Is that a valid configuration?  It's been a long time since I dug
into the spec for that...

thanks,

greg k-h

