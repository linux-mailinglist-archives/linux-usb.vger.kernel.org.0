Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49ECB1D4E79
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 15:08:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbgEONIZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 09:08:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:49724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726135AbgEONIZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 15 May 2020 09:08:25 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C2F6B20657;
        Fri, 15 May 2020 13:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589548105;
        bh=FZjUmuz0tzdo0ehVHOgBg2YGeXAHDqPNgWKu5dHQ0xk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Il1iX8OqUC7f5CIPXdlQ+CB6eru4owrzBzVZcFMyKtN/M8k/X8I9PfM/fbPWEaEx+
         2z9aMZmqbRfXSg9GvJIA4193mG4An3jVz4FEH25it0pYTY8PHp/1JyYwGjp2LjEOI/
         IEF1wC9MT9uOegNaAVGgc75heYDEA+RYKcsj9vYA=
Date:   Fri, 15 May 2020 15:08:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Vladimir Stankovic <vladimir.stankovic@displaylink.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: Re: [PATCH v6 0/8] Add MA USB Host driver
Message-ID: <20200515130823.GE1937631@kroah.com>
References: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
 <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515123502.12099-1-vladimir.stankovic@displaylink.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 15, 2020 at 02:34:54PM +0200, Vladimir Stankovic wrote:
> Media Agnostic (MA) USB Host driver provides USB connectivity over an
> available network, allowing host device to access remote USB devices
> attached to one or more MA USB devices (accessible via network).
> 
> This driver has been developed to enable the host to communicate
> with DisplayLink products supporting MA USB protocol (MA USB device,
> in terms of MA USB Specification).
> 
> MA USB protocol used by MA USB Host driver has been implemented in
> accordance with MA USB Specification Release 1.0b.
> 
> This driver depends on the functions provided by DisplayLink's
> user-space driver.

Any pointer to the code for this?  Without reviewing that, reviewing
this code is going to be impossible, as I stated last time.

thanks,

greg k-h
