Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 807ED1314F
	for <lists+linux-usb@lfdr.de>; Fri,  3 May 2019 17:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727513AbfECPhS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 May 2019 11:37:18 -0400
Received: from 8bytes.org ([81.169.241.247]:39314 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726476AbfECPhS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 May 2019 11:37:18 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 9260E580; Fri,  3 May 2019 17:37:17 +0200 (CEST)
Date:   Fri, 3 May 2019 17:37:16 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     "StarostaCZ@gmail.com" <starostacz@gmail.com>,
        linux-usb@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
        iommu@lists.linux-foundation.org
Subject: Re: Linux crash when using FTDI FT232R USB to serial converter on
 AMD boards.
Message-ID: <20190503153716.GE11605@8bytes.org>
References: <04503197-a0a9-8b35-6c65-c10f296aab57@gmail.com>
 <20190429094847.GI26546@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429094847.GI26546@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 11:48:47AM +0200, Johan Hovold wrote:
> So this is a debian 4.18 kernel seemingly crashing due to a xhci or
> iommu issue.
> 
> Can you reproduce this on a mainline kernel?
> 
> If so, please post the corresponding logs to the lists and CC the xhci
> and iommu maintainers (added to CC).

Your kernel is probably missing this upstream fix:

	4e50ce03976f iommu/amd: fix sg->dma_address for sg->offset bigger than PAGE_SIZE

Regards,

	Joerg

