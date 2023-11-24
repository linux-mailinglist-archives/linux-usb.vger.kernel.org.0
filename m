Return-Path: <linux-usb+bounces-3306-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D096F7F7905
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 17:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5FBDBB2104B
	for <lists+linux-usb@lfdr.de>; Fri, 24 Nov 2023 16:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86A7834189;
	Fri, 24 Nov 2023 16:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="uPdx0RSy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28CD2D627
	for <linux-usb@vger.kernel.org>; Fri, 24 Nov 2023 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2BD9C433C7;
	Fri, 24 Nov 2023 16:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1700843511;
	bh=pfvOZV8p3wu114D/yxIF+Nyr/Ey/SQWXpaDJFR4ILP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uPdx0RSywCULJ6JmMsV3bbedW4tUqI53GSP8Ou2RJkRiOsMxtP6qa1+El1D6Z9+Ug
	 o+wBDQcizUh7KgGfsK1COlQubTOj25amw5Fr15NlcQbl9oJzbpbY34sH9VIK13caeD
	 ftnjGuVt/y03mVZDee9Mzjp1RnBeLgvvWkSEQYqY=
Date: Fri, 24 Nov 2023 16:31:48 +0000
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial fixes for 6.7-rc3
Message-ID: <2023112441-directed-reverence-ae19@gregkh>
References: <ZWB3zPa1o74IfDM5@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWB3zPa1o74IfDM5@hovoldconsulting.com>

On Fri, Nov 24, 2023 at 11:15:40AM +0100, Johan Hovold wrote:
> The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b2263:
> 
>   Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-6.7-rc3

Pulled and pushed out, thanks.

greg k-h

