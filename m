Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A11FC71877
	for <lists+linux-usb@lfdr.de>; Tue, 23 Jul 2019 14:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387888AbfGWMpB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Jul 2019 08:45:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:54934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731264AbfGWMpA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 23 Jul 2019 08:45:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1ECE621903;
        Tue, 23 Jul 2019 12:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563885899;
        bh=ezXGuaPyEFYREjCYhTlxVrdBje5JuIzTolgw4Ncxxwk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bg2uhVX4Vy8OUzLqnSPO895uU72v5XVTje6+ks+7reHyN10B/GOh6FfIy0cyBioCn
         PZ8IO9P46cmsrp758LKZ2o+AT+lKyHTjCk3HQ5bktEV9Me+KVMVlgEiIEMo2cuPhzL
         0Kv4BaCtFS+LrJa8pYj2qtwLLBP+Sovi8Cfr7EQk=
Date:   Tue, 23 Jul 2019 14:44:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Bergmann <frank.bergmann@project-open.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: High-Impact: xhci_hid - "Not enough bandwidth for new device
 state"
Message-ID: <20190723124457.GB5356@kroah.com>
References: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27f21154-659d-67b5-ac90-b931695614c8@project-open.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 23, 2019 at 02:31:18PM +0200, Frank Bergmann wrote:
> Dear Linux-USB,
> 
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1411604
> 
> - This bug is around since 5 years.
> 
> - Severity: High
> 
> - "It's not Fedora specific, it's linux in general"
> 
> 
> There are 671 results in Google for 'USB "Not enough bandwidth for new
> device state"'. Why does nobody take this on?

Because there's not much to be done here.  You are trying to add a
device to the USB bus that is asking for more bandwidth than the bus
currently can provide.  So we fail the device addition.  What are we
supposed to do instead?

> 
> 
> I offer to send you or whoever a Logitech C922 WebCam if it accelerates the
> process :-)
> 
> 
> The bug basically keeps people from using a USB 3.0 WebCam in parallel to
> some virtual machine Audio. This means it will affect any "professional"
> users who need to do GoToMeeting or WebEx together with running a Windows
> VM.

Why do you say that?  Many people have that configuration working just
fine.  Personally I have a ton of USB devices all plugged into one USB 3
port running at the same time (webcam, audio devices, keyboard, mouse)
and video conferences work just fine with that.

Try plugging the device into a separate USB root hub and you should be
fine, as we can't do the impossible here (get extra bandwidth than what
is present on the system).

thanks,

greg k-h
