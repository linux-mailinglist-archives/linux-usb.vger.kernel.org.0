Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 34789B620C
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 13:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbfIRLIS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 18 Sep 2019 07:08:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:56866 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbfIRLIS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 18 Sep 2019 07:08:18 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39A7F20644;
        Wed, 18 Sep 2019 11:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568804897;
        bh=mFX5KmGBL/xZJ+E41FOaDotw/IWIEka/IKaZBuYHk60=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PYtVL6NsN/czqqKCYbaXrx6jKUpI8mZOgeVL5dQHHLjFf3DkIzUNbGh152fItFBnh
         BsUP4AudAgcagGrS5vXYXPjnegYuembqTNDTcrsWM3AIe/syfKYRvg5hbv56pENaiO
         dzqLfP9jf4r7oQBZrx/rkqDpadcYLlSnwMXjm5GY=
Date:   Wed, 18 Sep 2019 13:08:14 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yegorslists@googlemail.com
Cc:     linux-usb@vger.kernel.org, johan@kernel.org
Subject: Re: [PATCH] USB: serial: add port statistics
Message-ID: <20190918110814.GC1894362@kroah.com>
References: <20190918091415.23683-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190918091415.23683-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 18, 2019 at 11:14:15AM +0200, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Add additional port statistics like received and transmitted bytes
> the way /proc/tty/driver/serial does.
> 
> As usbserial driver already provides USB related information and
> this line is longer than 100 characters, this patch adds an
> additional line with the same port number:
> 
> 0: module:ftdi_sio name:"FTDI USB Serial Device" vendor:0403 ...
> 0: tx:112 rx:0
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  drivers/usb/serial/usb-serial.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)

You can't change existing proc files without having the chance that
userspace tools will break.

Have you tried this and seen what dies a horrible death?

thanks,

greg k-h
