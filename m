Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9F32009E0
	for <lists+linux-usb@lfdr.de>; Fri, 19 Jun 2020 15:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732529AbgFSNXL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Jun 2020 09:23:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:44478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732463AbgFSNXK (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 19 Jun 2020 09:23:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A4A92166E;
        Fri, 19 Jun 2020 13:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592572990;
        bh=QcoyGcy0PDsnEo65xhEYvasczufMUodNe+jSfxfLLe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xitL1EYpIvvGM3fz4zIU21dOL3rvaafK6hcfvEj83lEi52uTseF7Ds9IlipAg5bSz
         G73Vqx1kIiZqVRzOYz9oVwdYvGY6LiQ7XJRMS0kssNG5Ol8lNs8d35FEkpwZ0x7Jhd
         +IcUuNsKZEUIS37sOxQ41pzZSOJT/rtHhvy32IH0=
Date:   Fri, 19 Jun 2020 15:23:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rob Gill <rrobgill@protonmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] driver/usb MODULE_DESCRIPTION entries to usb modules
Message-ID: <20200619132306.GA1250782@kroah.com>
References: <20200619131606.30088-1-rrobgill@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200619131606.30088-1-rrobgill@protonmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 19, 2020 at 01:16:25PM +0000, Rob Gill wrote:
> The user tool modinfo is used to get information on kernel modules, including a
> description where it is available.
> 
> This patch adds a brief MODULE_DESCRIPTION to the following modules in driver/usb.
> 
> isight_firmware
> mxuport
> u_ether
> uas
> 
> Signed-off-by: Rob Gill <rrobgill@protonmail.com>
> 
> ** Descriptions updated after review, thankyou.

This should go below the --- line, right?

And is this a v2 patch?  Not "Re:" in the subject line?

Can you fix this up and send a v3?

thanks,

greg k-h
