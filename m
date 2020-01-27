Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E85214A09E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2020 10:22:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729317AbgA0JWZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jan 2020 04:22:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:40250 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726191AbgA0JWZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jan 2020 04:22:25 -0500
Received: from localhost (unknown [84.241.194.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5247E2071E;
        Mon, 27 Jan 2020 09:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580116945;
        bh=ynekvNH94n8O/QtI4ouW8JFz18N2hEiIooKEJOdmvT0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ORFww1qbA1CplH7sFYx9CaUPtUCUniz8Z7yAqmpsJB20wqsRTgQrJbYo/k1wH+GDC
         Eeqi7sfH6Pn5nxJuE9Y9cqOGsxemO2APHTLBed+lTxLxLw0rbk9AsQfjUPIbQY8J0K
         6g6zP8waDj4Hza9xm2kNNqELrmZr3NTjPj0XIxzQ=
Date:   Mon, 27 Jan 2020 10:22:12 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [GIT PULL] USB-serial updates for 5.6-rc1
Message-ID: <20200127092212.GA392535@kroah.com>
References: <20200127082915.GA9636@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127082915.GA9636@localhost>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 27, 2020 at 09:29:15AM +0100, Johan Hovold wrote:
> The following changes since commit b3a987b0264d3ddbb24293ebff10eddfc472f653:
> 
>   Linux 5.5-rc6 (2020-01-12 16:55:08 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-5.6-rc1

Pulled and pushed out, thanks.

greg k-h
