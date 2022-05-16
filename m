Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3700D5285AA
	for <lists+linux-usb@lfdr.de>; Mon, 16 May 2022 15:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231866AbiEPNnk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 May 2022 09:43:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiEPNng (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 May 2022 09:43:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B823340EE
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 06:43:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B1FE161365
        for <linux-usb@vger.kernel.org>; Mon, 16 May 2022 13:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66EBC385AA;
        Mon, 16 May 2022 13:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652708614;
        bh=diBchLKdXVlzsP63niN5h9ZnKGAoIru/HrR6p2lmP9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x6OXYrU2XKclVmIziaNsxus0wNoCO1MK0VHCW3BBcNcMfutLUHlAChJRFy2zALEA+
         WcnAAdOEbBCSvTT2Qsaq/2py8bHMwwvCmGi8Fua4+dRvnT4agRFvOXut4ZU0lEIO7k
         LItKtMkmnKZOfIGNs3y0YG+oQ6hQLKXRr97mHSS0=
Date:   Mon, 16 May 2022 15:43:31 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gil Fine <gil.fine@intel.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH v3 6/6] thunderbolt: Change TMU mode to HiFi
 uni-directional once DisplayPort tunneled
Message-ID: <YoJVA4JRZgZs89Wy@kroah.com>
References: <20220511140549.10571-1-gil.fine@intel.com>
 <20220511140549.10571-7-gil.fine@intel.com>
 <Yn4qld89AVEd3cRD@lahna>
 <20220515202746.GA8368@ccdjLinux26>
 <YoIMh0Di7QtALQ/Z@lahna>
 <20220516085903.GC8368@ccdjLinux26>
 <YoIajuneoVCCcfGZ@lahna>
 <20220516132141.GE8368@ccdjLinux26>
 <YoJPchm9UufxrC6+@lahna>
 <20220516134548.GF8368@ccdjLinux26>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516134548.GF8368@ccdjLinux26>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 16, 2022 at 04:45:48PM +0300, Gil Fine wrote:
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
> 

Now deleted.  This footer is not compatible with kernel development,
sorry.
