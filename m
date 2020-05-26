Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21E891BBBDF
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbgD1LFB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 07:05:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:58792 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD1LFB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Apr 2020 07:05:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB86020661;
        Tue, 28 Apr 2020 11:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588071901;
        bh=jC7zy1e+bnj4JAztoCXTuVM1XzGO03Fd0assY+KkPSU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l53dwz7UDrwKdOV7YdDzXYWApzv6bH5wi8mM8MM7lSo4QI16ck1+1slMOHQtWN9in
         0rxl8dZnUpBaRIpT83SJKFNb7lhWOE4rt8mx7sO+6Hay4ZKak6Bo1PGxIckmZUZS+7
         M6+y2a30eAbnJKwNbq8DPoNsGReffzcPbp9rvklY=
Date:   Tue, 28 Apr 2020 13:04:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     vladimir.stankovic@displaylink.com
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        mausb-host-devel@displaylink.com
Subject: Re: [PATCH v5 0/8] Add MA USB Host driver
Message-ID: <20200428110459.GB1145239@kroah.com>
References: <20200327152614.26833-1-vladimir.stankovic@displaylink.com>
 <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200425091954.1610-1-vladimir.stankovic@displaylink.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Apr 25, 2020 at 11:19:46AM +0200, vladimir.stankovic@displaylink.com wrote:
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

Is that a USB-released spec?

> 
> This driver depends on the functions provided by DisplayLink's
> user-space driver.

Where can that userspace code be found?

thanks,

greg k-h
