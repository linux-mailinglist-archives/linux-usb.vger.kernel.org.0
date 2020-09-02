Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFB425AD5F
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 16:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726984AbgIBOid (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 10:38:33 -0400
Received: from netrider.rowland.org ([192.131.102.5]:51955 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727950AbgIBOiM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 10:38:12 -0400
Received: (qmail 624190 invoked by uid 1000); 2 Sep 2020 10:38:11 -0400
Date:   Wed, 2 Sep 2020 10:38:11 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jean-Francois Pirus <jfp@clearfield.com>
Cc:     usb-storage@lists.one-eyed-alien.net, linux-usb@vger.kernel.org
Subject: Re: copy/paste error in unusual_uas.h  from commit bc3bdb1
Message-ID: <20200902143811.GA622814@rowland.harvard.edu>
References: <8b0d02a71c781c1325a491f6450df0876d724d85.camel@clearfield.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8b0d02a71c781c1325a491f6450df0876d724d85.camel@clearfield.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 05:14:12PM +1200, Jean-Francois Pirus wrote:
> Looks like a copy/paste error from the previous entry.

It may look like a copy-paste error, but it isn't.  You can tell if you 
go back and read the emails that led up to this commit.

> patch:
> 
> --- unusual_uas.h.org	2020-09-02 17:00:32.295919812 +1200
> +++ unusual_uas.h	2020-09-02 17:01:02.596173298 +1200
> @@ -69,7 +69,7 @@
>  /* Reported-by: David Kozub <zub@linux.fjfi.cvut.cz> */
>  UNUSUAL_DEV(0x152d, 0x0578, 0x0000, 0x9999,
>  		"JMicron",
> -		"JMS567",
> +		"JMS578",
>  		USB_SC_DEVICE, USB_PR_DEVICE, NULL,
>  		US_FL_BROKEN_FUA),

The same entry is present in unusual_devs.h (as you would see if you had 
read the original commit).  How come you didn't change that one as well?

Alan Stern
