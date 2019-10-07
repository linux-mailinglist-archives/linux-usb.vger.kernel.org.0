Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B661CDC2A
	for <lists+linux-usb@lfdr.de>; Mon,  7 Oct 2019 09:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727269AbfJGHEW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Oct 2019 03:04:22 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59678 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727256AbfJGHEW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Oct 2019 03:04:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/3FJZV2lwnz6rkxYpKopQpJM9u7t2lfekpLEL02aXhY=; b=dvoq9i602lSTrVm7slvzBomdl
        Wq+pyG3hxDKgUNL116F06n+txyqwCiwcSGiy5rVYm8kZJXWnpMpGOcNdGHEnyceDEwI+/enx4Wi77
        z/JyWb3LeO9zYL01I1gbHtFd6UbsAzBI1SJGp0B2+4WsWBxMPxWtIVIcOWLAFlyDWfTPf/MUWKdZg
        2jqTbXqJa8jfNJ48lXU07AB2slT9vPpp5KD6l6t9XzABrNaKt6iwq5xylHSGhYe0ihaVU1n7M28+i
        RwqWieAe+hMf96Cl5/dfezLJfd+gGa5BtdrscFMEkKxMLM1oZWiCYawIeZ+lkJBdsJW+HSeU+wlqn
        3akO/CUTw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iHN49-0007o4-Vh; Mon, 07 Oct 2019 07:04:21 +0000
Date:   Mon, 7 Oct 2019 00:04:21 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Chris Clayton <chris2553@googlemail.com>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-usb@vger.kernel.org,
        Linux SCSI Mailinglist <linux-scsi@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>
Subject: Re: depmod warning on 5.4-rc2
Message-ID: <20191007070421.GA29801@infradead.org>
References: <9047f80f-f6eb-a45d-2505-08e4ad3a92df@googlemail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9047f80f-f6eb-a45d-2505-08e4ad3a92df@googlemail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 07, 2019 at 07:07:38AM +0100, Chris Clayton wrote:
> Just built and installed  -rc2 and get the following when depmod is run.
> 
> depmod: WARNING: /lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unknown symbol usb_stor_sense_invalidCDB
> depmod: WARNING: /lib/modules/5.4.0-rc2/kernel/drivers/usb/storage/uas.ko needs unknown symbol usb_stor_adjust_quirks
> 
> .config is attached.
> 
> Please cc me on any reply, I'm not subscribed to any of the lists

Sounds like the new symbol namespacing stuff.  That being said I think
we should just duplicate those two symbols (one trivial and one rather
simple) in uas so that we don't have to drag all the usb storage history
in for people just using uas.
