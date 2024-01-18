Return-Path: <linux-usb+bounces-5218-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5910A831959
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 13:43:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8BC321C20CED
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 12:43:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A402E24B42;
	Thu, 18 Jan 2024 12:43:18 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A05241F6
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 12:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705581798; cv=none; b=oeXBGmZgpsYRL58bEcULGzWGxRrnpVYqVRbmj0gfcGnmQbZ2DFdwwycWlCaD6skEdyAodJN8zKJroP/SyMKRLW0P3nxSBB1leVnT9t1Q8FoM5AGkmBnfw/PwYVYq6aV8tbx3OTv80Vmxo+R8/BKfyHYVRYG5i/b+ImvghTHJRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705581798; c=relaxed/simple;
	bh=+0ydKqoNphxFQJubzplfiarEk7MpdaFkM3q5uhyEY50=;
	h=Received:Received:From:To:Cc:Subject:References:Date:In-Reply-To:
	 Message-ID:User-Agent:MIME-Version:Content-Type:X-GND-Sasl; b=Qq9HpNWdLSeNAJZ8slwyEmNuGoyQ42/HpzXN26cNwMJ0+77XZn38Z9TYQ2wCgk2WMHMZ7kBLW9XLLDl2t4W6TonDsB6328Ic3zJ7Asrhkxuz+GrrZjjegXkRT5T7mgBc/uUQnBhoW1uBJUXppmxGuHTAsWhm/ti/siRHA8fcbWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id F3F71FF806;
	Thu, 18 Jan 2024 12:43:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1rQRje-00GlTb-0t;
	Thu, 18 Jan 2024 13:43:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,  Michal Nazarewicz <mina86@mina86.com>
Subject: Re: [PATCH] usb: gadget: f_fs: expose ready state in configfs
References: <20240118121816.3992645-1-peter@korsgaard.com>
	<2024011857-existing-shucking-97d4@gregkh>
Date: Thu, 18 Jan 2024 13:43:06 +0100
In-Reply-To: <2024011857-existing-shucking-97d4@gregkh> (Greg Kroah-Hartman's
	message of "Thu, 18 Jan 2024 13:28:16 +0100")
Message-ID: <87le8mizhh.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Greg" == Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:

 > On Thu, Jan 18, 2024 at 01:18:16PM +0100, Peter Korsgaard wrote:
 >> When a USB gadget is configured through configfs with 1 or more f_fs
 >> functions, then the logic setting up the gadget configuration has to wait
 >> until the user space code (typically separate applications) responsible for
 >> those functions have written their descriptors before the gadget can be
 >> activated.
 >> 
 >> The f_fs instance already knows if this has been done, so expose it through
 >> a "ready" attribute in configfs for easier synchronization.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> drivers/usb/gadget/function/f_fs.c | 15 +++++++++++++++
 >> 1 file changed, 15 insertions(+)
 >> 
 >> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
 >> index fdd0fc7b8f25..ae44dd5f3a94 100644
 >> --- a/drivers/usb/gadget/function/f_fs.c
 >> +++ b/drivers/usb/gadget/function/f_fs.c
 >> @@ -3446,6 +3446,20 @@ static inline struct f_fs_opts *to_ffs_opts(struct config_item *item)
 >> func_inst.group);
 >> }
 >> 
 >> +static ssize_t f_fs_opts_ready_show(struct config_item *item, char *page)
 >> +{
 >> +	struct f_fs_opts *opts = to_ffs_opts(item);
 >> +
 >> +	return sprintf(page, "%d\n", opts->dev->desc_ready);
 >> +}
 >> +
 >> +CONFIGFS_ATTR_RO(f_fs_opts_, ready);
 >> +
 >> +static struct configfs_attribute *ffs_attrs[] = {
 >> +	&f_fs_opts_attr_ready,
 >> +	NULL,
 >> +};

 > No documentation entry for this new attribute?

Ups, I'll add a snippet to Documentation/usb/gadget-testing.rst and send
a v2.

-- 
Bye, Peter Korsgaard

