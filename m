Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 342E411BC3C
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 19:52:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfLKSwD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 13:52:03 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:36958 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfLKSwC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 13:52:02 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBIpsJV013774;
        Wed, 11 Dec 2019 12:51:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576090314;
        bh=NGkRU2Rru73pDZ43AWGQgWsNa4Qi8VLb3sLZ4mmUd7g=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=TtlqmxBOSVEqSa2lGQNDWNaJbGnl48/Mumf4cyWORqbEuomsMZdi1/b+6XDeJ02Sa
         Izikl0KISNDE4fCP1Ngbw6jFBNzCcmsayC1T03tHIXZJUaXX4aNnGH+NP+1STLGddz
         NrzkBkb4AJyjHlY5ohc54kUvo5J+Jyyj802t8As4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBIpsq5006883
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Dec 2019 12:51:54 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 11
 Dec 2019 12:51:53 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 11 Dec 2019 12:51:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBIprqU026549;
        Wed, 11 Dec 2019 12:51:53 -0600
Date:   Wed, 11 Dec 2019 12:51:19 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <od@zcrc.me>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Artur Rojek <contact@artur-rojek.eu>
Subject: Re: [PATCH v3 1/7] usb: musb: dma: Correct parameter passed to IRQ
 handler
Message-ID: <20191211185119.GC16429@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Artur Rojek <contact@artur-rojek.eu>
References: <20191210171110.62141-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191210171110.62141-1-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 06:11:04PM +0100, Paul Cercueil wrote:
> The IRQ handler was passed a pointer to a struct dma_controller, but the
> argument was then casted to a pointer to a struct musb_dma_controller.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Tested-by: Artur Rojek <contact@artur-rojek.eu>
> ---

I added the Fixes tag, and queued for next v5.5 -rc. Thanks.

-Bin.
