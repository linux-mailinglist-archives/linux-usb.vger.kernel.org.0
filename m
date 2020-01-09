Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 729DE13563B
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jan 2020 10:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729913AbgAIJwK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jan 2020 04:52:10 -0500
Received: from mail.kernel.org ([198.145.29.99]:44742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729170AbgAIJwH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 9 Jan 2020 04:52:07 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E98422072A;
        Thu,  9 Jan 2020 09:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578563527;
        bh=c7jZaClDypVvCvlKnzlLrOVgU/QAtJw4RonErlcWPhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HtBDzX3uUiALzEYnsTKv11FaCLZ2eTIjw4oz8YP7hMb/f22MjJKc4o8ulCsPik4X/
         wRhQWzViODjLQ3ZMw0hrrHAWz2kKkSfSISAPLKt9FVzuWUmvuF5Dz++qgWX5T66+zG
         c4y+3I81e0RuiHOEL+OaWFPbm6WqnX0h5WtQ0WqE=
Date:   Thu, 9 Jan 2020 10:52:05 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 14/15] usb: typec: Add member for the supported USB modes
 to struct typec_capability
Message-ID: <20200109095205.GA129962@kroah.com>
References: <20191230142611.24921-1-heikki.krogerus@linux.intel.com>
 <20191230142611.24921-15-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191230142611.24921-15-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 30, 2019 at 05:26:10PM +0300, Heikki Krogerus wrote:
> The ports can inform which USB modes (USB2, USB3 and USB4)
> they support with this member.
> 
> This information will be needed once we start using the new
> Enter_USB message.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  include/linux/usb/typec.h | 6 ++++++
>  1 file changed, 6 insertions(+)

I dropped a few other patches in this series, and stopped here.  If you
could fix up the attribute issue I pointed out and rebase and resend the
reset of these, I'll be glad to take them.

thanks,

greg k-h
