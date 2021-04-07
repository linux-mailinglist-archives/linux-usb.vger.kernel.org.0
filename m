Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F7C7357020
	for <lists+linux-usb@lfdr.de>; Wed,  7 Apr 2021 17:24:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbhDGPYY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Apr 2021 11:24:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:37746 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235931AbhDGPYW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 7 Apr 2021 11:24:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DED461222;
        Wed,  7 Apr 2021 15:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1617809052;
        bh=FOLnPm0gyvercnQZWHqAsrTdWfesr7WCJd/03jlZDP0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HBZ61EHoEkc6TwKrYz7lDcxylcZhpdccxufrAAslZY6nEaWN0o+7Ge2iCwZ/+jXUl
         M2yNNZSEjnH+ASsVayjKWeDzdKZOEt/to9Rf6By60Or3UBn8ZbskBfAZBrr4a7H8hj
         VmroWNhhPYw9QrE5FDQBiLiJfS0ywHTrKoB7OBdc=
Date:   Wed, 7 Apr 2021 17:24:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: serial: io_edgeport: drop unused definitions
Message-ID: <YG3OmhCxtDGI/KmP@kroah.com>
References: <20210407104629.1212-1-johan@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210407104629.1212-1-johan@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 07, 2021 at 12:46:29PM +0200, Johan Hovold wrote:
> Drop unused definitions relating to a never mainlined custom
> proc-interface and some likewise unused string descriptor definitions.

Oh wow that's some old code.  Sorry for leaving that in there, my fault
:(

Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
