Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD4723A988
	for <lists+linux-usb@lfdr.de>; Mon,  3 Aug 2020 17:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726989AbgHCPiX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Aug 2020 11:38:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:37042 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726979AbgHCPiX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 3 Aug 2020 11:38:23 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2A9F6207DF;
        Mon,  3 Aug 2020 15:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596469101;
        bh=HtYKrPcq1FzrlgUja3FCokgf75ZLa/9pzn4kxo3iJPA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d3MSg1lyyccHLI28XCF285P5RcuBXswV3OxKdssp0I9MjPnoLGfb/bl6WpdekeePS
         vERY5CKmPHu3FCwoSNGRIiN9vPjdCatF+EVCo1O1sfuCfsZEUscCIAeR5mGgEvyU4y
         7j14TMFURJrqzKec6StCjYAlFTFSDN2cbleORlEg=
Date:   Mon, 3 Aug 2020 17:38:04 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>
Subject: Re: [PATCH v6 3/3] USB: Fix device driver race
Message-ID: <20200803153804.GA1172014@kroah.com>
References: <20200727104644.149873-1-hadess@hadess.net>
 <20200727104644.149873-3-hadess@hadess.net>
 <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64c8caa8ee054ed9106683f15238b2be74f77aa2.camel@hadess.net>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 03, 2020 at 05:04:46PM +0200, Bastien Nocera wrote:
> On Mon, 2020-07-27 at 12:46 +0200, Bastien Nocera wrote:
> > When a new device with a specialised device driver is plugged in, the
> > new driver will be modprobe()'d but the driver core will attach the
> > "generic" driver to the device.
> > 
> > After that, nothing will trigger a reprobe when the modprobe()'d
> > device
> > driver has finished initialising, as the device has the "generic"
> > driver attached to it.
> > 
> > Trigger a reprobe ourselves when new specialised drivers get
> > registered.
> > 
> > Fixes: 88b7381a939d ("USB: Select better matching USB drivers when
> > available")
> > Signed-off-by: Bastien Nocera <hadess@hadess.net>
> 
> Greg, Alan, are you happy with this iteration?
> 
> If so, I can send it again with Alan's acks, along with a fix for the
> function name Alan mentioned. I see that the first patch in the list
> landed in usb-next already.
> 

Yes, please resend the remaining patches.  I don't recall seeing Alan's
ack on it.

thanks,

greg k-h
