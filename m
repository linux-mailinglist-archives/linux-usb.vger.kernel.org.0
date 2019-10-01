Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060F0C3488
	for <lists+linux-usb@lfdr.de>; Tue,  1 Oct 2019 14:42:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387868AbfJAMla (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Oct 2019 08:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:38958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726543AbfJAMl3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 1 Oct 2019 08:41:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8E24420842;
        Tue,  1 Oct 2019 12:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569933689;
        bh=s5OBOEVjRDw2Lw4PpgF3rSn+ejWC5tYwc3fcZhoc9Wo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=LVdMOoQ7z0/YBHWZwlv9uMS62KM963MC7n1OqoIOIS9Ypvpv70d5luZEbET0SgtAG
         OWaROnELFsrK5p/PKPTQbuYz9ERicok3y6OFBbHTU5FBpq7gHNhOPBVQGKZZzMDTh2
         G1aJK8QmM7HfrRUyIVWmNzGSLwvTLBpoAK9ps/7g=
Date:   Tue, 1 Oct 2019 14:41:26 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Nicholas Johnson <nicholas.johnson-opensource@outlook.com.au>,
        Lukas Wunner <lukas@wunner.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Mario.Limonciello@dell.com,
        Anthony Wong <anthony.wong@canonical.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 09/22] thunderbolt: Convert basic adapter register
 names to follow the USB4 spec
Message-ID: <20191001124126.GD2954373@kroah.com>
References: <20191001113830.13028-1-mika.westerberg@linux.intel.com>
 <20191001113830.13028-10-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001113830.13028-10-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 01, 2019 at 02:38:17PM +0300, Mika Westerberg wrote:
> Now that USB4 spec has names for these basic registers we can use them
> instead. This makes it easier to match certain register to the spec.
> 
> No functional changes.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

This is nice to see, can we add this to the tree now?  :)

thanks,

greg k-h
