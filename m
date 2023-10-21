Return-Path: <linux-usb+bounces-2031-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A02B97D1C70
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:19:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C022E1C20A0A
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C92CDDAC;
	Sat, 21 Oct 2023 10:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HUaP7ejO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48841C36
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:19:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEFDC433C7;
	Sat, 21 Oct 2023 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883545;
	bh=o60ztdXoWebv4LHATyaCGzksZbO31/EhiedLC9VD11A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUaP7ejO8hhcsuG4SLBiZQpoqKbhxbDiLxGf7+lnno7adChKbKrOleJY6QU+qZxsm
	 bOlLKgNqJGITEG6jNMBGXIKLLbJilvvXMptbMOm40yGjeb653EZr4GBYYH8tLW58lJ
	 2aEPdQBterdxVSrnqJJU49HZ+IHP4zsi406T75xU=
Date: Sat, 21 Oct 2023 12:19:02 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org, stern@rowland.harvard.edu,
	oneukum@suse.com
Subject: Re: [PATCH 2/7] usb-storage,uas: make internal quirks flags 64bit
Message-ID: <2023102130-catfight-isolated-d786@gregkh>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
 <20231016072604.40179-3-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016072604.40179-3-gmazyland@gmail.com>

On Mon, Oct 16, 2023 at 09:25:59AM +0200, Milan Broz wrote:
> Switch internal usb-storage quirk value to 64-bit as quirks currently
> use all 32 bits.
> 
> (Following patches are needed to use driver_info with a 64-bit
> value properly.)

Nit, this sentence isn't needed, I'll go delete it when I apply it, and
patch 1/7 to my tree now, thanks.

greg k-h

