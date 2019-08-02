Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E5AF802EF
	for <lists+linux-usb@lfdr.de>; Sat,  3 Aug 2019 00:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390189AbfHBWon (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 18:44:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:47084 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732417AbfHBWon (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 2 Aug 2019 18:44:43 -0400
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net [24.9.64.241])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8C66E20449;
        Fri,  2 Aug 2019 22:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564785882;
        bh=XdFJVPWRCzB05b6HmXd10/7qO5reXFQcj8PyEcSf0Kw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=roqsN+cmILPGhhKaCVBDczl8po2NfZxI158HyxGLNRCqF6MZ3H6lEUaxS37AphYhy
         z1p7tOaWPHynMKkSb+c4KwKYgQuFbWhtwNxTzvpgftBqyhz/UblDJ9HdrwkcIQ+Vm8
         X770HwEFLU/qEtfZ0rqIckFvz1CbmP5YM8Fsn48o=
Subject: Re: [PATCH v3 0/2] usbip: Implement SG support
To:     Suwan Kim <suwan.kim027@gmail.com>, valentina.manea.m@gmail.com,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu
Cc:     linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        shuah <shuah@kernel.org>
References: <20190802173651.22247-1-suwan.kim027@gmail.com>
From:   shuah <shuah@kernel.org>
Message-ID: <1b350c7c-823a-21a8-fc2f-d12dd4b4818d@kernel.org>
Date:   Fri, 2 Aug 2019 16:44:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802173651.22247-1-suwan.kim027@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Suwan,

On 8/2/19 11:36 AM, Suwan Kim wrote:
> There are bugs on vhci with usb 3.0 storage device. Currently, vhci
> doesn't supported SG, so USB storage driver on vhci breaks SG list
> into multiple URBs and it causes error that a transfer got terminated
> too early because the transfer length for one of the URBs was not
> divisible by the maxpacket size.
>   
> In this patch, vhci supports SG regardless of whether the server's
> host controller supports SG or not, because stub driver splits SG
> list into several URBs if the server's host controller doesn't
> support SG.
>   
> To support SG, vhci_map_urb_for_dma() sets URB_DMA_MAP_SG flag in
> urb->transfer_flags if URB has SG list and this flag will tell stub
> driver to use SG list.
>   
> vhci sends each SG list entry to stub driver. Then, stub driver sees
> the total length of the buffer and allocates SG table and pages
> according to the total buffer length calling sgl_alloc(). After stub
> driver receives completed URB, it again sends each SG list entry to
> vhci.
>   
> If the server's host controller doesn't support SG, stub driver
> breaks a single SG request into several URBs and submits them to
> the server's host controller. When all the split URBs are completed,
> stub driver reassembles the URBs into a single return command and
> sends it to vhci.
> 
> Alan fixed vhci bug with the USB 3.0 storage device by modifying
> USB storage driver.
> ("usb-storage: Set virt_boundary_mask to avoid SG overflows")
> But the fundamental solution of it is to add SG support to vhci.
> 
> This patch works well with the USB 3.0 storage devices without Alan's
> patch, and we can revert Alan's patch if it causes some troubles.
> 

Why just 3.0? Please test with lowspeed and VUDC to make sure there are
no regressions.

thanks,
-- Shuah
