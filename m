Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0DF53A44C
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2019 10:14:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbfFIIOt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 9 Jun 2019 04:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:55560 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727552AbfFIIOt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 9 Jun 2019 04:14:49 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CCF12089E;
        Sun,  9 Jun 2019 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560068088;
        bh=lsJx6+EEX6Khwgnje4fhX94Hi11pes50Auc1ZGLgyo0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=17JPB/MZvA9eGMucwNNTtBE47qGH+zh1h+TRiKNAecjcQPzJ5mlfW4uD62xA+zsDw
         hrhXgYdMQHw0v6oakcrO5jItNPsN6SjY+CwlRmTYDB4L1kXRMaUpONZmQrKHDD3s2m
         5S3vY91Y028m9L4yyyTI1afqAeSuM1pCucNNO0dU=
Date:   Sun, 9 Jun 2019 10:14:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Saurav-Girepunje <saurav.girepunje@gmail.com>
Cc:     b-liu@ti.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, saurav.girepunje@hotmail.com
Subject: Re: [PATCH] Updated the function description for musb_stage0_irq
 Signed-off-by: Saurav-Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20190609081446.GA12061@kroah.com>
References: <20190609080753.GA7735@saurav>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190609080753.GA7735@saurav>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jun 09, 2019 at 01:38:02PM +0530, Saurav-Girepunje wrote:
> ---
>  drivers/usb/musb/musb_core.c | 1 -
>  1 file changed, 1 deletion(-)

I think something went wrong with your commit :(
