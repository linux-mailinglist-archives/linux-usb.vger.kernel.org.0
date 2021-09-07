Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC5E44026CE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Sep 2021 12:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244540AbhIGKJC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Sep 2021 06:09:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:51068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244488AbhIGKI7 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Sep 2021 06:08:59 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4052D6103B;
        Tue,  7 Sep 2021 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1631009273;
        bh=+rTMnNRtWYxCobMgvXyMT1FgdAV9c5G1Ihd3RSQuPMg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BGHOQT6FM8L5fFp/XsjmbcgW0Rh1558PlC/Py2N81EspQ17yfJn3EZLGCyPcbNian
         xAK8hNpVgBhExTEfxun3lfU2/1X2Y/VtWNwypjYfZK8076f6y7X1rF/2s+LtjrIdD0
         KvTtItpO2JREbY3WULxLtJWtRc3h3+FiBfJYXgUI=
Date:   Tue, 7 Sep 2021 12:07:51 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Kim Bak <kim.bak@gamereactor.dk>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Using g_mass_storage for large drives (2Tb+)
Message-ID: <YTc59zX0kP51q0Fn@kroah.com>
References: <50e07dc1-721f-b7a6-d207-2904e9161054@gamereactor.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <50e07dc1-721f-b7a6-d207-2904e9161054@gamereactor.dk>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 07, 2021 at 10:30:34AM +0200, Kim Bak wrote:
> Hi
> 
> This looks like a developer list I'm sorry to bother you here as I'm not a
> developer, I was looking for the linux-usb-user list but it seems to have
> merged with this so i will ask my question here.

Those lists merged well over a decade ago, November 2007.

> I'm trying to get the g_mass_storage module to export an 8Tb storage device,
> either using a backing file or an iscsi mounted device, it seems to fail
> anything more than 2Tb. Is the module limited to 512 bytes blocks or is
> there a way to force larger blocks?

This was already answered for you 5 days ago:
	https://lore.kernel.org/r/20210902143959.GC432266@rowland.harvard.edu

Did that not answer your question?  If so, please respond to that email.

thanks,

greg k-h
