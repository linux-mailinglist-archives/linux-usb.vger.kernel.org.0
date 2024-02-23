Return-Path: <linux-usb+bounces-6953-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40479861071
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 12:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 717BC1C23824
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD2FE7A70B;
	Fri, 23 Feb 2024 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="efIK4Sn9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5572178B79
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 11:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687992; cv=none; b=EbF7b4EDT+KS6KeiNqcOyIv4uTUyeuSAsSX1lIsD+iulBWGZ8SOGaetDPaWnDi2e0mRSsjowHv4QpKmwfWovOcpNeJiq/7TztJzL+F1gV1v+wiyD7DErRpU4kwlkmBAuXMrnuaRYRbRSmKOqxygBat6YcYIS3OvN59uXC+FFx8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687992; c=relaxed/simple;
	bh=bjAKDbdtEO2SwbpHoU6TcCO7IEfS7GLGKZpottIYxI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AU4QXOPocsRoWDP1mRjt+qcvan1eTXqvfsZMd1R7lkpFS7mYySbKPnqVfnk8nDPccrGHK0XvRwfSlme0+HB28+/x4JMtAim2e1ZQhL0AoYCYk22Z1IIMJFuBg8vLpevYW5hPYxkjEIfdGTLu0zHUUA1KbIQT/tyIrqI9GO+pXkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=efIK4Sn9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F131C433F1;
	Fri, 23 Feb 2024 11:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708687991;
	bh=bjAKDbdtEO2SwbpHoU6TcCO7IEfS7GLGKZpottIYxI4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=efIK4Sn9k9AKgL+rWyMXBeJW9RVbIsP5Ae0UeVX0KMmAMw2kL01W+WZYEGRwIJhlg
	 9kl1GfifZeUDvEcsiYO+omM9HszSB+W2zREHQIYPmPG9QHlDOXU74DMBVch5Dfdtvt
	 Vfk/uQMSmZ4F+dyp0F4GkCGLJ/84aveBkUJ4FutI=
Date: Fri, 23 Feb 2024 12:33:09 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] Bluetooth: btusb: Use right timeout macro to receive
 control message
Message-ID: <2024022341-rice-worry-c99b@gregkh>
References: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>

On Fri, Feb 23, 2024 at 06:00:16PM +0800, Zijun Hu wrote:
> USB driver defines macro @USB_CTRL_SET_TIMEOUT for sending control message
> and @USB_CTRL_GET_TIMEOUT for receiving, but sierra_get_swoc_info() wrongly
> uses @USB_CTRL_SET_TIMEOUT as argument of usb_control_msg() to receive
> control message, fixed by using @USB_CTRL_GET_TIMEOUT to receive message.

You do realize they are both the same value, right?  Why don't we just
change it to USB_CTRL_TIMEOUT so that people don't think changing this
matters?

thanks,

greg k-h

