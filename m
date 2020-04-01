Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60C4619AE36
	for <lists+linux-usb@lfdr.de>; Wed,  1 Apr 2020 16:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732890AbgDAOnT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Apr 2020 10:43:19 -0400
Received: from netrider.rowland.org ([192.131.102.5]:38923 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726640AbgDAOnT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Apr 2020 10:43:19 -0400
Received: (qmail 24159 invoked by uid 500); 1 Apr 2020 10:43:18 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 1 Apr 2020 10:43:18 -0400
Date:   Wed, 1 Apr 2020 10:43:18 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Felipe Balbi <balbi@kernel.org>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/7] Universal Serial Bus: Removing Acronyms
In-Reply-To: <87pncr1wgn.fsf@kernel.org>
Message-ID: <Pine.LNX.4.44L0.2004011036470.22914-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 1 Apr 2020, Felipe Balbi wrote:

> 
> Hi,
> 
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> writes:
> > On Wed, Apr 01, 2020 at 10:32:42AM +0300, Felipe Balbi wrote:
> >>  764 files changed, 86304 insertions(+), 86304 deletions(-)
> >
> > Ah, a nice tiny patchset, I'll try to sneak this in during the merge
> > window now :)
> 
> That's great, Greg. It'll help hundreds of people, I'm sure.
> 
> > nice job...
> 
> Thank you

Yes indeed.  Not to mention the admirable side effect of increasing the
amount of exercise our fingers will get in the future while we write
patches and new drivers.  And a wonderful example of how a sizable
_increase_ in the total size of the kernel source can lead to a
_decrease_ in confusion for readers.

(Plus this is a great illustration of how consistently violating the
80-column rule can be justifiable under the right circumstances.)

Alan Stern

