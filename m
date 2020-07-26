Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 009E122DD67
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jul 2020 10:59:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgGZI73 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jul 2020 04:59:29 -0400
Received: from yes.iam.tj ([109.74.197.121]:51610 "EHLO iam.tj"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725794AbgGZI73 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 26 Jul 2020 04:59:29 -0400
Received: from [10.0.40.34] (unknown [51.155.44.233])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        by iam.tj (Postfix) with ESMTPSA id 7C5B4340AD;
        Sun, 26 Jul 2020 09:59:27 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=elloe.vision; s=2019;
        t=1595753967; bh=Z+6zZoHgyo+ywsl9oUiHCaQvEG5RTt1/ToiG22ZopoM=;
        h=Subject:From:To:References:Cc:Date:In-Reply-To:From;
        b=qXaRdKdbK4OjMI8Mm2c9Ve2g8YjCfONPwZbh/Z4SFeRjGUcStWjrUE7P8iBCW+1t1
         T28bs3gXpnsVStpzKOHCbGV8RllZXwoI8Ee3cR6vQvqlJHCDJpOThNBSD3xKFY+biR
         NiLzsahFWPs11Rep3yBiS6rhz+QWpLmh0Vxb09eH3EFBsTjUVD0AtzY3N+jilE2EkX
         4XIZRHBT3dAmtAcS4lc5s/8C1Ju5DNCWTZeE2+9DadhTw9fDsB7+zqIlHb1msjdrTe
         WnrJ/5IFA1V1IzgP7SqKlV01A1bn309FPsJnppiG6uQEqJbqkRg+RPicayKrcN4It3
         PASnVl+of+STA==
Subject: Re: uas: bug: [turris-L1 #1096031] MOX Hardware Issue - USB
 SuperSpeed ports resetting constantly
From:   "Tj (Elloe Linux)" <ml.linux@elloe.vision>
To:     linux-usb <linux-usb@vger.kernel.org>
References: <9268a7b4-217e-e76d-af9a-9c5b4f6fe54a@elloe.vision>
 <20200719110901.GE266150@kroah.com>
 <c6720231-e30c-41e4-cd2b-1b4b9baa0852@elloe.vision>
 <1595235102.2531.7.camel@suse.de>
 <c280ec82-cc00-f4b6-cc1f-12317cc8c23c@elloe.vision>
Cc:     Oliver Neukum <oneukum@suse.de>,
        Greg KH <gregkh@linuxfoundation.org>, tech.support@turris.cz
Organization: Elloe CIC
Message-ID: <b3e83e56-93f7-b6ee-4fc4-d5421cf34bbd@elloe.vision>
Date:   Sun, 26 Jul 2020 09:59:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c280ec82-cc00-f4b6-cc1f-12317cc8c23c@elloe.vision>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20/07/2020 11:25, Tj (Elloe Linux) wrote:
> We have limited windows of time to test due to the Mox being our primary
> gateway but I've ordered another Mox A (the main CPU module) so we can> test at will.

We now have the second Mox A CPU module with USB3 module F attached in
our lab and can do any tests required.

# lspci -nn
00:00.0 PCI bridge [0604]: Marvell Technology Group Ltd. Device [1b4b:0100]
01:00.0 USB controller [0c03]: VIA Technologies, Inc. VL805 USB 3.0 Host
Controller [1106:3483] (rev 01)

> I'll update with the additional logs later.

I've captured a couple of usbmon logs, firstly when uas is enabled, and
then with it disabled via the quirk "0x152d:0x0562:u", and included the
associated dmesg logs.

They're available as text/plain and in a tar.gz with names prefixed
jmicron+ dated 2020-07-26 at:

https://elloe.vision/linux/

> In our earlier tests the module A USB3 port wasn't active presumably
> because we missed off a config option. Once we're corrected that we'll
> test on the SoC USB3 port to help narrow down the responsible kernel
> module(s) and layers.

It's currently not possible to test on the CPU module's USB3 since it
fails to initialise due to a fight between the firmware and OS because
in recent kernels the OS tries to initialise the PHY layer - but that is
already done by firmware. We've tested a suggested fix for that in uboot
but so far not made progress on that one.

