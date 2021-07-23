Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F41753D3CD0
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jul 2021 17:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235629AbhGWPLj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jul 2021 11:11:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:50502 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235582AbhGWPLi (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Jul 2021 11:11:38 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 99F8960725;
        Fri, 23 Jul 2021 15:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627055531;
        bh=KQsbz4Jwsglo+wO6lC/4ApiW50zd/bkH71FfrkdAGmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u9LcpFgrBstidPINCVfJ9eLqwcZYbABtQ2SychD1Xz3OYXi066Eb0xAPqLLEYTu8w
         f733hfgwAt3m9M9LIpA7zlTukakdT+WPb1UpDeQ1+OwdAtx/X0kQNuiTxoP96/UigK
         JUsr80IQ8T8TJz/qLJEgQkh2GGPejRPcRi1M6+IE=
Date:   Fri, 23 Jul 2021 17:52:08 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Maxim Devaev <mdevaev@gmail.com>
Cc:     balbi@kernel.org, sandeen@redhat.com, linux-usb@vger.kernel.org,
        Phil Elwell <phil@raspberrypi.com>
Subject: Re: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference
Message-ID: <YPrlqBrdCiO2ogxA@kroah.com>
References: <20210723095323.205593-1-mdevaev@gmail.com>
 <YPqWeCwFQJXLA1ey@kroah.com>
 <20210723182203.48396b80@reki>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723182203.48396b80@reki>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 23, 2021 at 06:22:03PM +0300, Maxim Devaev wrote:
> > Greg KH <gregkh@linuxfoundation.org> writes:
> > Who is the original author here?  Please put their name as the "From:"
> > line in the changelog so we can give proper credit if it was not you.
> 
> Phil Elwell. Fixed.
> 
> > Test for !req and then abort, and then continue on.  No need for moving
> > the copy_from_user line in, right?  Should make the change smaller
> > overall.
> 
> Fixed.
> 
> > Blank line after this please.
> 
> Added.
> 
> > Are the braces still needed here?
> 
> No, you're right.
> 
> Thanks for the review! Here the new version of the patch:
> 
> From 72a504af8e3df3d7a44e9954b8cf03268795c07f Mon Sep 17 00:00:00 2001
> From: Phil Elwell <phil@raspberrypi.com>
> Date: Fri, 23 Jul 2021 11:59:49 +0300
> Subject: [PATCH] usb: gadget: f_hid: fixed NULL pointer dereference

<snip>

Please resend as a v2 in a format that I can apply it in (as a new
email.)

thanks,

greg k-h
