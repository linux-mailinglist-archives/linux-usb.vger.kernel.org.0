Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E8A31DEC12
	for <lists+linux-usb@lfdr.de>; Fri, 22 May 2020 17:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730506AbgEVPhE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 May 2020 11:37:04 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:40048 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgEVPhE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 May 2020 11:37:04 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04MFb17h091540;
        Fri, 22 May 2020 10:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590161821;
        bh=yZzcpQwJL/kh1WK69miiw7rFXitsdEt1ijc+Xzxc+2Q=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=a7VNhw3l97Sh/H4i7bgkN/gUVhP82EwGtmf6Su+BFgMvvogdrtjUxd+fteI/X6GPq
         BUssnJ75DPIlBWeA9+irVDDHoyvyd9yldGoYtKdobhImeiNx+AkSqN+cM0droATrQP
         VRTAc1tl55TDRoeB7CfNAYxiNYAH+l+NK0imwDMA=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04MFb157023220
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 22 May 2020 10:37:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 22
 May 2020 10:37:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 22 May 2020 10:37:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04MFb1ke012457;
        Fri, 22 May 2020 10:37:01 -0500
Date:   Fri, 22 May 2020 10:37:01 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
CC:     <kjlu@umn.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] [v3] usb: musb: Fix runtime PM imbalance on error
Message-ID: <20200522153701.GD25575@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Dinghao Liu <dinghao.liu@zju.edu.cn>, kjlu@umn.edu,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200522054235.7944-1-dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200522054235.7944-1-dinghao.liu@zju.edu.cn>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 22, 2020 at 01:42:35PM +0800, Dinghao Liu wrote:
> When copy_from_user() returns an error code, there
> is a runtime PM usage counter imbalance.
> 
> Fix this by moving copy_from_user() to the beginning
> of this function.
> 
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
> ---
> 
> Changelog:
> 
> v2: - Move copy_from_user() to the beginning rather
>       than adding pm_runtime_put_autosuspend().
> 
> v3: - Add missing changelog information.

Queued for v5.8. Thanks.
-Bin.

