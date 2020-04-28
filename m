Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9C551BB9CB
	for <lists+linux-usb@lfdr.de>; Tue, 28 Apr 2020 11:26:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgD1J0w (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Apr 2020 05:26:52 -0400
Received: from nimbus1.mmprivatehosting.com ([54.208.90.49]:46592 "EHLO
        nimbus1.mmprivatehosting.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726540AbgD1J0w (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Apr 2020 05:26:52 -0400
Received: from localhost (localhost [127.0.0.1])
        by nimbus1.mmprivatehosting.com (Postfix) with ESMTP id A74FB60036;
        Tue, 28 Apr 2020 09:26:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at mmprivatehosting.com
Received: from dave.mielke.cc (CPE74dada261772-CMac202ebc50a0.cpe.net.cable.rogers.com [174.115.199.202])
        (Authenticated sender: relay@dave.mielke.cc)
        by nimbus1.mmprivatehosting.com (Postfix) with ESMTPA;
        Tue, 28 Apr 2020 09:26:50 +0000 (UTC)
Received: from beta.private.mielke.cc (beta.private.mielke.cc [192.168.0.2])
        by dave.mielke.cc (Postfix) with ESMTPS id 9585E449;
        Tue, 28 Apr 2020 05:26:50 -0400 (EDT)
Received: from beta.private.mielke.cc (localhost [127.0.0.1])
        by beta.private.mielke.cc (8.15.2/8.15.2) with ESMTP id 03S9QoTE019739;
        Tue, 28 Apr 2020 05:26:50 -0400
Received: (from dave@localhost)
        by beta.private.mielke.cc (8.15.2/8.15.2/Submit) id 03S9QnRf019738;
        Tue, 28 Apr 2020 05:26:49 -0400
Date:   Tue, 28 Apr 2020 05:26:49 -0400
From:   Dave Mielke <Dave@mielke.cc>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org,
        Samuel Thibault <Samuel.Thibault@ens-lyon.org>,
        Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Writing to /sys/../power/autosuspend when not root.
Message-ID: <20200428092649.GI756@beta.private.mielke.cc>
References: <20200426190838.GU756@beta.private.mielke.cc>
 <20200427103009.GA2362731@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200427103009.GA2362731@kroah.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[quoted lines by Greg KH on 2020/04/27 at 12:30 +0200]

>Have a udev rule that turns autosuspend off for each specific USB device
>that you know does not work with autosuspend.  

Yes, thanks, that should work. I have another question, though. Our code first
tries to write "-1" to power/autosuspend, and then, if that fails, it writes
"0". I'm guessing that "-1" was an older way (but I've forgotten). How can a
udev rule be written to accommodate that?

-- 
I believe the Bible to be the very Word of God: http://Mielke.cc/bible/
Dave Mielke            | 2213 Fox Crescent | WebHome: http://Mielke.cc/
EMail: Dave@Mielke.cc  | Ottawa, Ontario   | Twitter: @Dave_Mielke
Phone: +1 613 726 0014 | Canada  K2A 1H7   |
