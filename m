Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24FFF45EC04
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 11:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233372AbhKZLCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 06:02:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:42742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231406AbhKZLAU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 26 Nov 2021 06:00:20 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2391F6112F;
        Fri, 26 Nov 2021 10:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1637924227;
        bh=c5JBYhgwQc0VXrea9gpK8VOIAPmmv+ePPpVETf/ojm4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TzakHk7s6EeqEY29U+Jvp1VTmriNlsoDa7pI1W3tEop9d3HbCRgnTlZdV9FGQIINk
         pCKMSXzGXc/6WizyNNJ39hry2oN1SSVccmF/O/mT1rYwk3Vxe2S8i2Zb4u2JeBweWy
         4/P91p3cQvriB4HkepAibZvtmmSbxNBdR0x5DjV0=
Date:   Fri, 26 Nov 2021 11:57:04 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andreas Ehlert <evlaim@web.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: usb.ids entry for brother MFC-290C
Message-ID: <YaC9gIN2AJL9kpkP@kroah.com>
References: <a045af57-9b40-5a0a-24b2-0b41cd44e3db@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a045af57-9b40-5a0a-24b2-0b41cd44e3db@web.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Nov 26, 2021 at 11:46:58AM +0100, Andreas Ehlert wrote:
> hello there,
> 
> i will not communicate with a robot.
> 
> some issues with my distro devuan and udev (sysvinit). after an
> installation for my old printer device
> brother mfc-290c. i got some errors from the udev service.
> 
> the failure was a wrong term in the rule script for sane (manually
> fixed) and no entry
> in the usb.ids (manually fixed).
> 
> my question: can you add the entry in the actually usb.ids?
> 
> 04f9 Brother Industries, Ltd
>     01fd MFC-290C
> 
> lsusb output:
> 
> Bus 006 Device 002: ID 04f9:01fd Brother Industries, Ltd MFC-290C
> 
> i know it's an old device, but i use it to scan und print things.

For usb.ids entries, you need to enter the information into the web
form.  That's the only way, sorry.

But really, having that information in the file doesn't add any
functionality to the device, it just makes for pretty 'lsusb' output.

thanks,

greg k-h

> 
> best regards
> andreas ehlert
> 
