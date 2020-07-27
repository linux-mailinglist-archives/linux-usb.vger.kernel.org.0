Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BF5622E8F2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jul 2020 11:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgG0J07 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jul 2020 05:26:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:54600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726320AbgG0J07 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 27 Jul 2020 05:26:59 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F5492065C;
        Mon, 27 Jul 2020 09:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595842019;
        bh=ItUlf5qVHL1sqAOZEj3EJzoG8funbru622hJqMHUqtU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YUvN1RdDiPCnKjgYeMF1pXfDv1dEeZsKTf4qrPHN5p0YlQgN4TtJiLjWulQOXNIpR
         HQ4Rqlvvjqsqt9ILzFh8TAal7F74yd7uAR2UkA3dzgSR8nUFuVnifFU+ti314JjJZ4
         85eQf9Qz3RVYQUWUuD/1TrnH/9RmDFU3y9W5OzII=
Date:   Mon, 27 Jul 2020 11:26:54 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Forest Crossman <cyrozap@gmail.com>
Cc:     linux-usb@vger.kernel.org, mathias.nyman@intel.com,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: xhci: define IDs for various ASMedia host
 controllers
Message-ID: <20200727092654.GD1764157@kroah.com>
References: <20200727090629.169701-1-cyrozap@gmail.com>
 <20200727090629.169701-2-cyrozap@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727090629.169701-2-cyrozap@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 27, 2020 at 04:06:28AM -0500, Forest Crossman wrote:
> Signed-off-by: Forest Crossman <cyrozap@gmail.com>

I can not take patches without any changelog text, sorry.

greg k-h
