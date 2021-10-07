Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 850C8424E4B
	for <lists+linux-usb@lfdr.de>; Thu,  7 Oct 2021 09:51:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240514AbhJGHxR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Oct 2021 03:53:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:54254 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240497AbhJGHxP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 7 Oct 2021 03:53:15 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0AA7361139;
        Thu,  7 Oct 2021 07:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633593082;
        bh=7n1XDbo3mpPIQKwuKM9tQACILCNbuJh5yb6gKzeQ2QI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rp+zd3ggfkL3bdtSzuItIaxpT9DfIY9rvtnPCf9ikAVE4Z52SdGihV4fHj1TKEJSx
         Pdo+H1Thcq5X+F+fOI43+4V11XEEH/3prhAf33htOaKOGCLnR9nXuWjbIC6/QuSWzx
         jU8+PJLe23gGJWBd6+sq62XF7ST3/iCm577Xm3ci7OMxGl4b3/19NvoqkCcYB6mcrW
         lZANXT3oBb9AG3BurlYuBx1w7V2BngNoC7fLUdNI5Nl1VW6crIIVqntPO2LvpW3FAI
         91CVJNmehCngKjnKupMjaWsQ+j9MKwnykd4VZ7OpbKNvzRDHLkaMnucM4OofBq+ixg
         CK8JnC1+VWWow==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mYOBU-0005ii-Rb; Thu, 07 Oct 2021 09:51:20 +0200
Date:   Thu, 7 Oct 2021 09:51:20 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit LE910Cx composition
 0x1204
Message-ID: <YV6m+IWpoouB+fHu@hovoldconsulting.com>
References: <20211004105655.8515-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004105655.8515-1-dnlplm@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 04, 2021 at 12:56:55PM +0200, Daniele Palmas wrote:
> Add the following Telit LE910Cx composition:
> 
> 0x1204: tty, adb, mbim, tty, tty, tty, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hello Johan,
> 
> following the lsusb verbose output:

Now applied, thanks.

Johan
