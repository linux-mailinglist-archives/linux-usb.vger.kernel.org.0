Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 290993FE9FA
	for <lists+linux-usb@lfdr.de>; Thu,  2 Sep 2021 09:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243208AbhIBH2i (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Sep 2021 03:28:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:32850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233360AbhIBH2h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 2 Sep 2021 03:28:37 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 69A1061056;
        Thu,  2 Sep 2021 07:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630567659;
        bh=BQEO6iAGBujUk9zEpPpaFwDP0lXVjL5LTTeEYIopO0g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rCrNtAzskgmn/nzj24rGr+FRAbwpITML2oHjJIr3d890c8GGm1fQJGM0IUa0s+A+Y
         PtBArNP11R3d9gxQro0qBx21sm09onT9ovHzwofzxdYGMnEtSS8nI5m2nlPETTIZyQ
         ZEX/PPoKtrp+ZWnGePdImMgvl6KAUHyIuEIxpPIKzO+O55OFBQHGfFNivxE+AM44ns
         ZMNuG9kwX1cH0eHRWtRfC9ULf/YQ3RQfLoX9A5zUIoBG3ysqrHNzCZ3DjaWPG3MkkF
         yCtNJGd8SqYdoLCHAxc9zNy8+O1T1bGlIA/CY30VbJKSIGSK7BYrcpZREjsg5jt5rE
         DzV5HVO1K9Tbg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mLh8E-00039Z-Cw; Thu, 02 Sep 2021 09:27:30 +0200
Date:   Thu, 2 Sep 2021 09:27:30 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.15-rc1
Message-ID: <YTB84mJbbae9vAc4@hovoldconsulting.com>
References: <YS4A7ZJYrhRXb+PN@hovoldconsulting.com>
 <YS+LqqKnyQzS/fCY@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YS+LqqKnyQzS/fCY@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 01, 2021 at 04:18:18PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 31, 2021 at 12:14:05PM +0200, Johan Hovold wrote:

> > USB-serial updates for 5.15-rc1
> > 
> > Here are the USB serial updates for 5.15-rc1, including:
> > 
> >  - a couple of fixes for cp210x termios error handling
> >  - retrieval of fw revisions for more cp210x types
> >  - a switch to octal permissions for all module-parameter definitions
> > 
> > Included are also various clean ups.
> > 
> > All have been in linux-next with no reported issues.
> > 
> 
> Ugh, this was late, I'll pull this in after Linus takes the request I
> just sent him...

Sorry about that. I wanted to include the late pl2303 fix to make sure
it made it into -rc1, but in the end I sent that one separately to avoid
a back merge.

Johan
