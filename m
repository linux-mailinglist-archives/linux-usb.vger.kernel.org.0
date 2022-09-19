Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 777205BCD31
	for <lists+linux-usb@lfdr.de>; Mon, 19 Sep 2022 15:29:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229782AbiISN3f (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Sep 2022 09:29:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbiISN3e (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Sep 2022 09:29:34 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E74F562D9
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 06:29:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 97270B81BDA
        for <linux-usb@vger.kernel.org>; Mon, 19 Sep 2022 13:29:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8E2C433D6;
        Mon, 19 Sep 2022 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663594171;
        bh=lnW4/UF/39NaRDAt1go1GRpAjNwMdCNszzzlMdkeeXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FhMROE6V2UoOpl0PlqyPnRna71ioNNYmAR9qwJfWyQ8fZzLtHiAM+LDzMor+4MX3P
         r3sAb+DjBJ64fj1FkUi2QMMYp2Vbgr4Qju9pMkKuvlsv+bgmx9gGNoPVwGvc2cB3AS
         AMsHmbFXUswHIDo3SAFy/2wpTz+0Qv3MOo8Ke5CCKLzqpbTDLmifH3XuhmUX5hNIvc
         E84lehDLfnIsN+j1bd26a20AGAf5tRP3+0vYtPDlzswzix1NE60EsAZzopfjyyawcm
         J2AIyiR+pdItHjKWp8ps6/+LLEEc0ktmL0j6CrQrD/7N+whRAcDNU7U2+b+QyQVXoc
         zWsV3FENOAR1w==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oaGq8-0005VA-6l; Mon, 19 Sep 2022 15:29:36 +0200
Date:   Mon, 19 Sep 2022 15:29:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Liang He <windhl@126.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: console: Move mutex_unlock() before
 usb_serial_put()
Message-ID: <YyhuwODckx+y44A2@hovoldconsulting.com>
References: <20220919104824.4104898-1-windhl@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919104824.4104898-1-windhl@126.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 19, 2022 at 06:48:24PM +0800, Liang He wrote:
> While in current version there is no use-after-free as USB serial
> core holds another reference when the console is registered, we
> should better unlock before dropping the reference in
> usb_console_setup().
> 
> Fixes: 7bd032dc2793 ("USB serial: update the console driver")
> Signed-off-by: Liang He <windhl@126.com>

Applied, thanks.

Johan
