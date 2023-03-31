Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 483AB6D18BF
	for <lists+linux-usb@lfdr.de>; Fri, 31 Mar 2023 09:40:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229529AbjCaHka (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 31 Mar 2023 03:40:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229974AbjCaHk2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 31 Mar 2023 03:40:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C25AE3A3
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 00:40:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BE6D362420
        for <linux-usb@vger.kernel.org>; Fri, 31 Mar 2023 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC95FC433EF;
        Fri, 31 Mar 2023 07:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680248426;
        bh=ig4mY4M1jnNTlUQI0Dk0dhM5y4d2QvaS9g6lVZ4xKlU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=E6cetjLY68guNsbxO5msDNZwu6iofAfqVRuIB7mK850pA+ZD7yhCSBP63GLe1oLV7
         hKlQutKhx+ts5NOkrAqeOIWcEvbo6RfWbNhWE6C/cXm5NU7ZOthlt2PAOIe7A4GVcl
         C6AnwcnzeIgsL8W0dbBplP3OyfBVGD3hYydsw1dU=
Date:   Fri, 31 Mar 2023 09:40:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        D Scott Phillips <scott@os.amperecomputing.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/3] xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a
 passthrough iommu
Message-ID: <ZCaOZ9bOe1IsgNdN@kroah.com>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
 <20230330143056.1390020-2-mathias.nyman@linux.intel.com>
 <ZCWfev2C6G7AUHN0@kroah.com>
 <2fa0510f-2bef-8e6c-3531-1a99a659bd6b@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2fa0510f-2bef-8e6c-3531-1a99a659bd6b@linux.intel.com>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 31, 2023 at 10:35:07AM +0300, Mathias Nyman wrote:
> On 30.3.2023 17.40, Greg KH wrote:
> > On Thu, Mar 30, 2023 at 05:30:54PM +0300, Mathias Nyman wrote:
> > > From: D Scott Phillips <scott@os.amperecomputing.com>
> > > 
> > > Previously the quirk was skipped when no iommu was present. The same
> > > rationale for skipping the quirk also applies in the iommu.passthrough=1
> > > case.
> > > 
> > > Skip applying the XHCI_ZERO_64B_REGS quirk if the device's iommu domain is
> > > passthrough.
> > > 
> > > Fixes: 12de0a35c996 ("xhci: Add quirk to zero 64bit registers on Renesas PCIe controllers")
> > 
> > Why not also for stable?
> 
> Ah, yes, this should go to stable as well.

Thanks for confirming these, as you noticed, all are applied to my tree
now.

greg k-h
