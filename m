Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F3D713C351
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2020 14:37:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726310AbgAONh4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jan 2020 08:37:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:48074 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726165AbgAONh4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jan 2020 08:37:56 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 23176207FF;
        Wed, 15 Jan 2020 13:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579095475;
        bh=BAfp4Jo1TSepgBJcEWbdW7Mno1i2rnBFkqAAATWSq+A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lbGjboeQloMNjTiYMTpZPMUu8au8Ovsf+1IwEcRhlaijyzgtyBRmMZ6EF3kTqWHtW
         +DJLh0pXm9Y2UXssUxQV93k42NDHAuJKUspmund8qsP40qMep74D6z5kyW2DdIeRjf
         YEEzIVqX14ylos3AoEPG9vIOu3NxowtxdrhAw2sE=
Date:   Wed, 15 Jan 2020 14:37:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Lukas Wunner <lukas@wunner.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc2: Drop unlock/lock upon queueing a work item
Message-ID: <20200115133752.GA3535764@kroah.com>
References: <77c07f00a6a9d94323c4a060a3c72817b0703b97.1574244795.git.lukas@wunner.de>
 <e417bbba-f2dd-3ffc-0db9-149b08b11913@synopsys.com>
 <87r2006ett.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r2006ett.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 15, 2020 at 03:15:26PM +0200, Felipe Balbi wrote:
> 
> Hi Greg,
> 
> Minas Harutyunyan <Minas.Harutyunyan@synopsys.com> writes:
> 
> > On 11/20/2019 2:15 PM, Lukas Wunner wrote:
> >> The original dwc_otg driver used a DWC_WORKQ_SCHEDULE() wrapper to queue
> >> work items.  Because that wrapper acquired the driver's global spinlock,
> >> an unlock/lock dance was necessary whenever a work item was queued up
> >> while the global spinlock was already held.
> >> 
> >> The dwc2 driver dropped DWC_WORKQ_SCHEDULE() in favor of a direct call
> >> to queue_work(), but retained the (now gratuitous) unlock/lock dance in
> >> dwc2_handle_conn_id_status_change_intr().  Drop it.
> >> 
> >> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> >> ---
> >
> > Acked-by: Minas Harutyunyan <hminas@synopsys.com>
> 
> Do you mind picking this one up as a patch?
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>
> 
> ps: if you don't have the patch anymore, I can dig it up and resend with
> all appropriate acked-by tags.

I can take it, thanks.

greg k-h
