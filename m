Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4FB81456C7
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 14:36:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728816AbgAVNac (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 08:30:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:53554 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728842AbgAVNab (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 22 Jan 2020 08:30:31 -0500
Received: from localhost (unknown [84.241.205.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 827B12468E;
        Wed, 22 Jan 2020 13:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579699831;
        bh=eviM17yXhociGrjOAO6gWATDzOBDVGPViydWLrb6+R0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nslfg6/9gw442GydjLUs8utY2BJDcJ0MVHIxYvFwEAbRbzB+69R+DfGsuKrNPFFJh
         anzDMC1U9lTwdX91edWEPJPATpLz9GykcdUZN8Ed5euqKCGcnjIdF8aLA/dToTPoJJ
         qUBIo/MegMcJdQEgfLtXyDHi7v/im5NdN/wS4lDw=
Date:   Wed, 22 Jan 2020 14:26:12 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 4/5] USB: serial: ir-usb: make set_termios synchronous
Message-ID: <20200122132612.GD3580@kroah.com>
References: <20200122101530.29176-1-johan@kernel.org>
 <20200122101530.29176-5-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200122101530.29176-5-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 22, 2020 at 11:15:29AM +0100, Johan Hovold wrote:
> Use a synchronous usb_bulk_msg() when switching link speed in
> set_termios(). This way we do not need to keep track of outstanding URBs
> in order to be able to stop them at close.
> 
> Note that there's no need to set URB_ZERO_PACKET as the one-byte
> transfer will always be short.
> 
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/usb/serial/ir-usb.c | 50 ++++++++-----------------------------
>  1 file changed, 11 insertions(+), 39 deletions(-)
> 

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
