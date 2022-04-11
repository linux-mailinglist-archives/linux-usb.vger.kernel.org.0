Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25D8A4FB592
	for <lists+linux-usb@lfdr.de>; Mon, 11 Apr 2022 10:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343546AbiDKIEE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Apr 2022 04:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343530AbiDKID7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Apr 2022 04:03:59 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBD1D3DDE0
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 01:01:45 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 984A2B81120
        for <linux-usb@vger.kernel.org>; Mon, 11 Apr 2022 08:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1CEC385A3;
        Mon, 11 Apr 2022 08:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1649664103;
        bh=6AT5l3XUloveZuJCCf75j/QcnwMC888xBrZZmM1FUf4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bzra1E+aEhaPivfB//yOHnbUl3nhrw494nw9xWHakNl9UNBqAKGeElP1U1NMsW148
         k0EDimHFPmnZGBlo3cZbp+NvaEM5zHpwZbqlZrEe64vTyNjwjFbErwtOVIOW5k5sDn
         JX3HO9Z+Ty6PyCQmlkJkpnrqaGRh5wGaTqIPeSZnD+Ia0EjzIxEb5zk9vgYewJZWfK
         rRmsf0ESrADTqZKNixtdAwCcxX2MvUxgtOvLn9qziE8S68W4DT738XtmJTGpV6n/9q
         Q9lR1JcxKT2MGOil4kRZaXwNV18veNi/b334y73u+g8K1XgoHtlkwID+NvU0XSAnE2
         EBhKTABLAU1fg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1ndozQ-0001sN-CY; Mon, 11 Apr 2022 10:01:36 +0200
Date:   Mon, 11 Apr 2022 10:01:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Daniele Palmas <dnlplm@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/1] USB: serial: option: add Telit 0x1057, 0x1058,
 0x1075 compositions
Message-ID: <YlPgYAkL9DamoKf1@hovoldconsulting.com>
References: <20220406141408.580669-1-dnlplm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406141408.580669-1-dnlplm@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 06, 2022 at 04:14:08PM +0200, Daniele Palmas wrote:
> Add support for the following Telit FN980 and FN990 compositions:
> 
> 0x1057: tty, adb, rmnet, tty, tty, tty, tty, tty
> 0x1058: tty, adb, tty, tty, tty, tty, tty
> 0x1075: adb, tty
> 
> Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
> ---
> Hi Johan,
> 
> following the usb-devices output for the compositions:

Thanks, Daniele. Now applied.

Johan
