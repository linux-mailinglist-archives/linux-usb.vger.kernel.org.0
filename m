Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AABEE45CA40
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 17:41:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349127AbhKXQoz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 11:44:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349120AbhKXQoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 11:44:54 -0500
Received: from osmtp.xiscosoft.net (osmtp.xiscosoft.net [IPv6:2001:41d0:8:c16c::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A7C5C061574;
        Wed, 24 Nov 2021 08:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klondike.es;
        s=xiscosoft_net; t=1637771665; x=1638981265;
        bh=69cR8EmxUIp8O1+eoqqaplEdIJjLKathdpdTv4vwMQU=;
        h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Language:
         Content-Type:Content-Transfer-Encoding:From:Subject:To:Cc:Date:
         Reply-To:Content-Type:Sender:Message-ID:References:In-Reply-To:
         Content-Base:Content-Location:Content-features:Content-Disposition:
         Content-Alternative:Content-MD5:Content-Duration:
         Content-Transfer-Encoding:Content-Language:MIME-Version:Content-ID:
         Content-Description:Autocrypt:List-Id:List-Help:List-Unsubscribe:
         List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
         List-Archive:Original-Message-ID:Require-Recipient-Valid-Since:
         Solicitation:Organization:Jabber-ID:Auto-Submitted;
        b=CZfFa/vPrZCyOYOpCjXEjtE1rSUAR9SxfUZtvXFuoPlpz9MeJZxexC/zckyx71g5/
         rcfQrPYFUdkpVvikty7jVXxSFKS6r/ewY/OBAx9q9eMZs1FGLC6R+vbsX0pE36r3pV
         bACwLmUig+7egrN8r+u+4D6nlYSdXoEUwacwHnlJ+XnhrfHGsR79OmS4V8wt1BLOqu
         YA5DQeziRa9+tB0AAoJ8vJuLVGblJLhSF5eshGHEXP45mS4ZRK1E9cTfigyDFyxNcH
         /CeMiamT2Tmz0HUMlmjF8fjN0yjRUTBF9eJYgNzr8OraztlqYG+9zVQ5t4z76Z1cgy
         b0PbyTdr2Tyog==
Message-ID: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
Date:   Wed, 24 Nov 2021 17:34:23 +0100
MIME-Version: 1.0
From:   "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Subject: [PATCH 0/2] Thunderbolt: allow vendor ID override for NVM programming
To:     linux-usb@vger.kernel.org
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Kranthi Kuntala <kranthi.kuntala@intel.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Mario.Limonciello@dell.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lukas Wunner <lukas@wunner.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Currently, the vendor ID reported by the chipset is checked before to
avoid accidentally programming devices from unsupported vendors with
a different NVM structure.

Certain Thunderbolt devices store the vendor ID in the NVM, therefore
if the NVM has become corrrupted the device will report an invalid
vendor ID and reflashing will be impossible on GNU/Linux even if the
device can boot in safe mode.

Such devices can still be programmed just fine if the vendor ID check
is overridden. Nevertheless, overriding these checks introduces the
risk of damaging controllers from other manufacturers which is a
clearly undesirable result.

Instead we allow the user to make a concious choice to override the
vendor ID by passing it as a parameter to this module. Currently,
this is done by expanding the condition to validate the vendor ID
to also check this parameter's value but, if new NVM structures
are added and a choice has to be made, the code should prefer this
parameter over the harrdware reported one when making the choice.

This patch also updates the Thunderbolt documentation to explain
how this parameter works.

root (2):
thunderbolt: allow vendor ID override for NVM programming
Documentation: explain how to override Thunderbolt Vendor ID

Documentation/admin-guide/thunderbolt.rst | 10 ++++++++++
drivers/thunderbolt/switch.c | 9 ++++++++-
2 files changed, 18 insertions(+), 1 deletion(-)
