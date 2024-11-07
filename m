Return-Path: <linux-usb+bounces-17291-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FF99C0003
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 09:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95E991C21340
	for <lists+linux-usb@lfdr.de>; Thu,  7 Nov 2024 08:34:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A08191DB37C;
	Thu,  7 Nov 2024 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gkyL9yhE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A201DACB4
	for <linux-usb@vger.kernel.org>; Thu,  7 Nov 2024 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730968479; cv=none; b=TJyW4t3knkXHmyeS08rwC4duKkvCFD3ihX/gC23XoVnlnxTXK13fjc3r9pNWkaR+jHUDhgx+H3Wrzmep4LqUwJqVZyKpsuWPrsiDMl6yeARZbxpHBtuDojHniuUZd7slY+5BoJKromsFstToHQHMp2ECzGYmNk7QjEcejgs+/Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730968479; c=relaxed/simple;
	bh=tzK6w3dt+UCJU1AoyyWFaw4Y9WKrEqf8WuQCogRUJ4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTgfeIC3VHko68OLesscbTmCIXrfacNJRKkR0rtnnr3SCE+gbzn0Yz13EpoDWnYQGppP48DAY+wEjdEm5+k3OV7smiUpC02AvviuDQACmRAQz37aqsN8fxqI4eXMerEd83Lkx25VceIn/rRNrf6I0M43+g84uqhEqQkbw82bWQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gkyL9yhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D80BC4CECC;
	Thu,  7 Nov 2024 08:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730968479;
	bh=tzK6w3dt+UCJU1AoyyWFaw4Y9WKrEqf8WuQCogRUJ4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gkyL9yhEBTySkU9kZN7Mdlz/VWBrt/wXPwGkLoFhngzLB6zlrot7fxwMqb2ZbXzo4
	 qUguKOZ/o9e6NK5AWB3oaDPjN1raJZeIoCCwQJjG+QyXHb9aaW2RNDw6cZ/vmkWnGc
	 ewjKW/mtRqcM1B4M041h1C+X/FfEtW+c4EfRJuBQ=
Date: Thu, 7 Nov 2024 09:16:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: linux-usb@vger.kernel.org, Wentong Wu <wentong.wu@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH v3 1/3] usb: misc: ljca: move usb_autopm_put_interface()
 after wait for response
Message-ID: <2024110743-dragonish-jokingly-8459@gregkh>
References: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107073718.405208-1-stanislaw.gruszka@linux.intel.com>

On Thu, Nov 07, 2024 at 08:37:16AM +0100, Stanislaw Gruszka wrote:
> Do not mark interface as ready to suspend when we are still waiting
> for response messages from the device.
> 
> Fixes: acd6199f195d ("usb: Add support for Intel LJCA device")
> Cc: stable@vger.kernel.org
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com> # ThinkPad X1 Yoga Gen 8, ov2740
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> ---
> v2: fix handing error of usb_autopm_get_interface(),
>     add R-b, T-b tags from Hans
> v3: add A-b tag from Sakari
> 
>  drivers/usb/misc/usb-ljca.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

For some reason you aren't sending this to the usb maintainer to be
applied, oh well...


