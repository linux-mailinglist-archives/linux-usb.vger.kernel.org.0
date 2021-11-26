Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09B9F45F5AF
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 21:15:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238338AbhKZUSx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 15:18:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234940AbhKZUQx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 15:16:53 -0500
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EBC6C0619DE
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 12:01:53 -0800 (PST)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "RapidSSL TLS DV RSA Mixed SHA256 2020 CA-1" (verified OK))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 09A5C100AFF73;
        Fri, 26 Nov 2021 21:01:51 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id D7DB6272577; Fri, 26 Nov 2021 21:01:50 +0100 (CET)
Date:   Fri, 26 Nov 2021 21:01:50 +0100
From:   Lukas Wunner <lukas@wunner.de>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Andreas Noever <andreas.noever@gmail.com>
Subject: Re: [PATCH 2/6] thunderbolt: Tear down existing tunnels when
 resuming from hibernate
Message-ID: <20211126200150.GA21796@wunner.de>
References: <20211125073733.74902-1-mika.westerberg@linux.intel.com>
 <20211125073733.74902-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125073733.74902-3-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 25, 2021 at 10:37:29AM +0300, Mika Westerberg wrote:
> If the boot firmware implements connection manager of its own it may not
> create the paths in the same way or order we do. For example it may
> create first PCIe tunnel and the USB3 tunnel. When we restore our
> tunnels (first de-activating them) we may be doing that over completely
> different tunnel and that leaves them possible non-functional. For this
> reason we re-use the tunnel discovery functionality and find out all the
> existing tunnels, and tear them down. Once that is done we can restore
> our tunnels.

Hm, what if the system is running from a Thunderbolt-attached drive?
Will the mount points survive tearing down and re-establishing the
tunnels to that drive?

Thanks,

Lukas
