Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88AB6B8F8E
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 14:15:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408901AbfITMPu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 08:15:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:48672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2408877AbfITMPu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Sep 2019 08:15:50 -0400
Received: from localhost (unknown [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C70A720644;
        Fri, 20 Sep 2019 12:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568981748;
        bh=mSRgUDHwabMKE5oazBqmDfwMgj7cJoCDIOm9iZGDvJk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AFwV4v0HFmNhxQGTis+SiaOzIMq77On1nQGoByNEkzdep6F2tBD7qZloT6oglb3fU
         gyju8ZA5qHQLIXz893yLgH7tYSX0MRIMm8/si5Dq+CT1cup8Rm1fejnXfCIXfH5pyK
         59AR6gGBWfKOsfAfOzXxrAi5qIbm38kF62enzPBc=
Date:   Fri, 20 Sep 2019 14:15:38 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     David Heinzelmann <heinzelmann.david@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] Check for changed device descriptors when a
 connection-change occurs before validating the connection.
Message-ID: <20190920121538.GA549982@kroah.com>
References: <20190920103628.5432-1-heinzelmann.david@gmail.com>
 <20190920085556.GB521576@kroah.com>
 <20190920131726.GA5913@dhe-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190920131726.GA5913@dhe-pc>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 03:17:26PM +0200, David Heinzelmann wrote:
> Hi,
> 
> sorry for the wrong patch format.

No problem, that's normal.  But please do not top-post on linux mailing
lists.

> I am trying to detect a change. At the moment I think the change could be ignored if a
> port connection-change occurs and the port status has again the 'PORT_CONNECTION' bit set. 
> 
> I have a fx3 device which does a re-enumeration after a firmware download. This is working
> as expected and I am seeing a 'remove event' and a 'add event' monitoring via udevadm. But
> if I connect multiple devices at the same time via an usb hub I am sometimes not receiving
> a 'remove event' and 'add event' for a single device.

Sounds like a broken hub :)

> I think the problem could be that when a device disconnects and the port connection-change
> occurs and before the 'PORT_CONNECTION' bit is checked the device could already be
> reconnected and the 'PORT_CONNECTION' bit is set. Therefore I think it is not correct to
> resuscitate the exisiting device.

Does your patch actually fix the issue?  When a fx3 device downloads
firmware and re-enumerates, it should come back as a totally different
device, which will fail this check, right?  So I don't see how this
fixes the issues with your devices.

Unless all of the devices reset themselves at the same time and the hub
doesn't like that and can't notice that it happened?

If you use a different hub, does that work properly?

thanks,

greg k-h
