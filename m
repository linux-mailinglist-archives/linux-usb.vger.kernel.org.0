Return-Path: <linux-usb+bounces-18624-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BFB9F5F52
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 08:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A08118862B8
	for <lists+linux-usb@lfdr.de>; Wed, 18 Dec 2024 07:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7373161311;
	Wed, 18 Dec 2024 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="V2H8OQCM"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 642F48488;
	Wed, 18 Dec 2024 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734507063; cv=none; b=LHij9ZjmpvHQRv/eRL32LnO2mdfYVZsN/DKCHSFebydmLcbtKXpu8JFVKZNn2CtEUFmwL+PndEPhNlDeb5o+MshSDLdYNf2xZtJgsGsYpZPLxGGQE7uPa4o/XvNNnhcyi9FisJVA0I84NZMIlMnmmbU0/V7w7O7JfFRy90srJO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734507063; c=relaxed/simple;
	bh=UpFSLQPO96lykop+vvLXd2Bkubb8lGnsKqB3CKAFECI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oim96Yj1sJHmDP4+fJmUNSaWZm5rh92Tt67Jr6Ar6+Tefd+WS9lTaqvn5bqnwIy3hlGce02iJvA5g3wMSb8whYYLk89fz9ChBE0gWKP/F+ECqse5Hne8nG5BWobnjKgbJUA0SICrZiZyFdkF81mhVRkt3QK7oX4eiJOTZifPRD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=V2H8OQCM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AEB5C4CECE;
	Wed, 18 Dec 2024 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734507062;
	bh=UpFSLQPO96lykop+vvLXd2Bkubb8lGnsKqB3CKAFECI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V2H8OQCMjc18mYRWRPLyw4KDgpnzAhA0Wl5opru2xNOPaXLo9H8cVw2zITxylgmgS
	 5AGHqU1TCwiNM/CCrBOlXr6UQKrMCCrK4GZhcnfyJB1Zg4ccQI7PZMNMwkW/HYwR1c
	 Gh1WVP9aYYMmiIUn1QGWikDe9g2A6TRoQeMlHZ9I=
Date: Wed, 18 Dec 2024 08:30:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5rGf5LiW5piK?= <sh.jiang@zju.edu.cn>
Cc: security@kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, syzkaller@googlegroups.com
Subject: Re: [bug report] usb: WARNING in usb_free_urb
Message-ID: <2024121824-twine-ageless-5c7c@gregkh>
References: <ee535ac.6def.193d8967e04.Coremail.sh.jiang@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ee535ac.6def.193d8967e04.Coremail.sh.jiang@zju.edu.cn>

On Wed, Dec 18, 2024 at 03:06:01PM +0800, 江世昊 wrote:
> Hello developers,
> 
> We hit this issue when fuzzing the usb module with Syzkaller.

Great!  But why are you using an old kernel version:

> HEAD commit: 819837584309 6.12.0-rc5

If you come up with a fix for this, please submit it as you have a
reproducer.

Also, no need to cc: the security alias if you also send it to public
lists like this.

thanks,

greg k-h

