Return-Path: <linux-usb+bounces-5111-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB082F05A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 15:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B2841C2328A
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jan 2024 14:14:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F5551BDF1;
	Tue, 16 Jan 2024 14:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vzk4lH/H"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D37D21BC26
	for <linux-usb@vger.kernel.org>; Tue, 16 Jan 2024 14:13:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0562C433F1;
	Tue, 16 Jan 2024 14:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705414435;
	bh=8HU0HoedIMWyP6bdrml9uLQ9vAduSsRNZpY66JDZ5MU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vzk4lH/HdcyN+5UG4IAT9oolaMuSD0G0cmh+DOpmjAJRrP0KjnsJlLcm8HopSySa3
	 aSs24d/tSpyEcKyxLxX6tl9bb+ncnXpKdYS857S5rzceAG2zE3pyaaH2sssvVqawQ2
	 +MfCpuBjDgqlcgcZlLImPL1/PlZp9D7znnYlOtRA=
Date: Tue, 16 Jan 2024 15:13:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bruno Haible <bruno@clisp.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: "SilverStone TS16" external SSD enclosing needs an UAS quirk
Message-ID: <2024011630-convent-slouching-ce10@gregkh>
References: <3750407.VQhiAETyHQ@nimes>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3750407.VQhiAETyHQ@nimes>

On Tue, Jan 16, 2024 at 12:35:46AM +0100, Bruno Haible wrote:
> TL;DR
> -----
> In my experience, the "SilverStone TS16" external SSD enclosing
> needs an UAS quirk
>   usb-storage.quirks=0bda:9210:u
> as part of the kernel command line. I hope you can add it
> to the file linux/drivers/usb/storage/unusual_uas.h .

Can you create a patch for this so that you get credit for the making
the fix?

thanks,

greg k-h

