Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E58C62D9738
	for <lists+linux-usb@lfdr.de>; Mon, 14 Dec 2020 12:16:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407568AbgLNLQE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Dec 2020 06:16:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:57610 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405890AbgLNLP1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 14 Dec 2020 06:15:27 -0500
Date:   Mon, 14 Dec 2020 12:15:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607944487;
        bh=HDoCs0i40as9FdOu20ZMj7f7mZdTXpbQA5ft49WMWKs=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=Lsu/33aRzvKhPTEEgA8qED3W/dmOtb3ISebxgMQvYkFP6Sy6v21tcVdfDW+5hGzb4
         KQKL6qB9RvAHrN0CHhnWvcddRRpLIU0rueK0G9fC5xJTK18fMvzoaXFKH990OxEy73
         zWPrBYmmNNlEjezpoIgdYFCsIonk5YO7iHD3DA2c=
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Joachim Schwender <joachim.schwender@web.de>
Cc:     linux-usb@vger.kernel.org
Subject: Re: kernel 5.9.14 USB scanner detection fails
Message-ID: <X9dJaI+WkVby/2ZN@kroah.com>
References: <4028b5c8-3f4b-4266-423b-a7c9652e653d@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4028b5c8-3f4b-4266-423b-a7c9652e653d@web.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 14, 2020 at 11:36:17AM +0100, Joachim Schwender wrote:
> lsusb lists my scanner:
> Bus 001 Device 002: ID 04a9:190f Canon, Inc. CanoScan LiDE 220
> 
> 
> kernel 4.9.14:
> sane-find-scanner   or scanimage -L  does not detect the scanner.
> lsusb still shows the above line.
> 
> kernel 4.9.12:
> with the same .config compiled worked as expected, scanner is detected
> and works.

"4.9" or "5.9"?

And can you run 'git bisect' between the two kernel releases to find the
offending commit that causes the problem?

thanks,

greg k-h
