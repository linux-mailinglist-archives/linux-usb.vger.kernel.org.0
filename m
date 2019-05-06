Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09542148B3
	for <lists+linux-usb@lfdr.de>; Mon,  6 May 2019 13:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbfEFLNB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 May 2019 07:13:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:47428 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfEFLNB (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 6 May 2019 07:13:01 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0E83820830;
        Mon,  6 May 2019 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557141180;
        bh=HpAQERqnh17wmum/XwnKZLxADBCfCB/JY4llLeiGBWI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EVTtj8Qb+m0wRIKuQWZxjtkTq3O0XbS1V1rdXwnNAEfVDvDh5Fe9dyicDfY6/C09k
         /imwfp1OYDyeGReyBDbMZl+1pnzf1JcbTMjsqkPJ9neCBKcy+9P0IQiBkH80QlA9af
         WEPJFjzA7gnzipT1zsjsZW8Un+QUsxOPMhDrDOtM=
Date:   Mon, 6 May 2019 13:12:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mantas =?utf-8?Q?Mikul=C4=97nas?= <grawity@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 05/34] lsusb.py: remove -w (warn if usb.ids not sorted)
 option
Message-ID: <20190506111257.GA20756@kroah.com>
References: <20190506090241.169665-1-grawity@gmail.com>
 <20190506090241.169665-6-grawity@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190506090241.169665-6-grawity@gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 06, 2019 at 12:02:12PM +0300, Mantas Mikulėnas wrote:
> Signed-off-by: Mantas Mikulėnas <grawity@gmail.com>
> ---
>  lsusb.py.in | 45 ++-------------------------------------------
>  1 file changed, 2 insertions(+), 43 deletions(-)

Why remove this?  What's wrong with this option for people who want to
work on usb.ids?

thanks,

greg k-h
