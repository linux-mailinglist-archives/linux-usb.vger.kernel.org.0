Return-Path: <linux-usb+bounces-4773-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1532C8250DB
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 10:34:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A2311C22AF2
	for <lists+linux-usb@lfdr.de>; Fri,  5 Jan 2024 09:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23409241E7;
	Fri,  5 Jan 2024 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Ips1awCK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A783E23757;
	Fri,  5 Jan 2024 09:34:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1F9CC433C7;
	Fri,  5 Jan 2024 09:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1704447258;
	bh=kGrR0Ob7k7vFDLtA7j3VmPBdpjaASto2LcHNEJL8ORQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ips1awCK8Pnn6apCj/CH6jKsLgXqmsZ/Sur50Ya/2x8QoG5GYD8IMqmTwYSnLmCyx
	 cD/8UESPq+Js2t0tzSelEt/5D9q7LK211sboP60mGNarryX1qNFEL5vGoTVAbjjJsu
	 oRAM32U1FqVS0XfdepLrKjhgawBjgAVtGOccEb8k=
Date: Fri, 5 Jan 2024 10:34:15 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Jai Luthra <j-luthra@ti.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Javier Carrasco <javier.carrasco@wolfvision.net>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	rogerq@kernel.org, r-gunasekaran@ti.com, vigneshr@ti.com,
	d-gole@ti.com
Subject: Re: [PATCH] usb: typec: tipd: Separate reset for TPS6598x
Message-ID: <2024010559-passcode-bogus-2c97@gregkh>
References: <20240105-next-tps-fix-v1-1-158cabaec168@ti.com>
 <78925337-0bba-ca7d-aeb1-2d5c53c565ea@omp.ru>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78925337-0bba-ca7d-aeb1-2d5c53c565ea@omp.ru>

On Fri, Jan 05, 2024 at 12:15:36PM +0300, Sergey Shtylyov wrote:
> Hello!
> 
> On 1/5/24 12:06 PM, Jai Luthra wrote:
> 
> > Some platforms like SK-AM62, SK-AM62A cannot boot up to prompt if
> > TPS6598x is cold-reset during unconditionally on probe failures by
> 
>    Hm, I can't parse this. During what?

See the thread that is listed here:

> > Closes: https://lore.kernel.org/linux-usb/vmngazj6si7xxss7txenezkcukqje2glhvvs7ipdcx3vjiqvlk@ohmmhhhlryws/

thanks,

greg k-h

