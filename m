Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A20C9262D58
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 12:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727975AbgIIKkq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 06:40:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:34568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726293AbgIIKko (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Sep 2020 06:40:44 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B3FBA206F4;
        Wed,  9 Sep 2020 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599648044;
        bh=/uoeLxvdnAM7fxQswYJcfDtLDxf5ByEIff/HZMqRk50=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Zy/os9uAYjHUY8OakLoDAgR1bJ8L3Z3g66LsG4b9aualfs5rU+vOODr67K5HgStuZ
         L3i1uf0s3/5N6B3ewfGiEbqDwzRy0nR01CrYLvImyIJ7QBiSqmsp4kW2UaKu6DlogH
         SfJvyjSTqvShRTzdpLjZaoMrLMgUViaJ7lsT/Xds=
Date:   Wed, 9 Sep 2020 12:40:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Lorenzo Colitti <lorenzo@google.com>, balbi@kernel.org
Cc:     linux-usb@vger.kernel.org, zenczykowski@gmail.com
Subject: Re: [PATCH v3 0/3] usb: gadget: f_ncm: support SuperSpeed Plus,
 improve on SuperSpeed
Message-ID: <20200909104054.GA615992@kroah.com>
References: <20200825055505.765782-1-lorenzo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825055505.765782-1-lorenzo@google.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 25, 2020 at 02:55:02PM +0900, Lorenzo Colitti wrote:
> This patch series makes the NCM gadget usable at SuperSpeed Plus
> speeds (currently, it crashes with an oops). It also improves the
> behaviour on SuperSpeed and above by making simple performance
> improvements and by fixing the speeds that are reported to the
> host (currently 851 Mbps, which is much below actual throughput).
> 
> Tested on a gadget directly connected to a Linux laptop running
> 5.6.14 and cdc_ncm, using both 5 Gbps and 10 Gbps cables. iperf3
> single TCP connection throughput (gadget to host) is > 2 Gbps on
> SuperSpeed and > 4 Gbps on SuperSpeed Plus.
> 
> Changes since v1:
> - Set bMaxBurst to 15 on endpoints.
> - Report more realistic speeds than 851 Mbps.
> 
> Changes since v2:
> - Remove the separate SuperSpeed Plus descriptors and function
>   which were just a copy of the SuperSpeed descriptors and
>   function. Instead, just pass the SuperSpeed function to
>   usb_assign_descriptors for both SuperSpeed and SuperSpeed
>   Plus.
> - Don't set bMaxBurst on the interrupt endpoint. This is
>   incorrect/useless and forbidden by the spec.
> - Make the speed constants unsigned literals.
> 
> 

Felipe, did you miss this series, or is it still in your to-review queue
you are working your way through?

thanks,

greg k-h
