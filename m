Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AA1E4F2287
	for <lists+linux-usb@lfdr.de>; Tue,  5 Apr 2022 07:19:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229553AbiDEFVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Apr 2022 01:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229777AbiDEFVR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Apr 2022 01:21:17 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4418F1F0
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 22:19:20 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2BE1968B05; Tue,  5 Apr 2022 07:19:16 +0200 (CEST)
Date:   Tue, 5 Apr 2022 07:19:15 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Thorsten Leemhuis <regressions@leemhuis.info>
Cc:     Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [Bug 215740] New: kernel warning: DMA-API: xhci_hcd: cacheline
 tracking EEXIST, overlapping mappings aren't supported
Message-ID: <20220405051915.GA23138@lst.de>
References: <bug-215740-208809@https.bugzilla.kernel.org/> <69a5233e-aa11-073a-a390-3f80e6dc4466@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <69a5233e-aa11-073a-a390-3f80e6dc4466@leemhuis.info>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 31, 2022 at 09:41:25AM +0200, Thorsten Leemhuis wrote:
> Hey Christoph, Marek, Greg!
> 
> Below warning was reported to bugzilla.kernel.org more than a week ago;
> to quote the important parts here:

The warning is from a new debug check added in 5.14 under a debug
config option.  So while the USB maintainers should look into fixing it
I don't think it is a regression in that traditional sense of the word.
