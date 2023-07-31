Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A6B5769009
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 10:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230217AbjGaIYO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 04:24:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjGaIXx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 04:23:53 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08E2213B;
        Mon, 31 Jul 2023 01:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=a2UzXH65pU6D+5RxuoqV0mU4KwvxcFu8nPejcDojQSQ=; b=UwJDP8wVdnTMyuNZaLfOYX61sN
        dhXQOsNgIco1viC7mimNkQcfg6W1vDs94hfOOH/qxl2ENaMo5QQKKk59gydjyj9Gy0flLYqZAsXKd
        Jk8tjhjkF6UMKvSl6RmcTxeSN2H2/uYtQ+SbE3X8io8N2TtSSBjizQetXpEUS5BaasUs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qQOB0-002hKr-N2; Mon, 31 Jul 2023 10:22:50 +0200
Date:   Mon, 31 Jul 2023 10:22:50 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, davem@davemloft.net, kuba@kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2] USB: zaurus: Add ID for A-300/B-500/C-700
Message-ID: <556dcedc-b727-49b6-886f-5d485cf02713@lunn.ch>
References: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 31, 2023 at 03:42:04PM +1000, Ross Maynard wrote:
> The SL-A300, B500/5600, and C700 devices no longer auto-load because of
> "usbnet: Remove over-broad module alias from zaurus."
> This patch adds IDs for those 3 devices.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=217632
> Fixes: 16adf5d07987 ("usbnet: Remove over-broad module alias from zaurus.")
> Signed-off-by: Ross Maynard <bids.7405@bigpond.com>
> Cc: stable@vger.kernel.org

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
