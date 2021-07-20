Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35B253CFF01
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jul 2021 18:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232411AbhGTPd7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Jul 2021 11:33:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:52530 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236236AbhGTPag (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 20 Jul 2021 11:30:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A368361029;
        Tue, 20 Jul 2021 16:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1626797473;
        bh=shuvhdstA+zuGkmTGIOK6QDoTA45s7Ax/e8raBoTUMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ASoLJdpXqio32jBylXJxFNO7s7sy7DGUo94KpHL4yB/4ulCdiAmyd6uLH+gXmaqWi
         eEuXXTh4GQ6LMO6ekf+uRYJDDLXpiNPHxEEn8r4gGepQKLFsBYlL2znUNAQQHDTc7Q
         iRdEY5f7bRfB2/iwuAF9OIkV04CgZttpQEEhaxBU=
Date:   Tue, 20 Jul 2021 18:11:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: Possible race in 4.14 xhci stack
Message-ID: <YPb1ngCpsEizHtUi@kroah.com>
References: <513f81d8c17b4bcb97a60fd1d5b0738f@SVR-IES-MBX-03.mgc.mentorg.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <513f81d8c17b4bcb97a60fd1d5b0738f@SVR-IES-MBX-03.mgc.mentorg.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 20, 2021 at 03:04:44PM +0000, Schmid, Carsten wrote:
> Hi Mathias,
> 
> i got a NULL pointer deref in the usbfs and analyzed it.
> The connected device seemed to have trouble on USB transmissions.
> However, I have the impression that there is a race between finishing URB handling and disconnection of devices.
> In detail:
> [ 4979.029666] xhci_hcd 0000:00:15.0: USB transfer error. Maybe the USB cable is bad?

Did your cable die?

And 4.14 is quite old, what about 5.13?

thanks,

greg k-h
