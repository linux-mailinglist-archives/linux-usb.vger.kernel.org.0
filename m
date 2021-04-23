Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCB136958C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Apr 2021 17:05:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242761AbhDWPFP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Apr 2021 11:05:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:43858 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237082AbhDWPFO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Apr 2021 11:05:14 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF9CA61445;
        Fri, 23 Apr 2021 15:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619190278;
        bh=7TencdSlX53hioFu8369eGmZmQnPM+wigd1PFeOCnO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tKhETt4Cjc0PaZxt9TH6WoXyvqc7+ihEXk2CCOTUIhLV1C1HV34+jhevpp/fqcBTF
         m2Yo11R3ijoXpjKLSbLyGycMuxHQO9z3QOn4OaYfOk5458OaaOvfTxpVUXsfCVvGQN
         f3PV9IzFqA1KAZmVQLRqqog58Zlijz3DvkqpafCk=
Date:   Fri, 23 Apr 2021 17:04:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Marcel Hamer <marcel@solidxs.nl>
Cc:     Marcel Hamer <marcel@solidxs.se>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add missing link states in dwc3 gadget wakeup
Message-ID: <YILiA0MYj1+VPPJN@kroah.com>
References: <20210423132314.361822-1-marcel@solidxs.se>
 <20210423144008.GA1420322@solidxs.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423144008.GA1420322@solidxs.nl>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Apr 23, 2021 at 04:40:08PM +0200, Marcel Hamer wrote:
> Hello,
> 
> I would like to add that I do not have the dwc3 documentation myself,
> given it is not publically available. I deduced the patch from active 
> debugging on my system.
> 
> Please let me know if DWC3_LINK_STATE_U1 and DWC3_LINK_STATE_U2 should
> either be removed from the 'needs_wakeup =' line instead. Or if
> something else is off with the proposed patch.

When submitting patches, please use scripts/get_maintainers.pl to know
who to cc: so that they know to pay attention to your commit.  Care to
do that again here and resend it?

Also, you might want to change your subject line to match up with others
for this driver:
	[PATCH] USB: dwc3: add missing link...

thanks,

greg k-h
