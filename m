Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2D607178E41
	for <lists+linux-usb@lfdr.de>; Wed,  4 Mar 2020 11:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387398AbgCDKPJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Mar 2020 05:15:09 -0500
Received: from mail.kernel.org ([198.145.29.99]:57206 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726137AbgCDKPI (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 4 Mar 2020 05:15:08 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4E7120848;
        Wed,  4 Mar 2020 10:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583316907;
        bh=TZxSjlQUQnu4NgDVbd2gidz7ci7NQGXtyn5tKoCqUWY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YWc2GNDvSL8Kep3T4e12Y2TxlPN9nV14EbdJ+xvHqTGAzjrweiqJlDHr5bB6/OU+a
         kBUfAyibkAuMBaPnmQBomLtgDH9YixyJgJJOyC4DB35OtncTaIdXhOrdoOf9IXRRYo
         jfWm7kxjPZe8lAlyIWC8QRq7ajmh1kf7ZMaqACbo=
Date:   Wed, 4 Mar 2020 11:15:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Benson Leung <bleung@chromium.org>,
        Prashant Malani <pmalani@chromium.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/9] usb: typec: Driver for Intel PMC Mux-Agent
Message-ID: <20200304101505.GA1566030@kroah.com>
References: <20200302135353.56659-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302135353.56659-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 02, 2020 at 04:53:44PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> The statements were ended incorrectly with comma instead of semicolon
> in drivers/usb/cdns3/core.c (PATCH 5/9) as pointed out by Peter. I've
> fixed that in this version. There are no other changes.
> 
> v2 commit message:
> 
> I've unified the driver data handling in all drivers in patch 5/9 as
> requested by Peter, and also now using consistently dev_set_drvdata()
> in patch 4/9 as requested by Chunfeng Yun. Those were the only
> changes in this version.
> 
> The original (v1) commit message:
> 
> The Intel PMC (Power Management Controller) microcontroller, which is
> available on most SOCs from Intel, has a function called mux-agent.
> The mux-agent, when visible to the operating system, makes it possible
> to control the various USB muxes on the system.
> 
> In practice the mux-agent is a device that controls multiple muxes.
> Unfortunately both the USB Type-C Class and the USB Role Class don't
> have proper support for that kind of devices that handle multiple
> muxes, which is why I had to tweak the APIs a bit.
> 
> On top of the API changes, and the driver of course, I'm adding a
> header for the Thunderbolt 3 alt mode since the "mux-agent" supports
> it.

Looks good, all now queued up, thanks.

greg k-h
