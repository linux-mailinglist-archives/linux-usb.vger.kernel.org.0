Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0465E61F2
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 14:08:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231154AbiIVMIY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 08:08:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiIVMIX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 08:08:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C39CE9F8DD
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 05:08:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5FD0060AF9
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 12:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65EE7C433C1;
        Thu, 22 Sep 2022 12:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663848501;
        bh=c1VmE/amH3LF3toTJJiqfHZ6SE7Fcv5Qkj3s7Rg5cE0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IO+YQYLiKgUgmVVUl83nbgyFbZnHjThAJvNJaAdtZ/Ktn5dWAHLS/tPT/+72r69iL
         A/oqvO1xMFL5+Nlth3Dq1Eo78fgsr0LtEE30+Bem9K6zgh4+iautzzE9vxhjDfbWBv
         xbwLmI9/dDlMzoy0FB7zjFsdxtCN30eMAmYVY53I=
Date:   Thu, 22 Sep 2022 14:08:18 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] xhci features and fixes for usb-next
Message-ID: <YyxQMtJCLdgWuCsu@kroah.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 21, 2022 at 03:34:44PM +0300, Mathias Nyman wrote:
> Hi Greg
> 
> Some xhci features and fixes for usb-next.
> Both fixing some possible memory leaks that are too late for usb-linus,
> and simple code cleanups for usb-next

Did you miss this one:
	https://lore.kernel.org/r/20220915011134.58400-1-liulongfang@huawei.com

or was there some issue with it?

thanks,

greg k-h
