Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D525BE8652
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2019 12:08:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732060AbfJ2LIa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 29 Oct 2019 07:08:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:51856 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728370AbfJ2LIa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 29 Oct 2019 07:08:30 -0400
Received: from [172.20.52.151] (unknown [91.217.168.176])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 755A920874;
        Tue, 29 Oct 2019 11:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1572347308;
        bh=2XPeSQrgKYbg9jIXdV8wF43Dck1ti9xTT7Hwb1CUYHw=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SEHzfGucReCNYw1N7/y/rIK11ODdZCHSjaCIIifUi6FoKsvTUQ0lwsUnONPMm44Zf
         87wvPY9NDg6yqYaJso16BfkFUQRGH7kVbrOuyhYX5kx7xe0B/qzDSa1YQLHuBWRFWc
         A19rp5vo9Zq1O4VcPjeaptOdj0pB0J6M8YAAKmVE=
Subject: Re: drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error:
 uninitialized symbol 'nents'.
To:     Suwan Kim <suwan.kim027@gmail.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>, kbuild@lists.01.org,
        kbuild-all@lists.01.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, shuah <shuah@kernel.org>
References: <20191022092839.GD10833@kadam>
 <20191023071120.GA3061@localhost.localdomain> <20191024194500.GD23523@kadam>
 <ce76c90b-3431-9342-8b75-882d582c6366@kernel.org>
 <20191026034010.GA6411@localhost.localdomain>
From:   shuah <shuah@kernel.org>
Message-ID: <fb62566f-632c-d0cd-e06c-5162c753a03f@kernel.org>
Date:   Tue, 29 Oct 2019 05:07:58 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191026034010.GA6411@localhost.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/25/19 9:40 PM, Suwan Kim wrote:
> On Thu, Oct 24, 2019 at 04:52:52PM -0600, shuah wrote:
>> On 10/24/19 1:45 PM, Dan Carpenter wrote:
>>> On Wed, Oct 23, 2019 at 04:11:20PM +0900, Suwan Kim wrote:
>>>> On Tue, Oct 22, 2019 at 12:28:39PM +0300, Dan Carpenter wrote:
>>>>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>>>>> head:   7d194c2100ad2a6dded545887d02754948ca5241
>>>>> commit: ea44d190764b4422af4d1c29eaeb9e69e353b406 usbip: Implement SG support to vhci-hcd and stub driver
>>>>> date:   7 weeks ago
>>>>>
>>>>> If you fix the issue, kindly add following tag
>>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>>>>
>>>>> New smatch warnings:
>>>>> drivers/usb/usbip/stub_rx.c:505 stub_recv_cmd_submit() error: uninitialized symbol 'nents'.
>>>>>
>>>>> Old smatch warnings:
>>>>> drivers/usb/usbip/stub_rx.c:450 stub_recv_xbuff() error: uninitialized symbol 'ret'.
>>>>>
>>>>> # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ea44d190764b4422af4d1c29eaeb9e69e353b406
>>>>> git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
>>>>> git remote update linus
>>>>> git checkout ea44d190764b4422af4d1c29eaeb9e69e353b406
>>>>> vim +/nents +505 drivers/usb/usbip/stub_rx.c
>>>>>
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  453  static void stub_recv_cmd_submit(struct stub_device *sdev,
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  454  				 struct usbip_header *pdu)
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  455  {
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  456  	struct stub_priv *priv;
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  457  	struct usbip_device *ud = &sdev->ud;
>>>>> 2d8f4595d1f275 drivers/staging/usbip/stub_rx.c Max Vozeler        2011-01-12  458  	struct usb_device *udev = sdev->udev;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  459  	struct scatterlist *sgl = NULL, *sg;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  460  	void *buffer = NULL;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  461  	unsigned long long buf_len;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  462  	int nents;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  463  	int num_urbs = 1;
>>>>> c6688ef9f29762 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  464  	int pipe = get_pipe(sdev, pdu);
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  465  	int use_sg = pdu->u.cmd_submit.transfer_flags & URB_DMA_MAP_SG;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  466  	int support_sg = 1;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  467  	int np = 0;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  468  	int ret, i;
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  469
>>>>> 635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  470  	if (pipe == -1)
>>>>> 635f545a7e8be7 drivers/usb/usbip/stub_rx.c     Shuah Khan         2017-12-07  471  		return;
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  472
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  473  	priv = stub_priv_alloc(sdev, pdu);
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  474  	if (!priv)
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  475  		return;
>>>>> 4d7b5c7f8ad49b drivers/staging/usbip/stub_rx.c Takahiro Hirofuchi 2008-07-09  476
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  477  	buf_len = (unsigned long long)pdu->u.cmd_submit.transfer_buffer_length;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  478
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  479  	/* allocate urb transfer buffer, if needed */
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  480  	if (buf_len) {
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  481  		if (use_sg) {
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  482  			sgl = sgl_alloc(buf_len, GFP_KERNEL, &nents);
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  483  			if (!sgl)
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  484  				goto err_malloc;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  485  		} else {
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  486  			buffer = kzalloc(buf_len, GFP_KERNEL);
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  487  			if (!buffer)
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  488  				goto err_malloc;
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  489  		}
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  490  	}
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  491
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  492  	/* Check if the server's HCD supports SG */
>>>>> ea44d190764b44 drivers/usb/usbip/stub_rx.c     Suwan Kim          2019-08-28  493  	if (use_sg && !udev->bus->sg_tablesize) {
>>>>>
>>>>> Smatch thinks "use_sg" can be true when "buf_len" is zero.  It's hard
>>>>> to tell if Smatch is right or wrong without more context...
>>>>
>>>> This is a bit strange. The meaning of "use_sg" is that client will
>>>> use scatter-gather and client's urb->num_sgs is not zero. And buffer
>>>> length should not be zero.
>>>>
>>>> usb_sg and buf_len are both client-dependent variables, so I think
>>>> if they have wrong value in the server side, the client must have
>>>> sent use_sg and buf_len with incorrect values.
>>>>
>>>> Did this error occur when compiling?
>>>
>>> Smatch is doing static analysis, yes.
>>>
>>>> If then, Did Smatch also consider vhci tx side?
>>>
>>> I'm not really sure...  I can't reproduce the warning because on my
>>> system Smatch doesn't parse usbip_recv() correctly so it ends up
>>> silencing that warning.  :/
>>>
>>
>> Hi Suwan,
>>
>> This is a problem that needs fixing. nents
>>
>>         /* allocate urb transfer buffer, if needed */
>>          if (buf_len) {
>>                  if (use_sg) {
>>                          sgl = sgl_alloc(buf_len, GFP_KERNEL, &nents);
>>
>> nents gets initialized here by sgl_alloc()
>>
>>                          if (!sgl)
>>                                  goto err_malloc;
>>                  } else {
>>                          buffer = kzalloc(buf_len, GFP_KERNEL);
>>                          if (!buffer)
>>                                  goto err_malloc;
>>                  }
>>          }
>>
>>          /* Check if the server's HCD supports SG */
>>          if (use_sg && !udev->bus->sg_tablesize) {
>>                  /*
>>                   * If the server's HCD doesn't support SG, break a single SG
>>                   * request into several URBs and map each SG list entry to
>>                   * corresponding URB buffer. The previously allocated SG
>>                   * list is stored in priv->sgl (If the server's HCD support
>> SG,
>>                   * SG list is stored only in urb->sg) and it is used as an
>>                   * indicator that the server split single SG request into
>>                   * several URBs. Later, priv->sgl is used by stub_complete()
>> and
>>                   * stub_send_ret_submit() to reassemble the divied URBs.
>>                   */
>>                  support_sg = 0;
>>                  num_urbs = nents;
>>
>> I think nents will be valid here. Is there need for this additional
>> check here? You can fold this into the previous use_sg check, right
>> after the sg_alloc() success, I would think.
> 
> Or Is it your intention to check as follows?
> I think this looks good.
> 
> 	...
> 	int nents = 0
> 
> 	...
> 
> 	/* allocate urb transfer buffer, if needed */
> 	if (buf_len) {
> 		if (use_sg) {
> 			sgl = sgl_alloc(buf_len, GFP_KERNEL, &nents);
> 			if (!sgl)
> 				goto err_malloc;

Why can't we move the
 > 	/* Check if the server's HCD supports SG */
 > 	if (use_sg && !udev->bus->sg_tablesize) {
 >

under this  check?

> 		} else {
> 			buffer = kzalloc(buf_len, GFP_KERNEL);
> 			if (!buffer)
> 				goto err_malloc;
> 		}
> 	}
> 
> 	/* Additional check here */
> 	if (use_sg && !nents) {
> 		err_message;
> 		goto err_urbs;
> 	}
> 
> 	/* Check if the server's HCD supports SG */
> 	if (use_sg && !udev->bus->sg_tablesize) {
> 

thanks,
-- Shuah
