Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 831D846CB34
	for <lists+linux-usb@lfdr.de>; Wed,  8 Dec 2021 03:52:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234803AbhLHC4B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 21:56:01 -0500
Received: from netrider.rowland.org ([192.131.102.5]:38877 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S234660AbhLHC4B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 21:56:01 -0500
Received: (qmail 557419 invoked by uid 1000); 7 Dec 2021 21:52:29 -0500
Date:   Tue, 7 Dec 2021 21:52:29 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: Why no SG support for isoc
Message-ID: <YbAd7eLQZVxptLDN@rowland.harvard.edu>
References: <e58d3323-eb21-5c59-daa8-230b91082748@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e58d3323-eb21-5c59-daa8-230b91082748@synopsys.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 07, 2021 at 10:24:41PM +0000, Thinh Nguyen wrote:
> Hi,
> 
> I came across this change fe2072cc1768 ("usb/hcd: Ensure scatter-gather
> is not used for isoc transfers") and wonder why it was made. The
> description doesn't explain much. I was trying to look for the archived
> conversation about this but couldn't find it.
> 
> Can someone help explain why we enforce this to all hosts? Or help point
> to the archived conversation with the full explanation?

I don't remember the details; it was nine years ago.  However, you can find the 
email thread for the original patch submission here:

	https://marc.info/?t=134122051600006&r=1&w=2

The discussion leading up to it apparently started here:

	https://marc.info/?l=linux-usb&m=134098509628768&w=2

Alan Stern
