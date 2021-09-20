Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DEE34110B2
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 10:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbhITIMN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 04:12:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:33786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235375AbhITIMK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 04:12:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 626F26104F;
        Mon, 20 Sep 2021 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632125444;
        bh=LeF/Ab628Eel6B4AC04ZTabsOht9SeknyUfEI87KN3A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uIZTnv5IpC4SFLSDp09EmB2ZOLHeIdYwufDfb9XGRRu/0SpcPXndaOoL3nESl8PpH
         ZorfyWJlxFJ+TDo46p1gUt7VGkTG9DSMF2QqupGRqwxMcBhtHBO+HRB13rjgvoC2Ef
         buJ7pDX1zT9QWyC7ghEvjmdqVhVKXkoTsMDJ94O/n7g/szZlphs33tdokjM6OSJJNt
         IBllQqDJER2JxqgSiFg1FsKqMbi+hjm7EM9YXrK+ceg0lEzp5RRHR4QtAfKHmZC4fF
         AZLe+RfRATjbBXIVAAls828Aq2TCFz+K30IepB+mMP2HADMItIltQ9aVFkkgricxdU
         K6uB9niZigm6A==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1mSENu-0006WH-9V; Mon, 20 Sep 2021 10:10:43 +0200
Date:   Mon, 20 Sep 2021 10:10:42 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Malte Bayer <malte@neo-soft.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Possible bug in the cp210x kernel driver?
Message-ID: <YUhCAtQIE5vbD/Vo@hovoldconsulting.com>
References: <zarafa.6145ee62.586f.6703380702229727@neosoft.neo-soft.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zarafa.6145ee62.586f.6703380702229727@neosoft.neo-soft.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

[ Adding linux-usb on CC ]

On Sat, Sep 18, 2021 at 03:49:22PM +0200, Malte Bayer wrote:
> Hello Johan,
> 
> I recently had a problem with libdivecomputer fetching a specific dive
> log. After debugging the issue I tracked the problem down to the
> cp210x kernel driver.
> 
> Last year, you submitted a change for "Line status events"
> https://github.com/torvalds/linux/commit/a7207e9835a4f245c8c693170906fda0980273f3The
> 
>  connection to my mares puck pro is established with even parity.
> Every time, the dive computer sends the byte pair 0xEC 0x00 (which in
> my case is valid transmitted data from the connected device to the
> pc), the 0x00 after the 0xEC gets dropped by the driver.
> 
> For reference, please take a look on https://github.com/libdivecomputer/libdivecomputer/issues/22#issuecomment-922067186
> and jefdriesen's answer.
>
> libdivecomputer does raw reads of binary data - therefore I dont think
> that it's a good idea to manipulate the received data stream?

Thanks for the report.

In event mode the device is supposed to replace any '0xec' characters
in the input stream with the string '0xec 0x00', which the driver then
needs to convert back to '0xec'.

But clearly your device doesn't escape '0xec' as expected.

What type of cp210x are you using?

As you already discovered you can disable input parity checking (INPCK)
as a workaround meanwhile.

Johan
