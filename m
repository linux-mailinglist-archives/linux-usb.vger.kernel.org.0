Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE4B4375557
	for <lists+linux-usb@lfdr.de>; Thu,  6 May 2021 16:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234356AbhEFODF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 May 2021 10:03:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:38304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234188AbhEFODE (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 6 May 2021 10:03:04 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B7FE66109E;
        Thu,  6 May 2021 14:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1620309726;
        bh=GIpP3+VqorHkqCqkLkYkKoUFBTP3tEE2nwLX2gA8SKM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=grobgc5X9IIX8ZcyNpKNLH1QrgYzkLKMySwdMVzEdErhqS1AeKvK6NsM9MGdbGsLS
         7gJSJR7knI+a/q7rXF3YNxywzuhDowS9KtL06VhUsUGHnUeP1Pjxxy+aa3ht24eTOs
         SGwlQc/T3k/rZT3FBqEBoD19x4RhNypmHTa2b89M=
Date:   Thu, 6 May 2021 16:02:03 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Rui Miguel Silva <rui.silva@linaro.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/7] usb: isp1760: extend support for isp1763
Message-ID: <YJP225qBXYtmWKQk@kroah.com>
References: <20210504101910.18619-1-rui.silva@linaro.org>
 <YJPJ3aKf9BdQ8UKx@kroah.com>
 <YJPgO6TPyuY0w0EH@pendragon.ideasonboard.com>
 <CB67F1ESC5PY.3UAAKCJRWDQ3N@arch-thunder>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CB67F1ESC5PY.3UAAKCJRWDQ3N@arch-thunder>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 06, 2021 at 02:41:14PM +0100, Rui Miguel Silva wrote:
> Hi Greg,
> On Thu May 6, 2021 at 1:25 PM WEST, Laurent Pinchart wrote:
> > Hi Greg,
> >
> > On Thu, May 06, 2021 at 12:50:05PM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, May 04, 2021 at 11:19:03AM +0100, Rui Miguel Silva wrote:
> > > > The Arm MPS3 FPGA prototyping board [0] have an isp1763 [1] as USB controller.
> > > > There is already support for the isp1760 and isp1761 in tree, this series extend
> > > > the support also for the isp1763.
> > > > 
> > > > Move register access using regmap, remove some platform data and code, refactor
> > > > the mempool, use dr_mode to align to existing bindings, then add the support for
> > > > isp1763 host mode, add bindings files that did not existed and at the end
> > > > add also support for peripheral mode for isp1763.
> > > > 
> > > > @Laurent and @Sebastian, I add both of you in the bindings files as maintainers
> > > > (it is a mandatory field)since you were the ones which contributed with the
> > > > initial code and peripheral code, let me know if you are ok with it.
> > > > If yes I may send a follow up to add also entries in MAINTAINERS file that it is
> > > > also missing.
> > > 
> > > First 3 patches now applied, feel free to rebase and resend the rest
> > > based on the review comments.
> >
> > That's a bit fast, I've just review 1/7.
> 
> Let me know if you will drop the patches from your queue, or do you
> want me to send some follow up, since Laurent comments are not very
> large?

Follow-up is fine :)

thanks,

greg k-h
