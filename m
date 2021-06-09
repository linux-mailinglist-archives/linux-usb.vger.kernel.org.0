Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 653D23A0E79
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234840AbhFIIHo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:07:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:56564 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234624AbhFIIHn (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:07:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id E10EE6128A;
        Wed,  9 Jun 2021 08:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623225934;
        bh=/1YUpu5KV5wlJB0fk5MoNhE6iczTEPlxWsVJSsfwdWw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tRqRDyb0ZrlfSNf6lMJSG+ZlsDQvN2lluYaEMLzttUdg26f1FfEad0aBD7dQX0Dim
         iVQtWWqA40ljaWxFabi3NKp1/YnGmvz2Exb7TvIsT6ZJAsDS0iEb8XwjyVJOsfZODn
         UNo60Q9Mq8wLiJuIsb/jcjcJl/wjm8YpbD8nO47s=
Date:   Wed, 9 Jun 2021 10:05:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Peter Chen <peter.chen@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] usb: fixes for v5.13
Message-ID: <YMB2Q5oiJxc0FNN/@kroah.com>
References: <20210607013011.GA4633@nchen>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607013011.GA4633@nchen>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 07, 2021 at 09:30:11AM +0800, Peter Chen wrote:
> The following changes since commit 9e3927f6373da54cb17e17f4bd700907e1123d2f:
> 
>   usb: chipidea: udc: assign interrupt number to USB gadget structure (2021-05-17 10:04:05 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/usb.git/ tags/usb-v5.13-rc6

Pulled and pushed out, thanks.

greg k-h
