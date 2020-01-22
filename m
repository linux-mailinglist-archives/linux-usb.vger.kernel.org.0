Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25D3E144E7C
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 10:16:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgAVJQp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 04:16:45 -0500
Received: from mail.kernel.org ([198.145.29.99]:33482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729195AbgAVJQo (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 04:16:44 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 83CDB24655;
        Wed, 22 Jan 2020 09:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579684604;
        bh=hvk+tD/3VhwOAtY5cy8+p3bDb3HogumdFfcWJYY1nT8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QpKICW4X2MMDYAoBeuisEc2vsOPu5x38SthNZo4KjuXDJJyz2JGP1GT4vLYT7Ox2B
         8rUQmYS7EsxMSRViBpRwNzaDS7gUZr+4wgeUjS0pCWb2V8TcTeDzVbXTngp2ESKZ7E
         lN/qeI56p8loqWc+vw8gWLwETe4ERF8QsBbHevGc=
Date:   Wed, 22 Jan 2020 10:16:41 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Thomas Hebb <tommyhebb@gmail.com>, linux-kernel@vger.kernel.org,
        linux-stable@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/2] usb: typec: fusb302: fix "op-sink-microwatt"
 default that was in mW
Message-ID: <20200122091641.GA2697963@kroah.com>
References: <0eac53c4878423a9abd49d2142fe4cb1136db4e2.1579529138.git.tommyhebb@gmail.com>
 <c497958a1b0d8e3421c5eda46abddba6651cec1e.1579529138.git.tommyhebb@gmail.com>
 <20200122090820.GA2643799@kroah.com>
 <20200122091202.GA22653@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122091202.GA22653@kuha.fi.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 11:12:02AM +0200, Heikki Krogerus wrote:
> On Wed, Jan 22, 2020 at 10:08:20AM +0100, Greg Kroah-Hartman wrote:
> > On Mon, Jan 20, 2020 at 06:05:41AM -0800, Thomas Hebb wrote:
> > > commit 8f6244055bd3 ("usb: typec: fusb302: Always provide fwnode for the
> > > port") didn't convert this value from mW to uW when migrating to a new
> > > specification format like it should have.
> > > 
> > > Fixes: 8f6244055bd3 ("usb: typec: fusb302: Always provide fwnode for the port")
> > > Cc: linux-stable@vger.kernel.org
> > 
> > Nit, there is no such address :)
> 
> Thomas already fixed the address in v3.

Now see that series and queued it up, thanks.

greg k-h
