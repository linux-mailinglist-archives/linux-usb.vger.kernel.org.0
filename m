Return-Path: <linux-usb+bounces-30792-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B87A9C77E70
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 09:28:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 01E082D00E
	for <lists+linux-usb@lfdr.de>; Fri, 21 Nov 2025 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A78C02F6187;
	Fri, 21 Nov 2025 08:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B2NjWjLy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E21E2D29CE;
	Fri, 21 Nov 2025 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763713725; cv=none; b=oIYJL7mZFRErvL/yGSuoKPcFMMctLlMUiIsChQySuP/3xkDv3sDnCpcTRzuzv1wBO+DGl0/jz9+g9S3RCYkSEpjbQpkS5OKNq9/Gdj73dGCoSa/LCGNIkmnCLeNcX1uqkasuUvNyBblusFF0ml9O+g6XUeqlega+K3B2SBR2SdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763713725; c=relaxed/simple;
	bh=0T2MqWpA7wgMnt9XEUG8xlgyTAQhu+3ASpIa+iBP+1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D4lG/Lt76cFbHZO2FcH0YFZHPxXahcwsPta4YivE05x31p6b4m64RWmzOXBOOzvEwQKjf2VbT1Q6nx8KaasbsiU6iodWBkfrdQQWVFj2v/Y6KMSzBbv+RNXW50vFfVWvZnxaiGZCp9zRKsduXVpTiQjxbbhdsmODJDFsIA/lNbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B2NjWjLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB90C4CEF1;
	Fri, 21 Nov 2025 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763713724;
	bh=0T2MqWpA7wgMnt9XEUG8xlgyTAQhu+3ASpIa+iBP+1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B2NjWjLyZ03GUKVoxYylKJact3RTz1wjMIEQYAw8T0c5ig2JHsCgAckbCrML7hONm
	 J0pOlvYyVGFJ0jYQKQF9MBRZx6sdUs5/9MoLmqfgriZ/SgHAr1DWDqknmWLZK80tQE
	 CE5B0f/YtXWE7h7pPbvEqTIJiEguJ0gN5BVxza+o=
Date: Fri, 21 Nov 2025 09:28:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] USB: of: filter disabled device node
Message-ID: <2025112159-sermon-grooving-7eb3@gregkh>
References: <20251121080905.2237648-1-xiazhengqiao@huaqin.corp-partner.google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121080905.2237648-1-xiazhengqiao@huaqin.corp-partner.google.com>

On Fri, Nov 21, 2025 at 04:09:05PM +0800, Zhengqiao Xia wrote:
> We should not point the of_node of a USB device to a disabled devicetree
> node. Otherwise, the interface under this USB device will not be able
> to register.

What changed to require this?  What commit id does this fix?

And what devices have a disabled devicetree node?

> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>

Please use a real email address, "corp-partner.google.com" is not "real"
:)

thanks,

greg k-h

