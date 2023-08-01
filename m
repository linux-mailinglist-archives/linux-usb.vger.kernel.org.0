Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C978476B4E1
	for <lists+linux-usb@lfdr.de>; Tue,  1 Aug 2023 14:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232492AbjHAMiv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 1 Aug 2023 08:38:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230244AbjHAMiu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 1 Aug 2023 08:38:50 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297F8A8
        for <linux-usb@vger.kernel.org>; Tue,  1 Aug 2023 05:38:50 -0700 (PDT)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: kholk11)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 5229E6607122;
        Tue,  1 Aug 2023 13:38:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1690893528;
        bh=Bk+q0IviZB4Tcjk/qAmz5SKyCcwQz4wwuUuql3kc1JI=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=PinpC2hYqWzD0ckspYNgggeWeaJ0e3COeZOxWKiTY5rJaaW+AkVhZi6okWZFBsMXv
         QqPwmWK49yRy+7iFsjdqDO+5r+Eb2T0Dqs9e9/BbnroAQX8iG90DboAb74yg/FJ2Yg
         ojOkT5+2iTslacuSxcrj+UCNF5lthkaTSe8S/22Zqkk8euJwICX+8smmy59afuXlQ1
         38N/RNctwGkm/u3MXTfy/VAaqO96EJEHBS/V1UhqXw8FAdmSCTjHgBZcqukTsbl2Sv
         CzynL2EI6t9XdDcOduLBt4AhxOBk/yIqMFE1GdZPMdk74/I1w1is16cWhMcO0Naok+
         Mw1dFNtzS77Dw==
Message-ID: <a37298af-a12f-0c49-113f-cda389d8232d@collabora.com>
Date:   Tue, 1 Aug 2023 14:38:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH -next] usb: typec: tcpci_mt6370: remove redundant
 dev_err_probe()
Content-Language: en-US
To:     Zhu Wang <wangzhu9@huawei.com>, linux@roeck-us.net,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        matthias.bgg@gmail.com, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
References: <20230801122834.89168-1-wangzhu9@huawei.com>
From:   AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230801122834.89168-1-wangzhu9@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Il 01/08/23 14:28, Zhu Wang ha scritto:
> When platform_get_irq() is called, the error message has been printed,
> so it need not to call dev_err_probe() to present error messages.
> 
> Signed-off-by: Zhu Wang <wangzhu9@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


