Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 45B0776FFDB
	for <lists+linux-usb@lfdr.de>; Fri,  4 Aug 2023 14:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229702AbjHDMBA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Aug 2023 08:01:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjHDMA7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 4 Aug 2023 08:00:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75857126
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 05:00:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0933861F9E
        for <linux-usb@vger.kernel.org>; Fri,  4 Aug 2023 12:00:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142B5C433C8;
        Fri,  4 Aug 2023 12:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691150457;
        bh=u8gXJ/0hFMWxVWt1Cmrstuo/mDcX9F+QZfhcdz2lyus=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y32NTFpCjwxus2IpKOPx7LxxkuQlA9yl+kcSQ3W7qw9kX04Mm6yi04rW6mZiE9zNp
         yalFCtV1HUDerfr3oT8xXUYfHihxGfKKSzsZnbGG6vnXW9xoVrpXU2N/5vfMKVNiwQ
         dmMDyCcJ06us7cyvbyLpBbdzwDuzl+iy3ixqMKGs=
Date:   Fri, 4 Aug 2023 14:00:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saranya Gopal <saranya.gopal@intel.com>
Cc:     linux-usb@vger.kernel.org, heikki.krogerus@linux.intel.com,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rajaram Regupathy <rajaram.regupathy@intel.com>
Subject: Re: [PATCH] usb: typec: ucsi: Add debugfs for ucsi commands
Message-ID: <2023080414-carnation-driven-ec73@gregkh>
References: <20230804115336.399801-1-saranya.gopal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804115336.399801-1-saranya.gopal@intel.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 04, 2023 at 05:23:36PM +0530, Saranya Gopal wrote:
> --- /dev/null
> +++ b/drivers/usb/typec/ucsi/debugfs.h

No need for a full .h file for this, why not put the 2 function
prototypes in the normal uscsi file?

> @@ -0,0 +1,47 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * UCSI debugfs interface
> + *
> + * Copyright (C) 2023 Intel Corporation
> + *
> + * Authors: Rajaram Regupathy <rajaram.regupathy@intel.com>
> + *	    Gopal Saranya <saranya.gopal@intel.com>
> + */
> +
> +#ifndef __LINUX_UCSI_DEBUGFS_H
> +#define __LINUX_UCSI_DEBUGFS_H
> +
> +#include <linux/types.h>
> +
> +struct ucsi;
> +struct dentry;
> +
> +struct ucsi_debugfs_entry {
> +	u64 command;
> +	struct ucsi_data {
> +		u64 low;
> +		u64 high;
> +	} response;
> +	u32 status;
> +	struct dentry *dentry;
> +};

This can go into the .c file, right?

thanks,

greg k-h
