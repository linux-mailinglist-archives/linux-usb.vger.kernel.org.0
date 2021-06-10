Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54B7C3A2202
	for <lists+linux-usb@lfdr.de>; Thu, 10 Jun 2021 04:01:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhFJCCs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 22:02:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:35052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhFJCCr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 22:02:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 030C561375;
        Thu, 10 Jun 2021 02:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623290452;
        bh=lBqrLWAlApw3EVZRYfXo7Kd5Atiw3vnof5jp3OpKYJ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n3SfIU+vkqWql3qRyr7h9Q7uHPD8STZ4Op1+Sy27fGFDB5wArimVAHSB3ecp+pEan
         Zycau43ShAC+zdkhAa5Z6ruYfdxNZPYRvBcHhL7v0TeJF8aOyRsgBBfomiQntNSIrK
         mJbWB39ocDt7Z70vBi53WcrXnbZ2/jpqtWWM8YuUlRjDPNCS1k80hIn6e3hztvOn/n
         5fx/fQ9DHGBN8OWXoeM18SwbF1zjYd9pWlq8bJYA4zD2XI7+Ji4k3aZdWcb0MwoBTC
         IvmgZEycXNr0NQxVkcC189IOoXvc2UbjxGQC6pX2xLanJ0RFb2S/ASsC57/yzEMD/l
         hTGWKTkYsqVUw==
Date:   Thu, 10 Jun 2021 10:00:47 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, balbi@kernel.org
Cc:     Jack Pham <jackp@codeaurora.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] usb: dwc3: core: fix kernel panic when do reboot
Message-ID: <20210610020047.GB6592@nchen>
References: <20210608105656.10795-1-peter.chen@kernel.org>
 <20210608164933.GA2601@jackp-linux.qualcomm.com>
 <YMCDU+qoShVvJCGK@kroah.com>
 <YMCNHRLfLPqUhHtu@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YMCNHRLfLPqUhHtu@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-06-09 11:42:53, Greg Kroah-Hartman wrote:
> On Wed, Jun 09, 2021 at 11:01:07AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Jun 08, 2021 at 09:50:01AM -0700, Jack Pham wrote:
> > > Hi Peter,
> > > 
> > > On Tue, Jun 08, 2021 at 06:56:56PM +0800, Peter Chen wrote:
> > > > When do system reboot, it calls dwc3_shutdown and the whole debugfs
> > > > for dwc3 has removed first, when the gadget tries to do deinit, and
> > > > remove debugfs for its endpoints, it meets NULL pointer dereference
> > > > issue when call debugfs_lookup. Fix it by removing the whole dwc3
> > > > debugfs later than dwc3_drd_exit.
> > > 
> > > Ouch, thanks for catching this! I think in your previous reply[1] you
> > > did warn about the debugfs_remove_recursive() getting called twice, but
> > > it seems here the issue is due to the debugfs_lookup() getting called on
> > > a stale dwc->root pointer after it was already removed.
> > 
> > We can also fix this by getting rid of that "root" pointer as it's
> > useless (we can look it up if we need it.)  I'll send a patch later to
> > do that, as it's a good idea to do anyway, and is independant of this
> > fix.
> 
> Now sent:
> 	https://lore.kernel.org/r/20210609093924.3293230-1-gregkh@linuxfoundation.org

Hi Felipe,

With Greg above patch, this issue is fixed indirectly. I don't think my patch is
needed, do you think so?

-- 

Thanks,
Peter Chen

