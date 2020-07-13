Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D52121BF48
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jul 2020 23:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726286AbgGJVfW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jul 2020 17:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbgGJVfW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jul 2020 17:35:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FAA7C08C5DC;
        Fri, 10 Jul 2020 14:35:22 -0700 (PDT)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 980442D7;
        Fri, 10 Jul 2020 21:35:20 +0000 (UTC)
Date:   Fri, 10 Jul 2020 15:35:19 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     "Alexander A. Klimov" <grandmaster@al2klimov.de>
Cc:     Stafford Horne <shorne@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
        David Miller <davem@davemloft.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: USB MASS STORAGE
 DRIVER
Message-ID: <20200710153519.421d2cf3@lwn.net>
In-Reply-To: <53342e1a-8430-2557-94c7-1da979a79e68@al2klimov.de>
References: <20200708095500.13694-1-grandmaster@al2klimov.de>
        <20200708103928.GC585606@kroah.com>
        <6b78a3fd-04b9-fc8e-b5c6-f03372a4cd31@al2klimov.de>
        <20200709061409.GA130260@kroah.com>
        <20200710103621.GA437393@lianli.shorne-pla.net>
        <53342e1a-8430-2557-94c7-1da979a79e68@al2klimov.de>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 10 Jul 2020 21:36:03 +0200
"Alexander A. Klimov" <grandmaster@al2klimov.de> wrote:

> 2) Apropos "series" and "as whole"... I stumbled over
>     `git log --oneline |grep -Fwe treewide`
>     and am wondering:
>     *Shouldn't all of these patches even begin with "treewide: "?*
>     E.g.: "treewide: Replace HTTP links with HTTPS ones: GCC PLUGINS"

No, this isn't something that needs to be done across the tree all at
once.  Keep going through the appropriate maintainers as you have, but do
please try to adjust your subject lines to match what they do.

jon
