Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93D624116AE
	for <lists+linux-usb@lfdr.de>; Mon, 20 Sep 2021 16:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234173AbhITOSV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Sep 2021 10:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231276AbhITOSU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Sep 2021 10:18:20 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A867DC061574
        for <linux-usb@vger.kernel.org>; Mon, 20 Sep 2021 07:16:53 -0700 (PDT)
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6CB928032E;
        Mon, 20 Sep 2021 16:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1632147410;
        bh=cm9Njkl6EjRKakcvHTGBucQrgWtqpgb04eUxnHkbT/s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IH5IHi2iY5W0LXWWF289BavFeq4r3C0NPbgywMDbNmafVCDFDH5DacMflpwXsSiso
         rWhTZBQepilxjiNaSyJy33BNbYslXyus0HiTFNdh6d/UKYNFSLwPOhJv8rOTtOLIas
         dfDmYUbFrOXLGXJKIC53/BFwjvXcyHzuF9+EUmqkehlxRB5r92rwwj9YQinoimuACh
         Nt2rIwliMF7wQl1/a6gCKXYxK05uK68xBu9GArXVAfjORwtCn2x7/+om96qWWEfHw8
         TorJANXphAarS8uZOD3WFNcmNzAkcUYmCcTW7oDv0K+us6GwbrMUC5BeEZxm42e/af
         DD8iejFBqSd5w==
Subject: Re: [PATCH] usb: chipidea: ci_hdrc_imx: Also search for 'phys'
 phandle
To:     Fabio Estevam <festevam@gmail.com>
Cc:     peter.chen@kernel.org, Shawn Guo <shawnguo@kernel.org>,
        USB list <linux-usb@vger.kernel.org>,
        Heiko Thiery <heiko.thiery@gmail.com>
References: <20210920115810.4144231-1-festevam@gmail.com>
 <bc20f179-6549-c450-07b5-045c112770f3@denx.de>
 <CAOMZO5AFm7C6mwEmmCJwGb3xFJ73_tLi9V+y2YG2OUNO5dDPWw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
Message-ID: <76516c9c-23fb-31da-4e43-11e6e72482cc@denx.de>
Date:   Mon, 20 Sep 2021 16:16:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AFm7C6mwEmmCJwGb3xFJ73_tLi9V+y2YG2OUNO5dDPWw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/20/21 4:02 PM, Fabio Estevam wrote:
> Hi Marek,
> 
> On Mon, Sep 20, 2021 at 10:38 AM Marek Vasut <marex@denx.de> wrote:
> 
>> Shouldn't this really fix some older commit, since this fixes NULL
>> pointer dereference in the driver which got exposed by passing in a
>> valid DT ?
> 
> You are right. The recommendation to use 'phys' is much older and it comes
> from 9d062b9b4168 ("dt-bindings: Consolidate ChipIdea USB ci13xxx bindings").
> 
> Peter, what commit do you think is appropriate for the Fixes tag in this case?

I don't think the Fixes: should be for any dt-bindings patch, it should 
be for a patch which added the code with missing NULL pointer check into 
the CI HDRC driver.
