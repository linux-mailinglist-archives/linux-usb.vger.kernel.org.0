Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8762175C6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jul 2020 20:02:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728299AbgGGSC6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jul 2020 14:02:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:56078 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727777AbgGGSC6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 7 Jul 2020 14:02:58 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57ABE206E2;
        Tue,  7 Jul 2020 18:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594144977;
        bh=VI2mGh3kqn4VugkLk3WW+bGCCs4LZKigaGq8IhTIgbk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kitIQUd952N/hnmUksapoO7GxGP+O1Rq/jdeDEPhCXY40cVlXDQglP7yzMk50L1Zn
         wuf/2iSjrAF89SptlECVa9CG5NAZowBpvcbxGgYsQdQO7kEsA8G2LLtHPQnvC2kliM
         gQTrIamPplu+RD7yIV+gNLvtZh2Ghboxh5x3dARc=
Date:   Tue, 7 Jul 2020 20:02:55 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Colton Lewis <colton.w.lewis@protonmail.com>,
        gregkh@linuxfoundation.og, balbi@kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: correct kernel-doc inconsistency
Message-ID: <20200707180255.GB252415@kroah.com>
References: <20200707045207.235540-1-colton.w.lewis@protonmail.com>
 <20200707045207.235540-2-colton.w.lewis@protonmail.com>
 <36ce325b-3c64-1e7b-f56a-7c3251e8bdfe@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36ce325b-3c64-1e7b-f56a-7c3251e8bdfe@infradead.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 06, 2020 at 10:17:12PM -0700, Randy Dunlap wrote:
> On 7/6/20 9:52 PM, Colton Lewis wrote:
> > Silence documentation build warning by correcting kernel-doc comments
> > for usb_device and usb_device_driver structs.
> > 
> > ./include/linux/usb.h:713: warning: Function parameter or member 'use_generic_driver' not described in 'usb_device'
> > ./include/linux/usb.h:1253: warning: Function parameter or member 'match' not described in 'usb_device_driver'
> > ./include/linux/usb.h:1253: warning: Function parameter or member 'id_table' not described in 'usb_device_driver'
> > 
> > Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>
> 
> Hi,
> I also sent a patch for this on June 28.

Its' in linux-next, right?

thanks,

greg k-h
