Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 106A67507F8
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jul 2023 14:17:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbjGLMRt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jul 2023 08:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232206AbjGLMRq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jul 2023 08:17:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD80E53
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 05:17:38 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 95BD4617B0
        for <linux-usb@vger.kernel.org>; Wed, 12 Jul 2023 12:17:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D266C433C7;
        Wed, 12 Jul 2023 12:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689164257;
        bh=9Zk4bViA6pEJCniOe66o+stMPYvZjDJQDU41hKLwngk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=lfZrrBt97YZ4IVLJgfaYq0KlDpWaorqzADgALCyoJLZbSBy3A/f+0fsUoNx2o02vG
         JALMApl5/aKp+OgHg7p5l3bBwHxmXwtFnmif3H8HVUb4Nmh11S/dTDppq42bQseBln
         nTiNDh6NOeNBBzB9VaVQmaqphF+Y8k/X6zVpQPLpVjuYp93S653XcsAmlyzUJ+QieZ
         CLRCbyGcPm1nFBQN6ctUjfP+yHXxpyg0IfQw8l8bNl095D9spHHO0UVuVXW4290bvK
         k7nU4V9kPZk2YVu7Z9jg095t+/+oY+iRFO1Q2cuHawfUEfdJ2P2/GP2pMM/1UVJrUQ
         3pXtNcDYGRt8A==
Message-ID: <8db4d37d-54a9-8892-b778-b03b88085424@kernel.org>
Date:   Wed, 12 Jul 2023 15:17:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] usb: cdns3: starfive: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Minda Chen <minda.chen@starfivetech.com>,
        Peter Chen <peter.chen@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Pawel Laszczak <pawell@cadence.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        linux-usb@vger.kernel.org, kernel@pengutronix.de
References: <20230707073653.3396988-1-u.kleine-koenig@pengutronix.de>
From:   Roger Quadros <rogerq@kernel.org>
In-Reply-To: <20230707073653.3396988-1-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 07/07/2023 10:36, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new() which already returns void. Eventually after all drivers
> are converted, .remove_new() is renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Roger Quadros <rogerq@kernel.org>

-- 
cheers,
-roger
