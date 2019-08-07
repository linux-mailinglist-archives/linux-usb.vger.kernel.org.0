Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E673E85466
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2019 22:16:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389361AbfHGUQM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 7 Aug 2019 16:16:12 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33166 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387969AbfHGUQM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Aug 2019 16:16:12 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x77KG9Yb080819;
        Wed, 7 Aug 2019 15:16:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1565208969;
        bh=Gg3//kSYxZ3hfasGJ09OzX75vf31+tbuVhHl8sgo9LM=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=MkjcNjs3K4sFjoAq2DXmIu7gOyxrc9EAzIb/RvRJbvGnqeER5J7DPS+a3D7j1X6b9
         ThT+nJ5vC0E3KVAKpIpHF3VRLRA9Bia61YX/EFUtXJqtqyA/R+BmfvsrkOONbCTAYh
         +okTFSCKFZZytuJfqZEybd097/YJmUwDJeEU2UXY=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x77KG90h047223
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Aug 2019 15:16:09 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 7 Aug
 2019 15:16:09 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 7 Aug 2019 15:16:09 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x77KG9Ia025291;
        Wed, 7 Aug 2019 15:16:09 -0500
Date:   Wed, 7 Aug 2019 15:16:09 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>
CC:     <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: Fix a possible null-pointer dereference in
 musb_handle_intr_connect()
Message-ID: <20190807201609.GD14027@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Jia-Ju Bai <baijiaju1990@gmail.com>, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20190729090428.29508-1-baijiaju1990@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20190729090428.29508-1-baijiaju1990@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 29, 2019 at 05:04:28PM +0800, Jia-Ju Bai wrote:
> In musb_handle_intr_connect(), there is an if statement on line 783 to
> check whether musb->hcd is NULL:
>     if (musb->hcd)
> 
> When musb->hcd is NULL, it is used on line 797:
>     musb_host_poke_root_hub(musb);
>         if (musb->hcd->status_urb)
> 
> Thus, a possible null-pointer dereference may occur.
> 
> To fix this bug, musb->hcd is checked before calling
> musb_host_poke_root_hub().
> 
> This bug is found by a static analysis tool STCheck written by us.
> 
> Signed-off-by: Jia-Ju Bai <baijiaju1990@gmail.com>

Applied. Thanks.

-Bin.

