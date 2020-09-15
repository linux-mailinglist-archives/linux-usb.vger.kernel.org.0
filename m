Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62961269D96
	for <lists+linux-usb@lfdr.de>; Tue, 15 Sep 2020 06:50:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgIOEuG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Sep 2020 00:50:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:45500 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726034AbgIOEuF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 15 Sep 2020 00:50:05 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46508206B6;
        Tue, 15 Sep 2020 04:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600145403;
        bh=Ng48bEvO/IwKQN850kXi6GZlaX1XBN34m0VrmEA9tO4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tV0THZqChci4rylLK245e2bypWakbonsKrSd5RpBh2a1iSJhNFfe1oy+lXE4icGqQ
         E6AT3F++KqhGILGc/Auy62rt0x4LHyic9/DeEwgJsMtX4ExN1C2M4NGYTFpFsQOpP6
         LV0/qmkNo+inji3dYOf/z0ibLw7u1g5keav7BmPE=
Date:   Tue, 15 Sep 2020 06:50:00 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Sid Spry <sid@aeam.us>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB Hardware Power Control, IOCTL_USB_HUB_CYCLE_PORT Equivalent
Message-ID: <20200915045000.GA2031@kroah.com>
References: <33a6b755-f1ba-4c9c-9320-601365afbd67@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33a6b755-f1ba-4c9c-9320-601365afbd67@www.fastmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 14, 2020 at 09:14:44PM -0500, Sid Spry wrote:
> Hi, after a fair bit of looking I do not see a way to do a hard reset of
> a device. Windows seems to expose some functionality that hints these things
> are possible. Does anyone know if it is and is implemented in the Linux
> drivers?

You can do this from userspace on hardware that supports it by using the
`usbreset` tool that is in the usbutils package.

But as you have found out, this is not a requirement for USB hardware to
support, so not all hubs do support this, sorry.

good luck!

greg k-h
