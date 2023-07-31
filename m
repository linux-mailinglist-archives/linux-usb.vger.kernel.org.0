Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0657768B90
	for <lists+linux-usb@lfdr.de>; Mon, 31 Jul 2023 08:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229627AbjGaGJi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 31 Jul 2023 02:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjGaGJi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 31 Jul 2023 02:09:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472299F
        for <linux-usb@vger.kernel.org>; Sun, 30 Jul 2023 23:09:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CC28D60EA0
        for <linux-usb@vger.kernel.org>; Mon, 31 Jul 2023 06:09:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90422C433C7;
        Mon, 31 Jul 2023 06:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1690783776;
        bh=ajde4IL4hlX3qTXAmdYiLS0pED7StaRh7bPWk7TWzlQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NPIpmK4kE3ycui1PdngGhqbrWZ/WekFkLo5RkqqRPIazQnncJ5/EazDE2M5A0PNGR
         +9LHJLG1cKzdXH/Vp+uk471RDgxIzLPLaj7//1dhKGdBHpaHpVOa94TPV2OlOBQeCy
         DqR7osl98ikrWuzB5DmCrVa22bIUyThkCH2dPo14=
Date:   Mon, 31 Jul 2023 08:09:30 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Ross Maynard <bids.7405@bigpond.com>
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        davem@davemloft.net, kuba@kernel.org,
        Oliver Neukum <oneukum@suse.com>
Subject: Re: [PATCH v2] USB: zaurus: Add ID for A-300/B-500/C-700
Message-ID: <2023073120-unpicked-polyester-9425@gregkh>
References: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69b5423b-2013-9fc9-9569-58e707d9bafb@bigpond.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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
> ---
> v2: removed reported-by since bug reporter and patch author are the same person

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
