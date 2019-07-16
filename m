Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EED16AFEB
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2019 21:37:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728366AbfGPThW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 15:37:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:33724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726213AbfGPThW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jul 2019 15:37:22 -0400
Received: from localhost (unknown [113.157.217.50])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 375F520665;
        Tue, 16 Jul 2019 19:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563305841;
        bh=9mWoGsTBlZ8kJbVELa29UNvmSMT4n+oCs4bA11tfqGo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fDCvlAFeLLQIPF2OAIBzqfvCW8XwuVr8trYrySmH16Db7PI5xBdresPTr6vPTljSC
         Z0J7ypQS5qxeL5/ZiH0WKAlbCMUDGemhLBeSvQ60HeQGZsP7Cq/ojMXh1Jh1Fu9lUG
         1WmZCBGx4qoTCBGSwJl/mnxl/3GV6bgIBJycnUrM=
Date:   Wed, 17 Jul 2019 04:37:19 +0900
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Rogan Dawes <rogan@dawes.za.net>
Cc:     linux-usb@vger.kernel.org, Johan Hovold <johan@kernel.org>,
        Lars Melin <larsm17@gmail.com>, Dan Williams <dcbw@redhat.com>
Subject: Re: [PATCH v5] USB: serial/qmi_wwan: add D-Link DWM-222 device ID
Message-ID: <20190716193719.GB21765@kroah.com>
References: <20190716190210.GA27056@lisa.dawes.za.net>
 <20190716191205.GA27426@lisa.dawes.za.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190716191205.GA27426@lisa.dawes.za.net>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 16, 2019 at 09:12:05PM +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222.
> 
> Cc: stable@vger.kernel.org
> ---
> Also add the qmi_wwan entry, since it was blacklisted already in option
> 
> Apologies for the spam!

You need a signed-off-by line :(
