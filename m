Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FCE31233F3
	for <lists+linux-usb@lfdr.de>; Tue, 17 Dec 2019 18:54:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726939AbfLQRys (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Dec 2019 12:54:48 -0500
Received: from lelv0142.ext.ti.com ([198.47.23.249]:43490 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbfLQRys (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Dec 2019 12:54:48 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBHHscIn105319;
        Tue, 17 Dec 2019 11:54:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576605278;
        bh=vyv7pT1nMKYd+tq6Ob1AQFfuQnu8TD/iNvS3iuZw51U=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=R/gx6nfV5z8KbGJgo9QjqGQN4UsG1kAAIx0ZdhUgc3WMAKFYSvMcmcvoZX9Wtqkx6
         BX2jrrZFDe3T7OPQgvWzSd/vyRxRxzseQqoz8HjVZkmMJn3jvjgZrY5pnb9mivixAl
         hgj4izF/d2EnqwA4ItL3btJn1/6HROu9rrN//xTM=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHHsciF096887;
        Tue, 17 Dec 2019 11:54:38 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 11:54:38 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 11:54:38 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBHHsce8019256;
        Tue, 17 Dec 2019 11:54:38 -0600
Date:   Tue, 17 Dec 2019 11:53:56 -0600
From:   Bin Liu <b-liu@ti.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: musb: fix __iomem in trace functions
Message-ID: <20191217175356.GD14499@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191216174807.1483538-1-ben.dooks@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191216174807.1483538-1-ben.dooks@codethink.co.uk>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 16, 2019 at 05:48:07PM +0000, Ben Dooks (Codethink) wrote:
> The trace functions should have __iomem on the addr
> pointers. Add __iomem to avoid the following warnings
> from sparse:
> 
> drivers/usb/musb/musb_core.c:253:55: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:253:55:    expected void const *addr
> drivers/usb/musb/musb_core.c:253:55:    got void const [noderef] <asn:2> *addr
> drivers/usb/musb/musb_core.c:259:56: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:259:56:    expected void const *addr
> drivers/usb/musb/musb_core.c:259:56:    got void [noderef] <asn:2> *addr
> drivers/usb/musb/musb_core.c:267:55: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:267:55:    expected void const *addr
> drivers/usb/musb/musb_core.c:267:55:    got void const [noderef] <asn:2> *addr
> drivers/usb/musb/musb_core.c:273:56: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:273:56:    expected void const *addr
> drivers/usb/musb/musb_core.c:273:56:    got void [noderef] <asn:2> *addr
> drivers/usb/musb/musb_core.c:383:55: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:383:55:    expected void const *addr
> drivers/usb/musb/musb_core.c:383:55:    got void const [noderef] <asn:2> *addr
> drivers/usb/musb/musb_core.c:390:56: warning: incorrect type in argument 2 (different address spaces)
> drivers/usb/musb/musb_core.c:390:56:    expected void const *addr
> drivers/usb/musb/musb_core.c:390:56:    got void [noderef] <asn:2> *addr
> 
> Signed-off-by: Ben Dooks (Codethink) <ben.dooks@codethink.co.uk>

Applied. Thanks.

-Bin.
