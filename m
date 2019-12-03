Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84378110319
	for <lists+linux-usb@lfdr.de>; Tue,  3 Dec 2019 18:01:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbfLCRBl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Dec 2019 12:01:41 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:40714 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726074AbfLCRBl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Dec 2019 12:01:41 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CE9074879E;
        Tue,  3 Dec 2019 17:55:24 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -1.9
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id dSolNp1q9L3i; Tue,  3 Dec 2019 17:55:24 +0100 (CET)
Received: from localhost (h-41-252.A163.priv.bahnhof.se [46.59.41.252])
        (Authenticated sender: mb547485)
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 3A5E64879C;
        Tue,  3 Dec 2019 17:55:24 +0100 (CET)
Date:   Tue, 3 Dec 2019 17:55:23 +0100
From:   Fredrik Noring <noring@nocrew.org>
To:     Johan Hovold <johan@kernel.org>
Cc:     Christoph Hellwig <hch@lst.de>, linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: Fix incorrect DMA allocations for local memory pool
 drivers
Message-ID: <20191203165523.GB4230@sx9>
References: <20191130165055.GA46622@sx9>
 <20191203081206.GD10631@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191203081206.GD10631@localhost>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

> > Fixes: 7b81cb6bddd2 ("usb: add a HCD_DMA flag instead of guestimating DMA capabilities") where local memory USB drivers
> 
> Looks like you copied a bit too much text here for the fixes tag.

Indeed, thanks for noticing!

Fredrik
