Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB033107E0
	for <lists+linux-usb@lfdr.de>; Fri,  5 Feb 2021 10:31:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbhBEJaM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 5 Feb 2021 04:30:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35340 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230484AbhBEJ1N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 5 Feb 2021 04:27:13 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7109E64FBB;
        Fri,  5 Feb 2021 09:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1612517192;
        bh=0oCayZYiMEnz10eSMk33EJVBfDRkEJ/U8AfnlYuWt+Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x4/8dWY709bxPYw9fe+YKJBTtmdnMbs58eOV+JlGBw06GKmRX7mOXHhjwVxyqI5oB
         2sCg4IEktwpDp07qLxoPDSdFEAIXzQk7PynIEHxRpwkcRtixVosm1jSWpJavuug5io
         sDed1y3x01IZhPCMRqf4dCe9TUQOPkHJetZh4pYk=
Date:   Fri, 5 Feb 2021 10:26:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH] usb: dwc3: gadget: Remove check for bounded driver
Message-ID: <YB0PRf9H2erqMGB6@kroah.com>
References: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7077bb0f5691732b9814ea76d38ae8e9312a61f5.1612412038.git.Thinh.Nguyen@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 03, 2021 at 08:14:37PM -0800, Thinh Nguyen wrote:
> The check for bounded gadget driver in dwc3_gadget_start() was to
> prevent going through the initialization again without any cleanup. With
> a recent update, the UDC framework guarantees this won't happen while
> the UDC is started. Also, this check doesn't prevent requesting threaded
> irq to the same dev_id, which will mess up the irq freeing logic. Let's
> remove it.

What "recent update" caused this?  Is this a fix for something that
needs to be backported?  If so, can you provide a "Fixes:" tag on here?
Or is this just a general cleanup that is good to do now.

thanks,

greg k-h
