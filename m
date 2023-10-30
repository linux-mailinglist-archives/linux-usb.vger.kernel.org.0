Return-Path: <linux-usb+bounces-2330-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A017DB326
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 07:18:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A8C62813AD
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 06:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 432DA1FBA;
	Mon, 30 Oct 2023 06:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yR/WCyby"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B912717F5
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 06:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC386C433C7;
	Mon, 30 Oct 2023 06:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1698646726;
	bh=dsjaKeP9ufThTo++ltug0AOcs4QD5rWHM2LVx2MJ3rI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yR/WCybyoIYZoAQ+49m41ahNGa73PPcVyZJGphoTiHSQ/A35doEF+YY51uexrqdLC
	 i7y0E6jXcn74/o9oImU70hovy2cYLKXiflEjmuDecwgruUjyAee84u0cIz4scaqh1p
	 W1mtef2MW9TelElMKeH4TxxwSKjswHmPPQ3ROIM0=
Date: Mon, 30 Oct 2023 07:18:43 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: bugzilla-daemon@kernel.org
Cc: linux-usb@vger.kernel.org
Subject: Re: [Bug 218086] New: ACER HD User Facing camera is not working
Message-ID: <2023103055-morally-sip-0621@gregkh>
References: <bug-218086-208809@https.bugzilla.kernel.org/>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-218086-208809@https.bugzilla.kernel.org/>

On Sun, Oct 29, 2023 at 11:00:25PM +0000, bugzilla-daemon@kernel.org wrote:
> It looks like it's not added into uvc_driver.c. I've made addition for it (see 
> attachment) and it make camera work. Can we have this code somehow added to
> mainline kernel?

Please submit the patch as documented in the kernel file,
Documentation/process/submitting-patches.rst and the developers there
will be glad to take it (i.e. it needs to come through email.)

thanks,

greg k-h

