Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B0E1F9243
	for <lists+linux-usb@lfdr.de>; Mon, 15 Jun 2020 10:53:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgFOIxk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Jun 2020 04:53:40 -0400
Received: from wsip-184-185-158-229.sd.sd.cox.net ([184.185.158.229]:17372
        "EHLO s0-postfix.allcaps.org" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728522AbgFOIxj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 Jun 2020 04:53:39 -0400
X-Greylist: delayed 450 seconds by postgrey-1.27 at vger.kernel.org; Mon, 15 Jun 2020 04:53:39 EDT
Received: from MacBook-Pro.austin.rr.com (cpe-70-114-205-206.austin.res.rr.com [70.114.205.206])
        by s0-postfix.allcaps.org (Postfix) with ESMTPSA id 7FBA11C64048
        for <linux-usb@vger.kernel.org>; Mon, 15 Jun 2020 00:33:11 -0700 (PDT)
To:     linux-usb@vger.kernel.org
From:   "Andrew P. Lentvorski" <bsder@allcaps.org>
Subject: Implementing WCID for a bulk function ... can't create String
 descriptor of 0xEE
Autocrypt: addr=bsder@allcaps.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <205ac1dc-2e8b-e83a-85f0-5a8e796f4b16@allcaps.org>
Date:   Mon, 15 Jun 2020 01:46:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I've got a bulk transport kernel module composite function.  Nothing
fancy, just opens the two pipes to a character device just like f_hid.c.
 It works fine, as far as I can tell.

Now, I'm trying to implement WCID so that Windows will automatically
recognize it and attach it to the WinUSB drivers.

However, I simply cannot figure out how to create a string with an index
of 0xEE and data of "MSFT100" so that Windows will pick up the device
and then request the extra features.

Alternatively, I'm happy to adjust my bcdUSB to flag USB 2.01 or USB 2.1
and use the BOS system.  However, as there appear to be very few
examples of that in the Linux codebase (none that I can see--but I'm not
on latest), I suspect that would be just swapping something that might
be possible but I'm just missing the path vs something that has a path
that is wholly untrod.

WCID References:
https://github.com/pbatard/libwdi/wiki/WCID-Devices
https://docs.microsoft.com/en-us/windows-hardware/drivers/usbcon/microsoft-defined-usb-descriptors

Any help, advice or pointers would be appreciated.

Thanks,
-a
