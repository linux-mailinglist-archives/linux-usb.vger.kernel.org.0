Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D603075A7B7
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jul 2023 09:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbjGTHXv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jul 2023 03:23:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231521AbjGTHXt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Jul 2023 03:23:49 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78A712127
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 00:23:47 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 74A7D618CE
        for <linux-usb@vger.kernel.org>; Thu, 20 Jul 2023 07:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB505C433C8;
        Thu, 20 Jul 2023 07:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689837825;
        bh=HMN+rgcdS5etuYurUGEg+nOicFnZzZYIHMWwdkYF1Lg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g68vBSDw9ZmH1HFb42BmC5I+SdL3oG8yvTCcV3eZSJG/51CN8Z9TovYnjHwMiKzqo
         vJ6tT1axNhKoCldAlh/+x5fMxxpKy2mckGRjGbnGJnm/SASXUp3dNOF0srQXJ7rZmb
         gpbrzwjCueVMfhKjS0CGSSauTny3EIEV8jEchM08FFgoP+m2rcnoOOwa0ePzUkRtdS
         3tpH3FAeOe+ySKyh/8qH/FgubRasJ/tLmPLsWHYUO210WOw8933IDj6jeqY9bUa1Qo
         Uvrv+DjM5NCGSiykQodP8/kKuEdnBNSx7BjfU88oJzbi2ik2n92JimNDuQM8ycvviE
         FvqaUPvoYdZ+A==
Received: from johan by xi.lan with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qMO0u-0006Xn-37;
        Thu, 20 Jul 2023 09:23:53 +0200
Date:   Thu, 20 Jul 2023 09:23:52 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Jerry Meng <jerry-meng@foxmail.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH V2] USB: serial: option: support Quectel EM060K_128
Message-ID: <ZLjhCJLkC5ZTCifu@hovoldconsulting.com>
References: <tencent_4C0C961CD0213FB3C100615415168012BA08@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_4C0C961CD0213FB3C100615415168012BA08@qq.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 29, 2023 at 05:35:22PM +0800, Jerry Meng wrote:
> EM060K_128 is EM060K's sub-model, having the same name "Quectel EM060K-GL"
> 
> MBIM + GNSS + DIAG + NMEA + AT + QDSS + DPL

> Signed-off-by: Jerry Meng <jerry-meng@foxmail.com>
> ---
> V1 -> V2: Remove indentaions and correct spelling for commit message

Now applied, thanks.

Johan
