Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AB8C2633E3
	for <lists+linux-usb@lfdr.de>; Wed,  9 Sep 2020 19:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgIIRMC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Sep 2020 13:12:02 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46743 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730303AbgIIPdM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Sep 2020 11:33:12 -0400
Received: (qmail 818535 invoked by uid 1000); 9 Sep 2020 10:11:09 -0400
Date:   Wed, 9 Sep 2020 10:11:09 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     gregkh@linuxfoundation.org, gustavoars@kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] usb: host: ehci-sched: Remove ununsed function
 tt_start_uframe()
Message-ID: <20200909141109.GC817244@rowland.harvard.edu>
References: <20200909134405.34036-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200909134405.34036-1-yuehaibing@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 09, 2020 at 09:44:05PM +0800, YueHaibing wrote:
> commit b35c5009bbf6 ("USB: EHCI: create per-TT bandwidth tables")
> left behind this, remove it.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Alan Stern <stern@rowland.harvard.edu>
