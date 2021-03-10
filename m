Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49DB23337F4
	for <lists+linux-usb@lfdr.de>; Wed, 10 Mar 2021 09:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbhCJI4t (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Mar 2021 03:56:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:58102 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229559AbhCJI4S (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 10 Mar 2021 03:56:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id F16E564FEF;
        Wed, 10 Mar 2021 08:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615366577;
        bh=8jQDixR2Fy5KslzPxvGr+bPTg9cQGgEe6bXP1R5B5QY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L9Gf+ZvQ0MKBkK2nqNLEX6nOUtw8ppKQCHkyDxAO7EfQvHUyH2Sg5oYofH5syNqBf
         1YqO1sveyEdCjE8NKrTv2b6NG60dveE+6MUvgx+wHbpqVtXcf+6qdC8+H2gF26d73S
         sy0ufKJNLBZBapwLgORZAJppgqq2Vgt1+rAEapns=
Date:   Wed, 10 Mar 2021 09:56:14 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Ramsay, Lincoln" <Lincoln.Ramsay@digi.com>
Cc:     Oliver Neukum <oneukum@suse.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: cdc-acm cooldown + Cisco 2960-X = kernel warning + dead USB
Message-ID: <YEiJrkFofHrG1tCH@kroah.com>
References: <BN8PR10MB36989D7DC6402FDB1256ADAAE8979@BN8PR10MB3698.namprd10.prod.outlook.com>
 <395fc28de485f33071d358abf74b70ed1bcbbbad.camel@suse.com>
 <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN8PR10MB36988867624ADD97964F9EB3E8929@BN8PR10MB3698.namprd10.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 10, 2021 at 01:30:21AM +0000, Ramsay, Lincoln wrote:
> > Am Donnerstag, den 04.03.2021, 22:59 +0000 schrieb Ramsay, Lincoln:
> > > 1. Connect the Cisco 2960-X console.
> > > 2. (Re)boot our device.
> > > 3. Open the Cisco's console device (/dev/ttyACM0) and write to it.
> > 
> > What exactly happens after that?
> 
> The kernel warning about the empty work on the queue is printed to the console (and journal) and then nothing. Reading/writing doesn't work (but it didn't work before the cooldown patch either). The system doesn't die (ie. networking is still going) but USB appears to be dead (though I only tested the same console being connected to different USB ports).
> 
> > Did your test kernel contain 38203b8385bf6283537162bde7d499f83096471 ?
> 
> No... our newest builds use kernel 5.8.18 and that commit seems to be
> in 5.10. But backporting that to our kernel seems like a much nicer
> fix than reverting the cooldown patch.

Please note that 5.8.18 is very old and obsolete and known insecure.
Please do not use it if at all possible as the community can not support
it at all, and I doubt whomever you got that kernel from can either :(

thanks,

greg k-h
