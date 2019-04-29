Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C8468DF7A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 11:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbfD2JdA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 05:33:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:50476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726364AbfD2JdA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Apr 2019 05:33:00 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E4780206BF;
        Mon, 29 Apr 2019 09:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556530379;
        bh=qTxtFOQ1aMZ6vSNavzgYRjcvTxUOzqDvoYBj9hGsBHA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A+IF/tW8rXVxMSmv7bYN2o6ZJeOfMKWB87ltJZd4FkvzSydQUYUK2MSJw3hgI6E0C
         cPqdvxLZn4572w609A9TDvHm8N6AfvXaeWtAFfnuq16D/QBpdFK2yeguRlx94Y7Rjw
         R5u8N750P+B5qtDf9hdPkp5vZ79hDEzLhthrMRF8=
Date:   Mon, 29 Apr 2019 11:32:57 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     =?utf-8?B?0KDRg9C80LXQvSDQn9C10YLRgNC+0LI=?= 
        <help@roumenpetrov.info>
Cc:     linux-usb@vger.kernel.org
Subject: Re: flash fail with mediatek device
Message-ID: <20190429093257.GA24165@kroah.com>
References: <fa172514-38ed-71af-bc25-e035b8840807@roumenpetrov.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa172514-38ed-71af-bc25-e035b8840807@roumenpetrov.info>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 29, 2019 at 11:13:12AM +0300, Румен Петров wrote:
> Hello,
> 
> I would like to use  "SP Flash Tool"  to flash Android MediaTek.

That's great, but there is nothing that we can do to help out here,
please contact MediaTek about this as this is their specific userspace
tool, and you are using a specific MediaTek kernel, which only they can
support.

Good luck!

greg k-h
