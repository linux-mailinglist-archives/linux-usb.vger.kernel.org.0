Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88B5B4AD72A
	for <lists+linux-usb@lfdr.de>; Tue,  8 Feb 2022 12:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357173AbiBHLcA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Feb 2022 06:32:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349567AbiBHKRu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Feb 2022 05:17:50 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CC92C03FEC0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 02:17:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 658E9B819D0
        for <linux-usb@vger.kernel.org>; Tue,  8 Feb 2022 10:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74F7EC004E1;
        Tue,  8 Feb 2022 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1644315467;
        bh=V2mCjXhYbB6Af2dp/glEIndekerPAjDepUYFve0LBfk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wCTSsmHE34kSksrUx2zvHdKZUwmeUIi0c2ctip7L+nuI9rG4Ci0L3U32Mu/Bewzta
         4zRj4v9+qSNUwUrPrC0XPE1dmhBPk+8f3CQw9TAyJAPoJcprfoEKia3H+YPhAJyRse
         gbJvELsbBr0Rw+z3PdKY/KlGufjgWHDnxlQg+5zQ=
Date:   Tue, 8 Feb 2022 11:17:43 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Oliver Neukum <oliver@neukum.org>,
        Ross Maynard <bids.7405@bigpond.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: SL-6000 Zaurus not supported since v3.0.0-rc4 kernel
Message-ID: <YgJDR0ThpPHnHOER@kroah.com>
References: <ed1a0173-5bd8-e6ac-5bd1-593b687e3e17@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ed1a0173-5bd8-e6ac-5bd1-593b687e3e17@bigpond.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jan 27, 2022 at 09:35:17AM +1100, Ross Maynard wrote:
> Support for the SL-6000 Zaurus broke after the following patch was added to
> zaurus.c:
> 
> [16adf5d07987d93675945f3cecf0e33706566005] usbnet: Remove over-broad module
> alias from zaurus.
> 
> I was directed here by Greg Kroah-Hartman:
> https://bugzilla.kernel.org/show_bug.cgi?id=215361#c7
> 
> Thanks
> 

Oliver, can you turn your suggested patch here into a real one and send
it to us for submission?

thanks,

greg k-h
