Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A5CD26BF71
	for <lists+linux-usb@lfdr.de>; Wed, 16 Sep 2020 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgIPIgi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Sep 2020 04:36:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37276 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726592AbgIPIgf (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Sep 2020 04:36:35 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0741520795;
        Wed, 16 Sep 2020 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600245394;
        bh=xeEOPUM/m0tdOvTmc/vGWX+UjwQvGGKXHGQgLj/4HpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XfYZgbdmR9jb7pgdlnq5n31S/jwJ5Qo6AfxozcGXDgDJR5oNkDBjWYtz87oVK6qQC
         VipAbL0SNx4xo+qZz6qNKEm7gV9ZM1y+Ql3dR8XugZbziJ7nUF8Jr1sMHtQTJdHiya
         UzlwnGIpIMc+CJ2E5zu5Nw4r9LN/YcjiK3KVKeN8=
Date:   Wed, 16 Sep 2020 10:37:09 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     "Mani, Rajmohan" <rajmohan.mani@intel.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] USB Type-C fixes
Message-ID: <20200916083709.GA676008@kroah.com>
References: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916081617.17146-1-heikki.krogerus@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 16, 2020 at 11:16:12AM +0300, Heikki Krogerus wrote:
> Hi,
> 
> There are two fixes for the UCSI drivers that address issues related
> to the alternate modes. The other three fixes are for the PMC mux
> driver. We were missing dependency on ACPI and the port number that
> was used with the IOM was incorrect.
> 
> Let me know if you want anything to be changed.

This seems to be a mix of patches to be sent to Linus for 5.9-final and
some for 5.10-rc1, right?

Can you resend these as two series so I know which one is which?

thanks,

greg k-h
