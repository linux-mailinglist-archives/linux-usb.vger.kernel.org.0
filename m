Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAD652C7F85
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 09:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbgK3ILO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 03:11:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:57932 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgK3ILO (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 03:11:14 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D62A20709;
        Mon, 30 Nov 2020 08:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606723833;
        bh=fr9DVvHCBl6K68dHXjPLu6ph16aCWmUq694HJeNNPLA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JX6XXL/JtqI+Ykedad3UTOWRWk9ysAmLktEO/0b/cAbEtEzosaRhodTA9f7cR8uQf
         BBVDDyyXPOG8mCJrNJ5cAjTVxYd0HYGnHnEMrPNju4mKU1jl39O8xQ7RGoWOx1Ho0T
         6DMe1wGuJA7O40up8HybSzIuZPI8ni3V2KGRjkvs=
Date:   Mon, 30 Nov 2020 09:11:32 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: fixes for v5.10
Message-ID: <X8SpNNzo7nvUH67C@kroah.com>
References: <DBBPR04MB7979962270A587129B3F7D268BF50@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB7979962270A587129B3F7D268BF50@DBBPR04MB7979.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 30, 2020 at 06:13:22AM +0000, Peter Chen wrote:
> The following changes since commit f3bc432aa8a7a2bfe9ebb432502be5c5d979d7fe:
> 
>   USB: core: Change %pK for __user pointers to %px (2020-11-20 16:36:31 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-fixes-v5.10-rc6

Pulled and pushed out, thanks.

greg k-h
