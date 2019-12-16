Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4FE9D120F43
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2019 17:22:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfLPQWG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Dec 2019 11:22:06 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53328 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfLPQWG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Dec 2019 11:22:06 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGGLwPL003425;
        Mon, 16 Dec 2019 10:21:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1576513318;
        bh=O+BYHkMcyBXf0jD60gSDEV7hfg36asqCTGt4eDTxcIc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=D6Nb/LiFdZvAvEa60M/qlwkVaiBQ/u9sFcXqP655AqqoxUG9SJU/ww2l21BRTJqxg
         jHQ+2bco/TwrL2Vu5HWyO2mXucb/J8/G4+H8QNjJDZ7TNRqIvvY22BZdXCuOeJVdxD
         +tlxMZD6whKcvviEpOLkn8SlATa6Hz53KSSGu4/I=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGGLwa8095306
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 16 Dec 2019 10:21:58 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 10:21:56 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 10:21:56 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGGLu7C106651;
        Mon, 16 Dec 2019 10:21:56 -0600
Date:   Mon, 16 Dec 2019 10:21:16 -0600
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, <od@zcrc.me>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: Disable pullup at init
Message-ID: <20191216162116.GB14499@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191214221815.97483-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20191214221815.97483-1-paul@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Dec 14, 2019 at 11:18:15PM +0100, Paul Cercueil wrote:
> The pullup may be already enabled before the driver is initialized. This
> happens for instance on JZ4740.
> 
> It has to be disabled at init time, as we cannot guarantee that a gadget
> driver will be bound to the UDC.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Suggested-by: Bin Liu <b-liu@ti.com>

Applied. Thanks.

-Bin.
