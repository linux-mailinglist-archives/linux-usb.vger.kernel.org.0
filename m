Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1A032C7EB4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Nov 2020 08:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725920AbgK3HaY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Nov 2020 02:30:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:49704 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725860AbgK3HaX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 30 Nov 2020 02:30:23 -0500
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8F66720706;
        Mon, 30 Nov 2020 07:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1606721377;
        bh=7fZ+LzKTheqyGX61Sil4DxBrIVKXULyKlrFSPJI79a8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VMn/bD2GSGDXZ0/3CEfzzTBTkb5gEp8qvoXmn+TTxQK0hWMQBs/CnYNwvl4tNSsUI
         R85y4jZrnZE9sdjsZp+jF6P/MkU9c/tCYnx+dUuNwbhEgu4Km5Ql5M1kY53zxI5zjh
         6T3JXMacc4szFzDlQwlqy1+w998bi3WmZmA52Pw4=
Date:   Mon, 30 Nov 2020 08:30:40 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@nxp.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [GIT PULL] usb: fixes for v5.10
Message-ID: <X8SfoMVX0XOdLkMr@kroah.com>
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

You sent this twice, which one is correct?  Or are they both the same?

thanks,

greg k-h
