Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA4927C6F8
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 13:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730693AbgI2LuZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 07:50:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:53892 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731269AbgI2Lt6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 07:49:58 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 542DF206E5;
        Tue, 29 Sep 2020 11:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601380197;
        bh=73vELVkbudOyu5/cNMZZUkpOORrJRg3cL+YzLgIiOJ8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sPXyhVTbStN2i5gM0Y1uA3apKBiOK3iTu8REBIqbOtL5a0GLPco+KDuqXxdpJTYXp
         6617Ads6rJAo329jOHMygDEEm3GDT3iJpq47xKCa0RknQoYIFTUJX8l4D2pFbONTOa
         O4osHHI+W9u4bW8mNELQoCIUd+GYVcvU3ui6hB2Q=
Date:   Tue, 29 Sep 2020 13:06:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        "Mychaela N . Falconia" <falcon@freecalypso.org>
Subject: Re: [PATCH] USB: serial: ftdi_sio: clean up jtag quirks
Message-ID: <20200929110651.GC1160194@kroah.com>
References: <20200929104116.7107-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929104116.7107-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 12:41:16PM +0200, Johan Hovold wrote:
> Drivers should not assume that interface descriptors have been parsed in
> any particular order so match on interface number instead when rejecting
> JTAG interfaces.
> 
> Also use the interface struct device for notifications so that the
> interface number is included.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
