Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CE05217206
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 17:43:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729857AbgGGP1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 11:27:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:42216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729639AbgGGP1m (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 11:27:42 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6309120663;
        Tue,  7 Jul 2020 15:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594135662;
        bh=Rr+93xSBBPpH5TIaqfQZul5YygPGq3moZo/rKQRFhpc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JGThTc9jqno1LVjpLk40mtLFk1s59sSGdXY4it1A3UEfTdD3iDBb/rESlkc2yP7HR
         Yxym2RVegBmb3x5dWXPZ+RijosRO+EbV7GcPACRLSf5SHtAK3h8I41Q8JKMdQBv0Us
         ahfTe07fD8cTIOcGVdUtOmHS5uJHi67cq5R7zAaw=
Date:   Tue, 7 Jul 2020 17:19:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank =?iso-8859-1?Q?Sch=E4fer?= <fschaefer.oss@googlemail.com>
Cc:     Johan Hovold <johan@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: read() from removed usb-serial device
Message-ID: <20200707151954.GA110414@kroah.com>
References: <4f43f7ac-33ea-df67-f623-a7edc3d14c4c@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f43f7ac-33ea-df67-f623-a7edc3d14c4c@googlemail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 07, 2020 at 04:49:31PM +0200, Frank Schäfer wrote:
> Hi,
> 
> I recently noticed that read() from a usb-serial device does not fail after
> the device got removed.
> Is this really the correct/expected behavior or a bug ?

You application did not get the hangup event and stop reading?

> I would expect it to return -1 and set an appropriate errno, but it returns
> 0 (no error, no bytes read) instead.

0 is correct here, why would there be an error?  There's no data for you
to read from a device that is gone :)

thanks,

greg k-h
