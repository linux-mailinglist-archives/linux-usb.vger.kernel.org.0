Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88A923A2496
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 08:37:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230106AbhFJGjc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Jun 2021 02:39:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:35692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229792AbhFJGjc (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Jun 2021 02:39:32 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A04A1613DF;
        Thu, 10 Jun 2021 06:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623307055;
        bh=c6XuiGRrMxEn9EK3yNEORuo3dLeVk867t8/lnjEZuQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hBjjoP/46sg3RECnjJ4l1ZbObZcyf7xKmtT/FZRlmp4DaS5KBSS1QL6JMqMYxfFLo
         909MDbU0KdrKwRKtr1ADfFxetRJjKMdsIfHKsJS6h/qT+JuoponxL2Cbk0dxJ6gxp8
         lXYybvpv3rieeQgdjub6P8eMeds1mGoTkFr9B7Ec=
Date:   Thu, 10 Jun 2021 08:36:57 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     balbi@kernel.org, Jack Pham <jackp@codeaurora.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <YMGzCWCI1R9jvaor@kroah.com>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com>
 <YMCNHRLfLPqUhHtu@kroah.com>
 <20210610020047.GB6592@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210610020047.GB6592@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 10, 2021 at 10:00:47AM +0800, Peter Chen wrote:
> On 21-06-09 11:42:53, Greg Kroah-Hartman wrote:
> > On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> > > > Hi Peter,
> > > > 
> > > > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> > > > > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> > > > > for dwc3 has removed first, when the gadget tries to do deinit, and
> > > > > remove debugfs for its endpoints, it meets NULL pointer dereference
> > > > > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> > > > > debugfs later than dwc3_drd_exit.
> > > > 
> > > > Ouch, thanks for catching this! I think in your previous reply[1] you
> > > > did warn about the debugfs_remove_recursive() getting called twice, but
> > > > it seems here the issue is due to the debugfs_lookup() getting called on
> > > > a stale dwc->root pointer after it was already removed.
> > > 
> > > We can also fix this by getting rid of that "root" pointer as it's
> > > useless (we can look it up if we need it.)  I'll send a patch later to
> > > do that, as it's a good idea to do anyway, and is independant of this
> > > fix.
> > 
> > Now sent:
> > 	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org
> 
> Hi Felipe,
> 
> With Greg above patch, this issue is fixed indirectly. I don't think my patch is
> needed, do you think so?

Which patch is "your patch" here?

thanks,

greg k-h
