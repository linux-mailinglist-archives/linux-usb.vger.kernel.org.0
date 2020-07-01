Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1CD210ABD
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 14:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730230AbgGAMHN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 08:07:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:50120 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730103AbgGAMHM (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 08:07:12 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4B91720772;
        Wed,  1 Jul 2020 12:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593605231;
        bh=hcRTSiXNQDMY4O20u5f4vx6gJMANhnYsgruU6YGcqIw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sGzJ6L6buKY/BOqIT+WZhOWzfHZnxQz6KM+Y62oxxLTcfLym90o2Y30sA/bG8JaeY
         LrOVKI4XpGlJPzHOg/gGryNY04gG8/7yJs39kuDI4I5D7V2mpFTurdH8gpiSMvlQ3I
         i0BEUhf81n8vjh+8uhMl3lt7srPk1I6HnlaB/BwA=
Date:   Wed, 1 Jul 2020 14:06:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Prashant Malani <pmalani@chromium.org>,
        Benson Leung <bleung@chromium.org>,
        "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/4] usb: typec: USB4 support to the Intel PMC mux driver
Message-ID: <20200701120654.GA2236226@kroah.com>
References: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701115618.22482-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 02:56:14PM +0300, Heikki Krogerus wrote:
> Hi Greg,
> 
> These include a couple of USB4 related improvements to the USB Type-C
> class on top of the driver change.
> 
> FYI. I will be on vacation starting from next week (July 6th).

All look good, thanks, enjoy your vacation!

greg k-h
