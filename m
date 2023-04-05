Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94A26D7FA5
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 16:36:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238471AbjDEOgI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 5 Apr 2023 10:36:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238505AbjDEOgE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 5 Apr 2023 10:36:04 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AA7F64EE9
        for <linux-usb@vger.kernel.org>; Wed,  5 Apr 2023 07:35:46 -0700 (PDT)
Received: (qmail 402424 invoked by uid 1000); 5 Apr 2023 10:35:45 -0400
Date:   Wed, 5 Apr 2023 10:35:45 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Johan Hovold <johan@kernel.org>
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
Message-ID: <f8a2fe14-0dbf-4a9e-8ab4-3dd00163b23f@rowland.harvard.edu>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <8a209f5f-8aa1-35b1-20ed-2f0b95f960a7@quicinc.com>
 <ZCw33woJ3C6roK93@hovoldconsulting.com>
 <20230404213625.zta3tdkqdrthufbl@synopsys.com>
 <ZC0vXcn+tTZHepIN@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZC0vXcn+tTZHepIN@hovoldconsulting.com>
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 05, 2023 at 10:20:45AM +0200, Johan Hovold wrote:
> Alan did point out though, that the ehci driver returns a string like
> "suspended" when trying to access registers for a suspended device.
> 
> That behaviour dates back to before the git era though and long before
> we had runtime PM. In fact, ehci still does not seem to implement
> runtime PM so this check would essentially only kick when the HCD is
> dead IIUC.

In fact there is runtime PM support for ehci-hcd.  You probably missed
it because the routines are defined in core/hcd-pci.c.

Alan Stern
