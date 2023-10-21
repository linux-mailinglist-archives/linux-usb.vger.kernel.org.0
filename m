Return-Path: <linux-usb+bounces-2032-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAA07D1C82
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 12:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF68EB2146D
	for <lists+linux-usb@lfdr.de>; Sat, 21 Oct 2023 10:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52D5FDDDE;
	Sat, 21 Oct 2023 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="J6zqJGJi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC70DDD2
	for <linux-usb@vger.kernel.org>; Sat, 21 Oct 2023 10:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE64C433CA;
	Sat, 21 Oct 2023 10:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697883664;
	bh=+vlLaqQ2BBzx9ryI1xZX9arCzkip1JQTiNLoh3Yh4JM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J6zqJGJiBySInEO/RGLBztSJX9W4JdUZwNRjRLGuF0VJpu9meTPbR8J+hwHXioryM
	 VyHYxbnHUWZxiFXBFofuCfhnFwNpXumghqM9l1umHPcb8m6EuaAalTML8kovqsmP32
	 0nmzo5vNQdRu5UIJ1ums7FqlKFob/bbIs6y2NtLk=
Date: Sat, 21 Oct 2023 12:21:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Milan Broz <gmazyland@gmail.com>
Cc: linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-scsi@vger.kernel.org, stern@rowland.harvard.edu,
	oneukum@suse.com
Subject: Re: [PATCH 3/7] usb-storage: use fflags index only in usb-storage
 driver
Message-ID: <2023102125-lived-clause-66ad@gregkh>
References: <20231006125445.122380-1-gmazyland@gmail.com>
 <20231016072604.40179-1-gmazyland@gmail.com>
 <20231016072604.40179-4-gmazyland@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016072604.40179-4-gmazyland@gmail.com>

On Mon, Oct 16, 2023 at 09:26:00AM +0200, Milan Broz wrote:
> This patch adds a parameter to use driver_info translation function
> (which will be defined in the following patch).
> 
> Only USB storage driver will use it, as other drivers do not need
> more than 32-bit quirk flags.

Then this really should be renamed to be something else.

Having a parameter be "0" means we have to go and look up the function
and see what it does and why everyone is passing 0 to it.

Make a "wrapper" function, and rename it to be something sane that does
not need the extra option, and then for the one place you do need it,
use a different function name and then both call the real function.

Does that makes sense?

thanks,

greg k-h

