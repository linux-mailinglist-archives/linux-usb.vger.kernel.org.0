Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7F1373FA5B
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jun 2023 12:41:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230311AbjF0Kli (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jun 2023 06:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229647AbjF0KlZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 27 Jun 2023 06:41:25 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F421213F
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 03:41:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A55FD61085
        for <linux-usb@vger.kernel.org>; Tue, 27 Jun 2023 10:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95AFBC433C9;
        Tue, 27 Jun 2023 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687862481;
        bh=k5xQdvjsJ0izdwPgH+y/l829ughDCvqDO1IQjIlbOvI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SSSp3+0GNktzSNzqAVXJzmA2c8XglBCmaolyONPFFn4k/0nOEHak9hDQj21AU5j35
         xPvsCiygGbGTWoN8wSlrDTBVJdGRIKrdIDtiASNrSgGO7HqTD6pyB0l0hnX98fO1V8
         B1BYJfMJcwDNjAO+8fwAEF3zfRQGyaW6poz36NCE2xBz1Pbzhw8ZMmlKLFgBN8HoAV
         J0xXg5vATRJ/cOkmlm2VftdWlslqXqWIejHXplF1fwhRTyj+1v/9dl+/PpoBFInxn0
         /MMAMUh9x6IiXZd3/99fGsclgbJX/I0/Qau1pCO/6cgJDBBb3WnV6VtFGWbeRnXEGo
         zeTv+vUnPx63Q==
Message-ID: <b0314296-0df7-efcd-b0cf-166cb09ab338@kernel.org>
Date:   Tue, 27 Jun 2023 16:11:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: usb: cdns3: Onchip memory reservation for built-in gadgets
Content-Language: en-US
To:     Ravi Gunasekaran <r-gunasekaran@ti.com>, Frank.Li@nxp.com
Cc:     linux-usb@vger.kernel.org, peter.chen@kernel.org,
        pawell@cadence.com
References: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <aa5837a9-8dd6-f10f-fd58-ec43e027ef07@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 27/06/2023 15:56, Ravi Gunasekaran wrote:
> Hi,
> 
> Firstly, I'm not sure if it is alright to post queries this way. 
> If it is wrong, I apologize for it. Please let me know the right path/forum to ask the questions.
> 
> This is regarding the commit
> dce49449e04f usb: cdns3: allocate TX FIFO size according to composite EP number
> 
> This commit introduced cdns3_gadget_check_config() which is invoked while binding gadget created via configfs and
> also a logic to calculate ep_buf_size (which was CDNS3_EP_BUF_SIZE = 4).
> 
> But for gadgets such as g_ether, g_cdc, the checks are not performed. And also for these legacy gadget drivers,
> memory needs to be reserved for multiple IN end points and shared memory for OUT end points. So when ep_buf_size = 15,
> the memory reservation fails, as it exceeds total onchip memory.
> 
> So I was wondering if additional checks need to done in the cadence gadget driver or am I doing something wrong while
> loading gadgets such as g_ether. 
> 

I think Ravi's concern is that.

prior to commit dce49449e04f, priv_dev->ep_buf_size was fixed at 4.
After commit dce49449e04f, it is at 0 if check_config() is not called e.g.
in the legacy gadget cases (e.g. g_ether).
So cdns3_ep_config() fails with dev_err(priv_dev->dev, "onchip mem is full, ep is invalid\n").

A potential fix might be to start with priv_dev->ep_buf_size = 4
instead of 0 so it works for legacy gadgets as well where check_config() is not invoked.

-- 
cheers,
-roger
