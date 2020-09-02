Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0F9225AEC2
	for <lists+linux-usb@lfdr.de>; Wed,  2 Sep 2020 17:25:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728211AbgIBPZB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Sep 2020 11:25:01 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57003 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728161AbgIBPYK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Sep 2020 11:24:10 -0400
Received: (qmail 626539 invoked by uid 1000); 2 Sep 2020 11:24:08 -0400
Date:   Wed, 2 Sep 2020 11:24:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tom Yan <tom.ty89@gmail.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        Arnd Bergmann <arnd@arndb.de>, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH] usb-storage: always set hw_max_sectors in
 slave_configure to avoid inappropriate clamping
Message-ID: <20200902152408.GD624583@rowland.harvard.edu>
References: <20200901055417.1732-1-tom.ty89@gmail.com>
 <20200901145535.GC587030@rowland.harvard.edu>
 <CAGnHSEnXyBXwdTxc-dxP_wSUdT-JuRwegtPmpXJNecOTDJR_+w@mail.gmail.com>
 <CAGnHSE=rvBhAD3svNaVPoyKMi+tOO6X1vqdECMZooPX73KzfrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGnHSE=rvBhAD3svNaVPoyKMi+tOO6X1vqdECMZooPX73KzfrQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Sep 02, 2020 at 07:44:42AM +0800, Tom Yan wrote:
> Oh I think I see your point now. If/When dma_dev is fixed / the same
> as `bus->sysdev`, it wouldn't hurt / matter if the clamping is done
> twice at different stages. max_sectors will be clamped to the same
> value no matter if it's set on the SCSI side or the USB side.
> 
> But again, fixing the dma_dev is beyond my knowledge. Probably need
> someone else to look into it.

It's straightforward.  All you have to do is convert the calls to 
scsi_add_host() in usb.c and uas.c.  Make them call 
scsi_add_host_with_dma() instead.  The extra third argument should be 
a pointer to the sysdev device.

Once you do this, presumably your second patch will become unnecessary.
Instead, maybe you can remove the clamping code in usb-storage.

Alan Stern
