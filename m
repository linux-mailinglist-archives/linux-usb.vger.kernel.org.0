Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8879225BA4
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jul 2020 11:28:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728109AbgGTJ2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jul 2020 05:28:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:42494 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727940AbgGTJ2H (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jul 2020 05:28:07 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B71DF20684;
        Mon, 20 Jul 2020 09:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595237287;
        bh=JMTGk76ZytWLdwFhdYMX3qsokSm5QTB0rxjX1UjiAYo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jcAM0DrL5kVaXrzdyBjMgRxKy1PhXvKF75cd53bRpIJ2s8Cg/u0bH/ISiEYM4dxof
         NaBdmDG1ohTlheQIR+40D2BX/zRUjIazH9A1SGYhXImnhNOW4LPZTLL4HDlysKSxtB
         BHBWzX3cD7bYlxu6LY43IfR3ILU2ZF0UfiVV4L8I=
Date:   Mon, 20 Jul 2020 11:28:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: xhci status 'Babble Detected' and transaction errors with USB
 device performing UDP stress test through qmi_wwan
Message-ID: <20200720092816.GB836614@kroah.com>
References: <CAGRyCJF03pVWdyw_G0vZZdOR8QW0c65xaN5KWs8HoWA8ymXZjg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGRyCJF03pVWdyw_G0vZZdOR8QW0c65xaN5KWs8HoWA8ymXZjg@mail.gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 20, 2020 at 11:21:47AM +0200, Daniele Palmas wrote:
> Hello,
> 
> I'm performing UDP stress test with an USB modem and kernel 5.6.12,
> driver qmi_wwan

5.6.y is long end-of-life, can you try the latest 5.7.y release?

thanks,

greg k-h
