Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7303E45CA32
	for <lists+linux-usb@lfdr.de>; Wed, 24 Nov 2021 17:37:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349087AbhKXQkj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 24 Nov 2021 11:40:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232846AbhKXQkj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 24 Nov 2021 11:40:39 -0500
Received: from osmtp.xiscosoft.net (osmtp.xiscosoft.net [IPv6:2001:41d0:8:c16c::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7CEC061574;
        Wed, 24 Nov 2021 08:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=klondike.es;
        s=xiscosoft_net; t=1637771847; x=1638981447;
        bh=+blum+j0EFw1COstxobLAcwqR1D6Ufkc5Bc7SWwf0Vg=;
        h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
         Content-Language:In-Reply-To:Content-Type:
         Content-Transfer-Encoding:From:Subject:To:Cc:Date:Reply-To:
         Content-Type:Sender:Message-ID:References:In-Reply-To:Content-Base:
         Content-Location:Content-features:Content-Disposition:
         Content-Alternative:Content-MD5:Content-Duration:
         Content-Transfer-Encoding:Content-Language:MIME-Version:Content-ID:
         Content-Description:Autocrypt:List-Id:List-Help:List-Unsubscribe:
         List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
         List-Archive:Original-Message-ID:Require-Recipient-Valid-Since:
         Solicitation:Organization:Jabber-ID:Auto-Submitted;
        b=RcZI8qa50RjlivL1nwppTCf5D8lQFXLSUIsE6wNPdTb7mPweDjZdyCh7dSEHYcUdK
         VIcDUgOc14IPQb6+cHHK/ZA7U9uRI6l8XN2wOfXPs3qLYqbMiepySaIAae93AkWgRL
         tlWmZyivCi4TTdFGNrqFHlyVwVELtyZUXVhIj6Q/eqlai7Y/V8iJmhKR2pjGRO4L1W
         O3pBDVF+OufmbiAjiDesxC6F9U0P+pNyfR0skUV6TTTfIWFCeKGNMqaPSqUu2VKP2C
         H773S+zGTg1LjHhYfH3nplL358t0Yoid50juU2gSGr8+rlZJ64vown+i5WtxIuUl2x
         wMV1O8ygXRaVw==
Message-ID: <af524afd-beb6-8b9d-cc26-4467abc3ab8e@klondike.es>
Date:   Wed, 24 Nov 2021 17:37:25 +0100
MIME-Version: 1.0
From:   "Francisco Blas Izquierdo Riera (klondike)" <klondike@klondike.es>
Subject: [PATCH 2/2] Documentation: explain how to override Thunderbolt Vendor
 ID
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
References: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
Content-Language: en-US
In-Reply-To: <8d29b41b-3590-c4b0-a2f8-fa34063bafb3@klondike.es>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Update the Thunderbolt documentation to explain how to use the
``switch_nvm_vendor_override`` parameter to be able to reflash
a Thunderbolt controller's NVM reporting an invalid Vendor ID.

Signed-off-by: Francisco Blas Izquierdo Riera (klondike) <klondike@klondike.es>
---
Documentation/admin-guide/thunderbolt.rst | 10 ++++++++++
1 file changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/thunderbolt.rst b/Documentation/admin-guide/thunderbolt.rst
index 2ed79f41a4..15c8c73331 100644
--- a/Documentation/admin-guide/thunderbolt.rst
+++ b/Documentation/admin-guide/thunderbolt.rst
@@ -296,6 +296,16 @@ information is missing.
To recover from this mode, one needs to flash a valid NVM image to the
host controller in the same way it is done in the previous chapter.
+When the NVM image is corrupted, certain host controllers will report
+an invalid Vendor ID preventing the module from exposing the nvm access
+nodes. If so, either load the thunderbolt module with option
+``switch_nvm_vendor_override=vendorID`` or add
+``thunderbolt.switch_nvm_vendor_override=vendorID`` to your boot
+parameters. You need to set ``vendorID`` to the appropriate value.
+On Intel systems, this is likely ``0x8086`` but you should verify this
+before doing anything as otherwise you may cause further damage to your
+controller.
+
Networking over Thunderbolt cable
---------------------------------
Thunderbolt technology allows software communication between two hosts
