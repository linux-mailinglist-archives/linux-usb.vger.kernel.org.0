Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8095938C19
	for <lists+linux-usb@lfdr.de>; Fri,  7 Jun 2019 16:00:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728783AbfFGOAC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Jun 2019 10:00:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:59940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728669AbfFGOAC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 7 Jun 2019 10:00:02 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6EE6208E3;
        Fri,  7 Jun 2019 14:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559916002;
        bh=HiDodev/PJbs/AP3Q8q85Qm5ZxzIUztbAyB8Dqr7uXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SLwGCDG1oLgLg6BDBg2x/NooYtjt5CX8rYWQ3RkEgT7dyKXiV2GQ6oGm4KpvZx6uH
         8efyOBV8ZfuEAEa7sCMB/Wwy58B6urtpynjeD5uPf0BCXX+ZpGfNpg6zYoNcr6UMQ6
         pkjTWSpqLGkdc0i/UYcyIPH20zF2/T8Zwj+CzH0I=
Date:   Fri, 7 Jun 2019 15:59:59 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Prabhat Chand Pandey <prabhat.chand.pandey@intel.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        rajaram.regupathy@intel.com, abhilash.k.v@intel.com,
        m.balaji@intel.com
Subject: Re: [PATCH 0/5] usb: xhci: dbc: make modular and add RAW interface
Message-ID: <20190607135959.GC14665@kroah.com>
References: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607063306.5612-1-prabhat.chand.pandey@intel.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 07, 2019 at 12:03:01PM +0530, Prabhat Chand Pandey wrote:
> This patch-set adds the following features to dbc driver:
> 
> - show the active dbc function and dbc descriptors, allowing
>   user space to dynamically modify the descriptors.

Why would we want userspace to modify these?

> - modularize dbc core to enable it to expose different function
>   interfaces, till now only TTY interface was exposed.

exposed where?

confused,

greg k-h
