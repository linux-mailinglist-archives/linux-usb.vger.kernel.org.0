Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E025375ADB2
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 14:01:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231588AbjGTMBf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 08:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231592AbjGTMBd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 08:01:33 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A2D61733
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 05:01:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 12E0761A7C
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 12:01:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EA9C433C7;
        Thu, 20 Jul 2023 12:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689854489;
        bh=SkyuebJk4zXIGM1YoRFNSSyoxlLZePFoFf0MIg4vlHE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fpErovIJ7x2SM5/VwI01m6K65tSV6QjZrFsAb4O0nCSkjkWk2BX4nj09bBWa96AJq
         BPj9KAgPbWmaxuVALnYRqGQvi/lmS0qcDp9Rp87ZasFWKeDtlHS04izmhUag63BJi0
         UTMsF7uTNixulnzpjPNuR88utvylQUsMCr7VBU3F21U9DjhcR36yIxZsLl8izIjR2X
         3GWwAoumrzfzM4rnnqmSCULGRQS/L0ysYbNH3AN53sbULDwasNn8QROYxXSlQpmA7E
         ukk2mDCg/7pOEJSxLBClVFHYRbS3F8YYF9GrBY2KIhMOzrhDtVm++7GgK+M7tENzgN
         rbfnJuAfIEZ2A==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMSLh-00028G-1z;
        Thu, 20 Jul 2023 14:01:37 +0200
Date:   Thu, 20 Jul 2023 14:01:37 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: simple-serial: spell out the ordering
Message-ID: <ZLkiITEahEbu3XbJ@hovoldconsulting.com>
References: <20230720114406.14587-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720114406.14587-1-oneukum@suse.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 20, 2023 at 01:44:06PM +0200, Oliver Neukum wrote:
> keeping a list ordered alphabetically instead
> nummerically be vendor/product ID is unusual.
> This is so odd that examples do not help.
> It needs to be clearly stated with strong words.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/serial/usb-serial-simple.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/serial/usb-serial-simple.c b/drivers/usb/serial/usb-serial-simple.c
> index 24b8772a345e..954b3be7403d 100644
> --- a/drivers/usb/serial/usb-serial-simple.c
> +++ b/drivers/usb/serial/usb-serial-simple.c
> @@ -33,6 +33,16 @@ static struct usb_serial_driver vendor##_device = {		\
>  
>  #define DEVICE(vendor, IDS)	DEVICE_N(vendor, IDS, 1)
>  
> +/*
> + * These tables are NOT in order of device id by intention
> + *
> + * Keep them and add new entries sorted by
> + *
> + * 1. Alphabetical order of the vendor name
> + * 2. Alphabetical order of the product name
> + *
> + */

No, this is not correct. The tables are sorted alphabetically based on
the symbol names, but the entries in each table is sorted by VID/PID as
usual.

The table ordering was not there from the start, but I just moved the
offending tables here:

	https://lore.kernel.org/lkml/20230720080049.14032-1-johan@kernel.org/

Guess I should update the sloppy terminology in that commit message,
though.

Johan
