Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 056E8D923D
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 15:18:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390208AbfJPNSK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 09:18:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:38678 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388141AbfJPNSK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Oct 2019 09:18:10 -0400
Received: from localhost (unknown [209.136.236.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A2AA821848;
        Wed, 16 Oct 2019 13:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571231889;
        bh=mTugqJYdbYW8ew18KK2GOdSIQz6vQ3FP3AQ2L09rgSQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NDn6DCDEXQzZgTvymyiQfyt1EtWqStzDqHgE++Tx65n3365GEoVEvYr7xeBpSLP2b
         M2qdl14D93+gKufq3pxdh/C0n/Ls8Vd7jiykvJI2THxMxigiwYMPQYvkciNcj5jmu7
         t2KEq3XH9cDkOtDLQkrJs+fjXcoLX+Sr8CcqgscE=
Date:   Wed, 16 Oct 2019 06:18:08 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Roger Quadros <rogerq@ti.com>
Cc:     felipe.balbi@linux.intel.com, pawell@cadence.com,
        peter.chen@nxp.com, nsekhar@ti.com, kurahul@cadence.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] usb: cdns3: fixes for 5.4-rc
Message-ID: <20191016131808.GB56859@kroah.com>
References: <20191016100452.32613-1-rogerq@ti.com>
 <6435c2c9-c8fb-3ec8-5e5c-b1d3b72b0b2e@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6435c2c9-c8fb-3ec8-5e5c-b1d3b72b0b2e@ti.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 01:08:57PM +0300, Roger Quadros wrote:
> Hi, Greg
> 
> I see that you've already picked up v1.
> V2 is a very minor fix and this series can be ignored.

Can you send the difference as a stand-alone patch so that I can apply
it?

thanks,

greg k-h
