Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 651D72111DF
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jul 2020 19:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732756AbgGARXb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jul 2020 13:23:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731122AbgGARXb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 1 Jul 2020 13:23:31 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7ECB620771;
        Wed,  1 Jul 2020 17:23:30 +0000 (UTC)
Date:   Wed, 1 Jul 2020 19:23:16 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/5] USB: serial: W=1 related cleanups
Message-ID: <20200701172316.GA3200808@kroah.com>
References: <20200701165342.15448-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200701165342.15448-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 01, 2020 at 06:53:37PM +0200, Johan Hovold wrote:
> People have started submitting patches to "fix" W=1 warning (some even
> reported by bots). Let's just address the remaining ones in USB serial
> to avoid having to spend more time on this.
> 
> Johan
> 
> 
> Johan Hovold (5):
>   USB: serial: garmin_gps: don't compile unused packet definitions
>   USB: serial: iuu_phoenix: drop unused URB submission results
>   USB: serial: keyspan_pda: drop unused firmware reset status
>   USB: serial: kobil_sct: log failure to update line settings
>   USB: serial: quatech2: drop two stub functions

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
