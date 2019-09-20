Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B63CB8BB7
	for <lists+linux-usb@lfdr.de>; Fri, 20 Sep 2019 09:44:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404830AbfITHom (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Sep 2019 03:44:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:34332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2393041AbfITHom (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 20 Sep 2019 03:44:42 -0400
Received: from localhost (unknown [89.205.140.247])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9BBB3207FC;
        Fri, 20 Sep 2019 07:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1568965480;
        bh=awK4sAwt/JjMC+qdomldJWdCvOM2PA4r6OZQgPo1DqI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=U/cwmxekngFhaPZNkQ6wywr8rCKTv14qhZZw2n8Qq+84hQg8BoMIDKI1vpRDZ7dYw
         D/lAA+MU1rN8F/H9LFkAZcROApnH7HXSJcMewlGNDb9ySj785OjbSnjnUTv3yb0jBi
         e4CC98bkjexwau4+2sY+Wh1OuzV2+rHpGzsAvcz0=
Date:   Fri, 20 Sep 2019 09:44:36 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Andrea Vai <andrea.vai@unipv.it>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Johannes Thumshirn <jthumshirn@suse.de>,
        Jens Axboe <axboe@kernel.dk>,
        USB list <linux-usb@vger.kernel.org>,
        SCSI development list <linux-scsi@vger.kernel.org>,
        Himanshu Madhani <himanshu.madhani@cavium.com>,
        Hannes Reinecke <hare@suse.com>,
        Ming Lei <ming.lei@redhat.com>, Omar Sandoval <osandov@fb.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: Slow I/O on USB media after commit
 f664a3cc17b7d0a2bc3b3ab96181e1029b0ec0e6
Message-ID: <20190920074436.GA518462@kroah.com>
References: <Pine.LNX.4.44L0.1909191353400.1962-100000@iolanthe.rowland.org>
 <3d9bf0023e01e6b29c85c2099b7466e94d06a090.camel@unipv.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d9bf0023e01e6b29c85c2099b7466e94d06a090.camel@unipv.it>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 20, 2019 at 09:25:17AM +0200, Andrea Vai wrote:
> Il giorno gio, 19/09/2019 alle 13.54 -0400, Alan Stern ha scritto:
> > 
> > In general, USB flash drives should not be expected to work as well
> > as 
> > an actual disk drive connected over USB.
> 
> Ok, so I think I'll buy some different hardware. Would an SSD drive
> (connected over USB) behave like a flash drive or like an "actual disk
> drive" from this point of view?

It all depends on the drive.  Some are a lot better than others, and
it's almost impossible to tell until you buy the thing and try it out :(
