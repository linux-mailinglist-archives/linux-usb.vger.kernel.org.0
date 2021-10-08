Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E824426E76
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 18:13:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbhJHQPD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 12:15:03 -0400
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229534AbhJHQPC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 12:15:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B1C160FF2;
        Fri,  8 Oct 2021 16:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633709587;
        bh=9YivKCJLjCI/0SU+uPgnI4j82kd1onjHJEfrqxWDSH8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rSxgfmGd00Cx20wmgzIzthM3FUKTTGGT3BumN6Z22lyw3+Hm8xrIoU2MlnGFjKSDY
         d6Enjs6CUnsnaDh1vymJZxZkvZn9boZrGCvULqGizt8ka9FXmxVr3FMNE+aZn9QEdK
         M48nxpgXtSe3AcHNaWfJLUeYGS/XlV8iwCRJX068=
Date:   Fri, 8 Oct 2021 18:13:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] xhci fixes for usb-linus
Message-ID: <YWBuEAoWlA6Zmkk9@kroah.com>
References: <20211008092547.3996295-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008092547.3996295-1-mathias.nyman@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 08, 2021 at 12:25:42PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> A few xhci fixes for 5.15-rc.
> A couple races fixed, and quirks added for a couple hosts.

I'll pick these up after Linus takes my latest pull request, these were
too late to get into linux-next this week for testing.

thanks,

greg k-h
