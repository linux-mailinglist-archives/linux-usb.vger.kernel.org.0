Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC09B85EE4
	for <lists+linux-usb@lfdr.de>; Thu,  8 Aug 2019 11:42:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389804AbfHHJmC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Aug 2019 05:42:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:40360 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389800AbfHHJmB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 8 Aug 2019 05:42:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B61422173E;
        Thu,  8 Aug 2019 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565257321;
        bh=Pn6tXfULoIxRtF9yQ/7YXzG+dxzUbzUVdbEIlNQ7PRc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TjPAUJiRRHqJlHNtwcWe8pdTRHxrgS837yF/JTNC+9vC6PPq90OOWRTIVJJOTtnVm
         KlNvomVzIcdiR6HVqAqFzhNC+Dki690sxSVqYKCG5FEdf5/2N2ZRwGxtqGYk4TZRTI
         MbHmpJ/DH9zUiYRAegwAKZSVBUMh+63UNJylggiI=
Date:   Thu, 8 Aug 2019 11:41:58 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Joe Perches <joe@perches.com>
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        devel@driverdev.osuosl.org
Subject: Re: [PATCH] MAINTAINERS: mark wusbcore and UWB as obsolete
Message-ID: <20190808094158.GA22635@kroah.com>
References: <20190806101509.GA11280@kroah.com>
 <b73f09c944625a40b2589e9bac7f8bd22a711ed3.camel@perches.com>
 <20190806113501.GA18443@kroah.com>
 <20190808092509.GA20173@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808092509.GA20173@kroah.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Aug 08, 2019 at 11:25:09AM +0200, Greg Kroah-Hartman wrote:
> Joe rightly points out that we should be using the "Obsolete" status for
> these two subsystems.

Even with that change, I don't see get_maintainers.pl tell me I
shouldn't be sending a patch in for this area:


$ cat x.patch
diff --git a/drivers/staging/uwb/Kconfig b/drivers/staging/uwb/Kconfig
index 259e053e1e09..d9658c46686e 100644
--- a/drivers/staging/uwb/Kconfig
+++ b/drivers/staging/uwb/Kconfig
@@ -3,6 +3,8 @@
 # UWB device configuration
 #

+
+
 menuconfig UWB
        tristate "Ultra Wideband devices"
        default n
$ ./scripts/get_maintainer.pl x.patch
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:STAGING SUBSYSTEM,commit_signer:2/2=100%,authored:1/2=50%)
Thomas Gleixner <tglx@linutronix.de> (commit_signer:1/2=50%,authored:1/2=50%)
devel@driverdev.osuosl.org (open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:)
linux-kernel@vger.kernel.org (open list)


Am I missing something?

thanks,

greg k-h
