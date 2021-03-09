Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9021332836
	for <lists+linux-usb@lfdr.de>; Tue,  9 Mar 2021 15:11:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbhCIOKa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 9 Mar 2021 09:10:30 -0500
Received: from mail.kernel.org ([198.145.29.99]:60252 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229599AbhCIOKV (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 9 Mar 2021 09:10:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id B16CF6521A;
        Tue,  9 Mar 2021 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615299021;
        bh=LLFZgjHvWwT9V5CB2m5cpE0EgRAgNYHPjh0oIsyW6HA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vShzDGzh8fEzyQWiNKZqVEUg9fZdwKTZpwsjLMnOh47ILv2X/SmxcqcXhSZgTEHV/
         wAQstsrBMaANhSpqxSI6AeI+B5XTMa0RW93NmT4F/NvbJ3JsAOQ9cCC7FFiFK4Cezp
         bwaxoybk7KBt5VJbpWlDvXVjnfmLTC2zkUmCNI6Q=
Date:   Tue, 9 Mar 2021 15:10:18 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Christian Kellner <christian@kellner.me>,
        Benson Leung <bleung@google.com>,
        Prashant Malani <pmalani@google.com>,
        Diego Rivas <diegorivas@google.com>
Subject: Re: [PATCH 2/3] thunderbolt: Hide authorized attribute if router
 does not support PCIe tunnels
Message-ID: <YEeBysAjdAzDTuXo@kroah.com>
References: <20210309134818.63118-1-mika.westerberg@linux.intel.com>
 <20210309134818.63118-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210309134818.63118-3-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 09, 2021 at 04:48:17PM +0300, Mika Westerberg wrote:
> With USB4 devices PCIe tunneling is optional so for device routers
> without PCIe upstream adapter it does not make much sense to expose the
> authorized attribute. For this reason hide it if PCIe tunneling is not
> supported by the device router.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
