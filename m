Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E2B21D76A
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jul 2020 15:41:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729880AbgGMNla (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 09:41:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:48838 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728950AbgGMNl3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jul 2020 09:41:29 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1B46C2072D;
        Mon, 13 Jul 2020 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594647689;
        bh=XlmXB8Jm7BZjImQjw5GeU5IaB1Y8mIfcSdBshrtQ+Eo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pl5UNNEpLsal4P49QBnE6iyVg0mu9G0P2k02lUYqBvu7fjAAZ9heP4//GLKHD9iyO
         3gcFAm70oq8DIfSm0eTdNnLZyM4rg3xHigQHnx9UJzXOluBkrCS9EGbRGx/O14g7rX
         rstfXluKxT3NMymDEPDeMa0Hbfh0Fy1A10AFNmrw=
Date:   Mon, 13 Jul 2020 15:41:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org,
        =?utf-8?B?SmFyb23DrXIgxaBrb3JwaWw=?= <Jerry@jrr.cz>
Subject: Re: [PATCH 0/5] USB: serial: cp210x: add support for line-status
 events
Message-ID: <20200713134129.GA3175228@kroah.com>
References: <20200713105517.27796-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200713105517.27796-1-johan@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 13, 2020 at 12:55:12PM +0200, Johan Hovold wrote:
> This series add supports for line-status events that specifically can be
> used to detect parity errors.
> 
> The implementation relies on the device's event-insertion mode, which
> can also be used to detect line-breaks and modem status changes. But as
> this doesn't seem to work as expected on CP2102, support has been left
> unimplemented for now.
> 
> Included are also a couple of cleanups.
> 
> Johan
> 
> Changes since RFC [1]:
>  - drop sysrq support which relies on break detection
>  - use 0xec (instead of 0xff) as escape character
> 
> [1] https://lore.kernel.org/r/20200703150104.GE3453@localhost


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
