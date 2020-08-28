Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9542555A8
	for <lists+linux-usb@lfdr.de>; Fri, 28 Aug 2020 09:51:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728447AbgH1HvW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Aug 2020 03:51:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:43770 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726571AbgH1HvW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Aug 2020 03:51:22 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3533720DD4;
        Fri, 28 Aug 2020 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598601081;
        bh=nHfcNvFcGy0qLdNgixAYhYUIArmvDA3arVbjtShW7G4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CYjrXm5SQKf8uOhUZenj7n5NvTOj7LkBjlgEMw9YJLItGdUdrdc8394U5jdTVG5Pj
         V6t2GM/us0va0HZ2uSgwNRhaS6zCD9J6FQ8pM8BLYmFAYS4fkaL15G18Lc22M1PF7O
         51fWGYAJokDuAUn1bt75WXW7jOTB6KsRUU+TkrGU=
Date:   Fri, 28 Aug 2020 09:51:34 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH v1] usb: hcd: convert tasklets to use new tasklet_setup()
 API
Message-ID: <20200828075134.GB993816@kroah.com>
References: <20200819100826.69716-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200819100826.69716-1-andriy.shevchenko@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Aug 19, 2020 at 01:08:26PM +0300, Andy Shevchenko wrote:
> In preparation for unconditionally passing the struct tasklet_struct
> pointer to all tasklet callbacks, switch to using the new tasklet_setup()
> and from_tasklet() to pass the tasklet pointer explicitly.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Does not apply to my tree as I think someone already did all of these
conversions.

thanks,

greg k-h
