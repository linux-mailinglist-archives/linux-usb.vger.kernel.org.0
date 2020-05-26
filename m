Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA6311DD873
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 22:34:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgEUUe2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 16:34:28 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57396 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729506AbgEUUe1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 16:34:27 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LKYNk9061073;
        Thu, 21 May 2020 15:34:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590093263;
        bh=mbogiIJ51R5QdW+/MJYLWt5NYi1vk9juLL/j738tJCo=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=JTOfIrn9vJEzT/LRspFQIMrCSlPqJJnn4ru/b7uHRnVtzsSxSaxmLmhL9ttwV25Bi
         yMuW0kejsUuQhuzawDezhpBFGLEyiFwPShWFfJ0TPyVJ5/TMdrhiI5Ih60VymwLByk
         MEqU9suBWd/tk7nLCDvuC2PXV0i4vTIYv+c0orZw=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04LKYNoE057209
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 21 May 2020 15:34:23 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 15:34:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 15:34:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LKYM42068417;
        Thu, 21 May 2020 15:34:22 -0500
Date:   Thu, 21 May 2020 15:34:22 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     <od@zcrc.me>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: jz4740: Prevent lockup when CONFIG_SMP is set
Message-ID: <20200521203422.GA25575@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200520150111.76658-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200520150111.76658-1-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 20, 2020 at 05:01:11PM +0200, Paul Cercueil wrote:
> The function dma_controller_irq() locks up the exact same spinlock we
> locked before calling it, which obviously resulted in a deadlock when
> CONFIG_SMP was enabled. This flew under the radar as none of the boards
> supported by this driver needs SMP.
> 
> Fixes: 57aadb46bd63 ("usb: musb: jz4740: Add support for DMA")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Queued for v5.8. Thanks.
-Bin.
