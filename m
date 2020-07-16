Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5822227D0
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 17:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729146AbgGPPu4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 11:50:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:55838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728126AbgGPPu4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jul 2020 11:50:56 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 722FA2064B;
        Thu, 16 Jul 2020 15:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594914655;
        bh=OCMxhLnXRaeXDmROlcl9wRF+OvWAAfeYkk5gMZk/6RA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jVJcoshaO47GDTUxfsuwBt4pit+03foN2V4E+FhyGC+2Y5VcXBezfAPFnoW+mM0W/
         sPw19YucCeIY1rd28OPIdDBPfhCGxnRGiDjATlNfk9XoO5cDtgqjkUzOSjB/JxwUHi
         yK8UlHh+rlGwhb9LDaLDZz9d6L89sPcPMHrGgfGo=
Date:   Thu, 16 Jul 2020 17:50:49 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] USB-serial fixes for 5.8-rc6
Message-ID: <20200716155049.GA2379294@kroah.com>
References: <20200716083226.GA19339@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716083226.GA19339@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 10:32:26AM +0200, Johan Hovold wrote:
> Hi Greg,
> 
> Here's a fix for 5.8 that should go to Linus this week.

Pulled and pushed out, thanks.

greg k-h
