Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F0516D087F
	for <lists+linux-usb@lfdr.de>; Thu, 30 Mar 2023 16:41:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231845AbjC3OlM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Mar 2023 10:41:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjC3OlL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Mar 2023 10:41:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B7217EC3
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 07:41:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CAE7462086
        for <linux-usb@vger.kernel.org>; Thu, 30 Mar 2023 14:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B52DAC433EF;
        Thu, 30 Mar 2023 14:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680187261;
        bh=6wDpa+PGHNuKLtB5NZfpVEe6JXq618+d7S1c59HLT9E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=soz0wR+wwhpKEF0adqrUcFT6lSYSmDsYYd0vaOFHvEwJvOvMNHu8+ezV541PZK6s3
         QpfAjT2+NC/nAp6Rzde3QHs//LLdX4dzPZkFh0gxKA9UvV5By4vco+kU8L9g9Oj6xd
         tYv2PGChOHW2WLF2DdjduQeCeCCQkafXZ0OZaixo=
Date:   Thu, 30 Mar 2023 16:40:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        D Scott Phillips <scott@os.amperecomputing.com>,
        Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH 1/3] xhci: also avoid the XHCI_ZERO_64B_REGS quirk with a
 passthrough iommu
Message-ID: <ZCWfev2C6G7AUHN0@kroah.com>
References: <20230330143056.1390020-1-mathias.nyman@linux.intel.com>
 <20230330143056.1390020-2-mathias.nyman@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330143056.1390020-2-mathias.nyman@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Mar 30, 2023 at 05:30:54PM +0300, Mathias Nyman wrote:
> From: D Scott Phillips <scott@os.amperecomputing.com>
> 
> Previously the quirk was skipped when no iommu was present. The same
> rationale for skipping the quirk also applies in the iommu.passthrough=1
> case.
> 
> Skip applying the XHCI_ZERO_64B_REGS quirk if the device's iommu domain is
> passthrough.
> 
> Fixes: 12de0a35c996 ("xhci: Add quirk to zero 64bit registers on Renesas PCIe controllers")

Why not also for stable?

thanks,

greg k-h
