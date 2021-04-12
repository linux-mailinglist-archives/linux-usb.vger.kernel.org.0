Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D77F35BC33
	for <lists+linux-usb@lfdr.de>; Mon, 12 Apr 2021 10:30:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237337AbhDLIa7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 12 Apr 2021 04:30:59 -0400
Received: from mail.kernel.org ([198.145.29.99]:59860 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237019AbhDLIa6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 12 Apr 2021 04:30:58 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11FC6611AD;
        Mon, 12 Apr 2021 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1618216237;
        bh=4GKel3929+VgmWgd13Qpjj/iH8WtICMfCDLgtBw8Sr4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=y9fnte6DvoFE2HV/nGIf5XZn4t4Bn68xhwpWAEK//XfZ8GrcooyJf3BjC1Ex/CGrb
         /zZHBYSM3B+sdEckjKKRzLhIrpDcw0i+uCIkaMo47Ka+Nf+nsTFY1UHfRbHVYSFhX9
         0Ue6RclukOiFlzx8JJrGz8X5oXUVUQD7THLT0yeU=
Date:   Mon, 12 Apr 2021 10:30:35 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     yebin <yebin10@huawei.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        hulkci@huawei.com
Subject: Re: [PATCH -next v2] usbip: vudc: fix missing unlock on error in
 usbip_sockfd_store()
Message-ID: <YHQFK1IK/yoSBuVM@kroah.com>
References: <20210408112305.1022247-1-yebin10@huawei.com>
 <YHBe9m7wGqlZ2cp+@kroah.com>
 <6073EFF3.90506@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6073EFF3.90506@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 12, 2021 at 03:00:03PM +0800, yebin wrote:
> Sorry. I build kernel  image  with  follow config and  commit  base on
> linux-next:
> commit：e99d8a849517
> config:  make allmodconfig
> I can build kernel image without errors. So, what build error did you
> encounter?

Ah, I missed that this was only in my usb-linus branch, which is now in
Linus's tree, so I can take this, sorry for the noise...

greg k-h
