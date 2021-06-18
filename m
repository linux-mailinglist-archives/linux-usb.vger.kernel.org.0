Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF2F43AC52B
	for <lists+linux-usb@lfdr.de>; Fri, 18 Jun 2021 09:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233235AbhFRHrV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Jun 2021 03:47:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:59714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229522AbhFRHrU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Jun 2021 03:47:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6961F61209;
        Fri, 18 Jun 2021 07:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1624002312;
        bh=AzEqX9iqReB96AmmB8nBug8vqWqgKfEoGddrvCDjPOY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=L7zREJrj24+QTYOHgUQH42JHTf06Y5wT/xtYiRaTmg3thLLW5An9Ydnw58WsYAQgk
         YEVO+irdM/Oo1RBEQVIjnuBVT4p/6lmxcBeflzhRlPw1dlt7r9A/DNJiDSeRW5RZGK
         pvt0nokzABNWUuPfkduuxttrU7gyX9pWCPkURlM0=
Date:   Fri, 18 Jun 2021 09:45:09 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     peter.chen@kernel.org, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, linux-imx@nxp.com,
        zhipeng.wang_1@nxp.com
Subject: Re: [PATCH v2] usb: chipidea: host: fix port index underflow and
 UBSAN complains
Message-ID: <YMxPBdaTNNMf5rIg@kroah.com>
References: <1623999879-2277-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623999879-2277-1-git-send-email-jun.li@nxp.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 18, 2021 at 03:04:39PM +0800, Li Jun wrote:
> If wIndex is 0 (and it often is), these calculations underflow and
> UBSAN complains, here resolve this by not decrementing the index when
> it is equal to 0, this copies the solution from commit 85e3990bea49
> ("USB: EHCI: avoid undefined pointer arithmetic and placate UBSAN")
> 
> Reported-by: zhipeng.wang <zhipeng.wang_1@nxp.com>

Please use a name here that makes sense, "Zhipeng Wang"?

thanks,

greg k-h
