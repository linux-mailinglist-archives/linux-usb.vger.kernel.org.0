Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BF255C773
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245553AbiF1JWQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Jun 2022 05:22:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231164AbiF1JWP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 28 Jun 2022 05:22:15 -0400
Received: from out2.migadu.com (out2.migadu.com [IPv6:2001:41d0:2:aacc::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 344161D333
        for <linux-usb@vger.kernel.org>; Tue, 28 Jun 2022 02:22:14 -0700 (PDT)
Date:   Tue, 28 Jun 2022 19:21:48 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
        t=1656408132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=cBbs/EKlmPkORXJSAE+YMoFEzEUwS9Y567ky/0pdQGQ=;
        b=Hb0t39reUs0cdJXopFS/a1J9rcIH5WlDQcXJ4zkza0a8qvNYZQhbq83xs8/tzo3vcUgsVj
        gwmcNnUrajuxC/ohdFcuESzSTROX13ms45cCFTRGpXQNC6gsep3dosuYiSvltN70Hzd948
        9plD6QdLLIZL0D4ulSj9tj+ydEd2TSdER92L/JjxHb9iQukZnHlDMI0TolIKtOsVrSpYyb
        EuZJxqUti9EjeMeA/wIMF5qK7eLLAK5pJlFl4LM9v8TY4lUGPvWNIqmRogWmHnuAMnolEo
        tpQRfQN5tysBCIa7xeHUFZc+pD2tmbu3MUG17t8D9HruVjEJdiEuPdGsSNtjVQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jookia <contact@jookia.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: acm_port_shutdown hangs for 30 seconds
Message-ID: <YrrILGzC2R3qGiHu@novena-choice-citizen>
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
 <YrmpLXcPeHW4fnvz@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrmpLXcPeHW4fnvz@kroah.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: jookia.org
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

Thanks for getting back to this!

On Mon, Jun 27, 2022 at 02:57:17PM +0200, Greg KH wrote:
> What host controller driver is this showing up on?

I have the following modules loaded:

xhci_pci_renesas
xhci_pci
xhci_hcd

This isn't an ARM board or anything, this is a standard x86 desktop
(B450 plus motherboard, Ryzen 3700x chipset)- but I believe I've had the
same error when using serial cables on a years older computer and in
general when doing embedded development.

I believe this issue is related to buggy serial devices, in particular
ones run by a microcontroller like an ATmega32u4 and perhaps Linux USB
gadget where the device is abruptly reset but the serial session isn't
terminated.

The host device USB system has to time out then, which is fine, but in
userspace this seems to hang close() instead of doing this
asynchronously.

> thanks,
> 
> greg k-h

Jookia.
