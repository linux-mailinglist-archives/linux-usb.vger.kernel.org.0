Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133356DDBD4
	for <lists+linux-usb@lfdr.de>; Tue, 11 Apr 2023 15:13:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjDKNNJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Apr 2023 09:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjDKNNE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Apr 2023 09:13:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 976A7E59
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 06:12:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 23D2561E55
        for <linux-usb@vger.kernel.org>; Tue, 11 Apr 2023 13:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8834DC433EF;
        Tue, 11 Apr 2023 13:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681218776;
        bh=QtsO1TqqnBZZU76knDBmUWT3ParGjv6h7gmUrplP0/s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KZUGIaca9B+Kyls/Xr7K4r3Ok7IKKrd5BjsBsj9GtCFkKHJ7sooqVn/sm+d21mqt4
         ZmZ101Io95hRs0t67dfzrMZZ3RIZcJR6gQdIlkK8skluiHnAd5x0qPo8cCrNbqSZhi
         iMCv4rIzNYtm3EQtS4Fa9mx+FxqfXSWsgNMIS7P0Jne4HVp7PvIOOf0OaWh1gk3l+M
         gIYlkIJYwX06a8PekZYGTllJsku1WTXnQupSsBHeN77RUKz4LhrYrYurV/Z0QYw/eO
         cVDrC6jiA3CR65qo9brU0X7Cnt3uiYn2ko7+ukIWZXwiYkgu0+/tl4jJHxklpZHl1i
         i7zqWKpay8GuQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pmDnq-0003gQ-4t; Tue, 11 Apr 2023 15:12:54 +0200
Date:   Tue, 11 Apr 2023 15:12:54 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Message-ID: <ZDVc1mp4DOvokuvr@hovoldconsulting.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
 <ZCw33woJ3C6roK93@hovoldconsulting.com>
 <20230404213625.zta3tdkqdrthufbl@synopsys.com>
 <ZC0vXcn+tTZHepIN@hovoldconsulting.com>
 <f8a2fe14-0dbf-4a9e-8ab4-3dd00163b23f@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8a2fe14-0dbf-4a9e-8ab4-3dd00163b23f@rowland.harvard.edu>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 05, 2023 at 10:35:45AM -0400, Alan Stern wrote:
> On Wed, Apr 05, 2023 at 10:20:45AM +0200, Johan Hovold wrote:
> > Alan did point out though, that the ehci driver returns a string like
> > "suspended" when trying to access registers for a suspended device.
> > 
> > That behaviour dates back to before the git era though and long before
> > we had runtime PM. In fact, ehci still does not seem to implement
> > runtime PM so this check would essentially only kick when the HCD is
> > dead IIUC.
> 
> In fact there is runtime PM support for ehci-hcd.  You probably missed
> it because the routines are defined in core/hcd-pci.c.

Ah, thanks. I grepped for callers of ehci_suspend, but missed the
indirection via the pci_suspend pointer.

Johan
