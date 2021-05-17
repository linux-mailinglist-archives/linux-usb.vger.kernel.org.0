Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8A463822A3
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 04:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhEQCBc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 16 May 2021 22:01:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:39498 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229486AbhEQCBb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 16 May 2021 22:01:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A3F436109F;
        Mon, 17 May 2021 02:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621216815;
        bh=EnX+8Y6JrEMaUk8LyKbgbeZOzWeWSa6yVUdqKeblB2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kX0V0QdDWn5/qx818FV/bZG89wPSVtcE4WxkYJZ0vY1lhMqgt/sUFeJGpGecToWDz
         y4f77TMHGNrsjhbSarIF2wKZf9+ICaOBFNAlzSh5c+0UnP5uqWeW5rWoITVkCzGN85
         cH5U9MFwYeSJSWTHUHEuc/BYvNWugBGlAStefOLvfp2LIWCs80xen+WEr0TZaho+1M
         sZp9lrjUDNvJk9dNo9T2NsR/8BaM92DOh0TSeaL4m6BkfW8wcEnTnxLtI2A7cYPVkv
         CKRuOFuSfDwb8klSheNRZzQ0r3/mVVncHmNSU8xTcu7fuasvekfTwOIpNK9fkYz8g5
         9dML1drlO7rJQ==
Date:   Mon, 17 May 2021 10:00:10 +0800
From:   Peter Chen <peter.chen@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: Disconnect race in Gadget core
Message-ID: <20210517020010.GA28030@nchen>
References: <87r1idfzms.fsf@kernel.org>
 <20210511212651.GA914027@rowland.harvard.edu>
 <87lf8kfnc6.fsf@kernel.org>
 <20210512153358.GC934575@rowland.harvard.edu>
 <87bl9d7oo0.fsf@kernel.org>
 <20210514165830.GA1010288@rowland.harvard.edu>
 <875yzk7b2y.fsf@kernel.org>
 <20210515153113.GB1036273@rowland.harvard.edu>
 <8735un6mjl.fsf@kernel.org>
 <20210516145151.GC1060053@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516145151.GC1060053@rowland.harvard.edu>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 21-05-16 10:51:51, Alan Stern wrote:
> On Sun, May 16, 2021 at 12:43:58PM +0300, Felipe Balbi wrote:
> > 
> > Hi,
> > 
> > Alan Stern <stern@rowland.harvard.edu> writes:
> > >
> > > If it's okay to call those functions in interrupt context then the 
> > > kerneldoc definitely should be updated.  However, I don't see why you 
> > > would want to make DELAYED_STATUS mandatory.  If all the necessary work 
> > > can be done in the set_alt handler, why not return the status 
> > > immediately?
> > 
> > because we avoid a special case. Instead of having magic return value to
> > mean "Don't do anything until I enqueue a request" we can just make that
> > an assumption, i.e. gadget driver *must* enqueue requests for data and
> > status stages.
> 
> Okay.  But that would require auditing every gadget/function driver to 
> ensure that they _do_ enqueue status stage requests

CDNS3 UDC doesn't enqueue status stage by SW, instead, SW tells HW to do
it by setting registers.

-- 

Thanks,
Peter Chen

