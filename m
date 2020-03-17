Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7268D188D79
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2020 19:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgCQSyN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Mar 2020 14:54:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:59010 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726388AbgCQSyN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 17 Mar 2020 14:54:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9146420724;
        Tue, 17 Mar 2020 18:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584471253;
        bh=+/gzzCepNp7hZ607T7cprnktZIk0ec9Z1atYSj81ho0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tca6X/K2p2of+yCLT4tCpLTfDDP4Oc6r3/qo2LDUqDefIihoDF/Ov3Ss6DGUBuJfA
         nOWe2mRsVdaXYQlf3jR19wotEWLeEVZ9oK0iZLFnxRoYmrW8UcqXTFK0DVAK2/bPat
         t289YJ2lDt/wXvOpf6W6pglRkHW3/NzMGP2Kr/0k=
Date:   Tue, 17 Mar 2020 19:54:04 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: chipidea: changes for v5.7-rc1
Message-ID: <20200317185404.GB1480055@kroah.com>
References: <20200317122414.GA11834@b29397-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200317122414.GA11834@b29397-desktop>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 17, 2020 at 12:23:56PM +0000, Peter Chen wrote:
> The following changes since commit 6a7c533d4a1854f54901a065d8c672e890400d8a:
> 
>   xhci-pci: Allow host runtime PM as default for Intel Tiger Lake xHCI (2020-03-12 17:34:49 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-ci-v5.7-rc1

Pulled and pushed out, thanks.

greg k-h
