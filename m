Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4621B785123
	for <lists+linux-usb@lfdr.de>; Wed, 23 Aug 2023 09:07:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233153AbjHWHHr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 23 Aug 2023 03:07:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233160AbjHWHHq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 23 Aug 2023 03:07:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EFBF128
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 00:07:44 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D33C16487D
        for <linux-usb@vger.kernel.org>; Wed, 23 Aug 2023 07:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0ADC433C7;
        Wed, 23 Aug 2023 07:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692774463;
        bh=GJDDzg3hXnGHw9lMt8nKxqYK6PPowSlth1tkW4YJ3u0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yi/QJr5CYZ+nJgi82QirHsVXZG/a55OD5LnD4ySXcwkZ3PTib+BWu0PdMqeNpyDpi
         63Itn5/2CPSxLfYgdMcG+gZQgPXINvvESPJ6QY8OJN1OV10j1sc5N6HUokURY9fdrQ
         tewe9CaAeByTq1LCZiukOlGvw9/2lC+iuwO3oK2ioXWXU43MS72opsi5RYR/+mXmWR
         v4Ldhernovy136d04CEgl/hkMedHdCRZAOwSeNNaewzyTSwlaqN60q3iYLzgMkHBHg
         oR/ze5nms2S2yTPVqb0+f6Zf+x6/oowIRb4JBxMIIj+RQOoJ/7u7Sa1ohjm3ayO3G8
         riYzPMSZd5i9Q==
Received: from johan by theta with local (Exim 4.96)
        (envelope-from <johan@kernel.org>)
        id 1qYhxr-0007HI-2M;
        Wed, 23 Aug 2023 09:07:39 +0200
Date:   Wed, 23 Aug 2023 09:07:39 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Martin Kohn <m.kohn@welotec.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH V2] USB: serial: option: add Quectel EM05G module support
 with product ID 0x030e
Message-ID: <ZOWwOwRpZuCj7nHH@hovoldconsulting.com>
References: <AM0PR04MB57646CBE67FD409F62BF0EF79701A@AM0PR04MB5764.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB57646CBE67FD409F62BF0EF79701A@AM0PR04MB5764.eurprd04.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 27, 2023 at 10:23:00PM +0000, Martin Kohn wrote:
> Add Quectel EM05G with product ID 0x030e
> Interface 4 is used for qmi.

> Patch for qmi was also send to netdev mailing list.

This doesn't really belong in the commit message (could have gone below
the --- line).
 
> Signed-off-by: Martin Kohn <m.kohn@welotec.com>
> ---
> 
> V1->V2: correct number of interfaces and reserve interface 4 for qmi.

Thanks for the update. Now applied with a more succinct summary and
amended commit message:

https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git/commit/?h=usb-next&id=873854c02364ebb991fc06f7148c14dfb5419e1b

Johan
