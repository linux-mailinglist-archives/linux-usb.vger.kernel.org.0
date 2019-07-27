Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECDAD778F4
	for <lists+linux-usb@lfdr.de>; Sat, 27 Jul 2019 15:32:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387665AbfG0NcA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 27 Jul 2019 09:32:00 -0400
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.24]:32327 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387649AbfG0NcA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 27 Jul 2019 09:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1564234314;
        s=strato-dkim-0002; d=hashmail.org;
        h=Message-ID:Subject:To:From:Date:X-RZG-CLASS-ID:X-RZG-AUTH:From:
        Subject:Sender;
        bh=Wyc8l23+okwGL4O/wkorS+DQ8xZXpi9g667Edb0WYdU=;
        b=tDb7wjOzhAzwZz3t3rlLWW36txAMvSSlXVEpjD7NwMgDFHW4DODJx9ldVdl9akmZjc
        SLQBvWf3OSG+es1X9uoh3nub4cUKlGnp2NlYGwQIt5bJwy+uZwYiUrErPW26EbcXE0nF
        n8F7Uem/8M++1LraX/q+i5TLoRaVpZoBjZM9O4sI5cc3df494qEzQ9/L/Ls5BIOHZalK
        Qw+Qjj7eitTdBwjx/JQL41hW0Y81dN86BZrH4v0dgjoJWAQ45eVzUrHEqXnBsJRDzrFH
        yhVvMW1bo15eOGMoF9eIQBHD2w7tIdhBOhZvc1e4rCc4Tro4rc/EShJkzR2mTXXQVfdU
        5raw==
X-RZG-AUTH: ":O2kGeEG7b/pS1F+/SC3i33Z09cEcHcRBAtqtGgRBDGeSaUqOsX4glAsBpQEeWZB4JIsouA=="
X-RZG-CLASS-ID: mo00
Received: from localhost
        by smtp.strato.de (RZmta 44.24 DYNA|AUTH)
        with ESMTPSA id f0aa24v6RDVsrao
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate)
        for <linux-usb@vger.kernel.org>;
        Sat, 27 Jul 2019 15:31:54 +0200 (CEST)
Date:   Sat, 27 Jul 2019 15:31:48 +0200
From:   yvahkhfo.1df7f8c2@hashmail.org
To:     linux-usb@vger.kernel.org
Subject: usbip device reset handling
Message-ID: <20190727133148.GA19172@priv-mua.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello linux-usb.

currently it seems most network interfaces (ethernet + wifi) can not
be forwarded using usbip.

my context for the problem is QubesOS, which uses usbip (over ipc
sockets instead of tcp) to pass around usb devices between xen vms.
there are enough different reports to make it unlikely it is a hardware
issue. https://github.com/QubesOS/qubes-issues/issues/3778

a check with two plain fedora installs shows the same problem,
so it does not seem to be anything qubes specific either.
additional testing was performed using kernel 5.1.6 on qubes for convenience.
a quick git/log check against current 5.2 and 5.3 says there have
not been any relevant changes since then.

comparing USBIP_DEBUG traces for working and non-working devices 
says things go wrong if/when the receiving side device-specific driver
tries to reset the device as part of its firmware+config intialization
ritual. this seems to be very common for network drivers. 
the reset is caught+handled receiver side in vhci_hcd and is never 
passed on to the giver side.

on the giver side, there is code for handling reset urbs in stub_rx. 
i was unable to determine whether this ever worked or is just a code
artifact, so i am unsure how to proceed.

if there is an urb for the reset somewhere, its probably in whatever
calls vhci_hub_control through the hc_driver.hub_control abstraction.
should it just make sure that urb is passed on to the giver?

i added code to make up a reset urb from scratch in vhci_hcd, and toss 
it over to stub_rx which actualy makes the reset code trigger, but
then get lost in what feels like usb device state engine hell. 

currently the code in stub_rx submits the tweak-handled urbs anyways,
with a comment indicating that may or may not be a good idea.
adding code to not submit the reset urb just leads to a different-flavored
mess of timeouts and small explosions.

my current guesses are i either need to send some additional message
or something gets dropped because it happens while the 50ms reset on
the giver side is still ongoing at the time.

please advise on how to proceed with this, i would feel more comfortable
randomly stumbling around kernel source if i knew i was headed
in the right direction. ;)

of course i would also settle for an "ugh, fixed" without any additional
explanation. 

regards,
   x23

