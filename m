Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25E6C20B930
	for <lists+linux-usb@lfdr.de>; Fri, 26 Jun 2020 21:16:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725958AbgFZTQj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Jun 2020 15:16:39 -0400
Received: from netrider.rowland.org ([192.131.102.5]:45993 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725780AbgFZTQj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Jun 2020 15:16:39 -0400
Received: (qmail 307998 invoked by uid 1000); 26 Jun 2020 15:16:38 -0400
Date:   Fri, 26 Jun 2020 15:16:38 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     bugzilla-daemon@bugzilla.kernel.org
Cc:     linux-usb@vger.kernel.org
Subject: Re: [Bug 208307] New: Alcor Micro Corp. Multi Flash Reader
 [058f:6366] keeps being detected and removed continuously
Message-ID: <20200626191638.GB306201@rowland.harvard.edu>
References: <bug-208307-208809@https.bugzilla.kernel.org/>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bug-208307-208809@https.bugzilla.kernel.org/>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 24, 2020 at 05:05:49AM +0000, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208307
> 
>             Bug ID: 208307
>            Summary: Alcor Micro Corp. Multi Flash Reader [058f:6366] keeps
>                     being detected and removed continuously
>            Product: Drivers
>            Version: 2.5
>     Kernel Version: 5.8-rc2

> We have a laptop equipped with AMD Ryzen 5 4500U with Radeon Graphics.  The
> Alcor Micro Corp. Multi Flash Reader keeps being detected and removed
> continuously.  Then, once the storage modules try to access it, there will be
> the failure.  These messages keep showing up like floods in the kernel message
> log.

Try disabling Link Power Management for this device:

   echo 058f:6366:k >/sys/module/usbcore/parameters/quirks

Alan Stern
