Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78D15218C25
	for <lists+linux-usb@lfdr.de>; Wed,  8 Jul 2020 17:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730516AbgGHPpl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 8 Jul 2020 11:45:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:53786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730310AbgGHPpk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 8 Jul 2020 11:45:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C06F4207DF;
        Wed,  8 Jul 2020 15:45:39 +0000 (UTC)
Date:   Wed, 8 Jul 2020 17:45:35 +0200
From:   Greg KH <greg@kroah.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 00/10] USB: serial: break and sysrq fixes and cleanups
Message-ID: <20200708154535.GB717967@kroah.com>
References: <20200708125000.15659-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200708125000.15659-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 08, 2020 at 02:49:50PM +0200, Johan Hovold wrote:
> This series fixes the break and sysrq handling in the ftdi driver (which
> have never really worked) and optimises the sysrq handling somewhat.
> 
> Included are also some related clean ups.

Nice!

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
