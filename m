Return-Path: <linux-usb+bounces-2033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2925F7D1C85
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:22:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D906C2824D7
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:22:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6E1DDDCA;
	Sat, 21 Oct 2023 10:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wlOdTiTJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134A33FFE
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36119C433C8;
	Sat, 21 Oct 2023 10:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883716;
	bh=oyimhO7suVSvnWfKQSXAKUTFdnT5bdgyjfYlp1W2ZK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wlOdTiTJis7AomBYjgLISv/Vzl6/PFKf2fu7XEIHlqbjOyUK5sOx2duXx0pSLFsX7
	 k5QUOhx+jTzgIwtRK9SSq2ueAFGdLLJOm3s+lrMuyIBpW1G/NbX/l4HYWdq1lG/o2c
	 2w2e7zm6ZS0Z6WLAtQspa7lP8GzIbNtpQ3YRNwwk=
Date: Sat, 21 Oct 2023 12:21:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org, stern@rowland.harvard.edu,
	oneukum@suse.com
Subject: Re: [PATCH 5/7] usb-storage,uas: do not convert device_info for
 64-bit platforms
Message-ID: <2023102110-waviness-corny-7bd6@gregkh>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
 <20231016072604.40179-6-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016072604.40179-6-gmazyland@gmail.com>

On Mon, Oct 16, 2023 at 09:26:02AM +0200, Milan Broz wrote:
> This patch optimizes the previous one for 64-bit platforms,

What is "previous one"?  We don't know that when we go and look at the
changelog in the future.

> where
> unsigned long is 64-bit, so we do not need to convert quirk flags
> to 32-bit index.
> 
> Signed-off-by: Milan Broz <gmazyland@gmail.com>

Why not just do it properly the first time?  You are fixing up a patch
that you added, which should not be needed.

thanks,

greg k-h

