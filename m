Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B88092D570B
	for <lists+linux-usb@lfdr.de>; Thu, 10 Dec 2020 10:26:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbgLJJZZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 10 Dec 2020 04:25:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:38266 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728519AbgLJJZR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 10 Dec 2020 04:25:17 -0500
Date:   Thu, 10 Dec 2020 10:25:51 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1607592277;
        bh=yhplq5uAujrXiuB3KHAoqp+N0UkNEeZTeql2cL5yoDc=;
        h=From:To:Cc:Subject:References:In-Reply-To:From;
        b=NcNyBVl7MtlxZY8Er4UXe0nYkGynU4iexeHVGSkJOLQVXktRlakRfTkEWBwR/muV4
         4gQuoJtHyEHHyzb/tvfsE03obaBuX265M5/2oCdTBeBt32LBlcyujxmTfHCHDNTqUS
         InZIlDEsOGe0y5mJ6Sx6M93os1SSSJFMMmFgPZms=
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: changes for v5.11-rc1
Message-ID: <X9Hpn6mJhrjGUp7b@kroah.com>
References: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DBBPR04MB79797539F005D75D9717E0D28BCB0@DBBPR04MB7979.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 10, 2020 at 01:12:21AM +0000, Peter Chen wrote:
> The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:
> 
>   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.11-rc1

Pulled and pushed out, thanks.

greg k-h
