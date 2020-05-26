Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D02D11DD97B
	for <lists+linux-usb@lfdr.de>; Thu, 21 May 2020 23:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730689AbgEUVar (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 May 2020 17:30:47 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:53456 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730677AbgEUVar (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 May 2020 17:30:47 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04LLUhm5061459;
        Thu, 21 May 2020 16:30:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590096643;
        bh=UoE54eYV7J5fqRwqB56Uq4X9FGqdeVC4aqZ9VbcXn48=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=UWLrwBwMNOylD+PDchCenI2yF8XyOH0ZJw6EJSbx+OeVHWf/JWZV//gyyV9OIw2Y4
         NkjDZGq4WO2LcVCKjLUdIPkRP8e33LfTB4G2cUoUbOKB4fXBalURNyGftMuMTxOq1h
         OZfkE8klpjGZrvyk4UJJzFadGHIk1+yeSVsqAjV0=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LLUh4h029876;
        Thu, 21 May 2020 16:30:43 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 21
 May 2020 16:30:28 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 21 May 2020 16:30:28 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04LLUSlu077697;
        Thu, 21 May 2020 16:30:28 -0500
Date:   Thu, 21 May 2020 16:30:28 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Paul Cercueil <paul@crapouillou.net>
CC:     <od@zcrc.me>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: musb: jz4740: Prevent lockup when CONFIG_SMP is set
Message-ID: <20200521213028.GC25575@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200520150111.76658-1-paul@crapouillou.net>
 <20200521203422.GA25575@iaqt7>
 <P18PAQ.NMWTDBTHKARL1@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <P18PAQ.NMWTDBTHKARL1@crapouillou.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 21, 2020 at 10:39:25PM +0200, Paul Cercueil wrote:
> Hi Bin,
> 
> The patch it fixes was introduced in 5.7-rc1, is it possible to queue it for
> the next -rc? Otherwise I'll need to Cc it to linux-stable.

I pinged Grag if he can directly take it for -rc7.

-Bin.
