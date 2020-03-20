Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0996B18C7C8
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2020 08:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbgCTHAP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Mar 2020 03:00:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:59268 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726030AbgCTHAP (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Mar 2020 03:00:15 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E925D20774;
        Fri, 20 Mar 2020 07:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584687613;
        bh=aAHhohSluW1bfihNLheN64ej1irjrw/6k2pQEwuho6Y=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=T7gWueNgQm9SA9JMf/3iIOpU32heaJ3v9Sn5YBp5S81x4yxkt2JFQ+ALmbZOaZa1O
         bxc3p+sUCfwiSb2smxZKxNncSH6zPDVpppOUZY9hYouudfwAWhRlcXLHqVp8Vh7DsH
         KIgtRtd4Mi2uNymS4KOoQqihHX5UOD+Y9/iMVt0I=
Date:   Fri, 20 Mar 2020 07:59:06 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Gokce Kuler <gokcekuler@gmail.com>
Cc:     outreachy-kernel@googlegroups.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/2] Avoid multiple line dereference
Message-ID: <20200320065906.GB307955@kroah.com>
References: <cover.1584668081.git.gokcekuler@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1584668081.git.gokcekuler@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Mar 20, 2020 at 05:03:03AM +0300, Gokce Kuler wrote:
> merge a line -> with a line ending with a sign
> 
> merge a line -> with a line ending with a sign
> 
> Gokce Kuler (2):
>   staging: rtl8712: Avoid multiple line dereference
>   staging: rtl8712: Avoid multiple line dereference

You should put the subsystem and driver in this 0/2 email subject as
well.

But the big problem of this (have you been reading other patch
submissions here?) is that you sent 2 patches that did different things,
yet had the same subject line, which is not ok.

Please make them unique.

thanks,

greg k-h
