Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 289D127C6F9
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 13:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730724AbgI2Lu0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Sep 2020 07:50:26 -0400
Received: from mail.kernel.org ([198.145.29.99]:53796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730967AbgI2Lt5 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Sep 2020 07:49:57 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1BA84206F7;
        Tue, 29 Sep 2020 11:49:54 +0000 (UTC)
Date:   Tue, 29 Sep 2020 13:06:34 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: qcserial: fix altsetting probing
Message-ID: <20200929110634.GB1160194@kroah.com>
References: <20200929104239.7214-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200929104239.7214-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 29, 2020 at 12:42:39PM +0200, Johan Hovold wrote:
> Drivers should not assume that interface descriptors have been parsed in
> any particular order so use the interface number to look up the second
> alternate setting. That number is also what the driver later use to
> switch setting.
> 
> Note that although the driver could end up verifying the existence of
> the expected endpoints on the wrong interface, a later sanity check in
> usb_wwan_port_probe() would have caught this before it could cause any
> real damage.
> 
> Fixes: a78b42824dd7 ("USB: serial: add qualcomm wireless modem driver")
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
