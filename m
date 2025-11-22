Return-Path: <linux-usb+bounces-30819-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 8794DC7CE64
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 12:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7733B4E4842
	for <lists+linux-usb@lfdr.de>; Sat, 22 Nov 2025 11:32:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A906C2FE579;
	Sat, 22 Nov 2025 11:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zzK71Pm8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BDC25785E;
	Sat, 22 Nov 2025 11:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763811144; cv=none; b=jDWUAln77O1x0CiZQ/J28TCTAf3hnG/00ebgPIiy8XCOGkERBkALcRb+wZQWJfrhXtNAoKhMsC1M/GrzZo+EVSQmJAgPsMqeso51hgfuo5KOflegg6ZjAclIxlKpahojngUXM2rEvRagPuJ89gMecOIL9yYPzNgSdosm/+am/2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763811144; c=relaxed/simple;
	bh=iHGJZZ/gxrko9sn3SPu0IBWaTxY5dJFFPri65vhkOr4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb2WrM6s6LFzc17p8j6R2Zem5nC+SsNeStPUFBAVwWZVRWRF7+gCG7/EHnkTLAMMvSp9/BvFQGHDAZMSbxIKHuyO9nljf1s4t3V5Pq6WopQnBFyeh+d3+IxxuyYFkXLaQEvG8WE6Q7RetIj9ZQH6ixVD6z0b3a1/Z5bOSZNVwjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zzK71Pm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00EF8C4CEF5;
	Sat, 22 Nov 2025 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763811144;
	bh=iHGJZZ/gxrko9sn3SPu0IBWaTxY5dJFFPri65vhkOr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zzK71Pm8fVbXvhy9KQ9/PrnBIqSlJYFHjMN2NTLqx3fR1ZQNw33+YPsSqMPeeXvLy
	 cmBViK+jGpvgqAqxycBjgrreJE3IlpuThooMtu6NDSvSyunepZy8PdE7r1yyUtWjL8
	 jE0qnmurhspbbIiZz05lRsAUCU1SY+vz+XuDgTIE=
Date: Sat, 22 Nov 2025 12:32:20 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhengqiao Xia <jerry.xzq@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112253-quintuple-colossal-fcbb@gregkh>
References: <20251122112539.4130712-1-jerry.xzq@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122112539.4130712-1-jerry.xzq@gmail.com>

On Sat, Nov 22, 2025 at 07:25:39PM +0800, Zhengqiao Xia wrote:
> We should not point the of_node of a USB device to a disabled devicetree
> node. Otherwise, the interface under this USB device will not be able
> to register.

Why would a USB device point to a disabled device tree node?  Shouldn't
the device tree be fixed instead?

thanks,

greg k-h

