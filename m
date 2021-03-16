Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EFE33D066
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 10:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232010AbhCPJTO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Mar 2021 05:19:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:36592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233947AbhCPJTB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Mar 2021 05:19:01 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7140E64E21;
        Tue, 16 Mar 2021 09:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615886341;
        bh=qG0a9S9Neyaau30QzgyduQ9QTBFGiQMSS0wMTs6g5MA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pm1d20w6MtDVbF/OlbFBDtFn+m8R9d7bK2Vs7gi9HwPb+jl8LGb0B0TAPkUVIcV0a
         SrmDCB1KrC70wHF90gGZTQtgylZXLMKsdalVR9zkkGBpX/Es66qJW7OQ/xlphnjq7q
         4SiX3o/+PieBW3e03226zPXZIUNcLW1EhWbYRwh8RveJ9IzDipRFIWN5xuEl/lLRhb
         XrDGPRAcuIttX1ZwI99RNZTmjH5eA2ueLyoMOU4rBteshUqFMDaQR6eIboR3X125l5
         gOuutXYAd5uEiKWN8LmTw8z4dLHe+eHh0b8B0JlpmMbjZ60BBPWwx6Irp/K9Wa6P7w
         /Pd74fFCHy/1Q==
Received: from johan by xi.lan with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1lM5r7-0000P1-7Z; Tue, 16 Mar 2021 10:19:13 +0100
Date:   Tue, 16 Mar 2021 10:19:13 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg KH <greg@kroah.com>
Cc:     michaelk@ieee.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: pl2303: TA & TB alternate divider
Message-ID: <YFB4Ecbvmk5urtjc@hovoldconsulting.com>
References: <20210316014205.748441-1-michaelk@IEEE.org>
 <YFBcHRVzqvsK+rDa@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YFBcHRVzqvsK+rDa@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 16, 2021 at 08:19:57AM +0100, Greg Kroah-Hartman wrote:
> On Mon, Mar 15, 2021 at 09:42:05PM -0400, michaelk@IEEE.org wrote:
> > From: Michael Katzmann <michaelk@IEEE.org>
> > 
> > Use an alternate clock divider algorithm and bit ordering for the TA and
> > TB versions of the pl2303. It was discovered that these variants do not
> > produce the correct baud rates with the existing scheme.
> > 
> > see https://marc.info/?t=161392209800002&r=1&w=2
> 
> Can you point to a lore.kernel.org thread instead?  We (kernel developer
> community) have control over lore, but not over marc.info or any other
> archive, so we never know if it will be around or not over time :)

I was gonna say that I could fix that up when applying, but turns out
there are some formatting issues with the patch.

Michael, it looks like you've used tabs instead of spaces for
indentation in some places. Try running scripts/checkpatch.pl on the
patch before submitting (which would have caught this).

Care to send a v2?

And the lore link would be:

	https://lore.kernel.org/r/3aee5708-7961-f464-8c5f-6685d96920d6@IEEE.org

Johan
