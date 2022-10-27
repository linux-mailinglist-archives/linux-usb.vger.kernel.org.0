Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A1D8460FA50
	for <lists+linux-usb@lfdr.de>; Thu, 27 Oct 2022 16:23:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234545AbiJ0OXF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Oct 2022 10:23:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235059AbiJ0OXE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Oct 2022 10:23:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE7EE7E810
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 07:23:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 71650B8256B
        for <linux-usb@vger.kernel.org>; Thu, 27 Oct 2022 14:23:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A52C433C1;
        Thu, 27 Oct 2022 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666880580;
        bh=qzbWJDtdj3gsN+WcG0QmV6ZCMOHB8JwmqN03Oxkt73M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SXNt7uXn5uWKXKLISybrbm1C9IJV2rvkcfi9kZmQzfA5xAaLIHWcKOvyVUFLLlytd
         H9XNkER7o+9gWt0vVDaS6S6pzXdi+LPBxkZRaMAQcRFZqoLMbHVl7t5CSIkMQ6uSuZ
         wGTqlsbgKBjXifzRYiQu/DourxyY+md17AQ2n+XCewarMKPfFZ3aOrz3TTU+7yXhUF
         03taQ0969S84ZkNWE0wQN35Ym0Dq69TUPAMB26lZ3brpeQUZS2+wRcqYn9kpQjzkzC
         CJqJGiF1Hf8nf4lWYwXmxX7Zqp6uHYINMq029ewjX5Cge2LRxGIakFgk4bmq7uLCkK
         s3HhHk17uAJBw==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1oo3mQ-0002be-SN; Thu, 27 Oct 2022 16:22:46 +0200
Date:   Thu, 27 Oct 2022 16:22:46 +0200
From:   Johan Hovold <johan@kernel.org>
To:     =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@gmx.fr>
Cc:     linux-usb@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] USB: serial: option: add Sierra Wireless EM9191
Message-ID: <Y1qUNvRkAhfLbQ0b@hovoldconsulting.com>
References: <fafbac7f1c5d85dc4e7049e72635a478a5aef67a.1665665539.git.benoit.monin@gmx.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fafbac7f1c5d85dc4e7049e72635a478a5aef67a.1665665539.git.benoit.monin@gmx.fr>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 13, 2022 at 04:26:48PM +0200, Benoît Monin wrote:
> Add support for the AT and diag ports, similar to other qualcomm SDX55
> modems. In QDL mode, the modem uses a different device ID and support
> is provided by qcserial in commit 11c52d250b34 ("USB: serial: qcserial:
> add EM9191 QDL support").
> 
> T:  Bus=08 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  3 Spd=5000 MxCh= 0
> D:  Ver= 3.20 Cls=00(>ifc ) Sub=00 Prot=00 MxPS= 9 #Cfgs=  1
> P:  Vendor=1199 ProdID=90d3 Rev=00.06
> S:  Manufacturer=Sierra Wireless, Incorporated
> S:  Product=Sierra Wireless EM9191
> S:  SerialNumber=xxxxxxxxxxxxxxxx
> C:  #Ifs= 4 Cfg#= 1 Atr=a0 MxPwr=896mA
> I:  If#=0x0 Alt= 0 #EPs= 1 Cls=02(commc) Sub=0e Prot=00 Driver=cdc_mbim
> I:  If#=0x1 Alt= 1 #EPs= 2 Cls=0a(data ) Sub=00 Prot=02 Driver=cdc_mbim
> I:  If#=0x3 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=00 Prot=00 Driver=(none)
> I:  If#=0x4 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=30 Driver=(none)
> 
> Signed-off-by: Benoît Monin <benoit.monin@gmx.fr>

Applied, thanks.

Johan
