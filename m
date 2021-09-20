Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9C1E4115EC
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 15:38:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236876AbhITNkD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 09:40:03 -0400
Received: from phobos.denx.de ([85.214.62.61]:44962 "EHLO phobos.denx.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230159AbhITNkD (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Sep 2021 09:40:03 -0400
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id BED898329E;
        Mon, 20 Sep 2021 15:38:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1632145115;
        bh=uTktaiYo/SYq+an7iqw+sPuYgUrmMV04OCRS07vq15Q=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dcHY+hIDJ1vPCSveLKUbYzXJzMTy5zbapZ9wCJU61rehGcrIL7h/cHx2C2xwkA0Ys
         QhPzyCwE5Sar9qe/mHx3rQrc4XDhd9DprIufqF5QO/kIUUi3eL8JfCafvoAu9tPMpc
         6tbOGGZz1Qomd/0SK0Gcb+aO95Rcwt4+/M1LCMP1vgV24AhzFrYh4nOD+dmhwYvHLn
         t2hu92FakOIv9bmWYNx0fJx4AEJxavJYld/z3vh5EWMdm9vAwKpGDwfUA196n60NBn
         mAuCewMIguh3fcUDzTNMOdfGCoTi6n7hbBCLPKJHgpknGqVeG/Fsk+o4TITuHQA4NT
         oeQSR7hRydeNA==
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Also search for 'phys'
 phandle
To:     Fabio Estevam <festevam@gmail.com>, peter.chen@kernel.org
Cc:     shawnguo@kernel.org, linux-usb@vger.kernel.org,
        heiko.thiery@gmail.com
References: <20210920115810.4144231-1-festevam@gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <bc20f179-6549-c450-07b5-045c112770f3@denx.de>
Date:   Mon, 20 Sep 2021 15:38:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920115810.4144231-1-festevam@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/20/21 1:58 PM, Fabio Estevam wrote:
> Since commit 78e80c4b4238 ("arm64: dts: imx8m: Replace deprecated
> fsl,usbphy DT props with phys") the following NULL pointer dereference
> is observed on a Kontron i.MX8MM N801X S board:
> 
> [    1.489344] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
> [    1.498170] Mem abort info:
> [    1.500966]   ESR = 0x96000044
> [    1.504030]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.509356]   SET = 0, FnV = 0
> [    1.512416]   EA = 0, S1PTW = 0
> [    1.515569]   FSC = 0x04: level 0 translation fault
> [    1.520458] Data abort info:
> [    1.523349]   ISV = 0, ISS = 0x00000044
> [    1.527196]   CM = 0, WnR = 1
> [    1.530176] [0000000000000098] user address but active_mm is swapper
> [    1.536544] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [    1.542125] Modules linked in:
> [    1.545190] CPU: 3 PID: 7 Comm: kworker/u8:0 Not tainted 5.14.0-dirty #3
> [    1.551901] Hardware name: Kontron i.MX8MM N801X S (DT)
> [    1.557133] Workqueue: events_unbound deferred_probe_work_func
> [    1.562984] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO BTYPE=--)
> [    1.568998] pc : imx7d_charger_detection+0x3f0/0x510
> [    1.573973] lr : imx7d_charger_detection+0x22c/0x510
> 
> Fix the problem by also searching for the 'phys' phandle.
> 
> Fixes: 78e80c4b4238 ("arm64: dts: imx8m: Replace deprecated fsl,usbphy DT props with phys")

Shouldn't this really fix some older commit, since this fixes NULL 
pointer dereference in the driver which got exposed by passing in a 
valid DT ?
