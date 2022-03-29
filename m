Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4EEA64EB197
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 18:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234790AbiC2QO0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 12:14:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239396AbiC2QOZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 12:14:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37F67181B2E
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 09:12:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C6E79613CA
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 16:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EBEC340ED;
        Tue, 29 Mar 2022 16:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648570362;
        bh=fBwclFAdTBsK+tqcnML2xzEw7CW7Ttc2fNELMjwHuiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h4Zv3ZiKS1dgZ0VNTehy+35u/abotWaYnugef3Nq9EAAZFZ9NeG58ePf/LFoZBxqo
         QHVduPp3mYL9F8U7RnW9tB6WBQ45tUBUInaQ/WFIcWYooPtKd8B4pNEKpKk4CJy8RX
         LIPlLJz42SAplFi2l6KhnSNTVcb1DHpp6sR3SzxA=
Date:   Tue, 29 Mar 2022 18:12:39 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH 2/2] usb: host: xhci: Move msi/msi-x functions to xhci-pci
Message-ID: <YkMv9wB1zXtMQgWN@kroah.com>
References: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
 <20220329154406.5485-2-josue.d.hernandez.gutierrez@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329154406.5485-2-josue.d.hernandez.gutierrez@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 29, 2022 at 09:44:06AM -0600, Josue David Hernandez Gutierrez wrote:
> There were sync and cleanup msi/msix functions in xhci inside a #ifdef
> macro to check if PCI module is being compiling. These functions has

"have"?

> been moved to xhci-pci where they belong.

Again, move first, modify second.

thanks,

greg k-h
