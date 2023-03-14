Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F06F6B8F40
	for <lists+linux-usb@lfdr.de>; Tue, 14 Mar 2023 11:08:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjCNKIh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Mar 2023 06:08:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbjCNKIg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Mar 2023 06:08:36 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D5C193EF
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 03:08:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 49ACBB8188B
        for <linux-usb@vger.kernel.org>; Tue, 14 Mar 2023 10:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F36D7C433D2;
        Tue, 14 Mar 2023 10:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678788509;
        bh=r1N8FzKanke2XkkLtiXuoKCA41q+LtgOgqFG1NxGDUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CA3004jSDUnJs5v4jSFHHfHgLJg4qhbnJl2U16rJb0N6SPac6XH9KiC+Ldg7zaz/T
         09GvCkf/LqBF0N+RrUArTTDijghoRjtAKTVdCVhOBzZKmZWvdRolgfh9Rlz1f+nTOz
         yHLe9oYG5+Bl9CkU9fKhZvoHyToVRTuYM64ST8ytg3w17Uu/T+bPqzTNGYrf/BYxBE
         1o9I27vMCj+EWgxh9LjLQhclSBq4iOa1U1BKuHg8Ra0NW+RRF4IlXiL/vOYVb6+5Ur
         yJ/RCrsyQQQjdYYoLzY+aYkkvRvPLjPykPdknbA6pDgd8PoUADfkw5TpLvOspfc2+W
         v5bFGe9n581BQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pc1b2-0002ps-Lo; Tue, 14 Mar 2023 11:09:32 +0100
Date:   Tue, 14 Mar 2023 11:09:32 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Enrico Sau <enrico.sau@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: serial: option: add Telit FE990 compositions
Message-ID: <ZBBH3GbymqzCr9oj@hovoldconsulting.com>
References: <20230314090059.77876-1-enrico.sau@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230314090059.77876-1-enrico.sau@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 14, 2023 at 10:00:59AM +0100, Enrico Sau wrote:
> Add the following Telit FE990 compositions:
> 
> 0x1080: tty, adb, rmnet, tty, tty, tty, tty
> 0x1081: tty, adb, mbim, tty, tty, tty, tty
> 0x1082: rndis, tty, adb, tty, tty, tty, tty
> 0x1083: tty, adb, ecm, tty, tty, tty, tty
> 
> Signed-off-by: Enrico Sau <enrico.sau@gmail.com>
> ---
> Changes since v1:
> - Fix NCTRL and RSVD interfaces for 0x1083 composition

Thanks for the update. Now applied.

Johan
