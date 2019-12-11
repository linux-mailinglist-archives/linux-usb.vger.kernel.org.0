Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A27B511BC44
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 19:54:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728642AbfLKSyB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 13:54:01 -0500
Received: from lelv0143.ext.ti.com ([198.47.23.248]:51476 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLKSyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 13:54:01 -0500
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBIrvsa077751;
        Wed, 11 Dec 2019 12:53:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576090437;
        bh=pFJLXhedD7UULur1AwPetzImWBcRyXxzue1dmPScOnk=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=FDnYM7YTPq+Nyp2qR3oaaxtP2dAjpAY9NB1afHSC1PqFYqdTgT1XqzU01ETzbSpMV
         yGo7fKYdF8V92h7G/0U1gzEtNJoB9N5owXDJLHkAvDxOWrvg+7VfRQHxr5+uOm//lB
         GycO2bOps4D9T8JMciv4ffhJJ+8RxnNEWQxxAvtY=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBIrvrS041723;
        Wed, 11 Dec 2019 12:53:57 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 12:53:55 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 12:53:55 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBIrtgE029836;
        Wed, 11 Dec 2019 12:53:55 -0600
Date:   Wed, 11 Dec 2019 12:53:21 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <od@zcrc.me>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 4/7] usb: musb: jz4740: Drop dependency on
 NOP_USB_XCEIV
Message-ID: <20191211185321.GF16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191210171110.62141-1-paul@crapouillou.net>
 <20191210171110.62141-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191210171110.62141-4-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 06:11:07PM +0100, Paul Cercueil wrote:
> The driver does not depend directly on the NOP transceiver. It can
> compile and work just fine without it.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---

Queued for usb-next. Thanks.

-Bin.

