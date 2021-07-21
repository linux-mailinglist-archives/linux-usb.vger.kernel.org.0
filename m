Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5ACE43D0A8C
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 10:32:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236081AbhGUHlV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 03:41:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:45004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236203AbhGUHdy (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 21 Jul 2021 03:33:54 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id F24B86120A;
        Wed, 21 Jul 2021 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626855270;
        bh=Sqk0aw/9yPQ0gihqpyggkslRRYeNGEMCjglx1qWoSF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iFlSEa3TK6B9ICib5Q8n9V4mClnxKaRh11sQ11B8PM9JgaPBM28fPT3q4OzOutuR8
         NlgBDbBtcVsw646A/RDFh4gBlsvJQzTzw1EgXIitLC17DSUjGt03gogawNaD5UQNr5
         87lkY95wZ7MabY9pzALyH2nwfWJiXYFvuhF8h+s0=
Date:   Wed, 21 Jul 2021 10:14:28 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Possible race in 4.14 xhci stack
Message-ID: <YPfXZBtd48oL7DaQ@kroah.com>
References: <513f81d8c17b4bcb97a60fd1d5b0738f@SVR-IES-MBX-03.mgc.mentorg.com>
 <YPb1ngCpsEizHtUi@kroah.com>
 <2c52cd176b134e6ab7806aeda8fcca1d@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c52cd176b134e6ab7806aeda8fcca1d@SVR-IES-MBX-03.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 21, 2021 at 07:51:58AM +0000, Schmid, Carsten wrote:
> Hi Greg,
> 
> >> Hi Mathias,
> >>
> >> i got a NULL pointer deref in the usbfs and analyzed it.
> >> The connected device seemed to have trouble on USB transmissions.
> >> However, I have the impression that there is a race between finishing URB handling and disconnection of devices.
> >> In detail:
> >> [ 4979.029666] xhci_hcd 0000:00:15.0: USB transfer error. Maybe the USB cable is bad?
> >
> > Did your cable die?
> >
> > And 4.14 is quite old, what about 5.13?
> >
> > thanks,
> >
> > greg k-h
> 
> That was reported from a device in the field.
> Yes, a defective cable is bad, but shouldn't the kernel's health avoid a NULL pointer deref?

Yes, I am not disagreeing about that, patches always welcome :)

thanks,

greg k-h
