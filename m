Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A07F4EB185
	for <lists+linux-usb@lfdr.de>; Tue, 29 Mar 2022 18:11:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239361AbiC2QM7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Mar 2022 12:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239467AbiC2QM5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 29 Mar 2022 12:12:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B24917B0E3
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 09:11:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B95B3B81877
        for <linux-usb@vger.kernel.org>; Tue, 29 Mar 2022 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1344BC34100;
        Tue, 29 Mar 2022 16:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1648570272;
        bh=B+a64Bm4tYNN4X3r+jhwKloHmUlRabSGiJxrK2Ltj9o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=e+xjKMlrOLME+FdYfvkjsfnFonZA48alGM9ABtDIGJzEzGtz6JxbLXNZEn58a7yU5
         TIq2axiOSKwUdZhUBv0HQ/1+6XSsBZtnM6oVl9D9QW3Qa+FJY023CJBVbSccvIMy31
         D+JTnkQMjYDIMWCKHCSOqTEfcPztdsMpLUy+im2g=
Date:   Tue, 29 Mar 2022 18:11:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Josue David Hernandez Gutierrez 
        <josue.d.hernandez.gutierrez@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com
Subject: Re: [PATCH 1/2] usb: host: xhci: Remove msi irq reconfigure on resume
Message-ID: <YkMvnWBDDFCkLAJs@kroah.com>
References: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220329154406.5485-1-josue.d.hernandez.gutierrez@intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 29, 2022 at 09:44:05AM -0600, Josue David Hernandez Gutierrez wrote:
> xhci_resume function is cleaning up msi irqs to avoid
> conflicts when xhci_run is called, because xhci_run
> is going to setup those msi irqs and it is called at
> the end of xhci_resume, then creating a new start
> callback for the xhci-pci driver to setup msi
> irqs and removing this msi irq setup from xhci_run
> reconfigure msi irqs won't be needed in xhci_resume.

You do have a full 72 columns to use in your changelog body :)

> This change also allows us move the msi setup code to
> the correct place, that is from xhci.c to xhci-pci.c

When you have "also" in a changelog text, it almost always means it
should be multiple patches.

Please break this up into "move the code" and "modify the code" patches
to make it easier to review.

As it is, it's pretty impossible to notice if anything has changed in
the logic or not.

Would you want to review this?

thanks,

greg k-h
