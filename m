Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A7A292239
	for <lists+linux-usb@lfdr.de>; Mon, 19 Oct 2020 07:36:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726362AbgJSFgc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Oct 2020 01:36:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47228 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725306AbgJSFgb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Oct 2020 01:36:31 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id CDD4622243;
        Mon, 19 Oct 2020 05:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603085791;
        bh=S00qJ6Cet3N8oNgy2f1FdXFiBKpkYvI/GzH8gMI3hEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uSNySo9IV4VNvuGwJpD8yBIyhEX3lSYk7y7lZCXB2AOoAKi2nDBqk1stJi1cxO3KX
         cylcgNBVo/WFoqofK4eqPIii65cB1WKA/5iSyjh7iZ3RfOrllp6h6lW4jVGkXrJU4D
         1w8Q7gId2iMXQGn/emJL8D34ADXDvqrPVbLlAclc=
Date:   Mon, 19 Oct 2020 07:36:28 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     septs <job@septs.email>
Cc:     Johan Hovold <johan@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, septs <kernel@septs.pw>
Subject: Re: [PATCH 1/1] usb: serial: option: add Quectel EC200T module
 support
Message-ID: <20201019053628.GC686460@kroah.com>
References: <20201018105111.8727-1-kernel@septs.pw>
 <20201018124937.GA3133964@kroah.com>
 <e51b0a3c-43ee-4b75-b32d-65ee2d43afb6@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e51b0a3c-43ee-4b75-b32d-65ee2d43afb6@www.fastmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 19, 2020 at 01:07:10AM +0800, septs wrote:
> Add usb product id of the Quectel EC200T module.
> 
> Signed-off-by: septs <kernel@septs.pw>

Also, this address doesn't match your "From:" line, which means we can't
take it anyway.
