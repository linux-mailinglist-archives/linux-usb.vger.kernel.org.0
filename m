Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 519B05A7D3
	for <lists+linux-usb@lfdr.de>; Sat, 29 Jun 2019 02:12:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726702AbfF2AL4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 20:11:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:42958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726652AbfF2AL4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 28 Jun 2019 20:11:56 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BA962083B;
        Sat, 29 Jun 2019 00:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561767116;
        bh=am1jMBFVjx9jbK4hG/L3KSrebHrUKWqRVZh7/Voykxs=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=P6+y+DR4UrkcYh1E/qelgtVQEzNZWN+UKHXYidxDm2vaVATxMpimT8In75ileP3vU
         Eo+SnsdK/KvAl0rK7Bb8POqgrW7e1i4RnSmjGQCtv8RNArPoJ+51dC1d3XV3qL26NX
         zZrpxl2xCZMnsciLlKSJBL9sqYs87VG+aUTd7jcc=
Subject: Re: [PATCH 1/2] usbip: Skip DMA mapping and unmapping for urb at vhci
To:     Suwan Kim <suwan.kim027@gmail.com>, stern@rowland.harvard.edu,
        valentina.manea.m@gmail.com, gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20190621174553.28862-1-suwan.kim027@gmail.com>
 <20190621174553.28862-2-suwan.kim027@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <10a4f10a-d271-9331-b847-bdc06f9fc9cf@kernel.org>
Date:   Fri, 28 Jun 2019 18:11:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190621174553.28862-2-suwan.kim027@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Suwan,

On 6/21/19 11:45 AM, Suwan Kim wrote:
> vhci doesn’t do dma for remote device. Actually, the real dma
> operation is done by network card driver. So, vhci doesn’t use and
> need dma address of transfer buffer of urb.
> 
> When vhci supports SG, it is useful to use native SG list instead
> of mapped SG list because dma mapping fnuction can adjust the
> number of SG list that is urb->num_mapped_sgs.
> 
> But hcd provides dma mapping and unmapping function by defualt.

Typo "defualt"

> Moreover, it causes unnecessary dma mapping and unmapping which
> will be done again at the NIC driver and it wastes CPU cycles.
> So, implement map_urb_for_dma and unmap_urb_for_dma function for
> vhci in order to skip the dma mapping and unmapping procedure.
> 

How did you verify that unnecessary dma map/unmap are happening?
How many CPU cycles did you manage to reduce with this change?

thanks,
-- Shuah
