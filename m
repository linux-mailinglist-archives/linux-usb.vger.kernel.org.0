Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4562D221F60
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 11:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725975AbgGPJFJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 05:05:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45934 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725897AbgGPJFJ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 16 Jul 2020 05:05:09 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id ABB3F2064C;
        Thu, 16 Jul 2020 09:05:08 +0000 (UTC)
Date:   Thu, 16 Jul 2020 11:05:03 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, George Spelvin <lkml@sdf.org>
Subject: Re: [PATCH] USB: serial: iuu_phoenix: fix led-activity helpers
Message-ID: <20200716090503.GA1548743@kroah.com>
References: <20200716085056.31471-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716085056.31471-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 10:50:55AM +0200, Johan Hovold wrote:
> The set-led command is eight bytes long and starts with a command byte
> followed by six bytes of RGB data and ends with a byte encoding a
> frequency (see iuu_led() and iuu_rgbf_fill_buffer()).
> 
> The led activity helpers had a few long-standing bugs which corrupted
> the command packets by inserting a second command byte and thereby
> offsetting the RGB data and dropping the frequency in non-xmas mode.
> 
> In xmas mode, a related off-by-one error left the frequency field
> uninitialised.
> 
> Fixes: 60a8fc017103 ("USB: add iuu_phoenix driver")
> Reported-by: George Spelvin <lkml@sdf.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
